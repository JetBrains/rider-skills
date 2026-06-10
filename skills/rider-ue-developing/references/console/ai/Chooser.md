# UE Python API — Chooser Module

**12 types** from the `Chooser` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimCurveOverride`, `AnimCurveOverrideList`, `AnimNode_ChooserPlayer`, `ChooserEvaluationContext`, `ChooserPlayerSettings`, `ChooserPropertyBinding`, `ChooserRandomizationContext`, `ChooserStructPropertyBinding`, `ChooserTable`, `FloatAutoPopulator`, `ChooserEvaluationFrequency`, `ObjectChooserResultType`

---

## Classes

### `unreal.AnimCurveOverride`
Inherits: `StructBase` | Header: `AnimNode_ChooserPlayer.h`

Anim Curve Override

**Properties** (2):
  - `curve_name`: `Name` — [Read-Write] Name of curve to override (Name)
  - `curve_value`: `float` — [Read-Write] Value to set to the curve (float)

### `unreal.AnimCurveOverrideList`
Inherits: `StructBase` | Header: `AnimNode_ChooserPlayer.h`

Anim Curve Override List

**Properties** (1):
  - `values`: `None` — [Read-Write] (Array[AnimCurveOverride])

### `unreal.AnimNode_ChooserPlayer`
Inherits: `AnimNode_BlendStack_Standalone` | Header: `AnimNode_ChooserPlayer.h`

Anim Node Chooser Player

**Properties** (3):
  - `blend_space_x`: `float` — [Read-Write] requested blend space blend X parameter (if AnimationAsset is a blend space) (float)
  - `blend_space_y`: `float` — [Read-Write] requested blend space blend Y parameter (if AnimationAsset is a blend space) (float)
  - `default_settings`: `ChooserPlayerSettings` — [Read-Write] Settings when starting an animation - these can be overridden per animation asset by th...

### `unreal.ChooserEvaluationContext`
Inherits: `StructBase` | Header: `IObjectChooser.h`

Chooser Evaluation Context

### `unreal.ChooserPlayerSettings`
Inherits: `StructBase` | Header: `AnimNode_ChooserPlayer.h`

Chooser Player Settings

**Properties** (9):
  - `blend_option`: `AlphaBlendOption` — [Read-Write] How the blend is applied over time to the bones. Common selections are linear, ease in,...
  - `blend_profile`: `BlendProfile` — [Read-Write] Set Blend Profiles (editable in the skeleton) to determine how the blending is distribu...
  - `blend_time`: `float` — [Read-Write] (float)
  - `curve_overrides`: `AnimCurveOverrideList` — [Read-Write] List of curve values to set (AnimCurveOverrideList)
  - `force_looping`: `bool` — [Read-Write] Loop the animation asset, even if the asset is not set as looping (bool)
  - `mirror`: `bool` — [Read-Write] Set this value to mirror animations - the MirrorDataTable must also be set on the AnimN...
  - `playback_rate`: `float` — [Read-Write] playback rate modifier (float)
  - `start_time`: `float` — [Read-Write] Start offset when starting the Animation Asset (float)
  - `use_inertial_blend`: `bool` — [Read-Write] (bool)

### `unreal.ChooserPropertyBinding`
Inherits: `StructBase` | Header: `ChooserPropertyAccess.h`

Chooser Property Binding

### `unreal.ChooserRandomizationContext`
Inherits: `StructBase` | Header: `IChooserParameterRandomize.h`

Chooser Randomization Context

### `unreal.ChooserStructPropertyBinding`
Inherits: `ChooserPropertyBinding` | Header: `ChooserPropertyAccess.h`

Chooser Struct Property Binding

### `unreal.ChooserTable`
Inherits: `Object` | Header: `Chooser.h`

Data table used to choose an asset based on input parameters

### `unreal.FloatAutoPopulator`
Inherits: `Object` | Header: `FloatDistanceColumn.h`

Float Auto Populator

### `unreal.ChooserEvaluationFrequency`
Inherits: `EnumBase` | Header: `AnimNode_ChooserPlayer.h`

EChooser Evaluation Frequency

**Properties** (4):
  - `ON_BECOME_RELEVANT`: `ChooserEvaluationFrequency = Ellipsis` — 1
  - `ON_INITIAL_UPDATE`: `ChooserEvaluationFrequency = Ellipsis` — 0
  - `ON_LOOP`: `ChooserEvaluationFrequency = Ellipsis` — 2
  - `ON_UPDATE`: `ChooserEvaluationFrequency = Ellipsis` — 3

### `unreal.ObjectChooserResultType`
Inherits: `EnumBase` | Header: `IHasContext.h`

EObject Chooser Result Type

**Properties** (2):
  - `CLASS_RESULT`: `ObjectChooserResultType = Ellipsis` — The Chooser returns a Class that is a SubClass of the specified Result Class (eg a chooser could ret...
  - `OBJECT_RESULT`: `ObjectChooserResultType = Ellipsis` — The Chooser returns an Object of the specified Result Class 0
