# UE Python API — VCamCoreEditor Module

**7 types** from the `VCamCoreEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `EditorOnlyModifierFactory`, `EditorOnlyVCamModifier`, `VCamEditorLibrary`, `VCamModifierFactory`, `VCamObjectWithInputFactory`, `VCamStateSwitcherWidgetFactory`, `VCamWidgetFactory`

---

## Classes

### `unreal.EditorOnlyModifierFactory`
Inherits: `VCamObjectWithInputFactory` | Header: `EditorOnlyModifierFactory.h`

Editor Only Modifier Factory

### `unreal.EditorOnlyVCamModifier`
Inherits: `VCamBlueprintModifier` | Header: `EditorOnlyVCamModifier.h`

A modifier that only exists in uncooked builds.

### `unreal.VCamEditorLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `VCamEditorLibrary.h`

VCam Editor Library

**Methods** (1):
  - `get_all_v_cam_components_in_level()` -> `Array [ VCamComponent ]` [classmethod] — Find all loaded VCam Components own by an actor in the world editor. Exclude actor that are pending kill, in PIE, Previe...

### `unreal.VCamModifierFactory`
Inherits: `VCamObjectWithInputFactory` | Header: `VCamModifierFactory.h`

VCam Modifier Factory

### `unreal.VCamObjectWithInputFactory`
Inherits: `Factory` | Header: `VCamObjectWithInputFactory.h`

VCam Object with Input Factory

**Properties** (2):
  - `input_mapping_context`: `InputMappingContext` — [Read-Write] (InputMappingContext)
  - `mapping_priority`: `int` — [Read-Write] (int32)

### `unreal.VCamStateSwitcherWidgetFactory`
Inherits: `VCamWidgetFactory` | Header: `VCamStateSwitcherWidgetFactory.h`

VCam State Switcher Widget Factory

### `unreal.VCamWidgetFactory`
Inherits: `VCamObjectWithInputFactory` | Header: `VCamWidgetFactory.h`

VCam Widget Factory
