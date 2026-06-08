# UE Python API — VariantManagerContent Module

**14 types** from the `VariantManagerContent` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `VariantDependency`, `LevelVariantSets`, `LevelVariantSetsActor`, `LevelVariantSetsFunctionDirector`, `PropertyValue`, `PropertyValueColor`, `PropertyValueMaterial`, `PropertyValueOption`, `PropertyValueSoftObject`, `PropertyValueTransform`, `PropertyValueVisibility`, `SwitchActor`, `Variant`, `VariantSet`

---

## Classes

### `unreal.VariantDependency`
Inherits: `StructBase` | Header: `Variant.h`

Variant Dependency

**Properties** (3):
  - `enabled`: `bool` [Read-Only] — [Read-Only] (bool)
  - `variant`: `Variant` [Read-Only] — [Read-Only] (Variant)
  - `variant_set`: `VariantSet` [Read-Only] — [Read-Only] (VariantSet)

### `unreal.LevelVariantSets`
Inherits: `Object` | Header: `LevelVariantSets.h`

Level Variant Sets

**Methods** (6):
  - `add_variant_set(variant_set)` -> `None` — Adds VariantSet to the LevelVariantSetsâ list of VariantSets
  - `get_num_variant_sets()` -> `int32` — Get Num Variant Sets
  - `get_variant_set(variant_set_index)` -> `VariantSet` — Get Variant Set
  - `get_variant_set_by_name(variant_set_name)` -> `VariantSet` — Get Variant Set by Name
  - `remove_variant_set(variant_set)` -> `None` — Removes VariantSet from LevelVariantSets, if that is its parent
  - `remove_variant_set_by_name(variant_set_name)` -> `None` — Looks for a variant set with VariantSetName within LevelVariantSets and removes it, if it exists

### `unreal.LevelVariantSetsActor`
Inherits: `Actor` | Header: `LevelVariantSetsActor.h`

Level Variant Sets Actor

**Methods** (4):
  - `get_level_variant_sets(load = False)` -> `LevelVariantSets` — Returns the LevelVariantSets asset, optionally loading it if necessary
  - `set_level_variant_sets(variant_sets)` -> `None` — Set Level Variant Sets
  - `switch_on_variant_by_index(variant_set_index, variant_index)` -> `bool` — Switch on Variant by Index
  - `switch_on_variant_by_name(variant_set_name, variant_name)` -> `bool` — Switch on Variant by Name

**Properties** (1):
  - `level_variant_sets`: `SoftObjectPath` [Read-Only] — [Read-Only] (SoftObjectPath)

### `unreal.LevelVariantSetsFunctionDirector`
Inherits: `Object` | Header: `LevelVariantSetsFunctionDirector.h`

Level Variant Sets Function Director

### `unreal.PropertyValue`
Inherits: `Object` | Header: `PropertyValue.h`

Property Value

**Methods** (32):
  - `apply()` -> `None` — Applies the recorded data from PropVal to the actor from which it was captured
  - `get_full_display_string()` -> `str` — Get Full Display String
  - `get_property_tooltip()` -> `Text` — Get Property Tooltip
  - `get_property_type_string()` -> `str` — This allows the scripting language to get the type of the C++ property its dealing with
  - `get_value_bool()` -> `bool` — Get Value Bool
  - `get_value_color()` -> `Color` — Get Value Color
  - `get_value_float()` -> `float` — Get Value Float
  - `get_value_int()` -> `int32` — Get Value Int
  - `get_value_int_point()` -> `IntPoint` — Get Value Int Point
  - `get_value_linear_color()` -> `LinearColor` — Get Value Linear Color
  - `get_value_object()` -> `Object` — Get Value Object
  - `get_value_quat()` -> `Quat` — Get Value Quat
  - `get_value_rotator()` -> `Rotator` — Get Value Rotator
  - `get_value_string()` -> `str` — Get Value String
  - `get_value_vector()` -> `Vector` — Get Value Vector
  - `get_value_vector2d()` -> `Vector2D` — Get Value Vector 2D
  - `get_value_vector4()` -> `Vector4` — Get Value Vector 4
  - `has_recorded_data()` -> `bool` — Has Recorded Data
  - `record()` -> `None` — Records new data for PropVal from the actor from which it was captured
  - `set_value_bool(value)` -> `None` — Set Value Bool
  - `set_value_color(value)` -> `None` — Set Value Color
  - `set_value_float(value)` -> `None` — Set Value Float
  - `set_value_int(value)` -> `None` — Set Value Int
  - `set_value_int_point(value)` -> `None` — Set Value Int Point
  - `set_value_linear_color(value)` -> `None` — Set Value Linear Color
  - `set_value_object(value)` -> `None` — Set Value Object
  - `set_value_quat(value)` -> `None` — Set Value Quat
  - `set_value_rotator(value)` -> `None` — Set Value Rotator
  - `set_value_string(value)` -> `None` — Set Value String
  - `set_value_vector(value)` -> `None` — Set Value Vector
  - `set_value_vector2d(value)` -> `None` — Set Value Vector 2D
  - `set_value_vector4(value)` -> `None` — Set Value Vector 4

### `unreal.PropertyValueColor`
Inherits: `PropertyValue` | Header: `PropertyValueColor.h`

Keeps an FLinearColor interface by using the property setter/getter functions, even though the property itself is of FColor type

### `unreal.PropertyValueMaterial`
Inherits: `PropertyValue` | Header: `PropertyValueMaterial.h`

Property Value Material

### `unreal.PropertyValueOption`
Inherits: `PropertyValue` | Header: `PropertyValueOption.h`

PropertyValue that can only be captured from ASwitchActors

### `unreal.PropertyValueSoftObject`
Inherits: `PropertyValue` | Header: `PropertyValueSoftObject.h`

Stores data from a USoftObjectProperty. It will store itâs recorded data as a raw UObject*, and use the usual UPropertyValue facilities for serializing it as a Soft object ptr. This derived class ha...

### `unreal.PropertyValueTransform`
Inherits: `PropertyValue` | Header: `PropertyValue.h`

### `unreal.PropertyValueVisibility`
Inherits: `PropertyValue` | Header: `PropertyValue.h`

### `unreal.SwitchActor`
Inherits: `Actor` | Header: `SwitchActor.h`

Switch Actor allows quickly toggling the visibility of its child actors so that only one is visible at a time. It can also be captured with the Variant Manager to expose this capability as a property ...

**Methods** (3):
  - `get_options()` -> `Array [ Actor ]` — Returns the child actors that are available options, in a fixed order that may differ from the one displayed in the worl...
  - `get_selected_option()` -> `int32` — If we have exactly one child actor visible, it will return a pointer to it. Returns nullptr otherwise
  - `select_option(option_index)` -> `None` — Select one of the available options by index

### `unreal.Variant`
Inherits: `Object` | Header: `Variant.h`

**Methods** (25):
  - `add_actor_binding(actor)` -> `None` — Binds the Actor to the Variant, internally creating a VariantObjectBinding
  - `add_dependency(dependency=VariantDependency)` — Add Dependency
  - `capture_property(actor, property_path)` -> `PropertyValue` — Finds the actor binding to Actor within Variant and tries capturing a property with PropertyPath Returns the captured UP...
  - `delete_dependency(index)` -> `None` — Delete Dependency
  - `get_actor(actor_index)` -> `Actor` — Get Actor
  - `get_captured_properties(actor)` -> `Array [ PropertyValue ]` — Returns which properties have been captured for this actor in Variant
  - `get_dependency(index)` -> `VariantDependency` — Get the dependency at index âIndexâ by value. Will crash if index is invalid
  - `get_dependents(level_variant_sets, only_enabled_dependencies)` -> `Array [ Variant ]` — Returns all the variants that have this variant as a dependency
  - `get_display_text()` -> `Text` — Get Display Text
  - `get_num_actors()` -> `int32` — Get Num Actors
  - `get_num_dependencies()` -> `int32` — Get Num Dependencies
  - `get_parent()` -> `VariantSet` — Get Parent
  - `get_thumbnail()` -> `Texture2D` — Gets the thumbnail currently used for this variant
  - `is_active()` -> `bool` — Returns true if none of our properties are dirty
  - `remove_actor_binding(actor)` -> `None` — Removes an actor binding to Actor from Variant, if it exists
  - `remove_actor_binding_by_name(actor_name)` -> `None` — Looks for an actor binding to an actor with ActorLabel within Variant and removes it, if it exists
  - `remove_captured_property(actor, property_)` -> `None` — Removes a property capture from an actor binding within Variant, if it exists
  - `remove_captured_property_by_name(actor, property_path)` -> `None` — Removes property capture with PropertyPath from Actorâs binding within Variant, if it exists
  - `set_dependency(index, dependency)` -> `VariantDependency` — Set Dependency
  - `set_display_text(new_display_text)` -> `None` — Set Display Text
  - `set_thumbnail_from_camera(world_context_object, camera_transform, fov_degrees = 50.000000, min_z = 50.000000, gamma = 2.200000)` -> `None` — Set Thumbnail from Camera
  - `set_thumbnail_from_editor_viewport()` -> `None` — Sets the thumbnail from the active editor viewport. Doesnât do anything if the Editor is not available
  - `set_thumbnail_from_file(file_path)` -> `None` — Set Thumbnail from File
  - `set_thumbnail_from_texture(new_thumbnail)` -> `None` — Sets the thumbnail to use for this variant. Can receive nullptr to clear it
  - `switch_on()` -> `None` — Switch On

### `unreal.VariantSet`
Inherits: `Object` | Header: `VariantSet.h`

Variant Set

**Methods** (14):
  - `add_variant(variant)` -> `None` — Adds Variant to the VariantSetâs list of Variants
  - `get_display_text()` -> `Text` — Get Display Text
  - `get_num_variants()` -> `int32` — Get Num Variants
  - `get_parent()` -> `LevelVariantSets` — Get Parent
  - `get_thumbnail()` -> `Texture2D` — Gets the thumbnail currently used for this variant set
  - `get_variant(variant_index)` -> `Variant` — Get Variant
  - `get_variant_by_name(variant_name)` -> `Variant` — Get Variant by Name
  - `remove_variant(variant)` -> `None` — Removes Variant from VariantSet, if that is its parent
  - `remove_variant_by_name(variant_name)` -> `None` — Looks for a variant with VariantName within VariantSet and removes it, if it exists
  - `set_display_text(new_display_text)` -> `None` — Set Display Text
  - `set_thumbnail_from_camera(world_context_object, camera_transform, fov_degrees = 50.000000, min_z = 50.000000, gamma = 2.200000)` -> `None` — Set Thumbnail from Camera
  - `set_thumbnail_from_editor_viewport()` -> `None` — Sets the thumbnail from the active editor viewport. Doesnât do anything if the Editor is not available
  - `set_thumbnail_from_file(file_path)` -> `None` — Set Thumbnail from File
  - `set_thumbnail_from_texture(new_thumbnail)` -> `None` — Sets the thumbnail to use for this variant set. Can receive nullptr to clear it
