# Niagara GPU VFX

## Architecture

### Hierarchy
- **NiagaraSystem** — container for one or more emitters
- **NiagaraEmitter** — defines spawn/update logic, rendering, and lifecycle
- **NiagaraModule** — reusable behavior block (a graph of nodes)

### Simulation Modes
| Mode | Execution | Use When |
|------|-----------|----------|
| **CPU** | Game thread | Low particle count (<1000), needs collision, needs Blueprint interaction |
| **GPU Compute** | Compute shader on GPU | High particle count (10k-1M+), no CPU-side queries needed |

GPU Sim is required for:
- **Custom Simulation Stages** — repeated processing within a single frame
- **High particle counts** (100k+)
- **Grid-based simulations** (fluids, reaction-diffusion)
- **Neighbor queries** (SPH, flocking)

## Renderers

| Renderer | Description | Performance |
|----------|-------------|-------------|
| `SpriteRenderer` | Billboard quads (most common) | Cheapest |
| `RibbonRenderer` | Connected particle trails | Moderate |
| `MeshRenderer` | Arbitrary static meshes per particle | Expensive per unique mesh |
| `ComponentRenderer` | Spawns UE components per particle | Very expensive — use sparingly |
| `LightRenderer` | Dynamic lights per particle | Very expensive — cap count |

### MeshRenderer Best Practices
- Use instanced rendering (same mesh for all particles)
- Keep vertex count low per particle mesh
- Use LODs if supported
- Material complexity directly affects cost (per-particle shader evaluation)

## Data Interfaces

Data Interfaces bridge external data into Niagara's simulation.

### Built-in Data Interfaces

| Interface | Purpose | GPU Support |
|-----------|---------|-------------|
| `Grid2D` | 2D grid storage (Game of Life, reaction-diffusion) | Yes |
| `Grid3D` | 3D volumetric grid | Yes |
| `NeighborGrid3D` | Spatial hashing for particle neighbor queries (SPH fluid, flocking) | Yes |
| `RenderTarget2D` | Read/write render targets | Yes |
| `SkeletalMesh` | Sample positions/normals from skeletal meshes | Partial |
| `StaticMesh` | Sample from static meshes | Partial |
| `AudioSpectrum` | Audio-reactive particles | CPU only (known crash in UE 5.2) |
| `Curve` | Curve sampling | Yes |
| `Texture` | Texture sampling in simulation | Yes |
| `ArrayDI` | Array parameter passing | Yes |
| `VectorField` | 3D vector field sampling | Yes |

### Custom Data Interfaces (C++)

Create your own Data Interface to bridge external compute shaders, custom data sources, or hardware.

```cpp
UCLASS()
class UMyNiagaraDataInterface : public UNiagaraDataInterface
{
    GENERATED_BODY()
public:
    // Register functions available to Niagara graphs
    virtual void GetFunctions(
        TArray<FNiagaraFunctionSignature>& OutFunctions) override;

    // Bind CPU VM function implementations
    virtual void GetVMExternalFunction(
        const FVMExternalFunctionBindingInfo& BindingInfo,
        void* InstanceData,
        FVMExternalFunction& OutFunc) override;

    // Provide HLSL parameter definitions for GPU sim
    virtual bool GetFunctionHLSL(
        const FNiagaraDataInterfaceGPUParamInfo& ParamInfo,
        const FNiagaraDataInterfaceGeneratedFunction& FunctionInfo,
        int FunctionInstanceIndex,
        FString& OutHLSL) override;

    // Provide HLSL parameter declarations
    virtual void GetParameterDefinitionHLSL(
        const FNiagaraDataInterfaceGPUParamInfo& ParamInfo,
        FString& OutHLSL) override;
};
```

Reference: [UE5NiagaraComputeShaderIntegration](https://github.com/Shadertech/UE5NiagaraComputeExample) — bridging external compute shaders into Niagara.

## Simulation Stages

### What Are Simulation Stages?
Custom iteration passes within a single Niagara frame update. They allow:
- Multi-pass algorithms (Jacobi pressure solve for fluids)
- Grid operations (read grid → compute → write grid)
- Iterative refinement (constraint solving)

### Setup
1. Requires **GPU Sim** mode
2. Add Simulation Stage in Emitter properties
3. Configure **Iteration Source**: Particles, Data Interface (grid cells), or fixed count
4. Modules in the stage execute per-element

### Example: Pressure Solve
```
Stage 0: Spawn particles
Stage 1: Write particle data to Grid3D
Stage 2: Jacobi iteration (read grid → compute divergence → write pressure) × N iterations
Stage 3: Apply pressure gradient to particle velocities
Stage 4: Advect particles
```

## Performance Optimization

### General
1. **Use GPU Sim** for high particle counts (>5000)
2. **Set Fixed Bounds** when possible — avoids per-frame bounds calculation
3. **Minimize particle attributes** — each attribute costs memory per particle
4. **Use LOD/Scalability** — configure per-emitter scalability settings for quality tiers
5. **Cap particle count** — set Max Allocation Count to prevent runaway spawning

### GPU-Specific
1. **Minimize Data Interface calls** — each DI call is a GPU dispatch
2. **Batch operations** — combine reads/writes in a single module where possible
3. **Fixed thread group size** — avoid dynamic dispatch sizes
4. **Profile with GPU Visualizer** — `Ctrl+Shift+,` or `ProfileGPU`

### Memory
- Each particle attribute × max particle count = GPU buffer size
- Float3 position × 100K particles = ~1.2 MB per attribute
- Monitor with `stat Niagara` and `stat NiagaraGPU`

## Common Issues

| Issue | Cause | Fix |
|-------|-------|-----|
| **SIGSEGV crash** | Instantiating `NiagaraPythonEmitter` from Python | NEVER instantiate via Python — create in editor |
| **GPU sim not working** | Missing compute shader support | Check `r.Niagara.EnableGPUSim` is 1 |
| **Particles invisible** | Fixed bounds too small | Increase bounds or disable fixed bounds |
| **Performance cliff** | Particle count exploding | Set Max Allocation Count, check spawn rate |
| **Grid artifacts** | Grid resolution too low | Increase grid cells, check world-to-grid mapping |
| **Audio crash (5.2)** | AudioSpectrum DI bug | Avoid AudioSpectrum DI or upgrade UE version |

## UE Version Changes

### UE 5.5
- **Heterogeneous Volumes** — production-ready volumetric rendering for Niagara

### UE 5.6
- **Heterogeneous Volumes** improvements: bilateral upsampling, approximate fog in-scattering, indirect lighting within lighting cache, Beer Shadow Maps for translucent mixing
- Mesh LOD using component origin for stable calculation with dynamic bounds
- Performance mode disables "compile for edit" for accurate measurements (~40% delta between modes)

### UE 5.7
- **Shadow-casting Niagara particles** via MegaLights
- Lightweight emitter optimization: removed UNiagaraEmitter from stateless emitters on cook (~4k savings per emitter)
- Component transform usage for local space consistency

## Stat Commands

| Command | Shows |
|---------|-------|
| `stat Niagara` | Overview: active systems, particle count, CPU/GPU time |
| `stat NiagaraGPU` | GPU-specific: dispatch count, buffer sizes |
| `stat NiagaraOverview` | Per-system breakdown |
| `fx.DumpNiagaraWorldManagerDebugInfo` | Detailed system dump |

## CRITICAL — Python Automation Limits

The Niagara Python API is extremely limited. You can:
- Spawn/destroy NiagaraComponents on actors
- Set user parameter values (`set_float_parameter`, `set_vector_parameter`, `set_int_parameter`)
- Activate/deactivate systems
- Load existing NiagaraSystem assets

You CANNOT:
- Create emitters from Python
- Modify emitter modules or graphs
- Configure simulation stages
- Add/remove renderers

**NEVER instantiate `NiagaraPythonEmitter`** — it causes SIGSEGV crash. All Niagara authoring must be done in the Niagara Editor UI or via C++ UNiagaraDataInterface plugins.
