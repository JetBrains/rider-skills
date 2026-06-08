# UE Python API — VariantManager Module

**2 types** from the `VariantManager` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CapturableProperty`, `VariantManagerLibrary`

---

## Classes

### `unreal.CapturableProperty`
Inherits: `StructBase` | Header: `CapturableProperty.h`

Describes a property path that can be captured. It just exposes a display name but uses internal data in order to be able to capture exception properties, like materials

**Properties** (1):
  - `display_name`: `str` [Read-Only] — [Read-Only] (str)

### `unreal.VariantManagerLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `VariantManagerBlueprintLibrary.h`

Library of functions that can be used by the Python API to trigger VariantManager operations

**Methods** (48):
  - `add_actor_binding(variant, actor)` -> `None` [classmethod] — Binds the Actor to the Variant, internally creating a VariantObjectBinding
  - `add_dependency(variant, dependency=VariantDependency)` [classmethod] — Add Dependency
  - `add_variant(variant_set, variant)` -> `None` [classmethod] — Adds Variant to the VariantSetâs list of Variants
  - `add_variant_set(level_variant_sets, variant_set)` -> `None` [classmethod] — Adds VariantSet to the LevelVariantSetsâ list of VariantSets
  - `apply(prop_val)` -> `None` [classmethod] — Applies the recorded data from PropVal to the actor from which it was captured
  - `capture_property(variant, actor, property_path)` -> `PropertyValue` [classmethod] — Finds the actor binding to Actor within Variant and tries capturing a property with PropertyPath Returns the captured UP...
  - `create_level_variant_sets_actor(level_variant_sets_asset)` -> `LevelVariantSetsActor` [classmethod] — Creates a new ALevelVariantSetsActor in the current scene and assigns LevelVariantSetsAsset to it
  - `create_level_variant_sets_asset(asset_name, asset_path)` -> `LevelVariantSets` [classmethod] — Creates a new LevelVariantSetsAsset named AssetName (e.g. âMyLevelVariantSetsâ) in the content path AssetPath (e.g. ...
  - `delete_dependency(variant, index)` -> `None` [classmethod] — Delete Dependency
  - `get_capturable_properties(actor_or_class)` -> `Array [ str ]` [classmethod] — Returns a property path for all the properties we can capture for an actor. Will also handle receiving the actorâs cla...
  - `get_captured_properties(variant, actor)` -> `Array [ PropertyValue ]` [classmethod] — Returns which properties have been captured for this actor in Variant
  - `get_property_type_string(prop_val)` -> `str` [classmethod] — This allows the scripting language to get the type of the C++ property its dealing with
  - `get_value_bool(property_)` -> `bool` [classmethod] — Get Value Bool
  - `get_value_color(property_)` -> `Color` [classmethod] — Get Value Color
  - `get_value_float(property_)` -> `float` [classmethod] — Get Value Float
  - `get_value_int(property_)` -> `int32` [classmethod] — Get Value Int
  - `get_value_int_point(property_)` -> `IntPoint` [classmethod] — Get Value Int Point
  - `get_value_linear_color(property_)` -> `LinearColor` [classmethod] — Get Value Linear Color
  - `get_value_object(property_)` -> `Object` [classmethod] — Get Value Object
  - `get_value_quat(property_)` -> `Quat` [classmethod] — Get Value Quat
  - `get_value_rotator(property_)` -> `Rotator` [classmethod] — Get Value Rotator
  - `get_value_string(property_)` -> `str` [classmethod] — Get Value String
  - `get_value_vector(property_)` -> `Vector` [classmethod] — Get Value Vector
  - `get_value_vector2d(property_)` -> `Vector2D` [classmethod] — Get Value Vector 2D
  - `get_value_vector4(property_)` -> `Vector4` [classmethod] — Get Value Vector 4
  - `record(prop_val)` -> `None` [classmethod] — Records new data for PropVal from the actor from which it was captured
  - `remove_actor_binding(variant, actor)` -> `None` [classmethod] — Removes an actor binding to Actor from Variant, if it exists
  - `remove_actor_binding_by_name(variant, actor_name)` -> `None` [classmethod] — Looks for an actor binding to an actor with ActorLabel within Variant and removes it, if it exists
  - `remove_captured_property(variant, actor, property_)` -> `None` [classmethod] — Removes a property capture from an actor binding within Variant, if it exists
  - `remove_captured_property_by_name(variant, actor, property_path)` -> `None` [classmethod] — Removes property capture with PropertyPath from Actorâs binding within Variant, if it exists
  - `remove_variant(variant_set, variant)` -> `None` [classmethod] — Removes Variant from VariantSet, if that is its parent
  - `remove_variant_by_name(variant_set, variant_name)` -> `None` [classmethod] — Looks for a variant with VariantName within VariantSet and removes it, if it exists
  - `remove_variant_set(level_variant_sets, variant_set)` -> `None` [classmethod] — Removes VariantSet from LevelVariantSets, if that is its parent
  - `remove_variant_set_by_name(level_variant_sets, variant_set_name)` -> `None` [classmethod] — Looks for a variant set with VariantSetName within LevelVariantSets and removes it, if it exists
  - `set_dependency(variant, index, dependency)` -> `VariantDependency` [classmethod] — Set Dependency
  - `set_value_bool(property_, value)` -> `None` [classmethod] — Set Value Bool
  - `set_value_color(property_, value)` -> `None` [classmethod] — Set Value Color
  - `set_value_float(property_, value)` -> `None` [classmethod] — Set Value Float
  - `set_value_int(property_, value)` -> `None` [classmethod] — Set Value Int
  - `set_value_int_point(property_, value)` -> `None` [classmethod] — Set Value Int Point
  - `set_value_linear_color(property_, value)` -> `None` [classmethod] — Set Value Linear Color
  - `set_value_object(property_, value)` -> `None` [classmethod] — Set Value Object
  - `set_value_quat(property_, value)` -> `None` [classmethod] — Set Value Quat
  - `set_value_rotator(property_, value)` -> `None` [classmethod] — Set Value Rotator
  - `set_value_string(property_, value)` -> `None` [classmethod] — Set Value String
  - `set_value_vector(property_, value)` -> `None` [classmethod] — Set Value Vector
  - `set_value_vector2d(property_, value)` -> `None` [classmethod] — Set Value Vector 2D
  - `set_value_vector4(property_, value)` -> `None` [classmethod] — Set Value Vector 4
