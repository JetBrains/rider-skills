# UE Python API — SmartObjectsModule Module

**57 types** from the `SmartObjectsModule` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `SmartObjectBindingCollection`, `SmartObjectClaimHandle`, `SmartObjectCollectionEntry`, `SmartObjectContainer`, `SmartObjectDefinitionBindableStructDescriptor`, `SmartObjectDefinitionDataHandle`, `SmartObjectDefinitionDataProxy`, `SmartObjectDefinitionPreviewData`, `SmartObjectDefinitionPropertyBinding`, `SmartObjectDefinitionReference`, `SmartObjectEventData`, `SmartObjectHandle`, `SmartObjectRequest`, `SmartObjectRequestFilter`, `SmartObjectRequestResult`, `SmartObjectSlotDefinition`, `SmartObjectSlotEntranceHandle`, `SmartObjectSlotEntranceLocationRequest`, `SmartObjectSlotEntranceLocationResult`, `SmartObjectSlotHandle`, ... (57 total)

---

## Classes

### `unreal.SmartObjectBindingCollection`
Inherits: `PropertyBindingBindingCollection` | Header: `SmartObjectBindingCollection.h`

Representation of all property bindings in a SmartObjectDefinition

### `unreal.SmartObjectClaimHandle`
Inherits: `StructBase` | Header: `SmartObjectRuntime.h`

Struct describing a reservation between a user and a smart object slot.

**Properties** (2):
  - `slot_handle`: `SmartObjectSlotHandle` [Read-Only] — [Read-Only] Handle of the claimed slot. (SmartObjectSlotHandle)
  - `smart_object_handle`: `SmartObjectHandle` [Read-Only] — [Read-Only] Handle to the Smart Object where the claimed slot belongs to. (SmartObjectHandle)

### `unreal.SmartObjectCollectionEntry`
Inherits: `StructBase` | Header: `SmartObjectPersistentCollection.h`

Struct representing a unique registered component in the collection actor

### `unreal.SmartObjectContainer`
Inherits: `StructBase` | Header: `SmartObjectPersistentCollection.h`

Smart Object Container

### `unreal.SmartObjectDefinitionBindableStructDescriptor`
Inherits: `PropertyBindingBindableStructDescriptor` | Header: `SmartObjectDefinitionBindableStructDescriptor.h`

Descriptor for a struct or class that can be a binding source or target. e.g., Parameters, Slot, Slot Data, etc.

### `unreal.SmartObjectDefinitionDataHandle`
Inherits: `StructBase` | Header: `SmartObjectTypes.h`

Used internally by USmartObjectDefinition to refer to a specific piece of data like the definition itself, its parameters struct, slot data, etc.

### `unreal.SmartObjectDefinitionDataProxy`
Inherits: `StructBase` | Header: `SmartObjectDefinition.h`

Helper struct for definition data, which allows to identify items based on GUID in editor (even empty ones).

### `unreal.SmartObjectDefinitionPreviewData`
Inherits: `StructBase` | Header: `SmartObjectDefinition.h`

Data used for previewing in the Smart Object editor.

**Properties** (4):
  - `object_actor_class`: `Class` — [Read-Write] Actor class used as the object for previewing the definition in the asset editor. (Clas...
  - `object_mesh_path`: `SoftObjectPath` — [Read-Write] Path of the static mesh used as the object for previewing the definition in the asset e...
  - `user_actor_class`: `Class` — [Read-Write] Actor class used for previewing the smart object user actor in the asset editor. (Class...
  - `user_validation_filter_class`: `Class` — [Read-Write] Validation filter used for previewing the smart object user in the asset editor. (Class...

### `unreal.SmartObjectDefinitionPropertyBinding`
Inherits: `PropertyBindingBinding` | Header: `SmartObjectDefinitionPropertyBinding.h`

Representation of a property binding used inside a FSmartObjectBindingCollection. This is an extension of FPropertyBindingBinding with source and target FSmartObjectDefinitionDataHandle allowing to re...

### `unreal.SmartObjectDefinitionReference`
Inherits: `StructBase` | Header: `SmartObjectDefinitionReference.h`

Struct to hold reference to a SmartObjectDefinition asset along with values to parameterized it.

### `unreal.SmartObjectEventData`
Inherits: `StructBase` | Header: `SmartObjectTypes.h`

Struct describing a change in Smart Object or Slot.

**Properties** (4):
  - `reason`: `SmartObjectChangeReason` [Read-Only] — [Read-Only] Change reason. (SmartObjectChangeReason)
  - `slot_handle`: `SmartObjectSlotHandle` [Read-Only] — [Read-Only] Handle to the changed slot, if invalid, the event is for the object. (SmartObjectSlotHan...
  - `smart_object_handle`: `SmartObjectHandle` [Read-Only] — [Read-Only] Handle to the changed Smart Object. (SmartObjectHandle)
  - `tag`: `GameplayTag` [Read-Only] — [Read-Only] Added/Removed tag, or event tag, depending on Reason. (GameplayTag)

### `unreal.SmartObjectHandle`
Inherits: `StructBase` | Header: `SmartObjectTypes.h`

Handle to a registered smartobject.

**Methods** (4):
  - `__eq__(other: object)` -> `bool` — Overloads:
  - `__ne__(other: object)` -> `bool` — Overloads:
  - `equals(b)` -> `bool` — Returns true if SmartObjectHandle A is equal to SmartObjectHandle B (A == B)
  - `not_equal(b)` -> `bool` — Returns true if SmartObjectHandle A is NOT equal to SmartObjectHandle B (A != B)

### `unreal.SmartObjectRequest`
Inherits: `StructBase` | Header: `SmartObjectRequestTypes.h`

Struct used to find a smart object within a specific search range and with optional filtering

**Properties** (2):
  - `filter`: `SmartObjectRequestFilter` — [Read-Write] Struct used to filter out some results (all results allowed by default) (SmartObjectReq...
  - `query_box`: `Box` — [Read-Write] Box defining the search range (Box)

### `unreal.SmartObjectRequestFilter`
Inherits: `StructBase` | Header: `SmartObjectRequestTypes.h`

Struct that can be used to filter results of a smart object request when trying to find or claim a smart object

**Properties** (7):
  - `activity_requirements`: `GameplayTagQuery` — [Read-Write] Only return slots whose activity tags are matching this query. (GameplayTagQuery)
  - `behavior_definition_classes`: `None` — [Read-Write] If set, will filter out any SmartObject that uses different BehaviorDefinition classes....
  - `claim_priority`: `SmartObjectClaimPriority` — [Read-Write] The userâs claim priority. The search will contain already claimed slots at lower pri...
  - `should_evaluate_conditions`: `bool` — [Read-Write] If true, will evaluate the slot and object conditions, otherwise will skip them. (bool)
  - `should_include_claimed_slots`: `bool` — [Read-Write] If true, this search will contain claimed slots. (bool)
  - `should_include_disabled_slots`: `bool` — [Read-Write] If true, this search will contain disabled slots. (bool)
  - `user_tags`: `GameplayTagContainer` — [Read-Write] Gameplay tags of the Actor or Entity requesting the Smart Object slot. (GameplayTagCont...

### `unreal.SmartObjectRequestResult`
Inherits: `StructBase` | Header: `SmartObjectRequestTypes.h`

Struct that holds the object and slot selected by processing a smart object request.

**Properties** (2):
  - `slot_handle`: `SmartObjectSlotHandle` [Read-Only] — [Read-Only] (SmartObjectSlotHandle)
  - `smart_object_handle`: `SmartObjectHandle` [Read-Only] — [Read-Only] (SmartObjectHandle)

### `unreal.SmartObjectSlotDefinition`
Inherits: `StructBase` | Header: `SmartObjectDefinition.h`

Persistent and sharable definition of a smart object slot.

**Properties** (7):
  - `activity_tags`: `GameplayTagContainer` [Read-Only] — [Read-Only] Tags identifying this slotâs use case. Can be used while looking for slots supporting ...
  - `behavior_definitions`: `None` [Read-Only] — [Read-Only] All available definitions associated to this slot.
This allows multiple frameworks to pr...
  - `enabled`: `bool` [Read-Only] — [Read-Only] Whether the slot is enable initially. (bool)
  - `offset`: `Vector3f` [Read-Only] — [Read-Only] Offset relative to the parent object where the slot is located. (Vector3f)
  - `rotation`: `Rotator3f` [Read-Only] — [Read-Only] Rotation relative to the parent object. (Rotator3f)
  - `runtime_tags`: `GameplayTagContainer` [Read-Only] — [Read-Only] Initial runtime tags. (GameplayTagContainer)
  - `user_tag_filter`: `GameplayTagQuery` [Read-Only] — [Read-Only] This slot is available only for users matching this query. (GameplayTagQuery)

### `unreal.SmartObjectSlotEntranceHandle`
Inherits: `StructBase` | Header: `SmartObjectSubsystem.h`

Handle describing a specific entrance on a smart object slot.

**Properties** (1):
  - `slot_handle`: `SmartObjectSlotHandle` [Read-Only] — [Read-Only] (SmartObjectSlotHandle)

### `unreal.SmartObjectSlotEntranceLocationRequest`
Inherits: `StructBase` | Header: `SmartObjectSubsystem.h`

Struct used to request slot entry or exit location.

**Properties** (14):
  - `check_entrance_location_overlap`: `bool` — [Read-Write] If true, check user capsule collisions at the entrance location. Uses capsule dimension...
  - `check_slot_location_overlap`: `bool` — [Read-Write] If true, check user capsule collisions at the slot location. Uses capsule dimensions se...
  - `check_transition_trajectory`: `bool` — [Read-Write] If true, check collisions between navigation location and slot location. If collisions ...
  - `location_type`: `SmartObjectSlotNavigationLocationType` — [Read-Write] Enum indicating if weâre looking for a location to enter or exit the smart object slo...
  - `navigation_data`: `NavigationData` — [Read-Write] Navigation data to use for the navigation queries. If not set and UserActor is valid, t...
  - `project_navigation_location`: `bool` — [Read-Write] If true, try to project the location on navigable area. If projection fails, an entry i...
  - `search_location`: `Vector` — [Read-Write] Search location that may be used to select an entry from multiple candidates. (e.g. use...
  - `select_method`: `FSmartObjectSlotEntrySelectionMethod` — [Read-Write] How to select an entry when a slot has multiple entries. (FSmartObjectSlotEntrySelectio...
  - `trace_ground_location`: `bool` — [Read-Write] If true, try to trace the location on ground. If trace fails, an entry is discarded. (b...
  - `use_slot_location_as_fallback`: `bool` — [Read-Write] If true, include slot location as a candidate if no navigation annotation is present. (...
  - `use_up_axis_locked_rotation`: `bool` — [Read-Write] If true, the result rotation will only contain rotation around the UP axis (i.e., Yaw o...
  - `user_actor`: `Actor` — [Read-Write] Actor that is using the smart object slot. (Optional) (Actor)
  - `user_capsule_params`: `SmartObjectUserCapsuleParams` — [Read-Write] Size of the user of the smart object. If not set and UserActor is valid, the dimensions...
  - `validation_filter`: `Class` — [Read-Write] Filter to use for the validation. If not set and UserActor is valid, the filter is quer...

### `unreal.SmartObjectSlotEntranceLocationResult`
Inherits: `StructBase` | Header: `SmartObjectSubsystem.h`

Validated result from FindEntranceLocationForSlot().

**Properties** (5):
  - `entrance_handle`: `SmartObjectSlotEntranceHandle` [Read-Only] — [Read-Only] Handle identifying the entrance that was found. (SmartObjectSlotEntranceHandle)
  - `is_valid`: `bool` [Read-Only] — [Read-Only] True if the result has passed validation tests. (bool)
  - `location`: `Vector` [Read-Only] — [Read-Only] The location to enter the slot. (Vector)
  - `rotation`: `Rotator` [Read-Only] — [Read-Only] The expected direction to enter the slot. (Rotator)
  - `tags`: `GameplayTagContainer` [Read-Only] — [Read-Only] Gameplay tags associated with the entrance. (GameplayTagContainer)

### `unreal.SmartObjectSlotHandle`
Inherits: `StructBase` | Header: `SmartObjectTypes.h`

Struct used to identify a runtime slot instance

**Methods** (4):
  - `__eq__(other: object)` -> `bool` — Overloads:
  - `__ne__(other: object)` -> `bool` — Overloads:
  - `equals(b)` -> `bool` — Returns true if SmartObjectSlotHandle A is equal to SmartObjectSlotHandle B (A == B)
  - `not_equal(b)` -> `bool` — Returns true if SmartObjectSlotHandle A is NOT equal to SmartObjectSlotHandle B (A != B)

### `unreal.SmartObjectSlotIndex`
Inherits: `StructBase` | Header: `SmartObjectTypes.h`

Helper struct to wrap basic functionalities to store the index of a slot in a SmartObject definition

### `unreal.SmartObjectSlotStateData`
Inherits: `StructBase` | Header: `SmartObjectTypes.h`

This is the base struct to inherit from to store custom state data associated to a slot

### `unreal.SmartObjectSlotValidationParams`
Inherits: `StructBase` | Header: `SmartObjectTypes.h`

Parameters for Smart Object navigation and collision validation.

### `unreal.SmartObjectTraceParams`
Inherits: `StructBase` | Header: `SmartObjectTypes.h`

Struct used to define how traces should be handled.

### `unreal.SmartObjectUserCapsuleParams`
Inherits: `StructBase` | Header: `SmartObjectTypes.h`

Struct defining Smart Object user capsule size.

**Properties** (3):
  - `height`: `float` — [Read-Write] Full height of the capsule (float)
  - `radius`: `float` — [Read-Write] Radius of the capsule (float)
  - `step_height`: `float` — [Read-Write] Step up height. This space is ignored when testing collisions. (float)

### `unreal.SmartObjectUserHandle`
Inherits: `StructBase` | Header: `SmartObjectTypes.h`

Handle to a smartobject user.

### `unreal.GenericSmartObject`
Inherits: `Actor` | Header: `GenericSmartObject.h`

Generic Smart Object

### `unreal.SmartObjectBehaviorDefinition`
Inherits: `Object` | Header: `SmartObjectDefinition.h`

Abstract class that can be extended to bind a new type of behavior framework to the smart objects by defining the required definition.

### `unreal.SmartObjectCollection`
Inherits: `Actor` | Header: `SmartObjectCollection.h`

Actor holding smart object persistent data

### `unreal.SmartObjectComponent`
Inherits: `SceneComponent` | Header: `SmartObjectComponent.h`

Smart Object Component

**Methods** (6):
  - `is_bound_to_simulation()` -> `bool` — Returns true if the Smart Object component is registered to the Smart Object subsystem. Depending on the update order, s...
  - `is_smart_object_enabled()` -> `bool` — Returns the enabled state of the smart object regardless of the disabled reason.
  - `is_smart_object_enabled_for_reason(reason_tag)` -> `bool` — Returns the enabled state of the smart object based on a specific reason.
  - `receive_on_event(event_data, interactor)` -> `None` — Receive on Event
  - `set_smart_object_enabled(enable)` -> `bool` — Enables or disables the smart object using the default reason (i.e. Gameplay).
  - `set_smart_object_enabled_for_reason(reason_tag, enabled)` -> `bool` — Enables or disables the smart object for the specified reason.

**Properties** (5):
  - `cached_definition_asset_variation`: `SmartObjectDefinition` — [Read-Write] (SmartObjectDefinition)
  - `definition_asset`: `SmartObjectDefinition` — [Read-Write]
deprecated: Property âDefinitionAssetâ is deprecated. (SmartObjectDefinition)
  - `on_smart_object_event`: `SmartObjectComponentEventSignature` — [Read-Write] (SmartObjectComponentEventSignature)
  - `registered_handle`: `SmartObjectHandle` [Read-Only] — [Read-Only] RegisteredHandle != FSmartObjectHandle::Invalid when registered into a collection by Sma...
  - `registered_id`: `SmartObjectHandle` — âregistered_idâ was renamed to âregistered_handleâ. deprecated

### `unreal.SmartObjectContainerRenderingComponent`
Inherits: `PrimitiveComponent` | Header: `SmartObjectContainerRenderingComponent.h`

Smart Object Container Rendering Component

### `unreal.SmartObjectDebugRenderingComponent`
Inherits: `DebugDrawComponent` | Header: `SmartObjectDebugRenderingComponent.h`

Simple UDebugDrawComponent to inherit from to use a FSmartObjectDebugSceneProxy. Derived classes can set ViewFlagName at construction to control relevancy.

### `unreal.SmartObjectDefinition`
Inherits: `DataAsset` | Header: `SmartObjectDefinition.h`

SmartObject definition asset. Contains sharable information that can be used by multiple SmartObject instances at runtime.

**Methods** (10):
  - `get_activity_tags()` -> `GameplayTagContainer` — Returns the list of tags describing the activity associated to this definition
  - `get_bounds()` -> `Box` — Return bounds encapsulating all slots
  - `get_mutable_slot(index)` -> `SmartObjectSlotDefinition`
  - `get_slot_activity_tags_by_index(slot_index)` -> `GameplayTagContainer` — Fills the provided GameplayTagContainer with the activity tags associated to the slot according to the tag merging polic...
  - `get_slot_world_transform(slot_index, owner_transform)` -> `Transform` — Returns the transform (in world space) of the given slot index. note: Method will ensure on invalid slot index.
  - `get_user_tag_filter()` -> `GameplayTagQuery` — Returns the tag query to run on the user tags provided by a request to accept this definition
  - `get_user_tags_filtering_policy()` -> `SmartObjectTagFilteringPolicy` — Returns the tag filtering policy that should be applied on User tags by this definition
  - `is_valid_slot_index(slot_index)` -> `bool`
  - `k2_get_slots()` -> `Array [ SmartObjectSlotDefinition ]` — K2 Get Slots
  - `set_user_tag_filter(user_tag_filter)` -> `None` — Sets the tag query to run on the user tags provided by a request to accept this definition

**Properties** (3):
  - `object_tag_filter`: `GameplayTagQuery` — [Read-Write]
deprecated: Use FWorldCondition_SmartObjectActorTagQuery or FSmartObjectWorldConditionO...
  - `preview_data`: `SmartObjectDefinitionPreviewData` — [Read-Write] Actor class used for previewing the user in the asset editor. (SmartObjectDefinitionPre...
  - `property_bindings`: `None` — [Read-Write]
deprecated: Use BindingCollection instead. (Array[SmartObjectDefinitionPropertyBinding]...

### `unreal.SmartObjectLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `SmartObjectBlueprintFunctionLibrary.h`

Smart Object Blueprint Function Library

**Methods** (33):
  - `add_multiple_smart_objects(smart_object_actors)` -> `bool` [classmethod] — Adds to the simulation all smart objects for multiple actors.
  - `add_or_remove_multiple_smart_objects(smart_object_actors, add)` -> `bool` [classmethod] — Adds to the simulation all smart objects for multiple actors or removes them according to âbAddâ. note: Removing a s...
  - `add_or_remove_smart_object(smart_object, enabled)` -> `bool` [classmethod] — Adds to the simulation all smart objects for an actor or removes them according to âbAddâ. note: Removing a smart ob...
  - `add_smart_object(smart_object_actor)` -> `bool` [classmethod] — Adds to the simulation all smart objects for an actor.
  - `conv_smart_object_claim_handle_to_string(result)` -> `str` [classmethod] — Converts a SmartObjectClaimHandle value to a string
  - `conv_smart_object_definition_to_string(definition)` -> `str` [classmethod] — Converts a SmartObjectDefinition value to a string
  - `conv_smart_object_handle_to_string(handle)` -> `str` [classmethod] — Converts a SmartObjectHandle value to a string
  - `conv_smart_object_request_result_to_string(result)` -> `str` [classmethod] — Converts a SmartObjectRequestResult value to a string
  - `conv_smart_object_slot_handle_to_string(handle)` -> `str` [classmethod] — Converts a SmartObjectSlotHandle value to a string
  - `equal_smart_object_handle_smart_object_handle(a, b)` -> `bool` [classmethod] — Returns true if SmartObjectHandle A is equal to SmartObjectHandle B (A == B)
  - `equal_smart_object_slot_handle_smart_object_slot_handle(a, b)` -> `bool` [classmethod] — Returns true if SmartObjectSlotHandle A is equal to SmartObjectSlotHandle B (A == B)
  - `find_smart_objects_in_actor(filter, search_actor, user_actor = None)` -> `Array[SmartObjectRequestResult] or None` [classmethod] — Search a given Actor for slot candidates respecting the request criteria and selection conditions.
  - `find_smart_objects_in_component(filter, smart_object_component, user_actor = None)` -> `Array[SmartObjectRequestResult] or None` [classmethod] — Search a given Smart Object Component for slot candidates respecting the request criteria and selection conditions.
  - `find_smart_objects_in_list(world_context_object, filter, actor_list, user_actor = None)` -> `Array[SmartObjectRequestResult] or None` [classmethod] — Search list of specific actors (often from a physics query) for slot candidates respecting request criteria and selectio...
  - `find_smart_objects_in_targeting_request(world_context_object, filter, targeting_handle, user_actor = None)` -> `Array[SmartObjectRequestResult] or None` [classmethod] — Search the results of the given targeting handle request for smart objects that match the request criteria
  - `get_blackboard_value_as_so_claim_handle(node_owner, key)` -> `SmartObjectClaimHandle` [classmethod] — Get Blackboard Value as SOClaim Handle
  - `get_value_as_so_claim_handle(blackboard_component, key_name)` -> `SmartObjectClaimHandle` [classmethod] — Get Value as SOClaim Handle
  - `is_valid_smart_object_claim_handle(handle)` -> `bool` [classmethod] — Is Valid Smart Object Claim Handle
  - `is_valid_smart_object_handle(handle)` -> `bool` [classmethod] — Returns true if the given handle is valid
  - `is_valid_smart_object_slot_handle(handle)` -> `bool` [classmethod] — Returns true if the given Smart Object Slot Handle is valid.
  - `k2_set_smart_object_enabled(smart_object: Actor, enabled: bool)` -> `bool` [classmethod] — deprecated: âk2_set_smart_object_enabledâ was renamed to âadd_or_remove_smart_objectâ.
  - `mark_smart_object_slot_as_claimed(world_context_object, slot_handle, user_actor = None, claim_priority = SmartObjectClaimPriority.NORMAL)` -> `SmartObjectClaimHandle` [classmethod] — Marks a smart object slot from a request result as claimed.
  - `mark_smart_object_slot_as_free(world_context_object, claim_handle)` -> `bool` [classmethod] — Marks a claimed or occupied smart object as free.
  - `mark_smart_object_slot_as_occupied(world_context_object, claim_handle, definition_class)` -> `SmartObjectBehaviorDefinition` [classmethod] — Marks a previously claimed smart object slot as occupied.
  - `not_equal_smart_object_handle_smart_object_handle(a, b)` -> `bool` [classmethod] — Returns true if SmartObjectHandle A is NOT equal to SmartObjectHandle B (A != B)
  - `not_equal_smart_object_slot_handle_smart_object_slot_handle(a, b)` -> `bool` [classmethod] — Returns true if SmartObjectSlotHandle A is NOT equal to SmartObjectSlotHandle B (A != B)
  - `remove_multiple_smart_objects(smart_object_actors)` -> `bool` [classmethod] — Removes from the simulation all smart objects for multiple actors. note: Removing a smart object from the simulation wil...
  - `remove_smart_object(smart_object_actor)` -> `bool` [classmethod] — Removes from the simulation all smart objects for an actor. note: Removing a smart object from the simulation will inter...
  - `set_blackboard_value_as_so_claim_handle(node_owner, key, value)` -> `None` [classmethod] — Set Blackboard Value as SOClaim Handle
  - `set_multiple_smart_objects_enabled(smart_object_actors, enabled)` -> `bool` [classmethod] — Marks all smart objects for a list of actors as enabled or not according to âbEnabledâ. A smart object marked as Ena...
  - `set_smart_object_enabled(smart_object_actor, enabled)` -> `bool` [classmethod] — Marks all smart objects for an actor as enabled or not according to âbEnabledâ. A smart object marked as Enabled is ...
  - `set_value_as_so_claim_handle(blackboard_component, key_name, value)` -> `None` [classmethod] — Set Value as SOClaim Handle
  - `smart_object_claim_handle_invalid()` -> `SmartObjectClaimHandle` [classmethod] — Returns the invalid smart object claim handle.

### `unreal.SmartObjectPersistentCollection`
Inherits: `Actor` | Header: `SmartObjectPersistentCollection.h`

Actor holding smart object persistent data

### `unreal.SmartObjectRenderingComponent`
Inherits: `PrimitiveComponent` | Header: `SmartObjectRenderingComponent.h`

Smart Object Rendering Component

### `unreal.SmartObjectSlotValidationFilter`
Inherits: `Object` | Header: `SmartObjectTypes.h`

Class used to define settings for Smart Object navigation and collision validation. It is possible to specify two set of validation parameters. The one labeled âentryâ is used for validating entry...

### `unreal.SmartObjectSubsystem`
Inherits: `WorldSubsystem` | Header: `SmartObjectSubsystem.h`

Subsystem that holds all registered smart object instances and offers the API for spatial queries and reservations.

**Methods** (24):
  - `add_tag_to_instance(handle, tag)` -> `None` — Adds a single tag to the smart object instance represented by the provided handle.
  - `add_tag_to_slot(slot_handle, tag)` -> `None` — Adds a single tag to the smart object slot represented by the provided handle.
  - `find_smart_object(request, user_actor = None)` -> `SmartObjectRequestResult` — Spatial lookup for first slot in range respecting request criteria and selection conditions.
  - `find_smart_objects(request, user_actor = None)` -> `Array[SmartObjectRequestResult] or None` — Find Smart Objects deprecated: The pure version is deprecated, place a new Find Smart Objects node and connect the exec ...
  - `find_smart_objects_bp(request, user_actor = None)` -> `Array[SmartObjectRequestResult] or None` — Blueprint function for spatial lookup for slot candidates respecting request criteria and selection conditions.
  - `get_all_slots(handle)` -> `Array [ SmartObjectSlotHandle ]` — Return all slots of a given smart object.
  - `get_behavior_definition(claim_handle, definition_class)` -> `SmartObjectBehaviorDefinition` — Return the behavior definition of a given type from a claimed object.
  - `get_behavior_definition_by_request_result(request_result, definition_class)` -> `SmartObjectBehaviorDefinition` — Return the behavior definition of a given type from a request result.
  - `get_instance_tags(handle)` -> `GameplayTagContainer` — Returns the list of tags associated to the smart object instance represented by the provided handle.
  - `get_slot_location(claim_handle)` -> `Vector or None` — Returns the position (in world space) of the slot associated to the given claim handle.
  - `get_slot_state(slot_handle)` -> `SmartObjectSlotState` — Returns the state of the given smart object Slot handle.
  - `get_slot_tags(slot_handle)` -> `GameplayTagContainer` — Returns the list of tags associated to the smart object slot represented by the provided handle.
  - `get_slot_transform(claim_handle)` -> `Transform or None` — Returns the transform (in world space) of the slot associated to the given claim handle.
  - `get_slot_transform_from_request_result(request_result)` -> `Transform or None` — Returns the transform (in world space) of the slot associated to the given RequestResult.
  - `get_smart_object_component(claim_handle, try_spawn_actor_if_dehydrated = TrySpawnActorIfDehydrated.NO)` -> `SmartObjectComponent` — Returns the component associated to the claim handle if still accessible. In some scenarios the component may no longer ...
  - `get_smart_object_component_by_request_result(result, try_spawn_actor_if_dehydrated = TrySpawnActorIfDehydrated.NO)` -> `SmartObjectComponent` — Returns the component associated to the given request result In some scenarios the component may no longer exist but its...
  - `is_enabled(handle)` -> `bool` — Returns the enabled state of the smart object represented by the provided handle regardless of the disabled reason.
  - `is_enabled_for_reason(handle, reason_tag)` -> `bool` — Returns the enabled state of the smart object represented by the provided handle based on a specific reason.
  - `release(claim_handle)` -> `bool` — Release deprecated: Use MarkSmartObjectSlotAsFree instead.
  - `remove_tag_from_instance(handle, tag)` -> `None` — Removes a single tag from the smart object instance represented by the provided handle.
  - `remove_tag_from_slot(slot_handle, tag)` -> `bool` — Removes a single tag from the smart object slot represented by the provided handle.
  - `set_enabled(handle, enabled)` -> `bool` — Enables or disables the entire smart object represented by the provided handle using the default reason (i.e. Gameplay)....
  - `set_enabled_for_reason(handle, reason_tag, enabled)` -> `bool` — Enables or disables the entire smart object represented by the provided handle using the specified reason. Delegate âO...
  - `set_slot_enabled(slot_handle, enabled)` -> `bool` — Enables or disables the smart object slot represented by the provided handle.

### `unreal.SmartObjectSubsystemRenderingActor`
Inherits: `Actor` | Header: `SmartObjectSubsystemRenderingActor.h`

Smart Object Subsystem Rendering Actor

### `unreal.SmartObjectSubsystemRenderingComponent`
Inherits: `SmartObjectDebugRenderingComponent` | Header: `SmartObjectSubsystemRenderingActor.h`

Rendering component for SmartObjectRendering actor.

### `unreal.SmartObjectTest`
Inherits: `Object` | Header: `SmartObjectTestingActor.h`

Base class for SmartObject tests.

### `unreal.SmartObjectTestingActor`
Inherits: `Actor` | Header: `SmartObjectTestingActor.h`

Debug actor to test SmartObjects.

**Methods** (2):
  - `reset_tests()` -> `None` — Reset Tests
  - `run_tests()` -> `None` — Run Tests

### `unreal.SmartObjectTestRenderingComponent`
Inherits: `SmartObjectDebugRenderingComponent` | Header: `SmartObjectTestingActor.h`

Debug rendering component for SmartObject tests.

### `unreal.SmartObjectUserComponent`
Inherits: `ActorComponent` | Header: `SmartObjectUserComponent.h`

Smart Object User Component defines common settings for a Smart Object user.

**Properties** (1):
  - `validation_filter`: `Class` — [Read-Write] Validation filter used for entering testing entries for a Smart Object slot. (type(Clas...

### `unreal.FSmartObjectSlotEntrySelectionMethod`
Inherits: `EnumBase` | Header: `SmartObjectSubsystem.h`

Defines method for selecting slot entry from multiple candidates.

**Properties** (2):
  - `FIRST`: `FSmartObjectSlotEntrySelectionMethod = Ellipsis` — Return first entry location (in order defined in the slot definition). 0
  - `NEAREST_TO_SEARCH_LOCATION`: `FSmartObjectSlotEntrySelectionMethod = Ellipsis` — Return nearest entry to specified search location. 1

### `unreal.SmartObjectChangeReason`
Inherits: `EnumBase` | Header: `SmartObjectTypes.h`

Describes how Smart Object or slot was changed.

**Properties** (13):
  - `NONE`: `SmartObjectChangeReason = Ellipsis` — No Change. 0
  - `ON_CLAIMED`: `SmartObjectChangeReason = Ellipsis` — Slot was claimed. 4
  - `ON_COMPONENT_BOUND`: `SmartObjectChangeReason = Ellipsis` — Related Smart Object Component is bound to simulation. 11
  - `ON_COMPONENT_UNBOUND`: `SmartObjectChangeReason = Ellipsis` — Related Smart Object Component is unbound from simulation. 12
  - `ON_EVENT`: `SmartObjectChangeReason = Ellipsis` — External event sent. 1
  - `ON_OBJECT_DISABLED`: `SmartObjectChangeReason = Ellipsis` — Object was disabled. 10
  - `ON_OBJECT_ENABLED`: `SmartObjectChangeReason = Ellipsis` — Object was enabled. 9
  - `ON_OCCUPIED`: `SmartObjectChangeReason = Ellipsis` — Slot is now occupied 5
  - `ON_RELEASED`: `SmartObjectChangeReason = Ellipsis` — Slot claim was released. 6
  - `ON_SLOT_DISABLED`: `SmartObjectChangeReason = Ellipsis` — Slot was disabled. 8
  - `ON_SLOT_ENABLED`: `SmartObjectChangeReason = Ellipsis` — Slot was enabled. 7
  - `ON_TAG_ADDED`: `SmartObjectChangeReason = Ellipsis` — A tag was added. 2
  - `ON_TAG_REMOVED`: `SmartObjectChangeReason = Ellipsis` — A tag was removed. 3

### `unreal.SmartObjectClaimPriority`
Inherits: `EnumBase` | Header: `SmartObjectTypes.h`

Enum indicating the claim priority of a Smart Object slot.

**Properties** (5):
  - `ABOVE_NORMAL`: `SmartObjectClaimPriority = Ellipsis` — 4
  - `BELOW_NORMAL`: `SmartObjectClaimPriority = Ellipsis` — 2
  - `HIGH`: `SmartObjectClaimPriority = Ellipsis` — 5
  - `LOW`: `SmartObjectClaimPriority = Ellipsis` — 1
  - `NORMAL`: `SmartObjectClaimPriority = Ellipsis` — 3

### `unreal.SmartObjectEntrancePriority`
Inherits: `EnumBase` | Header: `SmartObjectSlotEntranceAnnotation.h`

Enum used to define a entrance selection priority. Highest priority is preferred, but when the priority is the same the selection method (distance) is used to decide which entrance is chosen.

**Properties** (9):
  - `ABOVE_NORMAL`: `SmartObjectEntrancePriority = Ellipsis` — 5
  - `BELOW_NORMAL`: `SmartObjectEntrancePriority = Ellipsis` — 3
  - `HIGH`: `SmartObjectEntrancePriority = Ellipsis` — 6
  - `HIGHER`: `SmartObjectEntrancePriority = Ellipsis` — 7
  - `HIGHEST`: `SmartObjectEntrancePriority = Ellipsis` — 8
  - `LOW`: `SmartObjectEntrancePriority = Ellipsis` — 2
  - `LOWER`: `SmartObjectEntrancePriority = Ellipsis` — 1
  - `LOWEST`: `SmartObjectEntrancePriority = Ellipsis` — 0
  - `NORMAL`: `SmartObjectEntrancePriority = Ellipsis` — 4

### `unreal.SmartObjectPropertyPathRetargetingStatus`
Inherits: `EnumBase` | Header: `SmartObjectDefinitionPropertyBinding.h`

ESmart Object Property Path Retargeting Status

**Properties** (3):
  - `NO_RETARGETING`: `SmartObjectPropertyPathRetargetingStatus = Ellipsis` — 0
  - `PICKED_PATH`: `SmartObjectPropertyPathRetargetingStatus = Ellipsis` — 1
  - `RETARGETED_PATH`: `SmartObjectPropertyPathRetargetingStatus = Ellipsis` — 2

### `unreal.SmartObjectSlotNavigationLocationType`
Inherits: `EnumBase` | Header: `SmartObjectTypes.h`

Enum indicating if weâre looking for a location to enter or exit the Smart Object slot.

**Properties** (2):
  - `ENTRY`: `SmartObjectSlotNavigationLocationType = Ellipsis` — Find a location to enter the slot. 0
  - `EXIT`: `SmartObjectSlotNavigationLocationType = Ellipsis` — Find a location to exit the slot. 1

### `unreal.SmartObjectSlotShape`
Inherits: `EnumBase` | Header: `SmartObjectDefinition.h`

Indicates how Tags from slots and parent object are combined to be evaluated by a TagQuery from a find request.

**Properties** (2):
  - `CIRCLE`: `SmartObjectSlotShape = Ellipsis` — 0
  - `RECTANGLE`: `SmartObjectSlotShape = Ellipsis` — 1

### `unreal.SmartObjectSlotState`
Inherits: `EnumBase` | Header: `SmartObjectRuntime.h`

Enumeration to represent the runtime state of a slot

**Properties** (5):
  - `CLAIMED`: `SmartObjectSlotState = Ellipsis` — Slot is claimed but interaction is not active yet 2
  - `DISABLED`: `SmartObjectSlotState = Ellipsis` — Slot can no longer be claimed or used since the parent object and its slot are disabled (e.g. instan...
  - `FREE`: `SmartObjectSlotState = Ellipsis` — Slot is available 1
  - `INVALID`: `SmartObjectSlotState = Ellipsis` — 0
  - `OCCUPIED`: `SmartObjectSlotState = Ellipsis` — Slot is claimed and interaction is active 3

### `unreal.SmartObjectTagFilteringPolicy`
Inherits: `EnumBase` | Header: `SmartObjectTypes.h`

Indicates how TagQueries from slots and parent object will be processed against Tags from a find request.

**Properties** (3):
  - `COMBINE`: `SmartObjectTagFilteringPolicy = Ellipsis` — Both TagQueries (parent object and slot) will be applied to the Tags provided by a request. 1
  - `NO_FILTER`: `SmartObjectTagFilteringPolicy = Ellipsis` — TagQueries in the object and slot definitions are not used by the framework to filter results. Users...
  - `OVERRIDE`: `SmartObjectTagFilteringPolicy = Ellipsis` — TagQuery in slot (if any) will be used instead of the parent object TagQuery to run against the Tags...

### `unreal.SmartObjectTagMergingPolicy`
Inherits: `EnumBase` | Header: `SmartObjectTypes.h`

Indicates how Tags from slots and parent object are combined to be evaluated by a TagQuery from a find request.

**Properties** (2):
  - `COMBINE`: `SmartObjectTagMergingPolicy = Ellipsis` — Tags are combined (parent object and slot) and TagQuery from the request will be run against the com...
  - `OVERRIDE`: `SmartObjectTagMergingPolicy = Ellipsis` — Tags in slot (if any) will be used instead of the parent object Tags when running the TagQuery from ...

### `unreal.SmartObjectTraceType`
Inherits: `EnumBase` | Header: `SmartObjectTypes.h`

Indicates how TagQueries from slots and parent object will be processed against Tags from a find request.

**Properties** (3):
  - `BY_CHANNEL`: `SmartObjectTraceType = Ellipsis` — 0
  - `BY_OBJECT_TYPES`: `SmartObjectTraceType = Ellipsis` — 2
  - `BY_PROFILE`: `SmartObjectTraceType = Ellipsis` — 1

### `unreal.TrySpawnActorIfDehydrated`
Inherits: `EnumBase` | Header: `SmartObjectRuntime.h`

Indicates if the subsystem should try to spawn the actor associated to the smartobject if it is currently owned by an instanced actor.

**Properties** (2):
  - `NO`: `TrySpawnActorIfDehydrated = Ellipsis` — 0
  - `YES`: `TrySpawnActorIfDehydrated = Ellipsis` — 1

### `unreal.SmartObjectComponentEventSignature`
Inherits: `MulticastDelegateBase` | Header: `SmartObjectComponent.h`

Smart Object Component Event Signature Delegate Signature
