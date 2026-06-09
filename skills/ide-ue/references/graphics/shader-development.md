# Shader Development in Unreal Engine

## File Types

| Extension | Name | Purpose |
|-----------|------|---------|
| `.usf` | Unreal Shader File | Actual shader code (HLSL) |
| `.ush` | Unreal Shader Header | Shared definitions, includes |

Shader files live in:
- `Engine/Shaders/Private/` — engine internal shaders
- `Engine/Shaders/Public/` — public shader includes
- `YourPlugin/Shaders/Private/` — plugin-local shaders (mapped via virtual paths)

## Shader Type Hierarchy

### FGlobalShader
- No material or mesh dependency
- Compiled once (per shader platform)
- Examples: post-processing, screen-space effects, compute utilities
- **Use for**: Custom render passes, compute shaders, full-screen effects

### FMaterialShader
- Depends on material attributes (blend mode, shading model) but NOT mesh type
- Compiled per material
- Example: light function shaders

### FMeshMaterialShader
- Depends on both material AND vertex factory (mesh type)
- Compiled per material × vertex factory combination
- **This is the main source of permutation explosion**
- Examples: `TBasePassVS`/`TBasePassPS`, shadow depth shaders

## Creating a Global Shader (Plugin-Based)

### Step 1: Module Setup
The module must load before the primary game module. Use `PostConfigInit` loading phase:

```cpp
// YourPlugin.uplugin
{
    "Modules": [
        {
            "Name": "YourShaderModule",
            "Type": "Runtime",
            "LoadingPhase": "PostConfigInit"
        }
    ]
}
```

### Step 2: Map Virtual Shader Directory
In your module's `StartupModule()`:

```cpp
void FYourShaderModule::StartupModule()
{
    FString ShaderDir = FPaths::Combine(
        FPaths::ProjectPluginsDir(),
        TEXT("YourPlugin/Shaders")
    );
    AddShaderSourceDirectoryMapping(TEXT("/YourPlugin"), ShaderDir);
}
```

### Step 3: Declare Shader Class

```cpp
#include "GlobalShader.h"
#include "ShaderParameterStruct.h"

class FMyGlobalShader : public FGlobalShader
{
public:
    DECLARE_GLOBAL_SHADER(FMyGlobalShader);
    SHADER_USE_PARAMETER_STRUCT(FMyGlobalShader, FGlobalShader);

    BEGIN_SHADER_PARAMETER_STRUCT(FParameters, )
        SHADER_PARAMETER(FVector4f, MyColor)
        SHADER_PARAMETER(float, MyIntensity)
        SHADER_PARAMETER_RDG_TEXTURE(Texture2D, InputTexture)
        SHADER_PARAMETER_SAMPLER(SamplerState, InputSampler)
        RENDER_TARGET_BINDING_SLOTS()
    END_SHADER_PARAMETER_STRUCT()

    static bool ShouldCompilePermutation(const FGlobalShaderPermutationParameters& Parameters)
    {
        return IsFeatureLevelSupported(Parameters.Platform, ERHIFeatureLevel::SM5);
    }
};

// In .cpp:
IMPLEMENT_GLOBAL_SHADER(FMyGlobalShader, "/YourPlugin/Private/MyShader.usf", "MainPS", SF_Pixel);
```

### Step 4: Write the Shader (USF)

```hlsl
// YourPlugin/Shaders/Private/MyShader.usf
#include "/Engine/Public/Platform.ush"

float4 MyColor;
float MyIntensity;

Texture2D InputTexture;
SamplerState InputSampler;

void MainPS(
    float4 SvPosition : SV_POSITION,
    out float4 OutColor : SV_Target0
)
{
    float2 UV = SvPosition.xy * View.ViewSizeAndInvSize.zw;
    float4 SceneColor = InputTexture.Sample(InputSampler, UV);
    OutColor = lerp(SceneColor, MyColor, MyIntensity);
}
```

### Step 5: Hot Reload
- `Ctrl+Shift+.` executes `recompileshaders changed` in the editor
- Console: `recompileshaders all` (recompiles everything — slow)
- Console: `recompileshaders /YourPlugin/Private/MyShader.usf` (specific file)

## Shader Permutations

### What Causes Permutation Explosion
Each shader type defines dimensions (bool flags, enum values) that multiply:
- Material blend mode × shading model × vertex factory × feature flags
- A single material shader can have thousands of permutations

### Controlling Permutations

```cpp
// Prune unnecessary permutations
static bool ShouldCompilePermutation(const FMaterialShaderPermutationParameters& Parameters)
{
    // Only compile for opaque materials
    return Parameters.MaterialParameters.MaterialDomain == MD_Surface
        && Parameters.MaterialParameters.BlendMode == BLEND_Opaque;
}
```

### Permutation Dimensions
```cpp
class FMyPermutationDomain : SHADER_PERMUTATION_BOOL("USE_FEATURE_X");

// Use in shader class:
using FPermutationDomain = TShaderPermutationDomain<FMyPermutationDomain>;
```

### Reducing Permutations
1. **`ShouldCompilePermutation()`** — return false for irrelevant combinations
2. **Static Switch Parameters** in materials — compiles both paths but only one is active per instance
3. **Shared shader code** — extract common code to `.ush` includes
4. **`r.Shaders.KeepDebugInfo`** — disable in shipping (reduces compile time)

## Custom HLSL in Materials

### Custom Expression Node
Easiest path for material-local HLSL:
1. Add Custom node in Material Editor
2. Write HLSL directly
3. Define inputs and output type

### Including External Files
Reference `.ush`/`.usf` from your plugin in Custom nodes:
```hlsl
#include "/YourPlugin/Public/MyShaderLibrary.ush"
```

Requires the virtual directory mapping from Step 2.

### Limitations of Custom Nodes
- May fail in some shader permutations (masked, translucent)
- No access to full render pipeline state
- Limited to per-pixel operations
- For complex effects, prefer global shaders or Scene View Extensions

## Compute Shaders

```cpp
class FMyComputeShader : public FGlobalShader
{
public:
    DECLARE_GLOBAL_SHADER(FMyComputeShader);
    SHADER_USE_PARAMETER_STRUCT(FMyComputeShader, FGlobalShader);

    BEGIN_SHADER_PARAMETER_STRUCT(FParameters, )
        SHADER_PARAMETER_RDG_BUFFER_UAV(RWStructuredBuffer<float4>, OutputBuffer)
        SHADER_PARAMETER(uint32, NumElements)
    END_SHADER_PARAMETER_STRUCT()

    static void ModifyCompilationEnvironment(
        const FGlobalShaderPermutationParameters& Parameters,
        FShaderCompilerEnvironment& OutEnvironment)
    {
        OutEnvironment.SetDefine(TEXT("THREADGROUP_SIZE"), 64);
    }
};

IMPLEMENT_GLOBAL_SHADER(FMyComputeShader, "/YourPlugin/Private/MyCompute.usf", "MainCS", SF_Compute);
```

```hlsl
// MyCompute.usf
RWStructuredBuffer<float4> OutputBuffer;
uint NumElements;

[numthreads(THREADGROUP_SIZE, 1, 1)]
void MainCS(uint3 DispatchThreadId : SV_DispatchThreadID)
{
    uint Index = DispatchThreadId.x;
    if (Index >= NumElements) return;
    OutputBuffer[Index] = float4(1, 0, 0, 1);
}
```

## Material → HLSL Translation

Materials in the editor are compiled to HLSL through `HLSLMaterialTranslator.cpp`, which traverses the node graph and inserts generated code into `MaterialTemplate.ush` at marked insertion points. To inspect the generated HLSL:

**Material Editor → Window → Shader Code → HLSL Code**

This view shows the actual HLSL that UE generates from your material graph — essential for debugging Custom HLSL nodes or understanding what the engine produces for a given shading model.

The virtual path `#include "/Engine/Private/MaterialTemplate.ush"` is the skeleton into which all material expressions are inserted. Engine shaders use `/Engine/<path>`, plugin shaders use `/Plugin/<PluginName>/<path>`.

## Global Shader Macros (Full Reference)

```cpp
// Declare in header (module-private)
DECLARE_GLOBAL_SHADER(FMyShader);

// Declare in header (exported across modules via DLL boundary)
DECLARE_EXPORTED_GLOBAL_SHADER(FMyShader, MYMODULE_API);

// Register implementation in .cpp
IMPLEMENT_GLOBAL_SHADER(FMyShader, "/Plugin/Shaders/MyShader.usf", "MainPS", SF_Pixel);

// Use parameter struct from shader class
SHADER_USE_PARAMETER_STRUCT(FMyShader, FGlobalShader);
```

### Parameter Struct Macros (Complete)
```cpp
BEGIN_SHADER_PARAMETER_STRUCT(FMyParams, )
    // Scalars / vectors
    SHADER_PARAMETER(float, MyFloat)
    SHADER_PARAMETER(FVector4f, MyVec)
    SHADER_PARAMETER_ARRAY(float, MyArray, [4])

    // Samplers
    SHADER_PARAMETER_SAMPLER(SamplerState, MySampler)

    // RDG textures
    SHADER_PARAMETER_RDG_TEXTURE(Texture2D, InputTex)
    SHADER_PARAMETER_RDG_TEXTURE_SRV(Texture2D, InputSRV)
    SHADER_PARAMETER_RDG_TEXTURE_UAV(RWTexture2D<float4>, OutputUAV)
    SHADER_PARAMETER_RDG_TEXTURE_NON_PIXEL_SRV(Texture2D, ComputeSRV)

    // RDG buffers
    SHADER_PARAMETER_RDG_BUFFER_SRV(StructuredBuffer<float4>, BufSRV)
    SHADER_PARAMETER_RDG_BUFFER_UAV(RWStructuredBuffer<float4>, BufUAV)

    // Uniform buffer (global param struct)
    SHADER_PARAMETER_RDG_UNIFORM_BUFFER(FSceneTextureUniformParameters, SceneTextures)
    SHADER_PARAMETER_STRUCT_REF(FViewUniformShaderParameters, View)

    // Explicit resource access (barrier tracking without binding)
    RDG_TEXTURE_ACCESS(MyTex, ERHIAccess::UAVCompute)
    RDG_BUFFER_ACCESS(MyBuf, ERHIAccess::SRVCompute)

    // Render targets (raster passes only)
    RENDER_TARGET_BINDING_SLOTS()
END_SHADER_PARAMETER_STRUCT()
```

### Uniform Buffer for Shader Access
```cpp
// Define globally accessible uniform buffer
BEGIN_GLOBAL_SHADER_PARAMETER_STRUCT(FMyUniformParams, MYMODULE_API)
    SHADER_PARAMETER(float, Value1)
    SHADER_PARAMETER_RDG_TEXTURE(Texture2D, InputTexture)
END_GLOBAL_SHADER_PARAMETER_STRUCT()

// Create in RDG
TRDGUniformBufferRef<FMyUniformParams> UB = GraphBuilder.CreateUniformBuffer(&Params);
```

## Key Shader Includes

| Include | Contents |
|---------|----------|
| `/Engine/Public/Platform.ush` | Platform defines, basic types |
| `/Engine/Private/Common.ush` | Common functions, math utilities |
| `/Engine/Private/SceneTexturesCommon.ush` | Scene texture sampling |
| `/Engine/Private/PostProcessCommon.ush` | Post-process utilities |
| `/Engine/Private/DeferredShadingCommon.ush` | GBuffer access, deferred shading |
| `/Engine/Private/ScreenPass.ush` | Full-screen pass utilities |

## UE Version Changes

### UE 5.6
- **Bindless Resources** support added for DX12, Vulkan, and Metal — more flexible GPU programming
- New `ListShaders` console command for runtime shader memory analysis
- Materials can opt out of Static Mesh vertex factories reducing compilation and memory
- New cook artifact `ShaderTypeStats.csv` for granular shader/type growth tracking
- Virtual Texture cooked build removes render thread hitches by reading fallback color

### UE 5.7
- **Shader permutation control** — asset registry tags identify instances causing shader explosion
- `r.128BitBPPSCompilation.Allow` (default true) — disabling saves ~50k shaders / 15 MiB
- **Temporal Responsiveness** — experimental material output node for TSR history rejection control
- **Per-pixel motion vectors** — `Motion Vector World Offset (Per-Pixel)` material output
- `r.UseClusteredDeferredShading` marked for removal (deprecated)
- `ShaderTypeStats.csv` provides per-cook shader library analysis

## Debugging Shaders

| Tool | Purpose |
|------|---------|
| `r.ShaderDevelopmentMode 1` | Enable shader development features |
| `r.Shaders.Optimize 0` | Disable optimization (easier debugging) |
| `r.Shaders.KeepDebugInfo 1` | Keep debug symbols for RenderDoc |
| `r.DumpShaderDebugInfo 1` | Dump shader intermediates to disk |
| `ListShaders` | Runtime shader memory analysis (5.6+) |
| RenderDoc | Frame capture with shader source view |
| NVIDIA Nsight Graphics | Advanced shader profiling and debugging |
| PIX (Windows) | DirectX 12 debugging and profiling |
