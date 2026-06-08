# UE Python API — ParametricSurfaceExtension Module

**3 types** from the `ParametricSurfaceExtension` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DataprepTessellationOperation`, `ParametricRetessellateActionOptions`, `ParametricSurfaceBlueprintLibrary`

---

## Classes

### `unreal.DataprepTessellationOperation`
Inherits: `DataprepOperation` | Header: `DataprepTessellationOperation.h`

For each static mesh to process, retessellate the mesh if the object contains the required data

**Properties** (3):
  - `chord_tolerance`: `float` — [Read-Write] Maximum distance between any generated triangle and the original surface. Smaller value...
  - `max_edge_length`: `float` — [Read-Write] Maximum length of any edge in the generated triangles. Smaller values make more triangl...
  - `normal_tolerance`: `float` — [Read-Write] Maximum angle between adjacent triangles. Smaller values make more triangles. (float)

### `unreal.ParametricRetessellateActionOptions`
Inherits: `Object` | Header: `ParametricRetessellateAction.h`

Parametric Retessellate Action Options

**Properties** (1):
  - `options`: `DatasmithRetessellationOptions` — [Read-Write] (DatasmithRetessellationOptions)

### `unreal.ParametricSurfaceBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `ParametricSurfaceBlueprintLibrary.h`

Parametric Surface Blueprint Library

**Methods** (1):
  - `retessellate_static_mesh(static_mesh, tessellation_settings)` -> `Text or None` [classmethod] — Re-tessellate LOD 0 of a static mesh if it contains parametric surface data.
