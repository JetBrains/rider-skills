# UE Python API — UserToolBoxBasicCommand Module

**41 types** from the `UserToolBoxBasicCommand` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ActorFilterOptions`, `BindableActionInfo`, `AssignToLayer`, `AssignToLevel`, `BaseActorFilter`, `BaseCompositeCommand`, `BaseCompositeInlineCommand`, `ChangeViewMode`, `CleanHierarchy`, `CompositeCommand`, `CompositeInlineCommand`, `ConsoleVariable`, `EmptyStaticMeshActor`, `EngineCommand`, `ExecuteBindableAction`, `ExecutePythonScript`, `FillStaticMeshActor`, `FlipNormals`, `GetAllDescendants`, `GetNDescendants`, ... (41 total)

---

## Classes

### `unreal.ActorFilterOptions`
Inherits: `StructBase` | Header: `SelectActorByFilter.h`

Actor Filter Options

### `unreal.BindableActionInfo`
Inherits: `StructBase` | Header: `ExecuteBindableAction.h`

Bindable Action Info

### `unreal.AssignToLayer`
Inherits: `UTBBaseCommand` | Header: `AssignToLayer.h`

Assign to Layer

### `unreal.AssignToLevel`
Inherits: `UTBBaseCommand` | Header: `AssignToLevel.h`

Assign to Level

### `unreal.BaseActorFilter`
Inherits: `Object` | Header: `BaseActorFilter.h`

Base Actor Filter

**Methods** (2):
  - `filter(source)` -> `Array [ Actor ]` — Filter
  - `filter_unit(source)` -> `bool` — Filter Unit

### `unreal.BaseCompositeCommand`
Inherits: `UTBBaseCommand` | Header: `BaseCompositeCommand.h`

Base Composite Command

**Properties** (1):
  - `commands`: `None` — [Read-Write] (Array[UTBBaseCommand])

### `unreal.BaseCompositeInlineCommand`
Inherits: `UTBBaseCommand` | Header: `BaseCompositeInlineCommand.h`

Base Composite Inline Command

**Properties** (1):
  - `commands`: `None` — [Read-Write] (Array[UTBBaseCommand])

### `unreal.ChangeViewMode`
Inherits: `UTBBaseCommand` | Header: `ChangeViewMode.h`

Change View Mode

**Properties** (1):
  - `view_mode`: `ViewModeIndex` — [Read-Write] (ViewModeIndex)

### `unreal.CleanHierarchy`
Inherits: `UTBBaseCommand` | Header: `CleanHierarchy.h`

Clean Hierarchy

### `unreal.CompositeCommand`
Inherits: `BaseCompositeCommand` | Header: `CompositeCommand.h`

Composite Command

### `unreal.CompositeInlineCommand`
Inherits: `BaseCompositeInlineCommand` | Header: `CompositeInlineCommand.h`

Composite Inline Command

### `unreal.ConsoleVariable`
Inherits: `UTBBaseCommand` | Header: `ConsoleVariable.h`

Console Variable

**Properties** (1):
  - `console_commands`: `None` — [Read-Write] (Array[str])

### `unreal.EmptyStaticMeshActor`
Inherits: `BaseActorFilter` | Header: `BaseActorFilter.h`

Empty Static Mesh Actor

### `unreal.EngineCommand`
Inherits: `UTBBaseCommand` | Header: `EngineCommand.h`

Engine Command

**Properties** (1):
  - `command`: `str` — [Read-Write] (str)

### `unreal.ExecuteBindableAction`
Inherits: `UTBBaseCommand` | Header: `ExecuteBindableAction.h`

Execute Bindable Action

### `unreal.ExecutePythonScript`
Inherits: `UTBBaseCommand` | Header: `ExecutePythonScript.h`

Execute Python Script

### `unreal.FillStaticMeshActor`
Inherits: `UTBBaseCommand` | Header: `FillStaticMeshActor.h`

Fill Static Mesh Actor

**Properties** (2):
  - `affect_only_empty_static_mesh_actor`: `bool` — [Read-Write] (bool)
  - `root_paths`: `None` — [Read-Write] (Array[str])

### `unreal.FlipNormals`
Inherits: `UTBBaseCommand` | Header: `FlipNormals.h`

Flip Normals

### `unreal.GetAllDescendants`
Inherits: `BaseActorFilter` | Header: `BaseActorFilter.h`

Get All Descendants

### `unreal.GetNDescendants`
Inherits: `BaseActorFilter` | Header: `BaseActorFilter.h`

Get NDescendants

**Properties** (2):
  - `add_intermediaries`: `bool` — [Read-Write] (bool)
  - `n`: `int` — [Read-Write] (int32)

### `unreal.GetParents`
Inherits: `BaseActorFilter` | Header: `BaseActorFilter.h`

Get Parents

### `unreal.HasAttachedActor`
Inherits: `BaseActorFilter` | Header: `BaseActorFilter.h`

Has Attached Actor

### `unreal.HasComponentOfClass`
Inherits: `BaseActorFilter` | Header: `BaseActorFilter.h`

Has Component Of Class

**Properties** (1):
  - `component_class`: `Class` — [Read-Write] (type(Class))

### `unreal.HasMetadataByKey`
Inherits: `BaseActorFilter` | Header: `BaseActorFilter.h`

Has Metadata by Key

**Properties** (1):
  - `key`: `Name` — [Read-Write] (Name)

### `unreal.HasMetadataByKeyAndValue`
Inherits: `BaseActorFilter` | Header: `BaseActorFilter.h`

Has Metadata by Key and Value

**Properties** (2):
  - `key`: `Name` — [Read-Write] (Name)
  - `value`: `str` — [Read-Write] (str)

### `unreal.HasMetadataByKeyAndValueDropDown`
Inherits: `BaseActorFilter` | Header: `BaseActorFilter.h`

Has Metadata by Key and Value Drop Down

### `unreal.IsClassOf`
Inherits: `BaseActorFilter` | Header: `BaseActorFilter.h`

Is Class Of

**Properties** (2):
  - `actor_class`: `Class` — [Read-Write] (type(Class))
  - `child_class`: `bool` — [Read-Write] (bool)

### `unreal.IsolateSelection`
Inherits: `UTBBaseCommand` | Header: `IsolateSelection.h`

Isolate Selection

### `unreal.Merge`
Inherits: `UTBBaseCommand` | Header: `MergeCommand.h`

**Properties** (1):
  - `advanced`: `bool` — [Read-Write] (bool)

### `unreal.MirrorActorCommand`
Inherits: `UTBBaseCommand` | Header: `MirrorActorCommand.h`

Mirror Actor Command

**Properties** (3):
  - `x_axis`: `bool` — [Read-Write] (bool)
  - `y_axis`: `bool` — [Read-Write] (bool)
  - `z_axis`: `bool` — [Read-Write] (bool)

### `unreal.PushComponentMaterialIntoMesh`
Inherits: `UTBBaseCommand` | Header: `PushComponentMaterialIntoMesh.h`

Push Component Material Into Mesh

### `unreal.SelectActorByFilter`
Inherits: `UTBBaseCommand` | Header: `SelectActorByFilter.h`

Select Actor by Filter

**Properties** (2):
  - `apply_to_current_selection`: `bool` [Read-Only] — [Read-Only] (bool)
  - `filter_stack`: `None` — [Read-Write] (Array[ActorFilterOptions])

### `unreal.SelectActorBySize`
Inherits: `UTBBaseCommand` | Header: `SelectActorBySize.h`

Select Actor by Size

**Properties** (1):
  - `size_threshold`: `float` — [Read-Write] (float)

### `unreal.SetHighPrecisionOnMesh`
Inherits: `UTBBaseCommand` | Header: `SetHighPrecisionOnMesh.h`

Set High Precision on Mesh

**Properties** (2):
  - `high_precision_tangent`: `bool` — [Read-Write] (bool)
  - `high_precision_uv`: `bool` — [Read-Write] (bool)

### `unreal.ShowLayersCommand`
Inherits: `UTBBaseCommand` | Header: `ShowLayersCommand.h`

Show Layers Command

**Properties** (2):
  - `isolate`: `bool` — [Read-Write] (bool)
  - `layers`: `None` — [Read-Write] (Array[Name])

### `unreal.TabSpawner`
Inherits: `UTBBaseCommand` | Header: `TabSpawner.h`

Tab Spawner

### `unreal.ToggleCommand`
Inherits: `BaseCompositeCommand` | Header: `ToggleCommand.h`

Toggle Command

### `unreal.ToggleCommandInline`
Inherits: `UTBBaseCommand` | Header: `ToggleCommandInline.h`

Toggle Command Inline

**Properties** (1):
  - `commands`: `None` — [Read-Write] (Array[UTBBaseCommand])

### `unreal.ZoomAll`
Inherits: `UTBBaseCommand` | Header: `ZoomAll.h`

Zoom All

### `unreal.ActorFilterRule`
Inherits: `EnumBase` | Header: `SelectActorByFilter.h`

EActor Filter Rule

**Properties** (4):
  - `ADD`: `ActorFilterRule = Ellipsis` — 0
  - `INTERSECT`: `ActorFilterRule = Ellipsis` — 2
  - `REPLACE`: `ActorFilterRule = Ellipsis` — 4
  - `SUBSTRACT`: `ActorFilterRule = Ellipsis` — 3

### `unreal.ActorFilterSource`
Inherits: `EnumBase` | Header: `SelectActorByFilter.h`

EActor Filter Source

**Properties** (2):
  - `ORIGINAL_SELECTION`: `ActorFilterSource = Ellipsis` — 0
  - `PREVIOUS_RESULT`: `ActorFilterSource = Ellipsis` — 1
