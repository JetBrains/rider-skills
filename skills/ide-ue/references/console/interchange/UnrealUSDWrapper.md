# UE Python API — UnrealUSDWrapper Module

**7 types** from the `UnrealUSDWrapper` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `Matrix2D`, `Matrix3D`, `GeometryCacheImport`, `UsdCollisionType`, `UsdInitialLoadSet`, `UsdInterpolationType`, `UsdRootMotionHandling`

---

## Classes

### `unreal.Matrix2D`
Inherits: `StructBase` | Header: `UnrealUSDWrapper.h`

Corresponds to pxr::GfMatrix2d. We donât expose any methods though, this is just to facilitate reading/writing these types from USD.

**Properties** (2):
  - `row0`: `Vector2D` — [Read-Write] (Vector2D)
  - `row1`: `Vector2D` — [Read-Write] (Vector2D)

### `unreal.Matrix3D`
Inherits: `StructBase` | Header: `UnrealUSDWrapper.h`

Corresponds to pxr::GfMatrix3d. We donât expose any methods though, this is just to facilitate reading/writing these types from USD.

**Properties** (3):
  - `row0`: `Vector` — [Read-Write] (Vector)
  - `row1`: `Vector` — [Read-Write] (Vector)
  - `row2`: `Vector` — [Read-Write] (Vector)

### `unreal.GeometryCacheImport`
Inherits: `EnumBase` | Header: `UnrealUSDWrapper.h`

Stage option on how to handle geometry caches in stage workflow

**Properties** (3):
  - `NEVER`: `GeometryCacheImport = Ellipsis` — Never imported (no persistent assets); always streamed from the USD stage 0
  - `ON_LOAD`: `GeometryCacheImport = Ellipsis` — Imported on stage load; played back from the persistent assets 1
  - `ON_SAVE`: `GeometryCacheImport = Ellipsis` — Imported on save; geometry caches are streamed from the stage until they are saved.
Afterwards they ...

### `unreal.UsdCollisionType`
Inherits: `EnumBase` | Header: `UnrealUSDWrapper.h`

EUsd Collision Type

**Properties** (8):
  - `CAPSULE`: `UsdCollisionType = Ellipsis` — 6
  - `CONVEX_DECOMPOSITION`: `UsdCollisionType = Ellipsis` — no approximation so equivalent to CTF_UseComplexAsSimple 1
  - `CONVEX_HULL`: `UsdCollisionType = Ellipsis` — 2
  - `CUBE`: `UsdCollisionType = Ellipsis` — 4
  - `CUSTOM_MESH`: `UsdCollisionType = Ellipsis` — 7
  - `MESH_SIMPLIFICATION`: `UsdCollisionType = Ellipsis` — 5
  - `NONE`: `UsdCollisionType = Ellipsis` — 0
  - `SPHERE`: `UsdCollisionType = Ellipsis` — 3

### `unreal.UsdInitialLoadSet`
Inherits: `EnumBase` | Header: `UnrealUSDWrapper.h`

EUsd Initial Load Set

**Properties** (2):
  - `LOAD_ALL`: `UsdInitialLoadSet = Ellipsis` — 0
  - `LOAD_NONE`: `UsdInitialLoadSet = Ellipsis` — 1

### `unreal.UsdInterpolationType`
Inherits: `EnumBase` | Header: `UnrealUSDWrapper.h`

EUsd Interpolation Type

**Properties** (2):
  - `HELD`: `UsdInterpolationType = Ellipsis` — 0
  - `LINEAR`: `UsdInterpolationType = Ellipsis` — 1

### `unreal.UsdRootMotionHandling`
Inherits: `EnumBase` | Header: `UnrealUSDWrapper.h`

EUsd Root Motion Handling

**Properties** (3):
  - `NO_ADDITIONAL_ROOT_MOTION`: `UsdRootMotionHandling = Ellipsis` — Use for the root bone just its regular joint animation as described on the SkelAnimation prim. 0
  - `USE_MOTION_FROM_SKELETON`: `UsdRootMotionHandling = Ellipsis` — Use the transform animation from the Skeleton prim in addition to the root bone joint animation as
d...
  - `USE_MOTION_FROM_SKEL_ROOT`: `UsdRootMotionHandling = Ellipsis` — Use the transform animation from the SkelRoot prim in addition to the root bone joint animation as
d...
