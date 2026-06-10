# UE Python API — RigLogicModule Module

**25 types** from the `RigLogicModule` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimNode_RigLogic`, `CoordinateSystem`, `MeshBlendShapeChannelMapping`, `RigLogicConfiguration`, `RigUnit_RigLogic`, `TextureCoordinate`, `VertexLayout`, `DNAAsset`, `ActivationFunction`, `Archetype`, `AutomaticRadius`, `Direction`, `DNADataLayer`, `Gender`, `RigLogicCalculationType`, `RigLogicRotationOrder`, `RigLogicRotationType`, `RigLogicScaleType`, `RigLogicTranslationType`, `RotationRepresentation`, ... (25 total)

---

## Classes

### `unreal.AnimNode_RigLogic`
Inherits: `AnimNode_Base` | Header: `AnimNode_RigLogic.h`

Anim Node Rig Logic

**Properties** (2):
  - `anim_sequence`: `PoseLink` — [Read-Write] (PoseLink)
  - `cache_anim_curve_names`: `bool` — [Read-Write] * Since the order of anim curves may change even on a frame by frame basis, it is not s...

### `unreal.CoordinateSystem`
Inherits: `StructBase` | Header: `DNACommon.h`

Coordinate System

**Properties** (3):
  - `x_axis`: `Direction` [Read-Only] — [Read-Only] (Direction)
  - `y_axis`: `Direction` [Read-Only] — [Read-Only] (Direction)
  - `z_axis`: `Direction` [Read-Only] — [Read-Only] (Direction)

### `unreal.MeshBlendShapeChannelMapping`
Inherits: `StructBase` | Header: `DNACommon.h`

Mesh Blend Shape Channel Mapping

**Properties** (2):
  - `blend_shape_channel_index`: `int` [Read-Only] — [Read-Only] (int32)
  - `mesh_index`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.RigLogicConfiguration`
Inherits: `StructBase` | Header: `RigLogic.h`

Rig Logic Configuration

**Properties** (14):
  - `calculation_type`: `RigLogicCalculationType` [Read-Only] — [Read-Only] (RigLogicCalculationType)
  - `load_animated_maps`: `bool` — [Read-Write] (bool)
  - `load_blend_shapes`: `bool` — [Read-Write] (bool)
  - `load_joints`: `bool` — [Read-Write] (bool)
  - `load_machine_learned_behavior`: `bool` — [Read-Write] (bool)
  - `load_rbf_behavior`: `bool` — [Read-Write] (bool)
  - `load_twist_swing_behavior`: `bool` — [Read-Write] (bool)
  - `rotation_order`: `RigLogicRotationOrder` [Read-Only] — [Read-Only] (RigLogicRotationOrder)
  - `rotation_pruning_threshold`: `float` — [Read-Write] The joint rotation pruning threshold is used to eliminate joint rotation deltas below
t...
  - `rotation_type`: `RigLogicRotationType` [Read-Only] — [Read-Only] (RigLogicRotationType)
  - `scale_pruning_threshold`: `float` — [Read-Write] The joint scale pruning threshold is used to eliminate joint scale deltas below
the spe...
  - `scale_type`: `RigLogicScaleType` [Read-Only] — [Read-Only] (RigLogicScaleType)
  - `translation_pruning_threshold`: `float` — [Read-Write] The joint translation pruning threshold is used to eliminate joint translation deltas b...
  - `translation_type`: `RigLogicTranslationType` [Read-Only] — [Read-Only] (RigLogicTranslationType)

### `unreal.RigUnit_RigLogic`
Inherits: `RigUnitMutable` | Header: `RigUnit_RigLogic.h`

RigLogic is used to translate control input curves into bone transforms and values for blend shape and animated map multiplier curves

### `unreal.TextureCoordinate`
Inherits: `StructBase` | Header: `DNACommon.h`

Texture Coordinate

**Properties** (2):
  - `u`: `float` [Read-Only] — [Read-Only] (float)
  - `v`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.VertexLayout`
Inherits: `StructBase` | Header: `DNACommon.h`

Vertex Layout

**Properties** (3):
  - `normal`: `int` [Read-Only] — [Read-Only] (int32)
  - `position`: `int` [Read-Only] — [Read-Only] (int32)
  - `texture_coordinate`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.DNAAsset`
Inherits: `AssetUserData` | Header: `DNAAsset.h`

An asset holding the data needed to generate/update/animate a RigLogic character It is imported from characterâs DNA file as a bit stream, and separated out it into runtime (behavior) and design-tim...

**Properties** (2):
  - `meta_data`: `None` — [Read-Write] Collection of runtime metadata related to a specific character.
The value field is a FS...
  - `rig_logic_configuration`: `RigLogicConfiguration` — [Read-Write] (RigLogicConfiguration)

### `unreal.ActivationFunction`
Inherits: `EnumBase` | Header: `DNACommon.h`

EActivation Function

**Properties** (5):
  - `LEAKY_RE_LU`: `ActivationFunction = Ellipsis` — 2
  - `LINEAR`: `ActivationFunction = Ellipsis` — 0
  - `RE_LU`: `ActivationFunction = Ellipsis` — 1
  - `SIGMOID`: `ActivationFunction = Ellipsis` — 4
  - `TANH`: `ActivationFunction = Ellipsis` — 3

### `unreal.Archetype`
Inherits: `EnumBase` | Header: `DNACommon.h`

EArchetype

**Properties** (6):
  - `ALIEN`: `Archetype = Ellipsis` — 4
  - `ASIAN`: `Archetype = Ellipsis` — 0
  - `BLACK`: `Archetype = Ellipsis` — 1
  - `CAUCASIAN`: `Archetype = Ellipsis` — 2
  - `HISPANIC`: `Archetype = Ellipsis` — 3
  - `OTHER`: `Archetype = Ellipsis` — 5

### `unreal.AutomaticRadius`
Inherits: `EnumBase` | Header: `DNACommon.h`

UENUM(BlueprintType) enum class ERBFSolverType : uint8 {

**Properties** (2):
  - `OFF`: `AutomaticRadius = Ellipsis` — 1
  - `ON`: `AutomaticRadius = Ellipsis` — 0

### `unreal.Direction`
Inherits: `EnumBase` | Header: `DNACommon.h`

EDirection

**Properties** (6):
  - `BACK`: `Direction = Ellipsis` — 5
  - `DOWN`: `Direction = Ellipsis` — 3
  - `FRONT`: `Direction = Ellipsis` — 4
  - `LEFT`: `Direction = Ellipsis` — 0
  - `RIGHT`: `Direction = Ellipsis` — 1
  - `UP`: `Direction = Ellipsis` — 2

### `unreal.DNADataLayer`
Inherits: `EnumBase` | Header: `DNACommon.h`

EDNAData Layer

**Properties** (9):
  - `ALL`: `DNADataLayer = Ellipsis` — Implicitly loads Behavior and all body-rig related layers 111
  - `BEHAVIOR`: `DNADataLayer = Ellipsis` — Implicitly loads Descriptor 7
  - `DEFINITION`: `DNADataLayer = Ellipsis` — 3
  - `DESCRIPTOR`: `DNADataLayer = Ellipsis` — 1
  - `GEOMETRY`: `DNADataLayer = Ellipsis` — Implicitly loads Descriptor and Definition 11
  - `GEOMETRY_WITHOUT_BLEND_SHAPES`: `DNADataLayer = Ellipsis` — Implicitly loads Descriptor and Definition 19
  - `MACHINE_LEARNED_BEHAVIOR`: `DNADataLayer = Ellipsis` — Implicitly loads Descriptor and Definition 35
  - `NONE`: `DNADataLayer = Ellipsis` — 0
  - `RBF_BEHAVIOR`: `DNADataLayer = Ellipsis` — Implicitly loads Definition 71

### `unreal.Gender`
Inherits: `EnumBase` | Header: `DNACommon.h`

EGender

**Properties** (3):
  - `FEMALE`: `Gender = Ellipsis` — 1
  - `MALE`: `Gender = Ellipsis` — 0
  - `OTHER`: `Gender = Ellipsis` — 2

### `unreal.RigLogicCalculationType`
Inherits: `EnumBase` | Header: `RigLogic.h`

namespace rl4

**Properties** (5):
  - `ANY_VECTOR`: `RigLogicCalculationType = Ellipsis` — 4
  - `AVX`: `RigLogicCalculationType = Ellipsis` — 2
  - `NEON`: `RigLogicCalculationType = Ellipsis` — 3
  - `SCALAR`: `RigLogicCalculationType = Ellipsis` — 0
  - `SSE`: `RigLogicCalculationType = Ellipsis` — 1

### `unreal.RigLogicRotationOrder`
Inherits: `EnumBase` | Header: `RigLogic.h`

ERig Logic Rotation Order

**Properties** (6):
  - `XYZ`: `RigLogicRotationOrder = Ellipsis` — 0
  - `XZY`: `RigLogicRotationOrder = Ellipsis` — 1
  - `YXZ`: `RigLogicRotationOrder = Ellipsis` — 2
  - `YZX`: `RigLogicRotationOrder = Ellipsis` — 3
  - `ZXY`: `RigLogicRotationOrder = Ellipsis` — 4
  - `ZYX`: `RigLogicRotationOrder = Ellipsis` — 5

### `unreal.RigLogicRotationType`
Inherits: `EnumBase` | Header: `RigLogic.h`

ERig Logic Rotation Type

**Properties** (3):
  - `EULER_ANGLES`: `RigLogicRotationType = Ellipsis` — 3
  - `NONE`: `RigLogicRotationType = Ellipsis` — 0
  - `QUATERNIONS`: `RigLogicRotationType = Ellipsis` — 4

### `unreal.RigLogicScaleType`
Inherits: `EnumBase` | Header: `RigLogic.h`

ERig Logic Scale Type

**Properties** (2):
  - `NONE`: `RigLogicScaleType = Ellipsis` — 0
  - `VECTOR`: `RigLogicScaleType = Ellipsis` — 3

### `unreal.RigLogicTranslationType`
Inherits: `EnumBase` | Header: `RigLogic.h`

ERig Logic Translation Type

**Properties** (2):
  - `NONE`: `RigLogicTranslationType = Ellipsis` — 0
  - `VECTOR`: `RigLogicTranslationType = Ellipsis` — 3

### `unreal.RotationRepresentation`
Inherits: `EnumBase` | Header: `DNACommon.h`

ERotation Representation

**Properties** (2):
  - `EULER_ANGLES`: `RotationRepresentation = Ellipsis` — 0
  - `QUATERNION`: `RotationRepresentation = Ellipsis` — 1

### `unreal.RotationUnit`
Inherits: `EnumBase` | Header: `DNACommon.h`

ERotation Unit

**Properties** (2):
  - `DEGREES`: `RotationUnit = Ellipsis` — 0
  - `RADIANS`: `RotationUnit = Ellipsis` — 1

### `unreal.ScaleRepresentation`
Inherits: `EnumBase` | Header: `DNACommon.h`

EScale Representation

**Properties** (1):
  - `VECTOR`: `ScaleRepresentation = Ellipsis` — 0

### `unreal.TranslationRepresentation`
Inherits: `EnumBase` | Header: `DNACommon.h`

ETranslation Representation

**Properties** (1):
  - `VECTOR`: `TranslationRepresentation = Ellipsis` — 0

### `unreal.TranslationUnit`
Inherits: `EnumBase` | Header: `DNACommon.h`

ETranslation Unit

**Properties** (2):
  - `CM`: `TranslationUnit = Ellipsis` — 0
  - `M`: `TranslationUnit = Ellipsis` — 1

### `unreal.TwistAxis`
Inherits: `EnumBase` | Header: `DNACommon.h`

ETwist Axis

**Properties** (3):
  - `X`: `TwistAxis = Ellipsis` — 0
  - `Y`: `TwistAxis = Ellipsis` — 1
  - `Z`: `TwistAxis = Ellipsis` — 2
