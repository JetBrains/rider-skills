# Landscape System

Complete reference for Unreal Engine's Landscape system, covering creation, heightmap import, layers, materials, foliage, splines, and performance configuration.

---

## Overview

The Landscape system provides large-scale terrain with efficient LOD, GPU-friendly rendering, and integrated foliage/grass. It uses a component-based architecture where the terrain is divided into components, each with its own LOD and collision.

Key concepts:
- **Landscape Actor:** The root actor containing all terrain data
- **Landscape Component:** A square patch of terrain (the LOD and culling unit)
- **Landscape Section:** A subdivision of a component used for draw calls
- **Landscape Proxy:** Used in World Partition to partition the landscape across cells

---

## Creating Landscape from Python

### Basic Flat Landscape

```python
import unreal
el = unreal.EditorLevelLibrary

# Spawn default landscape -- creates a flat terrain
landscape = el.spawn_actor_from_class(
    unreal.Landscape,
    unreal.Vector(0, 0, 0)
)
```

### Landscape with Specific Configuration

The preferred automation approach is to use `EditorLandscapeLibrary` or execute editor commands:

```python
import unreal

# Configure landscape parameters before creation
# Component count and section size determine total resolution
# Common configurations:
#   8x8 components, 1 section, 63 quads = 505x505 vertex resolution
#   16x16 components, 1 section, 63 quads = 1009x1009 vertex resolution
#   32x32 components, 1 section, 63 quads = 2017x2017 vertex resolution

subsystem = unreal.get_editor_subsystem(unreal.LandscapeEditorSubsystem)
if subsystem:
    # Use subsystem API for landscape operations
    pass
```

### Landscape Scale and Size

| Parameter | Description | Typical Values |
|-----------|-------------|----------------|
| `Scale` | World units per vertex | (100, 100, 100) default |
| `Component Count` | NxN grid of components | 8x8 to 32x32 |
| `Sections Per Component` | 1x1 or 2x2 | 1x1 for simplicity |
| `Quads Per Section` | Vertices minus one per section edge | 7, 15, 31, 63, 127, 255 |

Total vertex resolution per axis = `(QuadsPerSection * SectionsPerComponent * ComponentCount) + 1`

---

## Heightmap Import

### Supported Formats

| Format | Extension | Notes |
|--------|-----------|-------|
| 16-bit PNG | `.png` | Grayscale, most common |
| 16-bit RAW | `.r16` | Little-endian, no header |
| 32-bit RAW | `.r32` | Little-endian, higher precision |

### Resolution Rules (CRITICAL)

The heightmap resolution MUST exactly match the landscape configuration. The formula is:

```
Resolution = (ComponentSizeQuads * NumComponents) + 1
```

Where `ComponentSizeQuads = QuadsPerSection * SectionsPerComponent`

**Valid resolution examples:**

| Components | Sections | Quads/Section | Resolution |
|------------|----------|---------------|------------|
| 8x8 | 1x1 | 63 | 505x505 |
| 8x8 | 2x2 | 63 | 1009x1009 |
| 16x16 | 1x1 | 63 | 1009x1009 |
| 16x16 | 2x2 | 63 | 2017x2017 |
| 32x32 | 1x1 | 63 | 2017x2017 |
| 32x32 | 2x2 | 63 | 4033x4033 |

**If the resolution does not match exactly, the engine silently resamples the data, causing subtle terrain artifacts and data corruption.** Always verify resolution before importing.

### Import via Python

```python
import unreal

# Import heightmap to existing landscape
subsystem = unreal.get_editor_subsystem(unreal.LandscapeEditorSubsystem)
# The heightmap file must be accessible and match expected resolution
# Use editor menus: Landscape Mode > Import for interactive import
# For automation, prepare heightmap at exact required resolution
```

### Heightmap Generation Tips

- Use 16-bit PNG for compatibility; 32-bit RAW for precision
- Value 32768 in 16-bit = sea level (Z=0); values above = positive Z, below = negative Z
- Scale Z in the landscape actor controls height range: default 100 means 16-bit range maps to +/- 256 meters
- Tiling heightmaps across landscape proxies: ensure shared edges have identical values to prevent seams
- World Machine, Gaea, and Houdini can export correctly sized heightmaps

---

## Landscape Layers and Materials

### Layer System

Landscape layers control which material textures appear on the terrain surface. Each layer maps to a weight-painted channel.

```python
import unreal

# Create landscape layer info assets
# These are typically created in the Content Browser:
# Right-click > Materials & Textures > Landscape Layer Info Object
# Types: Weight-Blended Layer or Non-Weight-Blended Layer
```

### Layer Types

| Type | Behavior | Use For |
|------|----------|---------|
| Weight-Blended | Shares weight budget with other layers; all weights sum to 1.0 | Base terrain (grass, dirt, rock) |
| Non-Weight-Blended | Independent weight, painted additively | Snow overlay, puddles, decals |

### Material Setup

A landscape material uses `LandscapeLayerBlend` or `LandscapeLayerCoords` nodes:

```
Material structure:
  LandscapeLayerBlend node
    Layer: Grass  -> Texture sample (grass albedo, normal)
    Layer: Rock   -> Texture sample (rock albedo, normal)
    Layer: Dirt   -> Texture sample (dirt albedo, normal)
  Output -> Base Color, Normal, Roughness
```

### Assigning Material via Python

```python
import unreal
el = unreal.EditorLevelLibrary

# Get landscape actor
actors = unreal.GameplayStatics.get_all_actors_of_class(
    unreal.EditorLevelLibrary.get_editor_world(), unreal.Landscape
)
if actors:
    landscape = actors[0]
    mat = unreal.EditorAssetLibrary.load_asset("/Game/Materials/M_Landscape")
    if mat:
        landscape.set_editor_property("landscape_material", mat)
```

### Virtual Texturing for Landscapes

For large landscapes with many layers, enable Runtime Virtual Texturing:
1. Create a `RuntimeVirtualTexture` asset
2. Add a `RuntimeVirtualTextureVolume` covering the landscape
3. Set the landscape material to output to the virtual texture
4. This significantly reduces draw calls for complex multi-layer materials

---

## Foliage: Procedural and Manual

### Procedural Foliage

Uses `ProceduralFoliageVolume` and `ProceduralFoliageSpawner`:

```python
import unreal
el = unreal.EditorLevelLibrary

# Spawn procedural foliage volume
volume = el.spawn_actor_from_class(
    unreal.ProceduralFoliageVolume,
    unreal.Vector(0, 0, 0)
)
# Scale to cover desired area
volume.set_actor_scale3d(unreal.Vector(100, 100, 50))

# The volume references a ProceduralFoliageSpawner asset
# which defines species, density, scale ranges, and placement rules
```

### Foliage Spawner Configuration

Key spawner properties per species:
- `Procedural Scale`: min/max random scale
- `Seeds Per Step`: density control
- `Overlap Priority`: which species wins when overlapping
- `Shade Tolerance`: survives under canopy or not
- `Collision Radius`: minimum spacing between instances
- `Clustering Factor`: how clumped vs. evenly distributed

### Manual Foliage Painting via Automation

```python
import unreal

# Foliage painting is primarily an editor tool mode operation
# For automation, use ProceduralFoliageVolume or scatter actors via Python:
el = unreal.EditorLevelLibrary
mesh = unreal.EditorAssetLibrary.load_asset("/Game/Meshes/SM_Tree")

import random
for i in range(100):
    x = random.uniform(-5000, 5000)
    y = random.uniform(-5000, 5000)
    # Use line trace to find ground height
    world = el.get_editor_world()
    start = unreal.Vector(x, y, 10000)
    end = unreal.Vector(x, y, -10000)
    hit = unreal.SystemLibrary.line_trace_single(
        world, start, end, unreal.TraceTypeQuery.TRACE_TYPE_QUERY1,
        False, [], unreal.DrawDebugTrace.NONE, True
    )
```

---

## Grass System Integration

The Grass system uses `LandscapeGrassType` to automatically scatter mesh instances based on landscape layer weights.

### Setup

1. Create `LandscapeGrassType` asset
2. Add grass varieties (mesh, density, scale range, alignment)
3. Reference the grass type in your landscape material via `LandscapeGrassOutput` node
4. Grass appears automatically based on painted layer weights

### Grass Type Configuration

| Property | Description |
|----------|-------------|
| `Grass Mesh` | Static mesh to scatter |
| `Grass Density` | Instances per 10 square meters |
| `Start/End Cull Distance` | Draw distance fade |
| `Min/Max LOD` | LOD range for instances |
| `Scaling` | Uniform or free axis scaling |
| `Random Rotation` | Enable Y-axis (vertical) rotation |
| `Align to Surface` | Tilt instances to match terrain normal |
| `Use Landscape Lightmap` | Use landscape lighting for grass |

### Performance Considerations

- Grass is rendered via instanced static meshes -- very GPU efficient
- Density has the biggest performance impact; start low and increase
- Cull distance prevents distant grass from consuming GPU
- Grass does not generate collision by default -- add manually if needed
- Grass rebuilds when landscape is modified in the painted area

---

## Landscape Splines (Roads and Rivers)

Landscape splines deform terrain and place meshes along paths.

### Creating Splines

```python
import unreal

# Landscape splines are edited in Landscape Mode > Manage > Splines
# For automation, spline actors can be placed:
el = unreal.EditorLevelLibrary

spline_actor = el.spawn_actor_from_class(
    unreal.LandscapeSplineActor,
    unreal.Vector(0, 0, 0)
)
```

### Spline Properties

| Property | Description |
|----------|-------------|
| `Width` | Half-width of terrain deformation |
| `Side Falloff` | Smooth blending distance at edges |
| `End Falloff` | Smooth blending at spline endpoints |
| `Raise Terrain` | Whether spline raises terrain to match |
| `Lower Terrain` | Whether spline lowers terrain to match |
| `Mesh` | Static mesh to repeat along the spline (road surface) |
| `Material Overrides` | Override materials on the spline mesh |
| `Layer Name` | Landscape layer to paint along the spline |

### Road Workflow

1. Create spline control points along the road path
2. Set mesh to road surface static mesh
3. Enable `Raise Terrain` and `Lower Terrain` for flat road bed
4. Set `Layer Name` to a road material layer (e.g., "Asphalt")
5. Adjust `Width` and `Side Falloff` for road shoulders

### River Workflow

1. Create spline following the river path
2. Set `Lower Terrain` to carve the riverbed
3. Do NOT raise terrain for rivers
4. Place water plane/volume along the spline separately
5. Paint a "RiverBed" layer along the spline for wet material

---

## LOD and Component Sizing

### LOD System

Landscape uses a quadtree-based continuous LOD system:

| LOD Level | Vertex Skip | Description |
|-----------|-------------|-------------|
| 0 | None | Full resolution, closest to camera |
| 1 | Every 2nd | Half resolution |
| 2 | Every 4th | Quarter resolution |
| N | Every 2^N | Progressively coarser |

### Key LOD Properties

| Property | Description | Recommendation |
|----------|-------------|----------------|
| `LOD 0 Screen Size` | Screen-space threshold for full detail | 0.5 default |
| `LOD Distribution Setting` | Bias toward near or far LODs | 1.0 = even distribution |
| `Collision Mip Level` | LOD used for physics collision | 0 for accurate, 1-2 for performance |
| `Static Lighting LOD` | LOD level for lightmap resolution | Match component count to budget |

### Component Sizing Guidelines

- Fewer, larger components = fewer draw calls, coarser culling
- More, smaller components = more draw calls, finer culling and LOD
- Each component has its own lightmap, so component count affects lighting memory
- For World Partition: components map to partition cells, so size affects streaming granularity

### Recommended Configurations

| Use Case | Components | Quads | Resolution | Notes |
|----------|------------|-------|------------|-------|
| Small map (4km) | 8x8 | 63 | 505x505 | Simple terrain |
| Medium map (8km) | 16x16 | 63 | 1009x1009 | Open world zones |
| Large map (16km) | 32x32 | 63 | 2017x2017 | Full open world |
| Huge map (32km+) | 32x32 | 127 | 4065x4065 | Use World Partition |

### Performance Budget

- Keep total landscape components under 1024 for non-World-Partition levels
- Each component uses approximately 1 draw call at LOD 0
- Lightmap memory per component = `(ComponentSize / StaticLightingLOD)^2 * 4 bytes`
- Collision memory scales with component count and collision mip level
