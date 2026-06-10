# PCG Workflow Patterns — Copy-Paste Recipes

## Pattern 1: Basic Foliage Scatter

Graph structure:
```
Surface Sampler → Spatial Noise → Density Filter → Normal To Density →
Density Filter → Self Pruning → Transform Points → Projection → Static Mesh Spawner
```

### Python setup (place PCG volume + assign graph):
```python
import unreal

# Spawn PCG Volume
eas = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
vol = eas.spawn_actor_from_class(
    unreal.PCGVolume,
    unreal.Vector(0, 0, 0),
    unreal.Rotator(0, 0, 0)
)
vol.set_actor_label("PCG_FoliageScatter")

# Scale volume to cover area (e.g., 100m x 100m)
vol.set_actor_scale3d(unreal.Vector(100, 100, 10))

# Get PCG component and assign graph
pcg = vol.get_component_by_class(unreal.PCGComponent)
graph = unreal.load_asset('/Game/PCG/PG_FoliageScatter')
if graph:
    pcg.set_editor_property('graph', graph)
    pcg.set_editor_property('seed', 42)
    pcg.generate()
```

### Recommended Surface Sampler settings:
| Vegetation Type | Points Per Sq Meter | Notes |
|----------------|--------------------| ------|
| Dense grass | 10-20 | Use shortest cull distance (3000-5000) |
| Sparse flowers | 1-3 | Medium cull (5000-8000) |
| Bushes | 0.3-0.8 | Medium cull (8000-12000) |
| Trees | 0.01-0.1 | Longest cull (15000-50000) |
| Rocks/boulders | 0.05-0.3 | Long cull (10000-20000) |

---

## Pattern 2: Multi-Layer Biome System

Graph structure:
```
Surface Sampler → Get Landscape Data → Attribute Partition (by biome layer)
    ├── [Forest biome subgraph] → Union ─┐
    ├── [Desert biome subgraph] → Union ──┤
    ├── [Snow biome subgraph]  → Union ───┤
    └── [Grass biome subgraph] → Union ───┴→ Final Union → Static Mesh Spawner
```

### Biome subgraph contract:
- **Input**: Point set with landscape attributes (height, slope, layer weights)
- **Process**: Filter by biome-specific rules, apply biome-specific transforms
- **Output**: Filtered + transformed points ready for spawning

### Layer-based filtering pattern:
```
Get Landscape Data → Create Attribute (read "ForestLayer" weight)
→ Point Filter (weight > 0.5) → [forest-specific scatter]
```

### Height-based biome zones:
```
Attribute Operation (read Z position)
→ Point Filter (Z < 5000)  → [lowland biome]
→ Point Filter (Z 5000-8000) → [midland biome]
→ Point Filter (Z > 8000)  → [alpine biome]
```

---

## Pattern 3: Spline Road with Vegetation Clearing

Graph structure:
```
                    ┌─ Spline Sampler (200cm) → Transform → Mesh Spawner (posts)
Get Spline Data ───┤
                    ├─ Spline Sampler (50cm) → Transform → Mesh Spawner (rails)
                    │
                    └─ Distance (to main scatter) → Density Filter (< ClearRadius)
                       → [outputs exclusion zone for other graphs]
```

### Vegetation clearing via Difference node:
```
Main Foliage Graph:
Surface Sampler → ... → [before spawning]
    ↓
Difference (subtract road exclusion zone)
    ↓
Static Mesh Spawner
```

### Spline-aligned rotation:
Points from Spline Sampler automatically inherit the spline tangent as rotation.
For perpendicular placement (e.g., fence rails), add 90 degrees to Yaw in Transform Points.

---

## Pattern 4: Slope-Aware Placement

Graph structure:
```
Surface Sampler → Normal To Density → Density Filter
```

### Slope threshold reference:
| Terrain Type | Normal To Density Range | Density Filter Threshold | Use Case |
|-------------|------------------------|-------------------------|----------|
| Flat only | 0° - 10° | > 0.95 | Buildings, large trees |
| Gentle slopes | 0° - 25° | > 0.7 | Medium vegetation |
| Moderate slopes | 0° - 45° | > 0.5 | Small bushes, grass |
| Steep slopes | 25° - 70° | 0.3 - 0.7 | Cliff plants, moss |
| Cliffs only | 45° - 90° | < 0.5 | Rock faces, vines |

---

## Pattern 5: Clustered Placement (Natural Groups)

Graph structure:
```
Surface Sampler (sparse, 0.05/sqm) → [cluster centers]
    ↓
Copy Points (5-15 copies per center)
    ↓
Transform Points (random offset within cluster radius, e.g., 200-500cm)
    ↓
Projection → Self Pruning → Transform Points (randomize rot/scale)
    ↓
Static Mesh Spawner
```

This creates natural-looking clusters (tree groves, rock formations, flower patches)
rather than uniform random scatter.

---

## Pattern 6: Building/Structure Grid

Graph structure:
```
Create Points Grid (cell size = building footprint)
    ↓
Density Filter (random thinning for gaps)
    ↓
Transform Points (snap to grid, random yaw: 0/90/180/270)
    ↓
Attribute Operation (assign building type via modulo/random)
    ↓
Attribute Partition (by building type)
    ├── [Type A: houses] → Static Mesh Spawner (SM_House_*)
    ├── [Type B: shops]  → Static Mesh Spawner (SM_Shop_*)
    └── [Type C: parks]  → Static Mesh Spawner (SM_Park_*)
    ↓
Union
```

---

## Pattern 7: Dungeon Room Placement (PCGEx)

Requires PCGEx plugin:
```
Create Points Grid (room grid)
    ↓
Density Filter (random room removal for variety)
    ↓
PCGEx: Delaunay Triangulation (connect rooms)
    ↓
PCGEx: Minimum Spanning Tree (ensure connectivity)
    ↓
PCGEx: A* Pathfinding (corridor paths between rooms)
    ↓
PCGEx: Polyline Smooth (corridor smoothing)
    ↓
[Room placement at points, corridor meshes along paths]
```

---

## Pattern 8: River/Water Edge Vegetation

Graph structure:
```
Get Spline Data (river spline)
    ↓
Distance (from main foliage scatter points to river)
    ↓
Branch:
├── Distance < 500cm → [water edge plants: reeds, lilies]
├── Distance 500-1500cm → [riparian zone: willows, ferns]
└── Distance > 1500cm → [normal vegetation]
```

---

## Pattern 9: Parameterized Reusable Subgraph

Create a subgraph with exposed parameters for team reuse:

**Subgraph: SG_ScatterLayer**
Inputs:
- Points (Spatial) — pre-sampled points
- MeshList (Param) — weighted mesh table reference
- DensityMin (float, default 0.3)
- DensityMax (float, default 1.0)
- ScaleMin (float, default 0.8)
- ScaleMax (float, default 1.2)
- CullDistance (float, default 10000)

Internal graph:
```
Input Points → Density Filter (DensityMin..DensityMax)
→ Self Pruning → Transform Points (scale: ScaleMin..ScaleMax, rotation: random)
→ Projection → Static Mesh Spawner (meshes from MeshList, cull from CullDistance)
```

Usage in parent graph:
```
Surface Sampler → Spatial Noise → SG_ScatterLayer (Grass, dense)
                               → SG_ScatterLayer (Flowers, sparse)
                               → SG_ScatterLayer (Rocks, very sparse)
```

---

## Pattern 10: Electric Dreams-Style Flat Area Detection

Reusable subgraph for finding flat areas suitable for object placement:

```
Input Points → Normal To Density
    ↓
Density Filter (> 0.98) — only extremely flat areas
    ↓
Self Pruning (radius = object footprint)
    ↓
Bounds Modifier (expand bounds to footprint size)
    ↓
Output: flat area points suitable for building/structure placement
```

Used in Electric Dreams sample project for placing structures on jungle terrain.

---

## Anti-Patterns to Avoid

### Wrong: Volume Sampler for terrain scatter
Volume Sampler fills 3D space — most points are above or below the terrain.
Use Surface Sampler instead, which places points ON the surface.

### Wrong: Spawning before filtering
```
Surface Sampler → Static Mesh Spawner → Density Filter  ← WRONG ORDER
```
Always filter BEFORE spawning. Spawning is the most expensive operation.

### Wrong: Multiple separate PCG graphs for layered scatter
Using separate PCG actors/graphs for grass, flowers, trees, rocks.
Instead, use ONE graph with Attribute Partition or Union for all layers.
This enables proper Difference exclusion between layers.

### Wrong: Not projecting after transforms
```
Surface Sampler → Transform Points (+random Z offset) → Static Mesh Spawner  ← FLOATING MESHES
```
Always add Projection after any transform that modifies position.

### Wrong: Hardcoded seeds everywhere
Override seeds only at the PCG Component level. Let the hierarchical seed
system propagate naturally. Overriding per-node seeds breaks reproducibility
across graph changes.
