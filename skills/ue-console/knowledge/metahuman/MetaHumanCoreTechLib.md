# UE Python API — MetaHumanCoreTechLib Module

**5 types** from the `MetaHumanCoreTechLib` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AlignmentOptions`, `BlendOptions`, `BodyBlendOptions`, `IdentityErrorCode`, `MetaHumanCharacterBodyFitOptions`

---

## Classes

### `unreal.AlignmentOptions`
Inherits: `EnumBase` | Header: `MetaHumanCharacterIdentity.h`

! the alignment options used when performing FitToTarget

**Properties** (5):
  - `NONE`: `AlignmentOptions = Ellipsis` — 0
  - `ROTATION_TRANSLATION`: `AlignmentOptions = Ellipsis` — 2
  - `SCALING_ROTATION_TRANSLATION`: `AlignmentOptions = Ellipsis` — 4
  - `SCALING_TRANSLATION`: `AlignmentOptions = Ellipsis` — 3
  - `TRANSLATION`: `AlignmentOptions = Ellipsis` — 1

### `unreal.BlendOptions`
Inherits: `EnumBase` | Header: `MetaHumanCharacterIdentity.h`

! the options used when performing Blend

**Properties** (3):
  - `BOTH`: `BlendOptions = Ellipsis` — 2
  - `FEATURES`: `BlendOptions = Ellipsis` — 1
  - `PROPORTIONS`: `BlendOptions = Ellipsis` — 0

### `unreal.BodyBlendOptions`
Inherits: `EnumBase` | Header: `MetaHumanCharacterBodyIdentity.h`

EBody Blend Options

**Properties** (3):
  - `BOTH`: `BodyBlendOptions = Ellipsis` — Blend both skeleton and shaping 2
  - `SHAPE`: `BodyBlendOptions = Ellipsis` — Blend shaping only, keeping skeleton fixed 1
  - `SKELETON`: `BodyBlendOptions = Ellipsis` — Blend skeleton proportions only 0

### `unreal.IdentityErrorCode`
Inherits: `EnumBase` | Header: `MetaHumanIdentityErrorCode.h`

EIdentity Error Code

**Properties** (30):
  - `APPLY_DELTA_DNA`: `IdentityErrorCode = Ellipsis` — 19
  - `APPLY_SCALE_TO_DNA`: `IdentityErrorCode = Ellipsis` — 21
  - `BAD_INPUT_MESH_TOPOLOGY`: `IdentityErrorCode = Ellipsis` — 29
  - `BROWS_FAILED`: `IdentityErrorCode = Ellipsis` — 26
  - `CALCULATE_PCA_MODEL`: `IdentityErrorCode = Ellipsis` — 7
  - `CAMERA_PARAMETERS`: `IdentityErrorCode = Ellipsis` — 9
  - `CAPTURE_DATA_INVALID`: `IdentityErrorCode = Ellipsis` — 24
  - `CREATE_DEBUG_FOLDER`: `IdentityErrorCode = Ellipsis` — 6
  - `CREATE_RIG_FROM_DNA`: `IdentityErrorCode = Ellipsis` — 2
  - `DEPTH_INPUT`: `IdentityErrorCode = Ellipsis` — 11
  - `FIT_EYES_FAILED`: `IdentityErrorCode = Ellipsis` — 28
  - `FIT_PCA`: `IdentityErrorCode = Ellipsis` — 14
  - `FIT_RIGID`: `IdentityErrorCode = Ellipsis` — 13
  - `FIT_TEETH_FAILED`: `IdentityErrorCode = Ellipsis` — 15
  - `INITIALIZATION`: `IdentityErrorCode = Ellipsis` — 8
  - `INVALID_DNA`: `IdentityErrorCode = Ellipsis` — 18
  - `IN_COMPATIBLE_DNA`: `IdentityErrorCode = Ellipsis` — 23
  - `LOAD_BROWS`: `IdentityErrorCode = Ellipsis` — 3
  - `ML_RIG`: `IdentityErrorCode = Ellipsis` — 1
  - `NONE`: `IdentityErrorCode = Ellipsis` — 0
  - `NO_DNA`: `IdentityErrorCode = Ellipsis` — 4
  - `NO_PART`: `IdentityErrorCode = Ellipsis` — 22
  - `NO_POSE`: `IdentityErrorCode = Ellipsis` — 27
  - `NO_TEMPLATE`: `IdentityErrorCode = Ellipsis` — 5
  - `REFINE_TEETH`: `IdentityErrorCode = Ellipsis` — 20
  - `SCAN_INPUT`: `IdentityErrorCode = Ellipsis` — 10
  - `SOLVE_FAILED`: `IdentityErrorCode = Ellipsis` — 25
  - `TEETH_DEPTH_DELTA`: `IdentityErrorCode = Ellipsis` — 16
  - `TEETH_SOURCE`: `IdentityErrorCode = Ellipsis` — 12
  - `UPDATE_RIG_WITH_TEETH`: `IdentityErrorCode = Ellipsis` — 17

### `unreal.MetaHumanCharacterBodyFitOptions`
Inherits: `EnumBase` | Header: `MetaHumanCharacterBodyIdentity.h`

EMeta Human Character Body Fit Options

**Properties** (3):
  - `FIT_FROM_MESH_AND_SKELETON`: `MetaHumanCharacterBodyFitOptions = Ellipsis` — 1
  - `FIT_FROM_MESH_ONLY`: `MetaHumanCharacterBodyFitOptions = Ellipsis` — 0
  - `FIT_FROM_MESH_TO_FIXED_SKELETON`: `MetaHumanCharacterBodyFitOptions = Ellipsis` — 2
