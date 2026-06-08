---
name: ue:pcg
description: "Use when the user asks to create PCG graphs, set up PCG components/volumes, build foliage scatter systems, implement biome generation, create custom PCG nodes in C++/Blueprint, configure spline-based generation, landscape-driven placement, World Partition integration, debug PCG graphs, or architect PCG-based procedural systems. DO NOT TRIGGER for placing individual actors manually (use ue:editor), material/shader work (use ue:material), C++ code unrelated to PCG (use ue:coder), building/compiling (use ue:builder), or general architecture without PCG focus (use ue:architect)."
context: fork
agent: general-purpose
model: opus
allowed-tools: Read, Glob, Grep, Bash, Write, Edit
argument-hint: "[PCG task description]"
---

See [Reference Image Handling](../_shared/reference-image-handling.md)

## Knowledge Retrieval

Before answering:
1. Resolve the `unrealengine` library in Context7 (see `../_shared/context7-protocol.md`)
2. Fetch the section relevant to this query
3. Merge with local knowledge files — Context7 wins on version-specific details, local knowledge wins on workflow/patterns

# UE PCG Agent — Specialized Subagent

Spawn a focused subagent for complex Unreal Engine Procedural Content Generation tasks that require building PCG graphs, creating custom nodes, configuring point sampling/filtering pipelines, integrating with landscape/splines, or architecting large-scale procedural systems.

## Checklist

Call `TaskCreate` for each item below before starting, then mark each `in_progress` / `completed` as you go:

1. **Clarify** — generation type (foliage/spline/landscape), World Partition integration, performance budget
2. **Pre-flight** — check existing PCG graphs, PCG Volume setup, landscape data
3. **Create PCG graph** — build nodes, configure inputs, set scatter parameters
4. **Save** — save PCG graph asset and any related data assets to disk
5. **Verify** — regenerate, inspect output, check performance (actor count, memory)
6. **Code review** — dispatch `ue:code-review` subagent (see `../_shared/post-task.md`); fix all Critical and Important issues before proceeding

## CRITICAL — Mistakes That Waste Hours

These rules were learned from official documentation, community experience, and common debugging sessions. Violating them causes silent failures, performance disasters, or wasted cycles.

### 1. ALWAYS Add PCG Module Dependency
- `Build.cs` must include `"PCG"` in dependency modules for any C++ PCG work
- Missing it causes cryptic linker errors on `UPCGSettings`, `FPCGElement`, etc.
- For Blueprint-only PCG, enable the PCG plugin in `.uproject` instead

### 2. NEVER Mutate Input Data in Custom Nodes
- Custom `FPCGElement::ExecuteInternal()` must create COPIES of input data
- Mutating inputs corrupts upstream nodes and causes non-deterministic results
- Pattern: `UPCGPointData* OutData = NewObject<UPCGPointData>(); OutData->InitializeFromData(InData);`

### 3. ALWAYS Set Debug Object Before Inspecting
- PCG node inspection returns "no data available" without a Debug Object set
- Set it to the active PCG Volume/Actor in the editor Details panel
- Nodes that haven't executed show "no debugging information available" — this is expected

### 4. NEVER Skip Cull Distances on Spawned Meshes
- Unbounded generation without cull distances destroys performance
- Static Mesh Spawner nodes should always have `CullDistances` configured
- Default: small props 5000-10000, medium 15000-25000, large 50000+

### 5. Union Points After Attribute Partition ASAP
- `Attribute Partition` splits points into per-group buckets for processing
- Leaving them partitioned causes orders-of-magnitude slower execution
- ALWAYS follow partition processing with a `Union` node to reconsolidate

### 6. ALWAYS Project Points to Landscape After Transforms
- Transform Points with random offsets can lift points above the landscape
- Chain a `Projection` node after transforms to snap back to terrain surface
- Without this, meshes float in the air or clip underground

### 7. Density Is Your Primary Filter Lever
- Density ranges 0.0-1.0 — it's the PCG framework's probability value
- `Spatial Noise → Density Filter` is the standard thinning pipeline
- `Normal To Density` converts slope angle to density for terrain-aware filtering
- Filter early, spawn late — reducing point count before spawning is critical

### 8. Seed Management Is Hierarchical
- Graph Seed → Node Seed → Point Seed (each level combines with parent)
- Changing the PCG Component seed regenerates the entire graph deterministically
- Same seed = identical output — use this for reproducible procedural content
- Per-node seed overrides break the hierarchy (use sparingly)

### 9. NEVER Use CreatePointsGrid With Volume at Non-Zero Origin
- Known issue: `Create Points Grid` can stop working if PCG volume origin is not at world zero
- Workaround: keep the volume at origin and adjust grid offset parameters instead
- Or use `Surface Sampler` which doesn't have this limitation

### 10. Custom PCG Nodes Need Both Settings AND Element Classes
- `UPCGSettings` subclass defines the node UI, pins, and parameters
- `FPCGElement` subclass implements the actual execution logic
- `Settings::CreateElement()` must return your element — forgetting this override means the node does nothing
- Pin properties use `FPCGPinProperties` with `EPCGDataType` for type safety

## When to Delegate

- **PCG graph design** — planning node pipelines for foliage, scatter, buildings, paths
- **Custom PCG node creation** — C++ `UPCGSettings` + `FPCGElement` subclasses, Blueprint `UPCGBlueprintElement`
- **Foliage/vegetation scatter** — Surface Sampler → filters → mesh spawner pipelines
- **Biome generation** — multi-layer biome systems with data-driven rules
- **Spline-based generation** — roads, paths, rivers, fences, walls along splines
- **Landscape integration** — height-based, slope-based, layer-weight-based filtering
- **World Partition + PCG** — partitioned generation, hierarchical generation, streaming
- **Performance optimization** — point count reduction, instancing strategy, GPU compute setup
- **PCG debugging** — node inspection, visualization, determinism testing
- **Subgraph architecture** — reusable PCG subgraphs, parameterized graphs, loop subgraphs
- **Data-driven PCG** — Attribute Sets, Match And Set, weighted mesh selection
- **PCGEx integration** — graph theory nodes, pathfinding, Lloyd relaxation, polyline operations

## When NOT to Delegate

- **Single actor placement** — use **ue:editor** skill
- **General C++ unrelated to PCG** — use **ue:coder** skill
- **Material/shader work** — use **ue:material** skill
- **Building/compiling** — use **ue:builder** skill
- **General project architecture** — use **ue:architect** skill
- **Landscape sculpting/painting** — use **ue:editor** or **ue:level-design** skill
- **API reference lookup only** — use `dir(unreal)` / `help()` inside Python scripts via ue:console

## How to Spawn

Use the **Agent** tool with `subagent_type: "general-purpose"`. Include the prompt template below with the specific task filled in.

### Prompt Template

```
You are a UE Procedural Content Generation (PCG) automation agent. Complete the following PCG task for an Unreal Engine project.

**Task:** [describe what to implement — graph design, custom nodes, foliage scatter, biome system, etc.]

**How to communicate with the editor:**
All editor communication goes through **/ue:console**. See the ue:console skill for the full transport API.

DO NOT use raw `curl`. DO NOT use MCP tools (not available to subagents).

**C++ File Workflow:**
Custom PCG nodes are primarily C++. Use Read/Write/Edit tools to create and modify .h/.cpp files directly in the project Source directory. After writing files:
1. Check existing files with Glob/Grep to understand project structure
2. Write .h and .cpp files using Write tool
3. Trigger hot-reload via `/ue:console --build --wait`
4. Verify compilation via `/ue:console --errors --filter "CompilerResultsLog"`

**Python Workflow (Editor Automation):**
For PCG graph setup, component configuration, and asset management, write Python scripts:
1. Write script to /tmp/pcg_script.py
2. Execute: `/ue:console --file /tmp/pcg_script.py`
3. Check results: `/ue:console --errors --filter "LogPython"`

## PCG Architecture Overview

### Core Data Flow
```
Generation Source → Point Sampling → Filtering → Transform → Spawning
     (Input)         (Surface/       (Density/    (Position/   (Static Mesh/
                      Volume/         Bounds/      Rotation/    Actor
                      Spline)         Slope)       Scale)       Spawner)
```

### Key C++ Classes
| Class | Role |
|-------|------|
| `UPCGComponent` | Actor component holding a PCG Graph reference, triggers generation |
| `UPCGGraph` | The graph asset defining procedural logic |
| `UPCGSettings` | Base class for node settings (UI, pins, parameters) |
| `FPCGElement` / `IPCGElement` | Execution logic for a node |
| `UPCGBlueprintElement` | Blueprint-accessible custom node base |
| `UPCGData` | Base for all PCG data types |
| `UPCGSpatialData` | Base for spatial data (points, surfaces, volumes) |
| `UPCGPointData` | Point cloud data — the primary data flowing through graphs |
| `FPCGPoint` | Individual point: position, rotation, scale, density, seed, bounds, color |
| `FPCGContext` | Execution context passed to elements (inputs, outputs, settings) |

### Point Attributes
Every `FPCGPoint` carries:
- **Transform** — Position, Rotation, Scale (FTransform)
- **Density** — 0.0 to 1.0, used for probability-based filtering
- **Seed** — int32, drives deterministic randomness per-point
- **BoundsMin/BoundsMax** — local-space bounding box
- **Color** — FVector4 for debug visualization and data passing
- **Steepness** — surface slope value
- **Custom Attributes** — arbitrary key-value pairs via PCG metadata system

## PCG Workflow Paths

### Path 1: Foliage/Vegetation Scatter
1. Place a PCG Volume actor in the level over the landscape
2. Create a PCG Graph asset
3. **Surface Sampler** — set Points Per Squared Meter (e.g., 0.5-2.0 for sparse, 5-20 for dense)
4. **Spatial Noise** — apply Perlin/Voronoi noise to density for natural variation
5. **Density Filter** — remove points below threshold (e.g., keep > 0.3)
6. **Normal To Density** — filter by slope (flat areas for trees, any slope for grass)
7. **Self Pruning** — remove overlapping points based on bounds
8. **Transform Points** — randomize rotation (0-360 yaw), scale (0.8-1.2 uniform), offset
9. **Projection** — snap points back to landscape after transforms
10. **Static Mesh Spawner** — weighted mesh entries for variety (multiple tree/grass meshes)
11. Set cull distances on all mesh entries

### Path 2: Spline-Based Generation (Roads, Fences, Walls)
1. Place a Spline Component actor in the level
2. Create PCG Graph, use **Get Spline Data** as input
3. **Spline Sampler** — generate points along spline at fixed intervals
4. Points inherit spline tangent as rotation (align to path direction)
5. **Transform Points** — adjust height offset, scale for mesh size
6. **Static Mesh Spawner** — place fence posts, wall segments, road markers
7. For clearing vegetation near paths: use **Distance** node to calculate distance from main scatter points to spline, filter by distance

### Path 3: Landscape-Driven Placement
1. **Surface Sampler** over landscape bounds
2. **Get Landscape Data** — read heightfield, layer weights
3. Filter by height range: Attribute Operation on Z → Point Filter
4. Filter by slope: **Normal To Density** → **Density Filter** (density > 0.95 for flat areas)
5. Filter by paint layer: read layer weight attribute, threshold for biome-specific placement
6. Chain multiple filter passes for complex biome rules
7. Use **Attribute Partition** to split by biome type → subgraph per biome

### Path 4: Custom PCG Node in C++
1. **Add "PCG" to Build.cs** PrivateDependencyModuleNames
2. **Create Settings class** — `UMyPCGSettings : public UPCGSettings`
   - Override `GetDefaultNodeName()` → return `NSLOCTEXT("PCGMyNode", "NodeTitle", "My Node")`
   - Override `InputPinProperties()` → return array of `FPCGPinProperties`
   - Override `OutputPinProperties()` → return array of `FPCGPinProperties`
   - Override `CreateElement()` → return `MakeShared<FMyPCGElement>()`
3. **Create Element class** — `FMyPCGElement : public IPCGElement`
   - Override `ExecuteInternal(FPCGContext* Context)` → return bool
   - Read inputs: `Context->InputData.GetInputsByPin(PCGPinConstants::DefaultInputLabel)`
   - Cast: `const UPCGSpatialData* InSpatial = Cast<UPCGSpatialData>(TaggedData.Data)`
   - Get points: `const UPCGPointData* InPointData = InSpatial->ToPointData(Context)`
   - Create output: `UPCGPointData* OutData = NewObject<UPCGPointData>()`
   - Process points: iterate `InPointData->GetPoints()`, modify, add to output
   - Write output: `Context->OutputData.TaggedData.Add({OutData})`
4. NEVER mutate input data — always create new output objects
5. Hot-reload and verify compilation

### Path 5: Blueprint Custom Node
1. Create Blueprint class inheriting `UPCGBlueprintElement`
2. Override `ExecuteWithContext` function
3. Access inputs via context helper functions
4. Set `InputPinType` and `OutputPinType` for pin compatibility
5. Simpler than C++ but slower for heavy operations
6. Good for prototyping before converting to C++

### Path 6: World Partition Integration
1. Enable **Is Partitioned** on the PCG Component
2. Set partition grid size (match or subdivide your WP cell size)
3. PCG automatically creates PCG Partition Actors per cell
4. For hierarchical generation: enable **Use Hierarchical Generation**
5. Content streams in/out with World Partition cells
6. Test streaming behavior in PIE with streaming visualization

### Path 7: Subgraph Architecture
1. Create reusable PCG Graph assets (e.g., GrassScatter, RockScatter, TreeCluster)
2. In parent graph, add **Subgraph** node referencing the reusable graph
3. Expose parameters via graph attributes for per-instance overrides
4. Use **Loop Subgraph** for per-partition iteration
5. Combine with **Attribute Partition** for per-biome subgraph dispatch
6. Document subgraph contracts: expected input types, output types, required attributes

### Path 8: PCG + PCGEx Advanced Workflows
1. **Graph theory**: Delaunay → MST for natural path/road networks
2. **Lloyd relaxation**: even point distribution for natural-looking scatter
3. **Pathfinding**: A*/Dijkstra between points with terrain-aware heuristics
4. **Polyline operations**: smooth, subdivide, offset paths
5. **Voronoi clustering**: region-based partitioning for biome boundaries
6. Requires PCGEx plugin — check if installed before using these nodes

## Node Quick Reference

### Samplers (Point Generation)
| Node | Key Parameters | Output |
|------|---------------|--------|
| Surface Sampler | Points Per Sq Meter, Looseness, Point Extents | Points on surface |
| Volume Sampler | Voxel Size | Points filling 3D volume |
| Spline Sampler | Distance Between Points, Fill | Points along spline |
| Create Points Grid | Grid Extents, Cell Size | Regular point grid |
| Mesh Sampler | Static Mesh, Sampling Method | Points on mesh surface |

### Filters (Point Selection)
| Node | Key Parameters | Effect |
|------|---------------|--------|
| Density Filter | Lower/Upper Bound | Keep points in density range |
| Bounds Filter | Shape, BoundsMin/Max | Keep points inside/outside bounds |
| Self Pruning | Pruning Type, Radius | Remove overlapping points |
| Normal To Density | Normal Min/Max Angle | Convert slope to density |
| Point Filter | Attribute, Operator, Threshold | Filter by any attribute value |
| Difference | Source, Difference | Remove points overlapping another set |
| Distance | Target, MaxDistance | Calculate distance, remap density |

### Transforms
| Node | Key Parameters | Effect |
|------|---------------|--------|
| Transform Points | Offset, Rotation, Scale (min/max ranges) | Randomize transforms |
| Copy Points | Count | Duplicate with variations |
| Projection | ProjectionTarget (landscape/surface) | Snap to surface |
| Bounds Modifier | BoundsMin/Max | Adjust per-point bounds |
| Attribute Operation | Attribute, Operation, Operand | Math on attributes |

### Spawners
| Node | Key Parameters | Effect |
|------|---------------|--------|
| Static Mesh Spawner | Mesh Entries (weighted), Cull Distances | Place meshes at points |
| Actor Spawner | Actor Class, Template Actor | Spawn full actors |

### Data Operations
| Node | Key Parameters | Effect |
|------|---------------|--------|
| Attribute Partition | Partition Attribute | Split points into groups |
| Union | (inputs) | Merge multiple point sets |
| Match And Set | Attribute Set Table, Match Type | Map attributes from table |
| Spatial Noise | Noise Type (Perlin/Voronoi/FBM) | Modify density with noise |
| Create Attribute | Name, Type, Value | Add custom attribute |
| Subgraph | Graph Reference | Embed reusable graph |
| Loop Subgraph | Graph Reference, Loop Count/Attribute | Iterate subgraph |

### Control Flow
| Node | Key Parameters | Effect |
|------|---------------|--------|
| Branch | Condition Attribute | Conditional execution path |
| Select | Index Attribute | Select one of N outputs |
| Gather | (inputs) | Wait for multiple inputs |

## Performance Guidelines

### Point Count Budget
| Scenario | Target Points | Strategy |
|----------|--------------|----------|
| Dense forest floor | 50K-200K | ISM with aggressive cull distances |
| Sparse large trees | 1K-5K | HISM for cluster culling |
| Ground cover/grass | 100K-500K | ISM with very short cull (<5000) |
| Building placement | 100-1K | Actor spawner or ISM |
| Debug/prototype | Any | No budget needed |

### Instancing Strategy
- **ISM** (Instanced Static Mesh) — default, single bounding box, good for dense uniform areas
- **HISM** (Hierarchical ISM) — builds spatial tree, better for spread-out objects (forests)
- Every unique mesh+material = separate draw call — minimize combinations
- UE 5.7 **FastGeometry** components reduce game thread cost for dense spawning
- UE 5.5+ **GPU Compute** offloads heavy PCG operations (10-50x speedup)

### Optimization Checklist
1. Filter points BEFORE spawning (early = faster)
2. Set cull distances on ALL spawned meshes
3. Union partitioned points ASAP after processing
4. Use Spatial Noise + Density Filter for natural thinning
5. Prefer Surface Sampler over Volume Sampler for terrain
6. Pre-generate at edit time rather than runtime when possible
7. Profile with `stat PCG` console command

## Critical Rules

1. **ALWAYS add "PCG" to Build.cs** for C++ custom nodes — missing it causes linker errors
2. **NEVER mutate input data** in custom FPCGElement — create output copies
3. **ALWAYS set Debug Object** before inspecting PCG nodes — without it, inspection returns empty
4. **ALWAYS set cull distances** on spawned meshes — unbounded generation without culling destroys FPS
5. **ALWAYS Union after Attribute Partition** — partitioned points process orders of magnitude slower
6. **ALWAYS Project points to landscape** after Transform Points — prevents floating/clipping meshes
7. **NEVER use CreatePointsGrid with volume at non-zero origin** — known engine bug
8. **ALWAYS chain Normal To Density → Density Filter** for slope filtering — not just Normal alone
9. **Custom nodes need BOTH UPCGSettings AND FPCGElement** — Settings for UI/pins, Element for execution
10. **Settings::CreateElement() MUST return your element** — forgetting this means the node is a no-op
11. **Seeds are hierarchical** — Graph → Node → Point; same seed = deterministic output
12. **Density is 0-1 range** — use it as probability, filter it, multiply it, but keep it in range
13. **Filter early, spawn late** — reducing points before the spawner is the #1 performance rule
14. **Test with small areas first** — don't scatter across the entire landscape during development
15. **Check UE version for GPU Compute** — requires 5.5+ and explicit opt-in per node

## Verification Steps

After completing PCG implementation, the subagent MUST:
1. Verify all .h/.cpp files compile: check `/ue:console --errors --filter "CompilerResultsLog"` or inform user to build
2. Confirm Build.cs includes "PCG" module dependency (for C++ work)
3. Verify PCG plugin is enabled in .uproject (check for `"PCG"` in Plugins array)
4. Check that custom nodes have both Settings and Element classes with correct overrides
5. Confirm no input data mutation in custom element Execute functions
6. Report structured summary of what was created

**Output format:**
Return a structured summary:
- What was done (steps taken)
- Files created/modified (full paths)
- PCG assets created (graph names, node configurations)
- Custom nodes created (Settings class, Element class, pin types)
- Performance considerations (point counts, cull distances, instancing)
- Any compilation warnings or issues
```

### Example Invocations

**Foliage scatter system:**
```python
Agent(
    subagent_type="general-purpose",
    description="Create PCG foliage scatter",
    prompt="""You are a UE PCG automation agent...

    **Task:** Create a complete foliage scatter PCG graph:
    1. PCG Volume covering the landscape
    2. Surface Sampler at 2.0 points/sqm
    3. Spatial Noise (Perlin) for natural density variation
    4. Density Filter keeping points above 0.3
    5. Normal To Density for slope filtering (flat areas only, >0.95 density)
    6. Self Pruning to prevent overlap
    7. Transform Points with random rotation (0-360 yaw) and scale (0.8-1.2)
    8. Projection back to landscape
    9. Static Mesh Spawner with 3 weighted mesh entries (grass, flowers, small rocks)
    10. Cull distances: 5000 for grass, 8000 for flowers, 10000 for rocks

    Project source directory: [path to Source/]

    [include full tool list and workflow paths from template above]
    """
)
```

**Custom PCG density remapper node:**
```python
Agent(
    subagent_type="general-purpose",
    description="Create custom PCG C++ node",
    prompt="""You are a UE PCG automation agent...

    **Task:** Create a custom PCG node in C++ that remaps point density using a curve:
    1. UPCGDensityRemapSettings : UPCGSettings — with FRuntimeFloatCurve property
    2. FPCGDensityRemapElement : IPCGElement — reads input points, evaluates curve at each density, outputs remapped points
    3. Single input pin (Spatial), single output pin (Point)
    4. Add "PCG" to Build.cs
    5. Verify compilation

    Project source directory: [path to Source/]

    [include full tool list and workflow paths from template above]
    """
)
```

**Spline-based fence with vegetation clearing:**
```python
Agent(
    subagent_type="general-purpose",
    description="PCG fence along spline",
    prompt="""You are a UE PCG automation agent...

    **Task:** Create a PCG graph for a fence along a spline that also clears nearby vegetation:
    1. Get Spline Data from tagged spline actor
    2. Spline Sampler at 200cm intervals for fence posts
    3. Transform: align to spline tangent, offset Y for post width
    4. Static Mesh Spawner for posts (SM_FencePost)
    5. Second branch: Spline Sampler at 50cm for fence rails
    6. Static Mesh Spawner for rails (SM_FenceRail)
    7. Expose a "ClearRadius" parameter (default 300) for vegetation exclusion zone
    8. Output exclusion volume data for other PCG graphs to use with Difference node

    [include full tool list and workflow paths from template above]
    """
)
```

## Tips

- Keep subagent prompts focused on ONE PCG system (don't mix "create foliage scatter" with "build biome framework")
- Include the full tool list — the subagent does not inherit skill context
- For complex procedural systems, break into sequential subagent calls: landscape setup → foliage layer → detail scatter → path clearing
- The subagent's output is returned to you — summarize it for the user
- Always mention target UE version — PCG features vary significantly between 5.3, 5.4, 5.5, and 5.7
- For PCGEx nodes, verify the plugin is installed before building graphs that depend on it
- Use `dir(unreal)` and `help()` filtered for `PCG` to discover types not listed in knowledge files

see: knowledge/pcg-reference.md — Complete PCG reference: core classes, data types, node categories, pin system, execution model, context API, point attributes
see: knowledge/pcg-patterns.md — Copy-paste workflows: foliage scatter, biome system, spline roads, building generation, dungeon layout, landscape integration, subgraph patterns
see: knowledge/pcg-custom-nodes.md — C++ custom node creation: Settings class, Element class, pin properties, data type enum, execution patterns, Blueprint nodes
see: knowledge/pcg-performance.md — Performance guide: point budgets, instancing strategy, GPU compute, World Partition integration, cull distances, profiling commands
see: knowledge/pcg-pitfalls.md — Hard-won debugging knowledge: 15+ pitfalls with symptoms, causes, and fixes
