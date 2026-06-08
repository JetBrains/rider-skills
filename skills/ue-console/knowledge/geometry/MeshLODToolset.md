# UE Python API — MeshLODToolset Module

**17 types** from the `MeshLODToolset` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `GenerateStaticMeshLODProcess_CollisionSettings`, `GenerateStaticMeshLODProcess_NormalsSettings`, `GenerateStaticMeshLODProcess_PreprocessSettings`, `GenerateStaticMeshLODProcess_SimplifySettings`, `GenerateStaticMeshLODProcess_TextureSettings`, `GenerateStaticMeshLODProcess_UVSettings`, `GenerateStaticMeshLODProcess_UVSettings_PatchBuilder`, `GenerateStaticMeshLODProcessSettings`, `StaticMeshLODGenerationSettings`, `StaticMeshLODGenerationSettingsFactory`, `GenerateStaticMeshLODBakeResolution`, `GenerateStaticMeshLODProcess_AutoUVMethod`, `GenerateStaticMeshLODProcess_MeshGeneratorModes`, `GenerateStaticMeshLODProcess_NormalsMethod`, `GenerateStaticMeshLODProcess_SimplifyMethod`, `GenerateStaticMeshLODProjectedHullAxisMode`, `GenerateStaticMeshLODSimpleCollisionGeometryType`

---

## Classes

### `unreal.GenerateStaticMeshLODProcess_CollisionSettings`
Inherits: `StructBase` | Header: `GenerateStaticMeshLODProcess.h`

Generate Static Mesh LODProcess Collision Settings

### `unreal.GenerateStaticMeshLODProcess_NormalsSettings`
Inherits: `StructBase` | Header: `GenerateStaticMeshLODProcess.h`

Generate Static Mesh LODProcess Normals Settings

### `unreal.GenerateStaticMeshLODProcess_PreprocessSettings`
Inherits: `StructBase` | Header: `GenerateStaticMeshLODProcess.h`

Generate Static Mesh LODProcess Preprocess Settings

### `unreal.GenerateStaticMeshLODProcess_SimplifySettings`
Inherits: `StructBase` | Header: `GenerateStaticMeshLODProcess.h`

Generate Static Mesh LODProcess Simplify Settings

### `unreal.GenerateStaticMeshLODProcess_TextureSettings`
Inherits: `StructBase` | Header: `GenerateStaticMeshLODProcess.h`

Generate Static Mesh LODProcess Texture Settings

### `unreal.GenerateStaticMeshLODProcess_UVSettings`
Inherits: `StructBase` | Header: `GenerateStaticMeshLODProcess.h`

Generate Static Mesh LODProcess UVSettings

### `unreal.GenerateStaticMeshLODProcess_UVSettings_PatchBuilder`
Inherits: `StructBase` | Header: `GenerateStaticMeshLODProcess.h`

Generate Static Mesh LODProcess UVSettings Patch Builder

### `unreal.GenerateStaticMeshLODProcessSettings`
Inherits: `StructBase` | Header: `GenerateStaticMeshLODProcess.h`

Generate Static Mesh LODProcess Settings

### `unreal.StaticMeshLODGenerationSettings`
Inherits: `Object` | Header: `LODGenerationSettingsAsset.h`

UStaticMeshLODGenerationSettings is intended to be a stored version of the settings used by UGenerateStaticMeshLODProcess (and the associated UGenerateStaticMeshLODAssetTool). This UObject is exposed ...

### `unreal.StaticMeshLODGenerationSettingsFactory`
Inherits: `Factory` | Header: `LODGenerationSettingsFactory.h`

Asset Factory for UStaticMeshLODGenerationSettings, which is used to save settings for the AutoLOD Tool/Process as an Asset in the Editor

### `unreal.GenerateStaticMeshLODBakeResolution`
Inherits: `EnumBase` | Header: `GenerateStaticMeshLODProcess.h`

EGenerate Static Mesh LODBake Resolution

**Properties** (10):
  - `RESOLUTION1024`: `GenerateStaticMeshLODBakeResolution = Ellipsis` — 1024
  - `RESOLUTION128`: `GenerateStaticMeshLODBakeResolution = Ellipsis` — 128
  - `RESOLUTION16`: `GenerateStaticMeshLODBakeResolution = Ellipsis` — 16
  - `RESOLUTION2048`: `GenerateStaticMeshLODBakeResolution = Ellipsis` — 2048
  - `RESOLUTION256`: `GenerateStaticMeshLODBakeResolution = Ellipsis` — 256
  - `RESOLUTION32`: `GenerateStaticMeshLODBakeResolution = Ellipsis` — 32
  - `RESOLUTION4096`: `GenerateStaticMeshLODBakeResolution = Ellipsis` — 4096
  - `RESOLUTION512`: `GenerateStaticMeshLODBakeResolution = Ellipsis` — 512
  - `RESOLUTION64`: `GenerateStaticMeshLODBakeResolution = Ellipsis` — 64
  - `RESOLUTION8192`: `GenerateStaticMeshLODBakeResolution = Ellipsis` — 8192

### `unreal.GenerateStaticMeshLODProcess_AutoUVMethod`
Inherits: `EnumBase` | Header: `GenerateStaticMeshLODProcess.h`

EGenerate Static Mesh LODProcess Auto UVMethod

**Properties** (3):
  - `PATCH_BUILDER`: `GenerateStaticMeshLODProcess_AutoUVMethod = Ellipsis` — 0
  - `UV_ATLAS`: `GenerateStaticMeshLODProcess_AutoUVMethod = Ellipsis` — 1
  - `X_ATLAS`: `GenerateStaticMeshLODProcess_AutoUVMethod = Ellipsis` — 2

### `unreal.GenerateStaticMeshLODProcess_MeshGeneratorModes`
Inherits: `EnumBase` | Header: `GenerateStaticMeshLODProcess.h`

EGenerate Static Mesh LODProcess Mesh Generator Modes

**Properties** (4):
  - `CLEAN_AND_SIMPLIFY`: `GenerateStaticMeshLODProcess_MeshGeneratorModes = Ellipsis` — Generate a mesh by simplifying input Mesh attributes and filling small holes 2
  - `CONVEX_HULL`: `GenerateStaticMeshLODProcess_MeshGeneratorModes = Ellipsis` — Generate a mesh by calculating the Convex Hull of the input shape 3
  - `SOLIDIFY`: `GenerateStaticMeshLODProcess_MeshGeneratorModes = Ellipsis` — Generate a mesh using Marching Cubes to remesh the input shape.
Use Winding Numbers to determine wha...
  - `SOLIDIFY_AND_CLOSE`: `GenerateStaticMeshLODProcess_MeshGeneratorModes = Ellipsis` — Like Solidify, but Dilate and Contract the shape to delete small
negative features (sharp inner corn...

### `unreal.GenerateStaticMeshLODProcess_NormalsMethod`
Inherits: `EnumBase` | Header: `GenerateStaticMeshLODProcess.h`

EGenerate Static Mesh LODProcess Normals Method

**Properties** (3):
  - `FROM_ANGLE_THRESHOLD`: `GenerateStaticMeshLODProcess_NormalsMethod = Ellipsis` — 0
  - `PER_TRIANGLE`: `GenerateStaticMeshLODProcess_NormalsMethod = Ellipsis` — 2
  - `PER_VERTEX`: `GenerateStaticMeshLODProcess_NormalsMethod = Ellipsis` — 1

### `unreal.GenerateStaticMeshLODProcess_SimplifyMethod`
Inherits: `EnumBase` | Header: `GenerateStaticMeshLODProcess.h`

EGenerate Static Mesh LODProcess Simplify Method

**Properties** (4):
  - `GEOMETRIC_TOLERANCE`: `GenerateStaticMeshLODProcess_SimplifyMethod = Ellipsis` — 3
  - `TRIANGLE_COUNT`: `GenerateStaticMeshLODProcess_SimplifyMethod = Ellipsis` — 0
  - `TRIANGLE_PERCENTAGE`: `GenerateStaticMeshLODProcess_SimplifyMethod = Ellipsis` — 2
  - `VERTEX_COUNT`: `GenerateStaticMeshLODProcess_SimplifyMethod = Ellipsis` — 1

### `unreal.GenerateStaticMeshLODProjectedHullAxisMode`
Inherits: `EnumBase` | Header: `GenerateStaticMeshLODProcess.h`

EGenerate Static Mesh LODProjected Hull Axis Mode

**Properties** (5):
  - `SMALLEST_BOX_DIMENSION`: `GenerateStaticMeshLODProjectedHullAxisMode = Ellipsis` — 3
  - `SMALLEST_VOLUME`: `GenerateStaticMeshLODProjectedHullAxisMode = Ellipsis` — 4
  - `X`: `GenerateStaticMeshLODProjectedHullAxisMode = Ellipsis` — 0
  - `Y`: `GenerateStaticMeshLODProjectedHullAxisMode = Ellipsis` — 1
  - `Z`: `GenerateStaticMeshLODProjectedHullAxisMode = Ellipsis` — 2

### `unreal.GenerateStaticMeshLODSimpleCollisionGeometryType`
Inherits: `EnumBase` | Header: `GenerateStaticMeshLODProcess.h`

EGenerate Static Mesh LODSimple Collision Geometry Type

**Properties** (8):
  - `ALIGNED_BOXES`: `GenerateStaticMeshLODSimpleCollisionGeometryType = Ellipsis` — 0
  - `CAPSULES`: `GenerateStaticMeshLODSimpleCollisionGeometryType = Ellipsis` — 3
  - `CONVEX_HULLS`: `GenerateStaticMeshLODSimpleCollisionGeometryType = Ellipsis` — 4
  - `MINIMAL_SPHERES`: `GenerateStaticMeshLODSimpleCollisionGeometryType = Ellipsis` — 2
  - `MIN_VOLUME`: `GenerateStaticMeshLODSimpleCollisionGeometryType = Ellipsis` — 6
  - `NONE`: `GenerateStaticMeshLODSimpleCollisionGeometryType = Ellipsis` — 7
  - `ORIENTED_BOXES`: `GenerateStaticMeshLODSimpleCollisionGeometryType = Ellipsis` — 1
  - `SWEPT_HULLS`: `GenerateStaticMeshLODSimpleCollisionGeometryType = Ellipsis` — 5
