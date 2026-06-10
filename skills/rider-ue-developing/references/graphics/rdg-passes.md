# RDG Render Passes & Scene View Extensions

## Render Dependency Graph (RDG / FRDGBuilder)

### What Is RDG?
RDG is UE5's "command-list on steroids." Instead of directly issuing GPU commands, you record them into a Directed Acyclic Graph. RDG then:
1. **Compiles** the graph — determines resource lifetimes and optimal barrier placement
2. **Pools resources** — reuses GPU memory across passes that don't overlap
3. **Prunes dead passes** — removes passes whose outputs are never consumed
4. **Inserts barriers** — automatically manages resource transitions (UAV → SRV, etc.)

### Core API

#### Creating Resources
```cpp
// Texture (Create2D, Create2DArray, Create3D, CreateCube, CreateCubeArray)
FRDGTextureDesc Desc = FRDGTextureDesc::Create2D(
    Extent, PF_FloatRGBA, FClearValueBinding::Black,
    TexCreate_ShaderResource | TexCreate_UAV);
FRDGTextureRef MyTexture = GraphBuilder.CreateTexture(Desc, TEXT("MyTexture"));

// Buffer (structured, byte address, indirect, vertex, upload variants)
FRDGBufferDesc BufferDesc = FRDGBufferDesc::CreateStructuredDesc(sizeof(FMyStruct), NumElements);
FRDGBufferRef MyBuffer = GraphBuilder.CreateBuffer(BufferDesc, TEXT("MyBuffer"));

// Byte address buffer
FRDGBufferRef RawBuf = GraphBuilder.CreateBuffer(
    FRDGBufferDesc::CreateByteAddressDesc(NumBytes), TEXT("RawBuf"));

// Indirect args buffer
FRDGBufferRef IndirectArgs = GraphBuilder.CreateBuffer(
    FRDGBufferDesc::CreateIndirectDesc<FRHIDispatchIndirectParameters>(1), TEXT("IndirectArgs"));

// SRV / UAV views
FRDGTextureSRVRef MySRV = GraphBuilder.CreateSRV(MyTexture);
FRDGTextureUAVRef MyUAV = GraphBuilder.CreateUAV(MyTexture);
FRDGBufferUAVRef MyBufferUAV = GraphBuilder.CreateUAV(MyBuffer);
FRDGBufferSRVRef MyBufferSRV = GraphBuilder.CreateSRV(MyBuffer);
```

#### Allocating Pass Parameters
```cpp
FMyPassParameters* PassParameters = GraphBuilder.AllocParameters<FMyPassParameters>();
PassParameters->InputTexture = InputSRV;
PassParameters->OutputTexture = OutputUAV;
PassParameters->MyScalar = 1.0f;
```

#### Adding a Raster Pass
```cpp
GraphBuilder.AddPass(
    RDG_EVENT_NAME("MyRasterPass"),
    PassParameters,
    ERDGPassFlags::Raster,
    [PassParameters, ShaderRef](FRHICommandList& RHICmdList)
    {
        // Issue draw calls using RHICmdList
        SetShaderParameters(RHICmdList, ShaderRef, ShaderRef.GetPixelShader(), *PassParameters);
        DrawFullscreenTriangle(RHICmdList);
    });
```

#### Adding a Compute Pass
```cpp
GraphBuilder.AddPass(
    RDG_EVENT_NAME("MyComputePass"),
    PassParameters,
    ERDGPassFlags::Compute,
    [PassParameters, ShaderRef](FRHIComputeCommandList& RHICmdList)
    {
        SetShaderParameters(RHICmdList, ShaderRef, ShaderRef.GetComputeShader(), *PassParameters);
        DispatchComputeShader(RHICmdList, ShaderRef,
            FMath::DivideAndRoundUp(Width, 8),
            FMath::DivideAndRoundUp(Height, 8), 1);
    });
```

#### Async Compute Pass
```cpp
GraphBuilder.AddPass(
    RDG_EVENT_NAME("MyAsyncComputePass"),
    PassParameters,
    ERDGPassFlags::AsyncCompute,  // runs on async compute pipe
    [PassParameters, ShaderRef](FRHIComputeCommandList& RHICmdList)
    {
        // May overlap with graphics passes
    });
```

#### Dispatch Pass (AddDispatchPass)
```cpp
GraphBuilder.AddDispatchPass(
    RDG_EVENT_NAME("MyDispatch"),
    PassParameters,
    ERDGPassFlags::Compute,
    [PassParameters](FRDGAsyncTask, FRHIComputeCommandList& RHICmdList)
    {
        // Async task — awaited by RDG unless run with FRDGAsyncTask
    });
```

#### External Access Mode (non-RDG integration)
```cpp
// Switch to external read-only access — can call GetRHI() directly
GraphBuilder.UseExternalAccessMode(MyTexture, ERHIAccess::SRVMask);
// ... use MyTexture->GetRHI() in passes
GraphBuilder.UseInternalAccessMode(MyTexture);  // resume RDG tracking
```

#### Extracting Results
```cpp
// Extract RDG texture to a persistent pooled texture
TRefCountPtr<IPooledRenderTarget> PooledResult;
GraphBuilder.QueueTextureExtraction(MyTexture, &PooledResult, ERHIAccess::SRVMask);

// Extract buffer
TRefCountPtr<FRDGPooledBuffer> PooledBuffer;
GraphBuilder.QueueBufferExtraction(MyBuffer, &PooledBuffer, ERHIAccess::SRVMask);

// Upload initial data to a buffer
GraphBuilder.QueueBufferUpload(MyBuffer, InitialData, DataSize);
```

### ERDGPassFlags
```cpp
ERDGPassFlags::Raster        // Graphics pipeline — rasterization
ERDGPassFlags::Compute       // Graphics pipeline — compute
ERDGPassFlags::AsyncCompute  // Async compute pipeline
ERDGPassFlags::Copy          // Copy operations
ERDGPassFlags::NeverCull     // Never cull (has untracked outputs)
ERDGPassFlags::SkipRenderPass// Skip render pass begin/end
ERDGPassFlags::NeverMerge    // Prevent render pass merging
ERDGPassFlags::Readback      // Copy | NeverCull (CPU readback)
```

### ERDGBuilderFlags
```cpp
ERDGBuilderFlags::None
ERDGBuilderFlags::ParallelSetup    // Parallelize pass setup
ERDGBuilderFlags::ParallelCompile  // Parallelize compilation
ERDGBuilderFlags::ParallelExecute  // Parallelize execution
ERDGBuilderFlags::Parallel         // All three combined
```

### CRITICAL Rules

1. **Every resource a pass reads/writes MUST be in the pass parameter struct**
   - Missing declarations = incorrect barriers, GPU crashes, or validation errors
   - Use `r.RDG.Debug 1` to catch this during development

2. **Resources are only valid inside passes that reference them**
   - Don't capture RDG resource references outside of pass lambdas
   - Don't store RDG refs as class members

3. **One pass per logical operation**
   - Don't bundle unrelated work into a single pass
   - Each pass should have a clear, descriptive name (appears in profilers)

4. **Pass names matter**
   - `RDG_EVENT_NAME("MyFeature::BlurHorizontal")` shows in GPU profiler
   - Use hierarchical naming for complex features

5. **Don't read-back to CPU in the same frame**
   - GPU→CPU readback requires a separate frame
   - Use `GraphBuilder.QueueBufferExtraction()` + callback

### Shader Parameter Macros (Full Reference)

```cpp
// RDG textures
SHADER_PARAMETER_RDG_TEXTURE(Texture2D, MyTex)
SHADER_PARAMETER_RDG_TEXTURE_SRV(Texture2D, MySRV)
SHADER_PARAMETER_RDG_TEXTURE_UAV(RWTexture2D<float4>, MyUAV)
SHADER_PARAMETER_RDG_TEXTURE_NON_PIXEL_SRV(Texture2D, MySRV)  // compute only

// RDG buffers
SHADER_PARAMETER_RDG_BUFFER_SRV(StructuredBuffer<float4>, MyBufSRV)
SHADER_PARAMETER_RDG_BUFFER_UAV(RWStructuredBuffer<float4>, MyBufUAV)

// RDG uniform buffer (must match BEGIN_GLOBAL_SHADER_PARAMETER_STRUCT)
SHADER_PARAMETER_RDG_UNIFORM_BUFFER(FSceneTextureUniformParameters, SceneTextures)

// Explicit resource access (for correct barrier tracking without shader binding)
RDG_TEXTURE_ACCESS(MyTex, ERHIAccess::UAVCompute)
RDG_BUFFER_ACCESS(MyBuf, ERHIAccess::SRVCompute)

// Render targets (in raster parameter structs)
RENDER_TARGET_BINDING_SLOTS()  // adds RenderTargets[] member
```

### Debug CVars
| CVar | Purpose |
|------|---------|
| `r.RDG.Debug 1` | Full validation (catches missing declarations, lifetime errors) |
| `r.RDG.Dump 1` | Dump graph structure to log |
| `r.RDG.ImmediateMode 1` | Execute passes immediately (bypasses scheduling — for debugging) |
| `r.RDG.OverlapUAVs` | Control UAV overlap behavior |

---

## Scene View Extensions

### What Are Scene View Extensions?
A plugin-friendly way to inject custom render passes into UE's rendering pipeline **without modifying the engine**. You inherit from `FSceneViewExtensionBase` and override callbacks at specific pipeline stages.

### Creating a Scene View Extension

```cpp
// Header
class FMyViewExtension : public FSceneViewExtensionBase
{
public:
    FMyViewExtension(const FAutoRegister& AutoRegister);

    // Called on render thread before post-processing
    virtual void PrePostProcessPass_RenderThread(
        FRDGBuilder& GraphBuilder,
        const FSceneView& View,
        const FPostProcessingInputs& Inputs) override;

    // Control when this extension is active
    virtual bool IsActiveThisFrame_Internal(
        const FSceneViewExtensionContext& Context) const override
    {
        return true; // or conditional logic
    }

    // Control execution order relative to other extensions
    virtual int32 GetPriority() const override { return -1; }

    // Other overridable callbacks:
    // SetupViewFamily() — called once per frame for the view family
    // SetupView() — called per view (for stereo/multi-view)
    // BeginRenderViewFamily() — before any rendering starts
    // PreRenderViewFamily_RenderThread() — render thread, before scene render
    // PostRenderViewFamily_RenderThread() — after scene render
    // PreRenderView_RenderThread() — before a specific view renders
    // PostRenderView_RenderThread() — after a specific view renders
    // SubscribeToPostProcessingPass() — declare which PP passes you want to hook
};
```

### Registration

```cpp
// In your module or component:
TSharedPtr<FMyViewExtension> MyExtension;

void StartupModule()
{
    MyExtension = FSceneViewExtensionBase::NewExtension<FMyViewExtension>();
}
```

The `FAutoRegister` parameter in the constructor handles automatic registration with the renderer.

### PrePostProcessPass_RenderThread Example

```cpp
void FMyViewExtension::PrePostProcessPass_RenderThread(
    FRDGBuilder& GraphBuilder,
    const FSceneView& View,
    const FPostProcessingInputs& Inputs)
{
    // Get scene color
    FScreenPassTexture SceneColor = (*Inputs.SceneTextures)->SceneColorTexture;

    // Create output texture
    FRDGTextureDesc Desc = SceneColor.Texture->Desc;
    FRDGTextureRef OutputTexture = GraphBuilder.CreateTexture(Desc, TEXT("MyEffect"));

    // Set up shader parameters
    FMyShader::FParameters* Parameters = GraphBuilder.AllocParameters<FMyShader::FParameters>();
    Parameters->InputTexture = SceneColor.Texture;
    Parameters->InputSampler = TStaticSamplerState<SF_Bilinear>::GetRHI();
    Parameters->RenderTargets[0] = FRenderTargetBinding(OutputTexture, ERenderTargetLoadAction::ENoAction);

    // Get shader
    TShaderMapRef<FMyShader> Shader(GetGlobalShaderMap(View.FeatureLevel));

    // Add pass
    GraphBuilder.AddPass(
        RDG_EVENT_NAME("MyCustomEffect"),
        Parameters,
        ERDGPassFlags::Raster,
        [Shader, Parameters, ViewRect = View.ViewRect](FRHICommandList& RHICmdList)
        {
            RHICmdList.SetViewport(ViewRect.Min.X, ViewRect.Min.Y, 0.0f,
                ViewRect.Max.X, ViewRect.Max.Y, 1.0f);
            SetShaderParameters(RHICmdList, Shader, Shader.GetPixelShader(), *Parameters);
            DrawRectangle(RHICmdList, 0, 0, ViewRect.Width(), ViewRect.Height(),
                ViewRect.Min.X, ViewRect.Min.Y, ViewRect.Width(), ViewRect.Height(),
                ViewRect.Size(), SceneColor.Texture->Desc.Extent);
        });
}
```

### Available Pipeline Hooks

Execution order during a frame:

`PreRenderViewFamily_RenderThread` → `PreRenderView_RenderThread` → *(depth prepass, base pass)* → `PostRenderBasePass_RenderThread` → *(translucency, lighting)* → `PrePostProcessPass_RenderThread` → `PostRenderView_RenderThread`

| Method | Thread | When | Use For |
|--------|--------|------|---------|
| `SetupViewFamily()` | Game | Once per frame | Feature setup, toggling |
| `SetupView()` | Game | Per view (stereo/multi-view) | Per-view parameters |
| `BeginRenderViewFamily()` | Game | Before any rendering starts | Prepare per-frame data |
| `PreRenderViewFamily_RenderThread()` | Render | Before scene render | Custom pre-passes |
| `PreRenderView_RenderThread()` | Render | Before each view | Per-view pre-work |
| `PostRenderBasePass_RenderThread()` | Render | After base pass, before lighting | Access to raw GBuffer data |
| `PrePostProcessPass_RenderThread()` | Render | After scene, before PP | **Most commonly used** — full scene textures available |
| `PostRenderView_RenderThread()` | Render | After view render | Per-view cleanup |
| `PostRenderViewFamily_RenderThread()` | Render | After everything | Overlays, debug viz |
| `SubscribeToPostProcessingPass()` | — | Registration | Insert between specific PP sub-passes (motion blur, tonemap, FXAA) |

### Real-World Examples

| Project | Usage |
|---------|-------|
| `FHMDSceneViewExtension` (SteamVR plugin) | Late-frame pose injection for VR reprojection |
| ColorCorrectRegions (engine plugin) | Per-region color grading using SVE post-process hooks |
| [SceneViewExtensionTemplate](https://github.com/A57R4L/SceneViewExtensionTemplate) | Minimal working example / starting point |
| [UE5 Custom Compute & Raster Shader](https://eyezdomain.com/blog/161n/) | Full walkthrough with RDG integration |
| [Global Shaders Without Engine Modification](https://itscai.us/blog/post/ue-view-extensions/) | Scene View Extension approach |

## Best Practices

1. **Use RDG for all new render passes** — direct RHI calls are deprecated for new code
2. **Enable `r.RDG.Debug 1` during development** — catches resource declaration errors early
3. **Use Scene View Extensions** for plugin-based rendering — no engine modification needed
4. **Prefer `PrePostProcessPass_RenderThread`** for custom post-effects — has full access to scene textures
5. **Name passes descriptively** — `"MyPlugin::EdgeDetection::BlurH"` shows in GPU profiler
6. **Don't over-allocate transient resources** — RDG pools them, but excessive unique sizes fragment the pool
