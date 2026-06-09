# UE Python API — DatasmithRuntime Module

**8 types** from the `DatasmithRuntime` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DatasmithRuntimeImportOptions`, `DatasmithRuntimeSourceInfo`, `DatasmithRuntimeActor`, `DatasmithRuntimeLibrary`, `DirectLinkProxy`, `RuntimeMesh`, `BuildHierarchyMethod`, `DatasmithRuntimeChangeEvent`

---

## Classes

### `unreal.DatasmithRuntimeImportOptions`
Inherits: `StructBase` | Header: `DatasmithRuntime.h`

Datasmith Runtime Import Options

**Properties** (5):
  - `build_collisions`: `CollisionEnabled` — [Read-Write] Indicates the type of collision for components
Set to ECollisionEnabled::QueryOnly (spa...
  - `build_hierarchy`: `BuildHierarchyMethod` — [Read-Write] Indicates whether a hierarchy of actors should be built or not.
In the case a hierarchy...
  - `collision_type`: `CollisionTraceFlag` — [Read-Write] Indicates the type of collision for static meshes
Set to ECollisionTraceFlag::CTF_UseCo...
  - `import_meta_data`: `bool` — [Read-Write] Indicates whether meta-data should be imported or not
Meta-data are imported by default...
  - `tessellation_options`: `DatasmithTessellationOptions` — [Read-Write] Tessellation options for CAD import (DatasmithTessellationOptions)

### `unreal.DatasmithRuntimeSourceInfo`
Inherits: `StructBase` | Header: `DatasmithRuntimeBlueprintLibrary.h`

Datasmith Runtime Source Info

**Properties** (1):
  - `name`: `str` — [Read-Write] (str)

### `unreal.DatasmithRuntimeActor`
Inherits: `Actor` | Header: `DatasmithRuntime.h`

Datasmith Runtime Actor

**Methods** (9):
  - `close_connection()` -> `None` — Close Connection
  - `get_destination_name()` -> `str` — Get Destination Name
  - `get_source_index()` -> `int32` — Get Source Index
  - `get_source_name()` -> `str` — Get Source Name
  - `is_connected()` -> `bool` — End ISceneChangeListener interface
  - `is_receiving()` -> `bool` — Is Receiving
  - `load_file(file_path)` -> `bool` — Load File
  - `open_connection_with_index(source_index)` -> `bool` — Open Connection with Index
  - `reset()` -> `None` — Reset

**Properties** (5):
  - `building`: `bool` [Read-Only] — [Read-Only] (bool)
  - `external_file`: `str` [Read-Only] — [Read-Only] (str)
  - `import_options`: `DatasmithRuntimeImportOptions` — [Read-Write] (DatasmithRuntimeImportOptions)
  - `loaded_scene`: `str` [Read-Only] — [Read-Only] (str)
  - `progress`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.DatasmithRuntimeLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `DatasmithRuntimeBlueprintLibrary.h`

Datasmith Runtime Library

**Methods** (4):
  - `get_direct_link_proxy()` -> `DirectLinkProxy` [classmethod] — Returns an interface to the DirectLink end point
  - `load_file(datasmith_runtime_actor, file_path)` -> `bool` [classmethod] — Load a file using the Datasmith translator associated with it
  - `load_file_from_explorer(datasmith_runtime_actor, default_path)` -> `bool` [classmethod] — Open a file browser to select a file and call LoadFile with the selected file
  - `reset_actor(datasmith_runtime_actor)` -> `None` [classmethod] — Reset Actor

### `unreal.DirectLinkProxy`
Inherits: `Object` | Header: `DatasmithRuntimeBlueprintLibrary.h`

Class to interface with the DirectLink end point

**Methods** (2):
  - `get_end_point_name()` -> `str` — Get End Point Name
  - `get_list_of_sources()` -> `Array [ DatasmithRuntimeSourceInfo ]` — Get List Of Sources

**Properties** (1):
  - `on_direct_link_change`: `DatasmithRuntimeChangeEvent` — [Read-Write] Dynamic delegate used to trigger an event in the Game when there is
a change in the Dir...

### `unreal.RuntimeMesh`
Inherits: `StaticMesh` | Header: `DatasmithRuntimeUtils.h`

Class deriving from UStaticMesh to allow the cooking of collision meshes at runtime To do so, bAllowCPUAccess must be true AND the metod GetWorld() must return a valid world

### `unreal.BuildHierarchyMethod`
Inherits: `EnumBase` | Header: `DatasmithRuntime.h`

EBuild Hierarchy Method

**Properties** (3):
  - `NONE`: `BuildHierarchyMethod = Ellipsis` — 0
  - `SIMPLIFIED`: `BuildHierarchyMethod = Ellipsis` — 1
  - `UNFILTERED`: `BuildHierarchyMethod = Ellipsis` — 2

### `unreal.DatasmithRuntimeChangeEvent`
Inherits: `MulticastDelegateBase` | Header: `DatasmithRuntimeBlueprintLibrary.h`

Datasmith Runtime Change Event Delegate Signature
