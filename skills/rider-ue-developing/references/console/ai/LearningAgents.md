# UE Python API — LearningAgents Module

**27 types** from the `LearningAgents` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `LearningAgentsActionModifierElement`, `LearningAgentsActionObjectElement`, `LearningAgentsActionSchemaElement`, `LearningAgentsCriticSettings`, `LearningAgentsObservationObjectElement`, `LearningAgentsObservationSchemaElement`, `LearningAgentsPolicySettings`, `LearningAgentsActionModifier`, `LearningAgentsActionObject`, `LearningAgentsActions`, `LearningAgentsActionSchema`, `LearningAgentsController`, `LearningAgentsCritic`, `LearningAgentsInteractor`, `LearningAgentsManager`, `LearningAgentsManagerListener`, `LearningAgentsNeuralNetwork`, `LearningAgentsObservationObject`, `LearningAgentsObservations`, `LearningAgentsObservationSchema`, ... (27 total)

---

## Classes

### `unreal.LearningAgentsActionModifierElement`
Inherits: `StructBase` | Header: `LearningAgentsActions.h`

An element of an Action Modifier

### `unreal.LearningAgentsActionObjectElement`
Inherits: `StructBase` | Header: `LearningAgentsActions.h`

An element of an Action Object

### `unreal.LearningAgentsActionSchemaElement`
Inherits: `StructBase` | Header: `LearningAgentsActions.h`

An element of an Action Schema

### `unreal.LearningAgentsCriticSettings`
Inherits: `StructBase` | Header: `LearningAgentsCritic.h`

The configurable settings for a ULearningAgentsCritic.

### `unreal.LearningAgentsObservationObjectElement`
Inherits: `StructBase` | Header: `LearningAgentsObservations.h`

An element of an Observation Object

### `unreal.LearningAgentsObservationSchemaElement`
Inherits: `StructBase` | Header: `LearningAgentsObservations.h`

An element of an Observation Schema

### `unreal.LearningAgentsPolicySettings`
Inherits: `StructBase` | Header: `LearningAgentsPolicy.h`

The configurable settings for a ULearningAgentsPolicy.

### `unreal.LearningAgentsActionModifier`
Inherits: `Object` | Header: `LearningAgentsActions.h`

Action Modifier

### `unreal.LearningAgentsActionObject`
Inherits: `Object` | Header: `LearningAgentsActions.h`

Action Object

### `unreal.LearningAgentsActions`
Inherits: `BlueprintFunctionLibrary` | Header: `LearningAgentsActions.h`

Learning Agents Actions

**Methods** (129):
  - `get_angle_action(object, element, relative_angle = 0.000000, tag = 'AngleAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_angle_location = [0.000000,0.000000,0.000000], visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `float or None` [classmethod] — Get the value for an angle action. Returned angle is in degrees.
  - `get_angle_action_radians(object, element, relative_angle = 0.000000, tag = 'AngleAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_angle_location = [0.000000,0.000000,0.000000], visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `float or None` [classmethod] — Get the value for an angle action. Returned angle is in radians.
  - `get_bitmask_action(object, element, enum, tag = 'BitmaskAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `int32 or None` [classmethod] — Get the bitmask value of a bitmask action.
  - `get_bool_action(object, element, tag = 'BoolAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `bool or None` [classmethod] — Get the value for a bool action.
  - `get_continuous_action(object, element, tag = 'ContinuousAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `Array[float] or None` [classmethod] — Get the values of a continuous action.
  - `get_continuous_action_num(object, element, tag = 'ContinuousAction')` -> `int32 or None` [classmethod] — Get the number of values in a continuous action.
  - `get_direction_action(object, element, relative_transform = [[0.000000,0.000000,0.000000],[-0.000000,0.000000,0.000000],[1.000000,1.000000,1.000000]], tag = 'DirectionAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_direction_location = [0.000000,0.000000,0.000000], visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_arrow_length = 100.000000, visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `Vector or None` [classmethod] — Get the value for a direction action.
  - `get_either_action(object, element, tag = 'EitherAction')` -> `(out_either=LearningAgentsEitherAction, out_element=LearningAgentsActionObjectElement) or None` [classmethod] — Get the sub-action of an either action.
  - `get_encoding_action(object, element, tag = 'EncodingAction')` -> `LearningAgentsActionObjectElement or None` [classmethod] — Get the sub-action of an encoding action.
  - `get_enum_action(object, element, enum, tag = 'EnumAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `uint8 or None` [classmethod] — Get the enum value of an enum action.
  - `get_exclusive_discrete_action(object, element, tag = 'DiscreteExclusiveAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `int32 or None` [classmethod] — Get the index for an exclusive discrete action.
  - `get_exclusive_union_action(object, element, tag = 'ExclusiveUnionAction')` -> `(out_element_name=Name, out_element=LearningAgentsActionObjectElement) or None` [classmethod] — Get the chosen sub-action for an exclusive union action.
  - `get_float_action(object, element, tag = 'FloatAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `float or None` [classmethod] — Get the value for a float action.
  - `get_inclusive_discrete_action(object, element, tag = 'DiscreteInclusiveAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `Array[int32] or None` [classmethod] — Get the indices for an inclusive discrete action.
  - `get_inclusive_discrete_action_num(object, element, tag = 'DiscreteInclusiveAction')` -> `int32 or None` [classmethod] — Get the number of indices for an inclusive discrete action.
  - `get_inclusive_union_action(object, element, tag = 'InclusiveUnionAction')` -> `Map[Name, LearningAgentsActionObjectElement] or None` [classmethod] — Get the chosen sub-actions for an inclusive union action.
  - `get_inclusive_union_action_num(object, element, tag = 'InclusiveUnionAction')` -> `int32 or None` [classmethod] — Get the number of sub-actions for an inclusive union action.
  - `get_inclusive_union_action_to_arrays(object, element, tag = 'InclusiveUnionAction')` -> `(out_element_names=Array[Name], out_elements=Array[LearningAgentsActionObjectElement]) or None` [classmethod] — Get the chosen sub-actions for an inclusive union action.
  - `get_location_action(object, element, relative_transform = [[0.000000,0.000000,0.000000],[-0.000000,0.000000,0.000000],[1.000000,1.000000,1.000000]], tag = 'LocationAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `Vector or None` [classmethod] — Get the value for a location action.
  - `get_named_exclusive_discrete_action(object, element, tag = 'NamedDiscreteExclusiveAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `Name or None` [classmethod] — Get the name for a named exclusive discrete action.
  - `get_named_inclusive_discrete_action(object, element, tag = 'NamedDiscreteInclusiveAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `Array[Name] or None` [classmethod] — Get the names for a named inclusive discrete action.
  - `get_named_inclusive_discrete_action_num(object, element, tag = 'NamedDiscreteInclusiveAction')` -> `int32 or None` [classmethod] — Get the number of names for a named inclusive discrete action.
  - `get_null_action(object, element, tag = 'NullAction')` -> `bool` [classmethod] — Get a null action.
  - `get_optional_action(object, element, tag = 'OptionalAction')` -> `(out_option=LearningAgentsOptionalAction, out_element=LearningAgentsActionObjectElement) or None` [classmethod] — Get the sub-action of an option action.
  - `get_pair_action(object, element, tag = 'PairAction')` -> `(out_key=LearningAgentsActionObjectElement, out_value=LearningAgentsActionObjectElement) or None` [classmethod] — Get the sub-actions of a pair action.
  - `get_rotation_action(object, element, relative_rotation = [0.000000,0.000000,0.000000], tag = 'RotationAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_rotation_location = [0.000000,0.000000,0.000000], visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `Rotator or None` [classmethod] — Get the value for a rotation action.
  - `get_rotation_action_as_quat(object, element, relative_rotation, tag = 'RotationAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_rotation_location = [0.000000,0.000000,0.000000], visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `Quat or None` [classmethod] — Get the value for a rotation action as a quaternion.
  - `get_scale_action(object, element, relative_scale = [1.000000,1.000000,1.000000], tag = 'ScaleAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `Vector or None` [classmethod] — Get the value for a scale action.
  - `get_static_array_action(object, element, tag = 'StaticArrayAction')` -> `Array[LearningAgentsActionObjectElement] or None` [classmethod] — Get the entries of a static array action.
  - `get_static_array_action_num(object, element, tag = 'StaticArrayAction')` -> `int32 or None` [classmethod] — Get the number of entries in a static array action.
  - `get_struct_action(object, element, tag = 'StructAction')` -> `Map[Name, LearningAgentsActionObjectElement] or None` [classmethod] — Get the sub-actions for a struct action.
  - `get_struct_action_element(object, element, element_name, tag = 'StructAction')` -> `LearningAgentsActionObjectElement or None` [classmethod] — Get the sub-action given its name for a struct action.
  - `get_struct_action_num(object, element, tag = 'StructAction')` -> `int32 or None` [classmethod] — Get the number of sub-actions for a struct action.
  - `get_struct_action_to_arrays(object, element, tag = 'StructAction')` -> `(out_element_names=Array[Name], out_elements=Array[LearningAgentsActionObjectElement]) or None` [classmethod] — Get the sub-actions for a struct action.
  - `get_transform_action(object, element, relative_transform = [[0.000000,0.000000,0.000000],[-0.000000,0.000000,0.000000],[1.000000,1.000000,1.000000]], tag = 'TransformAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `Transform or None` [classmethod] — Get the value for a transform action.
  - `get_velocity_action(object, element, relative_transform = [[0.000000,0.000000,0.000000],[-0.000000,0.000000,0.000000],[1.000000,1.000000,1.000000]], tag = 'VelocityAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_velocity_location = [0.000000,0.000000,0.000000], visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `Vector or None` [classmethod] — Get the value for a velocity action.
  - `log_action(object, element)` -> `None` [classmethod] — Logs an Action Object Element. Useful for debugging.
  - `make_angle_action(object, angle, relative_angle = 0.000000, tag = 'AngleAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_angle_location = [0.000000,0.000000,0.000000], visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `LearningAgentsActionObjectElement` [classmethod] — Make Angle Action
  - `make_angle_action_modifier(modifier, masked_angle, mask, relative_angle = 0.000000, tag = 'AngleAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Angle Action Modifier
  - `make_angle_action_modifier_radians(modifier, masked_angle, mask, relative_angle = 0.000000, tag = 'AngleAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Angle Action Modifier Radians
  - `make_angle_action_radians(object, angle, relative_angle = 0.000000, tag = 'AngleAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_angle_location = [0.000000,0.000000,0.000000], visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `LearningAgentsActionObjectElement` [classmethod] — Make Angle Action Radians
  - `make_bitmask_action(object, enum, bitmask_value, tag = 'BitmaskAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `LearningAgentsActionObjectElement` [classmethod] — Make Bitmask Action
  - `make_bitmask_action_modifier(modifier, enum, masked_bitmask, tag = 'BitmaskAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Bitmask Action Modifier
  - `make_bool_action(object, value, tag = 'BoolAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `LearningAgentsActionObjectElement` [classmethod] — Make Bool Action
  - `make_bool_action_modifier(modifier, value, tag = 'BoolAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Bool Action Modifier
  - `make_continuous_action(object, values, tag = 'ContinuousAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `LearningAgentsActionObjectElement` [classmethod] — Make Continuous Action
  - `make_continuous_action_modifier(modifier, masked, masked_values, tag = 'ContinuousAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Continuous Action Modifier
  - `make_direction_action(object, direction, relative_transform = [[0.000000,0.000000,0.000000],[-0.000000,0.000000,0.000000],[1.000000,1.000000,1.000000]], tag = 'DirectionAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_direction_location = [0.000000,0.000000,0.000000], visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_arrow_length = 100.000000, visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `LearningAgentsActionObjectElement` [classmethod] — Make Direction Action
  - `make_direction_action_modifier(modifier, masked_direction, masked_x, masked_y, masked_z, relative_transform = [[0.000000,0.000000,0.000000],[-0.000000,0.000000,0.000000],[1.000000,1.000000,1.000000]], tag = 'DirectionAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Direction Action Modifier
  - `make_either_a_action(object, a, tag = 'EitherAction')` -> `LearningAgentsActionObjectElement` [classmethod] — Make Either AAction
  - `make_either_action(object, element, either, tag = 'EitherAction')` -> `LearningAgentsActionObjectElement` [classmethod] — Make Either Action
  - `make_either_action_modifier(modifier, a, b, allow_only_a, allow_only_b, tag = 'EitherAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Either Action Modifier
  - `make_either_b_action(object, b, tag = 'EitherAction')` -> `LearningAgentsActionObjectElement` [classmethod] — Make Either BAction
  - `make_encoding_action(object, element, tag = 'EncodingAction')` -> `LearningAgentsActionObjectElement` [classmethod] — Make Encoding Action
  - `make_encoding_action_modifier(modifier, element, tag = 'EncodingAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Encoding Action Modifier
  - `make_enum_action(object, enum, enum_value, tag = 'EnumAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `LearningAgentsActionObjectElement` [classmethod] — Make Enum Action
  - `make_enum_action_modifier(modifier, enum, enum_masked_values, tag = 'EnumAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Enum Action Modifier
  - `make_exclusive_discrete_action(object, index, tag = 'DiscreteExclusiveAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `LearningAgentsActionObjectElement` [classmethod] — Make Exclusive Discrete Action
  - `make_exclusive_discrete_action_modifier(modifier, masked_indices, tag = 'DiscreteExclusiveAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Exclusive Discrete Action Modifier
  - `make_exclusive_union_action(object, element_name, element, tag = 'ExclusiveUnionAction')` -> `LearningAgentsActionObjectElement` [classmethod] — Make Exclusive Union Action
  - `make_exclusive_union_action_modifier(modifier, elements, masked_elements, tag = 'ExclusiveUnionAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Exclusive Union Action Modifier
  - `make_exclusive_union_action_modifier_from_arrays(modifier, element_names, elements, masked_elements, tag = 'ExclusiveUnionAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Exclusive Union Action Modifier from Arrays
  - `make_float_action(object, value, tag = 'FloatAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `LearningAgentsActionObjectElement` [classmethod] — Make Float Action
  - `make_float_action_modifier(modifier, masked_value, masked, tag = 'FloatAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Float Action Modifier
  - `make_inclusive_discrete_action(object, indices, tag = 'DiscreteInclusiveAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `LearningAgentsActionObjectElement` [classmethod] — Make Inclusive Discrete Action
  - `make_inclusive_discrete_action_modifier(modifier, masked_indices, tag = 'DiscreteInclusiveAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Inclusive Discrete Action Modifier
  - `make_inclusive_union_action(object, elements, tag = 'InclusiveUnionAction')` -> `LearningAgentsActionObjectElement` [classmethod] — Make Inclusive Union Action
  - `make_inclusive_union_action_from_arrays(object, element_names, elements, tag = 'InclusiveUnionAction')` -> `LearningAgentsActionObjectElement` [classmethod] — Make Inclusive Union Action from Arrays
  - `make_inclusive_union_action_modifier(modifier, elements, masked_elements, tag = 'InclusiveUnionAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Inclusive Union Action Modifier
  - `make_inclusive_union_action_modifier_from_arrays(modifier, element_names, elements, masked_elements, tag = 'InclusiveUnionAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Inclusive Union Action Modifier from Arrays
  - `make_location_action(object, location, relative_transform = [[0.000000,0.000000,0.000000],[-0.000000,0.000000,0.000000],[1.000000,1.000000,1.000000]], tag = 'LocationAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `LearningAgentsActionObjectElement` [classmethod] — Make Location Action
  - `make_location_action_modifier(modifier, masked_location, masked_x, masked_y, masked_z, relative_transform = [[0.000000,0.000000,0.000000],[-0.000000,0.000000,0.000000],[1.000000,1.000000,1.000000]], tag = 'LocationAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Location Action Modifier
  - `make_named_exclusive_discrete_action(object, name, tag = 'NamedDiscreteExclusiveAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `LearningAgentsActionObjectElement` [classmethod] — Make Named Exclusive Discrete Action
  - `make_named_exclusive_discrete_action_modifier(modifier, masked_names, tag = 'NamedDiscreteExclusiveAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Named Exclusive Discrete Action Modifier
  - `make_named_inclusive_discrete_action(object, names, tag = 'NamedDiscreteInclusiveAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `LearningAgentsActionObjectElement` [classmethod] — Make Named Inclusive Discrete Action
  - `make_named_inclusive_discrete_action_modifier(modifier, masked_names, tag = 'NamedDiscreteInclusiveAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Named Inclusive Discrete Action Modifier
  - `make_null_action(object, tag = 'NullAction')` -> `LearningAgentsActionObjectElement` [classmethod] — Make Null Action
  - `make_null_action_modifier(modifier, tag = 'NullAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Null Action Modifier
  - `make_optional_action(object, element, option, tag = 'OptionalAction')` -> `LearningAgentsActionObjectElement` [classmethod] — Make Optional Action
  - `make_optional_action_modifier(modifier, element, allow_only_valid, allow_only_null, tag = 'OptionalAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Optional Action Modifier
  - `make_optional_null_action(object, tag = 'OptionalAction')` -> `LearningAgentsActionObjectElement` [classmethod] — Make Optional Null Action
  - `make_optional_valid_action(object, element, tag = 'OptionalAction')` -> `LearningAgentsActionObjectElement` [classmethod] — Make Optional Valid Action
  - `make_pair_action(object, key, value, tag = 'PairAction')` -> `LearningAgentsActionObjectElement` [classmethod] — Make Pair Action
  - `make_pair_action_modifier(modifier, key, value, tag = 'PairAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Pair Action Modifier
  - `make_rotation_action(object, rotation, relative_rotation = [0.000000,0.000000,0.000000], tag = 'RotationAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_rotation_location = [0.000000,0.000000,0.000000], visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `LearningAgentsActionObjectElement` [classmethod] — Make Rotation Action
  - `make_rotation_action_from_quat(object, rotation, relative_rotation, tag = 'RotationAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_rotation_location = [0.000000,0.000000,0.000000], visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `LearningAgentsActionObjectElement` [classmethod] — Make Rotation Action from Quat
  - `make_scale_action(object, scale, relative_scale = [1.000000,1.000000,1.000000], tag = 'ScaleAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `LearningAgentsActionObjectElement` [classmethod] — Make Scale Action
  - `make_scale_action_modifier(modifier, masked_scale, masked_x, masked_y, masked_z, relative_scale = [1.000000,1.000000,1.000000], tag = 'ScaleAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Scale Action Modifier
  - `make_static_array_action(object, elements, tag = 'StaticArrayAction')` -> `LearningAgentsActionObjectElement` [classmethod] — Make Static Array Action
  - `make_static_array_action_modifier(modifier, elements, tag = 'StaticArrayAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Static Array Action Modifier
  - `make_struct_action(object, elements, tag = 'StructAction')` -> `LearningAgentsActionObjectElement` [classmethod] — Make Struct Action
  - `make_struct_action_from_arrays(object, element_names, elements, tag = 'StructAction')` -> `LearningAgentsActionObjectElement` [classmethod] — Make Struct Action from Arrays
  - `make_struct_action_modifier(modifier, elements, tag = 'StructAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Struct Action Modifier
  - `make_struct_action_modifier_from_arrays(modifier, element_names, elements, tag = 'StructAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Struct Action Modifier from Arrays
  - `make_transform_action(object, transform, relative_transform = [[0.000000,0.000000,0.000000],[-0.000000,0.000000,0.000000],[1.000000,1.000000,1.000000]], tag = 'TransformAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `LearningAgentsActionObjectElement` [classmethod] — Make Transform Action
  - `make_velocity_action(object, velocity, relative_transform = [[0.000000,0.000000,0.000000],[-0.000000,0.000000,0.000000],[1.000000,1.000000,1.000000]], tag = 'VelocityAction', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_velocity_location = [0.000000,0.000000,0.000000], visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,0.000000,1.000000,1.000000])` -> `LearningAgentsActionObjectElement` [classmethod] — Make Velocity Action
  - `make_velocity_action_modifier(modifier, masked_velocity, masked_x, masked_y, masked_z, relative_transform = [[0.000000,0.000000,0.000000],[-0.000000,0.000000,0.000000],[1.000000,1.000000,1.000000]], tag = 'VelocityAction')` -> `LearningAgentsActionModifierElement` [classmethod] — Make Velocity Action Modifier
  - `specify_angle_action(schema, angle_scale = 90.000000, tag = 'AngleAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new angle action. This represents an action which is an angle sampled from a Gaussian distribution centered ...
  - `specify_bitmask_action(schema, enum, prior_probabilities, tag = 'BitmaskAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new bitmask action. This represents an action which is an inclusive choice from entries of an Enum, sampled ...
  - `specify_bitmask_action_from_array(schema, enum, prior_probabilities, tag = 'BitmaskAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new bitmask action. This represents an action which is an inclusive choice from entries of an Enum, sampled ...
  - `specify_bool_action(schema, prior_probability = 0.500000, tag = 'BoolAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new bool action. This represents an action which is either true or false.
  - `specify_continuous_action(schema, size, scale = 1.000000, tag = 'ContinuousAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new continuous action. This represents an action made up of several float values sampled from a Gaussian dis...
  - `specify_direction_action(schema, tag = 'DirectionAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new direction action. This represents an action which is a direction sampled from a Gaussian distribution an...
  - `specify_either_action(schema, a, b, prior_probability_of_a = 0.500000, tag = 'EitherAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new either action. This represents an action which is either action A or action B.
  - `specify_encoding_action(schema, element, encoding_size = 128, hidden_layer_num = 1, activation_function = LearningAgentsActivationFunction.ELU, tag = 'EncodingAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new encoding action. This represents an action which will be a decoding of another sub-action using a small ...
  - `specify_enum_action(schema, enum, prior_probabilities, tag = 'EnumAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new enum action. This represents an action which is an exclusive choice from entries of an Enum, sampled fro...
  - `specify_enum_action_from_array(schema, enum, prior_probabilities, tag = 'EnumAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new enum action. This represents an action which is an exclusive choice from entries of an Enum, sampled fro...
  - `specify_exclusive_discrete_action(schema, size, prior_probabilities, tag = 'DiscreteExclusiveAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new exclusive discrete action. This represents an action which is an exclusive choice from a number of discr...
  - `specify_exclusive_union_action(schema, elements, prior_probabilities, tag = 'ExclusiveUnionAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new exclusive union action. This represents an action which is an exclusive choice from a number of named su...
  - `specify_exclusive_union_action_from_arrays(schema, element_names, elements, prior_probabilities, tag = 'ExclusiveUnionAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new exclusive union action. This represents an action which is an exclusive choice from a number of named su...
  - `specify_float_action(schema, float_scale = 1.000000, tag = 'FloatAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new float action. This represents an action which is a single float sampled from a Gaussian distribution. It...
  - `specify_inclusive_discrete_action(schema, size, prior_probabilities, tag = 'DiscreteInclusiveAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new inclusive discrete action. This represents an action which is an inclusive choice from a number of discr...
  - `specify_inclusive_union_action(schema, elements, prior_probabilities, tag = 'InclusiveUnionAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new inclusive union action. This represents an action which is an inclusive choice from a number of named su...
  - `specify_inclusive_union_action_from_arrays(schema, element_names, elements, prior_probabilities, tag = 'InclusiveUnionAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new inclusive union action. This represents an action which is an inclusive choice from a number of named su...
  - `specify_location_action(schema, location_scale = 100.000000, tag = 'LocationAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new location action. This represents an action which is a location sampled from a Gaussian distribution.
  - `specify_named_exclusive_discrete_action(schema, names, prior_probabilities, tag = 'NamedDiscreteExclusiveAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new named exclusive discrete action. This represents an action which is an exclusive choice from a number of...
  - `specify_named_inclusive_discrete_action(schema, names, prior_probabilities, tag = 'NamedDiscreteInclusiveAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new named inclusive discrete action. This represents an action which is an inclusive choice from a number of...
  - `specify_null_action(schema, tag = 'NullAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new null action. This represents an empty action and can be useful when an action is needed which does nothi...
  - `specify_optional_action(schema, element, prior_probability = 0.500000, tag = 'OptionalAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new optional action. This represents an action which may or may not be generated.
  - `specify_pair_action(schema, key, value, tag = 'PairAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new pair action. This represents an action which is made up of a key and value sub-actions.
  - `specify_rotation_action(schema, rotation_scale = 90.000000, tag = 'RotationAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new rotation action. This represents an action which is a rotation sampled from a Gaussian distribution in t...
  - `specify_scale_action(schema, scale_scale = 1.000000, tag = 'ScaleAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new scale action. This represents an action which is a scale sampled from a Gaussian distribution in the log...
  - `specify_static_array_action(schema, element, num, tag = 'StaticArrayAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new static array action. This represents an action which is a fixed sized array of some sub-action.
  - `specify_struct_action(schema, elements, tag = 'StructAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new struct action. This represents an action which is made up of a number of named sub-actions.
  - `specify_struct_action_from_arrays(schema, element_names, elements, tag = 'StructAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new struct action. This represents an action which is made up of a number of named sub-actions.
  - `specify_transform_action(schema, location_scale = 100.000000, rotation_scale = 90.000000, scale_scale = 1.000000, tag = 'TransformAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new transform action.
  - `specify_velocity_action(schema, velocity_scale = 200.000000, tag = 'VelocityAction')` -> `LearningAgentsActionSchemaElement` [classmethod] — Specifies a new velocity action. This represents an action which is a velocity sampled from a Gaussian distribution.
  - `validate_action_modifier_matches_schema(schema, schema_element, modifier, modifier_element)` -> `bool` [classmethod] — Validates that the given action modifier matches the schema. Will log errors on modifiers that donât match.
  - `validate_action_object_matches_schema(schema, schema_element, object, object_element)` -> `bool` [classmethod] — Validates that the given action object matches the schema. Will log errors on objects that donât match.

### `unreal.LearningAgentsActionSchema`
Inherits: `Object` | Header: `LearningAgentsActions.h`

Action Schema

### `unreal.LearningAgentsController`
Inherits: `LearningAgentsManagerListener` | Header: `LearningAgentsController.h`

A controller is an object that can be used to construct actions from observations - essentially a hand-made Policy. This can be useful for making a learning agents system that uses some other existing...

**Methods** (7):
  - `evaluate_agent_controller(action_object, observation_object, observation_object_element, agent_id)` -> `LearningAgentsActionObjectElement` — This callback should be overridden by the Controller and produces an Action Object Element from an Observation Object El...
  - `evaluate_agent_controllers(action_object, observation_object, observation_object_elements, agent_ids)` -> `Array [ LearningAgentsActionObjectElement ]` — This callback can be overridden by the Controller and produces an array of Action Object Elements, from an array of Obse...
  - `evaluate_controller()` -> `None` — Call this function when it is time to evaluate the controller and produce the actions for the agents. This should be cal...
  - `get_interactor(interactor_class)` -> `LearningAgentsInteractor` — Gets the agent interactor associated with this component.
  - `make_controller(manager, interactor, class_, manager=LearningAgentsManager, interactor=LearningAgentsInteractor)` [classmethod] — Constructs a new controller for the given agent interactor.
  - `run_controller()` -> `None` — Calls GatherObservations, followed by EvaluateController, followed by PerformActions
  - `setup_controller(manager, interactor=LearningAgentsInteractor)` — Initializes this object to be used with the given agent interactor.

### `unreal.LearningAgentsCritic`
Inherits: `LearningAgentsManagerListener` | Header: `LearningAgentsCritic.h`

A critic used for training the policy. Can be used at inference time to estimate the discounted returns.

**Methods** (5):
  - `evaluate_critic()` -> `None` — Calling this function will run the underlying neural network on the previously buffered observations to populate the out...
  - `get_critic_network_asset()` -> `LearningAgentsNeuralNetwork` — Gets the current Network Asset being used
  - `get_estimated_discounted_return(agent_id = -1)` -> `float` — Gets an estimate of the average discounted return expected by an agent according to the critic. I.E. the total sum of fu...
  - `make_critic(manager, interactor, policy, class_=None, name="Critic", critic_neural_network_asset=None, reinitialize_critic_network=True, critic_settings=[], manager=LearningAgentsManager, interactor=LearningAgentsInteractor, policy=LearningAgentsPolicy)` [classmethod] — Constructs a Critic to be used with the given agent interactor and critic settings.
  - `setup_critic(manager, interactor, policy, critic_neural_network_asset=None, reinitialize_critic_network=True, critic_settings=[], interactor=LearningAgentsInteractor, policy=LearningAgentsPolicy)` — Initializes a critic to be used with the given agent interactor and critic settings.

### `unreal.LearningAgentsInteractor`
Inherits: `LearningAgentsManagerListener` | Header: `LearningAgentsInteractor.h`

ULearningAgentsInteractor defines how agents interact with the environment through their observations and actions.

**Methods** (28):
  - `gather_agent_observation(observation_object, agent_id)` -> `LearningAgentsObservationObjectElement` — This callback should be overridden by the Interactor and gathers the observations for a single agent. The structure of t...
  - `gather_agent_observations(observation_object, agent_ids)` -> `Array [ LearningAgentsObservationObjectElement ]` — This callback can be overridden by the Interactor and gathers all the observations for the given agents. The structure o...
  - `gather_observations()` -> `None` — Gathers all the observations for all agents. This will call GatherAgentObservations.
  - `get_action_distribution_vector_size()` -> `int32` — Gets the size of the action distribution vector used by this interactor.
  - `get_action_encoded_vector_size()` -> `int32` — Gets the size of the encoded action vector used by this interactor.
  - `get_action_modifier_vector()` — Get the current buffered action modifier vector for the given agent.
  - `get_action_modifier_vector_size()` -> `int32` — Gets the size of the action modifier vector used by this interactor.
  - `get_action_vector()` — Get the current buffered action vector for the given agent.
  - `get_action_vector_size()` -> `int32` — Gets the size of the action vector used by this interactor.
  - `get_observation_encoded_vector_size()` -> `int32` — Gets the size of the encoded observation vector used by this interactor.
  - `get_observation_vector()` — Get the current buffered observation vector for the given agent.
  - `get_observation_vector_size()` -> `int32` — Gets the size of the observation vector used by this interactor.
  - `has_action_modifier_vector(agent_id = -1)` -> `bool` — Returns true if MakeActionModifiers or SetActionModifierVector has been called and the action modifier vector already se...
  - `has_action_vector(agent_id = -1)` -> `bool` — Returns true if DecodeAndSampleActions on the policy or SetActionVector has been called and the action vector already se...
  - `has_observation_vector(agent_id = -1)` -> `bool` — Returns true if GatherObservations or SetObservationVector has been called and the observation vector already set for th...
  - `make_action_modifiers()` -> `None` — Makes all the action modifiers for all agents. This will call MakeAgentActionModifiers. Should be called even when Actio...
  - `make_agent_action_modifier(action_modifier, observation_object, observation_object_element, agent_id)` -> `LearningAgentsActionModifierElement` — This callback can be optionally overridden by the Interactor to create an action modifier for a single agent. The struct...
  - `make_agent_action_modifiers(action_modifier, observation_object, observation_object_elements, agent_ids)` -> `Array [ LearningAgentsActionModifierElement ]` — This callback can be optionally overridden by the Interactor to create all the action modifier for the given agents. The...
  - `make_interactor(manager, class_, manager=LearningAgentsManager)` [classmethod] — Constructs an Interactor.
  - `perform_actions()` -> `None` — Performs all the actions for all agents. This will call PerformAgentActions.
  - `perform_agent_action(action_object, action_object_element, agent_id)` -> `None` — This callback should be overridden by the Interactor and performs the action for the given agent in the world. The struc...
  - `perform_agent_actions(action_object, action_object_elements, agent_ids)` -> `None` — This callback can be overridden by the Interactor and performs all the actions for the given agents in the world. The st...
  - `set_action_modifier_vector(action_modifier_vector, action_compatibility_hash, agent_id = -1, increment_iteration = True)` -> `None` — Sets the current buffered action modifier vector for the given agent.
  - `set_action_vector(action_vector, action_compatibility_hash, agent_id = -1, increment_iteration = True)` -> `None` — Sets the current buffered action vector for the given agent.
  - `set_observation_vector(observation_vector, observation_compatibility_hash, agent_id = -1, increment_iteration = True)` -> `None` — Sets the current buffered observation vector for the given agent.
  - `setup_interactor(manager)` -> `LearningAgentsManager` — Initializes an Interactor.
  - `specify_agent_action(action_schema)` -> `LearningAgentsActionSchemaElement` — This callback should be overridden by the Interactor and specifies the structure of the actions using the Action Schema.
  - `specify_agent_observation(observation_schema)` -> `LearningAgentsObservationSchemaElement` — This callback should be overridden by the Interactor and specifies the structure of the observations using the Observati...

### `unreal.LearningAgentsManager`
Inherits: `ActorComponent` | Header: `LearningAgentsManager.h`

The agent manager is responsible for tracking which game objects are agents. Itâs the central class around which most of Learning Agents is built.

**Methods** (20):
  - `add_agent(agent)` -> `int32` — Adds the given object as an agent to the manager.
  - `add_agents(agents)` -> `Array [ int32 ]` — Adds the given objects as an agents to the manager.
  - `add_listener(listener)` -> `None` — Adds a listener to be tracked by this manager.
  - `get_agent(agent_id=-1, agent_class)` -> `Object` — Gets the agent with the given id. Calling this from blueprint with the appropriate AgentClass will automatically cast th...
  - `get_agent_id(agent)` -> `int32` — Gets the agent id associated with a given agent.
  - `get_agent_ids(agents)` -> `Array [ int32 ]` — Gets the agent ids associated with a set of agents.
  - `get_agent_num()` -> `int32` — Gets the number of agents added
  - `get_agents(agent_ids, agent_class)` -> `Array [ Object ]` — Gets the agents associated with a set of ids. Calling this from blueprint with the appropriate AgentClass will automatic...
  - `get_all_agents()` — Gets all added agents. Calling this from blueprint with the appropriate AgentClass will automatically cast the object to...
  - `get_max_agent_num()` -> `int32` — Returns the maximum number of agents that this manager is configured to handle.
  - `has_agent(agent_id = -1)` -> `bool` — Returns true if the given id is an agent used by the manager; Otherwise, false.
  - `has_agent_object(agent)` -> `bool` — Returns true if the given object is an agent used by the manager; Otherwise, false.
  - `remove_agent(agent_id = -1)` -> `None` — Removes the agent with the given id from the manager.
  - `remove_agents(agent_ids)` -> `None` — Removes the agents with the given ids from the manager.
  - `remove_all_agents()` -> `None` — Removes all agents from the manager.
  - `remove_listener(listener)` -> `None` — Removes a listener from being tracked by this manager.
  - `reset_agent(agent_id = -1)` -> `None` — Resets the agent with the given id on the manager. Used to tell components to reset any state associated with this agent...
  - `reset_agents(agent_ids)` -> `None` — Resets the agents with the given ids on the manager. Used to tell components to reset any state associated with this age...
  - `reset_all_agents()` -> `None` — Resets all the agents on the manager.
  - `set_max_agent_num(max_agent_num)` -> `None` — Sets the maximum number of agents that this manager is configured to handle.

### `unreal.LearningAgentsManagerListener`
Inherits: `Object` | Header: `LearningAgentsManagerListener.h`

Base class for objects which can be added to a ULearningAgentsManager to receive callbacks whenever agents are added, remove or reset.

**Methods** (9):
  - `get_agent(agent_id=-1, agent_class)` -> `Object` — Gets the agent with the given id from the manager. Calling this from blueprint with the appropriate AgentClass will auto...
  - `get_agent_manager()` -> `LearningAgentsManager` — Gets the agent manager associated with this object.
  - `get_agents(agent_ids, agent_class)` -> `Array [ Object ]` — Gets the agents associated with a set of ids from the manager. Calling this from blueprint with the appropriate AgentCla...
  - `get_all_agents()` — Gets all added agents from the manager. Calling this from blueprint with the appropriate AgentClass will automatically c...
  - `is_setup()` -> `bool` — Returns true if this object has been setup. Otherwise, false.
  - `on_agents_added(agent_ids)` -> `None` — Called whenever agents are added to the manager.
  - `on_agents_manager_tick(agent_ids, delta_time)` -> `None`
  - `on_agents_removed(agent_ids)` -> `None` — Called whenever agents are removed from the manager.
  - `on_agents_reset(agent_ids)` -> `None` — Called whenever agents are reset on the manager.

### `unreal.LearningAgentsNeuralNetwork`
Inherits: `DataAsset` | Header: `LearningAgentsNeuralNetwork.h`

A neural network data asset.

**Methods** (4):
  - `load_network_from_asset(neural_network_asset)` -> `None` — Copy another asset into this network.
  - `load_network_from_snapshot(file)` -> `None` — Load this network from a snapshot.
  - `save_network_to_asset(neural_network_asset)` -> `None` — Copy this network into another asset.
  - `save_network_to_snapshot(file)` -> `None` — Save this network into a snapshot.

**Properties** (1):
  - `neural_network_data`: `LearningNeuralNetworkData` [Read-Only] — [Read-Only] The internal Neural Network Data (LearningNeuralNetworkData)

### `unreal.LearningAgentsObservationObject`
Inherits: `Object` | Header: `LearningAgentsObservations.h`

Observation Object

### `unreal.LearningAgentsObservations`
Inherits: `BlueprintFunctionLibrary` | Header: `LearningAgentsObservations.h`

Learning Agents Observations

**Methods** (132):
  - `find_enum_by_name(name)` -> `Enum` [classmethod] — Find an Enum type by Name. This can be used to find Enum types defined in C++. This call can be expensive so the result ...
  - `get_angle_observation(object, element, relative_angle = 0.000000, tag = 'AngleObservation')` -> `float or None` [classmethod] — Get Angle Observation
  - `get_angle_observation_radians(object, element, relative_angle = 0.000000, tag = 'AngleObservation')` -> `float or None` [classmethod] — Get Angle Observation Radians
  - `get_array_observation(object, element, max_num, tag = 'ArrayObservation')` -> `Array[LearningAgentsObservationObjectElement] or None` [classmethod] — Get Array Observation
  - `get_array_observation_num(object, element, tag = 'ArrayObservation')` -> `int32 or None` [classmethod] — Get Array Observation Num
  - `get_bitmask_observation(object, element, enum, tag = 'BitmaskObservation')` -> `int32 or None` [classmethod] — Get Bitmask Observation
  - `get_bool_observation(object, element, tag = 'BoolObservation')` -> `bool or None` [classmethod] — Get Bool Observation
  - `get_continuous_observation(object, element, tag = 'ContinuousObservation')` -> `Array[float] or None` [classmethod] — Get Continuous Observation
  - `get_continuous_observation_num(object, element, tag = 'ContinuousObservation')` -> `int32 or None` [classmethod] — Get Continuous Observation Num
  - `get_count_observation(object, element, max_num, tag = 'CountObservation')` -> `int32 or None` [classmethod] — Get Count Observation
  - `get_direction_along_spline_observation(object, element, relative_transform = [[0.000000,0.000000,0.000000],[-0.000000,0.000000,0.000000],[1.000000,1.000000,1.000000]], tag = 'DirectionAlongSplineObservation')` -> `Vector or None` [classmethod] — Get Direction Along Spline Observation
  - `get_direction_observation(object, element, relative_transform = [[0.000000,0.000000,0.000000],[-0.000000,0.000000,0.000000],[1.000000,1.000000,1.000000]], tag = 'DirectionObservation')` -> `Vector or None` [classmethod] — Get Direction Observation
  - `get_either_observation(object, element, tag = 'EitherObservation')` -> `(out_either=LearningAgentsEitherObservation, out_element=LearningAgentsObservationObjectElement) or None` [classmethod] — Get Either Observation
  - `get_encoding_observation(object, element, tag = 'EncodingObservation')` -> `LearningAgentsObservationObjectElement or None` [classmethod] — Get Encoding Observation
  - `get_enum_observation(object, element, enum, tag = 'EnumObservation')` -> `uint8 or None` [classmethod] — Get Enum Observation
  - `get_exclusive_discrete_observation(object, element, tag = 'ExclusiveDiscreteObservation')` -> `int32 or None` [classmethod] — Get Exclusive Discrete Observation
  - `get_exclusive_union_observation(object, element, tag = 'ExclusiveUnionObservation')` -> `(out_element_name=Name, out_element=LearningAgentsObservationObjectElement) or None` [classmethod] — Get Exclusive Union Observation
  - `get_float_observation(object, element, tag = 'FloatObservation')` -> `float or None` [classmethod] — Get Float Observation
  - `get_inclusive_discrete_observation(object, element, tag = 'InclusiveDiscreteObservation')` -> `Array[int32] or None` [classmethod] — Get Inclusive Discrete Observation
  - `get_inclusive_discrete_observation_num(object, element, tag = 'InclusiveDiscreteObservation')` -> `int32 or None` [classmethod] — Get Inclusive Discrete Observation Num
  - `get_inclusive_union_observation(object, element, tag = 'InclusiveUnionObservation')` -> `Map[Name, LearningAgentsObservationObjectElement] or None` [classmethod] — Get Inclusive Union Observation
  - `get_inclusive_union_observation_num(object, element, tag = 'InclusiveUnionObservation')` -> `int32 or None` [classmethod] — Get Inclusive Union Observation Num
  - `get_inclusive_union_observation_to_arrays(object, element, tag = 'InclusiveUnionObservation')` -> `(out_element_names=Array[Name], out_elements=Array[LearningAgentsObservationObjectElement]) or None` [classmethod] — Get Inclusive Union Observation to Arrays
  - `get_location_along_spline_observation(object, element, relative_transform = [[0.000000,0.000000,0.000000],[-0.000000,0.000000,0.000000],[1.000000,1.000000,1.000000]], tag = 'LocationAlongSplineObservation')` -> `Vector or None` [classmethod] — Get Spline Observations
  - `get_location_observation(object, element, relative_transform = [[0.000000,0.000000,0.000000],[-0.000000,0.000000,0.000000],[1.000000,1.000000,1.000000]], tag = 'LocationObservation')` -> `Vector or None` [classmethod] — Get Location Observation
  - `get_map_observation(object, element, tag = 'MapObservation')` -> `Map[LearningAgentsObservationObjectElement, LearningAgentsObservationObjectElement] or None` [classmethod] — Get Map Observation
  - `get_map_observation_num(object, element, tag = 'MapObservation')` -> `int32 or None` [classmethod] — Get Map Observation Num
  - `get_map_observation_to_arrays(object, element, tag = 'MapObservation')` -> `(out_keys=Array[LearningAgentsObservationObjectElement], out_values=Array[LearningAgentsObservationObjectElement]) or None` [classmethod] — Get Map Observation to Arrays
  - `get_named_exclusive_discrete_observation(object, element, tag = 'ExclusiveDiscreteObservation')` -> `Name or None` [classmethod] — Get Named Exclusive Discrete Observation
  - `get_named_inclusive_discrete_observation(object, element, tag = 'InclusiveDiscreteObservation')` -> `Array[Name] or None` [classmethod] — Get Named Inclusive Discrete Observation
  - `get_named_inclusive_discrete_observation_num(object, element, tag = 'InclusiveDiscreteObservation')` -> `int32 or None` [classmethod] — Get Named Inclusive Discrete Observation Num
  - `get_null_observation(object, element, tag = 'NullObservation')` -> `bool` [classmethod] — Get Basic Observations
  - `get_optional_observation(object, element, tag = 'OptionalObservation')` -> `(out_option=LearningAgentsOptionalObservation, out_element=LearningAgentsObservationObjectElement) or None` [classmethod] — Get Optional Observation
  - `get_pair_observation(object, element, tag = 'PairObservation')` -> `(out_key=LearningAgentsObservationObjectElement, out_value=LearningAgentsObservationObjectElement) or None` [classmethod] — Get Pair Observation
  - `get_proportion_along_ray_observation(object, element, tag = 'ProportionAlongRayObservation')` -> `float or None` [classmethod] — Get Ray Cast Observations
  - `get_proportion_along_spline_observation(object, element, tag = 'ProportionAlongSplineObservation')` -> `(out_is_closed_loop=bool, out_angle=float, out_propotion=float) or None` [classmethod] — Get Proportion Along Spline Observation
  - `get_rotation_observation(object, element, relative_rotation = [0.000000,0.000000,0.000000], tag = 'RotationObservation')` -> `Rotator or None` [classmethod] — Get Rotation Observation
  - `get_rotation_observation_as_quat(object, element, relative_rotation, tag = 'RotationObservation')` -> `Quat or None` [classmethod] — Get Rotation Observation as Quat
  - `get_scale_observation(object, element, relative_scale = [1.000000,1.000000,1.000000], tag = 'ScaleObservation')` -> `Vector or None` [classmethod] — Get Scale Observation
  - `get_set_observation(object, element, tag = 'SetObservation')` -> `Set[LearningAgentsObservationObjectElement] or None` [classmethod] — Get Set Observation
  - `get_set_observation_num(object, element, tag = 'SetObservation')` -> `int32 or None` [classmethod] — Get Set Observation Num
  - `get_set_observation_to_array(object, element, tag = 'SetObservation')` -> `Array[LearningAgentsObservationObjectElement] or None` [classmethod] — Get Set Observation to Array
  - `get_static_array_observation(object, element, tag = 'StaticArrayObservation')` -> `Array[LearningAgentsObservationObjectElement] or None` [classmethod] — Get Static Array Observation
  - `get_static_array_observation_num(object, element, tag = 'StaticArrayObservation')` -> `int32 or None` [classmethod] — Get Static Array Observation Num
  - `get_struct_observation(object, element, tag = 'StructObservation')` -> `Map[Name, LearningAgentsObservationObjectElement] or None` [classmethod] — Get Struct Observation
  - `get_struct_observation_element(object, element, element_name, tag = 'StructObservation')` -> `LearningAgentsObservationObjectElement or None` [classmethod] — Get Struct Observation Element
  - `get_struct_observation_num(object, element, tag = 'StructObservation')` -> `int32 or None` [classmethod] — Get Struct Observation Num
  - `get_struct_observation_to_arrays(object, element, tag = 'StructObservation')` -> `(out_element_names=Array[Name], out_elements=Array[LearningAgentsObservationObjectElement]) or None` [classmethod] — Get Struct Observation to Arrays
  - `get_transform_observation(object, element, relative_transform = [[0.000000,0.000000,0.000000],[-0.000000,0.000000,0.000000],[1.000000,1.000000,1.000000]], tag = 'TransformObservation')` -> `Transform or None` [classmethod] — Get Transform Observation
  - `get_velocity_observation(object, element, relative_transform = [[0.000000,0.000000,0.000000],[-0.000000,0.000000,0.000000],[1.000000,1.000000,1.000000]], tag = 'VelocityObservation')` -> `Vector or None` [classmethod] — Get Velocity Observation
  - `log_observation(object, element)` -> `None` [classmethod] — Logs an Observation Object Element. Useful for debugging.
  - `make_angle_observation(object, angle, relative_angle = 0.000000, tag = 'AngleObservation', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,0.000000,0.000000,1.000000])` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new angle observation. Angles should be given in degrees.
  - `make_angle_observation_radians(object, angle, relative_angle = 0.000000, tag = 'AngleObservation', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,0.000000,0.000000,1.000000])` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new angle observation. Angles should be given in radians.
  - `make_array_observation(object, elements, max_num, tag = 'ArrayObservation')` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new array observation.
  - `make_bitmask_observation(object, enum, bitmask_value, tag = 'BitmaskObservation', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,0.000000,0.000000,1.000000])` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new bitmask observation.
  - `make_bool_observation(object, value, tag = 'BoolObservation', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,0.000000,0.000000,1.000000])` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new bool observation.
  - `make_continuous_observation(object, values, tag = 'ContinuousObservation', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,0.000000,0.000000,1.000000])` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new continuous observation. The size of Values must match the Size given during Specify.
  - `make_count_observation(object, num, max_num, tag = 'CountObservation', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,0.000000,0.000000,1.000000])` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new count observation.
  - `make_direction_along_spline_observation(object, spline_component, distance_along_spline, relative_transform = [[0.000000,0.000000,0.000000],[-0.000000,0.000000,0.000000],[1.000000,1.000000,1.000000]], tag = 'DirectionAlongSplineObservation', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_arrow_length = 100.000000, visual_logger_color = [1.000000,0.000000,0.000000,1.000000])` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new direction along spline observation.
  - `make_direction_observation(object, direction, relative_transform = [[0.000000,0.000000,0.000000],[-0.000000,0.000000,0.000000],[1.000000,1.000000,1.000000]], tag = 'DirectionObservation', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_direction_location = [0.000000,0.000000,0.000000], visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_arrow_length = 100.000000, visual_logger_color = [1.000000,0.000000,0.000000,1.000000])` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new direction observation.
  - `make_either_a_observation(object, a, tag = 'EitherObservation')` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new either A observation. Use this to provide option A.
  - `make_either_b_observation(object, b, tag = 'EitherObservation')` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new either B observation. Use this to provide option B.
  - `make_either_observation(object, element, either, tag = 'EitherObservation')` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new either observation.
  - `make_encoding_observation(object, element, tag = 'EncodingObservation')` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new encoding observation. This must be used in conjunction with SpecifyEncodingObservation.
  - `make_enum_observation(object, enum, enum_value, tag = 'EnumObservation', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,0.000000,0.000000,1.000000])` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new enum observation.
  - `make_exclusive_discrete_observation(object, discrete_index, tag = 'ExclusiveDiscreteObservation', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,0.000000,0.000000,1.000000])` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new exclusive discrete observation.
  - `make_exclusive_union_observation(object, element_name, element, tag = 'ExclusiveUnionObservation')` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new exclusive union observation.
  - `make_float_observation(object, value, tag = 'FloatObservation', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,0.000000,0.000000,1.000000])` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new float observation.
  - `make_inclusive_discrete_observation(object, discrete_indices, tag = 'InclusiveDiscreteObservation', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,0.000000,0.000000,1.000000])` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new inclusive discrete observation.
  - `make_inclusive_union_observation(object, elements, tag = 'InclusiveUnionObservation')` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new inclusive union observation.
  - `make_inclusive_union_observation_from_arrays(object, element_names, elements, tag = 'InclusiveUnionObservation')` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new inclusive union observation.
  - `make_location_along_spline_observation(object, spline_component, distance_along_spline, relative_transform = [[0.000000,0.000000,0.000000],[-0.000000,0.000000,0.000000],[1.000000,1.000000,1.000000]], tag = 'LocationAlongSplineObservation', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,0.000000,0.000000,1.000000])` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new location along spline observation.
  - `make_location_observation(object, location, relative_transform = [[0.000000,0.000000,0.000000],[-0.000000,0.000000,0.000000],[1.000000,1.000000,1.000000]], tag = 'LocationObservation', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,0.000000,0.000000,1.000000])` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new location observation.
  - `make_map_observation(object, map, tag = 'MapObservation')` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new map observation.
  - `make_map_observation_from_arrays(object, keys, values, tag = 'MapObservation')` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new map observation.
  - `make_named_exclusive_discrete_observation(object, element_name, tag = 'NamedExclusiveDiscreteObservation', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,0.000000,0.000000,1.000000])` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new named exclusive discrete observation.
  - `make_named_inclusive_discrete_observation(object, element_names, tag = 'NamedInclusiveDiscreteObservation', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,0.000000,0.000000,1.000000])` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new named inclusive discrete observation.
  - `make_null_observation(object, tag = 'NullObservation')` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new null observation.
  - `make_optional_null_observation(object, tag = 'OptionalObservation')` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new null optional observation. Use this to provide a null optional observation.
  - `make_optional_observation(object, element, option, tag = 'OptionalObservation')` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new optional observation.
  - `make_optional_valid_observation(object, element, tag = 'OptionalObservation')` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new valid optional observation. Use this to provide a valid optional observation.
  - `make_pair_observation(object, key, value, tag = 'PairObservation')` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new pair observation.
  - `make_proportion_along_ray_observation(object, ray_start, ray_end, ray_transform = [[0.000000,0.000000,0.000000],[-0.000000,0.000000,0.000000],[1.000000,1.000000,1.000000]], collision_channel = CollisionChannel.ECC_WORLD_STATIC, tag = 'ProportionAlongRayObservation', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,0.000000,0.000000,1.000000])` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new proportion along ray observation.
  - `make_proportion_along_spline_observation(object, spline_component, distance_along_spline, tag = 'ProportionAlongSplineObservation', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,0.000000,0.000000,1.000000])` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new proportion along spline observation.
  - `make_rotation_observation(object, rotation, relative_rotation = [0.000000,0.000000,0.000000], tag = 'RotationObservation', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_rotation_location = [0.000000,0.000000,0.000000], visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,0.000000,0.000000,1.000000])` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new rotation observation.
  - `make_rotation_observation_from_quat(object, rotation, relative_rotation, tag = 'RotationObservation', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_rotation_location = [0.000000,0.000000,0.000000], visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,0.000000,0.000000,1.000000])` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new rotation observation from a quaternion.
  - `make_scale_observation(object, scale, relative_scale = [1.000000,1.000000,1.000000], tag = 'ScaleObservation', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_scale_location = [0.000000,0.000000,0.000000], visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,0.000000,0.000000,1.000000])` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new scale observation.
  - `make_set_observation(object, elements, tag = 'SetObservation')` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new set observation.
  - `make_set_observation_from_array(object, elements, tag = 'SetObservation')` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new set observation.
  - `make_static_array_observation(object, elements, tag = 'StaticArrayObservation')` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new static array observation.
  - `make_struct_observation(object, elements, tag = 'StructObservation')` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new struct observation.
  - `make_struct_observation_from_arrays(object, element_names, elements, tag = 'StructObservation')` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new struct observation.
  - `make_transform_observation(object, transform, relative_transform = [[0.000000,0.000000,0.000000],[-0.000000,0.000000,0.000000],[1.000000,1.000000,1.000000]], tag = 'TransformObservation', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,0.000000,0.000000,1.000000])` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new transform observation.
  - `make_velocity_observation(object, velocity, relative_transform = [[0.000000,0.000000,0.000000],[-0.000000,0.000000,0.000000],[1.000000,1.000000,1.000000]], tag = 'VelocityObservation', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_velocity_location = [0.000000,0.000000,0.000000], visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,0.000000,0.000000,1.000000])` -> `LearningAgentsObservationObjectElement` [classmethod] — Make a new velocity observation.
  - `project_transform_onto_ground_plane(transform, local_forward_vector = [1.000000,0.000000,0.000000], ground_plane_height = 0.000000)` -> `Transform` [classmethod] — Project a transform onto the ground plane, leaving just rotation around the vertical axis
  - `specify_angle_observation(schema, tag = 'AngleObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new angle observation. This will be encoded as a 2-dimension Cartesian vector so that 0 and 350 are close to...
  - `specify_array_observation(schema, element, max_num, attention_encoding_size = 32, attention_head_num = 4, value_encoding_size = 32, tag = 'ArrayObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new array observation. This represents an observation made up of an Array of some other observation. This Ar...
  - `specify_bitmask_observation(schema, enum, tag = 'BitmaskObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new bitmask observation. This represents an inclusive choice from elements of the given Enum. To use this wi...
  - `specify_bool_observation(schema, tag = 'BoolObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new bool observation. A true or false observation.
  - `specify_continuous_observation(schema, size, scale = 1.000000, tag = 'ContinuousObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new continuous observation. This represents an observation made up of several float values.
  - `specify_count_observation(schema, tag = 'CountObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new count observation. This represents a count of something such as the size of, or index into, an array.
  - `specify_direction_along_spline_observation(schema, tag = 'DirectionAlongSplineObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new direction along spline observation. This observes the direction of the spline at the given distance alon...
  - `specify_direction_observation(schema, tag = 'DirectionObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new direction observation. Allows an agent to observe the direction of some entity.
  - `specify_either_observation(schema, a, b, encoding_size = 128, tag = 'EitherObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new either observation. This represents an observation which will be either sub-observation A or sub-observa...
  - `specify_encoding_observation(schema, element, encoding_size = 128, hidden_layer_num = 1, activation_function = LearningAgentsActivationFunction.ELU, tag = 'EncodingObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new encoding observation. This represents an observation which will be an encoding of another sub-observatio...
  - `specify_enum_observation(schema, enum, tag = 'EnumObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new enum observation. This represents an exclusive choice from elements of the given Enum. To use this with ...
  - `specify_exclusive_discrete_observation(schema, size, tag = 'ExclusiveDiscreteObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new exclusive discrete observation. This represents a discrete observation which is an exclusive selection f...
  - `specify_exclusive_union_observation(schema, elements, encoding_size = 128, tag = 'ExclusiveUnionObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new exclusive union observation. This represents an observation which is exclusively chosen from a set of na...
  - `specify_exclusive_union_observation_from_arrays(schema, element_names, elements, encoding_size = 128, tag = 'ExclusiveUnionObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new exclusive union observation. This represents an observation which is exclusively chosen from a set of na...
  - `specify_float_observation(schema, float_scale = 1.000000, tag = 'FloatObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new float observation. A simple observation which can be used as a catch-all for situations where a type-spe...
  - `specify_inclusive_discrete_observation(schema, size, tag = 'InclusiveDiscreteObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new inclusive discrete observation. This represents a discrete observation which is an inclusive selection f...
  - `specify_inclusive_union_observation(schema, elements, attention_encoding_size = 32, attention_head_num = 4, value_encoding_size = 32, tag = 'InclusiveUnionObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new inclusive union observation. This represents an observation which is inclusively chosen from a set of na...
  - `specify_inclusive_union_observation_from_arrays(schema, element_names, elements, attention_encoding_size = 32, attention_head_num = 4, value_encoding_size = 32, tag = 'InclusiveUnionObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new inclusive union observation. This represents an observation which is inclusively chosen from a set of na...
  - `specify_location_along_spline_observation(schema, location_scale = 100.000000, tag = 'LocationAlongSplineObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new location along spline observation. This observes the location of the spline at the given distance along ...
  - `specify_location_observation(schema, location_scale = 100.000000, tag = 'LocationObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new location observation. Allows an agent to observe the location of some entity.
  - `specify_map_observation(schema, key_element, value_element, max_num, attention_encoding_size = 32, attention_head_num = 4, value_encoding_size = 32, tag = 'MapObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new map observation. This represents an observation made up of a Map of some other key and pair observations...
  - `specify_named_exclusive_discrete_observation(schema, element_names, tag = 'NamedExclusiveDiscreteObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new named exclusive discrete observation. This represents a discrete observation which is an exclusive selec...
  - `specify_named_inclusive_discrete_observation(schema, element_names, tag = 'NamedInclusiveDiscreteObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new named inclusive discrete observation. This represents a discrete observation which is an inclusive selec...
  - `specify_null_observation(schema, tag = 'NullObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new null observation. This represents an empty observation and can be useful when an observation is needed w...
  - `specify_optional_observation(schema, element, encoding_size = 128, tag = 'OptionalObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new optional observation. This represents an observation which may or may not be provided.
  - `specify_pair_observation(schema, key, value, tag = 'PairObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new pair observation. This represents an observation made up of two sub-observations.
  - `specify_proportion_along_ray_observation(schema, tag = 'ProportionAlongRayObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new proportion along ray observation. This observes how far a you can travel along a ray before collision. R...
  - `specify_proportion_along_spline_observation(schema, tag = 'ProportionAlongSplineObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new proportion along spline observation. This observes the proportion along a spline at the given distance. ...
  - `specify_rotation_observation(schema, tag = 'RotationObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new rotation observation. Allows an agent to observe the rotation of some entity. Rotations are encoded as t...
  - `specify_scale_observation(schema, tag = 'ScaleObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new scale observation. Allows an agent to observe the scale of some entity. Negative scales are not supporte...
  - `specify_set_observation(schema, element, max_num, attention_encoding_size = 32, attention_head_num = 4, value_encoding_size = 32, tag = 'SetObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new set observation. This represents an observation made up of a Set of some other observation. This Set can...
  - `specify_static_array_observation(schema, element, num, tag = 'StaticArrayObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new static array observation. This represents an observation made up of a fixed-size array of some other obs...
  - `specify_struct_observation(schema, elements, tag = 'StructObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new struct observation. This represents a group of named sub-observations.
  - `specify_struct_observation_from_arrays(schema, element_names, elements, tag = 'StructObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new struct observation. This represents a group of named sub-observations.
  - `specify_transform_observation(schema, location_scale = 100.000000, tag = 'TransformObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new transform observation. Allows an agent to observe the transform of some entity.
  - `specify_velocity_observation(schema, velocity_scale = 200.000000, tag = 'VelocityObservation')` -> `LearningAgentsObservationSchemaElement` [classmethod] — Specifies a new velocity observation. Allows an agent to observe the velocity of some entity.
  - `validate_observation_object_matches_schema(schema, schema_element, object, object_element)` -> `bool` [classmethod] — Validates that the given observation object matches the schema. Will log errors on objects that donât match.

### `unreal.LearningAgentsObservationSchema`
Inherits: `Object` | Header: `LearningAgentsObservations.h`

Observation Schema

### `unreal.LearningAgentsPolicy`
Inherits: `LearningAgentsManagerListener` | Header: `LearningAgentsPolicy.h`

A policy that maps from observations to actions.

**Methods** (12):
  - `decode_and_sample_actions(action_noise_scale = 1.000000)` -> `None` — Decodes and samples action vectors using the Decoder network. This should be called after both MakeActionModifiers and E...
  - `encode_observations()` -> `None` — Encodes the buffered observation vectors using the Encoder network. This should be called after GatherObservations and b...
  - `evaluate_policy()` -> `None` — Calling this function will run the underlying neural network on the previously encoded observations to populate the enco...
  - `get_decoder_network_asset()` -> `LearningAgentsNeuralNetwork` — Gets the current Encoder Network Asset being used
  - `get_encoder_network_asset()` -> `LearningAgentsNeuralNetwork` — Gets the current Encoder Network Asset being used
  - `get_memory_state(agent_id = -1)` -> `Array [ float ]` — Gets the current memory state for a given agent as represented by an abstract vector learned by the policy.
  - `get_memory_state_size()` -> `int32` — Gets the size of the memory state
  - `get_policy_network_asset()` -> `LearningAgentsNeuralNetwork` — Gets the current Policy Network Asset being used
  - `make_policy(manager, interactor, class_=None, name="Policy", encoder_neural_network_asset=None, policy_neural_network_asset=None, decoder_neural_network_asset=None, reinitialize_encoder_network=True, reinitialize_policy_network=True, reinitialize_decoder_network=True, policy_settings=[], manager=LearningAgentsManager, interactor=LearningAgentsInteractor)` [classmethod] — Constructs this object to be used with the given agent interactor and policy settings.
  - `run_inference(action_noise_scale = 1.000000)` -> `None` — Calls GatherObservations, EncodeObservations, EvaluatePolicy, DecodeAndSampleActions, PerformActions
  - `set_memory_state(agent_id=-1, memory_state)` -> `None` — Sets the current memory state for a given agent as represented by an abstract vector learned by the policy.
  - `setup_policy(manager, interactor, encoder_neural_network_asset=None, policy_neural_network_asset=None, decoder_neural_network_asset=None, reinitialize_encoder_network=True, reinitialize_policy_network=True, reinitialize_decoder_network=True, policy_settings=[], interactor=LearningAgentsInteractor)` — Initializes this object to be used with the given agent interactor and policy settings.

### `unreal.LearningAgentsVisualLoggerObject`
Inherits: `Object` | Header: `LearningAgentsManagerListener.h`

Dummy class used for visual logging

### `unreal.LearningAgentsActivationFunction`
Inherits: `EnumBase` | Header: `LearningAgentsNeuralNetwork.h`

Activation functions for neural networks.

**Properties** (3):
  - `ELU`: `LearningAgentsActivationFunction = Ellipsis` — ELU Activation - Generally performs better than ReLU and is not prone to gradient collapse but slowe...
  - `RE_LU`: `LearningAgentsActivationFunction = Ellipsis` — ReLU Activation - Fast to train and evaluate but occasionally causes gradient collapse and untrainab...
  - `TAN_H`: `LearningAgentsActivationFunction = Ellipsis` — TanH Activation - Smooth activation function that is slower to train and evaluate but sometimes more...

### `unreal.LearningAgentsEitherAction`
Inherits: `EnumBase` | Header: `LearningAgentsActions.h`

Enum Type representing either action A or action B

**Properties** (2):
  - `A`: `LearningAgentsEitherAction = Ellipsis` — 0
  - `B`: `LearningAgentsEitherAction = Ellipsis` — 1

### `unreal.LearningAgentsEitherObservation`
Inherits: `EnumBase` | Header: `LearningAgentsObservations.h`

Enum Type representing either observation A or observation B

**Properties** (2):
  - `A`: `LearningAgentsEitherObservation = Ellipsis` — 0
  - `B`: `LearningAgentsEitherObservation = Ellipsis` — 1

### `unreal.LearningAgentsOptionalAction`
Inherits: `EnumBase` | Header: `LearningAgentsActions.h`

Enum Type representing either a Null action or some Valid action

**Properties** (2):
  - `NULL`: `LearningAgentsOptionalAction = Ellipsis` — 0
  - `VALID`: `LearningAgentsOptionalAction = Ellipsis` — 1

### `unreal.LearningAgentsOptionalObservation`
Inherits: `EnumBase` | Header: `LearningAgentsObservations.h`

Enum Type representing either a Null observation or some Valid observation

**Properties** (2):
  - `NULL`: `LearningAgentsOptionalObservation = Ellipsis` — 0
  - `VALID`: `LearningAgentsOptionalObservation = Ellipsis` — 1
