# UE Python API — AnimNextAnimGraphUncookedOnly Module

**6 types** from the `AnimNextAnimGraphUncookedOnly` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimGraphNode_AnimNextGraph`, `AnimNextAnimationGraph_EditorData`, `AnimNextAnimationGraphEntry`, `AnimNextAnimationGraphLibrary`, `AnimNextController`, `AnimNextTraitStackUnitNode`

---

## Classes

### `unreal.AnimGraphNode_AnimNextGraph`
Inherits: `AnimGraphNode_CustomProperty` | Header: `AnimGraphNode_AnimNextGraph.h`

Anim Graph Node Anim Next Graph

### `unreal.AnimNextAnimationGraph_EditorData`
Inherits: `AnimNextDataInterface_EditorData` | Header: `AnimNextAnimationGraph_EditorData.h`

Editor data for AnimNext animation graphs

### `unreal.AnimNextAnimationGraphEntry`
Inherits: `AnimNextRigVMAssetEntry` | Header: `AnimNextAnimationGraphEntry.h`

An Animation Graph entry in an AnimNext module asset

### `unreal.AnimNextAnimationGraphLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AnimNextAnimationGraph_EditorData.h`

Script-callable editor API hoisted onto UAnimNextAnimationGraph

**Methods** (1):
  - `add_animation_graph(asset, name, setup_undo_redo = True, print_python_command = True)` -> `AnimNextAnimationGraphEntry` [classmethod] — Adds an animation graph to an AnimNext asset

### `unreal.AnimNextController`
Inherits: `RigVMController` | Header: `AnimNextController.h`

Implements AnimNext RigVM controller extensions

**Methods** (8):
  - `add_node_to_manifest(model_node, setup_undo_redo = True, print_python_command = False)` -> `bool` — Add Node to Manifest
  - `add_node_to_manifest_by_name(node_name, setup_undo_redo = True, merge_undo_action = False)` -> `bool` — Add Node to Manifest by Name
  - `add_trait_by_name(node_name, new_trait_type_name, pin_index, new_trait_default_value = '', setup_undo_redo = True, print_python_command = False)` -> `Name` — Adds a new Trait to the Stack, with default struct values Returns Trait Instance Name (or NAME_None on failure)
  - `remove_node_from_manifest(model_node, setup_undo_redo = True, print_python_command = False)` -> `bool` — Remove Node from Manifest
  - `remove_node_from_manifest_by_name(node_name, setup_undo_redo = True, print_python_command = False)` -> `bool` — Remove Node from Manifest by Name
  - `remove_trait_by_name(node_name, trait_instance_name, setup_undo_redo = True, print_python_command = False)` -> `bool` — Removes a Trait from the Stack, using Trait Instance Name Returns operation success (true) or failure (false)
  - `set_trait_pin_index(node_name, trait_instance_name, new_pin_index, setup_undo_redo = True, print_python_command = False)` -> `bool` — Move a Trait from its current PinIndex to the specified one (moving it visually in the stack) Returns operation success ...
  - `swap_trait_by_name(node_name, trait_instance_name, current_trait_pin_index, new_trait_type_name, new_trait_default_value = '', setup_undo_redo = True, print_python_command = False)` -> `Name` — Swap a Trait from the Stack with a new one, using existing Trait Instance Name and new Trait Type Name Returns Trait Ins...

### `unreal.AnimNextTraitStackUnitNode`
Inherits: `RigVMUnitNode` | Header: `AnimNextTraitStackUnitNode.h`

Implements AnimNext RigVM unit node extensions for Trait Stacks
