# UE Python API — InstancedActors Module

**22 types** from the `InstancedActors` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `InstancedActorsClassSettings`, `InstancedActorsClassSettingsBase`, `InstancedActorsConfig`, `InstancedActorsInstanceHandle`, `InstancedActorsManagerHandle`, `InstancedActorsModifierVolumeHandle`, `InstancedActorsSettings`, `InstancedActorsTagSet`, `InstancedActorsVisualizationDesc`, `InstancedActorsVisualizationInfo`, `InstancedActorsComponent`, `InstancedActorsData`, `InstancedActorsManager`, `InstancedActorsModifierBase`, `InstancedActorsModifierVolume`, `InstancedActorsModifierVolumeComponent`, `InstancedActorsProjectSettings`, `InstancedActorsRemovalModifierVolume`, `InstancedActorsSubsystem`, `InstancedActorsVisualizationTrait`, ... (22 total)

---

## Classes

### `unreal.InstancedActorsClassSettings`
Inherits: `InstancedActorsClassSettingsBase` | Header: `InstancedActorsSettingsTypes.h`

Generic implementation of FInstancedActorsClassSettingsBase thatâs using the generic FInstancedActorsSettings to override existing settings. If you want to extend the per-actor-class settings for yo...

**Properties** (1):
  - `override_settings`: `InstancedActorsSettings` — [Read-Write] Settings specific to ActorClass instances, applied after / overriding BaseSettings.
Not...

### `unreal.InstancedActorsClassSettingsBase`
Inherits: `TableRowBase` | Header: `InstancedActorsSettingsTypes.h`

Per-class settings for instanced actors.

**Properties** (1):
  - `base_settings`: `None` — [Read-Write] Optional ordered list of ânamedâ settings to apply to instances of ActorClass befor...

### `unreal.InstancedActorsConfig`
Inherits: `StructBase` | Header: `InstancedActorsSettings.h`

Instanced Actors Config

### `unreal.InstancedActorsInstanceHandle`
Inherits: `StructBase` | Header: `InstancedActorsIndex.h`

Instanced Actors Instance Handle

### `unreal.InstancedActorsManagerHandle`
Inherits: `StructBase` | Header: `InstancedActorsTypes.h`

Instanced Actors Manager Handle

### `unreal.InstancedActorsModifierVolumeHandle`
Inherits: `StructBase` | Header: `InstancedActorsTypes.h`

Instanced Actors Modifier Volume Handle

### `unreal.InstancedActorsSettings`
Inherits: `TableRowBase` | Header: `InstancedActorsSettingsTypes.h`

Settings for controlling Instanced Actor behavior. Applied by âactor classâ either in groups via ânamed settingsâ e.g: âSmallThingsâ, âTreesâ or on a specific class basis.

**Properties** (33):
  - `actor_class`: `Class` — [Read-Write] Wholesale replace this type of entity with this actor instead. (type(Class))
  - `can_be_damaged`: `bool` — [Read-Write] Turn on or off damage. (bool)
  - `can_ever_affect_navigation`: `bool` — [Read-Write] Can this object ever affect the navigation graph generation for AI etc. (bool)
  - `control_physics_state`: `bool` — [Read-Write] If false, collision will not be managed by the mass LODs for this instance * (bool)
  - `disable_auto_distance_culling`: `bool` — [Read-Write] Disable auto computed distance culling using the bounding box of the static mesh - inst...
  - `gameplay_tags`: `GameplayTagContainer` — [Read-Write] Gameplay Tags that can be used in Modifier queries (GameplayTagContainer)
  - `ignore_modifier_volumes`: `bool` — [Read-Write] Completely disable modifier volumes for this type of instance. (bool)
  - `instances_cast_shadows`: `bool` — [Read-Write] Optional shadow casting override applied to instance ISMCâs if set (shadow casting se...
  - `max_instance_distance`: `float` — [Read-Write] Final draw distance for ISMC instances
deprecated: Property âMaxInstanceDistanceâ i...
  - `modifier_volume_check_fully_enclosed`: `bool` — [Read-Write] By default, modifier volumes will do a bounds intersection test against instances. If t...
  - `override_actor_class`: `bool` — [Read-Write] (bool)
  - `override_actor_ejection_movement_threshold`: `bool` — [Read-Write] (bool)
  - `override_affect_distance_field_lighting`: `bool` — [Read-Write] (bool)
  - `override_b_can_be_damaged`: `bool` — [Read-Write] (bool)
  - `override_b_can_ever_affect_navigation`: `bool` — [Read-Write] (bool)
  - `override_b_control_physics_state`: `bool` — [Read-Write] (bool)
  - `override_b_disable_auto_distance_culling`: `bool` — [Read-Write] (bool)
  - `override_b_eject_on_actor_moved`: `bool` — [Read-Write] (bool)
  - `override_b_ignore_modifier_volumes`: `bool` — [Read-Write] (bool)
  - `override_b_instances_cast_shadows`: `bool` — [Read-Write] Bitflag per setting to choose if it should override a base setting (bool)
  - `override_b_modifier_volume_check_fully_enclosed`: `bool` — [Read-Write] (bool)
  - `override_detailed_representation_lod_distance`: `bool` — [Read-Write] (bool)
  - `override_force_low_representation_lod_distance`: `bool` — [Read-Write] (bool)
  - `override_gameplay_tags`: `bool` — [Read-Write] (bool)
  - `override_lod_distance_scales`: `bool` — [Read-Write] (bool)
  - `override_max_actor_distance`: `bool` — [Read-Write] (bool)
  - `override_max_instance_distance`: `bool` — [Read-Write] UE_DEPRECATED(5.4, âLayers Object no longer available.â)
deprecated: Property âbO...
  - `override_max_instance_distances`: `bool` — [Read-Write] (bool)
  - `override_override_world_partition_grid`: `bool` — [Read-Write] (bool)
  - `override_scale_entity_count`: `bool` — [Read-Write] (bool)
  - `override_world_partition_grid`: `Name` — [Read-Write] What world partition grid should this instance be placed into. (Name)
  - `override_world_position_offset_disable_distance`: `bool` — [Read-Write] (bool)
  - `scale_entity_count`: `float` — [Read-Write] Scale the number of entities spawned. It must be between 0.0 and 1.0, for 0% and 100% r...

### `unreal.InstancedActorsTagSet`
Inherits: `StructBase` | Header: `InstancedActorsTypes.h`

An immutable hashed tag container used to categorize / partition instances

### `unreal.InstancedActorsVisualizationDesc`
Inherits: `StructBase` | Header: `InstancedActorsTypes.h`

ISMC descriptions for instances âvisualizationâ, allowing instances to define multiple potential visualizations / ISMC sets: e.g: âwith berriesâ, âwithout berriesâ.

### `unreal.InstancedActorsVisualizationInfo`
Inherits: `StructBase` | Header: `InstancedActorsTypes.h`

Runtime ISMC tracking for a given âvisualizationâ (alternate ISMC set) for instances

### `unreal.InstancedActorsComponent`
Inherits: `ActorComponent` | Header: `InstancedActorsComponent.h`

Provides Mass Entity reference and interop functions for Actors spawned via Instanced Actors on both client & server.

**Methods** (1):
  - `has_mass_entity()` -> `bool` — Returns true if this Actor was spawned by the Instanced Actor system for a Mass Entity. On servers, MassEntityHandle wil...

**Properties** (1):
  - `instance_handle`: `InstancedActorsInstanceHandle` [Read-Only] — [Read-Only] Handle to the instance that spawned this Instanced Actor, if this componentâs Actor ow...

### `unreal.InstancedActorsData`
Inherits: `Object` | Header: `InstancedActorsData.h`

Instance data for all instances of a given AActor class. Provides âstableâ referral to instances by index via offline population of InstanceTransforms which is then consistently loaded on both cli...

**Methods** (1):
  - `get_manager()` -> `InstancedActorsManager` — Get Manager

### `unreal.InstancedActorsManager`
Inherits: `PartitionActor` | Header: `InstancedActorsManager.h`

Regional manager of âinstanced actorsâ.

### `unreal.InstancedActorsModifierBase`
Inherits: `Object` | Header: `InstancedActorsModifiers.h`

Base class for âmodifierâ operations to run against Instanced Actors within AInstancedActorsManagerâs

### `unreal.InstancedActorsModifierVolume`
Inherits: `Actor` | Header: `InstancedActorsModifierVolume.h`

A 3D volume with a list of Modifiers to execute against any Instanced Actorâs found within the volume. see: UInstancedActorsModifierVolumeComponent

**Properties** (1):
  - `modifier_volume_component`: `InstancedActorsModifierVolumeComponent` [Read-Only] — [Read-Only] (InstancedActorsModifierVolumeComponent)

### `unreal.InstancedActorsModifierVolumeComponent`
Inherits: `PrimitiveComponent` | Header: `InstancedActorsModifierVolumeComponent.h`

A 3D volume component with a list of Modifiers to execute against any Instanced Actorâs found within the volume. see: UInstancedActorsModifierBase

### `unreal.InstancedActorsProjectSettings`
Inherits: `DeveloperSettings` | Header: `InstancedActorsSettings.h`

Configurable project settings for the Instanced Actors system. see: FInstancedActorsClassSettingsBase and FInstancedActorsClassSettings for per-class specific runtime settings. see: AInstancedActorsMa...

**Properties** (5):
  - `actor_class_settings_registry_type`: `DataRegistryType` [Read-Only] — [Read-Only] Data Registry to gather per-class FInstancedActorsClassSettingsBase-based settings from ...
  - `default_base_settings_name`: `Name` [Read-Only] — [Read-Only] If specified, these named settings will be applied to the default settings used as the b...
  - `enforced_settings_name`: `Name` [Read-Only] — [Read-Only] If specified, these named settings will be applied as a final set of overrides to all se...
  - `grid_size`: `int` [Read-Only] — [Read-Only] 3D grid size (distance along side) for partitioned instanced actor managers (int32)
  - `named_settings_registry_type`: `DataRegistryType` [Read-Only] — [Read-Only] Data Registry to gather ânamedâ FInstancedActorsSettings from during UInstancedActor...

### `unreal.InstancedActorsRemovalModifierVolume`
Inherits: `InstancedActorsModifierVolume` | Header: `InstancedActorsModifierVolume.h`

A 3D volume that performs filtered removal of Instanced Actorâs found within the volume. see: URemoveInstancesModifierVolumeComponent

### `unreal.InstancedActorsSubsystem`
Inherits: `TickableWorldSubsystem` | Header: `InstancedActorsSubsystem.h`

Instanced Actor subsystem used to spawn AInstancedActorsManagerâs and populate their instance data. It also keeps track of all InstancedActorDatas and can be queried for them see: AInstancedActorsMa...

**Methods** (2):
  - `instance_actor(actor_class, instance_transform, level, additional_instance_tags, manager_class)` -> `InstancedActorsInstanceHandle` — Adds an instance of ActorClass at InstanceTransform location by spawning or reusing a AInstancedActorsManager at Instanc...
  - `remove_actor_instance(instance_handle, destroy_manager_if_empty = True)` -> `bool` — Removes all instance data for InstanceHandle. This simply adds this instance to a FreeList which incurs extra cost to pr...

### `unreal.InstancedActorsVisualizationTrait`
Inherits: `MassStationaryDistanceVisualizationTrait` | Header: `InstancedActorsVisualizationTrait.h`

Subclass of UMassStationaryVisualizationTrait which forces required settings for instanced actor entities and overrides FMassRepresentationFragment.StaticMeshDescHandle to use a custom registered Visu...

### `unreal.RemoveInstancesModifierVolumeComponent`
Inherits: `InstancedActorsModifierVolumeComponent` | Header: `InstancedActorsModifierVolumeComponent.h`

A UInstancedActorsModifierVolumeComponent with a URemoveInstancedActorsModifier modifier pre-added to Modifiers

### `unreal.InstancedActorsVolumeShape`
Inherits: `EnumBase` | Header: `InstancedActorsModifierVolumeComponent.h`

EInstanced Actors Volume Shape

**Properties** (2):
  - `BOX`: `InstancedActorsVolumeShape = Ellipsis` — 0
  - `SPHERE`: `InstancedActorsVolumeShape = Ellipsis` — 1
