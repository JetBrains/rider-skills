# UE Python API — FieldSystemEngine Module

**28 types** from the `FieldSystemEngine` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `FieldObjectCommands`, `BoxFalloff`, `CullingField`, `FieldNodeBase`, `FieldNodeFloat`, `FieldNodeInt`, `FieldNodeVector`, `FieldSystem`, `FieldSystemActor`, `FieldSystemComponent`, `FieldSystemMetaData`, `FieldSystemMetaDataFilter`, `FieldSystemMetaDataIteration`, `FieldSystemMetaDataProcessingResolution`, `NoiseField`, `OperatorField`, `PlaneFalloff`, `RadialFalloff`, `RadialIntMask`, `RadialVector`, ... (28 total)

---

## Classes

### `unreal.FieldObjectCommands`
Inherits: `StructBase` | Header: `FieldSystemObjects.h`

Field Commands container that will be stored in the construction script

**Properties** (3):
  - `meta_datas`: `None` — [Read-Write] Commands Meta Data (Array[FieldSystemMetaData])
  - `root_nodes`: `None` — [Read-Write] Commands Root Node (Array[FieldNodeBase])
  - `target_names`: `None` — [Read-Write] Commands Target Name (Array[Name])

### `unreal.BoxFalloff`
Inherits: `FieldNodeFloat` | Header: `FieldSystemObjects.h`

Box scalar field that will be defined only within a box

**Methods** (1):
  - `set_box_falloff(magnitude=1.000000, min_range=0.000000, max_range=1.000000, default, transform, falloff)` -> `BoxFalloff` — Box scalar field that will be defined only within a box

**Properties** (6):
  - `default`: `float` — [Read-Write] The field value will be set to Default if the sample distance from the box is higher th...
  - `falloff`: `FieldFalloffType` — [Read-Write] Type of falloff function used to model the evolution of the field from the box surface ...
  - `magnitude`: `float` — [Read-Write] Magnitude of the box falloff field (float)
  - `max_range`: `float` — [Read-Write] The initial function value between 0 and 1 will be scaled between MinRange and MaxRange...
  - `min_range`: `float` — [Read-Write] The initial function value between 0 and 1 will be scaled between MinRange and MaxRange...
  - `transform`: `Transform` — [Read-Write] Translation, Rotation and Scale of the unit box (Transform)

### `unreal.CullingField`
Inherits: `FieldNodeBase` | Header: `FieldSystemObjects.h`

Evaluate the input field according to the result of the culling field

**Methods** (1):
  - `set_culling_field(culling, field, operation)` -> `CullingField` — Evaluate the input field according to the result of the culling field.

**Properties** (3):
  - `culling`: `FieldNodeBase` — [Read-Write] Culling field to be used (FieldNodeBase)
  - `field`: `FieldNodeBase` — [Read-Write] Input field that will be evaluated according to the culling field result (FieldNodeBase...
  - `operation`: `FieldCullingOperationType` — [Read-Write] Evaluate the input field if the result of the culling field is equal to 0 (Inside) or d...

### `unreal.FieldNodeBase`
Inherits: `ActorComponent` | Header: `FieldSystemObjects.h`

Field Evaluation

### `unreal.FieldNodeFloat`
Inherits: `FieldNodeBase` | Header: `FieldSystemObjects.h`

### `unreal.FieldNodeInt`
Inherits: `FieldNodeBase` | Header: `FieldSystemObjects.h`

### `unreal.FieldNodeVector`
Inherits: `FieldNodeBase` | Header: `FieldSystemObjects.h`

### `unreal.FieldSystem`
Inherits: `Object` | Header: `FieldSystemAsset.h`

Field System

### `unreal.FieldSystemActor`
Inherits: `Actor` | Header: `FieldSystemActor.h`

Field System Actor

**Properties** (1):
  - `field_system_component`: `FieldSystemComponent` [Read-Only] — [Read-Only] FieldSystemComponent (FieldSystemComponent)

### `unreal.FieldSystemComponent`
Inherits: `PrimitiveComponent` | Header: `FieldSystemComponent.h`

**Methods** (11):
  - `add_field_command(enabled, target, meta_data, field)` -> `None`
  - `add_persistent_field(enabled, target, meta_data, field)` -> `None`
  - `apply_linear_force(enabled, direction, magnitude)` -> `None`
  - `apply_physics_field(enabled, target, meta_data, field)` -> `None`
  - `apply_radial_force(enabled, position, magnitude)` -> `None`
  - `apply_radial_vector_falloff_force(enabled, position, radius, magnitude)` -> `None`
  - `apply_stay_dynamic_field(enabled, position, radius)` -> `None`
  - `apply_strain_field(enabled, position, radius, magnitude, iterations)` -> `None`
  - `apply_uniform_vector_falloff_force(enabled, position, direction, radius, magnitude)` -> `None`
  - `remove_persistent_fields()` -> `None` — RemovePersistentFields This function will remove all the field component persistent fields from chaos and from the world
  - `reset_field_system()` -> `None` — RemoveConstructionFields This function will remove all the field component construction fields from chaos and from the w...

**Properties** (1):
  - `field_system`: `FieldSystem` [Read-Only] — [Read-Only] Field system asset to be used to store the construction fields. This asset is not requir...

### `unreal.FieldSystemMetaData`
Inherits: `ActorComponent` | Header: `FieldSystemObjects.h`

### `unreal.FieldSystemMetaDataFilter`
Inherits: `FieldSystemMetaData` | Header: `FieldSystemObjects.h`

Filter the particles on which the field will be applied

**Methods** (1):
  - `set_meta_data_filter_type(filter_type, object_type, position_type)` -> `FieldSystemMetaDataFilter` — Set the particles filter type

**Properties** (3):
  - `filter_type`: `FieldFilterType` — [Read-Write] Filter state type used to select the particles on which the field will be applied (Fiel...
  - `object_type`: `FieldObjectType` — [Read-Write] Filter object type used to select the particles on which the field will be applied (Fie...
  - `position_type`: `FieldPositionType` — [Read-Write] Specify which position type will be used for the field evaluation (FieldPositionType)

### `unreal.FieldSystemMetaDataIteration`
Inherits: `FieldSystemMetaData` | Header: `FieldSystemObjects.h`

UFieldSystemMetaDataIteration : Not used anymore, just hiding it right now but will probably be deprecated if not used in the future

**Methods** (1):
  - `set_meta_data_iteration(iterations = 1)` -> `FieldSystemMetaDataIteration` — Set the number of iteration type

**Properties** (1):
  - `iterations`: `int` — [Read-Write] Number of iterations (WIP) (int32)

### `unreal.FieldSystemMetaDataProcessingResolution`
Inherits: `FieldSystemMetaData` | Header: `FieldSystemObjects.h`

Control the set of particles on which the field will be applied

**Methods** (1):
  - `set_meta_dataa_processing_resolution_type(resolution_type)` -> `FieldSystemMetaDataProcessingResolution` — Set the processing resolution type

**Properties** (1):
  - `resolution_type`: `FieldResolutionType` — [Read-Write] Precessing resolution type used to select the particles on which the field will be appl...

### `unreal.NoiseField`
Inherits: `FieldNodeFloat` | Header: `FieldSystemObjects.h`

Defines a perlin noise scalar value if the sample is within a box

**Methods** (1):
  - `set_noise_field(min_range=0.000000, max_range=1.000000, transform)` -> `NoiseField` — Defines a perlin noise scalar value if the sample is within a box

**Properties** (3):
  - `max_range`: `float` — [Read-Write] The initial function value between 0 and 1 will be scaled between MinRange and MaxRange...
  - `min_range`: `float` — [Read-Write] The initial function value between 0 and 1 will be scaled between MinRange and MaxRange...
  - `transform`: `Transform` — [Read-Write] Transform of the box in which the perlin noise will be defined (Transform)

### `unreal.OperatorField`
Inherits: `FieldNodeBase` | Header: `FieldSystemObjects.h`

Compute an operation between 2 incoming fields

**Methods** (1):
  - `set_operator_field(magnitude=1.000000, left_field, right_field, operation)` -> `OperatorField` — Compute an operation between 2 incoming fields

**Properties** (4):
  - `left_field`: `FieldNodeBase` — [Read-Write] Left field to be processed (FieldNodeBase)
  - `magnitude`: `float` — [Read-Write] Magnitude of the operator field (float)
  - `operation`: `FieldOperationType` — [Read-Write] Type of operation you want to perform between the 2 fields (FieldOperationType)
  - `right_field`: `FieldNodeBase` — [Read-Write] Right field to be processed (FieldNodeBase)

### `unreal.PlaneFalloff`
Inherits: `FieldNodeFloat` | Header: `FieldSystemObjects.h`

Plane scalar field that will be defined only within a distance from a plane

**Methods** (1):
  - `set_plane_falloff(magnitude=1.000000, min_range=0.000000, max_range=1.000000, default, distance, position, normal, falloff)` -> `PlaneFalloff` — Plane scalar field that will be defined only within a distance from a plane

**Properties** (8):
  - `default`: `float` — [Read-Write] The field value will be set to Default if the sample distance from the plane is higher ...
  - `distance`: `float` — [Read-Write] Distance limit for the plane falloff field (float)
  - `falloff`: `FieldFalloffType` — [Read-Write] Type of falloff function used to model the evolution of the field from the plane surfac...
  - `magnitude`: `float` — [Read-Write] Magnitude of the plane falloff field (float)
  - `max_range`: `float` — [Read-Write] The initial function value between 0 and 1 will be scaled between MinRange and MaxRange...
  - `min_range`: `float` — [Read-Write] The initial function value between 0 and 1 will be scaled between MinRange and MaxRange...
  - `normal`: `Vector` — [Read-Write] Plane normal of the plane falloff field (Vector)
  - `position`: `Vector` — [Read-Write] Plane position of the plane falloff field (Vector)

### `unreal.RadialFalloff`
Inherits: `FieldNodeFloat` | Header: `FieldSystemObjects.h`

Sphere scalar field that will be defined only within a sphere

**Methods** (1):
  - `set_radial_falloff(magnitude=1.000000, min_range=0.000000, max_range=1.000000, default, radius, position, falloff)` -> `RadialFalloff` — Sphere scalar field that will be defined only within a sphere

**Properties** (7):
  - `default`: `float` — [Read-Write] The field value will be set to Default if the sample distance from the center is higher...
  - `falloff`: `FieldFalloffType` — [Read-Write] Type of falloff function used to model the evolution of the field from the sphere cente...
  - `magnitude`: `float` — [Read-Write] Magnitude of the sphere falloff field (float)
  - `max_range`: `float` — [Read-Write] The initial function value between 0 and 1 will be scaled between MinRange and MaxRange...
  - `min_range`: `float` — [Read-Write] The initial function value between 0 and 1 will be scaled between MinRange and MaxRange...
  - `position`: `Vector` — [Read-Write] Center position of the sphere falloff field (Vector)
  - `radius`: `float` — [Read-Write] Radius of the sphere falloff field (float)

### `unreal.RadialIntMask`
Inherits: `FieldNodeInt` | Header: `FieldSystemObjects.h`

This function first defines a radial integer field equal to Interior-value inside a sphere / Exterior-value outside. This field will be used alongside the particle input value and the mask condition t...

**Methods** (1):
  - `set_radial_int_mask(radius, position, interior_value=1, exterior_value, set_mask_condition_in)` -> `RadialIntMask` — This function first defines a radial integer field equal to Interior-value inside a sphere / Exterior-value outside. Thi...

**Properties** (5):
  - `exterior_value`: `int` — [Read-Write] If the sample distance from the center is greater than radius, the intermediate value w...
  - `interior_value`: `int` — [Read-Write] If the sample distance from the center is less than radius, the intermediate value will...
  - `position`: `Vector` — [Read-Write] Center position of the radial mask field (Vector)
  - `radius`: `float` — [Read-Write] Radius of the radial mask field (float)
  - `set_mask_condition`: `SetMaskConditionType` — [Read-Write] If the mask condition is set to always the output value will be the intermediate one. I...

### `unreal.RadialVector`
Inherits: `FieldNodeVector` | Header: `FieldSystemObjects.h`

Set a radial vector value, the direction being the vector from the sample position to the field one. The output is equal to magnitude * direction

**Methods** (1):
  - `set_radial_vector(magnitude=1.000000, position)` -> `RadialVector` — Set a radial vector value. The direction is the normalized vector from the field position to the sample one. The output ...

**Properties** (2):
  - `magnitude`: `float` — [Read-Write] Magnitude of the radial vector field (float)
  - `position`: `Vector` — [Read-Write] Center position of the radial vector field (Vector)

### `unreal.RandomVector`
Inherits: `FieldNodeVector` | Header: `FieldSystemObjects.h`

Set a random vector value independently of the sample position. The output is equal to magnitude * random direction

**Methods** (1):
  - `set_random_vector(magnitude = 1.000000)` -> `RandomVector` — Set a random vector value independently of the sample position. The output is equal to magnitude * random direction

**Properties** (1):
  - `magnitude`: `float` — [Read-Write] Magnitude of the random vector field (float)

### `unreal.ReturnResultsTerminal`
Inherits: `FieldNodeBase` | Header: `FieldSystemObjects.h`

Terminal field of a graph

**Methods** (1):
  - `set_return_results_terminal()` -> `ReturnResultsTerminal` — Terminal field of a graph

### `unreal.ToFloatField`
Inherits: `FieldNodeFloat` | Header: `FieldSystemObjects.h`

Convert an integer field to a scalar one

**Methods** (1):
  - `set_to_float_field(integer_field)` -> `ToFloatField` — Convert an integer field to a float one

**Properties** (1):
  - `int_field`: `FieldNodeInt` — [Read-Write] Integer field to be converted to an a scalar one (FieldNodeInt)

### `unreal.ToIntegerField`
Inherits: `FieldNodeInt` | Header: `FieldSystemObjects.h`

Convert a scalar field to a integer one

**Methods** (1):
  - `set_to_integer_field(float_field)` -> `ToIntegerField` — Convert a float field to a integer one

**Properties** (1):
  - `float_field`: `FieldNodeFloat` — [Read-Write] Scalar field to be converted to an an integer one (FieldNodeFloat)

### `unreal.UniformInteger`
Inherits: `FieldNodeInt` | Header: `FieldSystemObjects.h`

Set a uniform integer value independently of the sample position. The output is equal to magnitude

**Methods** (1):
  - `set_uniform_integer(magnitude = 0)` -> `UniformInteger` — Set a uniform integer value independently of the sample position. The output is equal to magnitude

**Properties** (1):
  - `magnitude`: `int` — [Read-Write] The field output will be equal the magnitude (int32)

### `unreal.UniformScalar`
Inherits: `FieldNodeFloat` | Header: `FieldSystemObjects.h`

Set a uniform scalar value independently of the sample position. The output is equal to magnitude

**Methods** (1):
  - `set_uniform_scalar(magnitude = 1.000000)` -> `UniformScalar` — Set a uniform scalar value independently of the sample position. The output is equal to magnitude

**Properties** (1):
  - `magnitude`: `float` — [Read-Write] The field output will be equal the magnitude (float)

### `unreal.UniformVector`
Inherits: `FieldNodeVector` | Header: `FieldSystemObjects.h`

Set a uniform vector value independently of the sample position.The output is equal to magnitude * direction

**Methods** (1):
  - `set_uniform_vector(magnitude=1.000000, direction)` -> `UniformVector` — Set a uniform vector value independently of the sample position.The output is equal to magnitude * direction

**Properties** (2):
  - `direction`: `Vector` — [Read-Write] Normalized direction of the uniform vector field (Vector)
  - `magnitude`: `float` — [Read-Write] Magnitude of the uniform vector field (float)

### `unreal.WaveScalar`
Inherits: `FieldNodeFloat` | Header: `FieldSystemObjects.h`

Set a temporal wave scalar value according to the sample distance from the field position.

**Methods** (1):
  - `set_wave_scalar(magnitude=1.000000, position, wavelength=1000.000000, period=1.000000, time, function, falloff)` -> `WaveScalar` — Set a temporal wave scalar value according to the sample distance from the field position.

**Properties** (6):
  - `falloff`: `FieldFalloffType` — [Read-Write] Type of falloff function used if the falloff function is picked (FieldFalloffType)
  - `function`: `WaveFunctionType` — [Read-Write] Wave function used for the field (WaveFunctionType)
  - `magnitude`: `float` — [Read-Write] Magnitude of the wave function (float)
  - `period`: `float` — [Read-Write] Time over which the wave will travel from one peak to another one. The wave velocity is...
  - `position`: `Vector` — [Read-Write] Center position of the wave field (Vector)
  - `wavelength`: `float` — [Read-Write] Distance between 2 wave peaks (float)
