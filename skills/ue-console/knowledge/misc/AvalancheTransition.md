# UE Python API — AvalancheTransition Module

**14 types** from the `AvalancheTransition` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AvaTransitionBehaviorActor`, `AvaTransitionConditionBlueprint`, `AvaTransitionLibrary`, `AvaTransitionPreviewManager`, `AvaTransitionTaskBlueprint`, `AvaTransitionTree`, `AvaTransitionTreeSchema`, `AvaTransitionComparisonResult`, `AvaTransitionInstancingMode`, `AvaTransitionLayerCompareType`, `AvaTransitionLevelHideMode`, `AvaTransitionRunState`, `AvaTransitionSceneType`, `AvaTransitionType`

---

## Classes

### `unreal.AvaTransitionBehaviorActor`
Inherits: `Actor` | Header: `AvaTransitionBehaviorActor.h`

Ava Transition Behavior Actor

### `unreal.AvaTransitionConditionBlueprint`
Inherits: `StateTreeConditionBlueprintBase` | Header: `AvaTransitionConditionBlueprint.h`

Ava Transition Condition Blueprint

### `unreal.AvaTransitionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AvaTransitionLibrary.h`

Ava Transition Library

**Methods** (4):
  - `are_scenes_transitioning(transition_node, layers, scenes_to_ignore)` -> `bool` [classmethod] — Are Scenes Transitioning
  - `get_transition_tree(transition_node)` -> `AvaTransitionTree` [classmethod] — Get Transition Tree
  - `get_transition_type(transition_node)` -> `AvaTransitionType` [classmethod] — Get Transition Type
  - `is_transition_active_in_layer(transition_node, scene_comparison_type, layer_comparison_type, specific_layers)` -> `bool` [classmethod] — Is Transition Active in Layer

### `unreal.AvaTransitionPreviewManager`
Inherits: `Actor` | Header: `AvaTransitionPreviewManager.h`

Actor to preview out Transition Logic via Simple Level Instance Loading and Unloading The Level Instance Loading/Unloading is not set to be

### `unreal.AvaTransitionTaskBlueprint`
Inherits: `StateTreeTaskBlueprintBase` | Header: `AvaTransitionTaskBlueprint.h`

Ava Transition Task Blueprint

### `unreal.AvaTransitionTree`
Inherits: `StateTree` | Header: `AvaTransitionTree.h`

Motion Design Transition Tree is a State Tree with the purpose of executing user-defined logic when thereâs a Transition between multiple scenes in multiple layers.

**Methods** (1):
  - `get_instancing_mode()` -> `AvaTransitionInstancingMode` — Get Instancing Mode

### `unreal.AvaTransitionTreeSchema`
Inherits: `StateTreeSchema` | Header: `AvaTransitionTreeSchema.h`

Ava Transition Tree Schema

### `unreal.AvaTransitionComparisonResult`
Inherits: `EnumBase` | Header: `AvaTransitionEnums.h`

EAva Transition Comparison Result

**Properties** (3):
  - `DIFFERENT`: `AvaTransitionComparisonResult = Ellipsis` — 1
  - `NONE`: `AvaTransitionComparisonResult = Ellipsis` — 0
  - `SAME`: `AvaTransitionComparisonResult = Ellipsis` — 2

### `unreal.AvaTransitionInstancingMode`
Inherits: `EnumBase` | Header: `AvaTransitionEnums.h`

EAva Transition Instancing Mode

**Properties** (2):
  - `NEW`: `AvaTransitionInstancingMode = Ellipsis` — A new scene instance is added to the parent world and exit instance is discarded. 0
  - `REUSE`: `AvaTransitionInstancingMode = Ellipsis` — If previous instance exists, reuse it for the entering behavior. 1

### `unreal.AvaTransitionLayerCompareType`
Inherits: `EnumBase` | Header: `AvaTransitionEnums.h`

EAva Transition Layer Compare Type

**Properties** (4):
  - `ANY`: `AvaTransitionLayerCompareType = Ellipsis` — 4
  - `DIFFERENT`: `AvaTransitionLayerCompareType = Ellipsis` — 2
  - `MATCHING_TAG`: `AvaTransitionLayerCompareType = Ellipsis` — 3
  - `SAME`: `AvaTransitionLayerCompareType = Ellipsis` — 1

### `unreal.AvaTransitionLevelHideMode`
Inherits: `EnumBase` | Header: `AvaTransitionEnums.h`

EAva Transition Level Hide Mode

**Properties** (3):
  - `ALWAYS_HIDE`: `AvaTransitionLevelHideMode = Ellipsis` — Always hide the Levelâs Actors even if itâs re-used 2
  - `HIDE_UNLESS_REUSE`: `AvaTransitionLevelHideMode = Ellipsis` — Hide the Levelâs Actors unless itâs a Level that is re-used 1
  - `NO_HIDE`: `AvaTransitionLevelHideMode = Ellipsis` — Do not hide the Actors of the Level 0

### `unreal.AvaTransitionRunState`
Inherits: `EnumBase` | Header: `AvaTransitionEnums.h`

EAva Transition Run State

**Properties** (2):
  - `FINISHED`: `AvaTransitionRunState = Ellipsis` — 2
  - `RUNNING`: `AvaTransitionRunState = Ellipsis` — 1

### `unreal.AvaTransitionSceneType`
Inherits: `EnumBase` | Header: `AvaTransitionEnums.h`

EAva Transition Scene Type

**Properties** (2):
  - `OTHER`: `AvaTransitionSceneType = Ellipsis` — 1
  - `THIS`: `AvaTransitionSceneType = Ellipsis` — 0

### `unreal.AvaTransitionType`
Inherits: `EnumBase` | Header: `AvaTransitionEnums.h`

EAva Transition Type

**Properties** (2):
  - `IN`: `AvaTransitionType = Ellipsis` — 1
  - `OUT`: `AvaTransitionType = Ellipsis` — 2
