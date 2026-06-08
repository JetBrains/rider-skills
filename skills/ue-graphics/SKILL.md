---
name: ue:graphics
description: "Use when user asks about Nanite configuration, Lumen tuning, Virtual Shadow Maps, TSR/upscaling, MegaLights, custom shaders/USF/HLSL, global shaders, render passes (RDG), post-processing, Niagara GPU VFX, Substrate materials, rendering debugging, GPU profiling, shader permutations, PSO caching, graphics CVars, Scene View Extensions, or atmospheric rendering. DO NOT TRIGGER for material expression graphs (use ue:material), NPR/cel-shading materials (use ue:material), C++ unrelated to rendering (use ue:coder), general performance without GPU focus (use ue:profiler), or editor automation (use ue:editor)."
context: fork
agent: general-purpose
model: opus
allowed-tools: Read, Glob, Grep, Bash, WebSearch, WebFetch
argument-hint: "[graphics/rendering question or task]"
---

See [Reference Image Handling](../_shared/reference-image-handling.md)

## Context7 Version Check

If the query mentions a specific UE version, or involves features known to change across versions (Nanite, Lumen, Substrate, MegaLights, VSM, TSR, RDG API, shader permutations, PSO caching), fetch the relevant Context7 section before answering. See `../_shared/context7-protocol.md`.

# UE Graphics Agent — Specialized Subagent

Spawn a focused subagent for Unreal Engine graphics and rendering development — rendering pipeline configuration, shader programming, GPU performance optimization, post-processing, VFX systems, and visual quality tuning.

## Checklist

Call `TaskCreate` for each item below before starting, then mark each `in_progress` / `completed` as you go:

1. **Clarify** — rendering feature, UE version, quality target
2. **Research** — read knowledge files and Context7 for version-specific CVars/APIs
3. **Configure** — apply CVars, ini settings, or code changes
4. **Save** — save any modified material/shader assets or config files (.ini) to disk
5. **Verify** — profile GPU, screenshot comparison, check for visual artifacts
6. **Code review** — dispatch `ue:code-review` subagent (see `../_shared/post-task.md`); fix all Critical and Important issues before proceeding

## Business Description

Graphics and rendering development for Unreal Engine projects. Exists because rendering is the most technically dense subsystem in UE5 — Nanite, Lumen, VSM, TSR, Substrate, and the RDG-based rendering pipeline each have dozens of CVars, non-obvious interactions, and sharp-edge limitations that cause visual artifacts or performance cliffs. This skill encodes the tribal knowledge that separates a working scene from one with light leaks, shadow popping, shader hitches, and GPU bottlenecks. Capabilities:

- Configure and tune Nanite (virtualized geometry, foliage/voxels), Lumen (GI/reflections), Virtual Shadow Maps, TSR, and MegaLights
- Write custom shaders (HLSL/USF), global shaders, and Scene View Extensions without engine modification
- Build and debug RDG render passes (FRDGBuilder) with proper resource barriers and pass dependencies
- Set up post-processing pipelines (custom PP materials, bloom, DOF, exposure, color grading, LUTs)
- Configure Niagara GPU particle systems, simulation stages, and custom data interfaces
- Diagnose and fix rendering artifacts (Lumen light leaks, Nanite thin geometry culling, VSM popping, shader compilation hitches)
- Profile GPU performance (stat GPU, ProfileGPU, Unreal Insights, RenderDoc, NaniteStats)
- Manage shader permutations, PSO precaching, and compilation optimization
- Configure Substrate (production-ready in 5.7, layered material model replacing legacy shading models)
- Set up and tune MegaLights (Beta in 5.7, stochastic direct lighting for many shadow-casting area lights)
- Automate graphics settings via Python (CVars, scalability, validation)

## When to Delegate

- **Rendering pipeline configuration** — "how do I enable HWRT for Lumen?", "what CVars control Nanite LOD?", "how do I set up MegaLights?"
- **MegaLights setup** — enabling stochastic direct lighting, per-light shadow methods, quality/performance tuning
- **Shader development** — writing custom HLSL, USF files, global shaders, compute shaders in plugins
- **Render pass creation** — building FRDGBuilder passes, Scene View Extensions, custom post-process passes
- **Visual artifact diagnosis** — light leaking, shadow popping, flickering reflections, dark surfaces, ghosting
- **GPU performance** — draw call analysis, shader complexity, GPU profiling, memory budgets
- **Post-processing** — custom PP materials, bloom/DOF/exposure tuning, color grading, LUT setup
- **Niagara GPU VFX** — GPU simulation, mesh rendering, custom data interfaces, simulation stages
- **Substrate setup** — enabling Substrate, migrating from legacy shading models, multi-slab materials
- **PSO/shader management** — precaching, bundled caches, reducing permutation count, compilation hitches
- **Scalability configuration** — quality levels, platform-specific rendering settings, dynamic resolution
- **Lighting theory** — BRDF models, shading model selection, PBR principles, energy conservation
- **Atmospheric rendering** — Sky Atmosphere, Exponential Height Fog, volumetric fog/clouds, god rays
- **Screen-space effects** — depth buffer techniques, stencil masking, custom depth, post-process recipes (scan, blur, distortion)
- **Shader math** — coordinate spaces, vector operations, transform matrices, practical HLSL formulas

## When NOT to Delegate

- **Material expression graphs** — use **ue:material** skill (creates/wires material nodes via Python)
- **General C++ code** — use **ue:coder** skill (unless it's rendering/shader C++)
- **General performance** — use **ue:profiler** skill (unless specifically GPU/rendering focused)
- **Building/compiling** — use **ue:builder** skill
- **Editor automation** — use **ue:editor** or **ue:task** skill

## How to Spawn

Use the **Agent** tool with `subagent_type: "general-purpose"`. Include the prompt template below.

### Prompt Template

```
You are a senior Unreal Engine graphics/rendering engineer with deep expertise in UE5's rendering pipeline (Nanite, Lumen, VSM, TSR, Substrate), shader programming (HLSL/USF, RDG, global shaders), GPU profiling, and visual effects (Niagara, post-processing). Provide actionable, technically precise guidance.

**Question:** [describe the graphics/rendering question or task]

**Context:** [UE version, target platform, current rendering features enabled, hardware constraints if relevant]

**Knowledge base — read these files based on the topic:**

| Topic | File |
|-------|------|
| Rendering pipeline (frame stages, GBuffer, integrated systems) | knowledge/rendering-pipeline.md |
| Mesh drawing pipeline (custom VFs, proxies, pass processors, threading) | knowledge/mesh-drawing-pipeline.md |
| Nanite (virtualized geometry) | knowledge/nanite.md |
| Lumen (GI & reflections) | knowledge/lumen.md |
| Virtual Shadow Maps & TSR | knowledge/vsm-tsr.md |
| Shader development (HLSL/USF/Global) | knowledge/shader-development.md |
| RDG render passes & Scene View Extensions | knowledge/rdg-passes.md |
| Post-processing pipeline | knowledge/post-processing.md |
| Niagara GPU VFX | knowledge/niagara-gpu.md |
| Substrate material model | knowledge/substrate.md |
| MegaLights (stochastic direct lighting) | knowledge/megalights.md |
| GPU profiling & optimization | knowledge/gpu-profiling.md |
| Graphics CVars reference | knowledge/cvars-reference.md |
| Common issues & workarounds | knowledge/issues-workarounds.md |
| Python automation for graphics | knowledge/python-automation.md |
| Shader math foundations | knowledge/shader-math.md |
| Lighting & BRDF theory | knowledge/lighting-theory.md |
| Atmosphere, fog & volumetrics | knowledge/atmosphere-fog.md |
| Screen-space effects (depth, stencil, PP) | knowledge/screen-space-effects.md |
| Pixel art 3D rendering (palette quantization, outlines, water, downsample pipeline) | knowledge/pixel-art-3d-rendering.md |

**Instructions:**
1. Read knowledge files relevant to the question BEFORE answering
2. Include specific CVars, class names, and API references in your answer
3. Warn about known issues and workarounds related to the topic
4. Include profiling commands when performance is involved
5. Reference UE version-specific behavior where applicable

**Response format:**
1. **Answer** — Direct, actionable response with specifics
2. **Configuration** — CVars, settings, or code to apply
3. **Known Issues** — Relevant bugs, limitations, workarounds
4. **Profiling** — How to verify the change works (stat commands, tools)
5. **References** — Links to official docs or community resources
```

### Example Invocations

**Lumen tuning:**
```python
Agent(
    subagent_type="general-purpose",
    description="Fix Lumen light leaking",
    prompt="""You are a senior UE graphics engineer...

    **Question:** Lumen is leaking light through thin walls in our interior scene.
    Some rooms get bright patches from sunlight that shouldn't reach them.

    **Context:** UE 5.7, HWRT enabled, DirectX 12.
    Walls are BSP converted to static mesh, ~10cm thick.

    [include knowledge base table and instructions from template above]
    """
)
```

**Custom shader in plugin:**
```python
Agent(
    subagent_type="general-purpose",
    description="Create global shader pass",
    prompt="""You are a senior UE graphics engineer...

    **Question:** I need to add a custom full-screen post-process pass in my plugin
    that reads scene depth and outputs an edge-detection effect. How do I set this up
    without modifying the engine?

    **Context:** UE 5.7, plugin-based project, targeting PC (DX12/Vulkan).

    [include knowledge base table and instructions from template above]
    """
)
```

**Nanite performance:**
```python
Agent(
    subagent_type="general-purpose",
    description="Debug Nanite GPU budget",
    prompt="""You are a senior UE graphics engineer...

    **Question:** Our open-world scene drops to 20fps when looking at dense city areas.
    Nanite stats show high cluster count and the streaming pool is full.
    How do I diagnose and fix this?

    **Context:** UE 5.7, Nanite enabled for all static meshes, 8GB VRAM GPU,
    r.Nanite.Streaming.StreamingPoolSize=512

    [include knowledge base table and instructions from template above]
    """
)
```

## CRITICAL — Common Mistakes

### 1. Nanite Is NOT Free Geometry
- Nanite has a GPU memory budget (`StreamingPoolSize`). Exceeding it causes aggressive LOD degradation and pop-in.
- ALWAYS check `NaniteStats primary` overlay to monitor cluster counts and streaming pressure.
- Enable `r.Nanite.Visualize.Overdraw` to find meshes with excessive overdraw.

### 2. Lumen Requires Thick Geometry
- Software ray tracing uses Mesh Distance Fields (SDF). Thin walls (<10cm) produce inaccurate SDFs that leak light.
- ALWAYS use walls ≥20cm thick for Lumen scenes, or enable HWRT for thin geometry.
- Check SDFs with `r.DistanceFieldAO.Visualize 1` — look for SDF gaps at thin geometry.

### 3. VSM Depends on Nanite / WPO Is Deprecated for Nanite Wind
- VSM performs best with Nanite meshes. Non-Nanite meshes use a slower fallback rasterization path.
- World Position Offset (WPO) invalidates VSM shadow cache every frame — massive performance cost.
- **UE 5.7+**: Use Nanite Skinning with Dynamic Wind plugin instead of WPO for foliage wind animation.
- NEVER use WPO wind animation on shadow-casting Nanite foliage — use Nanite Skinning (5.7+) or accept the VSM cost.

### 4. Shader Compilation Hitches Are Preventable
- First-time PSO (Pipeline State Object) compilation stalls the render thread (visible as hitches/stutters).
- ALWAYS enable PSO Precaching in Project Settings for shipping builds.
- Record PSO caches during QA playthroughs and bundle them.

### 5. RDG Resources Must Be Declared in Pass Parameters
- Every texture/buffer a pass reads or writes MUST be referenced in the pass parameter struct.
- Missing declarations cause incorrect barriers, GPU crashes, or validation errors.
- ALWAYS use `r.RDG.Debug 1` during development to catch declaration errors.

### 6. Post-Process Materials Are Expensive
- Custom PP materials run for every pixel every frame. They bypass built-in optimizations.
- ALWAYS prefer built-in PPV settings (Bloom, DOF, etc.) over custom PP materials when possible.
- Use `Before Tonemapping` blendable location for HDR effects, `After Tonemapping` for LDR.

### 7. TSR Ghosting vs Quality Trade-off
- Higher `r.TSR.History.ScreenPercentage` (200%) dramatically improves quality but doubles memory.
- Lower `r.ScreenPercentage` saves GPU time but increases temporal artifacts.
- ALWAYS test with fast camera movement to catch ghosting artifacts early.

## Tips

- Include UE version in context — rendering behavior changes significantly between 5.4/5.5/5.6/5.7
- For artifact diagnosis, describe what you SEE (screenshots help) and the rendering features enabled
- The subagent can search the web for latest known issues and workarounds
- For shader code, specify whether you want a global shader, material custom node, or Scene View Extension
- Complex rendering tasks may require follow-up with ue:coder for C++ implementation

---

see: knowledge/pixel-art-3d-rendering.md — Two-pass downsample pipeline, CIE Lab palette quantization, depth/normal outline detection, pixel-art water/ocean shader, dithering, camera setup, RDG pass structure
see: knowledge/rendering-pipeline.md — Full frame pipeline stages, GBuffer layout, Nanite/Lumen/VSM integrated system, debug isolation CVars
see: knowledge/mesh-drawing-pipeline.md — Custom primitive components, vertex factories, mesh pass processors, game/render/RHI threading model
see: knowledge/nanite.md — Nanite architecture, CVars, limitations, streaming, UE version changes
see: knowledge/lumen.md — Lumen GI/reflections, software vs HWRT, temporal stability, artifacts
see: knowledge/vsm-tsr.md — Virtual Shadow Maps cache behavior, TSR upscaling, configuration
see: knowledge/shader-development.md — HLSL/USF, global shaders, shader permutations, Custom HLSL nodes
see: knowledge/rdg-passes.md — FRDGBuilder API, render pass creation, Scene View Extensions
see: knowledge/post-processing.md — PPV setup, custom PP materials, built-in effects, User Scene Textures
see: knowledge/niagara-gpu.md — GPU simulation, data interfaces, custom compute, renderers
see: knowledge/substrate.md — Substrate model (production-ready 5.7), slabs, operators, GBuffer format, migration
see: knowledge/megalights.md — MegaLights (Beta 5.7), stochastic direct lighting, CVars, setup, supported lights
see: knowledge/gpu-profiling.md — stat GPU, GPU Profiler 2.0 (5.6+), Unreal Insights, RenderDoc, NaniteStats
see: knowledge/cvars-reference.md — Graphics CVars organized by subsystem
see: knowledge/issues-workarounds.md — Known rendering bugs and fixes per UE version
see: knowledge/python-automation.md — Python scripting for graphics settings, validation, automation
