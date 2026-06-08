# UE Python API — FractureEngine Module

**9 types** from the `FractureEngine` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `FixTinyGeoGeometrySelectionMethod`, `FixTinyGeoMergeType`, `FixTinyGeoNeighborSelectionMethod`, `FixTinyGeoUseBoneSelection`, `FractureBrickBondEnum`, `MeshCutterCutDistribution`, `MeshCutterPerCutMeshSelection`, `NonUniformSamplingDistributionMode`, `NonUniformSamplingWeightMode`

---

## Classes

### `unreal.FixTinyGeoGeometrySelectionMethod`
Inherits: `EnumBase` | Header: `FractureEngineUtility.h`

EFix Tiny Geo Geometry Selection Method

**Properties** (2):
  - `RELATIVE_VOLUME`: `FixTinyGeoGeometrySelectionMethod = Ellipsis` — Select by cube root of volume relative to the overall shapeâs cube root of volume 1
  - `VOLUME_CUBE_ROOT`: `FixTinyGeoGeometrySelectionMethod = Ellipsis` — Select by cube root of volume 0

### `unreal.FixTinyGeoMergeType`
Inherits: `EnumBase` | Header: `FractureEngineUtility.h`

EFix Tiny Geo Merge Type

**Properties** (2):
  - `MERGE_CLUSTERS`: `FixTinyGeoMergeType = Ellipsis` — 1
  - `MERGE_GEOMETRY`: `FixTinyGeoMergeType = Ellipsis` — 0

### `unreal.FixTinyGeoNeighborSelectionMethod`
Inherits: `EnumBase` | Header: `FractureEngineUtility.h`

EFix Tiny Geo Neighbor Selection Method

**Properties** (2):
  - `LARGEST_NEIGHBOR`: `FixTinyGeoNeighborSelectionMethod = Ellipsis` — Merge to the neighbor with the largest volume 0
  - `NEAREST_CENTER`: `FixTinyGeoNeighborSelectionMethod = Ellipsis` — Merge to the neighbor with the closest center 1

### `unreal.FixTinyGeoUseBoneSelection`
Inherits: `EnumBase` | Header: `FractureEngineUtility.h`

EFix Tiny Geo Use Bone Selection

**Properties** (3):
  - `ALSO_MERGE_SELECTED`: `FixTinyGeoUseBoneSelection = Ellipsis` — 1
  - `NO_EFFECT`: `FixTinyGeoUseBoneSelection = Ellipsis` — 0
  - `ONLY_MERGE_SELECTED`: `FixTinyGeoUseBoneSelection = Ellipsis` — 2

### `unreal.FractureBrickBondEnum`
Inherits: `EnumBase` | Header: `FractureEngineFracturing.h`

EFracture Brick Bond Enum

**Properties** (5):
  - `DATAFLOW_FRACTURE_BRICK_BOND_ENGLISH`: `FractureBrickBondEnum = Ellipsis` — 2
  - `DATAFLOW_FRACTURE_BRICK_BOND_FLEMISH`: `FractureBrickBondEnum = Ellipsis` — 4
  - `DATAFLOW_FRACTURE_BRICK_BOND_HEADER`: `FractureBrickBondEnum = Ellipsis` — 3
  - `DATAFLOW_FRACTURE_BRICK_BOND_STACK`: `FractureBrickBondEnum = Ellipsis` — 1
  - `DATAFLOW_FRACTURE_BRICK_BOND_STRETCHER`: `FractureBrickBondEnum = Ellipsis` — 0

### `unreal.MeshCutterCutDistribution`
Inherits: `EnumBase` | Header: `FractureEngineFracturing.h`

EMesh Cutter Cut Distribution

**Properties** (3):
  - `GRID`: `MeshCutterCutDistribution = Ellipsis` — Arrange the cutting mesh in a regular grid pattern 2
  - `SINGLE_CUT`: `MeshCutterCutDistribution = Ellipsis` — Cut only once, at the cutting meshâs current location in the level 0
  - `UNIFORM_RANDOM`: `MeshCutterCutDistribution = Ellipsis` — Scatter the cutting mesh in a uniform random distribution around the geometry bounding box 1

### `unreal.MeshCutterPerCutMeshSelection`
Inherits: `EnumBase` | Header: `FractureEngineFracturing.h`

EMesh Cutter Per Cut Mesh Selection

**Properties** (3):
  - `ALL`: `MeshCutterPerCutMeshSelection = Ellipsis` — Use all cut meshes for every cut 0
  - `RANDOM`: `MeshCutterPerCutMeshSelection = Ellipsis` — Choose which cut mesh to use from the mesh array randomly, per cut 1
  - `SEQUENTIAL`: `MeshCutterPerCutMeshSelection = Ellipsis` — Choose which cut mesh to use from the mesh array sequentially, starting with the first mesh and cycl...

### `unreal.NonUniformSamplingDistributionMode`
Inherits: `EnumBase` | Header: `FractureEngineSampling.h`

ENon Uniform Sampling Distribution Mode

**Properties** (3):
  - `E_NON_UNIFORM_SAMPLING_DISTRIBUTION_MODE_LARGER`: `NonUniformSamplingDistributionMode = Ellipsis` — Distribution is weighted towards larger points 2
  - `E_NON_UNIFORM_SAMPLING_DISTRIBUTION_MODE_SMALLER`: `NonUniformSamplingDistributionMode = Ellipsis` — Distribution is weighted towards smaller points 1
  - `E_NON_UNIFORM_SAMPLING_DISTRIBUTION_MODE_UNIFORM`: `NonUniformSamplingDistributionMode = Ellipsis` — Uniform distribution of sizes, ie all equally likely 0

### `unreal.NonUniformSamplingWeightMode`
Inherits: `EnumBase` | Header: `FractureEngineSampling.h`

ENon Uniform Sampling Weight Mode

**Properties** (3):
  - `E_NON_UNIFORM_SAMPLING_WEIGHT_MODE_FILLED_WEIGHT_TO_RADIUS`: `NonUniformSamplingWeightMode = Ellipsis` — Weights are clamped to [0,1] and used to interpolate Min/Max Radius, with decay, so that smaller-rad...
  - `E_NON_UNIFORM_SAMPLING_WEIGHT_MODE_WEIGHTED_RANDOM`: `NonUniformSamplingWeightMode = Ellipsis` — Weight is used to create nonuniform random sampling, ie it nudges the random sample-radius distribut...
  - `E_NON_UNIFORM_SAMPLING_WEIGHT_MODE_WEIGHT_TO_RADIUS`: `NonUniformSamplingWeightMode = Ellipsis` — Weights are clamped to [0,1] and used to interpolate Min/Max Radius. This is a âhard constraintâ...
