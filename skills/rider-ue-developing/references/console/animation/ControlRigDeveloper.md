# UE Python API — ControlRigDeveloper Module

**5 types** from the `ControlRigDeveloper` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ModuleReferenceData`, `AnimGraphNode_ControlRig`, `ControlRigBlueprint`, `ControlRigSchema`, `ControlRigType`

---

## Classes

### `unreal.ModuleReferenceData`
Inherits: `StructBase` | Header: `ControlRigBlueprint.h`

Module Reference Data

### `unreal.AnimGraphNode_ControlRig`
Inherits: `AnimGraphNode_CustomProperty` | Header: `AnimGraphNode_ControlRig.h`

Anim Graph Node Control Rig

### `unreal.ControlRigBlueprint`
Inherits: `RigVMBlueprint` | Header: `ControlRigBlueprint.h`

Control Rig Blueprint

**Methods** (17):
  - `can_turn_into_standalone_rig()` -> `bool` — Can Turn Into Standalone Rig Blueprint
  - `convert_hierarchy_elements_to_spawner_nodes(hierarchy, keys, remove_elements = True)` -> `Array [ RigVMNode ]` — Convert Hierarchy Elements to Spawner Nodes
  - `create_control_rig()` -> `ControlRig` — Create Control Rig
  - `find_references_to_module()` -> `Array [ ModuleReferenceData ]` — Find References to Module
  - `get_control_rig_class()` — Get Control Rig Class
  - `get_currently_open_rig_blueprints()` -> `Array [ ControlRigBlueprint ]` [classmethod] — Get Currently Open Rig Blueprints
  - `get_debugged_control_rig()` -> `ControlRig` — Get Debugged Control Rig
  - `get_hierarchy_controller()` -> `RigHierarchyController` — Get Hierarchy Controller
  - `get_modular_rig_controller()` -> `ModularRigController` — Get Modular Rig Controller
  - `get_preview_mesh()` -> `SkeletalMesh` — Get Preview Mesh
  - `get_rig_module_icon()` -> `Texture2D` — Get Rig Module Icon
  - `is_control_rig_module()` -> `bool` — Is Control Rig Module
  - `recompile_modular_rig()` -> `None` — Recompile Modular Rig
  - `set_preview_mesh(preview_mesh, mark_as_dirty = True)` -> `None` — IInterface_PreviewMeshProvider interface
  - `turn_into_control_rig_module()` -> `bool` — Turn Into Control Rig Module Blueprint
  - `turn_into_standalone_rig()` -> `bool` — Turn Into Standalone Rig Blueprint
  - `update_exposed_module_connectors()` -> `None` — Update Exposed Module Connectors

**Properties** (2):
  - `hierarchy`: `RigHierarchy` [Read-Only] — [Read-Only] (RigHierarchy)
  - `modular_rig_model`: `ModularRigModel` [Read-Only] — [Read-Only] (ModularRigModel)

### `unreal.ControlRigSchema`
Inherits: `RigVMSchema` | Header: `ControlRigSchema.h`

Control Rig Schema

### `unreal.ControlRigType`
Inherits: `EnumBase` | Header: `ControlRigBlueprint.h`

EControl Rig Type

**Properties** (3):
  - `INDEPENDENT_RIG`: `ControlRigType = Ellipsis` — 0
  - `MODULAR_RIG`: `ControlRigType = Ellipsis` — 2
  - `RIG_MODULE`: `ControlRigType = Ellipsis` — 1
