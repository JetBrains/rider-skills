# UE Python API — LevelSnapshotFilters Module

**33 types** from the `LevelSnapshotFilters` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `IsActorValidParams`, `IsAddedActorValidParams`, `IsAddedComponentValidParams`, `IsDeletedActorValidParams`, `IsDeletedComponentValidParams`, `IsPropertyValidParams`, `PropertyContainerHandle`, `ActorChangedTransformFilter`, `ActorDependentPropertyFilter`, `ActorHasTagFilter`, `ActorInMapFilter`, `ActorSelectorFilter`, `AndFilter`, `ConstantFilter`, `FilterBlueprintFunctionLibrary`, `LambdaFilter`, `LevelSnapshotBlueprintFilter`, `LevelSnapshotFilter`, `NegationFilter`, `OrFilter`, ... (33 total)

---

## Classes

### `unreal.IsActorValidParams`
Inherits: `StructBase` | Header: `LevelSnapshotFilterParams.h`

Is Actor Valid Params

**Properties** (2):
  - `level_actor`: `Actor` — it exists in the world (Actor) [Read-Write] The actor equivalent to LevelActor
  - `snapshot_actor`: `Actor` — [Read-Write] The actor saved in the snapshot (Actor)

### `unreal.IsAddedActorValidParams`
Inherits: `StructBase` | Header: `LevelSnapshotFilterParams.h`

Is Added Actor Valid Params

**Properties** (1):
  - `new_actor`: `Actor` [Read-Only] — [Read-Only] This actor was added to the level since the snapshot was taken. (Actor)

### `unreal.IsAddedComponentValidParams`
Inherits: `StructBase` | Header: `LevelSnapshotFilterParams.h`

Is Added Component Valid Params

**Properties** (1):
  - `added_component`: `ActorComponent` [Read-Only] — [Read-Only] This component was added to the actor. This is an instance in the editor world. (ActorCo...

### `unreal.IsDeletedActorValidParams`
Inherits: `StructBase` | Header: `LevelSnapshotFilterParams.h`

Is Deleted Actor Valid Params

**Properties** (1):
  - `saved_actor_path`: `SoftObjectPath` [Read-Only] — [Read-Only] Holds path info for an actor that was deleted since the snapshot was taken.
Contains the...

### `unreal.IsDeletedComponentValidParams`
Inherits: `StructBase` | Header: `LevelSnapshotFilterParams.h`

Is Deleted Component Valid Params

**Properties** (2):
  - `deleted_component`: `ActorComponent` [Read-Only] — [Read-Only] This component was removed from the actor. This instance exists in a transient snapshot ...
  - `editor_actor`: `Actor` [Read-Only] — [Read-Only] The actor the component was removed from; This instance exists in the editor world. (Act...

### `unreal.IsPropertyValidParams`
Inherits: `StructBase` | Header: `LevelSnapshotFilterParams.h`

Is Property Valid Params

**Properties** (6):
  - `level_actor`: `Actor` [Read-Only] — it exists in the world (Actor) [Read-Only] The actor equivalent to LevelActor
  - `level_property_containers`: `PropertyContainerHandle` [Read-Only] — [Read-Only] For passing to FProperty::ContainerPtrToValuePtr. This is either LevelPropertyContainers...
  - `property_`: `FieldPath` [Read-Only] — [Read-Only] The property that we may want to rollback. (FieldPath)
  - `property_path`: `None` [Read-Only] — [Read-Only] Each elements is the name of a subobject name leading to this property. The last element...
  - `snapshot_actor`: `Actor` [Read-Only] — [Read-Only] The actor saved in the snapshot (Actor)
  - `snapshot_property_container`: `PropertyContainerHandle` [Read-Only] — [Read-Only] For passing to FProperty::ContainerPtrToValuePtr. This is either SnapshotActor or a subo...

### `unreal.PropertyContainerHandle`
Inherits: `StructBase` | Header: `PropertyContainerHandle.h`

Blueprint wrapper for FProperty containers

### `unreal.ActorChangedTransformFilter`
Inherits: `ActorSelectorFilter` | Header: `ActorChangedTransformFilter.h`

Allows an actor depending on whether the actorsâ transforms have changed. Use case: You want detect whether an actor has changed its transform.

### `unreal.ActorDependentPropertyFilter`
Inherits: `LevelSnapshotFilter` | Header: `ActorDependentPropertyFilter.h`

### `unreal.ActorHasTagFilter`
Inherits: `ActorSelectorFilter` | Header: `ActorHasTagFilter.h`

Allows an actor if it has all or any of the specified tags.

### `unreal.ActorInMapFilter`
Inherits: `ActorSelectorFilter` | Header: `ActorInMapFilter.h`

Allows an actor if it belongs to the specified map.

### `unreal.ActorSelectorFilter`
Inherits: `LevelSnapshotBlueprintFilter` | Header: `ActorSelectorFilter.h`

Base class for filters that only implement IsActorValid

### `unreal.AndFilter`
Inherits: `ParentFilter` | Header: `AndFilter.h`

And Filter

### `unreal.ConstantFilter`
Inherits: `LevelSnapshotFilter` | Header: `ConstantFilter.h`

Filter which treats all actors the same.

### `unreal.FilterBlueprintFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `FilterBlueprintFunctionLibrary.h`

Filter Blueprint Function Library

**Methods** (1):
  - `create_filter_by_class(class_, name = 'None', outer = None)` -> `LevelSnapshotFilter` [classmethod] — Create Filter by Class

### `unreal.LambdaFilter`
Inherits: `LevelSnapshotFilter` | Header: `LambdaFilter.h`

Utility filter for native C++ filters.

### `unreal.LevelSnapshotBlueprintFilter`
Inherits: `LevelSnapshotFilter` | Header: `LevelSnapshotFilters.h`

Base-class for filtering a level snapshot in Blueprints.

**Methods** (6):
  - `is_actor_valid(params)` -> `FilterResult`
  - `is_added_actor_valid(params)` -> `FilterResult` — This is called when an actor was added to the world since the snapshot had been taken.
  - `is_added_component_valid(params)` -> `FilterResult` — This is called when a component was added to the world since the snapshot had been taken.
  - `is_deleted_actor_valid(params)` -> `FilterResult` — This is called when an actor was removed from the world since the snapshot had been taken.
  - `is_deleted_component_valid(params)` -> `FilterResult` — This is called when a component was removed from an actor since the snapshot had been taken.
  - `is_property_valid(params)` -> `FilterResult`

### `unreal.LevelSnapshotFilter`
Inherits: `Object` | Header: `LevelSnapshotFilters.h`

Base-class for filtering a level snapshot. Native C++ classes should inherit directly from this class.

### `unreal.NegationFilter`
Inherits: `LevelSnapshotFilter` | Header: `NegationFilter.h`

Returns the results of a child filter optionally negated. * * Negation rules: * - Include negated becomes Exclude * - Exclude negated becomes Include * - DoNotCare negated becomes DoNotCare

**Methods** (3):
  - `create_child(child_class)` -> `LevelSnapshotFilter` — Creates an instanced child. If you intend to save this filter, you should use this function instead of SetExternalChild;
  - `get_child()` -> `LevelSnapshotFilter` — Get Child
  - `set_external_child(new_child)` -> `None` — Creates an instanced child. If you intend to save this filter, you should use CreateChild;

**Properties** (1):
  - `should_negate`: `bool` — [Read-Write] (bool)

### `unreal.OrFilter`
Inherits: `ParentFilter` | Header: `OrFilter.h`

Or Filter

### `unreal.ParentFilter`
Inherits: `LevelSnapshotFilter` | Header: `ParentFilter.h`

Parent Filter

**Methods** (4):
  - `add_child(filter)` -> `None` — Adds a child you already created to this filter If you intend to save your filter, add children using CreateChild.
  - `create_child(class_)` -> `LevelSnapshotFilter` — Creates a child and adds it to this filter. If you intend to save your filter, add children using this function.
  - `get_children()` -> `Array [ LevelSnapshotFilter ]` — Gets the children in this filter
  - `removed_child(filter)` -> `bool` — Removes a child from this filter

### `unreal.PropertyBlueprintFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `PropertyBlueprintFunctionLibrary.h`

Property Blueprint Function Library

**Methods** (3):
  - `get_property_name(property_)` -> `str` [classmethod] — Gets only the property name of a property.
  - `get_property_origin_path(property_)` -> `str` [classmethod] — Returns a path containing information which class declare the property.
  - `load_snapshot_actor(params)` -> `Actor` — Loads the actor identified by Params. You can use this for advanced filter queries.

### `unreal.PropertyHasNameFilter`
Inherits: `PropertySelectorFilter` | Header: `PropertyHasNameFilter.h`

Allows a property when is has a certain name Use case: You only want to allow properties named âMyPropertyNameâ

### `unreal.PropertySelectorFilter`
Inherits: `LevelSnapshotBlueprintFilter` | Header: `PropertySelectorFilter.h`

Base class for filters that only implement IsActorValid

### `unreal.PropertyTypeFilter`
Inherits: `PropertySelectorFilter` | Header: `PropertyTypeFilter.h`

Allows a property if it is of a certain type.

### `unreal.TransformPropertyFilter`
Inherits: `PropertySelectorFilter` | Header: `TransformPropertyFilter.h`

Allows you to filter location, rotation, and scale properties on scene components. Use case: You want to restore the location but not rotation of an actor.

### `unreal.ActorToCheck`
Inherits: `EnumBase` | Header: `ActorHasTagFilter.h`

EActor to Check

**Properties** (3):
  - `BOTH`: `ActorToCheck = Ellipsis` — Checks the tags of both actors. 2
  - `SNAPSHOT_ACTOR`: `ActorToCheck = Ellipsis` — Checks only the tags of the snapshot actor 1
  - `WORLD_ACTOR`: `ActorToCheck = Ellipsis` — Checks only the tags of the world actor 0

### `unreal.BlueprintPropertyType`
Inherits: `EnumBase` | Header: `PropertyTypeFilter.h`

Copied from EPropertyType

**Properties** (17):
  - `ARRAY`: `BlueprintPropertyType = Ellipsis` — 14
  - `BOOL`: `BlueprintPropertyType = Ellipsis` — 3
  - `BYTE`: `BlueprintPropertyType = Ellipsis` — CPT_NONE 0
  - `DOUBLE`: `BlueprintPropertyType = Ellipsis` — 13
  - `FLOAT`: `BlueprintPropertyType = Ellipsis` — CPT_Bool8 = 10, Unsupported by Blueprints
CPT_Bool16 = 11, Unsupported by Blueprints
CPT_Bool32 = 12...
  - `INT`: `BlueprintPropertyType = Ellipsis` — CPT_UInt16 = 2, Unsupported by Blueprints
CPT_UInt32 = 3, Unsupported by Blueprints
CPT_UInt64 = 4, ...
  - `INT64`: `BlueprintPropertyType = Ellipsis` — 2
  - `INTERFACE`: `BlueprintPropertyType = Ellipsis` — CPT_Delegate = 17, Not useful for level snapshots 7
  - `MAP`: `BlueprintPropertyType = Ellipsis` — 15
  - `NAME`: `BlueprintPropertyType = Ellipsis` — 6
  - `OBJECT_REFERENCE`: `BlueprintPropertyType = Ellipsis` — 5
  - `SET`: `BlueprintPropertyType = Ellipsis` — 16
  - `SOFT_OBJECT_REFERENCE`: `BlueprintPropertyType = Ellipsis` — CPT_LazyObjectReference = 27, No idea what this is; probably not useful for Blueprints 12
  - `STRING`: `BlueprintPropertyType = Ellipsis` — CPT_Unused_Index_21 = 21,
CPT_Unused_Index_22 = 22, 9
  - `STRUCT`: `BlueprintPropertyType = Ellipsis` — CPT_Unused_Index_19 = 19, 8
  - `TEXT`: `BlueprintPropertyType = Ellipsis` — 10
  - `WEAK_OBJECT_REFERENCE`: `BlueprintPropertyType = Ellipsis` — CPT_MulticastDelegate = 25, Not useful for level snapshots 11

### `unreal.DoNotCareHandling`
Inherits: `EnumBase` | Header: `ActorDependentPropertyFilter.h`

EDo Not Care Handling

**Properties** (3):
  - `USE_DO_NOT_CARE_FILTER`: `DoNotCareHandling = Ellipsis` — When IsActorValid returns DoNotCare, use RunOnDoNotCareActorFilter. 2
  - `USE_EXCLUDE_FILTER`: `DoNotCareHandling = Ellipsis` — When IsActorValid returns Exclude, use RunOnExcludedActorFilter. 1
  - `USE_INCLUDE_FILTER`: `DoNotCareHandling = Ellipsis` — When IsActorValid returns Include, use RunOnIncludedActorFilter. 0

### `unreal.FilterResult`
Inherits: `EnumBase` | Header: `LevelSnapshotFilters.h`

EFilter Result

**Properties** (3):
  - `DO_NOT_CARE`: `FilterResult = Ellipsis` — The filter does not care what happens to this actor / property.
* Another filter will decide. If all...
  - `EXCLUDE`: `FilterResult = Ellipsis` — This actor / property will be excluded. 1
  - `INCLUDE`: `FilterResult = Ellipsis` — This actor / property will be included. 0

### `unreal.NameMatchingRule`
Inherits: `EnumBase` | Header: `PropertyHasNameFilter.h`

EName Matching Rule

**Properties** (4):
  - `CONTAINS_EXACTLY`: `NameMatchingRule = Ellipsis` — The name must contains the following substring (case sensitive) 2
  - `CONTAINS_IGNORE_CASE`: `NameMatchingRule = Ellipsis` — The name must contains the following substring (case insensitive) 3
  - `MATCHES_EXACTLY`: `NameMatchingRule = Ellipsis` — The property name must match the given name exactly. 0
  - `MATCHES_IGNORE_CASE`: `NameMatchingRule = Ellipsis` — The name must match the given name but ignores the case 1

### `unreal.TagCheckingBehavior`
Inherits: `EnumBase` | Header: `ActorHasTagFilter.h`

ETag Checking Behavior

**Properties** (2):
  - `HAS_ALL_TAGS`: `TagCheckingBehavior = Ellipsis` — Actor must have all tags to pass 0
  - `HAS_ANY_TAG`: `TagCheckingBehavior = Ellipsis` — Actor must have at least one of the tags 1

### `unreal.TransformReturnType`
Inherits: `EnumBase` | Header: `ActorChangedTransformFilter.h`

ETransform Return Type

**Properties** (2):
  - `IS_VALID_WHEN_TRANSFORM_CHANGED`: `TransformReturnType = Ellipsis` — Return true if the snapshot and world actor have different transforms 0
  - `IS_VALID_WHEN_TRANSFORM_STAYED_SAME`: `TransformReturnType = Ellipsis` — Returns true of the snapshot and world actor have the same transform 1
