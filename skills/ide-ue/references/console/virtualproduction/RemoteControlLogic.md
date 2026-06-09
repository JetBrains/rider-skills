# UE Python API — RemoteControlLogic Module

**16 types** from the `RemoteControlLogic` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `RCBehaviour`, `RCBehaviourBind`, `RCBehaviourBindNode`, `RCBehaviourBlueprintNode`, `RCBehaviourConditional`, `RCBehaviourConditionalNode`, `RCBehaviourNode`, `RCBehaviourOnValueChangedNode`, `RCBehaviourRangeMapNode`, `RCBehaviourSetAssetByPathNode`, `RCController`, `RCControllerContainer`, `RCExternalTexture`, `RCRangeMapBehaviour`, `RCSetAssetByPathBehaviour`, `RemoteControlLogicTestData`

---

## Classes

### `unreal.RCBehaviour`
Inherits: `Object` | Header: `RCBehaviour.h`

Base class for remote control behaviour.

### `unreal.RCBehaviourBind`
Inherits: `RCBehaviour` | Header: `RCBehaviourBind.h`

[Bind Behaviour]

### `unreal.RCBehaviourBindNode`
Inherits: `RCBehaviourNode` | Header: `RCBehaviourBindNode.h`

Behaviour Node class for Bind Behaviour

**Methods** (3):
  - `execute(behaviour)` -> `bool` — Execute
  - `is_supported(behaviour)` -> `bool` — Is Supported
  - `on_passed(behaviour)` -> `None` — On Passed

### `unreal.RCBehaviourBlueprintNode`
Inherits: `RCBehaviourNode` | Header: `RCBehaviourBlueprintNode.h`

Base blueprint class for behaviour node which holds the logic to execute behaviour

**Methods** (4):
  - `execute(behaviour)` -> `bool` — Execute
  - `is_supported(behaviour)` -> `bool` — Is Supported
  - `on_passed(behaviour)` -> `None` — On Passed
  - `pre_execute(behaviour)` -> `None` — Pre Execute

### `unreal.RCBehaviourConditional`
Inherits: `RCBehaviour` | Header: `RCBehaviourConditional.h`

[Conditional Behaviour]

### `unreal.RCBehaviourConditionalNode`
Inherits: `RCBehaviourNode` | Header: `RCBehaviourConditionalNode.h`

Compares given property value with controller property value

**Methods** (3):
  - `execute(behaviour)` -> `bool` — Execute
  - `is_supported(behaviour)` -> `bool` — Is Supported
  - `on_passed(behaviour)` -> `None` — On Passed

### `unreal.RCBehaviourNode`
Inherits: `Object` | Header: `RCBehaviourNode.h`

Base class for behaviour node which holds the logic to execute behaviour

### `unreal.RCBehaviourOnValueChangedNode`
Inherits: `RCBehaviourNode` | Header: `RCBehaviourOnValueChangedNode.h`

On Value Changed Behaviour Node

**Methods** (2):
  - `execute(behaviour)` -> `bool` — Execute
  - `is_supported(behaviour)` -> `bool` — Is Supported

### `unreal.RCBehaviourRangeMapNode`
Inherits: `RCBehaviourNode` | Header: `RCBehaviourRangeMapNode.h`

Uses the given properties and values to limit the values of the Controller and perform lerp operations for the values.

**Methods** (3):
  - `execute(behaviour)` -> `bool` — Execute
  - `is_supported(behaviour)` -> `bool` — Is Supported
  - `on_passed(behaviour)` -> `None` — On Passed

### `unreal.RCBehaviourSetAssetByPathNode`
Inherits: `RCBehaviourNode` | Header: `RCBehaviourSetAssetByPathNode.h`

Takes the string as a path and goes on to search for the Asset it is connected to, setting it to a Target Exposed Property.

**Methods** (2):
  - `execute(behaviour)` -> `bool` — Execute
  - `is_supported(behaviour)` -> `bool` — Is Supported

### `unreal.RCController`
Inherits: `RCVirtualPropertyInContainer` | Header: `RCController.h`

Remote Control Controller. Container for Behaviours and Actions

### `unreal.RCControllerContainer`
Inherits: `RCVirtualPropertyContainerBase` | Header: `RCControllerContainer.h`

Controller Container which holds all virtual controller properties

### `unreal.RCExternalTexture`
Inherits: `Texture2DDynamic` | Header: `RCExternalTexture.h`

Texture object that automatically loads the content from an external file. The texture object itself does not store anything, except the filename.

### `unreal.RCRangeMapBehaviour`
Inherits: `RCBehaviour` | Header: `RCRangeMapBehaviour.h`

Custom behaviour for Set Asset By Path Logic Behaviour

### `unreal.RCSetAssetByPathBehaviour`
Inherits: `RCBehaviour` | Header: `RCSetAssetByPathBehaviour.h`

Custom behaviour for Set Asset By Path

### `unreal.RemoteControlLogicTestData`
Inherits: `Object` | Header: `RemoteControlLogicTestData.h`

Remote Control Logic Test Data

**Methods** (1):
  - `test_int_function()` -> `None` — Test Int Function

**Properties** (2):
  - `color`: `Color` — [Read-Write] (Color)
  - `test_int`: `int` — [Read-Write] (int32)
