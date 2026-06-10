# Mesh Drawing Pipeline & Low-Level Rendering

## Architecture Overview

The mesh drawing pipeline is **retained-mode with aggressive caching**:

```
UPrimitiveComponent (game thread)
    → FPrimitiveSceneProxy (render thread)
        → FMeshBatch (collected per view)
            → FMeshPassProcessor (per pass)
                → FMeshDrawCommand (cached, stateless)
                    → RHI commands
```

Each pass (depth, base, shadow, custom, etc.) has its own `FMeshPassProcessor` subclass that converts mesh batches into stateless, cached `FMeshDrawCommand` objects. The retained-mode approach means draw commands are built once and replayed, not rebuilt every frame.

---

## Custom Primitive Components

Every renderable object follows this pattern:

**Game thread side** — Subclass `UPrimitiveComponent`:
```cpp
class UMyPrimitiveComponent : public UPrimitiveComponent
{
    virtual FPrimitiveSceneProxy* CreateSceneProxy() override;
    virtual FBoxSphereBounds CalcBounds(const FTransform& LocalToWorld) const override;
};
```

**Render thread side** — Subclass `FPrimitiveSceneProxy`:
```cpp
class FMySceneProxy : public FPrimitiveSceneProxy
{
public:
    FMySceneProxy(UMyPrimitiveComponent* Component)
        : FPrimitiveSceneProxy(Component)
    {
        // Copy data from component on construction — after this, component is off-limits
    }

    virtual void GetDynamicMeshElements(
        const TArray<const FSceneView*>& Views,
        const FSceneViewFamily& ViewFamily,
        uint32 VisibilityMap,
        FMeshElementCollector& Collector) const override;

    virtual FPrimitiveViewRelevance GetViewRelevance(const FSceneView* View) const override;

    virtual uint32 GetMemoryFootprint() const override { return sizeof(*this) + GetAllocatedSize(); }
};
```

**Key rules for `GetDynamicMeshElements()`:**
- Called on the render thread; the proxy must NEVER modify its own state during collection
- Only read data and submit `FMeshBatch` objects into the `FMeshElementCollector`
- Check `VisibilityMap & (1 << ViewIndex)` to skip views where the primitive isn't visible

**Key rules for `GetViewRelevance()`:**
- Declare which passes the primitive participates in (static/dynamic, depth, translucency, etc.)
- Incorrect relevance flags = the primitive gets skipped or rendered in the wrong pass

---

## Custom Vertex Factories

`FVertexFactory` abstracts how vertex data maps to shader inputs. Required when your geometry has a non-standard vertex layout or data source (procedural, GPU-generated, etc.).

### Declaration

```cpp
// MyVertexFactory.h
class FMyVertexFactory : public FVertexFactory
{
    DECLARE_VERTEX_FACTORY_TYPE(FMyVertexFactory);
public:
    // ...
    static bool ShouldCompilePermutation(const FVertexFactoryShaderPermutationParameters& Parameters);
    static void ModifyCompilationEnvironment(
        const FVertexFactoryShaderPermutationParameters& Parameters,
        FShaderCompilerEnvironment& OutEnvironment);
};

// MyVertexFactory.cpp
IMPLEMENT_VERTEX_FACTORY_TYPE(
    FMyVertexFactory,
    "/YourPlugin/Private/MyVertexFactory.ush",  // Shader header
    EVertexFactoryFlags::UsedWithMaterials | EVertexFactoryFlags::SupportsDynamicLighting
);
```

### Required Shader Interface (MyVertexFactory.ush)

The `.ush` file must define:
```hlsl
struct FVertexFactoryInput { /* your vertex attributes */ };
struct FVertexFactoryInterpolantsVSToPS { /* VS → PS data */ };

FVertexFactoryIntermediates GetVertexFactoryIntermediates(FVertexFactoryInput Input);
float4 VertexFactoryGetWorldPosition(FVertexFactoryInput Input, FVertexFactoryIntermediates Intermediates);
float3x3 VertexFactoryGetTangentToLocal(FVertexFactoryInput Input, FVertexFactoryIntermediates Intermediates);
FVertexFactoryInterpolantsVSToPS VertexFactoryGetInterpolantsVSToPS(/* ... */);
// ... (several more required functions)
```

### Built-in Vertex Factories for Reference

| VF Class | Used By | Notes |
|----------|---------|-------|
| `FLocalVertexFactory` | Static Meshes | Only VF supporting cached mesh draw commands |
| `FGPUSkinVertexFactory` | Skeletal Meshes | GPU skinning |
| `FLandscapeVertexFactory` | Landscape | Heightmap-based |
| `FNiagaraMeshVertexFactory` | Niagara Mesh Renderer | GPU particle instances |

---

## Custom Mesh Pass Processors

A `FMeshPassProcessor` converts `FMeshBatch` objects into `FMeshDrawCommand` objects for a specific pass. Each built-in pass (depth, base, shadow, custom depth, etc.) has one.

### Adding a Custom Pass (Requires Engine Source)

1. Add entry to `EMeshPass::Type` enum in `MeshPassProcessor.h`
2. Register a factory function via `FRegisterPassProcessorCreateFunction`
3. Mark relevance in `FRelevancePacket::MarkRelevant()` (in `SceneVisibility.cpp`)
4. Dispatch via `View.ParallelMeshDrawCommandPasses[EMeshPass::MyCustomPass].DispatchDraw()`

### Custom Drawing WITHOUT Engine Modification

Use `DrawDynamicMeshPass()` — an immediate-mode helper that bypasses the retained-mode caching:

```cpp
DrawDynamicMeshPass(View, RHICmdList,
    [&View, &MeshBatches](FDynamicPassMeshDrawListContext* DynamicMeshPassContext)
    {
        FMyMeshPassProcessor PassProcessor(
            View.Family->Scene->GetRenderScene(), &View, DynamicMeshPassContext);

        for (const FMeshBatch& MeshBatch : MeshBatches)
        {
            const uint64 BatchElementMask = 1ull;
            PassProcessor.AddMeshBatch(MeshBatch, BatchElementMask, nullptr);
        }
    });
```

**Trade-offs of `DrawDynamicMeshPass`:**
- No caching — commands rebuilt every frame
- No parallel dispatch
- Most flexible — no engine modification needed
- Acceptable for low-frequency rendering (debug overlays, editor tools, effects triggered rarely)

---

## Threading Model

Three threads cooperate in UE's rendering system:

```
Game Thread      → Gameplay, UObject management, component updates
Render Thread    → Scene traversal, pass orchestration (FDeferredShadingSceneRenderer)
RHI Thread       → Graphics API translation (D3D12/Vulkan/Metal command recording)
```

The render thread runs **1-2 frames behind** the game thread by default.

### Communicating Game → Render Thread

Use `ENQUEUE_RENDER_COMMAND` with lambdas that **must capture by copy** — the game thread advances frames before execution:

```cpp
// On game thread:
FMyDataCopy DataCopy = MyGameThreadData; // copy, not reference!

ENQUEUE_RENDER_COMMAND(FMyRenderCommand)(
    [DataCopy](FRHICommandListImmediate& RHICmdList)
    {
        // Execute on render thread — DataCopy is safe to use
    });
```

**Never capture by reference** — the original data may be modified or destroyed before execution.

### Tracking Render Thread Progress

`FRenderCommandFence` blocks the game thread until the render thread catches up:

```cpp
FRenderCommandFence RenderFence;

// Enqueue work...
ENQUEUE_RENDER_COMMAND(FMyWork)([](FRHICommandListImmediate&) { /* ... */ });

// Wait for completion:
RenderFence.BeginFence();
RenderFence.Wait(); // Blocks game thread until render thread reaches this point
```

### Scene Proxy Lifecycle

- `CreateSceneProxy()` is called on the game thread
- The proxy is then **owned by the render thread**
- Changes to the component after proxy creation are NOT reflected until the proxy is recreated (via `MarkRenderStateDirty()`)
- This produces a **1-2 frame visibility delay** for changes — normal and expected

### Common Mistakes

| Mistake | Consequence | Fix |
|---------|------------|-----|
| Capturing render state by reference in ENQUEUE_RENDER_COMMAND | Race condition, stale data, crash | Capture by copy |
| Accessing `UPrimitiveComponent` from inside `FPrimitiveSceneProxy::GetDynamicMeshElements` | Race condition | Copy needed data at proxy construction |
| Calling `GetRHI()` on RDG resources outside a pass lambda | Undefined behavior | Only call inside pass lambdas |
| Modifying proxy state during collection | Thread safety violation | Proxies are read-only during rendering |

---

## Profiling Draw Calls

```
stat scenerendering          # Draw call counts — >2000 suggests instancing/merging needed
profilegpu                   # Per-pass breakdown
r.RDG.Dump 1                 # Dump RDG graph structure to log
```

Rule of thumb: a frame with >2,000 draw calls should use `FInstancedStaticMeshComponent` or merged meshes to reduce per-draw overhead.
