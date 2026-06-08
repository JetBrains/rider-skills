# UE Python API — PCG Module

**510 types** from the `PCG` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DeterminismTestResult`, `EnumSelector`, `PCGActorPropertyOverride`, `PCGActorSelectorSettings`, `PCGAnimBankDataRow`, `PCGAssetExporterParameters`, `PCGAttributeFilterThresholdSettings`, `PCGAttributeIdentifier`, `PCGAttributePropertyInputSelector`, `PCGAttributePropertyOutputNoSourceSelector`, `PCGAttributePropertyOutputSelector`, `PCGAttributePropertySelector`, `PCGCollisionShape`, `PCGComponentSelectorSettings`, `PCGContext`, `PCGCrc`, `PCGDataCollection`, `PCGDataLayerReferenceSelector`, `PCGDataLayerSettings`, `PCGDataPtrWrapper`, ... (510 total)

---

## Classes

### `unreal.DeterminismTestResult`
Inherits: `StructBase` | Header: `PCGDeterminismTestsCommon.h`

Determinism Test Result

**Properties** (8):
  - `additional_details`: `None` — additional details] (Array[str]) [Read-Write] A mapping of [test name
  - `data_types_tested`: `PCGDataType` — [Read-Write] BitFlags for which data types were tested (PCGDataType)
  - `flag_raised`: `bool` — [Read-Write] T/F whether a flag has been raised on this nodeâs tests (for UI) (bool)
  - `index`: `int` [Read-Only] — [Read-Only] The test result index. (int64)
  - `seed`: `int` — [Read-Write] (int32)
  - `test_result_name`: `str` [Read-Only] — [Read-Only] The nodeâs name (str)
  - `test_result_title`: `Name` [Read-Only] — [Read-Only] The nodeâs title (Name)
  - `test_results`: `None` — test results] (Map[Name,DeterminismLevel]) [Read-Write] A mapping of [test names

### `unreal.EnumSelector`
Inherits: `StructBase` | Header: `PCGControlFlow.h`

Enum Selector

### `unreal.PCGActorPropertyOverride`
Inherits: `StructBase` | Header: `PCGObjectPropertyOverride.h`

PCGActor Property Override

### `unreal.PCGActorSelectorSettings`
Inherits: `StructBase` | Header: `PCGActorSelector.h`

Helper struct for organizing queries against the world to gather actors.

**Properties** (10):
  - `actor_filter`: `PCGActorFilter` — [Read-Write] Which actors to consider. (PCGActorFilter)
  - `actor_reference_selector`: `PCGAttributePropertyInputSelector` — [Read-Write] Controls what attribute to read from when the actor selector uses the âFromInputâ a...
  - `actor_selection`: `PCGActorSelection` — [Read-Write] How to select when filtering actors. (PCGActorSelection)
  - `actor_selection_class`: `Class` — [Read-Write] Actor class to match against when filtering actors. (type(Class))
  - `actor_selection_tag`: `Name` — [Read-Write] Tag to match against when filtering actors. (Name)
  - `disable_filter`: `bool` — [Read-Write] Enables/disables fine-grained actor filtering options. (bool)
  - `ignore_self_and_children`: `bool` — [Read-Write] If true, ignores results found from within this actorâs hierarchy. (bool)
  - `include_children`: `bool` — [Read-Write] Whether to consider child actors. (bool)
  - `must_overlap_self`: `bool` — [Read-Write] Filters out actors that do not overlap the source component bounds. (bool)
  - `select_multiple`: `bool` — [Read-Write] If true processes all matching actors, otherwise returns data from first match. (bool)

### `unreal.PCGAnimBankDataRow`
Inherits: `TableRowBase` | Header: `PCGSkinnedMeshDescriptor.h`

PCGAnim Bank Data Row

### `unreal.PCGAssetExporterParameters`
Inherits: `StructBase` | Header: `PCGAssetExporter.h`

Common structure to hold saving options required to export or update PCG assets.

**Properties** (4):
  - `asset_name`: `str` — [Read-Write] Target asset path name (str)
  - `asset_path`: `str` — [Read-Write] Target asset path to write the PCG assets to. (str)
  - `open_save_dialog`: `bool` — [Read-Write] Controls whether we will open a Saveâ¦ dialog, works only when a single level is expor...
  - `save_on_export_ended`: `bool` — [Read-Write] Controls whether the assets will be saved at the end of the process or not. (bool)

### `unreal.PCGAttributeFilterThresholdSettings`
Inherits: `StructBase` | Header: `PCGAttributeFilter.h`

PCGAttribute Filter Threshold Settings

**Properties** (5):
  - `attribute_types`: `PCGMetadataTypesConstantStruct` — [Read-Write] (PCGMetadataTypesConstantStruct)
  - `inclusive`: `bool` — [Read-Write] If the threshold in included or excluded from the range. (bool)
  - `threshold_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `use_constant_threshold`: `bool` — [Read-Write] (bool)
  - `use_spatial_query`: `bool` — [Read-Write] For Point Data, enabling this option will use sampling rather than comparing points 1 t...

### `unreal.PCGAttributeIdentifier`
Inherits: `StructBase` | Header: `PCGMetadataCommon.h`

PCGAttribute Identifier

**Properties** (2):
  - `metadata_domain`: `PCGMetadataDomainID` — [Read-Write] (PCGMetadataDomainID)
  - `name`: `Name` — [Read-Write] (Name)

### `unreal.PCGAttributePropertyInputSelector`
Inherits: `PCGAttributePropertySelector` | Header: `PCGAttributePropertySelector.h`

Struct that will default on Last: (or LastCreated: for previously created selectors).

**Methods** (1):
  - `copy_and_fix_last(data)` -> `PCGAttributePropertyInputSelector` — Copy and Fix Last

### `unreal.PCGAttributePropertyOutputNoSourceSelector`
Inherits: `PCGAttributePropertySelector` | Header: `PCGAttributePropertySelector.h`

Version where it doesnât make sense to have Source,: alias for FPCGAttributePropertySelector

### `unreal.PCGAttributePropertyOutputSelector`
Inherits: `PCGAttributePropertyOutputNoSourceSelector` | Header: `PCGAttributePropertySelector.h`

Struct that will default on Source.:

**Methods** (1):
  - `copy_and_fix_source(input_selector, optional_data = None)` -> `PCGAttributePropertyOutputSelector` — Copy and Fix Source

### `unreal.PCGAttributePropertySelector`
Inherits: `StructBase` | Header: `PCGAttributePropertySelector.h`

Blueprint class to allow to select an attribute or a property. It will handle the logic and can only be modified using the blueprint library defined below. Also has a custom detail view in the PCGEdit...

**Methods** (13):
  - `get_attribute_name()` -> `Name` — Get Attribute Name
  - `get_domain_name()` -> `Name` — Get Domain Name
  - `get_extra_names()` -> `Array [ str ]` — Get Extra Names
  - `get_extra_property()` -> `PCGExtraProperties` — Get Extra Property
  - `get_name()` -> `Name` — Get Name
  - `get_point_property()` -> `PCGPointProperties` — Get Point Property
  - `get_property_name()` -> `Name` — Get Property Name
  - `get_selection()` -> `PCGAttributePropertySelection` — Get Selection
  - `set_attribute_name(attribute_name, reset_extra_names = True)` -> `bool` — Set Attribute Name
  - `set_domain_name(domain_name, reset_extra_names = True)` -> `bool` — Set Domain Name
  - `set_extra_property(extra_property, reset_extra_names = True)` -> `bool` — Set Extra Property
  - `set_point_property(point_property, reset_extra_names = True)` -> `bool` — Set Point Property
  - `set_property_name(property_name, reset_extra_names = True)` -> `bool` — Set Property Name

### `unreal.PCGCollisionShape`
Inherits: `StructBase` | Header: `PCGCollisionShape.h`

Parameters for conducting a sweep with a specified shape against the physical world.

### `unreal.PCGComponentSelectorSettings`
Inherits: `StructBase` | Header: `PCGActorSelector.h`

PCGComponent Selector Settings

**Properties** (3):
  - `component_selection`: `PCGComponentSelection` — [Read-Write] How to select when filtering actors. (PCGComponentSelection)
  - `component_selection_class`: `Class` — [Read-Write] Actor class to match against when filtering actors. (type(Class))
  - `component_selection_tag`: `Name` — [Read-Write] Tag to match against when filtering actors. (Name)

### `unreal.PCGContext`
Inherits: `StructBase` | Header: `PCGContext.h`

**Methods** (7):
  - `get_actor_data()` -> `PCGData` — Get Actor Data
  - `get_component()` -> `PCGComponent` — Get Component
  - `get_input_data()` -> `PCGData` — Get Input Data
  - `get_original_component()` -> `PCGComponent` — Get Original Component
  - `get_settings()` -> `PCGSettings` — Get Settings
  - `get_target_actor(spatial_data)` -> `Actor` — Get Target Actor
  - `get_task_id()` -> `int64` — Get Task Id

### `unreal.PCGCrc`
Inherits: `StructBase` | Header: `PCGCrc.h`

Crc with valid flag and helper functionality.

### `unreal.PCGDataCollection`
Inherits: `StructBase` | Header: `PCGData.h`

PCGData Collection

**Methods** (5):
  - `add_to_collection(data, pin_label, tags)` -> `None` — Adds a data object to a given collection, simpler usage than making a PCGTaggedData object. InTags can be empty.
  - `get_typed_inputs()` — Gets all inputs of the given class type, returning matching tagged data in the OutTaggedData value too
  - `get_typed_inputs_by_pin()` — Gets all inputs of the given class type and on the given pin, returning matching tagged data in the OutTaggedData value ...
  - `get_typed_inputs_by_pin_label()` — Gets all inputs of the given class type and on the given pin label, returning matching tagged data in the OutTaggedData ...
  - `get_typed_inputs_by_tag()` — Gets all inputs of the given class type and having the provided tag, returning matching tagged data in the OutTaggedData...

**Properties** (2):
  - `cancel_execution_on_empty`: `bool` — [Read-Write] Deprecated - Will be removed in 5.4 (bool)
  - `tagged_data`: `None` — [Read-Write] (Array[PCGTaggedData])

### `unreal.PCGDataLayerReferenceSelector`
Inherits: `StructBase` | Header: `PCGDataLayerHelpers.h`

PCGData Layer Reference Selector

**Properties** (3):
  - `as_input`: `bool` — [Read-Write] Set it to true to get Data Layers through input attribute set. (bool)
  - `attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `data_layers`: `None` — [Read-Write] (Array[DataLayerAsset])

### `unreal.PCGDataLayerSettings`
Inherits: `StructBase` | Header: `PCGDataLayerHelpers.h`

PCGData Layer Settings

**Properties** (5):
  - `add_data_layers`: `PCGDataLayerReferenceSelector` — [Read-Write] Specified Data Layers will get added (PCGDataLayerReferenceSelector)
  - `data_layer_reference_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `data_layer_source_type`: `PCGDataLayerSource` — [Read-Write] What source should be used to assign Data Layers to the spawned actor (PCGDataLayerSour...
  - `excluded_data_layers`: `PCGDataLayerReferenceSelector` — [Read-Write] Specified Data Layers will get excluded from the Data Layer Source (PCGDataLayerReferen...
  - `included_data_layers`: `PCGDataLayerReferenceSelector` — [Read-Write] When left empty, all Data Layers from the Data Layer Source are included, if any Data L...

### `unreal.PCGDataPtrWrapper`
Inherits: `StructBase` | Header: `PCGDataPtrWrapper.h`

Wrapper to do ref-counting inside of FPCGDataCollection, so we can release temporary resources earlier.

### `unreal.PCGDebugVisualizationSettings`
Inherits: `StructBase` | Header: `PCGDebug.h`

PCGDebug Visualization Settings

**Properties** (4):
  - `material_override`: `MaterialInterface` — [Read-Write] (MaterialInterface)
  - `point_mesh`: `StaticMesh` — [Read-Write] (StaticMesh)
  - `point_scale`: `float` — [Read-Write] (float)
  - `scale_method`: `PCGDebugVisScaleMethod` — [Read-Write] (PCGDebugVisScaleMethod)

### `unreal.PCGDefaultValueContainer`
Inherits: `StructBase` | Header: `PCGDefaultValueContainer.h`

A struct used to store a default value locally for use with inline constant values.

### `unreal.PCGDeterminismSettings`
Inherits: `StructBase` | Header: `PCGDeterminismSettings.h`

PCGDeterminism Settings

**Properties** (3):
  - `determinism_test_blueprint`: `Class` [Read-Only] — [Read-Only] (type(Class))
  - `native_tests`: `bool` — [Read-Write] (bool)
  - `use_blueprint_determinism_test`: `bool` — [Read-Write] (bool)

### `unreal.PCGDummyGetPropertyLevel2Struct`
Inherits: `StructBase` | Header: `PCGGetActorPropertyTest.h`

PCGDummy Get Property Level 2Struct

**Properties** (1):
  - `double_array_property`: `None` [Read-Only] — [Read-Only] (Array[double])

### `unreal.PCGDummyGetPropertyStruct`
Inherits: `StructBase` | Header: `PCGGetActorPropertyTest.h`

PCGDummy Get Property Struct

**Properties** (3):
  - `float_property`: `float` [Read-Only] — [Read-Only] (float)
  - `int_array_property`: `None` [Read-Only] — [Read-Only] (Array[int32])
  - `level2_struct`: `PCGDummyGetPropertyLevel2Struct` [Read-Only] — [Read-Only] (PCGDummyGetPropertyLevel2Struct)

### `unreal.PCGGrammarSelection`
Inherits: `StructBase` | Header: `PCGGrammar.h`

PCGGrammar Selection

**Properties** (3):
  - `grammar_as_attribute`: `bool` — [Read-Write] Read the grammar as an attribute rather than directly from the settings.
Grammar syntax...
  - `grammar_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] Attribute to be taken from the input spline containing the grammar to use. (PCGAttribut...
  - `grammar_string`: `str` — [Read-Write] An encoded string that represents how to apply a set of rules to a series of defined mo...

### `unreal.PCGGraphEditorCustomization`
Inherits: `StructBase` | Header: `PCGGraphCustomization.h`

Container struct for editor customization of a specific graph. This will grow/evolve as we expose more options to adapt the PCG editor to specific use cases. This can be used to restrict choices and t...

### `unreal.PCGHLODSettings`
Inherits: `StructBase` | Header: `PCGHLODHelpers.h`

**Properties** (2):
  - `hlod_layer`: `HLODLayer` — [Read-Write] (HLODLayer)
  - `hlod_source_type`: `PCGHLODSource` — [Read-Write] What source should be used to assign HLOD Layer to the spawned actor (PCGHLODSource)

### `unreal.PCGInitializeFromDataParams`
Inherits: `StructBase` | Header: `PCGSpatialData.h`

PCGInitialize from Data Params

**Properties** (5):
  - `domain_mapping`: `None` — [Read-Write] When initializing metadata from different types, can provide an extra mapping to know h...
  - `inherit_attributes`: `bool` — [Read-Write] (bool)
  - `inherit_metadata`: `bool` — [Read-Write] (bool)
  - `inherit_spatial_data`: `bool` — [Read-Write] (bool)
  - `source`: `PCGSpatialData` — [Read-Write] (PCGSpatialData)

### `unreal.PCGKernelAttributeKey`
Inherits: `StructBase` | Header: `PCGDataForGPU.h`

Attribute name and type which uniquely identify an attribute in a compute graph.

### `unreal.PCGLandscapeDataProps`
Inherits: `StructBase` | Header: `PCGLandscapeData.h`

PCGLandscape Data Props

**Properties** (7):
  - `get_actor_reference`: `bool` — [Read-Write] Controls whether the points from this landscape will return the actor from which they o...
  - `get_component_coordinates`: `bool` — [Read-Write] Controls whether the component coordinates will be added the point as attributes (âCo...
  - `get_height_only`: `bool` — [Read-Write] Controls whether the points projected on the landscape will return the normal/tangent (...
  - `get_layer_weights`: `bool` — [Read-Write] Controls whether data from landscape layers will be retrieved (turning it off is an opt...
  - `get_physical_material`: `bool` — [Read-Write] Controls whether the points from the landscape will have their physical material added ...
  - `sample_virtual_texture_normals`: `bool` — [Read-Write] Controls whether the landscape will try to sample normals from a normals virtual textur...
  - `sample_virtual_textures`: `bool` — [Read-Write] Controls whether the landscape will try to sample from the landscape virtual textures (...

### `unreal.PCGLandscapeLayerWeight`
Inherits: `StructBase` | Header: `PCGLandscapeCache.h`

PCGLandscape Layer Weight

**Properties** (2):
  - `name`: `Name` — [Read-Write] (Name)
  - `weight`: `float` — [Read-Write] (float)

### `unreal.PCGMatchAndSetByAttributeEntry`
Inherits: `StructBase` | Header: `PCGMatchAndSetByAttribute.h`

PCGMatch and Set by Attribute Entry

**Properties** (2):
  - `value`: `PCGMetadataTypesConstantStruct` — [Read-Write] (PCGMetadataTypesConstantStruct)
  - `value_to_match`: `PCGMetadataTypesConstantStruct` — [Read-Write] (PCGMetadataTypesConstantStruct)

### `unreal.PCGMatchAndSetWeightedByCategoryEntryList`
Inherits: `StructBase` | Header: `PCGMatchAndSetWeightedByCategory.h`

PCGMatch and Set Weighted by Category Entry List

**Properties** (3):
  - `category_value`: `PCGMetadataTypesConstantStruct` — [Read-Write] (PCGMetadataTypesConstantStruct)
  - `is_default`: `bool` — [Read-Write] If the category is the default, if the input does not match to anything, it will use th...
  - `weighted_entries`: `None` — [Read-Write] Values and their weights (Array[PCGMatchAndSetWeightedEntry])

### `unreal.PCGMatchAndSetWeightedEntry`
Inherits: `StructBase` | Header: `PCGMatchAndSetWeighted.h`

PCGMatch and Set Weighted Entry

**Properties** (2):
  - `value`: `PCGMetadataTypesConstantStruct` — [Read-Write] (PCGMetadataTypesConstantStruct)
  - `weight`: `int` — [Read-Write] Relative weight of this entry (int32)

### `unreal.PCGMeshInstanceList`
Inherits: `StructBase` | Header: `PCGMeshSelectorBase.h`

PCGMesh Instance List

**Properties** (4):
  - `instances`: `None` — [Read-Write] (Array[Transform])
  - `instances_indices`: `None` — [Read-Write] (Array[int32])
  - `instances_metadata_entry`: `None` — [Read-Write]
deprecated: Property âInstancesMetadataEntryâ is deprecated. (Array[int64])
  - `point_data`: `PCGBasePointData` — [Read-Write] (PCGBasePointData)

### `unreal.PCGMeshSelectorWeightedEntry`
Inherits: `StructBase` | Header: `PCGMeshSelectorWeighted.h`

PCGMesh Selector Weighted Entry

**Properties** (1):
  - `weight`: `int` — [Read-Write] (int32)

### `unreal.PCGMetadataDomainID`
Inherits: `StructBase` | Header: `PCGMetadataCommon.h`

PCGMetadata Domain ID

**Properties** (3):
  - `custom_flag`: `int` — [Read-Write] (int32)
  - `debug_name`: `Name` — [Read-Write] (Name)
  - `flag`: `PCGMetadataDomainFlag` — [Read-Write] (PCGMetadataDomainFlag)

### `unreal.PCGMetadataTypesConstantStruct`
Inherits: `StructBase` | Header: `PCGMetadataTypesConstantStruct.h`

Struct to be re-used when you need to show constants types for a metadata type It will store all our values, and will display nicely depending on the type chosen

**Properties** (16):
  - `bool_value`: `bool` — [Read-Write] (bool)
  - `double_value`: `float` — [Read-Write] (double)
  - `float_value`: `float` — [Read-Write] All different types (float)
  - `int32_value`: `int` — [Read-Write] (int32)
  - `int_value`: `int` — [Read-Write] (int64)
  - `name_value`: `Name` — [Read-Write] (Name)
  - `quat_value`: `Quat` — [Read-Write] (Quat)
  - `rotator_value`: `Rotator` — [Read-Write] (Rotator)
  - `soft_class_path_value`: `SoftClassPath` — [Read-Write] (SoftClassPath)
  - `soft_object_path_value`: `SoftObjectPath` — [Read-Write] (SoftObjectPath)
  - `string_value`: `str` — [Read-Write] (str)
  - `transform_value`: `Transform` — [Read-Write] (Transform)
  - `type`: `PCGMetadataTypes` — [Read-Write] (PCGMetadataTypes)
  - `vector2_value`: `Vector2D` — [Read-Write] (Vector2D)
  - `vector4_value`: `Vector4` — [Read-Write] (Vector4)
  - `vector_value`: `Vector` — [Read-Write] (Vector)

### `unreal.PCGObjectPropertyOverrideDescription`
Inherits: `StructBase` | Header: `PCGObjectPropertyOverride.h`

Represents the override source (to be read) and the object property (to be written).

### `unreal.PCGOverrideInstancedPropertyBag`
Inherits: `StructBase` | Header: `PCGGraph.h`

Extended version of FInstancedPropertyBag, to support overrides and have a custom UI for it Must only be used with PCGGraphInstances. TODO: Should be made generic and moved to ScriptUtils.

### `unreal.PCGPackedCustomData`
Inherits: `StructBase` | Header: `PCGInstanceDataPackerBase.h`

PCGPacked Custom Data

**Properties** (2):
  - `custom_data`: `None` — [Read-Write] (Array[float])
  - `num_custom_data_floats`: `int` — [Read-Write] (int32)

### `unreal.PCGPinProperties`
Inherits: `StructBase` | Header: `PCGPin.h`

PCGPin Properties

**Methods** (8):
  - `allows_multiple_connections()` -> `bool` — Allows Multiple Connections
  - `is_advanced_pin()` -> `bool` — Is Advanced Pin
  - `is_normal_pin()` -> `bool` — Is Normal Pin
  - `is_required_pin()` -> `bool` — Is Required Pin
  - `set_advanced_pin()` -> `None` — Set Advanced Pin
  - `set_allow_multiple_connections(allow_multiple_connections)` -> `None` — Set Allow Multiple Connections
  - `set_normal_pin()` -> `None` — Set Normal Pin
  - `set_required_pin()` -> `None` — Set Required Pin

**Properties** (8):
  - `advanced_pin`: `bool` — [Read-Write] Advanced pin will be hidden by default in the UI and will be shown only if the user ext...
  - `allow_multiple_connections`: `bool` — [Read-Write] (bool)
  - `allow_multiple_data`: `bool` — [Read-Write] (bool)
  - `allowed_types`: `PCGDataType` — [Read-Write] (PCGDataType)
  - `invisible_pin`: `bool` — [Read-Write] (bool)
  - `label`: `Name` — [Read-Write] (Name)
  - `pin_status`: `PCGPinStatus` — [Read-Write] Define the status of a given pin (Normal, Required or Advanced) (PCGPinStatus)
  - `usage`: `PCGPinUsage` — [Read-Write] (PCGPinUsage)

### `unreal.PCGPinPropertiesGPU`
Inherits: `PCGPinProperties` | Header: `PCGPinPropertiesGPU.h`

An extension of the pin properties that adds hints for GPU specific properties, such as buffer size and data layout.

**Properties** (1):
  - `properties_gpu`: `PCGPinPropertiesGPUStruct` — [Read-Write] (PCGPinPropertiesGPUStruct)

### `unreal.PCGPinPropertiesGPUStruct`
Inherits: `StructBase` | Header: `PCGPinPropertiesGPU.h`

Helper struct to nest GPU pin properties inside a UI category.

**Properties** (10):
  - `attribute_inheritance_mode`: `PCGAttributeInheritanceMode` — [Read-Write] How to inherit attribute names, types, and values. (PCGAttributeInheritanceMode)
  - `data_count`: `int` — [Read-Write] Number of data to create. (int32)
  - `data_count_mode`: `PCGDataCountMode` — [Read-Write] How the number of data is determined. (PCGDataCountMode)
  - `data_multiplicity`: `PCGDataMultiplicity` — [Read-Write] How to combine data counts. (PCGDataMultiplicity)
  - `element_count`: `int` — [Read-Write] Fixed number of elements to create in each output data. (int32)
  - `element_count_mode`: `PCGElementCountMode` — [Read-Write] How the number of elements is determined. (PCGElementCountMode)
  - `element_count_multiplier`: `int` — [Read-Write] Fixed number of elements to create in each output data. (int32)
  - `element_multiplicity`: `PCGElementMultiplicity` — [Read-Write] How to combine element counts. (PCGElementMultiplicity)
  - `initialization_mode`: `PCGPinInitMode` — [Read-Write] How the output data for this pin will be initialized. (PCGPinInitMode)
  - `pins_to_inititalize_from`: `None` — [Read-Write] Input pins to initialize this pinâs data from. (Array[Name])

### `unreal.PCGPoint`
Inherits: `StructBase` | Header: `PCGPoint.h`

**Methods** (41):
  - `copy_point(copy_metadata = True, metadata = None, out_metadata = None)` -> `PCGPoint` — Point functions
  - `get_bool_attribute(metadata, attribute_name)` -> `bool` — Get Bool Attribute
  - `get_double_attribute(metadata, attribute_name)` -> `double` — Get Double Attribute
  - `get_extents()` -> `Vector` — Get Extents
  - `get_float_attribute(metadata, attribute_name)` -> `float` — Get Float Attribute
  - `get_integer32_attribute(metadata, attribute_name)` -> `int32` — Get Integer 32Attribute
  - `get_integer64_attribute(metadata, attribute_name)` -> `int64` — Get Integer 64Attribute
  - `get_local_center()` -> `Vector` — Get Local Center
  - `get_name_attribute(metadata, attribute_name)` -> `Name` — Get Name Attribute
  - `get_quat_attribute(metadata, attribute_name)` -> `Quat` — Get Quat Attribute
  - `get_random_stream(optional_settings: PCGSettings = Ellipsis, optional_component: PCGComponent = Ellipsis)` -> `RandomStream` — deprecated: âget_random_streamâ was renamed to âget_random_stream_from_pointâ.
  - `get_random_stream_from_point(optional_settings = None, optional_component = None)` -> `RandomStream` — Creates a random stream from a pointâs seed and settings/componentâs seed (optional)
  - `get_random_stream_from_two_points(point_b, optional_settings = None, optional_component = None)` -> `RandomStream` — Creates a random stream from using the random seeds from two points, as well as settings/componentâs seed (optional)
  - `get_rotator_attribute(metadata, attribute_name)` -> `Rotator` — Get Rotator Attribute
  - `get_soft_class_path_attribute(metadata, attribute_name)` -> `SoftClassPath` — Get Soft Class Path Attribute
  - `get_soft_object_path_attribute(metadata, attribute_name)` -> `SoftObjectPath` — Get Soft Object Path Attribute
  - `get_string_attribute(metadata, attribute_name)` -> `str` — Get String Attribute
  - `get_transform_attribute(metadata, attribute_name)` -> `Transform` — Get Transform Attribute
  - `get_transformed_bounds()` -> `Box` — Get Transformed Bounds
  - `get_vector2_attribute(metadata, attribute_name)` -> `Vector2D` — Get Vector 2Attribute
  - `get_vector4_attribute(metadata, attribute_name)` -> `Vector4` — Get Vector 4Attribute
  - `get_vector_attribute(metadata, attribute_name)` -> `Vector` — Get Vector Attribute
  - `has_attribute_set(metadata, attribute_name)` -> `bool` — Has Attribute Set
  - `initialize_metadata(metadata, parent_point, parent_metadata = None)` -> `None` — Assigns a metadata entry key and will copy attribute values if from an unrelated metadata. Note: a null ParentMetadata a...
  - `set_bool_attribute(metadata, attribute_name, value)` -> `None` — Set Bool Attribute
  - `set_double_attribute(metadata, attribute_name, value)` -> `None` — Set Double Attribute
  - `set_extents(extents)` -> `None` — Set Extents
  - `set_float_attribute(metadata, attribute_name, value)` -> `None` — Set Float Attribute
  - `set_integer32_attribute(metadata, attribute_name, value)` -> `None` — Set Integer 32Attribute
  - `set_integer64_attribute(metadata, attribute_name, value)` -> `None` — Set Integer 64Attribute
  - `set_local_center(local_center)` -> `None` — Set Local Center
  - `set_name_attribute(metadata, attribute_name, value)` -> `None` — Set Name Attribute
  - `set_quat_attribute(metadata, attribute_name, value)` -> `None` — Set Quat Attribute
  - `set_rotator_attribute(metadata, attribute_name, value)` -> `None` — Set Rotator Attribute
  - `set_soft_class_path_attribute(metadata, attribute_name, value)` -> `None` — Set Soft Class Path Attribute
  - `set_soft_object_path_attribute(metadata, attribute_name, value)` -> `None` — Set Soft Object Path Attribute
  - `set_string_attribute(metadata, attribute_name, value)` -> `None` — Set String Attribute
  - `set_transform_attribute(metadata, attribute_name, value)` -> `None` — Set Transform Attribute
  - `set_vector2_attribute(metadata, attribute_name, value)` -> `None` — Set Vector 2Attribute
  - `set_vector4_attribute(metadata, attribute_name, value)` -> `None` — Set Vector 4Attribute
  - `set_vector_attribute(metadata, attribute_name, value)` -> `None` — Set Vector Attribute

**Properties** (8):
  - `bounds_max`: `Vector` — [Read-Write] (Vector)
  - `bounds_min`: `Vector` — [Read-Write] (Vector)
  - `color`: `Vector4` — [Read-Write] (Vector4)
  - `density`: `float` — [Read-Write] (float)
  - `metadata_entry`: `int` [Read-Only] — [Read-Only] (int64)
  - `seed`: `int` — [Read-Write] (int32)
  - `steepness`: `float` — [Read-Write] (float)
  - `transform`: `Transform` — [Read-Write] (Transform)

### `unreal.PCGPreconfiguredInfo`
Inherits: `StructBase` | Header: `PCGPreconfiguration.h`

Pre-configured info Utility struct for use with any type of PCG preconfiguration. Example: A set of user actions available on a specific node or predefined settings configuration for a node element.

**Properties** (2):
  - `label`: `Text` — [Read-Write] Label for the exposed asset. Can also be used instead of the index, if it is easier to ...
  - `preconfigured_index`: `int` — [Read-Write] Index used by the settings to know which preconfigured settings it needs to set. (int32...

### `unreal.PCGPreConfiguredSettingsInfo`
Inherits: `PCGPreconfiguredInfo` | Header: `PCGPreconfiguration.h`

Pre-configured settings info Will be passed to the settings to pre-configure the settings on creation. Also used for pre-configured node elements. Example: Maths operations: Add, Mul, Div etcâ¦

### `unreal.PCGProjectionParams`
Inherits: `StructBase` | Header: `PCGProjectionParams.h`

Parameters that control projection behaviour.

**Properties** (9):
  - `attribute_list`: `str` — Attribute1,Attribute2 . (str) [Read-Write] Attributes to either explicitly exclude or include in the...
  - `attribute_merge_operation`: `PCGMetadataOp` — [Read-Write] Operation to use to combine attributes that reside on both source and target data. (PCG...
  - `attribute_mode`: `PCGMetadataFilterMode` — [Read-Write] How the attribute list is used. Exclude Attributes will ignore these attributes and the...
  - `color_blend_mode`: `PCGProjectionColorBlendMode` — [Read-Write] The blend mode for colors during the projection (PCGProjectionColorBlendMode)
  - `project_colors`: `bool` — [Read-Write]
deprecated: Property âbProjectColorsâ is deprecated. (bool)
  - `project_positions`: `bool` — [Read-Write] Project positions. (bool)
  - `project_rotations`: `bool` — [Read-Write] Project rotations. (bool)
  - `project_scales`: `bool` — [Read-Write] Project scales. (bool)
  - `tag_merge_operation`: `PCGProjectionTagMergeMode` — [Read-Write] Controls whether the data tags are taken from the source, the target or both. (PCGProje...

### `unreal.PCGRuntimeGenerationRadii`
Inherits: `StructBase` | Header: `PCGCommon.h`

PCGRuntime Generation Radii

**Properties** (12):
  - `cleanup_radius_multiplier`: `float` — [Read-Write] Multiplier on the GenerationRadius to control the distance at which runtime generated c...
  - `generation_radius`: `float` — [Read-Write] The distance (in centimeters) at which the component will be considered for generation ...
  - `generation_radius102400`: `float` — [Read-Write] (double)
  - `generation_radius12800`: `float` — [Read-Write] (double)
  - `generation_radius1600`: `float` — [Read-Write] (double)
  - `generation_radius204800`: `float` — [Read-Write] (double)
  - `generation_radius25600`: `float` — [Read-Write] (double)
  - `generation_radius3200`: `float` — [Read-Write] (double)
  - `generation_radius400`: `float` — [Read-Write] (double)
  - `generation_radius51200`: `float` — [Read-Write] (double)
  - `generation_radius6400`: `float` — [Read-Write] (double)
  - `generation_radius800`: `float` — [Read-Write] (double)

### `unreal.PCGSelectGrammarCriteriaAttributeNames`
Inherits: `StructBase` | Header: `PCGSelectGrammar.h`

Used for directly mapping custom attribute names to a criteria attribute set.

**Properties** (5):
  - `comparator_attribute_name`: `Name` — [Read-Write] (Name)
  - `first_value_attribute_name`: `Name` — [Read-Write] (Name)
  - `grammar_attribute_name`: `Name` — [Read-Write] (Name)
  - `key_attribute_name`: `Name` — [Read-Write] (Name)
  - `second_value_attribute_name`: `Name` — [Read-Write] (Name)

### `unreal.PCGSelectGrammarCriterion`
Inherits: `StructBase` | Header: `PCGSelectGrammar.h`

Criteria to compare against an input value for conditionally selecting a grammar.

**Properties** (5):
  - `comparator`: `PCGSelectGrammarComparator` — [Read-Write] Comparison operator of a selected input value against a criterionâs value. (PCGSelect...
  - `first_value`: `float` — [Read-Write] Compared against the input value. (double)
  - `grammar`: `str` — [Read-Write] The selected grammar result if the condition evaluates to true. (str)
  - `key`: `Name` — [Read-Write] Key representation of a potential grammar selection. (Name)
  - `second_value`: `float` — [Read-Write] Used for comparison in range-based or ternary conditions. (double)

### `unreal.PCGSelfPruningParameters`
Inherits: `StructBase` | Header: `PCGSelfPruning.h`

PCGSelf Pruning Parameters

**Properties** (7):
  - `collision_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] Specifies to use the collision from a given mesh instead of the point; note that this w...
  - `collision_query_flag`: `PCGCollisionQueryFlag` — [Read-Write] Controls whether queries will be done against complex collisions or not. If enabled, pe...
  - `comparison_source`: `PCGAttributePropertyInputSelector` — [Read-Write] By default, it will prune according to the extents of each point, but you can provide a...
  - `pruning_type`: `PCGSelfPruningType` — [Read-Write] (PCGSelfPruningType)
  - `radius_similarity_factor`: `float` — [Read-Write] Similarity factor to consider 2 points âequalâ. (For example, if a point extents sq...
  - `randomized_pruning`: `bool` — [Read-Write] (bool)
  - `use_collision_attribute`: `bool` — [Read-Write] (bool)

### `unreal.PCGSkinnedMeshInstance`
Inherits: `StructBase` | Header: `PCGSkinnedMeshSelector.h`

PCGSkinned Mesh Instance

### `unreal.PCGSkinnedMeshInstanceList`
Inherits: `StructBase` | Header: `PCGSkinnedMeshSelector.h`

PCGSkinned Mesh Instance List

**Properties** (3):
  - `instance_point_indices`: `None` — [Read-Write] (Array[int32])
  - `instances`: `None` — [Read-Write] (Array[PCGSkinnedMeshInstance])
  - `point_data`: `PCGPointData` — [Read-Write] (PCGPointData)

### `unreal.PCGSkinnedMeshPackedCustomData`
Inherits: `StructBase` | Header: `PCGSkinnedMeshInstanceDataPackerBase.h`

PCGSkinned Mesh Packed Custom Data

**Properties** (3):
  - `custom_data`: `None` — [Read-Write] (Array[float])
  - `num_custom_data_floats`: `int` — [Read-Write] (int32)
  - `sequence_index`: `int` — [Read-Write] (int32)

### `unreal.PCGSoftISMComponentDescriptor`
Inherits: `SoftISMComponentDescriptor` | Header: `PCGISMDescriptor.h`

Convenience PCG-side component descriptor so we can adjust defaults to the most common use cases. // Implementation note: the tags donât really need to contribute to the hash, so we will retain the ...

### `unreal.PCGSoftSkinnedMeshComponentDescriptor`
Inherits: `SoftSkinnedMeshComponentDescriptor` | Header: `PCGSkinnedMeshDescriptor.h`

Convenience PCG-side component descriptor so we can adjust defaults to the most common use cases. // Implementation note: the tags donât really need to contribute to the hash, so we will retain the ...

### `unreal.PCGSplineMeshParams`
Inherits: `StructBase` | Header: `PCGSplineMeshParams.h`

PCGSpline Mesh Params

**Properties** (10):
  - `end_offset`: `Vector2D` — [Read-Write] Ending offset of the mesh from the spline, in component space. (Vector2D)
  - `forward_axis`: `PCGSplineMeshForwardAxis` — [Read-Write] Chooses the forward axis for the spline mesh orientation. (PCGSplineMeshForwardAxis)
  - `nanite_cluster_bounds_scale`: `float` — [Read-Write] How much to scale the calculated culling bounds of Nanite clusters after deformation.
N...
  - `scale_mesh_to_bounds`: `bool` — [Read-Write] Scale mesh to the spline control point bounds. Especially useful on Landscape Splines, ...
  - `scale_mesh_to_landscape_spline_full_width`: `bool` — [Read-Write] Scale the mesh to the full width of the Landscape Spline (including Falloff). Only appl...
  - `smooth_interp_roll_scale`: `bool` — [Read-Write] If true, will use smooth interpolation (ease in/out) for Scale, Roll, and Offset along ...
  - `spline_boundary_max`: `float` — [Read-Write] Maximum coordinate along the spline forward axis which corresponds to end of spline. If...
  - `spline_boundary_min`: `float` — [Read-Write] Minimum coordinate along the spline forward axis which corresponds to start of spline. ...
  - `spline_up_dir`: `Vector` — [Read-Write] Axis (in component space) that is used to determine X axis for coordinates along spline...
  - `start_offset`: `Vector2D` — [Read-Write] Starting offset of the mesh from the spline, in component space. (Vector2D)

### `unreal.PCGSplineSamplerParams`
Inherits: `StructBase` | Header: `PCGSplineSampler.h`

PCGSpline Sampler Params

**Properties** (40):
  - `alpha_attribute`: `Name` — [Read-Write] Attribute that will contain a value in [0,1] representing how far along the point is to...
  - `arrive_tangent_attribute`: `Name` — [Read-Write] Attribute that will contain the arrive tangent vector. For control points, this will be...
  - `compute_alpha`: `bool` — [Read-Write] Compute an alpha value along the spline and write it to an attribute. (bool)
  - `compute_curvature`: `bool` — [Read-Write] Compute curvature along the spline and write it to an attribute. (bool)
  - `compute_direction_delta`: `bool` — [Read-Write] Compute the delta angle to the next point on the spline and write it to an attribute. (...
  - `compute_distance`: `bool` — [Read-Write] Compute distance along the spline and write it to an attribute. (bool)
  - `compute_input_key`: `bool` — [Read-Write] Compute an input key for each point along the spline and write the key to an attribute....
  - `compute_segment_index`: `bool` — [Read-Write] Compute the spline segment index and write it to an attribute. (bool)
  - `compute_subsegment_index`: `bool` — [Read-Write] Compute the sub-segment index of a point on the spline and write it to an attribute. (b...
  - `compute_tangents`: `bool` — [Read-Write] Compute arrive and leave tangents along the spline and write them to attributes. (bool)
  - `curvature_attribute`: `Name` — [Read-Write] Attribute that will contain the curvature. Note that the radius of curvature is defined...
  - `dimension`: `PCGSplineSamplingDimension` — [Read-Write] (PCGSplineSamplingDimension)
  - `distance_attribute`: `Name` — [Read-Write] Attribute that will contain the distance along the spline at the sample point. (Name)
  - `distance_increment`: `float` — [Read-Write] (float)
  - `end_offset`: `float` — [Read-Write] Distance (in cm) from the end of the spline at which sampling will end. (float)
  - `fill`: `PCGSplineSamplingFill` — [Read-Write] (PCGSplineSamplingFill)
  - `fit_to_curve`: `bool` — [Read-Write] If the length of the spline does not divide evenly into the DistanceIncrement, the fina...
  - `input_key_attribute`: `Name` — [Read-Write] Attribute that will contain the spline input key, a float value between [0, N], where N...
  - `interior_border_sample_spacing`: `float` — [Read-Write] The space between each sample point on the spline boundary. Used for computation; lower...
  - `interior_density_falloff_curve`: `RuntimeFloatCurve` — [Read-Write] Defines the density for each sample based on its distance from the spline. X axis is no...
  - `interior_orientation`: `PCGSplineSamplingInteriorOrientation` — [Read-Write] Determines the orientation of interior points. (PCGSplineSamplingInteriorOrientation)
  - `interior_sample_spacing`: `float` — [Read-Write] The space between each sample point (float)
  - `leave_tangent_attribute`: `Name` — [Read-Write] Attribute that will contain the leave tangent vector. For control points, this will be ...
  - `max_random_offset_normalized`: `float` — [Read-Write] Normalized value for the maximum possible offset for each sample point. 0.0 means no of...
  - `mode`: `PCGSplineSamplingMode` — [Read-Write] (PCGSplineSamplingMode)
  - `next_direction_delta_attribute`: `Name` — [Read-Write] Attribute that will contain the delta angle to the next point on the spline w.r.t to th...
  - `num_height_subdivisions`: `int` — [Read-Write] (int32)
  - `num_planar_subdivisions`: `int` — [Read-Write] (int32)
  - `num_samples`: `int` — [Read-Write] (int32)
  - `point_steepness`: `float` — [Read-Write] Each PCG point represents a discretized, volumetric region of world space. The pointsâ...
  - `project_onto_surface`: `bool` — [Read-Write] Project sample points onto one possible surface given by the spline boundary. (bool)
  - `seed_from2d_position`: `bool` — [Read-Write] Controls whether we will seed the sampled points using the 3D position or the 2D (XY) p...
  - `seed_from_local_position`: `bool` — [Read-Write] Controls whether we will seed the sampled points using the final world position or the ...
  - `seeding_mode`: `PCGSplineSamplingSeedingMode` — [Read-Write] Controls the mode for computing a sample pointâs seed. (PCGSplineSamplingSeedingMode)
  - `segment_index_attribute`: `Name` — [Read-Write] Attribute that will contain the spline segment index. (Name)
  - `start_offset`: `float` — [Read-Write] Distance (in cm) along the spline at which sampling will begin. (float)
  - `subdivisions_per_segment`: `int` — [Read-Write] (int32)
  - `subsegment_index_attribute`: `Name` — [Read-Write] Attribute that will contain the sub-segment index of a point on the spline. When the su...
  - `treat_spline_as_polyline`: `bool` — [Read-Write] Use the spline points to form a polyline, instead of computing many sample points along...
  - `unbounded`: `bool` — [Read-Write] If no Bounding Shape input is provided, the actor bounds are used to limit the sample g...

### `unreal.PCGStaticMeshSpawnerContext`
Inherits: `PCGContext` | Header: `PCGStaticMeshSpawnerContext.h`

PCGStatic Mesh Spawner Context

### `unreal.PCGSubdivisionModuleAttributeNames`
Inherits: `StructBase` | Header: `PCGSubdivisionBase.h`

PCGSubdivision Module Attribute Names

**Properties** (6):
  - `debug_color_attribute_name`: `Name` — Vector4. If disabled, default value will be (1.0, 1.0, 1.0, 1.0). (Name) [Read-Write] Optional. Expe...
  - `provide_debug_color`: `bool` — [Read-Write] (bool)
  - `provide_scalable`: `bool` — [Read-Write] (bool)
  - `scalable_attribute_name`: `Name` — bool. If disabled, default value will be false. (Name) [Read-Write] Optional. Expected type
  - `size_attribute_name`: `Name` — double. (Name) [Read-Write] Mandatory. Expected type
  - `symbol_attribute_name`: `Name` — FName. (Name) [Read-Write] Mandatory. Expected type

### `unreal.PCGSubdivisionSubmodule`
Inherits: `StructBase` | Header: `PCGSubdivisionBase.h`

PCGSubdivision Submodule

**Properties** (4):
  - `debug_color`: `Vector4` — [Read-Write] For easier debugging, using Point color in conjunction with PCG Debug Color Material. (...
  - `scalable`: `bool` — [Read-Write] If the volume can be scaled to fit the remaining space or not. (bool)
  - `size`: `float` — [Read-Write] Size of the block, aligned on the segment direction. (double)
  - `symbol`: `Name` — [Read-Write] Symbol for the grammar. (Name)

### `unreal.PCGTaggedData`
Inherits: `StructBase` | Header: `PCGData.h`

PCGTagged Data

**Properties** (3):
  - `is_used_multiple_times`: `bool` [Read-Only] — [Read-Only] Special flag to be modified by execution when a data is used multiple times (in this nod...
  - `pin`: `Name` — [Read-Write] The label of the pin that this data was either emitted from or received on. (Name)
  - `tags`: `None` — [Read-Write] (Set[str])

### `unreal.PCGTestMyColorStruct`
Inherits: `StructBase` | Header: `PCGGetActorPropertyTest.h`

PCGTest My Color Struct

**Properties** (4):
  - `a`: `float` [Read-Only] — [Read-Only] (double)
  - `b`: `float` [Read-Only] — [Read-Only] (double)
  - `g`: `float` [Read-Only] — [Read-Only] (double)
  - `r`: `float` [Read-Only] — [Read-Only] (double)

### `unreal.PCGVirtualTexturePrimingInfo`
Inherits: `StructBase` | Header: `PCGRuntimeGenScheduler.h`

Used to inform what virtual textures to prime and on what grids they need to be present.

### `unreal.PCGWeightedByCategoryEntryList`
Inherits: `StructBase` | Header: `PCGMeshSelectorWeightedByCategory.h`

PCGWeighted by Category Entry List

**Properties** (3):
  - `category_entry`: `str` — [Read-Write] (str)
  - `is_default`: `bool` — [Read-Write] (bool)
  - `weighted_mesh_entries`: `None` — [Read-Write] (Array[PCGMeshSelectorWeightedEntry])

### `unreal.PCGWorldCommonQueryParams`
Inherits: `StructBase` | Header: `PCGWorldData.h`

PCGWorld Common Query Params

**Properties** (14):
  - `actor_class`: `Class` — [Read-Write] (type(Class))
  - `actor_class_filter`: `PCGWorldQueryFilter` — [Read-Write] (PCGWorldQueryFilter)
  - `actor_filter_from_input`: `PCGWorldQueryFilter` — [Read-Write] Will add an input pin to pass a list of actor references for filtering if this value is...
  - `actor_filter_input_source`: `PCGAttributePropertyInputSelector` — [Read-Write] Input source for the attribute to read from the Filter Actor pin. (PCGAttributeProperty...
  - `actor_tag_filter`: `PCGWorldQueryFilter` — [Read-Write] (PCGWorldQueryFilter)
  - `actor_tags_list`: `str` — [Read-Write] (str)
  - `collision_channel`: `CollisionChannel` — [Read-Write] (CollisionChannel)
  - `get_reference_to_actor_hit`: `bool` — [Read-Write] (bool)
  - `get_reference_to_physical_material`: `bool` — [Read-Write] (bool)
  - `ignore_landscape_hits`: `bool` — [Read-Write]
deprecated: IgnoreLandscapeHits has been deprecated in favor of SelectLandscapeHits (bo...
  - `ignore_pcg_hits`: `bool` — [Read-Write] If true, will ignore hits/overlaps on content created from PCG. (bool)
  - `ignore_self_hits`: `bool` — [Read-Write] (bool)
  - `select_landscape_hits`: `PCGWorldQuerySelectLandscapeHits` — [Read-Write] (PCGWorldQuerySelectLandscapeHits)
  - `trace_complex`: `bool` — [Read-Write] Queries against complex collision if enabled, performance warning (bool)

### `unreal.PCGWorldRaycastQueryParams`
Inherits: `PCGWorldCommonQueryParams` | Header: `PCGWorldData.h`

PCGWorld Raycast Query Params

**Properties** (15):
  - `apply_metadata_from_landscape`: `bool` — [Read-Write] Will apply landscape layers and their values at the impact point. (bool)
  - `get_distance`: `bool` — [Read-Write] Create an attribute for the distance between the ray origin and the impact point. (bool...
  - `get_element_index`: `bool` — [Read-Write] Create an attribute for the index of the element hit. Unique to the hit primitive. (boo...
  - `get_face_index`: `bool` — Will only work in complex traces. (bool) [Read-Write] Create an attribute for index of the hit face....
  - `get_impact`: `bool` — [Read-Write] Create an attribute for whether the raycast resulted in a hit. (bool)
  - `get_impact_normal`: `bool` — [Read-Write] Create an attribute for the impact normal. (bool)
  - `get_impact_point`: `bool` — [Read-Write] Create an attribute for the impact location in world space. (bool)
  - `get_local_impact_point`: `bool` — [Read-Write] Create an attribute for the impact point in the hit objectâs local space. (bool)
  - `get_reference_to_render_material`: `bool` — [Read-Write] Create an attribute for the render material. (bool)
  - `get_reference_to_static_mesh`: `bool` — [Read-Write] Create an attribute for the static mesh. (bool)
  - `get_reflection`: `bool` — [Read-Write] Create an attribute for the reflection vector based on the ray incoming direction and t...
  - `get_uv_coords`: `bool` — Will only work in complex traces and must have âProject Settings->Physics->Support UV From Hit Res...
  - `ignore_backface_hits`: `bool` — [Read-Write] Ignore rays that hit backfaces. (bool)
  - `render_material_index`: `int` — [Read-Write] The index of the render material when it is queried from the hit. (int32)
  - `uv_channel`: `int` — [Read-Write] This UV Channel will be selected when retrieving UV Coordinates from a raycast query. (...

### `unreal.PCGWorldRayHitQueryParams`
Inherits: `PCGWorldRaycastQueryParams` | Header: `PCGWorldData.h`

PCGWorld Ray Hit Query Params

**Properties** (4):
  - `override_default_params`: `bool` — [Read-Write] Set ray parameters including origin, direction and length explicitly rather than derivi...
  - `ray_direction`: `Vector` — [Read-Write] (Vector)
  - `ray_length`: `float` — [Read-Write] (double)
  - `ray_origin`: `Vector` — [Read-Write] (Vector)

### `unreal.PCGWorldVolumetricQueryParams`
Inherits: `PCGWorldCommonQueryParams` | Header: `PCGWorldData.h`

PCGWorld Volumetric Query Params

**Properties** (1):
  - `search_for_overlap`: `bool` — [Read-Write] Controls whether we are trying to find an overlap with physical objects (true) or to fi...

### `unreal.PCGActorHelpers`
Inherits: `BlueprintFunctionLibrary` | Header: `PCGActorHelpers.h`

PCGActor Helpers

### `unreal.PCGAddAttributeSettings`
Inherits: `PCGSettings` | Header: `PCGCreateAttribute.h`

Add a new attribute to a spatial data or an attribute set. New attribute can be a constant, hardcoded in the node, or can come from another Attribute Set. Can also add all the attributes coming from t...

**Properties** (6):
  - `attribute_types`: `PCGMetadataTypesConstantStruct` — [Read-Write] (PCGMetadataTypesConstantStruct)
  - `copy_all_attributes`: `bool` — [Read-Write] (bool)
  - `copy_all_domains`: `bool` — [Read-Write] If checked, it is copying all attributes from all domains, as long as the source domain...
  - `input_source`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `metadata_domains_mapping`: `None` — [Read-Write] When copying all attributes, a mapping can be specified. If it is empty, itâs going t...
  - `output_target`: `PCGAttributePropertyOutputSelector` — [Read-Write] (PCGAttributePropertyOutputSelector)

### `unreal.PCGAddComponentSettings`
Inherits: `PCGSettings` | Header: `PCGAddComponent.h`

Creates components and adds them to specified actors.

**Properties** (7):
  - `actor_reference_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] Specifies what attribute is used to derive actor reference (PCGAttributePropertyInputSe...
  - `allow_template_component_editing`: `bool` — [Read-Write] (bool)
  - `class_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] Specifies component class selection (PCGAttributePropertyInputSelector)
  - `component_reference_attribute`: `PCGAttributePropertyOutputNoSourceSelector` — [Read-Write] Specifies what attribute to write the component reference to. (PCGAttributePropertyOutp...
  - `template_component`: `ActorComponent` — [Read-Write] (ActorComponent)
  - `template_component_class`: `Class` [Read-Only] — [Read-Only] (type(Class))
  - `use_class_attribute`: `bool` — [Read-Write] Controls whether component class selection will be done by attribute or from a constant...

### `unreal.PCGAddTagSettings`
Inherits: `PCGSettings` | Header: `PCGAddTag.h`

Applies the specified tags on the output data.

**Properties** (4):
  - `ignore_tag_value_parsing`: `bool` — â (if any) or not. (bool) [Read-Write] Controls whether tags are not considered to be key-value pa...
  - `prefix`: `str` — [Read-Write] Common prefix to add to all tags, can be left empty. (str)
  - `suffix`: `str` — [Read-Write] Common suffix to add to all tags, can be left empty. (str)
  - `tags_to_add`: `str` — [Read-Write] Comma-separated list of tags to apply to the node. (str)

### `unreal.PCGApplyHierarchySettings`
Inherits: `PCGSettings` | Header: `PCGApplyHierarchy.h`

Applies hierarchy transformations based on a hierarchy depth, point index & parent index scheme. This is used in the context of PCG Data Assets that have these fields by default.

**Properties** (11):
  - `apply_hierarchy`: `PCGApplyHierarchyOption` — [Read-Write] (PCGApplyHierarchyOption)
  - `apply_hierarchy_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `apply_parent_rotation`: `PCGApplyHierarchyOption` — [Read-Write] (PCGApplyHierarchyOption)
  - `apply_parent_rotation_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `apply_parent_scale`: `PCGApplyHierarchyOption` — [Read-Write] (PCGApplyHierarchyOption)
  - `apply_parent_scale_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `hierarchy_depth_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `parent_key_attributes`: `None` — [Read-Write] Attributes that constitute a unique key representing the pointâs parent in the hierar...
  - `point_key_attributes`: `None` — [Read-Write] Attributes that constitute a unique key representing the point. All attributes must be ...
  - `relative_transform_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `warn_on_points_with_invalid_parent`: `bool` — [Read-Write] (bool)

### `unreal.PCGApplyOnActorSettings`
Inherits: `PCGSettings` | Header: `PCGApplyOnActor.h`

Apply property overrides and executes functions on a target actor.

**Properties** (6):
  - `object_reference_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] If something is connected in the In pin, will look for this attribute values to load, r...
  - `post_process_function_names`: `None` — [Read-Write] Specify a list of functions to be called on the target actor. Functions need to be para...
  - `property_override_descriptions`: `None` — [Read-Write] Override the default property values on the target actor. Applied before post-process f...
  - `silence_error_on_empty_object_path`: `bool` — [Read-Write] Opt-in option to silence errors when the path is Empty or nothing to extract. (bool)
  - `synchronous_load`: `bool` — [Read-Write] By default, object loading is asynchronous, can force it synchronous if needed. (bool)
  - `target_actor`: `Actor` — [Read-Write]
deprecated: TargetActor has been deprecated; pass data directly to the âInâ pin ins...

### `unreal.PCGApplyScaleToBoundsSettings`
Inherits: `PCGSettings` | Header: `PCGApplyScaleToBounds.h`

Applies the scale of each point to its bounds and resets the scale.

### `unreal.PCGAssetExporter`
Inherits: `Object` | Header: `PCGAssetExporter.h`

Base class for asset exporters. Can be extended either natively or through blueprint. Not intended to be used in non-editor builds.

**Methods** (2):
  - `bp_export_to_asset(asset)` -> `bool` — BP Export to Asset
  - `bp_get_asset_type()` — Returns the subtype of PCG data asset generated by the Level To Asset process. Override this in the instances where you ...

### `unreal.PCGAssetExporterUtils`
Inherits: `BlueprintFunctionLibrary` | Header: `PCGAssetExporterUtils.h`

Asset export utils - will work only in editor builds.

**Methods** (2):
  - `create_asset(exporter, parameters = [True,'','',True])` -> `Package` [classmethod] — Exports an asset from the given exporter. When calling this function, the exporter should be able to create its own data...
  - `update_assets(pcg_assets, parameters = [True,'','',True])` -> `None` [classmethod] — Updates assets based on their embedded exporter & metadata.

### `unreal.PCGAttractSettings`
Inherits: `PCGSettings` | Header: `PCGAttractElement.h`

Attracts points (interpolates) from the source towards points from the target.

**Properties** (13):
  - `attractor_index_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] Index attribute on the source that maps a point to a point from the target. (PCGAttribu...
  - `distance`: `float` — [Read-Write] Will be used to determine which points to attract. (double)
  - `mode`: `PCGAttractMode` — [Read-Write] Controls the criteria used for the attract operation. (PCGAttractMode)
  - `output_attract_index`: `bool` — [Read-Write] (bool)
  - `output_attract_index_attribute`: `PCGAttributePropertyOutputNoSourceSelector` — [Read-Write] (PCGAttributePropertyOutputNoSourceSelector)
  - `remove_unattracted_points`: `bool` — [Read-Write] Can optionally remove points that werenât attracted to points on the target. Will hav...
  - `source_and_target_attribute_mapping`: `None` — [Read-Write] (Map[PCGAttributePropertyInputSelector,PCGAttributePropertyInputSelector])
  - `source_weight_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] This attribute will determine the weight of the fusion result for the source point. It ...
  - `target_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] The target attribute used when attracted by attribute value. (PCGAttributePropertyInput...
  - `target_weight_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] This attribute will determine the weight of the fusion result for the target point. It ...
  - `use_source_weight`: `bool` — [Read-Write] (bool)
  - `use_target_weight`: `bool` — [Read-Write] (bool)
  - `weight`: `float` — [Read-Write] (double)

### `unreal.PCGAttributeCastSettings`
Inherits: `PCGSettings` | Header: `PCGAttributeCast.h`

Cast an attribute to another type. Support broadcastable cast (like double -> FVector) and constructible cast (like double -> float)

**Properties** (3):
  - `input_source`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `output_target`: `PCGAttributePropertyOutputSelector` — [Read-Write] (PCGAttributePropertyOutputSelector)
  - `output_type`: `PCGMetadataTypes` — [Read-Write] (PCGMetadataTypes)

### `unreal.PCGAttributeFilteringRangeSettings`
Inherits: `PCGSettings` | Header: `PCGAttributeFilter.h`

Attribute filter on range that allows to do âA op Bâ type filtering, where A is the input spatial data or Attribute set, and B is either a constant, another spatial data (if input is a spatial dat...

**Properties** (4):
  - `max_threshold`: `PCGAttributeFilterThresholdSettings` — [Read-Write] (PCGAttributeFilterThresholdSettings)
  - `min_threshold`: `PCGAttributeFilterThresholdSettings` — [Read-Write] Threshold property/attribute/constant related properties (PCGAttributeFilterThresholdSe...
  - `target_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] Target property/attribute related properties (PCGAttributePropertyInputSelector)
  - `warn_on_data_missing_attribute`: `bool` — [Read-Write] Controls whether the node will emit a warning when the input data or the filter data do...

### `unreal.PCGAttributeFilteringSettings`
Inherits: `PCGSettings` | Header: `PCGAttributeFilter.h`

Attribute filter that allows to do âA op Bâ type filtering, where A is the input spatial data or Attribute set, and B is either a constant, another spatial data (if input is a spatial data), an At...

**Properties** (7):
  - `attribute_types`: `PCGMetadataTypesConstantStruct` — [Read-Write] (PCGMetadataTypesConstantStruct)
  - `operator`: `PCGAttributeFilterOperator` — [Read-Write] (PCGAttributeFilterOperator)
  - `target_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] Target property/attribute related properties (PCGAttributePropertyInputSelector)
  - `threshold_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `use_constant_threshold`: `bool` — [Read-Write] Threshold property/attribute/constant related properties (bool)
  - `use_spatial_query`: `bool` — [Read-Write] If the threshold data is Point data, it will sample input points in threshold data. Alw...
  - `warn_on_data_missing_attribute`: `bool` — [Read-Write] Controls whether the node will emit a warning when the input data or the filter data do...

### `unreal.PCGAttributeGetFromIndexSettings`
Inherits: `PCGSettings` | Header: `PCGAttributeGetFromIndexElement.h`

PCGAttribute Get from Index Settings

**Properties** (1):
  - `index`: `int` — [Read-Write] (int32)

### `unreal.PCGAttributeGetFromPointIndexSettings`
Inherits: `PCGSettings` | Header: `PCGAttributeGetFromPointIndexElement.h`

Get the attribute/property of a point given its index. The result will be in a ParamData. There is also a second output that will output the selected point. This point will be output even if the prope...

**Properties** (3):
  - `index`: `int` — [Read-Write] (int32)
  - `input_source`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `output_attribute_name`: `PCGAttributePropertyOutputSelector` — [Read-Write] (PCGAttributePropertyOutputSelector)

### `unreal.PCGAttributeNoiseSettings`
Inherits: `PCGSettings` | Header: `PCGAttributeNoise.h`

Apply some noise to an attribute/property. You can select the mode you want and a noise range. Support all numerical types and vectors/rotators.

**Properties** (9):
  - `clamp_result`: `bool` — [Read-Write] Clamp the result between 0 and 1. Always applied if we apply noise to the density. (boo...
  - `custom_seed_source`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `has_custom_seed_source`: `bool` — [Read-Write] (bool)
  - `input_source`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `invert_source`: `bool` — [Read-Write] Attribute = 1 - Attribute before applying the operation (bool)
  - `mode`: `PCGAttributeNoiseMode` — [Read-Write] Attribute = (Original op Noise), Noise in [NoiseMin, NoiseMax] (PCGAttributeNoiseMode)
  - `noise_max`: `float` — [Read-Write] (float)
  - `noise_min`: `float` — [Read-Write] (float)
  - `output_target`: `PCGAttributePropertyOutputSelector` — [Read-Write] (PCGAttributePropertyOutputSelector)

### `unreal.PCGAttributePropertySelectorBlueprintHelpers`
Inherits: `BlueprintFunctionLibrary` | Header: `PCGAttributePropertySelector.h`

Helper class to allow the BP to call the custom setters and getters on FPCGAttributePropertySelector.

**Methods** (15):
  - `copy_and_fix_last(selector, data)` -> `PCGAttributePropertyInputSelector` [classmethod] — Copy and Fix Last
  - `copy_and_fix_source(output_selector, input_selector, optional_data = None)` -> `PCGAttributePropertyOutputSelector` [classmethod] — Copy and Fix Source
  - `get_attribute_name(selector)` -> `Name` [classmethod] — Get Attribute Name
  - `get_domain_name(selector)` -> `Name` [classmethod] — Get Domain Name
  - `get_extra_names(selector)` -> `Array [ str ]` [classmethod] — Get Extra Names
  - `get_extra_property(selector)` -> `PCGExtraProperties` [classmethod] — Get Extra Property
  - `get_name(selector)` -> `Name` [classmethod] — Get Name
  - `get_point_property(selector)` -> `PCGPointProperties` [classmethod] — Get Point Property
  - `get_property_name(selector)` -> `Name` [classmethod] — Get Property Name
  - `get_selection(selector)` -> `PCGAttributePropertySelection` [classmethod] — Get Selection
  - `set_attribute_name(selector, attribute_name, reset_extra_names = True)` -> `PCGAttributePropertySelector or None` [classmethod] — Set Attribute Name
  - `set_domain_name(selector, domain_name, reset_extra_names = True)` -> `PCGAttributePropertySelector or None` [classmethod] — Set Domain Name
  - `set_extra_property(selector, extra_property, reset_extra_names = True)` -> `PCGAttributePropertySelector or None` [classmethod] — Set Extra Property
  - `set_point_property(selector, point_property, reset_extra_names = True)` -> `PCGAttributePropertySelector or None` [classmethod] — Set Point Property
  - `set_property_name(selector, property_name, reset_extra_names = True)` -> `PCGAttributePropertySelector or None` [classmethod] — Set Property Name

### `unreal.PCGAttributeReduceSettings`
Inherits: `PCGSettings` | Header: `PCGAttributeReduceElement.h`

Take all the entries/points from the input and perform a reduce operation on the given attribute/property and output the result into a ParamData. Note: Special case for average on Quaternion since the...

**Properties** (5):
  - `input_source`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `join_delimiter`: `str` — [Read-Write] (str)
  - `merge_output_attributes`: `bool` — [Read-Write] Option to merge all results into a single attribute set with multiple entries, instead ...
  - `operation`: `PCGAttributeReduceOperation` — [Read-Write] (PCGAttributeReduceOperation)
  - `output_attribute_name`: `Name` — [Read-Write] (Name)

### `unreal.PCGAttributeRemapSettings`
Inherits: `PCGMetadataSettingsBase` | Header: `PCGAttributeRemap.h`

Remap attribute values from one range to another.

**Properties** (8):
  - `allow_inverse_range`: `bool` — [Read-Write] Allow remapping when Min is larger than Max, e.g. from [0.0, 1.0] -> [1.0, 0.0]. (bool)
  - `clamp_to_unit_range`: `bool` — [Read-Write] If checked, outside values will be clamped between 0 and 1. (bool)
  - `ignore_values_outside_input_range`: `bool` — [Read-Write] Attribute values outside of the input range will be unaffected by the remapping (bool)
  - `input_source`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `out_range_max`: `float` — [Read-Write] (double)
  - `out_range_min`: `float` — [Read-Write] (double)
  - `range_max`: `float` — [Read-Write] If InRangeMin = InRangeMax, then that attribute value is mapped to the average of OutRa...
  - `range_min`: `float` — [Read-Write] If InRangeMin = InRangeMax, then that attribute value is mapped to the average of OutRa...

### `unreal.PCGAttributeRemoveDuplicatesSettings`
Inherits: `PCGSettings` | Header: `PCGAttributeRemoveDuplicates.h`

Remove duplicates for given attributes

**Properties** (1):
  - `attribute_selectors`: `None` — [Read-Write] The data will be partitioned on these selected attributes, and we will only keep the fi...

### `unreal.PCGAttributeSelectSettings`
Inherits: `PCGSettings` | Header: `PCGAttributeSelectElement.h`

Take all the entries/points from the input and perform a select operation on the given attribute/property on the given axis (if the attribute/property is a vector) and output the result into a ParamDa...

**Properties** (5):
  - `axis`: `PCGAttributeSelectAxis` — [Read-Write] (PCGAttributeSelectAxis)
  - `custom_axis`: `Vector4` — [Read-Write] (Vector4)
  - `input_source`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `operation`: `PCGAttributeSelectOperation` — [Read-Write] (PCGAttributeSelectOperation)
  - `output_attribute_name`: `Name` — [Read-Write] (Name)

### `unreal.PCGAttributeTransferSettings`
Inherits: `PCGCopyAttributesSettings` | Header: `PCGAttributeTransferElement.h`

PCGAttribute Transfer Settings

### `unreal.PCGBadOutputsNodeSettings`
Inherits: `PCGSettings` | Header: `PCGElementTest.h`

Test node to write bad outputs

### `unreal.PCGBasePointData`
Inherits: `PCGSpatialData` | Header: `PCGBasePointData.h`

PCGBase Point Data

**Methods** (3):
  - `bp_copy_points_from(data: PCGBasePointData, data_indices: None)` -> `None` — deprecated: âbp_copy_points_fromâ was renamed to âbp_set_points_fromâ.
  - `bp_set_points_from(data, data_indices)` -> `None` — BP Set Points From
  - `copy_points_from(data: PCGBasePointData, data_indices: None)` -> `None` — deprecated: âcopy_points_fromâ was renamed to âbp_set_points_fromâ.

### `unreal.PCGBaseSubgraphNode`
Inherits: `PCGNode` | Header: `PCGSubgraph.h`

PCGBase Subgraph Node

### `unreal.PCGBaseSubgraphSettings`
Inherits: `PCGSettings` | Header: `PCGSubgraph.h`

PCGBase Subgraph Settings

### `unreal.PCGBaseTextureData`
Inherits: `PCGSurfaceData` | Header: `PCGTextureData.h`

PCGBase Texture Data

**Properties** (14):
  - `bounds`: `Box` [Read-Only] — [Read-Only] (Box)
  - `center_offset`: `Vector2D` — [Read-Write] (Vector2D)
  - `color_channel`: `PCGTextureColorChannel` — [Read-Write] (PCGTextureColorChannel)
  - `density_function`: `PCGTextureDensityFunction` — [Read-Write]
deprecated: Property âDensityFunctionâ is deprecated. (PCGTextureDensityFunction)
  - `filter`: `PCGTextureFilter` — [Read-Write] Method used to determine the value for a sample based on the value of nearby texels. (P...
  - `height`: `int` [Read-Only] — [Read-Only] (int32)
  - `rotation`: `float` — [Read-Write] Rotation to apply when sampling texture. (float)
  - `texel_size`: `float` — [Read-Write] The size of one texel in cm, used when calling ToPointData. (float)
  - `tile_bounds`: `Box2D` — [Read-Write] (Box2D)
  - `tiling`: `Vector2D` — [Read-Write] (Vector2D)
  - `use_advanced_tiling`: `bool` — [Read-Write] Whether to tile the source or to stretch it to fit target area. (bool)
  - `use_density_source_channel`: `bool` — [Read-Write] (bool)
  - `use_tile_bounds`: `bool` — [Read-Write] (bool)
  - `width`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.PCGBlueprintElement`
Inherits: `Object` | Header: `PCGExecuteBlueprint.h`

PCGBlueprint Element

**Methods** (33):
  - `apply_preconfigured_settings(preconfigure_info)` -> `None` — Apply the preconfigured settings specified in the class default. Used to create nodes that are configured with pre-defin...
  - `custom_input_labels()` -> `Set [ Name ]` — Returns the labels of custom input pins only
  - `custom_output_labels()` -> `Set [ Name ]` — Returns the labels of custom output pins only
  - `dynamic_pin_types_override(settings, pin)` -> `int32` — If Dynamic Pins is enabled in the BP settings, override this function to provide the type for the given pin. You can use...
  - `execute(input)` -> `PCGDataCollection` — Main execution function that will contain the logic for this PCG Element. Use GetContext to have access to the context.
  - `execute_with_context(context, output=PCGDataCollection)` — Main execution function that will contain the logic for this PCG Element, with the context as parameter.
  - `get_context()` -> `PCGContext` — Retrieves the execution context - note that this will not be valid outside of the Execute functions
  - `get_input_pin_by_label(pin_label)` -> `PCGPinProperties or None` — Returns true if there is an input pin with the matching label. If found, will copy the pin properties in OutFoundPin
  - `get_input_pins()` -> `Array [ PCGPinProperties ]` — Get Input Pins
  - `get_output_pin_by_label(pin_label)` -> `PCGPinProperties or None` — Returns true if there is an output pin with the matching label. If found, will copy the pin properties in OutFoundPin
  - `get_output_pins()` -> `Array [ PCGPinProperties ]` — Get Output Pins
  - `get_random_stream(context=PCGContext)` — Creates a random stream from the settings & source component
  - `get_seed(context=PCGContext)` — Gets the seed from the associated settings & source component
  - `input_labels()` -> `None` — deprecated: âinput_labelsâ was renamed to âcustom_input_labelsâ.
  - `is_cacheable_override()` -> `bool` — Override for the IsCacheable node property when it depends on the settings in your node. If true, the node will be cache...
  - `iteration_loop(context, num_iterations, optional_a=None, optional_b=None, out_data=PCGPointData)` — Calls the IterationLoopBody a fixed number of times, optional parameters are used to potentially initialized the Out Dat...
  - `iteration_loop_body(context, iteration, a, b, out_metadata)` -> `PCGPoint or None` — Multi-threaded loop that will be called N number of times (defined by Iteration Loop parameter NumIterations). All point...
  - `loop_n_times(context: PCGContext, num_iterations: int, optional_a: PCGSpatialData = Ellipsis, optional_b: PCGSpatialData = Ellipsis, optional_out_data: PCGPointData = Ellipsis)` -> `Tuple [ PCGContext , PCGPointData ]` — deprecated: âloop_n_timesâ was renamed to âiteration_loopâ.
  - `loop_on_point_pairs(context: PCGContext, outer_data: PCGPointData, inner_data: PCGPointData, optional_out_data: PCGPointData = Ellipsis)` -> `Tuple [ PCGContext , PCGPointData ]` — deprecated: âloop_on_point_pairsâ was renamed to ânested_loopâ.
  - `loop_on_points(context: PCGContext, data: PCGPointData, optional_out_data: PCGPointData = Ellipsis)` -> `Tuple [ PCGContext , PCGPointData ]` — deprecated: âloop_on_pointsâ was renamed to âpoint_loopâ.
  - `multi_loop_on_points(context: PCGContext, data: PCGPointData, optional_out_data: PCGPointData = Ellipsis)` -> `Tuple [ PCGContext , PCGPointData ]` — deprecated: âmulti_loop_on_pointsâ was renamed to âvariable_loopâ.
  - `multi_point_loop_body(context: PCGContext, data: PCGPointData, point: PCGPoint, out_metadata: PCGMetadata, iteration: int)` -> `None` — deprecated: âmulti_point_loop_bodyâ was renamed to âvariable_loop_bodyâ.
  - `nested_loop(context, outer_data, inner_data, out_data=PCGPointData)` — Calls the NestedLoopBody function on all nested loop pairs (e.g. (o, i) for all o in Outer, i in Inner)
  - `nested_loop_body(context, outer_data, inner_data, outer_point, inner_point, out_metadata, outer_iteration, inner_iteration)` -> `PCGPoint or None` — Multi-threaded loop that will iterate on all nested loop pairs (e.g. (o, i) for all o in Outer, i in Inner). All points ...
  - `node_color_override()` -> `LinearColor` — Override for the default node color.
  - `node_title_override()` -> `Name` — Override for the default node name
  - `node_type_override()` -> `PCGSettingsType` — Override to change the node type.
  - `output_labels()` -> `None` — deprecated: âoutput_labelsâ was renamed to âcustom_output_labelsâ.
  - `point_loop(context, data, out_data=PCGPointData)` — Calls the PointLoopBody function on all points
  - `point_loop_body(context, data, point, out_metadata, iteration)` -> `PCGPoint or None` — Multi-threaded loop that will iterate on all points in InData. All points will be added in the same order than in input....
  - `point_pair_loop_body(context: PCGContext, outer_data: PCGPointData, inner_data: PCGPointData, outer_point: PCGPoint, inner_point: PCGPoint, out_metadata: PCGMetadata, outer_iteration: int, inner_iteration: int)` -> `PCGPoint | None` — deprecated: âpoint_pair_loop_bodyâ was renamed to ânested_loop_bodyâ.
  - `variable_loop(context, data, out_data=PCGPointData)` — Calls the VariableLoopBody function on all points, each call can return a variable number of points
  - `variable_loop_body(context, data, point, out_metadata, iteration)` -> `Array [ PCGPoint ]` — Multi-threaded loop that will be called on all points in InData. Can return a variable number of output points. All poin...

**Properties** (17):
  - `category`: `Text` — [Read-Write] (Text)
  - `compute_full_data_crc`: `bool` — [Read-Write] In cases where your node is non-cacheable but is likely to yield the same results on su...
  - `custom_input_pins`: `None` — [Read-Write] (Array[PCGPinProperties])
  - `custom_output_pins`: `None` — [Read-Write] (Array[PCGPinProperties])
  - `dependency_parsing_depth`: `int` — [Read-Write] (int32)
  - `description`: `Text` — [Read-Write] (Text)
  - `enable_preconfigured_settings`: `bool` — [Read-Write] (bool)
  - `expose_to_library`: `bool` — [Read-Write] (bool)
  - `has_default_in_pin`: `bool` — [Read-Write] (bool)
  - `has_default_out_pin`: `bool` — [Read-Write] (bool)
  - `has_dynamic_pins`: `bool` — [Read-Write] If enabled, by default, the Out pin type will have the union of In pin types. Default o...
  - `input_pin_labels`: `None` [Read-Only] — [Read-Only]
deprecated: Property âInputPinLabelsâ is deprecated. (Set[Name])
  - `is_cacheable`: `bool` — [Read-Write] Controls whether results can be cached so we can bypass execution if the inputs & setti...
  - `only_expose_preconfigured_settings`: `bool` — [Read-Write] (bool)
  - `output_pin_labels`: `None` [Read-Only] — [Read-Only] (Set[Name])
  - `preconfigured_info`: `None` — [Read-Write] (Array[PCGPreConfiguredSettingsInfo])
  - `requires_game_thread`: `bool` — [Read-Write] Controls whether this node execution can be run from a non-game thread. This is not rel...

### `unreal.PCGBlueprintHelpers`
Inherits: `BlueprintFunctionLibrary` | Header: `PCGBlueprintHelpers.h`

PCGBlueprint Helpers

**Methods** (24):
  - `compute_seed_from_position(position)` -> `int32` [classmethod] — Compute Seed from Position
  - `create_pcg_data_from_actor(actor, parse_actor = True)` -> `PCGData` [classmethod] — Create PCGData from Actor
  - `duplicate_data(data, context, context=PCGContext)` [classmethod] — Return a copy of the data, with Metadata inheritance for spatial data.
  - `flush_pcg_cache()` -> `bool` [classmethod] — Flush the cache, to be used if you have changed something PCG depends on at runtime. Same as pcg.FlushCache command. Ret...
  - `get_actor_bounds_pcg(actor, ignore_pcg_created_components = True)` -> `Box` [classmethod] — Get Actor Bounds PCG
  - `get_actor_data(context=PCGContext)` [classmethod] — Get Actor Data
  - `get_actor_local_bounds_pcg(actor, ignore_pcg_created_components = True)` -> `Box` [classmethod] — Get Actor Local Bounds PCG
  - `get_component(context=PCGContext)` [classmethod] — Get Component
  - `get_extents(point)` -> `Vector` [classmethod] — Get Extents
  - `get_input_data(context=PCGContext)` [classmethod] — Get Input Data
  - `get_interpolated_pcg_landscape_layer_weights(world_context_object, location)` -> `Array [ PCGLandscapeLayerWeight ]` [classmethod] — Get Interpolated PCGLandscape Layer Weights
  - `get_local_center(point)` -> `Vector` [classmethod] — Get Local Center
  - `get_original_component(context=PCGContext)` [classmethod] — Get Original Component
  - `get_random_stream(point: PCGPoint, optional_settings: PCGSettings = Ellipsis, optional_component: PCGComponent = Ellipsis)` -> `RandomStream` [classmethod] — deprecated: âget_random_streamâ was renamed to âget_random_stream_from_pointâ.
  - `get_random_stream_from_point(point, optional_settings = None, optional_component = None)` -> `RandomStream` [classmethod] — Creates a random stream from a pointâs seed and settings/componentâs seed (optional)
  - `get_random_stream_from_two_points(point_a, point_b, optional_settings = None, optional_component = None)` -> `RandomStream` [classmethod] — Creates a random stream from using the random seeds from two points, as well as settings/componentâs seed (optional)
  - `get_settings(context=PCGContext)` [classmethod] — Get Settings
  - `get_target_actor(context, context=PCGContext)` [classmethod] — Get Target Actor
  - `get_task_id(context=PCGContext)` [classmethod] — Get Task Id
  - `get_transformed_bounds(point)` -> `Box` [classmethod] — Get Transformed Bounds
  - `refresh_pcg_runtime_component(component, flush_cache = False)` -> `None` [classmethod] — Refresh a component set to Generate At Runtime, if some parameters changed. Can also flush the cache.
  - `set_extents(point, extents)` -> `PCGPoint` [classmethod] — Set Extents
  - `set_local_center(point, local_center)` -> `PCGPoint` [classmethod] — Set Local Center
  - `set_seed_from_position(point)` -> `PCGPoint` [classmethod] — Set Seed from Position

### `unreal.PCGBlueprintPinHelpers`
Inherits: `BlueprintFunctionLibrary` | Header: `PCGPin.h`

PCGBlueprint Pin Helpers

**Methods** (3):
  - `get_corresponding_data_type(exclusive_data_type)` -> `int32` [classmethod] — Get Corresponding Data Type
  - `is_exactly_same_type(allowed_types, type_to_check)` -> `bool` [classmethod] — Is Exactly Same Type
  - `is_of_type(allowed_types, type_to_check)` -> `bool` [classmethod] — Is Of Type

### `unreal.PCGBlueprintSettings`
Inherits: `PCGSettings` | Header: `PCGExecuteBlueprint.h`

PCGBlueprint Settings

**Methods** (2):
  - `get_element_type()` — Get Element Type
  - `set_element_type(element_type)` -> `PCGBlueprintElement` — Set Element Type

**Properties** (4):
  - `blueprint_element_instance`: `PCGBlueprintElement` [Read-Only] — [Read-Only] (PCGBlueprintElement)
  - `blueprint_element_type`: `Class` [Read-Only] — [Read-Only] (type(Class))
  - `track_actors_only_within_bounds`: `bool` [Read-Only] — [Read-Only] If this is checked, found actors that are outside component bounds will not trigger a re...
  - `tracked_actor_tags`: `None` — [Read-Write] (Array[Name])

### `unreal.PCGBlurSettings`
Inherits: `PCGSettings` | Header: `PCGBlurElement.h`

Select an attribute on a point data and blur it using the values from neighbors within some distance, center to center, and can be done over multiple iterations.

**Properties** (7):
  - `blur_mode`: `PCGBlurElementMode` — [Read-Write] (PCGBlurElementMode)
  - `custom_standard_deviation`: `float` — [Read-Write] (double)
  - `input_source`: `PCGAttributePropertyInputSelector` — [Read-Write] Attribute to use as a base value. Needs to be numerical. (PCGAttributePropertyInputSele...
  - `num_iterations`: `int` — [Read-Write] Number of iterations to apply the blur. (int32)
  - `output_target`: `PCGAttributePropertyOutputSelector` — [Read-Write] Attribute where the result will be written. (PCGAttributePropertyOutputSelector)
  - `search_distance`: `float` — [Read-Write] Radius for search. (double)
  - `use_custom_standard_deviation`: `bool` — [Read-Write] By default, the standard deviation will be SearchDistance / 3, so that at search distan...

### `unreal.PCGBooleanSelectSettings`
Inherits: `PCGControlFlowSettings` | Header: `PCGBooleanSelect.h`

Selects data from either input pin, based on a boolean condition.

**Properties** (1):
  - `use_input_b`: `bool` — [Read-Write] (bool)

### `unreal.PCGBoundsFromMeshSettings`
Inherits: `PCGSettings` | Header: `PCGBoundsFromMesh.h`

Sets the bounds on the points according to the mesh(es) provided in the mesh pin.

**Properties** (3):
  - `mesh_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] Attribute from which to source the meshes to use. (PCGAttributePropertyInputSelector)
  - `silence_attribute_not_found_errors`: `bool` — [Read-Write] Will not produce warnings when the input data does not have the required attribute. (bo...
  - `synchronous_load`: `bool` — [Read-Write] By default, will use async loading for the meshes. (bool)

### `unreal.PCGBoundsModifierSettings`
Inherits: `PCGSettings` | Header: `PCGBoundsModifier.h`

This class controls/sets up a node that modifies the min/max bounds of the input points.

**Properties** (5):
  - `affect_steepness`: `bool` — [Read-Write] (bool)
  - `bounds_max`: `Vector` — [Read-Write] (Vector)
  - `bounds_min`: `Vector` — [Read-Write] (Vector)
  - `mode`: `PCGBoundsModifierMode` — [Read-Write] (PCGBoundsModifierMode)
  - `steepness`: `float` — [Read-Write] (float)

### `unreal.PCGBranchSettings`
Inherits: `PCGControlFlowSettings` | Header: `PCGBranch.h`

Routes input data to one of two outputs, based on a boolean condition.

**Properties** (1):
  - `output_to_b`: `bool` — [Read-Write] (bool)

### `unreal.PCGCleanSplineSettings`
Inherits: `PCGSettings` | Header: `PCGCleanSpline.h`

Remove superfluous control points along the spline, such as those that are co-located or collinear.

**Properties** (7):
  - `collinear_angle_threshold`: `float` — [Read-Write] A control point will be considered collinear if it is within this angle from the segmen...
  - `colocation_distance_threshold`: `float` — [Read-Write] Control points will be considered co-located if they are within this distance from one ...
  - `fuse_colocated_control_points`: `bool` — [Read-Write] Fuse control points that share the same location in world space, within a distance thre...
  - `fuse_mode`: `PCGControlPointFuseMode` — [Read-Write] Controls how two co-located points will be fused together. (PCGControlPointFuseMode)
  - `remove_collinear_control_points`: `bool` — [Read-Write] Remove control points on linear sections of the spline that would otherwise have no eff...
  - `use_radians`: `bool` — [Read-Write] Use radians directly, instead of degrees. The current âCollinearAngleThresholdâ val...
  - `use_spline_local_space`: `bool` — [Read-Write] Use spline local space for the distance calculation, rather than world space. (bool)

### `unreal.PCGClusterSettings`
Inherits: `PCGSettings` | Header: `PCGClusterElement.h`

Given a desired number of clusters (categories), find the best fit cluster for each point by distance, using one of various clustering algorithms.

**Properties** (8):
  - `algorithm`: `PCGClusterAlgorithm` — [Read-Write] Mathematical algorithm for selecting clusters. (PCGClusterAlgorithm)
  - `cluster_attribute`: `PCGAttributePropertyOutputNoSourceSelector` — [Read-Write] Cluster IDs will be written to this attribute on the main output. (PCGAttributeProperty...
  - `final_centroid_element_count_attribute`: `PCGAttributePropertyOutputNoSourceSelector` — [Read-Write] Final centroid element count will be written to this attribute on the Final Centroid ou...
  - `max_iterations`: `int` — [Read-Write] A limit on the number of iterations to run on each algorithm, if it doesnât otherwise...
  - `num_clusters`: `int` — [Read-Write] Number of clusters (segments) to group the points into. Each point will be assigned a c...
  - `output_final_centroid_element_count`: `bool` — [Read-Write] Output the element count for each of the final centroids. (bool)
  - `output_final_centroids`: `bool` — [Read-Write] Output the final location of the centroids or gaussians. (bool)
  - `tolerance`: `float` — [Read-Write] For EM, the maximum allowed difference between the last two iterationsâ âLog Likeli...

### `unreal.PCGCollapsePointsSettings`
Inherits: `PCGSettings` | Header: `PCGCollapsePoints.h`

Collapses (decimates) points on a closest-point basis, allowing weighted averages to be computed as required.

**Properties** (8):
  - `attributes_to_merge`: `None` — [Read-Write] List of attributes to merge on the final points, based on the weights. (Array[PCGAttrib...
  - `comparison_mode`: `PCGCollapseComparisonMode` — [Read-Write] (PCGCollapseComparisonMode)
  - `distance_threshold`: `float` — [Read-Write] Distance at which we will stop collapsing points. E.g. Points will continue collapsing ...
  - `merge_weight_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] Attribute that will drive relative weight when merging points (only in the Weighted mod...
  - `mode`: `PCGCollapseMode` — [Read-Write] (PCGCollapseMode)
  - `use_merge_weight_attribute`: `bool` — [Read-Write] Controls whether input points will use a weight driven by an attribute (bool)
  - `visit_order`: `PCGCollapseVisitOrder` — [Read-Write] Determines order in which we will collapse points pair-wise. (PCGCollapseVisitOrder)
  - `visit_order_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] Attribute to drive visit order. (PCGAttributePropertyInputSelector)

### `unreal.PCGCollapseSettings`
Inherits: `PCGSettings` | Header: `PCGCollapseElement.h`

Convert input to point data, performing sampling with default settings if necessary

### `unreal.PCGCollisionShapeData`
Inherits: `PCGSpatialDataWithPointCache` | Header: `PCGCollisionShapeData.h`

PCGCollision Shape Data

**Properties** (1):
  - `transform`: `Transform` [Read-Only] — [Read-Only] (Transform)

### `unreal.PCGCollisionWrapperData`
Inherits: `PCGSpatialData` | Header: `PCGCollisionWrapperData.h`

PCGCollision Wrapper Data

### `unreal.PCGCombinePointsSettings`
Inherits: `PCGSettings` | Header: `PCGCombinePoints.h`

Combines each point to share a singular bound extent.

**Properties** (3):
  - `center_pivot`: `bool` — [Read-Write] Places the point at the center of the combined bounds. (bool)
  - `point_transform`: `Transform` — [Read-Write] Transform the point and adjust the bounds. (Transform)
  - `use_first_point_transform`: `bool` — [Read-Write] Use the transform of the initial point. (bool)

### `unreal.PCGComponent`
Inherits: `ActorComponent` | Header: `PCGComponent.h`

**Methods** (15):
  - `add_actors_to_managed_resources(actors)` -> `None` — Creates a managed actors resource and adds it to the current component. Note: in native code, consider using the explici...
  - `add_components_to_managed_resources(components)` -> `None` — Creates a managed component resource and adds it to the current component. Note: in native code, consider using the expl...
  - `add_to_managed_resources(resource)` -> `None` — Registers some managed resource to the current component
  - `cleanup(remove_components)` -> `None` — Networked cleanup call
  - `cleanup_local(remove_components)` -> `None` — Cleans up the generation from a local (vs. remote) standpoint. Will not be replicated. Will be delayed.
  - `clear_pcg_link(template_actor = None)` -> `Actor` — Move all generated resources under a new actor, following a template (AActor if not provided), clearing all link to this...
  - `generate(force)` -> `None` — Networked generation call that also activates the component as needed
  - `generate_local(force)` -> `None` — Starts generation from a local (vs. remote) standpoint. Will not be replicated. Will be delayed.
  - `get_editing_mode()` -> `PCGEditorDirtyMode` — Returns the current editing mode
  - `get_generated_graph_output()` -> `PCGDataCollection` — Retrieves generated data
  - `get_serialized_editing_mode()` -> `PCGEditorDirtyMode` — Get Serialized Editing Mode
  - `notify_properties_changed_from_blueprint()` -> `None` — Notify properties changed, used in runtime cases, will dirty & trigger a regeneration if needed
  - `refresh_pcg_runtime_component(flush_cache = False)` -> `None` — Refresh a component set to Generate At Runtime, if some parameters changed. Can also flush the cache.
  - `set_editing_mode(editing_mode, serialized_editing_mode)` -> `None` — Set Editing Mode
  - `set_graph(graph)` -> `None` — Set Graph

**Properties** (22):
  - `activated`: `bool` — [Read-Write] (bool)
  - `dirty_generated`: `bool` [Read-Only] — [Read-Only] (bool)
  - `generate_on_drop_when_trigger_on_demand`: `bool` [Read-Only] — [Read-Only] When Generation Trigger is OnDemand, we can still force the component to generate on dro...
  - `generated`: `bool` [Read-Only] — [Read-Only] Flag to indicate whether this component has run in the editor. Note that for partitionab...
  - `generation_radii`: `PCGRuntimeGenerationRadii` — [Read-Write] (PCGRuntimeGenerationRadii)
  - `generation_trigger`: `PCGComponentGenerationTrigger` [Read-Only] — [Read-Only] (PCGComponentGenerationTrigger)
  - `graph_instance`: `PCGGraphInstance` [Read-Only] — [Read-Only] (PCGGraphInstance)
  - `ignore_landscape_tracking`: `bool` — [Read-Write] Marks the component to be not refreshed automatically when the landscape changes, even ...
  - `input_type`: `PCGComponentInput` — [Read-Write] (PCGComponentInput)
  - `is_component_partitioned`: `bool` — [Read-Write] Will partition the component in a grid, dispatching the generation to multiple local co...
  - `on_pcg_graph_cancelled_external`: `OnPCGGraphCancelledExternal` — [Read-Write] Event dispatched when a graph cancels generation on this component. (OnPCGGraphCancelle...
  - `on_pcg_graph_cleaned_external`: `OnPCGGraphCleanedExternal` — [Read-Write] Event dispatched when a graph cleans on this component. (OnPCGGraphCleanedExternal)
  - `on_pcg_graph_generated_external`: `OnPCGGraphGeneratedExternal` — [Read-Write] Event dispatched when a graph completes its generation on this component. (OnPCGGraphGe...
  - `on_pcg_graph_start_generating_external`: `OnPCGGraphStartGeneratingExternal` — [Read-Write] Event dispatched when a graph begins generation on this component. (OnPCGGraphStartGene...
  - `only_track_itself`: `bool` — [Read-Write] Even if the graph has external dependencies, the component wonât react to them. (bool...
  - `override_generation_radii`: `bool` — [Read-Write] Manual overrides for the graph generation radii and cleanup radius multiplier. (bool)
  - `parse_actor_components`: `bool` — [Read-Write] (bool)
  - `post_generate_function_names`: `None` — [Read-Write] Can specify a list of functions from the owner of this component to be called when gene...
  - `regenerate_in_editor`: `bool` — [Read-Write] (bool)
  - `scheduling_policy`: `PCGSchedulingPolicyBase` [Read-Only] — [Read-Only] This is the instanced UPCGSchedulingPolicy object which holds scheduling parameters and ...
  - `scheduling_policy_class`: `Class` [Read-Only] — [Read-Only] A Scheduling Policy dictates the order in which instances of this component will be sche...
  - `seed`: `int` — [Read-Write] (int32)

### `unreal.PCGComputeGraphSettings`
Inherits: `PCGSettings` | Header: `PCGComputeGraphElement.h`

PCGCompute Graph Settings

### `unreal.PCGComputeKernel`
Inherits: `ComputeKernel` | Header: `PCGComputeKernel.h`

PCGCompute Kernel

### `unreal.PCGControlFlowSettings`
Inherits: `PCGSettings` | Header: `PCGControlFlow.h`

PCGControl Flow Settings

### `unreal.PCGConvertToAttributeSetSettings`
Inherits: `PCGSettings` | Header: `PCGConvertToAttributeSet.h`

Converts point data to an attribute set with one entry per point and the same attributes.

### `unreal.PCGConvertToPointDataSettings`
Inherits: `PCGCollapseSettings` | Header: `PCGCollapseElement.h`

Converts attribute sets to point data

### `unreal.PCGConvexHull2DSettings`
Inherits: `PCGSettings` | Header: `PCGConvexHull2D.h`

Return the convex hull of a set of points on the XY plane

### `unreal.PCGCopyAttributesSettings`
Inherits: `PCGSettings` | Header: `PCGCopyAttributes.h`

PCGCopy Attributes Settings

**Properties** (6):
  - `copy_all_attributes`: `bool` — [Read-Write] (bool)
  - `copy_all_domains`: `bool` — [Read-Write] If checked, it is copying all attributes from all domains, as long as the source domain...
  - `input_source`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `metadata_domains_mapping`: `None` — [Read-Write] When copying all attributes, a mapping can be specified. If it is empty, itâs going t...
  - `operation`: `PCGCopyAttributesOperation` — [Read-Write] (PCGCopyAttributesOperation)
  - `output_target`: `PCGAttributePropertyOutputSelector` — [Read-Write] (PCGAttributePropertyOutputSelector)

### `unreal.PCGCopyPointsAnalysisKernel`
Inherits: `PCGComputeKernel` | Header: `PCGCopyPointsAnalysisKernel.h`

PCGCopy Points Analysis Kernel

### `unreal.PCGCopyPointsKernel`
Inherits: `PCGComputeKernel` | Header: `PCGCopyPointsKernel.h`

PCGCopy Points Kernel

### `unreal.PCGCopyPointsSettings`
Inherits: `PCGSettings` | Header: `PCGCopyPoints.h`

PCGCopy Points Settings

**Properties** (11):
  - `apply_target_rotation_to_positions`: `bool` — [Read-Write] If this option is set, points will have their source position transformed using the tar...
  - `apply_target_scale_to_positions`: `bool` — [Read-Write] If this option is set, points will have their source position transformed using the tar...
  - `attribute_inheritance`: `PCGCopyPointsMetadataInheritanceMode` — [Read-Write] The method used to determine output data attributes (PCGCopyPointsMetadataInheritanceMo...
  - `color_inheritance`: `PCGCopyPointsInheritanceMode` — [Read-Write] The method used to determine output point color (PCGCopyPointsInheritanceMode)
  - `copy_each_source_on_every_target`: `bool` — N (or N:1 or 1:N) operation, producing N point data. (bool) [Read-Write] If this option is set, each...
  - `match_attribute`: `Name` — [Read-Write] Attribute that must be present on both the source data and the target point, and have t...
  - `match_based_on_attribute`: `bool` — [Read-Write] Perform a conditional copy point where data pairs must have a matching attribute in ord...
  - `rotation_inheritance`: `PCGCopyPointsInheritanceMode` — [Read-Write] The method used to determine output point rotation (PCGCopyPointsInheritanceMode)
  - `scale_inheritance`: `PCGCopyPointsInheritanceMode` — [Read-Write] The method used to determine output point scale (PCGCopyPointsInheritanceMode)
  - `seed_inheritance`: `PCGCopyPointsInheritanceMode` — [Read-Write] The method used to determine output seed values. Relative recomputes the seed from the ...
  - `tag_inheritance`: `PCGCopyPointsTagInheritanceMode` — [Read-Write] The method used to determine the output data tags (PCGCopyPointsTagInheritanceMode)

### `unreal.PCGCountUniqueAttributeValuesKernel`
Inherits: `PCGComputeKernel` | Header: `PCGCountUniqueAttributeValuesKernel.h`

PCGCount Unique Attribute Values Kernel

### `unreal.PCGCreateAttributeSetSettings`
Inherits: `PCGSettings` | Header: `PCGCreateAttribute.h`

Creates a new Attribute Set.

**Properties** (2):
  - `attribute_types`: `PCGMetadataTypesConstantStruct` — [Read-Write] (PCGMetadataTypesConstantStruct)
  - `output_target`: `PCGAttributePropertyOutputNoSourceSelector` — [Read-Write] (PCGAttributePropertyOutputNoSourceSelector)

### `unreal.PCGCreateCollisionDataSettings`
Inherits: `PCGSettings` | Header: `PCGCreateCollisionData.h`

PCGCreate Collision Data Settings

**Properties** (4):
  - `collision_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `collision_query_flag`: `PCGCollisionQueryFlag` — [Read-Write] Controls how shapes are selected from collision. Performance warning on using complex s...
  - `synchronous_load`: `bool` — [Read-Write] (bool)
  - `warn_if_attribute_could_not_be_used`: `bool` — [Read-Write] (bool)

### `unreal.PCGCreatePointsGridSettings`
Inherits: `PCGSettings` | Header: `PCGCreatePointsGrid.h`

Creates a 2D or 3D grid of points.

**Properties** (7):
  - `cell_size`: `Vector` — [Read-Write] (Vector)
  - `coordinate_space`: `PCGCoordinateSpace` — [Read-Write] Sets the generation referential of the points (PCGCoordinateSpace)
  - `cull_points_outside_volume`: `bool` — [Read-Write] If true, points are removed if they are outside of the volume (bool)
  - `grid_extents`: `Vector` — [Read-Write] (Vector)
  - `point_position`: `PCGPointPosition` — [Read-Write] (PCGPointPosition)
  - `point_steepness`: `float` — [Read-Write] Each PCG point represents a discretized, volumetric region of world space. The pointsâ...
  - `set_points_bounds`: `bool` — [Read-Write] If true, the bounds of the points are set to 50.0, if false, 1.0 (bool)

### `unreal.PCGCreatePointsSettings`
Inherits: `PCGSettings` | Header: `PCGCreatePoints.h`

Creates point data from a provided list of points.

**Properties** (3):
  - `coordinate_space`: `PCGCoordinateSpace` — [Read-Write] Sets the generation referential of the points (PCGCoordinateSpace)
  - `cull_points_outside_volume`: `bool` — [Read-Write] If true, points are removed if they are outside of the volume (bool)
  - `points_to_create`: `None` — [Read-Write] (Array[PCGPoint])

### `unreal.PCGCreatePointsSphereSettings`
Inherits: `PCGSettings` | Header: `PCGCreatePointsSphere.h`

Generate a grid of points along the surface of a sphere.

**Properties** (20):
  - `coordinate_space`: `PCGCoordinateSpace` — [Read-Write] Sets the generation referential of the points. (PCGCoordinateSpace)
  - `cull_points_outside_volume`: `bool` — [Read-Write] Points are removed if they are outside the volume. (bool)
  - `geodesic_subdivisions`: `int` — [Read-Write] Determines the number of subdivisions of the geodesic sphere. Becomes exponentially mor...
  - `jitter`: `float` — [Read-Write] Adds randomization (in the range of [-Jitter, Jitter]) of the angles of a generated poi...
  - `latitudinal_end_angle`: `float` — [Read-Write] Points will cease to be generated on the sphereâs surface after this equatorial angle...
  - `latitudinal_segments`: `int` — [Read-Write] Will determine the latitudinal angle between segments needed to generate this number of...
  - `latitudinal_start_angle`: `float` — [Read-Write] Points will be generated on the sphereâs surface beginning at this equatorial angle. ...
  - `longitudinal_end_angle`: `float` — [Read-Write] Points will cease to be generated on the sphereâs surface after this meridional angle...
  - `longitudinal_segments`: `int` — [Read-Write] Will determine the longitudinal angle between segments needed to generate this number o...
  - `longitudinal_start_angle`: `float` — [Read-Write] Points will be generated on the sphereâs surface beginning at this meridional angle. ...
  - `origin`: `Vector` — [Read-Write] The sphereâs origin, around which the points will be generated. (Vector)
  - `phi`: `float` — [Read-Write] The longitudinal angle (in degrees) between generated segments on the standard sphere g...
  - `point_orientation`: `PCGSpherePointOrientation` — [Read-Write] Will determine the pointsâ orientation, once generated. (PCGSpherePointOrientation)
  - `point_steepness`: `float` — [Read-Write] Directly set as the output pointsâ steepness value. (float)
  - `poisson_distance`: `float` — [Read-Write] The maximum world distance between points sampled on the sphereâs surface during a Po...
  - `poisson_max_attempts`: `int` — [Read-Write] Poisson sampling will continue to search for open positions until this limit is reached...
  - `radius`: `float` — [Read-Write] The sphereâs radius. (double)
  - `sample_count`: `int` — [Read-Write] Determines the number of samples generated for the random generation and the poisson sa...
  - `sphere_generation`: `PCGSphereGeneration` — [Read-Write] Determines the type of sphere generated. (PCGSphereGeneration)
  - `theta`: `float` — [Read-Write] The latitudinal angle (in degrees) between generated segments on the standard sphere gr...

### `unreal.PCGCreateSplineSettings`
Inherits: `PCGSettings` | Header: `PCGCreateSpline.h`

PCG node that creates a spline presentation from the input points data, with optional tangents

**Properties** (7):
  - `apply_custom_tangents`: `bool` — [Read-Write] Allow to specify custom tangents for each point, as an attribute. Canât be set if the...
  - `arrive_tangent_attribute`: `Name` — [Read-Write] (Name)
  - `closed_loop`: `bool` — [Read-Write] (bool)
  - `leave_tangent_attribute`: `Name` — [Read-Write] (Name)
  - `linear`: `bool` — [Read-Write] Controls whether the segment between control points is a curve (when false) or a straig...
  - `mode`: `PCGCreateSplineMode` — [Read-Write] (PCGCreateSplineMode)
  - `post_process_function_names`: `None` — [Read-Write] Specify a list of functions to be called on the target actor after spline creation. Fun...

### `unreal.PCGCreateSurfaceFromSplineSettings`
Inherits: `PCGSettings` | Header: `PCGCreateSurfaceFromSpline.h`

Create an implicit surface for each given spline. The surface is given by the top-down 2D projection of the spline. Each spline must be closed.

### `unreal.PCGCreateTargetActor`
Inherits: `PCGSettings` | Header: `PCGCreateTargetActor.h`

PCGCreate Target Actor

**Properties** (9):
  - `allow_template_actor_editing`: `bool` — make this InlineEditConditionToggle, not done because property changed event does not propagate corr...
  - `attach_options`: `PCGAttachOptions` — [Read-Write] (PCGAttachOptions)
  - `data_layer_settings`: `PCGDataLayerSettings` — [Read-Write] (PCGDataLayerSettings)
  - `delete_actors_before_generation`: `bool` — [Read-Write] (bool)
  - `hlod_settings`: `PCGHLODSettings` — [Read-Write] (PCGHLODSettings)
  - `post_process_function_names`: `None` — [Read-Write] Specify a list of functions to be called on the target actor after creation. Functions ...
  - `property_override_descriptions`: `None` — [Read-Write] Override the default property values on the created target actor. Applied before post-p...
  - `template_actor`: `Actor` — [Read-Write] (Actor)
  - `template_actor_class`: `Class` [Read-Only] — [Read-Only] (type(Class))

### `unreal.PCGCullPointsOutsideActorBoundsSettings`
Inherits: `PCGSettings` | Header: `PCGCullPointsOutsideActorBounds.h`

Removes points that lie outside the current actor bounds.

**Properties** (2):
  - `bounds_expansion`: `float` — [Read-Write] (float)
  - `mode`: `PCGCullPointsMode` — [Read-Write] (PCGCullPointsMode)

### `unreal.PCGCustomHLSLKernel`
Inherits: `PCGComputeKernel` | Header: `PCGCustomHLSLKernel.h`

PCGCustom HLSLKernel

### `unreal.PCGCustomHLSLSettings`
Inherits: `PCGSettings` | Header: `PCGCustomHLSL.h`

Produces a HLSL compute shader which will be executed on the GPU.

### `unreal.PCGData`
Inherits: `Object` | Header: `PCGData.h`

Base class for any âdataâ class in the PCG framework. This is an intentionally vague base class so we can have the required flexibility to pass in various concrete data types, settings, and more.

**Methods** (3):
  - `const_metadata()` -> `PCGMetadata` — Metadata ops, to be implemented if data supports Metadata
  - `duplicate_data(context, context=PCGContext)` — Return a copy of the data, with Metadata inheritance for spatial data.
  - `mutable_metadata()` -> `PCGMetadata` — Mutable Metadata

### `unreal.PCGDataAsset`
Inherits: `Object` | Header: `PCGDataAsset.h`

Container for PCG data exported as standalone objects

**Properties** (9):
  - `category`: `Text` — [Read-Write] Controls in what category the asset will appear in the palette & contextual menus. (Tex...
  - `color`: `LinearColor` — [Read-Write] Custom node color to use for this specific asset (LinearColor)
  - `data`: `PCGDataCollection` [Read-Only] — [Read-Only] Contains direct data owned by this data asset (PCGDataCollection)
  - `description`: `Text` — [Read-Write] Additional description (tooltip) shown on the asset/loader node. (Text)
  - `exporter_class`: `Class` [Read-Only] — [Read-Only] Custom exporter class that was used to create this PCG asset. Should derive from UPCGAss...
  - `expose_to_library`: `bool` — [Read-Write] Controls whether the asset will be visible from the palette & contextual menus. (bool)
  - `name`: `str` — [Read-Write] Alternative name (instead of asset name), can be left empty (str)
  - `object_path`: `SoftObjectPath` [Read-Only] — [Read-Only] Reference to originating object (often will be a level) (SoftObjectPath)
  - `settings_class`: `Class` [Read-Only] — [Read-Only] Custom class to create settings/node in the graph when dragged in the editor. Can be lef...

### `unreal.PCGDataCollectionExporter`
Inherits: `PCGAssetExporter` | Header: `PCGSaveAssetElement.h`

Default exporter to save data collections, with no capacity for update.

**Properties** (3):
  - `asset_color`: `LinearColor` [Read-Only] — [Read-Only] (LinearColor)
  - `asset_description`: `str` [Read-Only] — [Read-Only] (str)
  - `data`: `PCGDataCollection` [Read-Only] — [Read-Only] (PCGDataCollection)

### `unreal.PCGDataFromActorSettings`
Inherits: `PCGSettings` | Header: `PCGDataFromActor.h`

Builds a collection of PCG-compatible data from the selected actors.

**Properties** (15):
  - `actor_selector`: `PCGActorSelectorSettings` — [Read-Write] Describes which actors to select for data collection. (PCGActorSelectorSettings)
  - `allowed_grids`: `int` — [Read-Write] Select which grid sizes to consider when collecting data from partitioned PCG component...
  - `also_output_single_point_data`: `bool` — [Read-Write] Also produces a single point data at the actor location. (bool)
  - `always_requery_actors`: `bool` — [Read-Write] If this is true, we will never put this element in cache, and will always try to re-que...
  - `component_selector`: `PCGComponentSelectorSettings` — [Read-Write] Describes which components to select for the data collection. (PCGComponentSelectorSett...
  - `components_must_overlap_self`: `bool` — [Read-Write] Only get data from components which overlap with the bounds of your source component. (...
  - `expected_pins`: `None` — [Read-Write] Provide pin names to match against the found component output pins. Data will automatic...
  - `get_data_on_all_grids`: `bool` — [Read-Write] Get data from all grid sizes if there is a partitioned PCG component on the actor, inst...
  - `ignore_pcg_generated_components`: `bool` — [Read-Write] Ignores any component that was spawned by PCG. (bool)
  - `merge_single_point_data`: `bool` — [Read-Write] Merges all the single point data outputs into a single point data. (bool)
  - `mode`: `PCGGetDataFromActorMode` — [Read-Write] Describes what kind of data we will collect from the found actor(s). (PCGGetDataFromAct...
  - `property_name`: `Name` — [Read-Write] The property name on the found actor to create a data collection from. (Name)
  - `silence_reserved_attribute_name_warnings`: `bool` — [Read-Write] Silence warnings that attribute names were rejected because they clash with reserved na...
  - `silence_sanitized_attribute_name_warnings`: `bool` — [Read-Write] Silence warnings that attribute names were sanitized to replace invalid characters. (bo...
  - `track_actors_only_within_bounds`: `bool` [Read-Only] — [Read-Only] If this is checked, found actors that are outside component bounds will not trigger a re...

### `unreal.PCGDataFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `PCGData.h`

PCGData Function Library

**Methods** (16):
  - `add_to_collection(collection, data, pin_label, tags)` -> `PCGDataCollection` [classmethod] — Adds a data object to a given collection, simpler usage than making a PCGTaggedData object. InTags can be empty.
  - `get_all_settings(collection)` -> `Array [ PCGTaggedData ]` [classmethod] — Get All Settings
  - `get_inputs(collection)` -> `Array [ PCGTaggedData ]` [classmethod] — Blueprint methods to support interaction with FPCGDataCollection
  - `get_inputs_by_pin(collection: PCGDataCollection, pin_label: Name)` -> `None` [classmethod] — deprecated: âget_inputs_by_pinâ was renamed to âget_inputs_by_pin_labelâ.
  - `get_inputs_by_pin_label(collection, pin_label)` -> `Array [ PCGTaggedData ]` [classmethod] — Get Inputs by Pin Label
  - `get_inputs_by_tag(collection, tag)` -> `Array [ PCGTaggedData ]` [classmethod] — Get Inputs by Tag
  - `get_params(collection)` -> `Array [ PCGTaggedData ]` [classmethod] — Get Params
  - `get_params_by_pin(collection: PCGDataCollection, pin_label: Name)` -> `None` [classmethod] — deprecated: âget_params_by_pinâ was renamed to âget_params_by_pin_labelâ.
  - `get_params_by_pin_label(collection, pin_label)` -> `Array [ PCGTaggedData ]` [classmethod] — Get Params by Pin Label
  - `get_params_by_tag(collection, tag)` -> `Array [ PCGTaggedData ]` [classmethod] — Get Params by Tag
  - `get_tagged_inputs(collection: PCGDataCollection, tag: str)` -> `None` [classmethod] — deprecated: âget_tagged_inputsâ was renamed to âget_inputs_by_tagâ.
  - `get_tagged_params(collection: PCGDataCollection, tag: str)` -> `None` [classmethod] — deprecated: âget_tagged_paramsâ was renamed to âget_params_by_tagâ.
  - `get_typed_inputs()` [classmethod] — Gets all inputs of the given class type, returning matching tagged data in the OutTaggedData value too
  - `get_typed_inputs_by_pin()` [classmethod] — Gets all inputs of the given class type and on the given pin, returning matching tagged data in the OutTaggedData value ...
  - `get_typed_inputs_by_pin_label()` [classmethod] — Gets all inputs of the given class type and on the given pin label, returning matching tagged data in the OutTaggedData ...
  - `get_typed_inputs_by_tag()` [classmethod] — Gets all inputs of the given class type and having the provided tag, returning matching tagged data in the OutTaggedData...

### `unreal.PCGDataNumKernel`
Inherits: `PCGComputeKernel` | Header: `PCGDataNumKernel.h`

PCGData Num Kernel

### `unreal.PCGDataNumSettings`
Inherits: `PCGSettings` | Header: `PCGDataNum.h`

Counts number of data in a data collection

**Properties** (1):
  - `output_attribute_name`: `Name` — [Read-Write] (Name)

### `unreal.PCGDataTableRowToParamDataSettings`
Inherits: `PCGSettings` | Header: `PCGDataTableRowToParamData.h`

PCGData Table Row to Param Data Settings

**Properties** (3):
  - `data_table`: `DataTable` — [Read-Write] the data table to copy from (DataTable)
  - `row_name`: `Name` — [Read-Write] The name of the row to copy from (Name)
  - `synchronous_load`: `bool` — [Read-Write] By default, data table loading is asynchronous, can force it synchronous if needed. (bo...

### `unreal.PCGDebugDrawComponent`
Inherits: `DebugDrawComponent` | Header: `PCGDebugDrawComponent.h`

A transient component intended to visualize attribute information of PCG Point Data, such as printing the string value in World Space. Future support may include: vectors, flow fields, heatmaps, etc. ...

### `unreal.PCGDebugSettings`
Inherits: `PCGSettings` | Header: `PCGDebugElement.h`

PCGDebug Settings

**Properties** (1):
  - `target_actor`: `Actor` — [Read-Write] (Actor)

### `unreal.PCGDeleteAttributesSettings`
Inherits: `PCGSettings` | Header: `PCGDeleteAttributesElement.h`

Removes attributes from a given input metadata. Either removes specifically named attributes or remove all attributes not in a given list.

**Properties** (4):
  - `metadata_domain`: `Name` — [Read-Write] When deleting attributes, it only target a single domain that can be specified here. (N...
  - `operation`: `PCGAttributeFilterOperation` — the default has been changed to DeleteSelected for new objects (PCGAttributeFilterOperation) [Read-W...
  - `operator`: `PCGStringMatchingOperator` — [Read-Write] (PCGStringMatchingOperator)
  - `selected_attributes`: `str` — [Read-Write] Comma-separated list of attributes to keep or remove from the input data. (str)

### `unreal.PCGDeleteTagsSettings`
Inherits: `PCGSettings` | Header: `PCGDeleteTags.h`

Filters the tags on the input data.

**Properties** (3):
  - `operation`: `PCGTagFilterOperation` — [Read-Write] (PCGTagFilterOperation)
  - `operator`: `PCGStringMatchingOperator` — [Read-Write] (PCGStringMatchingOperator)
  - `selected_tags`: `str` — [Read-Write] Comma-separated list of tags to add or remove from the input data. (str)

### `unreal.PCGDensityFilterSettings`
Inherits: `PCGSettings` | Header: `PCGDensityFilter.h`

PCGDensity Filter Settings

**Properties** (4):
  - `invert_filter`: `bool` — [Read-Write] (bool)
  - `keep_zero_density_points`: `bool` — [Read-Write] (bool)
  - `lower_bound`: `float` — [Read-Write] (float)
  - `upper_bound`: `float` — [Read-Write] (float)

### `unreal.PCGDensityRemapSettings`
Inherits: `PCGSettings` | Header: `PCGDensityRemapElement.h`

PCGDensity Remap Settings

**Properties** (5):
  - `exclude_values_outside_input_range`: `bool` — [Read-Write] Density values outside of the input range will be unaffected by the remapping (bool)
  - `out_range_max`: `float` — [Read-Write] (float)
  - `out_range_min`: `float` — [Read-Write] (float)
  - `range_max`: `float` — [Read-Write] If InRangeMin = InRangeMax, then that density value is mapped to the average of OutRang...
  - `range_min`: `float` — [Read-Write] If InRangeMin = InRangeMax, then that density value is mapped to the average of OutRang...

### `unreal.PCGDeterminismTestBlueprintBase`
Inherits: `Object` | Header: `PCGDeterminismTestBlueprintBase.h`

PCGDeterminism Test Blueprint Base

**Methods** (1):
  - `execute_test(pcg_node, out_test_result)` -> `DeterminismTestResult` — Execute Test

### `unreal.PCGDifferenceData`
Inherits: `PCGSpatialDataWithPointCache` | Header: `PCGDifferenceData.h`

PCGDifference Data

**Methods** (4):
  - `add_difference(difference: PCGSpatialData)` -> `None` — deprecated: âadd_differenceâ was renamed to âk2_add_differenceâ.
  - `initialize(data)` -> `None` — Initialize
  - `k2_add_difference(difference)` -> `None` — K2 Add Difference
  - `set_density_function(density_function)` -> `None` — Set Density Function

**Properties** (4):
  - `density_function`: `PCGDifferenceDensityFunction` — [Read-Write] (PCGDifferenceDensityFunction)
  - `diff_metadata`: `bool` [Read-Only] — [Read-Only] (bool)
  - `difference`: `PCGSpatialData` [Read-Only] — [Read-Only] (PCGSpatialData)
  - `source`: `PCGSpatialData` [Read-Only] — [Read-Only] (PCGSpatialData)

### `unreal.PCGDifferenceSettings`
Inherits: `PCGSettings` | Header: `PCGDifferenceElement.h`

PCGDifference Settings

**Properties** (4):
  - `density_function`: `PCGDifferenceDensityFunction` — [Read-Write] The density function to use when recalculating the density after the operation. (PCGDif...
  - `diff_metadata`: `bool` — [Read-Write] (bool)
  - `keep_zero_density_points`: `bool` — [Read-Write] If enabled, the output will not automatically filter out points with zero density. (boo...
  - `mode`: `PCGDifferenceMode` — [Read-Write] Describes how the difference operation will treat the output data:
Continuous - Non-des...

### `unreal.PCGDistanceSettings`
Inherits: `PCGSettings` | Header: `PCGDistance.h`

Calculates the distance between two points (inherently a n*n operation)

**Properties** (9):
  - `attribute_name`: `Name` — [Read-Write]
deprecated: Use OutputAttribute selector instead. (Name)
  - `check_source_against_respective_target`: `bool` — N operation). Source and Target num must be the same (or 1). (bool) [Read-Write] If this option is o...
  - `maximum_distance`: `float` — [Read-Write] A maximum distance to search, which is used as an optimization (double)
  - `output_attribute`: `PCGAttributePropertySelector` — [Read-Write] The attribute output for the resulting distance value. (PCGAttributePropertySelector)
  - `output_distance_vector`: `bool` — [Read-Write] Controls whether the attribute will be a scalar or a vector (bool)
  - `output_to_attribute`: `bool` — [Read-Write] Output the distance or distance vector to an attribute. (bool)
  - `set_density`: `bool` — [Read-Write] If true, will also set the density to be 0 - 1 based on MaximumDistance (bool)
  - `source_shape`: `PCGDistanceShape` — [Read-Write] What shape is used on the âsourceâ points (PCGDistanceShape)
  - `target_shape`: `PCGDistanceShape` — [Read-Write] What shape is used on the âtargetâ points (PCGDistanceShape)

### `unreal.PCGDummyGetPropertyTest`
Inherits: `Object` | Header: `PCGGetActorPropertyTest.h`

PCGDummy Get Property Test

**Properties** (2):
  - `double_property`: `float` [Read-Only] — [Read-Only] (double)
  - `int64_property`: `int` [Read-Only] — [Read-Only] (int64)

### `unreal.PCGDuplicateCrossSectionsSettings`
Inherits: `PCGSubdivisionBaseSettings` | Header: `PCGDuplicateCrossSections.h`

PCGDuplicate Cross Sections Settings

**Properties** (5):
  - `extrude_vector`: `Vector` — [Read-Write] (Vector)
  - `extrude_vector_as_attribute`: `bool` — [Read-Write] Set it to true if you want the extrude vector to be taken from the input spline as attr...
  - `extrude_vector_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] Attribute to be taken from the input spline containing the extrude vector for the slici...
  - `output_spline_index_attribute`: `bool` — [Read-Write] (bool)
  - `spline_index_attribute_name`: `Name` — [Read-Write] Name of the spline index output attribute name. (Name)

### `unreal.PCGDuplicatePointSettings`
Inherits: `PCGSettings` | Header: `PCGDuplicatePoint.h`

Creates duplicates of each point with optional transform offsets.

**Properties** (5):
  - `direction`: `Vector` — [Read-Write] Direction to stack point duplicates. (Vector)
  - `direction_applied_in_relative_space`: `bool` — [Read-Write] Controls whether the axis displacement will be made in relative space or not (bool)
  - `iterations`: `int` — [Read-Write] Number of duplicates to produce. (int32)
  - `output_source_point`: `bool` — [Read-Write] Include the source point. (bool)
  - `point_transform`: `Transform` — [Read-Write] Transform offset for each point duplicate (Transform)

### `unreal.PCGEdge`
Inherits: `Object` | Header: `PCGEdge.h`

### `unreal.PCGElevationIsolinesSettings`
Inherits: `PCGSettings` | Header: `PCGElevationIsolines.h`

Compute the elevation isolines of a surface, can output either points or splines. Currently only work for Z-up surfaces.

**Properties** (8):
  - `add_tag_on_output_for_same_elevation`: `bool` — [Read-Write] Can add a tag (integer) to group output data that are at the same elevation. (bool)
  - `elevation_end`: `float` — [Read-Write] Maximum elevation of the isolines. (double)
  - `elevation_increment`: `float` — [Read-Write] Increment elevation between each isolines. (double)
  - `elevation_start`: `float` — [Read-Write] Minimum elevation of the isolines. (double)
  - `linear_spline`: `bool` — [Read-Write] Spline can either be curved or linear. (bool)
  - `output_as_spline`: `bool` — [Read-Write] Will output splines rather than points. (bool)
  - `project_surface_normal`: `bool` — [Read-Write] Option to either have Z up or project the surface normal at this position (similar to p...
  - `resolution`: `float` — [Read-Write] Resolution of the grid for the discretization of the surface. This is the size of one c...

### `unreal.PCGExportSelectedAttributesSettings`
Inherits: `PCGSettings` | Header: `PCGExportSelectedAttributes.h`

Exports the selected attributes directly to file in a specified format. Note: This node is only operational on traditional development platforms (Windows, Linux, Mac) where the Editor can be used.

**Properties** (8):
  - `add_custom_data_version`: `bool` — [Read-Write] (bool)
  - `attribute_selectors`: `None` — [Read-Write] The attributes to use as sources for the data export. Only those selected will be expor...
  - `custom_version`: `int` — [Read-Write] (int32)
  - `export_all_attributes`: `bool` — [Read-Write] (bool)
  - `file_name`: `str` — [Read-Write] The file name (without extension) to export the data. (str)
  - `format`: `PCGExportAttributesFormat` — [Read-Write] Data will be exported to a local file in this format. (PCGExportAttributesFormat)
  - `layout`: `PCGExportAttributesLayout` — [Read-Write] Determines how the data will be laid out in the export. (PCGExportAttributesLayout)
  - `path`: `DirectoryPath` — [Read-Write] The directory to save the data within. If none is selected a dialog will open by defaul...

### `unreal.PCGExternalDataSettings`
Inherits: `PCGSettings` | Header: `PCGExternalData.h`

Base class for external data input settings

**Properties** (1):
  - `attribute_mapping`: `None` — [Read-Write] (Map[str,PCGAttributePropertyInputSelector])

### `unreal.PCGFilterByAttributeSettings`
Inherits: `PCGFilterDataBaseSettings` | Header: `PCGFilterByAttribute.h`

Separates data on whether they have a specific metadata attribute (not by value)

**Properties** (3):
  - `attribute`: `Name` — [Read-Write] Comma-separated list of attributes to look for (Name)
  - `ignore_properties`: `bool` — [Read-Write] Controls whether properties (denoted by $) will be considered in the filter or not. (bo...
  - `operator`: `PCGStringMatchingOperator` — [Read-Write] (PCGStringMatchingOperator)

### `unreal.PCGFilterByIndexSettings`
Inherits: `PCGFilterDataBaseSettings` | Header: `PCGFilterByIndex.h`

Filters a data collection based on a user defined index range expression.

**Properties** (2):
  - `invert_filter`: `bool` — [Read-Write] Will invert which indices will be included and excluded. (bool)
  - `selected_indices`: `str` — [Read-Write] Selected individual indices or index ranges to include or exclude. Negative end indices...

### `unreal.PCGFilterByTagSettings`
Inherits: `PCGFilterDataBaseSettings` | Header: `PCGFilterByTag.h`

Filters a data collection based on some tag criterion

**Properties** (3):
  - `operation`: `PCGFilterByTagOperation` — [Read-Write] (PCGFilterByTagOperation)
  - `operator`: `PCGStringMatchingOperator` — [Read-Write] (PCGStringMatchingOperator)
  - `selected_tags`: `str` — [Read-Write] Comma-separated list of tags (str)

### `unreal.PCGFilterByTypeSettings`
Inherits: `PCGFilterDataBaseSettings` | Header: `PCGFilterByType.h`

Filters an input collection based on data type.

**Properties** (2):
  - `show_outside_filter`: `bool` — [Read-Write] (bool)
  - `target_type`: `PCGDataType` — [Read-Write] (PCGDataType)

### `unreal.PCGFilterDataBaseSettings`
Inherits: `PCGSettings` | Header: `PCGFilterDataBase.h`

PCGFilter Data Base Settings

### `unreal.PCGFilterElementsByIndexSettings`
Inherits: `PCGSettings` | Header: `PCGFilterElementsByIndex.h`

Filters points or the elements of an attribute set based on a second input of points, attribute sets, or a user-defined index range expression.

**Properties** (5):
  - `index_selection_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] The attribute which will define the indices to filter. (PCGAttributePropertyInputSelect...
  - `invert_filter`: `bool` — [Read-Write] Will invert which indices will be included and excluded. (bool)
  - `output_discarded_elements`: `bool` — [Read-Write] An additional output for discarded elements. (bool)
  - `select_indices_by_input`: `bool` — [Read-Write] A second input will define the indices to filter. (bool)
  - `selected_indices`: `str` — [Read-Write] Selected individual indices or index ranges to include or exclude. Negative end indices...

### `unreal.PCGGatherSettings`
Inherits: `PCGSettingsWithDynamicInputs` | Header: `PCGGather.h`

Used to wrangle multiple input wires into one output wire for organizational purposes.

### `unreal.PCGGenerateGrassMapsSettings`
Inherits: `PCGSettings` | Header: `PCGGenerateGrassMaps.h`

PCGGenerate Grass Maps Settings

**Properties** (5):
  - `exclude_selected_grass_types`: `bool` — [Read-Write] If toggled, will only generate grass types which are not selected. (bool)
  - `grass_types_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] Input attribute to pull grass type strings from. (PCGAttributePropertyInputSelector)
  - `override_from_input`: `bool` — [Read-Write] Override grass types from input. (bool)
  - `selected_grass_types`: `None` — [Read-Write] Select which grass types to generate. (Array[str])
  - `skip_readback_to_cpu`: `bool` — [Read-Write] Skip CPU readback of emitted textures during initialization of the texture datas. (bool...

### `unreal.PCGGenerateSeedSettings`
Inherits: `PCGSettings` | Header: `PCGGenerateSeedElement.h`

Generate a seed from either a random stream, a constant string, or a source attribute.

**Properties** (5):
  - `generation_source`: `PCGGenerateSeedSource` — [Read-Write] The source method seed attribute. (PCGGenerateSeedSource)
  - `output_target`: `PCGAttributePropertyOutputSelector` — [Read-Write] The target attribute output of the generated seed. (PCGAttributePropertyOutputSelector)
  - `reset_seed_per_input`: `bool` — [Read-Write] Reset the seed at the beginning of each inputâs generation to stay order agnostic. (b...
  - `seed_source`: `PCGAttributePropertyInputSelector` — [Read-Write] The source attribute to hash to generate each new seed. (PCGAttributePropertyInputSelec...
  - `source_string`: `str` — [Read-Write] This value will be hashed and applied to generate each new seed. (str)

### `unreal.PCGGenericUserParameterGetSettings`
Inherits: `PCGSettings` | Header: `PCGUserParameterGet.h`

Generic getter for user parameter defined in the PCG Graph, by the user. Will pick up the value from the graph instance. This getter allows to set manually the user parameter they want to get, and add...

**Properties** (6):
  - `force_object_and_struct_extraction`: `bool` — [Read-Write] If the property is a struct/object supported by metadata, this option can be toggled to...
  - `output_attribute_name`: `Name` — [Read-Write] (Name)
  - `property_path`: `str` — [Read-Write] (str)
  - `quiet`: `bool` — [Read-Write] (bool)
  - `sanitize_output_attribute_name`: `bool` — [Read-Write] If the output attribute name has special characters, remove them. (bool)
  - `source`: `PCGUserParameterSource` — [Read-Write] (PCGUserParameterSource)

### `unreal.PCGGenSourceBase`
Inherits: `Interface` | Header: `PCGGenSourceBase.h`

PCGGen Source Base

### `unreal.PCGGenSourceComponent`
Inherits: `ActorComponent` | Header: `PCGGenSourceComponent.h`

UPCGGenSourceComponent makes the actor this is attached to act as a PCG runtime generation source.

### `unreal.PCGGenSourceEditorCamera`
Inherits: `Object` | Header: `PCGGenSourceEditorCamera.h`

This GenerationSource captures active Editor Viewports per tick to provoke RuntimeGeneration. Editor Viewports are not captured by default, but can be enabled on the PCGWorldActor via bTreatEditorView...

### `unreal.PCGGenSourcePlayer`
Inherits: `Object` | Header: `PCGGenSourcePlayer.h`

A UPCGGenSourcePlayer is automatically captured for all PlayerControllers in the level on Login/Logout.

### `unreal.PCGGenSourceWPStreamingSource`
Inherits: `Object` | Header: `PCGGenSourceWPStreamingSource.h`

This GenerationSource captures WorldPartitionStreamingSources for RuntimeGeneration.

### `unreal.PCGGetActorDataLayersSettings`
Inherits: `PCGSettings` | Header: `PCGGetActorDataLayers.h`

PCGGet Actor Data Layers Settings

**Properties** (2):
  - `actor_reference_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] Actor reference Attribute to use from input to resolve actors (PCGAttributePropertyInpu...
  - `data_layer_reference_attribute`: `PCGAttributePropertyOutputSelector` — [Read-Write] Data Layer reference Attribute to use as output (PCGAttributePropertyOutputSelector)

### `unreal.PCGGetActorPropertySettings`
Inherits: `PCGSettings` | Header: `PCGGetActorProperty.h`

Extract a property value from an actor/component into a ParamData.

**Properties** (12):
  - `actor_selector`: `PCGActorSelectorSettings` — [Read-Write] (PCGActorSelectorSettings)
  - `always_requery_actors`: `bool` — [Read-Write] If this is true, we will never put this element in cache, and will always try to re-que...
  - `component_class`: `Class` — [Read-Write] If we are looking for an actor component, the class can be specified here. (type(Class)...
  - `force_object_and_struct_extraction`: `bool` — [Read-Write] If the property is a struct/object supported by metadata, this option can be toggled to...
  - `output_actor_reference`: `bool` — [Read-Write] Controls whether an actor reference attribute will be added to the result (bool)
  - `output_attribute_name`: `PCGAttributePropertyOutputSelector` — [Read-Write] In the case of multiple properties being extracted, will be ignored. (PCGAttributePrope...
  - `output_component_reference`: `bool` — [Read-Write] Controls whether a component reference attribute will be added to the result (bool)
  - `process_all_components`: `bool` — [Read-Write] Process all Actor components. If not set, only the first component found will be proces...
  - `property_name`: `Name` — [Read-Write] Property name to extract. Can only extract properties that are compatible with metadata...
  - `sanitize_output_attribute_name`: `bool` — [Read-Write] If the output attribute name has special characters, remove them. (bool)
  - `select_component`: `bool` — [Read-Write] Allow to look for an actor component instead of an actor. It will need to be attached t...
  - `track_actors_only_within_bounds`: `bool` [Read-Only] — [Read-Only] If this is checked, found actors that are outside component bounds will not trigger a re...

### `unreal.PCGGetAttributesSettings`
Inherits: `PCGSettings` | Header: `PCGGetDataInfo.h`

Extracts the list of attribute on data to an attribute set with one entry per attribute.

**Properties** (2):
  - `get_default_value`: `bool` — [Read-Write] Controls whether the default value for the attribute will be extracted into the âDefa...
  - `get_type`: `bool` — [Read-Write] Controls whether the attribute types will be extracted into the âTypeâ attribute (a...

### `unreal.PCGGetBoundsSettings`
Inherits: `PCGSettings` | Header: `PCGGetBounds.h`

Computes the bounds of the inputs as attributes.

### `unreal.PCGGetConsoleVariableSettings`
Inherits: `PCGSettings` | Header: `PCGGetConsoleVariable.h`

Reads the given console variable and writes the value to an attribute set. Note: Setting the console variable will not trigger a regeneration.

**Properties** (2):
  - `console_variable_name`: `Name` — [Read-Write] (Name)
  - `output_attribute_name`: `Name` — [Read-Write] (Name)

### `unreal.PCGGetExecutionContextSettings`
Inherits: `PCGSettings` | Header: `PCGGetExecutionContext.h`

Returns some context-specific information in the form of an attribute set.

**Properties** (1):
  - `mode`: `PCGGetExecutionContextMode` — [Read-Write] (PCGGetExecutionContextMode)

### `unreal.PCGGetLandscapeSettings`
Inherits: `PCGDataFromActorSettings` | Header: `PCGTypedGetter.h`

Builds a collection of landscape data from the selected actors.

**Properties** (2):
  - `sampling_properties`: `PCGLandscapeDataProps` — [Read-Write] (PCGLandscapeDataProps)
  - `unbounded`: `bool` — If true, the intersected landscape bounds are going to be used to prepare the landscape cache, other...

### `unreal.PCGGetLoopIndexSettings`
Inherits: `PCGSettings` | Header: `PCGGetLoopIndex.h`

Returns the current loop iteration index of the ânearestâ subgraph in the execution stack

**Properties** (1):
  - `warn_if_called_outside_of_loop`: `bool` — [Read-Write] Controls whether this node will create a warning when not called from within a loop. (b...

### `unreal.PCGGetPCGComponentSettings`
Inherits: `PCGDataFromActorSettings` | Header: `PCGTypedGetter.h`

Builds a collection of data from other PCG components on the selected actors. Automatically tags each output with the grid size it was collected from, prefixed by â PCG_GridSize_ â (e.g. PCG_GridS...

### `unreal.PCGGetPrimitiveSettings`
Inherits: `PCGDataFromActorSettings` | Header: `PCGTypedGetter.h`

Builds a collection of primitive data from primitive components on the selected actors.

### `unreal.PCGGetPropertyFromObjectPathSettings`
Inherits: `PCGSettings` | Header: `PCGGetPropertyFromObjectPath.h`

Extract property from a list of soft object paths.

**Properties** (9):
  - `force_object_and_struct_extraction`: `bool` — [Read-Write] If the property is a struct/object supported by metadata, this option can be toggled to...
  - `input_source`: `PCGAttributePropertyInputSelector` — [Read-Write] If something is connected in the In pin, will look for this attribute values to load. (...
  - `object_paths_to_extract`: `None` — [Read-Write] If nothing is connected in the In pin, will use those static paths to load. (Array[Soft...
  - `output_attribute_name`: `PCGAttributePropertyOutputSelector` — [Read-Write] In the case of multiple properties being extracted, will be ignored. (PCGAttributePrope...
  - `persist_all_data`: `bool` — [Read-Write] Opt-in option to create empty data when there is nothing to extract or property is not ...
  - `property_name`: `Name` — [Read-Write] Property name to extract. Can only extract properties that are compatible with metadata...
  - `sanitize_output_attribute_name`: `bool` — [Read-Write] If the output attribute name has special characters, remove them. (bool)
  - `silence_error_on_empty_object_path`: `bool` — [Read-Write] Opt-in option to silence errors when the path is Empty or nothing to extract. (bool)
  - `synchronous_load`: `bool` — [Read-Write] By default, object loading is asynchronous, can force it synchronous if needed. (bool)

### `unreal.PCGGetResourcePath`
Inherits: `PCGSettings` | Header: `PCGGetResourcePath.h`

Converts a resource data to an attribute set containing the resource path.

### `unreal.PCGGetSplineSettings`
Inherits: `PCGDataFromActorSettings` | Header: `PCGTypedGetter.h`

Builds a collection of spline data from the selected actors.

### `unreal.PCGGetStaticMeshResourceDataSettings`
Inherits: `PCGSettings` | Header: `PCGGetStaticMeshResourceData.h`

Creates static mesh resource data from the given soft object paths.

**Properties** (3):
  - `mesh_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] Input attribute to pull meshes from. (PCGAttributePropertyInputSelector)
  - `override_from_input`: `bool` — [Read-Write] Override static meshes from input. (bool)
  - `static_meshes`: `None` — [Read-Write] Produces one resource data per entry. (Array[StaticMesh])

### `unreal.PCGGetSubgraphDepthSettings`
Inherits: `PCGSettings` | Header: `PCGGetSubgraphDepth.h`

Returns the current call or recursion depth in the execution stack.

**Properties** (3):
  - `distance_relative_to_upstream_graph`: `int` — [Read-Write] In the case of recursive depth, it is possible to target the current graph (0), the par...
  - `mode`: `PCGSubgraphDepthMode` — [Read-Write] (PCGSubgraphDepthMode)
  - `quiet_invalid_depth_queries`: `bool` — [Read-Write] (bool)

### `unreal.PCGGetTagsSettings`
Inherits: `PCGSettings` | Header: `PCGGetDataInfo.h`

Extracts tags on data to an attribute set with one entry per tag.

**Properties** (1):
  - `extract_tag_values`: `bool` — Valueâ tags) as a string. (bool) [Read-Write] Creates a âValuesâ attribute and stores the valu...

### `unreal.PCGGetVirtualTextureSettings`
Inherits: `PCGDataFromActorSettings` | Header: `PCGTypedGetter.h`

Builds a collection of virtual texture data from the selected actors.

### `unreal.PCGGetVolumeSettings`
Inherits: `PCGDataFromActorSettings` | Header: `PCGTypedGetter.h`

Builds a collection of volume data from the selected actors.

### `unreal.PCGGraph`
Inherits: `PCGGraphInterface` | Header: `PCGGraph.h`

**Methods** (10):
  - `add_edge(from_, from_pin_label, to, to_pin_label)` -> `PCGNode` — Adds a directed edge in the graph. Returns the âToâ node for easy chaining
  - `add_node_copy(default_node_settings=PCGSettings)` — Creates a node and copies the input settings. Returns the created node.
  - `add_node_instance(settings)` -> `PCGNode` — Creates a node containing an instance to the given settings. Returns the created node.
  - `add_node_of_type(default_node_settings=PCGSettings)` — Creates a default node based on the settings class wanted. Returns the newly created node.
  - `force_notification_for_editor(change_type = PCGChangeType.STRUCTURAL)` -> `None` — Force Notification for Editor
  - `get_input_node()` -> `PCGNode` — Returns the graph input node
  - `get_output_node()` -> `PCGNode` — Returns the graph output node
  - `remove_edge(from_, from_label, to, to_label)` -> `bool` — Removes an edge in the graph. Returns true if an edge was removed.
  - `remove_node(node)` -> `None` — Removes a node from the graph.
  - `remove_nodes()` -> `Array [ PCGNode ]` — Bulk removal of nodes, to avoid notifying the world everytime.

**Properties** (8):
  - `category`: `Text` — [Read-Write] (Text)
  - `description`: `Text` — [Read-Write] (Text)
  - `generation_radii`: `PCGRuntimeGenerationRadii` — [Read-Write] (PCGRuntimeGenerationRadii)
  - `ignore_landscape_tracking`: `bool` — [Read-Write] Marks the graph to be not refreshed automatically when the landscape changes, even if i...
  - `input_node`: `PCGNode` [Read-Only] — [Read-Only] Add input/output nodes (PCGNode)
  - `is_editor_only`: `bool` — [Read-Write] Sets whether this graph is marked as editor-only; note that the IsEditorOnly call depen...
  - `nodes`: `None` [Read-Only] — [Read-Only] (Array[PCGNode])
  - `output_node`: `PCGNode` [Read-Only] — [Read-Only] (PCGNode)

### `unreal.PCGGraphAuthoringTestHelperSettings`
Inherits: `PCGSettings` | Header: `PCGGraphAuthoringTestHelperSettings.h`

Testing helper - generates a node with a single input and output pin of the stipulated type.

### `unreal.PCGGraphExecutionSource`
Inherits: `Interface` | Header: `PCGGraphExecutionStateInterface.h`

PCGGraph Execution Source

### `unreal.PCGGraphInputOutputSettings`
Inherits: `PCGSettings` | Header: `PCGInputOutputSettings.h`

PCGGraph Input Output Settings

**Properties** (1):
  - `pins`: `None` — [Read-Write] ~End UPCGSettings interface (Array[PCGPinProperties])

### `unreal.PCGGraphInstance`
Inherits: `PCGGraphInterface` | Header: `PCGGraph.h`

PCGGraph Instance

**Properties** (5):
  - `category`: `Text` — [Read-Write] Can override the category of this instance. (Text)
  - `description`: `Text` — [Read-Write] Can override the description of this instance. (Text)
  - `graph`: `PCGGraphInterface` [Read-Only] — [Read-Only] (PCGGraphInterface)
  - `override_category`: `bool` — [Read-Write] (bool)
  - `override_description`: `bool` — [Read-Write] (bool)

### `unreal.PCGGraphInterface`
Inherits: `Object` | Header: `PCGGraph.h`

PCGGraph Interface

**Methods** (2):
  - `get_const_pcg_graph()` -> `PCGGraph` — Return the underlying PCG Graph for this interface.
  - `get_mutable_pcg_graph()` -> `PCGGraph` — Return the underlying PCG Graph for this interface.

**Properties** (6):
  - `color`: `LinearColor` — [Read-Write] Override of the color for the subgraph node for this graph. (LinearColor)
  - `expose_to_library`: `bool` — [Read-Write] (bool)
  - `is_template`: `bool` — [Read-Write] (bool)
  - `override_color`: `bool` — [Read-Write] (bool)
  - `override_title`: `bool` — [Read-Write] (bool)
  - `title`: `Text` — [Read-Write] Override of the title for the subgraph node for this graph. (Text)

### `unreal.PCGGraphParametersHelpers`
Inherits: `BlueprintFunctionLibrary` | Header: `PCGGraphParametersHelpers.h`

Blueprint Library to get or set graph parameters on graphs and graph instances

**Methods** (41):
  - `get_bool_parameter(graph_interface, name)` -> `bool` [classmethod] — Get Bool Parameter
  - `get_byte_parameter(graph_interface, name)` -> `uint8` [classmethod] — Get Byte Parameter
  - `get_class_parameter(graph_interface, name)` [classmethod] — Get Class Parameter
  - `get_double_parameter(graph_interface, name)` -> `double` [classmethod] — Get Double Parameter
  - `get_enum_parameter(graph_interface, name)` -> `uint8` [classmethod] — Get Enum Parameter
  - `get_float_parameter(graph_interface, name)` -> `float` [classmethod] — Getters
  - `get_int32_parameter(graph_interface, name)` -> `int32` [classmethod] — Get Int 32Parameter
  - `get_int64_parameter(graph_interface, name)` -> `int64` [classmethod] — Get Int 64Parameter
  - `get_name_parameter(graph_interface, name)` -> `Name` [classmethod] — Get Name Parameter
  - `get_object_parameter(graph_interface, name)` -> `Object` [classmethod] — Get Object Parameter
  - `get_quaternion_parameter(graph_interface, name)` -> `Quat` [classmethod] — Get Quaternion Parameter
  - `get_rotator_parameter(graph_interface, name)` -> `Rotator` [classmethod] — Get Rotator Parameter
  - `get_soft_class_parameter(graph_interface, name)` -> `Class` [classmethod] — Get Soft Class Parameter
  - `get_soft_object_parameter(graph_interface, name)` -> `Object` [classmethod] — Get Soft Object Parameter
  - `get_soft_object_path_parameter(graph_interface, name)` -> `SoftObjectPath` [classmethod] — Get Soft Object Path Parameter
  - `get_string_parameter(graph_interface, name)` -> `str` [classmethod] — Get String Parameter
  - `get_transform_parameter(graph_interface, name)` -> `Transform` [classmethod] — Get Transform Parameter
  - `get_vector2d_parameter(graph_interface, name)` -> `Vector2D` [classmethod] — Get Vector 2DParameter
  - `get_vector4_parameter(graph_interface, name)` -> `Vector4` [classmethod] — Get Vector 4Parameter
  - `get_vector_parameter(graph_interface, name)` -> `Vector` [classmethod] — Get Vector Parameter
  - `is_overridden(graph_interface, name)` -> `bool` [classmethod] — Is Overridden
  - `set_bool_parameter(graph_interface, name, value)` -> `None` [classmethod] — Set Bool Parameter
  - `set_byte_parameter(graph_interface, name, value)` -> `None` [classmethod] — Set Byte Parameter
  - `set_class_parameter(graph_interface, name, value)` -> `None` [classmethod] — Set Class Parameter
  - `set_double_parameter(graph_interface, name, value)` -> `None` [classmethod] — Set Double Parameter
  - `set_enum_parameter(graph_interface, name, value, enum = None)` -> `None` [classmethod] — Set Enum Parameter
  - `set_float_parameter(graph_interface, name, value)` -> `None` [classmethod] — Setters
  - `set_int32_parameter(graph_interface, name, value)` -> `None` [classmethod] — Set Int 32Parameter
  - `set_int64_parameter(graph_interface, name, value)` -> `None` [classmethod] — Set Int 64Parameter
  - `set_name_parameter(graph_interface, name, value)` -> `None` [classmethod] — Set Name Parameter
  - `set_object_parameter(graph_interface, name, value)` -> `None` [classmethod] — Set Object Parameter
  - `set_quaternion_parameter(graph_interface, name, value)` -> `None` [classmethod] — Set Quaternion Parameter
  - `set_rotator_parameter(graph_interface, name, value)` -> `None` [classmethod] — Set Rotator Parameter
  - `set_soft_class_parameter(graph_interface, name, value)` -> `None` [classmethod] — Set Soft Class Parameter
  - `set_soft_object_parameter(graph_interface, name, value)` -> `None` [classmethod] — Set Soft Object Parameter
  - `set_soft_object_path_parameter(graph_interface, name, value)` -> `None` [classmethod] — Set Soft Object Path Parameter
  - `set_string_parameter(graph_interface, name, value)` -> `None` [classmethod] — Set String Parameter
  - `set_transform_parameter(graph_interface, name, value)` -> `None` [classmethod] — Set Transform Parameter
  - `set_vector2d_parameter(graph_interface, name, value)` -> `None` [classmethod] — Set Vector 2DParameter
  - `set_vector4_parameter(graph_interface, name, value)` -> `None` [classmethod] — Set Vector 4Parameter
  - `set_vector_parameter(graph_interface, name, value)` -> `None` [classmethod] — Set Vector Parameter

### `unreal.PCGGridLinkageSettings`
Inherits: `PCGSettings` | Header: `PCGGraphExecutor.h`

PCGGrid Linkage Settings

### `unreal.PCGHashAttributeSettings`
Inherits: `PCGMetadataSettingsBase` | Header: `PCGHashAttribute.h`

Hash an attribute into a 32-bit unsigned integer, expressed as a 64-bit signed integer.

**Properties** (1):
  - `input_source1`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)

### `unreal.PCGHiGenGridSizeSettings`
Inherits: `PCGSettings` | Header: `PCGHiGenGridSize.h`

Set the execution grid size for downstream nodes. Enables executing a single graph across a hierarchy of grids.

**Properties** (1):
  - `hi_gen_grid_size`: `PCGHiGenGrid` — [Read-Write] (PCGHiGenGrid)

### `unreal.PCGIndirectionSettings`
Inherits: `PCGSettings` | Header: `PCGIndirectionElement.h`

PCGIndirection Settings

**Properties** (3):
  - `proxy_interface_mode`: `PCGProxyInterfaceMode` — [Read-Write] Defines which interface to use for populating pins (PCGProxyInterfaceMode)
  - `settings`: `PCGSettings` — [Read-Write] The element settings, which can be overriden, that will be used during the proxy execut...
  - `tag_outputs_based_on_output_pins`: `bool` — [Read-Write] (bool)

### `unreal.PCGInnerIntersectionSettings`
Inherits: `PCGSettings` | Header: `PCGInnerIntersectionElement.h`

PCGInner Intersection Settings

**Properties** (2):
  - `density_function`: `PCGIntersectionDensityFunction` — [Read-Write] (PCGIntersectionDensityFunction)
  - `keep_zero_density_points`: `bool` — [Read-Write] If enabled, output points with a density value of 0 will NOT be automatically filtered ...

### `unreal.PCGInstanceDataPackerBase`
Inherits: `Object` | Header: `PCGInstanceDataPackerBase.h`

PCGInstance Data Packer Base

**Methods** (3):
  - `add_type_to_packing(type_id)` -> `PCGPackedCustomData or None` — Interprets Metadata TypeId and increments OutPackedCustomData.NumCustomDataFloats appropriately. Returns false if the ty...
  - `pack_custom_data_from_attributes(instance_list, metadata, attribute_names)` -> `PCGPackedCustomData` — Build a PackedCustomData by processing each attribute in order for each point in the InstanceList
  - `pack_instances(spatial_data, out_packed_custom_data=PCGPackedCustomData)` — Defines the strategy for (H)ISM custom float data packing

### `unreal.PCGInstanceDataPackerByAttribute`
Inherits: `PCGInstanceDataPackerBase` | Header: `PCGInstanceDataPackerByAttribute.h`

PCGInstance Data Packer by Attribute

**Properties** (2):
  - `attribute_names`: `None` — [Read-Write]
deprecated: AttributeNames has been deprecated. Use AttributeSelectors instead. (Array[...
  - `attribute_selectors`: `None` — [Read-Write] (Array[PCGAttributePropertyInputSelector])

### `unreal.PCGInstanceDataPackerByRegex`
Inherits: `PCGInstanceDataPackerBase` | Header: `PCGInstanceDataPackerByRegex.h`

PCGInstance Data Packer by Regex

**Properties** (1):
  - `regex_patterns`: `None` — [Read-Write] (Array[str])

### `unreal.PCGIntersectionData`
Inherits: `PCGSpatialDataWithPointCache` | Header: `PCGIntersectionData.h`

Generic intersection class that delays operations as long as possible.

**Methods** (1):
  - `initialize(a, b)` -> `None` — Initialize

**Properties** (3):
  - `a`: `PCGSpatialData` [Read-Only] — [Read-Only] (PCGSpatialData)
  - `b`: `PCGSpatialData` [Read-Only] — [Read-Only] (PCGSpatialData)
  - `density_function`: `PCGIntersectionDensityFunction` — [Read-Write] (PCGIntersectionDensityFunction)

### `unreal.PCGLandscapeCache`
Inherits: `Object` | Header: `PCGLandscapeCache.h`

PCGLandscape Cache

**Properties** (3):
  - `cache_entry_count`: `int` [Read-Only] — [Read-Only] (int32)
  - `cooked_serialized_contents`: `PCGLandscapeCacheSerializationContents` — [Read-Write] (PCGLandscapeCacheSerializationContents)
  - `serialization_mode`: `PCGLandscapeCacheSerializationMode` — [Read-Write] (PCGLandscapeCacheSerializationMode)

### `unreal.PCGLandscapeData`
Inherits: `PCGSurfaceData` | Header: `PCGLandscapeData.h`

Landscape data access abstraction for PCG. Supports multi-landscape access, but it assumes that they are not overlapping.

**Properties** (1):
  - `landscapes`: `None` — add on property changed to clear cached data. This is used to populate the LandscapeInfos array. (Ar...

### `unreal.PCGLandscapeSplineData`
Inherits: `PCGPolyLineData` | Header: `PCGLandscapeSplineData.h`

PCGLandscape Spline Data

**Properties** (1):
  - `spline`: `LandscapeSplinesComponent` — [Read-Write] (LandscapeSplinesComponent)

### `unreal.PCGLoadDataAssetSettings`
Inherits: `PCGSettings` | Header: `PCGLoadAssetElement.h`

Loader/Executor of PCG data assets

**Properties** (14):
  - `asset`: `PCGDataAsset` — [Read-Write] (PCGDataAsset)
  - `asset_color`: `LinearColor` [Read-Only] — [Read-Only] Cached from the data when loaded (LinearColor)
  - `asset_description`: `Text` [Read-Only] — [Read-Only] Cached from the data when loaded (Text)
  - `asset_name`: `str` [Read-Only] — [Read-Only] Cached from the data when loaded (str)
  - `asset_reference_selector`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `data_index_tag`: `Name` — [Read-Write] (Name)
  - `default_attribute_overrides`: `None` — Value default overrides to be applied to the loaded data. (Array[str]) [Read-Write] Tag
  - `input_index_tag`: `Name` — [Read-Write] (Name)
  - `load_from_input`: `bool` — [Read-Write] (bool)
  - `pins`: `None` [Read-Only] — [Read-Only] (Array[PCGPinProperties])
  - `set_default_attribute_overrides_from_input`: `bool` — [Read-Write] Exposes an attribute set pin to override defaults of the loaded data assets. (bool)
  - `synchronous_load`: `bool` — [Read-Write] By default, data table loading is asynchronous, can force it synchronous if needed. (bo...
  - `tag_outputs_based_on_output_pins`: `bool` [Read-Only] — [Read-Only] Controls whether the data output from the loaded asset will be passed to the default pin...
  - `warn_if_no_asset`: `bool` — [Read-Write] Warns if asset is null or couldnât be loaded (bool)

### `unreal.PCGLoadDataTableSettings`
Inherits: `PCGExternalDataSettings` | Header: `PCGDataTableElement.h`

PCGLoad Data Table Settings

**Properties** (3):
  - `data_table`: `DataTable` — [Read-Write] (DataTable)
  - `output_type`: `PCGExclusiveDataType` — [Read-Write] (PCGExclusiveDataType)
  - `synchronous_load`: `bool` — [Read-Write] By default, data table loading is asynchronous, can force it synchronous if needed. (bo...

### `unreal.PCGLoopSettings`
Inherits: `PCGSubgraphSettings` | Header: `PCGLoopElement.h`

PCGLoop Settings

**Properties** (3):
  - `feedback_pins`: `str` — [Read-Write] Comma-separated list of pin names that will act as feedback pins, namely that in a give...
  - `loop_pins`: `str` — [Read-Write] Comma-separated list of pin names on which we will loop by-element in a step-wise fashi...
  - `use_graph_default_pin_usage`: `bool` — [Read-Write] Controls whether the pin usage (normal, loop, feedback) will be taken from the subgraph...

### `unreal.PCGMakeConcreteSettings`
Inherits: `PCGSettings` | Header: `PCGMakeConcreteElement.h`

Makes data Concrete, collapsing to Point if necessary. Discards non-Spatial data.

### `unreal.PCGManagedActors`
Inherits: `PCGManagedResource` | Header: `PCGManagedResource.h`

PCGManaged Actors

**Properties** (3):
  - `generated_actors`: `None` — [Read-Write]
deprecated: Property âGeneratedActorsâ is deprecated. (Set[Actor])
  - `generated_actors_array`: `None` — [Read-Write] (Array[Actor])
  - `supports_reset`: `bool` — [Read-Write] Controls whether the resource will be removed at the beginning of the generation instea...

### `unreal.PCGManagedComponent`
Inherits: `PCGManagedComponentBase` | Header: `PCGManagedResource.h`

PCGManaged Component

**Properties** (1):
  - `generated_component`: `ActorComponent` — [Read-Write] (ActorComponent)

### `unreal.PCGManagedComponentBase`
Inherits: `PCGManagedResource` | Header: `PCGManagedResource.h`

PCGManaged Component Base

### `unreal.PCGManagedComponentDefaultList`
Inherits: `PCGManagedComponentList` | Header: `PCGManagedResource.h`

Stub default list to hold resources pushed from BP in a single place on the PCG component.

### `unreal.PCGManagedComponentList`
Inherits: `PCGManagedComponentBase` | Header: `PCGManagedResource.h`

This managed resource class is used to tie multiple components in the same resource so that they are cleaned up all at the same time.

**Properties** (1):
  - `generated_components`: `None` — [Read-Write] (Array[ActorComponent])

### `unreal.PCGManagedDebugDrawComponent`
Inherits: `PCGManagedComponent` | Header: `PCGDebugDrawComponent.h`

Manages the editor DebugDrawComponent for displaying debug information within SIE and PIE. Note: Must be a managed component to ensure proper resource management during generation and cleanup.

### `unreal.PCGManagedDebugStringMessageKey`
Inherits: `PCGManagedResource` | Header: `PCGPrintElement.h`

Used to track the debug message to properly remove it upon regen or clean up.

### `unreal.PCGManagedISKMComponent`
Inherits: `PCGManagedComponent` | Header: `PCGManagedResource.h`

PCGManaged ISKMComponent

### `unreal.PCGManagedISMComponent`
Inherits: `PCGManagedComponent` | Header: `PCGManagedResource.h`

PCGManaged ISMComponent

### `unreal.PCGManagedProceduralISMComponent`
Inherits: `PCGManagedComponent` | Header: `PCGProceduralISMComponent.h`

PCGManaged Procedural ISMComponent

### `unreal.PCGManagedResource`
Inherits: `Object` | Header: `PCGManagedResource.h`

This class is used to hold resources and their mechanism to delete them on demand. In order to allow for some reuse (e.g. components), the Release call supports a âsoftâ release by marking them un...

### `unreal.PCGManagedSplineMeshComponent`
Inherits: `PCGManagedComponent` | Header: `PCGManagedResource.h`

PCGManaged Spline Mesh Component

### `unreal.PCGMatchAndSetAttributesSettings`
Inherits: `PCGSettings` | Header: `PCGMatchAndSetAttributes.h`

This class creates a PCG node that can match, select by weight or match & select by weight a âmatchingâ entry in a provided Attribute Set with multiple entries. E.g. for a given point, if the poin...

**Properties** (14):
  - `find_nearest`: `bool` — [Read-Write] Controls whether the match operation will return the nearest match and not only match o...
  - `input_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] Attribute from the point data to select & match. (PCGAttributePropertyInputSelector)
  - `input_weight_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] Input weight from the points, assumed to be in the [0, 1] range. (PCGAttributePropertyI...
  - `keep_unmatched`: `bool` — [Read-Write] Controls whether points that have no valid match in the attribute set are kept as is (d...
  - `match_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] Attribute from the attribute set to match against. (PCGAttributePropertyInputSelector)
  - `match_attributes`: `bool` — [Read-Write] Controls whether selection of the attribute set values to copy will be done by matching...
  - `max_distance_for_nearest_match`: `PCGMetadataTypesConstantStruct` — [Read-Write] Constant value that establishes the maximum distance an entry can be from its nearest m...
  - `max_distance_input_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `max_distance_mode`: `PCGMatchMaxDistanceMode` — [Read-Write] Controls whether the match operation has a maximum distance on which to reject points t...
  - `use_input_weight_attribute`: `bool` — [Read-Write] Controls whether we will use the attribute provided in the Input Weight Attribute to pe...
  - `use_weight_attribute`: `bool` — [Read-Write] Controls whether we will consider the weights, as determined by the Weight Attribute va...
  - `warn_if_no_match_data`: `bool` — [Read-Write] Controls whether we will emit a warning and return nothing if there is no provided attr...
  - `warn_on_attribute_cast`: `bool` — [Read-Write] (bool)
  - `weight_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] Attribute to weight more or less some entries from the attribute set. (PCGAttributeProp...

### `unreal.PCGMatchAndSetBase`
Inherits: `Object` | Header: `PCGMatchAndSetBase.h`

Base class for Match & Set objects. Note that while it currently deals with points, it might be extended in the future. This class is extensible and can be implemented in different ways, but its role ...

**Methods** (2):
  - `match_and_set(context, settings, point_data, out_point_data)` -> `PCGContext` — Main function to process points, and pass them through the Match & Set logic.
  - `validate_preconditions(point_data)` -> `bool` — Early check to prevent issues when the data does not contain the required information to perform the operation

### `unreal.PCGMatchAndSetByAttribute`
Inherits: `PCGMatchAndSetBase` | Header: `PCGMatchAndSetByAttribute.h`

This Match & Set object looks up an attribute on a given point, then looks up its entries to find a match; if there is one, then it sets it value.

**Properties** (3):
  - `entries`: `None` — [Read-Write] Lookup entries (key-value pairs) (Array[PCGMatchAndSetByAttributeEntry])
  - `match_source_attribute`: `Name` — [Read-Write] Attribute to match on the data (Name)
  - `match_source_type`: `PCGMetadataTypes` — [Read-Write] Type of the attribute to match against. (PCGMetadataTypes)

### `unreal.PCGMatchAndSetWeighted`
Inherits: `PCGMatchAndSetBase` | Header: `PCGMatchAndSetWeighted.h`

This Match & Set object assigns randomly a value based on weighted ratios, provided in the entries.

**Properties** (2):
  - `entries`: `None` — [Read-Write] Values and their respective weights (Array[PCGMatchAndSetWeightedEntry])
  - `should_mutate_seed`: `bool` — [Read-Write] Controls whether the output data should mutate its seed - prevents issues when doing mu...

### `unreal.PCGMatchAndSetWeightedByCategory`
Inherits: `PCGMatchAndSetBase` | Header: `PCGMatchAndSetWeightedByCategory.h`

PCGMatch and Set Weighted by Category

**Properties** (4):
  - `categories`: `None` — [Read-Write] Lookup entries (key -> weighted list) (Array[PCGMatchAndSetWeightedByCategoryEntryList]...
  - `category_attribute`: `Name` — [Read-Write] Attribute to match against (Name)
  - `category_type`: `PCGMetadataTypes` — [Read-Write] Type of the attribute to match against. (PCGMetadataTypes)
  - `should_mutate_seed`: `bool` — [Read-Write] Controls whether the output data should mutate its seed - prevents issues when doing mu...

### `unreal.PCGMergeAttributesSettings`
Inherits: `PCGSettingsWithDynamicInputs` | Header: `PCGMergeAttributes.h`

Merges multiple attribute sets together into a single attribute set

### `unreal.PCGMergeSettings`
Inherits: `PCGSettingsWithDynamicInputs` | Header: `PCGMergeElement.h`

Merges multiple data sources (currently only points supported) into a single output.

**Properties** (1):
  - `merge_metadata`: `bool` — [Read-Write] Controls whether the resulting merge data will have any metadata (bool)

### `unreal.PCGMeshSelectorBase`
Inherits: `Object` | Header: `PCGMeshSelectorBase.h`

PCGMesh Selector Base

### `unreal.PCGMeshSelectorByAttribute`
Inherits: `PCGMeshSelectorBase` | Header: `PCGMeshSelectorByAttribute.h`

PCGMesh Selector by Attribute

**Properties** (3):
  - `attribute_name`: `Name` — [Read-Write] (Name)
  - `material_override_attributes`: `None` — [Read-Write] (Array[Name])
  - `use_attribute_material_overrides`: `bool` — [Read-Write] (bool)

### `unreal.PCGMeshSelectorWeighted`
Inherits: `PCGMeshSelectorBase` | Header: `PCGMeshSelectorWeighted.h`

PCGMesh Selector Weighted

**Properties** (3):
  - `material_override_attributes`: `None` — [Read-Write] (Array[Name])
  - `mesh_entries`: `None` — [Read-Write] (Array[PCGMeshSelectorWeightedEntry])
  - `use_attribute_material_overrides`: `bool` — [Read-Write] (bool)

### `unreal.PCGMeshSelectorWeightedByCategory`
Inherits: `PCGMeshSelectorBase` | Header: `PCGMeshSelectorWeightedByCategory.h`

PCGMesh Selector Weighted by Category

**Properties** (4):
  - `category_attribute`: `Name` — [Read-Write] (Name)
  - `entries`: `None` — [Read-Write] (Array[PCGWeightedByCategoryEntryList])
  - `material_override_attributes`: `None` — [Read-Write] (Array[Name])
  - `use_attribute_material_overrides`: `bool` — [Read-Write] (bool)

### `unreal.PCGMetadata`
Inherits: `Object` | Header: `PCGMetadata.h`

**Methods** (52):
  - `accumulate_point_weighted_attributes(point, metadata, weight, set_non_interpolable_attributes, out_point)` -> `PCGPoint` — Accumulate Point Weighted Attributes
  - `accumulate_weighted_attributes_by_key(key, metadata, weight, set_non_interpolable_attributes, target_key)` -> `int64` — Accumulate Weighted Attributes by Key
  - `add_attribute(other: PCGMetadata, attribute_name: Name)` -> `None` — deprecated: âadd_attributeâ was renamed to âbp_add_attributeâ.
  - `add_attributes(other)` -> `None` — Creates missing attributes from another metadata if they are not currently present - note that this does not copy values
  - `add_attributes_filtered(other, filtered_attributes, filter_mode = PCGMetadataFilterMode.EXCLUDE_ATTRIBUTES, match_operator = PCGStringMatchingOperator.EQUAL)` -> `None` — Creates missing attributes from another metadata if they are not currently present - note that this does not copy values...
  - `add_entry(parent_entry_key = -1)` -> `int64` — Adds a unique entry key to the metadata
  - `bp_add_attribute(other, attribute_name)` -> `None` — Creates missing attribute from another metadata if it is not currently present - note that this does not copy values
  - `bp_clear_attribute(attribute_to_clear)` -> `None` — Clear/Reinit attribute
  - `bp_copy_attribute(other, attribute_to_copy, new_attribute_name)` -> `None` — Copies an attribute from another metadata, including entries & values. Warning: this is intended when dealing with the s...
  - `bp_copy_existing_attribute(attribute_to_copy, new_attribute_name, keep_parent = True)` -> `bool` — Copy attribute
  - `bp_delete_attribute(attribute_name)` -> `None` — Delete/Hide attribute // Due to stream inheriting, we might want to consider âhidingâ parent stream and deleting loc...
  - `bp_has_attribute(attribute_name)` -> `bool` — BP Has Attribute
  - `bp_rename_attribute(attribute_to_rename, new_attribute_name)` -> `bool` — Rename attribute
  - `clear_attribute(attribute_to_clear: Name)` -> `None` — deprecated: âclear_attributeâ was renamed to âbp_clear_attributeâ.
  - `copy_attribute(other: PCGMetadata, attribute_to_copy: Name, new_attribute_name: Name)` -> `None` — deprecated: âcopy_attributeâ was renamed to âbp_copy_attributeâ.
  - `copy_attributes(other)` -> `None` — Copies attributes from another metadata, including entries & values. Warning: this is intended when dealing with the sam...
  - `copy_existing_attribute(attribute_to_copy: Name, new_attribute_name: Name, keep_parent: bool = True)` -> `bool` — deprecated: âcopy_existing_attributeâ was renamed to âbp_copy_existing_attributeâ.
  - `create_bool_attribute(attribute_name, default_value, allows_interpolation, override_parent = True)` -> `PCGMetadata` — Create Bool Attribute
  - `create_double_attribute(attribute_name, default_value, allows_interpolation, override_parent = True)` -> `PCGMetadata` — Create Double Attribute
  - `create_float_attribute(attribute_name, default_value, allows_interpolation, override_parent = True)` -> `PCGMetadata` — Create Float Attribute
  - `create_integer32_attribute(attribute_name, default_value, allows_interpolation, override_parent = True)` -> `PCGMetadata` — TODO: Will be moved at the end of the class before commit, as they are functions planned to be deprecated.
  - `create_integer64_attribute(attribute_name, default_value, allows_interpolation, override_parent = True)` -> `PCGMetadata` — Create Integer 64Attribute
  - `create_name_attribute(attribute_name, default_value, allows_interpolation, override_parent = True)` -> `PCGMetadata` — Create Name Attribute
  - `create_quat_attribute(attribute_name, default_value, allows_interpolation, override_parent = True)` -> `PCGMetadata` — Create Quat Attribute
  - `create_rotator_attribute(attribute_name, default_value, allows_interpolation, override_parent = True)` -> `PCGMetadata` — Create Rotator Attribute
  - `create_soft_class_path_attribute(attribute_name, default_value, allows_interpolation, override_parent = True)` -> `PCGMetadata` — Create Soft Class Path Attribute
  - `create_soft_object_path_attribute(attribute_name, default_value, allows_interpolation, override_parent = True)` -> `PCGMetadata` — Create Soft Object Path Attribute
  - `create_string_attribute(attribute_name, default_value, allows_interpolation, override_parent = True)` -> `PCGMetadata` — Create String Attribute
  - `create_transform_attribute(attribute_name, default_value, allows_interpolation, override_parent = True)` -> `PCGMetadata` — Create Transform Attribute
  - `create_vector2_attribute(attribute_name, default_value, allows_interpolation, override_parent = True)` -> `PCGMetadata` — Create Vector 2Attribute
  - `create_vector4_attribute(attribute_name, default_value, allows_interpolation, override_parent = True)` -> `PCGMetadata` — Create Vector 4Attribute
  - `create_vector_attribute(attribute_name, default_value, allows_interpolation, override_parent = True)` -> `PCGMetadata` — Create Vector Attribute
  - `delete_attribute(attribute_name: Name)` -> `None` — deprecated: âdelete_attributeâ was renamed to âbp_delete_attributeâ.
  - `flatten()` -> `None` — Unparents current metadata by flattening the attributes (values, entries, etc.) and potentially compress the data to rem...
  - `get_attribute_count()` -> `int32` — Return the number of attributes in this metadata.
  - `get_attributes()` — Get Attributes
  - `get_item_count_for_child()` -> `int64` — Return the number of entries in metadata including the parent entries.
  - `has_attribute(attribute_name: Name)` -> `bool` — deprecated: âhas_attributeâ was renamed to âbp_has_attributeâ.
  - `has_common_attributes(metadata)` -> `bool` — Has Common Attributes
  - `initialize(parent)` -> `None` — Initializes the metadata from a parent metadata, if any (can be null). Copies attributes and values.
  - `initialize_as_copy(metadata_to_copy: PCGMetadata, optional_entries_to_copy: None)` -> `None` — deprecated: âinitialize_as_copyâ was renamed to âk2_initialize_as_copyâ.
  - `initialize_as_copy_with_attribute_filter(metadata_to_copy: PCGMetadata, filtered_attributes: None, optional_entries_to_copy: None, filter_mode: PCGMetadataFilterMode = Ellipsis, match_operator: PCGStringMatchingOperator = Ellipsis)` -> `None` — deprecated: âinitialize_as_copy_with_attribute_filterâ was renamed to âk2_initialize_as_copy_with_attribute_filter...
  - `initialize_with_attribute_filter(parent, filtered_attributes, filter_mode = PCGMetadataFilterMode.EXCLUDE_ATTRIBUTES, match_operator = PCGStringMatchingOperator.EQUAL)` -> `None` — Initializes the metadata from a parent metadata. Copies attributes and values.
  - `k2_initialize_as_copy(metadata_to_copy, optional_entries_to_copy)` -> `None` — Initializes the metadata from a parent metadata by copying all attributes to it.
  - `k2_initialize_as_copy_with_attribute_filter(metadata_to_copy, filtered_attributes, optional_entries_to_copy, filter_mode = PCGMetadataFilterMode.EXCLUDE_ATTRIBUTES, match_operator = PCGStringMatchingOperator.EQUAL)` -> `None` — Initializes the metadata from a parent metadata by copy filtered attributes only to it
  - `merge_attributes_by_key(key_a, metadata_a, key_b, metadata_b, target_key, op)` -> `int64` — Blueprint-friend versions
  - `merge_point_attributes(point_a, metadata_a, point_b, metadata_b, target_point, op)` -> `PCGPoint` — Merge Point Attributes
  - `rename_attribute(attribute_to_rename: Name, new_attribute_name: Name)` -> `bool` — deprecated: ârename_attributeâ was renamed to âbp_rename_attributeâ.
  - `reset_point_weighted_attributes()` -> `PCGPoint` — Reset Point Weighted Attributes
  - `reset_weighted_attributes_by_key(target_key)` -> `int64` — Reset Weighted Attributes by Key
  - `set_attributes_by_key(key, metadata, target_key)` -> `int64` — Set Attributes by Key
  - `set_point_attributes(point, metadata, out_point)` -> `PCGPoint` — Set Point Attributes

### `unreal.PCGMetadataAccessorHelpers`
Inherits: `BlueprintFunctionLibrary` | Header: `PCGMetadataAccessor.h`

PCGMetadata Accessor Helpers

**Methods** (63):
  - `copy_point(point, copy_metadata = True, metadata = None, out_metadata = None)` -> `PCGPoint` [classmethod] — Point functions
  - `get_bool_attribute(point, metadata, attribute_name)` -> `bool` [classmethod] — Get Bool Attribute
  - `get_bool_attribute_by_metadata_key(key, metadata, attribute_name)` -> `bool` [classmethod] — Get Bool Attribute by Metadata Key
  - `get_double_attribute(point, metadata, attribute_name)` -> `double` [classmethod] — Get Double Attribute
  - `get_double_attribute_by_metadata_key(key, metadata, attribute_name)` -> `double` [classmethod] — Get Double Attribute by Metadata Key
  - `get_float_attribute(point, metadata, attribute_name)` -> `float` [classmethod] — Get Float Attribute
  - `get_float_attribute_by_metadata_key(key, metadata, attribute_name)` -> `float` [classmethod] — Get Float Attribute by Metadata Key
  - `get_integer32_attribute(point, metadata, attribute_name)` -> `int32` [classmethod] — Get Integer 32Attribute
  - `get_integer32_attribute_by_metadata_key(key, metadata, attribute_name)` -> `int32` [classmethod] — Id-based metadata functions
  - `get_integer64_attribute(point, metadata, attribute_name)` -> `int64` [classmethod] — Get Integer 64Attribute
  - `get_integer64_attribute_by_metadata_key(key, metadata, attribute_name)` -> `int64` [classmethod] — Get Integer 64Attribute by Metadata Key
  - `get_name_attribute(point, metadata, attribute_name)` -> `Name` [classmethod] — Get Name Attribute
  - `get_quat_attribute(point, metadata, attribute_name)` -> `Quat` [classmethod] — Get Quat Attribute
  - `get_quat_attribute_by_metadata_key(key, metadata, attribute_name)` -> `Quat` [classmethod] — Get Quat Attribute by Metadata Key
  - `get_rotator_attribute(point, metadata, attribute_name)` -> `Rotator` [classmethod] — Get Rotator Attribute
  - `get_rotator_attribute_by_metadata_key(key, metadata, attribute_name)` -> `Rotator` [classmethod] — Get Rotator Attribute by Metadata Key
  - `get_soft_class_path_attribute(point, metadata, attribute_name)` -> `SoftClassPath` [classmethod] — Get Soft Class Path Attribute
  - `get_soft_class_path_attribute_by_metadata_key(key, metadata, attribute_name)` -> `SoftClassPath` [classmethod] — Get Soft Class Path Attribute by Metadata Key
  - `get_soft_object_path_attribute(point, metadata, attribute_name)` -> `SoftObjectPath` [classmethod] — Get Soft Object Path Attribute
  - `get_soft_object_path_attribute_by_metadata_key(key, metadata, attribute_name)` -> `SoftObjectPath` [classmethod] — Get Soft Object Path Attribute by Metadata Key
  - `get_string_attribute(point, metadata, attribute_name)` -> `str` [classmethod] — Get String Attribute
  - `get_string_attribute_by_metadata_key(key, metadata, attribute_name)` -> `str` [classmethod] — Get String Attribute by Metadata Key
  - `get_transform_attribute(point, metadata, attribute_name)` -> `Transform` [classmethod] — Get Transform Attribute
  - `get_transform_attribute_by_metadata_key(key, metadata, attribute_name)` -> `Transform` [classmethod] — Get Transform Attribute by Metadata Key
  - `get_vector2_attribute(point, metadata, attribute_name)` -> `Vector2D` [classmethod] — Get Vector 2Attribute
  - `get_vector2_attribute_by_metadata_key(key, metadata, attribute_name)` -> `Vector2D` [classmethod] — Get Vector 2Attribute by Metadata Key
  - `get_vector4_attribute(point, metadata, attribute_name)` -> `Vector4` [classmethod] — Get Vector 4Attribute
  - `get_vector4_attribute_by_metadata_key(key, metadata, attribute_name)` -> `Vector4` [classmethod] — Get Vector 4Attribute by Metadata Key
  - `get_vector_attribute(point, metadata, attribute_name)` -> `Vector` [classmethod] — Get Vector Attribute
  - `get_vector_attribute_by_metadata_key(key, metadata, attribute_name)` -> `Vector` [classmethod] — Get Vector Attribute by Metadata Key
  - `has_attribute_set(point, metadata, attribute_name)` -> `bool` [classmethod] — Has Attribute Set
  - `has_attribute_set_by_metadata_key(key, metadata, attribute_name)` -> `bool` [classmethod] — Has Attribute Set by Metadata Key
  - `initialize_metadata(point, metadata, parent_point, parent_metadata = None)` -> `PCGPoint` [classmethod] — Assigns a metadata entry key and will copy attribute values if from an unrelated metadata. Note: a null ParentMetadata a...
  - `set_attribute_from_property_by_metadata_key(key, metadata, attribute_name, object, property_name)` -> `int64 or None` [classmethod] — Set Attribute from Property by Metadata Key
  - `set_bool_attribute(point, metadata, attribute_name, value)` -> `PCGPoint` [classmethod] — Set Bool Attribute
  - `set_bool_attribute_by_metadata_key(key, metadata, attribute_name, value)` -> `int64` [classmethod] — Set Bool Attribute by Metadata Key
  - `set_double_attribute(point, metadata, attribute_name, value)` -> `PCGPoint` [classmethod] — Set Double Attribute
  - `set_double_attribute_by_metadata_key(key, metadata, attribute_name, value)` -> `int64` [classmethod] — Set Double Attribute by Metadata Key
  - `set_float_attribute(point, metadata, attribute_name, value)` -> `PCGPoint` [classmethod] — Set Float Attribute
  - `set_float_attribute_by_metadata_key(key, metadata, attribute_name, value)` -> `int64` [classmethod] — Set Float Attribute by Metadata Key
  - `set_integer32_attribute(point, metadata, attribute_name, value)` -> `PCGPoint` [classmethod] — Set Integer 32Attribute
  - `set_integer32_attribute_by_metadata_key(key, metadata, attribute_name, value)` -> `int64` [classmethod] — Set Integer 32Attribute by Metadata Key
  - `set_integer64_attribute(point, metadata, attribute_name, value)` -> `PCGPoint` [classmethod] — Set Integer 64Attribute
  - `set_integer64_attribute_by_metadata_key(key, metadata, attribute_name, value)` -> `int64` [classmethod] — Set Integer 64Attribute by Metadata Key
  - `set_name_attribute(point, metadata, attribute_name, value)` -> `PCGPoint` [classmethod] — Set Name Attribute
  - `set_quat_attribute(point, metadata, attribute_name, value)` -> `PCGPoint` [classmethod] — Set Quat Attribute
  - `set_quat_attribute_by_metadata_key(key, metadata, attribute_name, value)` -> `int64` [classmethod] — Set Quat Attribute by Metadata Key
  - `set_rotator_attribute(point, metadata, attribute_name, value)` -> `PCGPoint` [classmethod] — Set Rotator Attribute
  - `set_rotator_attribute_by_metadata_key(key, metadata, attribute_name, value)` -> `int64` [classmethod] — Set Rotator Attribute by Metadata Key
  - `set_soft_class_path_attribute(point, metadata, attribute_name, value)` -> `PCGPoint` [classmethod] — Set Soft Class Path Attribute
  - `set_soft_class_path_attribute_by_metadata_key(key, metadata, attribute_name, value)` -> `int64` [classmethod] — Set Soft Class Path Attribute by Metadata Key
  - `set_soft_object_path_attribute(point, metadata, attribute_name, value)` -> `PCGPoint` [classmethod] — Set Soft Object Path Attribute
  - `set_soft_object_path_attribute_by_metadata_key(key, metadata, attribute_name, value)` -> `int64` [classmethod] — Set Soft Object Path Attribute by Metadata Key
  - `set_string_attribute(point, metadata, attribute_name, value)` -> `PCGPoint` [classmethod] — Set String Attribute
  - `set_string_attribute_by_metadata_key(key, metadata, attribute_name, value)` -> `int64` [classmethod] — Set String Attribute by Metadata Key
  - `set_transform_attribute(point, metadata, attribute_name, value)` -> `PCGPoint` [classmethod] — Set Transform Attribute
  - `set_transform_attribute_by_metadata_key(key, metadata, attribute_name, value)` -> `int64` [classmethod] — Set Transform Attribute by Metadata Key
  - `set_vector2_attribute(point, metadata, attribute_name, value)` -> `PCGPoint` [classmethod] — Set Vector 2Attribute
  - `set_vector2_attribute_by_metadata_key(key, metadata, attribute_name, value)` -> `int64` [classmethod] — Set Vector 2Attribute by Metadata Key
  - `set_vector4_attribute(point, metadata, attribute_name, value)` -> `PCGPoint` [classmethod] — Set Vector 4Attribute
  - `set_vector4_attribute_by_metadata_key(key, metadata, attribute_name, value)` -> `int64` [classmethod] — Set Vector 4Attribute by Metadata Key
  - `set_vector_attribute(point, metadata, attribute_name, value)` -> `PCGPoint` [classmethod] — Set Vector Attribute
  - `set_vector_attribute_by_metadata_key(key, metadata, attribute_name, value)` -> `int64` [classmethod] — Set Vector Attribute by Metadata Key

### `unreal.PCGMetadataBitwiseSettings`
Inherits: `PCGMetadataSettingsBase` | Header: `PCGMetadataBitwiseOpElement.h`

PCGMetadata Bitwise Settings

**Properties** (3):
  - `input_source1`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `input_source2`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `operation`: `PCGMetadataBitwiseOperation` — [Read-Write] (PCGMetadataBitwiseOperation)

### `unreal.PCGMetadataBooleanSettings`
Inherits: `PCGMetadataSettingsBase` | Header: `PCGMetadataBooleanOpElement.h`

PCGMetadata Boolean Settings

**Properties** (3):
  - `input_source1`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `input_source2`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `operation`: `PCGMetadataBooleanOperation` — [Read-Write] (PCGMetadataBooleanOperation)

### `unreal.PCGMetadataBreakTransformSettings`
Inherits: `PCGMetadataSettingsBase` | Header: `PCGMetadataBreakTransform.h`

PCGMetadata Break Transform Settings

**Properties** (1):
  - `input_source`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)

### `unreal.PCGMetadataBreakVectorSettings`
Inherits: `PCGMetadataSettingsBase` | Header: `PCGMetadataBreakVector.h`

PCGMetadata Break Vector Settings

**Properties** (1):
  - `input_source`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)

### `unreal.PCGMetadataCompareSettings`
Inherits: `PCGMetadataSettingsBase` | Header: `PCGMetadataCompareOpElement.h`

PCGMetadata Compare Settings

**Properties** (4):
  - `input_source1`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `input_source2`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `operation`: `PCGMetadataCompareOperation` — [Read-Write] (PCGMetadataCompareOperation)
  - `tolerance`: `float` — [Read-Write] (double)

### `unreal.PCGMetadataMakeRotatorSettings`
Inherits: `PCGMetadataSettingsBase` | Header: `PCGMetadataMakeRotator.h`

Create a Rotator from 1, 2 or 3 axis.

**Properties** (4):
  - `input_source1`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `input_source2`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `input_source3`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `operation`: `PCGMetadataMakeRotatorOp` — [Read-Write] (PCGMetadataMakeRotatorOp)

### `unreal.PCGMetadataMakeTransformSettings`
Inherits: `PCGMetadataSettingsBase` | Header: `PCGMetadataMakeTransform.h`

PCGMetadata Make Transform Settings

**Properties** (3):
  - `input_source1`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `input_source2`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `input_source3`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)

### `unreal.PCGMetadataMakeVectorSettings`
Inherits: `PCGMetadataSettingsBase` | Header: `PCGMetadataMakeVector.h`

PCGMetadata Make Vector Settings

**Properties** (7):
  - `input_source1`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `input_source2`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `input_source3`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `input_source4`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `make_vector3_op`: `PCGMetadataMakeVector3` — [Read-Write] (PCGMetadataMakeVector3)
  - `make_vector4_op`: `PCGMetadataMakeVector4` — [Read-Write] (PCGMetadataMakeVector4)
  - `output_type`: `PCGMetadataTypes` — [Read-Write] (PCGMetadataTypes)

### `unreal.PCGMetadataMathsSettings`
Inherits: `PCGMetadataSettingsBase` | Header: `PCGMetadataMathsOpElement.h`

PCGMetadata Maths Settings

**Properties** (6):
  - `force_op_to_double`: `bool` — [Read-Write] For operations that can yield floating point values, if the input type are ints, use th...
  - `force_rounding_op_to_int`: `bool` — [Read-Write] For rounding operation, if the input type is float or double, use this option to force ...
  - `input_source1`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `input_source2`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `input_source3`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `operation`: `PCGMetadataMathsOperation` — [Read-Write] (PCGMetadataMathsOperation)

### `unreal.PCGMetadataOperationSettings`
Inherits: `PCGCopyAttributesSettings` | Header: `PCGMetadataElement.h`

### `unreal.PCGMetadataPartitionKernel`
Inherits: `PCGComputeKernel` | Header: `PCGMetadataPartitionKernel.h`

PCGMetadata Partition Kernel

### `unreal.PCGMetadataPartitionSettings`
Inherits: `PCGSettings` | Header: `PCGMetadataPartition.h`

PCGMetadata Partition Settings

**Properties** (3):
  - `partition_attribute`: `Name` — [Read-Write]
deprecated: PartitionAttribute has been deprecated. (Name)
  - `partition_attribute_selectors`: `None` — [Read-Write] The data will be partitioned on these selected attributes. (Array[PCGAttributePropertyI...
  - `partition_attribute_source`: `PCGAttributePropertyInputSelector` — [Read-Write]
deprecated: PartitionAttributeSource has been deprecated. (PCGAttributePropertyInputSel...

### `unreal.PCGMetadataRenameSettings`
Inherits: `PCGSettings` | Header: `PCGMetadataRenameElement.h`

PCGMetadata Rename Settings

**Properties** (2):
  - `attribute_to_rename`: `Name` — [Read-Write] (Name)
  - `new_attribute_name`: `Name` — [Read-Write] (Name)

### `unreal.PCGMetadataRotatorSettings`
Inherits: `PCGMetadataSettingsBase` | Header: `PCGMetadataRotatorOpElement.h`

PCGMetadata Rotator Settings

**Properties** (4):
  - `input_source1`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `input_source2`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `input_source3`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `operation`: `PCGMetadataRotatorOperation` — [Read-Write] (PCGMetadataRotatorOperation)

### `unreal.PCGMetadataSettingsBase`
Inherits: `PCGSettings` | Header: `PCGMetadataOpElementBase.h`

Base class for all Metadata operations. Metadata operation can work with attributes or properties. For example you could compute the addition between all points density and a constant from a param dat...

**Properties** (2):
  - `output_data_from_pin`: `Name` — [Read-Write] By default, output is taken from first non-param pin (aka if the second pin is a point ...
  - `output_target`: `PCGAttributePropertyOutputSelector` — [Read-Write] (PCGAttributePropertyOutputSelector)

### `unreal.PCGMetadataStringOpSettings`
Inherits: `PCGMetadataSettingsBase` | Header: `PCGMetadataStringOpElement.h`

PCGMetadata String Op Settings

**Properties** (4):
  - `input_source1`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `input_source2`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `input_source3`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `operation`: `PCGMetadataStringOperation` — [Read-Write] (PCGMetadataStringOperation)

### `unreal.PCGMetadataTransformSettings`
Inherits: `PCGMetadataSettingsBase` | Header: `PCGMetadataTransformOpElement.h`

PCGMetadata Transform Settings

**Properties** (5):
  - `input_source1`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `input_source2`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `input_source3`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `operation`: `PCGMetadataTransformOperation` — [Read-Write] (PCGMetadataTransformOperation)
  - `transform_lerp_mode`: `PCGTransformLerpMode` — [Read-Write] (PCGTransformLerpMode)

### `unreal.PCGMetadataTrigSettings`
Inherits: `PCGMetadataSettingsBase` | Header: `PCGMetadataTrigOpElement.h`

PCGMetadata Trig Settings

**Properties** (3):
  - `input_source1`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `input_source2`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `operation`: `PCGMetadataTrigOperation` — [Read-Write] (PCGMetadataTrigOperation)

### `unreal.PCGMetadataVectorSettings`
Inherits: `PCGMetadataSettingsBase` | Header: `PCGMetadataVectorOpElement.h`

PCGMetadata Vector Settings

**Properties** (4):
  - `input_source1`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `input_source2`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `input_source3`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `operation`: `PCGMetadataVectorOperation` — [Read-Write] (PCGMetadataVectorOperation)

### `unreal.PCGMultiSelectSettings`
Inherits: `PCGControlFlowSettings` | Header: `PCGMultiSelect.h`

Selects data from any number of input pins, based on a static selection criteria (Int/String/Enum)

**Properties** (6):
  - `enum_selection`: `EnumSelector` — [Read-Write] Determines which input pin will be selected if the selection mode is Enum. (EnumSelecto...
  - `int_options`: `None` — [Read-Write] Determines the available input pin selection options. (Array[int32])
  - `integer_selection`: `int` — [Read-Write] Determines which input will be selected if the selection mode is Integer. (int32)
  - `selection_mode`: `PCGControlFlowSelectionMode` — [Read-Write] Determines the type of value to be used to select an input. (PCGControlFlowSelectionMod...
  - `string_options`: `None` — [Read-Write] Determines the available input pin selection options. (Array[str])
  - `string_selection`: `str` — [Read-Write] Determines which input will be selected if the selection mode is String. (str)

### `unreal.PCGMutateSeedSettings`
Inherits: `PCGSettings` | Header: `PCGMutateSeed.h`

Generates a new seed for each point using its position and user seed input and applies to all points.

### `unreal.PCGNamedRerouteBaseSettings`
Inherits: `PCGRerouteSettings` | Header: `PCGReroute.h`

Base class for both reroute declaration and usage to share implementation, but also because they use the same visual node representation in the editor.

### `unreal.PCGNamedRerouteDeclarationSettings`
Inherits: `PCGNamedRerouteBaseSettings` | Header: `PCGReroute.h`

PCGNamed Reroute Declaration Settings

### `unreal.PCGNamedRerouteUsageSettings`
Inherits: `PCGNamedRerouteBaseSettings` | Header: `PCGReroute.h`

PCGNamed Reroute Usage Settings

**Properties** (1):
  - `declaration`: `PCGNamedRerouteDeclarationSettings` — [Read-Write] (PCGNamedRerouteDeclarationSettings)

### `unreal.PCGNode`
Inherits: `Object` | Header: `PCGNode.h`

**Methods** (6):
  - `add_edge_to(from_pin_label, to, to_pin_label)` -> `PCGNode` — Adds an edge in the owning graph to the given âToâ node.
  - `get_graph()` -> `PCGGraph` — Returns the owning graph
  - `get_node_position(out_position_y=int32)` — Get Node Position
  - `get_settings()` -> `PCGSettings` — Returns the settings this node holds (either directly or through an instance)
  - `remove_edge_to(from_pin_lable, to, to_pin_label)` -> `bool` — Removes an edge originating from this node
  - `set_node_position(position_x, position_y)` -> `None` — Set Node Position

**Properties** (5):
  - `input_pins`: `None` [Read-Only] — [Read-Only] (Array[PCGPin])
  - `node_title`: `Name` — [Read-Write] (Name)
  - `node_title_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `output_pins`: `None` [Read-Only] — [Read-Only] (Array[PCGPin])
  - `settings_interface`: `PCGSettingsInterface` [Read-Only] — do not set this property directly from code, use SetSettingsInterface instead (PCGSettingsInterface)...

### `unreal.PCGNormalToDensityKernel`
Inherits: `PCGComputeKernel` | Header: `PCGNormalToDensityKernel.h`

PCGNormal to Density Kernel

### `unreal.PCGNormalToDensitySettings`
Inherits: `PCGSettings` | Header: `PCGNormalToDensity.h`

Finds the angle against the specified direction and applies that to the density

**Properties** (4):
  - `density_mode`: `PCGNormalToDensityMode` — [Read-Write] The operator to apply to the output density (PCGNormalToDensityMode)
  - `normal`: `Vector` — [Read-Write] The normal to compare against (Vector)
  - `offset`: `float` — [Read-Write] This is biases the value towards or against the normal (positive or negative) (double)
  - `strength`: `float` — [Read-Write] This applies a curve to scale the result density with Result = Result^(1/Strength) (dou...

### `unreal.PCGNumberOfElementsBaseSettings`
Inherits: `PCGSettings` | Header: `PCGNumberOfElements.h`

Elements for getting the number of elements in a point data or a param data. Since the whole logic is identical except for getting the number of elements, it is factorized in a base class. // Base cla...

**Properties** (1):
  - `output_attribute_name`: `Name` — [Read-Write] (Name)

### `unreal.PCGNumberOfEntriesSettings`
Inherits: `PCGNumberOfElementsBaseSettings` | Header: `PCGNumberOfElements.h`

Return the number of entries in the input attribute sets.

### `unreal.PCGNumberOfPointsSettings`
Inherits: `PCGNumberOfElementsBaseSettings` | Header: `PCGNumberOfElements.h`

Return the number of points in the input point data.

### `unreal.PCGOctreeQueries`
Inherits: `BlueprintFunctionLibrary` | Header: `PCGOctreeQueries.h`

PCGOctree Queries

**Methods** (6):
  - `get_closest_point(point_data, center, discard_center, out_point=PCGPoint)` [classmethod] — Get the closest point to a given position within the search distance. If bInDiscardCenter is true, will reject any point...
  - `get_closest_point_from_other_point(point_data, point_index, out_point=PCGPoint)` [classmethod] — Get the nearest point to a given point within the search distance. The point is referenced by its point index in this po...
  - `get_farthest_point(point_data, center, out_point=PCGPoint)` [classmethod] — Get the farthest point from a given position, within the search distance.
  - `get_farthest_point_from_other_point(point_data, point_index, out_point=PCGPoint)` [classmethod] — Get the farthest point from a given point within the search distance. The point is referenced by its point index in this...
  - `get_points_inside_bounds(point_data, bounds)` -> `Array [ PCGPoint ]` [classmethod] — Query the internal octree to return all the points within some bounds.
  - `get_points_inside_sphere(point_data, center, radius)` -> `Array [ PCGPoint ]` [classmethod] — Query the internal octree to return all the points within some sphere.

### `unreal.PCGOuterIntersectionSettings`
Inherits: `PCGSettingsWithDynamicInputs` | Header: `PCGOuterIntersectionElement.h`

PCGOuter Intersection Settings

**Properties** (3):
  - `density_function`: `PCGIntersectionDensityFunction` — [Read-Write] (PCGIntersectionDensityFunction)
  - `ignore_pins_with_no_input`: `bool` — [Read-Write] If enabled, dynamic input pins that have no incoming data will be bypassed during the i...
  - `keep_zero_density_points`: `bool` — [Read-Write] If enabled, output points with a density value of 0 will NOT be automatically filtered ...

### `unreal.PCGParamData`
Inherits: `PCGData` | Header: `PCGParamData.h`

Class to hold execution parameters that will be consumed in nodes of the graph

**Methods** (6):
  - `filter_params_by_key(key: int)` -> `PCGParamData` — deprecated: âfilter_params_by_keyâ was renamed to âk2_filter_params_by_keyâ.
  - `filter_params_by_name(name: Name)` -> `PCGParamData` — deprecated: âfilter_params_by_nameâ was renamed to âk2_filter_params_by_nameâ.
  - `find_metadata_key(name)` -> `int64` — Returns the entry for the given name
  - `find_or_add_metadata_key(name)` -> `int64` — Creates an entry for the given name, if not already added
  - `k2_filter_params_by_key(key)` -> `PCGParamData` — K2 Filter Params by Key
  - `k2_filter_params_by_name(name)` -> `PCGParamData` — Creates a new params that keeps only a given key/name

### `unreal.PCGParseStringSettings`
Inherits: `PCGMetadataSettingsBase` | Header: `PCGParseString.h`

Convert a string to a numerical value.

**Properties** (2):
  - `input_source`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `target_type`: `PCGMetadataTypes` — [Read-Write] (PCGMetadataTypes)

### `unreal.PCGPartitionActor`
Inherits: `PartitionActor` | Header: `PCGPartitionActor.h`

The APCGPartitionActor actor is used to store grid cell data and its size will be a multiple of the grid size.

**Methods** (3):
  - `bp_get_pcg_grid_size()` -> `int64` — BP Get PCGGrid Size
  - `get_local_component(original_component)` -> `PCGComponent` — TODO: Make this in-editor only; during runtime, we should keep a map of component to bounds/volume only and preferably p...
  - `get_original_component(local_component)` -> `PCGComponent` — Get Original Component

### `unreal.PCGPartitionByActorDataLayersSettings`
Inherits: `PCGSettings` | Header: `PCGPartitionByActorDataLayers.h`

PCGPartition by Actor Data Layers Settings

**Properties** (4):
  - `actor_reference_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `data_layer_reference_attribute`: `PCGAttributePropertyOutputSelector` — [Read-Write] Data Layer reference Attribute to use as output for Data Layer Partitions (PCGAttribute...
  - `excluded_data_layers`: `PCGDataLayerReferenceSelector` — [Read-Write] Specified Data Layers will get excluded (PCGDataLayerReferenceSelector)
  - `included_data_layers`: `PCGDataLayerReferenceSelector` — [Read-Write] When left empty, all Data Layers are included, if any Data Layers are specified, only t...

### `unreal.PCGPathfindingSettings`
Inherits: `PCGSettings` | Header: `PCGPathfindingElement.h`

Finds the optimal path across the points of a given point cloudâshould one existâwhen provided a start and goal location, and a maximum jump distance between points. Can return a partial path.

**Properties** (18):
  - `accept_partial_path`: `bool` — [Read-Write] Even if the path is not complete, return a viable partial path to the point closest to ...
  - `copy_originating_points`: `bool` — [Read-Write] Copy the properties and attributes from the originating point input to the output point...
  - `cost_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] Attribute to use as part of the cost function - itâs meaning will depend on the cost ...
  - `cost_function_mode`: `PCGPathfindingCostFunctionMode` — [Read-Write] Controls whether the cost function will use a given attribute as a scalar wrt to the di...
  - `goal`: `Vector` — [Read-Write] The location the pathfinding should attempt to reach. Not used when using goal location...
  - `goal_location_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `goal_locations_as_input`: `bool` — [Read-Write] (bool)
  - `goal_mapping_mode`: `PCGPathfindingGoalMappingMode` — [Read-Write] How each goal location correlates to each start location. Only relevant when using mult...
  - `heuristic_weight`: `float` — [Read-Write] The heuristic estimates a faster path to speed up processing. A higher than 1 heuristic...
  - `maximum_fitness_penalty_factor`: `float` — [Read-Write] Fitness penalty scalar (maximum penalty applied when fitness is zero.) (double)
  - `output_as_spline`: `bool` — [Read-Write] The final path will be a spline. If false, the final path will be an ordered point data...
  - `path_trace_params`: `PCGWorldRaycastQueryParams` — [Read-Write] (PCGWorldRaycastQueryParams)
  - `search_distance`: `float` — [Read-Write] The max distance from each point to search for the next viable point in the path. (doub...
  - `spline_mode`: `PCGPathfindingSplineMode` — [Read-Write] Determines how the output splineâs curves will be calculated. (PCGPathfindingSplineMo...
  - `start`: `Vector` — [Read-Write] The location the pathfinding should attempt to reach. Not used when using start locatio...
  - `start_location_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `start_locations_as_input`: `bool` — [Read-Write] (bool)
  - `use_path_traces`: `bool` — [Read-Write] Controls whether raycasts will be used to test for collisions along the path (hit resul...

### `unreal.PCGPin`
Inherits: `Object` | Header: `PCGPin.h`

**Methods** (4):
  - `get_tooltip()` -> `Text` — Get Tooltip
  - `is_connected()` -> `bool` — Is Connected
  - `is_output_pin()` -> `bool` — Is Output Pin
  - `set_tooltip(tooltip)` -> `None` — Set Tooltip

**Properties** (3):
  - `edges`: `None` [Read-Only] — [Read-Only] (Array[PCGEdge])
  - `node`: `PCGNode` [Read-Only] — [Read-Only] ~End UObject interface (PCGNode)
  - `properties`: `PCGPinProperties` [Read-Only] — [Read-Only] (PCGPinProperties)

### `unreal.PCGPinPropertiesBlueprintHelpers`
Inherits: `BlueprintFunctionLibrary` | Header: `PCGPin.h`

Helper class to allow the BP to call the custom functions on FPCGPinProperties.

**Methods** (8):
  - `allows_multiple_connections(pin_properties)` -> `bool` [classmethod] — Allows Multiple Connections
  - `is_advanced_pin(pin_properties)` -> `bool` [classmethod] — Is Advanced Pin
  - `is_normal_pin(pin_properties)` -> `bool` [classmethod] — Is Normal Pin
  - `is_required_pin(pin_properties)` -> `bool` [classmethod] — Is Required Pin
  - `set_advanced_pin(pin_properties)` -> `PCGPinProperties` [classmethod] — Set Advanced Pin
  - `set_allow_multiple_connections(pin_properties, allow_multiple_connections)` -> `PCGPinProperties` [classmethod] — Set Allow Multiple Connections
  - `set_normal_pin(pin_properties)` -> `PCGPinProperties` [classmethod] — Set Normal Pin
  - `set_required_pin(pin_properties)` -> `PCGPinProperties` [classmethod] — Set Required Pin

### `unreal.PCGPointArrayData`
Inherits: `PCGBasePointData` | Header: `PCGPointArrayData.h`

PCGPoint Array Data

### `unreal.PCGPointData`
Inherits: `PCGBasePointData` | Header: `PCGPointData.h`

TODO: Split this in âconcreteâ vs âapiâ class (needed for views)

**Methods** (6):
  - `get_num_points()` -> `int32` — Get Num Points
  - `get_point(index)` -> `PCGPoint` — Get Point
  - `get_points()` -> `Array [ PCGPoint ]` — Get Points
  - `get_points_copy()` -> `Array [ PCGPoint ]` — Get Points Copy
  - `is_empty()` -> `bool` — Is Empty
  - `set_points(points)` -> `None` — Set Points

### `unreal.PCGPointExtentsModifierSettings`
Inherits: `PCGSettings` | Header: `PCGPointExtentsModifier.h`

PCGPoint Extents Modifier Settings

**Properties** (2):
  - `extents`: `Vector` — [Read-Write] (Vector)
  - `mode`: `PCGPointExtentsModifierMode` — [Read-Write] (PCGPointExtentsModifierMode)

### `unreal.PCGPointFromMeshSettings`
Inherits: `PCGSettings` | Header: `PCGPointFromMeshElement.h`

PointFromMesh creates a single point at the origin with an attribute containing a SoftObjectPath to the selected UStaticMesh

**Properties** (3):
  - `mesh_path_attribute_name`: `Name` — [Read-Write] Name of the string attribute to be created and hold a SoftObjectPath to the StaticMesh ...
  - `static_mesh`: `StaticMesh` — [Read-Write] (StaticMesh)
  - `synchronous_load`: `bool` — [Read-Write] By default, mesh loading is asynchronous, can force it synchronous if needed. (bool)

### `unreal.PCGPointMatchAndSetSettings`
Inherits: `PCGSettings` | Header: `PCGPointMatchAndSet.h`

This settings class is used to create a PCG node that will apply a âMatch and Setâ operation on the point data it consumes as input. E.g. for a given point, if it matches with something in the Mat...

**Methods** (1):
  - `set_match_and_set_type(match_and_set_type)` -> `None` — Recreates the match & set instance stored in this settings object if needed.

**Properties** (4):
  - `match_and_set_instance`: `PCGMatchAndSetBase` [Read-Only] — [Read-Only] Instance of MatchAndSetType, stores the data that will be used in these settings. (PCGMa...
  - `match_and_set_type`: `Class` [Read-Only] — [Read-Only] Defines the type of Match & Set object to use. (type(Class))
  - `set_target`: `PCGAttributePropertyOutputSelector` — [Read-Write] âSetâ part of the Match & Set - defines what will be changed in the operation (PCGA...
  - `set_target_type`: `PCGMetadataTypes` — [Read-Write] If the âSetâ part is an attribute, then the type must be provided (PCGMetadataTypes...

### `unreal.PCGPointNeighborhoodSettings`
Inherits: `PCGSettings` | Header: `PCGPointNeighborhood.h`

Computes quantities from nearby neighbor points, such as average density, color, and position.

**Properties** (9):
  - `average_position_attribute`: `Name` — [Read-Write] The output attribute name to write the average positions, if not âNoneâ. (Name)
  - `distance_attribute`: `Name` — [Read-Write] The output attribute name to write the non-normalized distance, if not âNoneâ. (Nam...
  - `search_distance`: `float` — [Read-Write] (double)
  - `set_average_color`: `bool` — [Read-Write] Writes the target color to the point color if true, otherwise keeps the source color. (...
  - `set_average_position`: `bool` — [Read-Write] Writes the average position to the point transform. (bool)
  - `set_average_position_to_attribute`: `bool` — [Read-Write] Allows the average position to be output into a user-generated attribute. (bool)
  - `set_density`: `PCGPointNeighborhoodDensityMode` — [Read-Write] Writes either the normalized distance or the average density to the point density. (PCG...
  - `set_distance_to_attribute`: `bool` — [Read-Write] Allows the non-normalized distance to be output into a user-generated attribute. (bool)
  - `weighted_average`: `bool` — [Read-Write] Takes the bounds into account when projecting points. (bool)

### `unreal.PCGPolyLineData`
Inherits: `PCGSpatialDataWithPointCache` | Header: `PCGPolyLineData.h`

PCGPoly Line Data

**Methods** (16):
  - `get_alpha_at_distance(segment_index, distance)` -> `float` — Get a value [0,1] representing how far along the point is to the end of the line. Each segment on the line represents a ...
  - `get_curvature_at_distance(segment_index, distance)` -> `double` — Get the curvature at a distance along the line.
  - `get_distance_at_segment_start(segment_index)` -> `double` — Get the cumulative distance along the line to the start of a segment.
  - `get_input_key_at_alpha(alpha)` -> `float` — Get the input key from the normalized distance of [0, 1] across the entire the poly line.
  - `get_input_key_at_distance(segment_index, distance)` -> `float` — Get the input key at a distance along the line. InputKey is a float value in [0, N], where N is the number of control po...
  - `get_length()` -> `double` — Get the total length of the line.
  - `get_location_at_alpha(alpha)` -> `Vector` — Get the location of the point at the normalized [0, 1] parameter across the entire the poly line.
  - `get_location_at_distance(segment_index, distance, world_space = True)` -> `Vector` — Get the location at a distance along the line.
  - `get_num_segments()` -> `int32` — Get the number of segments in this line. If the line is closed, this will be the same as the number of control points in...
  - `get_segment_length(segment_index)` -> `double` — Get the length of a specific segment of the line.
  - `get_tangents_at_segment_start(out_leave_tangent=Vector)` — Get the arrive and leave tangents for a control point via its segment index.
  - `get_transform()` -> `Transform` — Get the world-space transform of the entire line.
  - `get_transform_at_alpha(alpha)` -> `Transform` — Get the full transform at the normalized [0, 1] parameter across the entire the poly line.
  - `is_closed()` -> `bool` — True if the line is a closed loop.
  - `k2_get_transform_at_distance(segment_index, distance, out_bounds, out_bounds=Box)` — Get the location at a distance along the line.
  - `write_metadata_to_point(input_key, out_metadata)` -> `PCGPoint` — This function should be called in the Sample/Project point function, but can also be called if the sampling is done manu...

### `unreal.PCGPrimitiveData`
Inherits: `PCGSpatialDataWithPointCache` | Header: `PCGPrimitiveData.h`

PCGPrimitive Data

**Properties** (2):
  - `primitive`: `PrimitiveComponent` [Read-Only] — [Read-Only] (PrimitiveComponent)
  - `voxel_size`: `Vector` — [Read-Write] (Vector)

### `unreal.PCGPrintElementSettings`
Inherits: `PCGSettings` | Header: `PCGPrintElement.h`

Issues a specified message to the log, and optionally to the graph and/or screen. Note: This node will not function in shipping builds.

**Properties** (13):
  - `custom_prefix`: `str` — [Read-Write] A prefix to which the core message will be appended. (str)
  - `display_on_node`: `bool` — [Read-Write] Display warnings or errors on this node. (bool)
  - `enable_print`: `bool` — [Read-Write] Enable the functionality of this node. Disable to bypass printing. (bool)
  - `prefix_with_component`: `bool` — [Read-Write] Prefix the message with the name of the component. (bool)
  - `prefix_with_graph`: `bool` — [Read-Write] Prefix the message with the name of the graph. (bool)
  - `prefix_with_node`: `bool` — [Read-Write] Prefix the message with the name of the node. (bool)
  - `prefix_with_owner`: `bool` — [Read-Write] Prefix the message with the name of the componentâs owner. (bool)
  - `print_per_component`: `bool` — [Read-Write] Use the component as part of the key hash and print a message for each component with t...
  - `print_string`: `str` — [Read-Write] The core message to print to the logger, graph, and/or screen. (str)
  - `print_to_screen`: `bool` — [Read-Write] Print the message to the editor viewport. (bool)
  - `print_to_screen_color`: `Color` — [Read-Write] The color of the on screen message. (Color)
  - `print_to_screen_duration`: `float` — [Read-Write] The duration (in seconds) of the on screen message. (double)
  - `verbosity`: `PCGPrintVerbosity` — [Read-Write] The verbosity level of the printed message. (PCGPrintVerbosity)

### `unreal.PCGPrintGrammarSettings`
Inherits: `PCGSettings` | Header: `PCGPrintGrammar.h`

Prints the result of an interpreted grammar.

**Properties** (1):
  - `grammar`: `str` — [Read-Write] The grammar to interpret. (str)

### `unreal.PCGProceduralISMComponent`
Inherits: `StaticMeshComponent` | Header: `PCGProceduralISMComponent.h`

Experimental instanced primitive that is not backed by CPU instance data. Instance data must be written direct to the GPU scene.

**Methods** (10):
  - `clear_instances()` -> `None` — Clear all instances being rendered by this component.
  - `get_cull_distances(out_end_cull_distance=int32)` — Gets the fading start and culling end distances for this component.
  - `get_min_draw_distance()` -> `int32` — Gets the minimum distance at which instances will render for this component.
  - `get_num_custom_data_floats()` -> `int32` — Get Num Custom Data Floats
  - `get_num_instances()` -> `int32` — Get Num Instances
  - `set_cull_distances(start_cull_distance, end_cull_distance)` -> `None` — Sets the fading start and culling end distances for this component.
  - `set_local_bounds(local_bounds)` -> `None` — Set local bounds for all instances of this component (bounds are not computed automatically from instances).
  - `set_min_draw_distance(min_draw_distance)` -> `None` — Sets the minimum distance at which instances will render for this component.
  - `set_num_custom_data_floats(num_custom_data_floats)` -> `None` — Update number of custom data entries per instance.
  - `set_num_instances(num_instances)` -> `None` — Set Num Instances

**Properties** (3):
  - `instance_end_cull_distance`: `int` [Read-Only] — [Read-Only] Distance from camera at which each instance completely fades out. (int32)
  - `instance_min_draw_distance`: `int` [Read-Only] — [Read-Only] Distance from camera at which each instance begins to draw. (int32)
  - `instance_start_cull_distance`: `int` [Read-Only] — [Read-Only] Distance from camera at which each instance begins to fade out. (int32)

### `unreal.PCGProjectionData`
Inherits: `PCGSpatialDataWithPointCache` | Header: `PCGProjectionData.h`

Generic projection class (A projected onto B) that intercepts spatial queries

**Properties** (3):
  - `projection_params`: `PCGProjectionParams` [Read-Only] — [Read-Only] (PCGProjectionParams)
  - `source`: `PCGSpatialData` [Read-Only] — [Read-Only] (PCGSpatialData)
  - `target`: `PCGSpatialData` [Read-Only] — [Read-Only] (PCGSpatialData)

### `unreal.PCGProjectionSettings`
Inherits: `PCGSettings` | Header: `PCGProjectionElement.h`

PCGProjection Settings

**Properties** (4):
  - `force_collapse_to_point`: `bool` — [Read-Write] Force the result to be sampled to points, equivalent to having a To Point node after th...
  - `keep_zero_density_points`: `bool` — [Read-Write] (bool)
  - `params`: `PCGProjectionParams` — âparamsâ was renamed to âprojection_paramsâ. deprecated
  - `projection_params`: `PCGProjectionParams` — [Read-Write] (PCGProjectionParams)

### `unreal.PCGProxyForGPUData`
Inherits: `PCGData` | Header: `PCGProxyForGPUData.h`

A proxy for data residing on the GPU with functionality to read the data back to the CPU.

### `unreal.PCGQualityBranchSettings`
Inherits: `PCGControlFlowSettings` | Header: `PCGQualityBranch.h`

Control flow node that dynamically routes input data based on âpcg.Qualityâ setting.

**Properties** (5):
  - `use_cinematic_pin`: `bool` — [Read-Write] (bool)
  - `use_epic_pin`: `bool` — [Read-Write] (bool)
  - `use_high_pin`: `bool` — [Read-Write] (bool)
  - `use_low_pin`: `bool` — [Read-Write] (bool)
  - `use_medium_pin`: `bool` — [Read-Write] (bool)

### `unreal.PCGQualitySelectSettings`
Inherits: `PCGControlFlowSettings` | Header: `PCGQualitySelect.h`

Selects from input pins based on âpcg.Qualityâ setting.

**Properties** (5):
  - `use_cinematic_pin`: `bool` — [Read-Write] (bool)
  - `use_epic_pin`: `bool` — [Read-Write] (bool)
  - `use_high_pin`: `bool` — [Read-Write] (bool)
  - `use_low_pin`: `bool` — [Read-Write] (bool)
  - `use_medium_pin`: `bool` — [Read-Write] (bool)

### `unreal.PCGRandomChoiceSettings`
Inherits: `PCGSettings` | Header: `PCGRandomChoice.h`

Chooses entries randomly through ratio or a fixed number of entries. Chosen/Discarded entries will be in the same order than they appear in the input data.

**Properties** (8):
  - `b_output_discarded_points`: `bool` — âb_output_discarded_pointsâ was renamed to âoutput_discarded_entriesâ. deprecated
  - `custom_seed_source`: `PCGAttributePropertyInputSelector` — [Read-Write] Attribute to generate the selection seed from. (PCGAttributePropertyInputSelector)
  - `fixed_mode`: `bool` — [Read-Write] Either choose a fixed number of entries, or a ratio of entries. (bool)
  - `fixed_number`: `int` — [Read-Write] Defines the number of entries to keep. (int32)
  - `has_custom_seed_source`: `bool` — [Read-Write] Use an attribute as a source for generating the seed, i.e. similar to or replacing the ...
  - `output_discarded_entries`: `bool` — [Read-Write] By default, we output discarded entries. If you donât need them, disable this option....
  - `ratio`: `float` — [Read-Write] Defines the ratio of entries to keep. (float)
  - `use_first_attribute_only`: `bool` — [Read-Write] Controls whether only the first elementâs attribute will be used to generate the sele...

### `unreal.PCGRemoveEmptyDataSettings`
Inherits: `PCGSettings` | Header: `PCGRemoveEmptyData.h`

PCGRemove Empty Data Settings

### `unreal.PCGRenderTargetData`
Inherits: `PCGBaseTextureData` | Header: `PCGRenderTargetData.h`

**Methods** (1):
  - `initialize(render_target, transform, skip_readback_to_cpu = False, take_ownership_of_render_target = False)` -> `None` — Initialize

**Properties** (2):
  - `owns_render_target`: `bool` [Read-Only] — [Read-Only] (bool)
  - `render_target`: `TextureRenderTarget2D` [Read-Only] — [Read-Only] (TextureRenderTarget2D)

### `unreal.PCGReplaceTagsSettings`
Inherits: `PCGSettings` | Header: `PCGReplaceTags.h`

Replaces the tags on the input data.

**Properties** (2):
  - `replaced_tags`: `str` — [Read-Write] Comma-separated list of new tags to replace the selected tags. (str)
  - `selected_tags`: `str` — [Read-Write] Comma-separated list of tags to be replaced from the input data.
If no tags are replace...

### `unreal.PCGRerouteSettings`
Inherits: `PCGSettings` | Header: `PCGReroute.h`

PCGReroute Settings

### `unreal.PCGResetPointCenterSettings`
Inherits: `PCGSettings` | Header: `PCGResetPointCenter.h`

Modify the position of a point within its bounds, while keeping its bounds the same.

**Properties** (1):
  - `point_center_location`: `Vector` — [Read-Write] Set the normalized center of the point (Vector)

### `unreal.PCGResourceData`
Inherits: `PCGData` | Header: `PCGResourceData.h`

Data that wrap/represent an asset, like a Static Mesh or Texture.

### `unreal.PCGReverseSplineSettings`
Inherits: `PCGSettings` | Header: `PCGSplineDirection.h`

Direct the order of a splineâs control points. This can be conditional to force a given orientation (clockwise or counter clockwise).

**Properties** (1):
  - `operation`: `PCGReverseSplineOperation` — [Read-Write] (PCGReverseSplineOperation)

### `unreal.PCGSampleTextureSettings`
Inherits: `PCGSettings` | Header: `PCGSampleTexture.h`

Samples color of texture at each point.

**Properties** (5):
  - `clamp_output_density`: `bool` — [Read-Write] Controls whether the output density should be clamped or not. (bool)
  - `density_merge_function`: `PCGDensityMergeOperation` — [Read-Write] Controls the behavior of density computation with respect to initial data. (PCGDensityM...
  - `texture_mapping_method`: `PCGTextureMappingMethod` — [Read-Write] Whether to treat the sample positions as being in 0-1 UV space. If method is Planar the...
  - `tiling_mode`: `PCGTextureAddressMode` — [Read-Write] Overrides the textureâs tiling to wrap or clamp its UVs. (PCGTextureAddressMode)
  - `uv_coordinates_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] The attribute that provides sample positions for sampling the texture. (PCGAttributePro...

### `unreal.PCGSanityCheckPointDataSettings`
Inherits: `PCGSettings` | Header: `PCGSanityCheckPointData.h`

PCGSanity Check Point Data Settings

**Properties** (2):
  - `max_point_count`: `int` — [Read-Write] (int32)
  - `min_point_count`: `int` — [Read-Write] (int32)

### `unreal.PCGSaveDataAssetSettings`
Inherits: `PCGSettings` | Header: `PCGSaveAssetElement.h`

Node that will save input data to a PCG data asset

**Properties** (5):
  - `asset_color`: `LinearColor` — [Read-Write] (LinearColor)
  - `asset_description`: `str` — [Read-Write] (str)
  - `custom_data_collection_exporter_class`: `Class` — [Read-Write] (type(Class))
  - `params`: `PCGAssetExporterParameters` — [Read-Write] (PCGAssetExporterParameters)
  - `pins`: `None` — [Read-Write] (Array[PCGPinProperties])

### `unreal.PCGSchedulingPolicyBase`
Inherits: `Object` | Header: `PCGSchedulingPolicyBase.h`

Scheduling Policies provide custom logic to efficiently schedule work for the Runtime Generation Scheduling system. A higher priority value means the work will be scheduled sooner, and larger grid siz...

### `unreal.PCGSchedulingPolicyDistanceAndDirection`
Inherits: `PCGSchedulingPolicyBase` | Header: `PCGSchedulingPolicyDistanceAndDirection.h`

SchedulingPolicyDistanceAndDirection uses distance from the generating volume and alignment with view direction to choose the most important volumes to generate.

**Properties** (7):
  - `cleanup_bounds_modifier`: `float` — [Read-Write] Multiplier to scale bounds by when comparing against the view frustum for clean up. (fl...
  - `direction_weight`: `float` — [Read-Write] Scalar value used to increase/decrease the impact of direction in the scheduling priori...
  - `distance_weight`: `float` — [Read-Write] Scalar value used to increase/decrease the impact of distance in the scheduling priorit...
  - `generate_bounds_modifier`: `float` — [Read-Write] Multiplier to scale bounds by when comparing against the view frustum for generation. C...
  - `use_direction`: `bool` — [Read-Write] Toggle whether or not direction is used to calculate the scheduling priority. (bool)
  - `use_distance`: `bool` — [Read-Write] Toggle whether or not distance is used to calculate the scheduling priority. (bool)
  - `use_frustum_culling`: `bool` — [Read-Write] With frustum culling enabled, only components whose bounds overlap the view frustum wil...

### `unreal.PCGSelectGrammarSettings`
Inherits: `PCGSettings` | Header: `PCGSelectGrammar.h`

Select a grammar by comparing an input attribute against a provided set criteria one-by-one in a sequential order.

**Properties** (10):
  - `compared_value_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] The attribute on the input data to be compared against. Will be numerically evaluated. ...
  - `copy_key_for_unselected_grammar`: `bool` — [Read-Write] If no grammar is selected for a given point, pass through the key value. (bool)
  - `criteria`: `None` — [Read-Write] Selection criteria that will be evaluated in order. (Array[PCGSelectGrammarCriterion])
  - `criteria_as_input`: `bool` — [Read-Write] Toggle for an additional input âSelection Criteria Dataâ which accepts criteria inf...
  - `criteria_attribute_names`: `PCGSelectGrammarCriteriaAttributeNames` — [Read-Write] The attribute names expected for the comparison criteria. (PCGSelectGrammarCriteriaAttr...
  - `key`: `Name` — [Read-Write] An attribute key that represents the desired set of grammars. (Name)
  - `key_as_attribute`: `bool` — [Read-Write] Select the key with an attribute. (bool)
  - `key_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] An attribute selector for a key that represents the desired set of grammars. (PCGAttrib...
  - `output_grammar_attribute`: `PCGAttributePropertyOutputSelector` — [Read-Write] The attribute to output the selected grammar. (PCGAttributePropertyOutputSelector)
  - `remap_criteria_attribute_names`: `bool` — [Read-Write] Remap expected attribute names for the comparison criteria. (bool)

### `unreal.PCGSelectPointsSettings`
Inherits: `PCGSettings` | Header: `PCGSelectPoints.h`

PCGSelect Points Settings

**Properties** (2):
  - `keep_zero_density_points`: `bool` — [Read-Write] (bool)
  - `ratio`: `float` — [Read-Write] (float)

### `unreal.PCGSelfPruningSettings`
Inherits: `PCGSettings` | Header: `PCGSelfPruning.h`

PCGSelf Pruning Settings

**Properties** (1):
  - `parameters`: `PCGSelfPruningParameters` — [Read-Write] (PCGSelfPruningParameters)

### `unreal.PCGSettings`
Inherits: `PCGSettingsInterface` | Header: `PCGSettings.h`

Base class for settings-as-data in the PCG framework

**Methods** (1):
  - `bp_get_type_union_of_incident_edges(pin_label)` -> `int32` — Bitwise union of the allowed types of each incident edge on pin. Returns None type if no common bits, or no edges. Use t...

**Properties** (6):
  - `category`: `Text` — [Read-Write] (Text)
  - `description`: `Text` — [Read-Write] (Text)
  - `determinism_settings`: `PCGDeterminismSettings` — [Read-Write] (PCGDeterminismSettings)
  - `expose_to_library`: `bool` — [Read-Write] (bool)
  - `seed`: `int` — [Read-Write] (int32)
  - `use_seed`: `bool` — [Read-Write]
deprecated: Implement the PCGSettings virtual UseSeed() override. (bool)

### `unreal.PCGSettingsInstance`
Inherits: `PCGSettingsInterface` | Header: `PCGSettings.h`

PCGSettings Instance

**Properties** (1):
  - `settings`: `PCGSettings` [Read-Only] — [Read-Only] (PCGSettings)

### `unreal.PCGSettingsInterface`
Inherits: `PCGData` | Header: `PCGSettings.h`

PCGSettings Interface

**Properties** (4):
  - `break_debugger`: `bool` — [Read-Write] If a debugger is attached, triggers a breakpoint inside IPCGElement::Execute(). Editor ...
  - `debug`: `bool` — [Read-Write] (bool)
  - `debug_settings`: `PCGDebugVisualizationSettings` — [Read-Write] (PCGDebugVisualizationSettings)
  - `enabled`: `bool` — [Read-Write] (bool)

### `unreal.PCGSettingsWithDynamicInputs`
Inherits: `PCGSettings` | Header: `PCGSettingsWithDynamicInputs.h`

UPCGSettings subclass with functionality to dynamically add/remove input pins

### `unreal.PCGSkinnedMeshInstanceDataPackerBase`
Inherits: `Object` | Header: `PCGSkinnedMeshInstanceDataPackerBase.h`

PCGSkinned Mesh Instance Data Packer Base

**Methods** (3):
  - `add_type_to_packing(type_id)` -> `PCGSkinnedMeshPackedCustomData or None` — Interprets Metadata TypeId and increments OutPackedCustomData.NumCustomDataFloats appropriately. Returns false if the ty...
  - `pack_custom_data_from_attributes(instance_list, metadata, attribute_names)` -> `PCGSkinnedMeshPackedCustomData` — Build a PackedCustomData by processing each attribute in order for each point in the InstanceList
  - `pack_instances(spatial_data, out_packed_custom_data=PCGSkinnedMeshPackedCustomData)` — Defines the strategy for custom float data packing

### `unreal.PCGSkinnedMeshInstanceDataPackerByAttribute`
Inherits: `PCGSkinnedMeshInstanceDataPackerBase` | Header: `PCGSkinnedMeshInstanceDataPackerByAttribute.h`

PCGSkinned Mesh Instance Data Packer by Attribute

**Properties** (1):
  - `attribute_selectors`: `None` — [Read-Write] (Array[PCGAttributePropertyInputSelector])

### `unreal.PCGSkinnedMeshInstanceDataPackerByRegex`
Inherits: `PCGSkinnedMeshInstanceDataPackerBase` | Header: `PCGSkinnedMeshInstanceDataPackerByRegex.h`

PCGSkinned Mesh Instance Data Packer by Regex

**Properties** (1):
  - `regex_patterns`: `None` — [Read-Write] (Array[str])

### `unreal.PCGSkinnedMeshSelector`
Inherits: `Object` | Header: `PCGSkinnedMeshSelector.h`

PCGSkinned Mesh Selector

**Properties** (5):
  - `bank_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `material_override_attributes`: `None` — [Read-Write] (Array[Name])
  - `mesh_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `sequence_index_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `use_attribute_material_overrides`: `bool` — [Read-Write] (bool)

### `unreal.PCGSkinnedMeshSpawnerKernel`
Inherits: `PCGComputeKernel` | Header: `PCGSkinnedMeshSpawnerKernel.h`

PCGSkinned Mesh Spawner Kernel

### `unreal.PCGSkinnedMeshSpawnerSettings`
Inherits: `PCGSettings` | Header: `PCGSkinnedMeshSpawner.h`

PCGSkinned Mesh Spawner Settings

**Methods** (1):
  - `set_instance_packer_type(instance_packer_type)` -> `None` — Set Instance Packer Type

**Properties** (10):
  - `apply_mesh_bounds_to_points`: `bool` — [Read-Write] Sets the BoundsMin and BoundsMax attributes of each point to reflect the AnimBank mesh ...
  - `instance_data_packer_parameters`: `PCGSkinnedMeshInstanceDataPackerBase` [Read-Only] — [Read-Only] (PCGSkinnedMeshInstanceDataPackerBase)
  - `instance_data_packer_type`: `Class` [Read-Only] — [Read-Only] Defines the method of custom data packing for spawned anim bank meshes. Note, Rotators a...
  - `mesh_selector_parameters`: `PCGSkinnedMeshSelector` [Read-Only] — [Read-Only] (PCGSkinnedMeshSelector)
  - `post_process_function_names`: `None` — [Read-Write] Specify a list of functions to be called on the target actor after instances are spawne...
  - `silence_override_attribute_not_found_errors`: `bool` — [Read-Write] Opt-in option to silence errors when the property override attributes are not found. (b...
  - `skinned_mesh_component_property_overrides`: `None` — [Read-Write] Map an attribute directly to an anim bank descriptor property, the value of which will ...
  - `synchronous_load`: `bool` — [Read-Write] Meshes/Materials will be synchronously loaded before spawning instead of asynchronously...
  - `target_actor`: `Actor` — [Read-Write] (Actor)
  - `warn_on_identical_spawn`: `bool` — [Read-Write] Adds a warning to the node on repeated spawning with identical conditions (ie. same mes...

### `unreal.PCGSortAttributesSettings`
Inherits: `PCGSettings` | Header: `PCGSortAttributes.h`

PCGSort Attributes Settings

**Properties** (2):
  - `input_source`: `PCGAttributePropertyInputSelector` — [Read-Write] (PCGAttributePropertyInputSelector)
  - `sort_method`: `PCGSortMethod` — [Read-Write] (PCGSortMethod)

### `unreal.PCGSortTagsSettings`
Inherits: `PCGSettings` | Header: `PCGSortTags.h`

Sorts a data collection based on a specific tag value. This is a stable sort, but will always put entries (data) that do not have the specified tag at the end. Note that tag values are tags of the for...

**Properties** (2):
  - `sort_method`: `PCGSortMethod` — [Read-Write] (PCGSortMethod)
  - `tag`: `Name` — [Read-Write] (Name)

### `unreal.PCGSpatialData`
Inherits: `PCGData` | Header: `PCGSpatialData.h`

âConcreteâ data base class for PCG generation This will be the base class for data classes that actually represent concrete evidence of spatial data - points, surfaces, splines, etc. In opposition...

**Methods** (23):
  - `create_empty_metadata()` -> `PCGMetadata` — Create Empty Metadata deprecated: The Create Empty Metadata function is not needed anymore - it can safely be removed
  - `get_bounds()` -> `Box` — Returns the full bounds (including density fall-off) of the data
  - `get_density_at_position(position)` -> `float` — Computes the density at a given location
  - `get_dimension()` -> `int32` — Returns the dimension of the data type, which has nothing to do with the dimension of its points
  - `get_normal()` -> `Vector` — Returns the expected data normal (for surfaces) or eventual projection axis (for volumes)
  - `get_strict_bounds()` -> `Box` — Returns the bounds in which the density is always 1
  - `has_non_trivial_transform()` -> `bool` — Returns true if the data has a non-trivial transform
  - `initialize_from_data(source, metadata_parent_override = None, inherit_metadata = True, inherit_attributes = True)` -> `None` — Prefer using InitializeFromDataWithParams instead. Note that InMetadataParentOverride is deprecated on the code side, an...
  - `initialize_from_data_with_params(params)` -> `None` — Initialize from Data with Params
  - `intersect_with(other: PCGSpatialData)` -> `PCGIntersectionData` — deprecated: âintersect_withâ was renamed to âk2_intersect_withâ.
  - `k2_intersect_with(other)` -> `PCGIntersectionData` — Returns a specialized data to intersect with another data
  - `k2_project_on(other, params = [True,True,False,PCGProjectionColorBlendMode.SOURCE_VALUE,'',PCGMetadataFilterMode.EXCLUDE_ATTRIBUTES,PCGMetadataOp.TARGET_VALUE,PCGProjectionTagMergeMode.SOURCE])` -> `PCGSpatialData` — Returns a specialized data to project this on another data of equal or higher dimension. Returns copy of this data if pr...
  - `k2_project_point(transform, bounds, params, out_metadata)` -> `PCGPoint or None` — K2 Project Point
  - `k2_sample_point(transform, bounds, out_metadata)` -> `PCGPoint or None` — Sample rotation, scale and other attributes from this data at the query position. Returns true if Transform location and...
  - `k2_subtract(other)` -> `PCGDifferenceData` — K2 Subtract
  - `k2_union_with(other)` -> `PCGUnionData` — Returns a specialized data to union this with another data
  - `project_on(other: PCGSpatialData, params: PCGProjectionParams = Ellipsis)` -> `PCGSpatialData` — deprecated: âproject_onâ was renamed to âk2_project_onâ.
  - `project_point(transform: Transform, bounds: Box, params: PCGProjectionParams, out_metadata: PCGMetadata)` -> `PCGPoint | None` — deprecated: âproject_pointâ was renamed to âk2_project_pointâ.
  - `sample_point(transform: Transform, bounds: Box, out_metadata: PCGMetadata)` -> `PCGPoint | None` — deprecated: âsample_pointâ was renamed to âk2_sample_pointâ.
  - `subtract(other: PCGSpatialData)` -> `PCGDifferenceData` — deprecated: âsubtractâ was renamed to âk2_subtractâ.
  - `to_point_data()` -> `PCGPointData` — Discretizes the data into points deprecated: The To Point Data function is deprecated - use To Point Data With Context i...
  - `to_point_data_with_context(context=PCGContext)` — To Point Data with Context
  - `union_with(other: PCGSpatialData)` -> `PCGUnionData` — deprecated: âunion_withâ was renamed to âk2_union_withâ.

**Properties** (2):
  - `keep_zero_density_points`: `bool` — [Read-Write] (bool)
  - `target_actor`: `Actor` — [Read-Write] Recipient of any artifacts generated using this data. (Actor)

### `unreal.PCGSpatialDataWithPointCache`
Inherits: `PCGSpatialData` | Header: `PCGSpatialData.h`

PCGSpatial Data with Point Cache

### `unreal.PCGSpatialNoiseSettings`
Inherits: `PCGSettings` | Header: `PCGSpatialNoise.h`

Various fractal noises that can be used to filter points

**Properties** (17):
  - `brightness`: `float` — [Read-Write] (float)
  - `contrast`: `float` — [Read-Write] (float)
  - `edge_blend_curve_intensity`: `float` — [Read-Write] will makes the falloff harsher or softer (float)
  - `edge_blend_curve_offset`: `float` — [Read-Write] Adjust the center point of the curve (where x = curve(x) crosses over) (float)
  - `edge_blend_distance`: `float` — [Read-Write] if > 0, we blend to a tiling edge value (float)
  - `edge_mask2d_mode`: `PCGSpatialNoiseMask2DMode` — [Read-Write] (PCGSpatialNoiseMask2DMode)
  - `iterations`: `int` — [Read-Write] this is how many times the fractal method recurses. A higher number will mean more deta...
  - `mode`: `PCGSpatialNoiseMode` — [Read-Write] The noise method used (PCGSpatialNoiseMode)
  - `random_offset`: `Vector` — [Read-Write] Adds a random amount of offset up to this amount (Vector)
  - `tiled_voronoi_edge_blend_cell_count`: `int` — [Read-Write] how many cells around the edge will tile (int32)
  - `tiled_voronoi_resolution`: `int` — [Read-Write] The cell resolution of the tiled voronoi (across the bounds) (int32)
  - `tiling`: `bool` — [Read-Write] if true, will generate results that tile along the bounding box size of the (bool)
  - `transform`: `Transform` — [Read-Write] this will apply a transform to the points before calculating noise (Transform)
  - `value_target`: `PCGAttributePropertyOutputNoSourceSelector` — [Read-Write] The output attribute name to write, if not âNoneâ (PCGAttributePropertyOutputNoSour...
  - `voronoi_cell_id_target`: `PCGAttributePropertyOutputNoSourceSelector` — [Read-Write] The output attribute name to write the voronoi cell id, if not âNoneâ (PCGAttribute...
  - `voronoi_cell_randomness`: `float` — [Read-Write] the less random this is, the more it returns to being a grid (double)
  - `voronoi_orient_samples_to_cell_edge`: `bool` — [Read-Write] If true it will orient the output points to point towards the cell edges, which can be ...

### `unreal.PCGSpawnActorNode`
Inherits: `PCGBaseSubgraphNode` | Header: `PCGSpawnActor.h`

PCGSpawn Actor Node

### `unreal.PCGSpawnActorSettings`
Inherits: `PCGBaseSubgraphSettings` | Header: `PCGSpawnActor.h`

PCG settings class that allows spawning actors with some options to perform the work more efficiently. Note that depending on the options, any PCG components on the spawned actors can be also generate...

**Properties** (17):
  - `allow_template_actor_editing`: `bool` — [Read-Write] (bool)
  - `attach_options`: `PCGAttachOptions` — [Read-Write] (PCGAttachOptions)
  - `data_layer_settings`: `PCGDataLayerSettings` — [Read-Write] (PCGDataLayerSettings)
  - `delete_actors_before_generation`: `bool` — [Read-Write] (bool)
  - `force_disable_actor_parsing`: `bool` — [Read-Write] Note that this is no longer the default value for new nodes, it is now EPCGSpawnActorOp...
  - `generation_trigger`: `PCGSpawnActorGenerationTrigger` — [Read-Write] (PCGSpawnActorGenerationTrigger)
  - `hlod_settings`: `PCGHLODSettings` — [Read-Write] (PCGHLODSettings)
  - `inherit_actor_tags`: `bool` — inheriting parent actor tags work only in non-collapsed actor hierarchies (bool) [Read-Write] Warnin...
  - `option`: `PCGSpawnActorOption` — [Read-Write] (PCGSpawnActorOption)
  - `post_spawn_function_names`: `None` — [Read-Write] Can specify a list of functions from the template class to be called on each actor spaw...
  - `spawn_attribute`: `Name` — [Read-Write] (Name)
  - `spawn_by_attribute`: `bool` — [Read-Write] Note that this is no longer the default value for new nodes, it is now EPCGAttachOption...
  - `spawned_actor_property_override_descriptions`: `None` — [Read-Write] (Array[PCGObjectPropertyOverrideDescription])
  - `tags_to_add_on_actors`: `None` — [Read-Write] (Array[Name])
  - `template_actor`: `Actor` — [Read-Write] (Actor)
  - `template_actor_class`: `Class` [Read-Only] — [Read-Only] (type(Class))
  - `warn_on_identical_spawn`: `bool` — [Read-Write] Adds a warning to the node on repeated spawning with identical conditions (ie. same act...

### `unreal.PCGSpawnSplineMeshSettings`
Inherits: `PCGSettings` | Header: `PCGSpawnSplineMesh.h`

Create a USplineMeshComponent for each segment along a given spline.

**Properties** (4):
  - `post_process_function_names`: `None` — [Read-Write] Specify a list of functions to be called on the target actor after spline mesh creation...
  - `spline_mesh_override_descriptions`: `None` — [Read-Write] Overrides for spline mesh descriptor. (Array[PCGObjectPropertyOverrideDescription])
  - `spline_mesh_params_override`: `None` — [Read-Write] Overrides for spline mesh params. (Array[PCGObjectPropertyOverrideDescription])
  - `synchronous_load`: `bool` — [Read-Write] Force meshes/materials to load synchronously. (bool)

### `unreal.PCGSpawnSplineSettings`
Inherits: `PCGSettings` | Header: `PCGSpawnSpline.h`

Spawn a spline component from a spline data.

**Properties** (7):
  - `component_reference_attribute_name`: `Name` — [Read-Write] Can output the spawned component reference in an attribute. (Name)
  - `output_spline_component_reference`: `bool` — [Read-Write] (bool)
  - `post_process_function_names`: `None` — [Read-Write] Specify a list of functions to be called on the target actor after spline creation. Fun...
  - `property_override_descriptions`: `None` — [Read-Write] Overrides to apply on the spawned component. (Array[PCGObjectPropertyOverrideDescriptio...
  - `spawn_component_from_attribute`: `bool` — [Read-Write] (bool)
  - `spawn_component_from_attribute_name`: `PCGAttributePropertyInputSelector` — [Read-Write] If the class of the component to spawn is coming from an attribute. (PCGAttributeProper...
  - `spline_component`: `Class` — [Read-Write] Class of the component to spawn, must be a subclass of Spline Component. (type(Class))

### `unreal.PCGSplineData`
Inherits: `PCGPolyLineData` | Header: `PCGSplineData.h`

PCGSpline Data

**Methods** (4):
  - `get_metadata_entry_keys_for_spline_points()` -> `Array [ int64 ]` — Get Metadata Entry Keys for Spline Points
  - `get_spline_points()` -> `Array [ SplinePoint ]` — Get Spline Points
  - `initialize(spline)` -> `None` — Initialize a spline data from a Spline Component.
  - `k2_initialize(spline_points, closed_loop, transform, optional_entry_keys)` -> `None` — Initialize a spline data

### `unreal.PCGSplineInteriorSurfaceData`
Inherits: `PCGSurfaceData` | Header: `PCGSplineInteriorSurfaceData.h`

Represents a surface implicitly using the top-down 2D projection of a closed spline.

### `unreal.PCGSplineProjectionData`
Inherits: `PCGProjectionData` | Header: `PCGSplineData.h`

The projection of a spline onto a surface.

**Properties** (1):
  - `projected_position`: `InterpCurveVector2D` — [Read-Write] (InterpCurveVector2D)

### `unreal.PCGSplineSamplerSettings`
Inherits: `PCGSettings` | Header: `PCGSplineSampler.h`

PCGSpline Sampler Settings

**Properties** (2):
  - `params`: `PCGSplineSamplerParams` — âparamsâ was renamed to âsampler_paramsâ. deprecated
  - `sampler_params`: `PCGSplineSamplerParams` — [Read-Write] (PCGSplineSamplerParams)

### `unreal.PCGSplineToSegmentSettings`
Inherits: `PCGSettings` | Header: `PCGSplineToSegment.h`

Take a spline as input and create a point data, with each point being a segment defined by 2 connected control points. The point position will be in the middle of those 2 control points, and the exten...

**Properties** (4):
  - `extract_angles`: `bool` — [Read-Write] Can extract the angle with previous tangent and next tangent. Will be 0 at the extremit...
  - `extract_clockwise_info`: `bool` — [Read-Write] Can output a global attribute to know if the spline points order is clockwise or counte...
  - `extract_connectivity_info`: `bool` — [Read-Write] Can set the index of the previous and next segment (to keep information on connectivity...
  - `extract_tangents`: `bool` — [Read-Write] Can extract the tangents with previous segment and next segment. (bool)

### `unreal.PCGSplitPointsSettings`
Inherits: `PCGSettings` | Header: `PCGSplitPoints.h`

Splits each point into two separate points, and sets bounds based on the position and axis of the cut.

**Properties** (2):
  - `split_axis`: `PCGSplitAxis` — [Read-Write] (PCGSplitAxis)
  - `split_position`: `float` — [Read-Write] (float)

### `unreal.PCGStaticMeshResourceData`
Inherits: `PCGResourceData` | Header: `PCGStaticMeshResourceData.h`

Data that wraps a Static Mesh soft object path.

**Properties** (1):
  - `static_mesh`: `StaticMesh` — [Read-Write] (StaticMesh)

### `unreal.PCGStaticMeshSpawnerKernel`
Inherits: `PCGComputeKernel` | Header: `PCGStaticMeshSpawnerKernel.h`

PCGStatic Mesh Spawner Kernel

### `unreal.PCGStaticMeshSpawnerSettings`
Inherits: `PCGSettings` | Header: `PCGStaticMeshSpawner.h`

PCGStatic Mesh Spawner Settings

**Methods** (2):
  - `set_instance_packer_type(instance_packer_type)` -> `None` — Set Instance Packer Type
  - `set_mesh_selector_type(mesh_selector_type)` -> `None` — Set Mesh Selector Type

**Properties** (17):
  - `allow_descriptor_changes`: `bool` [Read-Only] — [Read-Only] Allows PCG to make some changes on the descriptors as situation arises (using ISM instea...
  - `allow_merge_different_data_in_same_instanced_components`: `bool` — [Read-Write] Controls whether instances stemming from different data can end up in the same ISM. Per...
  - `apply_mesh_bounds_to_points`: `bool` — [Read-Write] Sets the BoundsMin and BoundsMax attributes of each point to reflect the StaticMesh spa...
  - `instance_data_packer_parameters`: `PCGInstanceDataPackerBase` [Read-Only] — [Read-Only] (PCGInstanceDataPackerBase)
  - `instance_data_packer_type`: `Class` [Read-Only] — [Read-Only] Defines the method of custom data packing for spawned (H)ISMCs. Note, Rotators are treat...
  - `instance_packer_instance`: `PCGInstanceDataPackerBase` — âinstance_packer_instanceâ was renamed to âinstance_data_packer_parametersâ. deprecated
  - `instance_packer_type`: `Class` — âinstance_packer_typeâ was renamed to âinstance_data_packer_typeâ. deprecated
  - `mesh_selector_instance`: `PCGMeshSelectorBase` — âmesh_selector_instanceâ was renamed to âmesh_selector_parametersâ. deprecated
  - `mesh_selector_parameters`: `PCGMeshSelectorBase` [Read-Only] — [Read-Only] (PCGMeshSelectorBase)
  - `mesh_selector_type`: `Class` [Read-Only] — [Read-Only] Defines the method of mesh selection per input data (type(Class))
  - `out_attribute_name`: `Name` — Will overwrite existing data if the attribute name already exists. (Name) [Read-Write] Attribute nam...
  - `post_process_function_names`: `None` — [Read-Write] Specify a list of functions to be called on the target actor after instances are spawne...
  - `silence_override_attribute_not_found_errors`: `bool` — [Read-Write] Opt-in option to silence errors when the property override attributes are not found. (b...
  - `static_mesh_component_property_overrides`: `None` — [Read-Write] Map an attribute directly to an ISM Descriptor property, the value of which will be ove...
  - `synchronous_load`: `bool` — [Read-Write] Meshes/Materials will be synchronously loaded before spawning instead of asynchronously...
  - `target_actor`: `Actor` — [Read-Write] (Actor)
  - `warn_on_identical_spawn`: `bool` — [Read-Write] Adds a warning to the node on repeated spawning with identical conditions (ie. same mes...

### `unreal.PCGSubdivideSegmentSettings`
Inherits: `PCGSubdivisionBaseSettings` | Header: `PCGSubdivideSegment.h`

PCGSubdivide Segment Settings

**Properties** (12):
  - `accept_incomplete_subdivision`: `bool` — [Read-Write] If the subdivision with a given grammar doesnât fill the entire segment, setting it t...
  - `extremity_neighbor_index_attribute_name`: `Name` — [Read-Write] Name of the extremity neighbor index output attribute name. (Name)
  - `flip_axis_as_attribute`: `bool` — [Read-Write] Use an attribute to determine whether we should flip axis. (bool)
  - `flip_axis_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] Name of the attribute to know if we need to flip axis. (PCGAttributePropertyInputSelect...
  - `is_final_attribute_name`: `Name` — [Read-Write] Name of the attribute labeling the final output point from the final module. (Name)
  - `is_first_attribute_name`: `Name` — [Read-Write] Name of the attribute labeling the first output point from the first module. (Name)
  - `module_index_attribute_name`: `Name` — [Read-Write] Name of the module index output attribute name. (Name)
  - `output_extremity_attributes`: `bool` — [Read-Write] Output attributes labeling the first and final points after subdivision. (bool)
  - `output_extremity_neighbor_index_attribute`: `bool` — [Read-Write] (bool)
  - `output_module_index_attribute`: `bool` — [Read-Write] (bool)
  - `should_flip_axis`: `bool` — [Read-Write] If we need to flip axis. (bool)
  - `subdivision_axis`: `PCGSplitAxis` — [Read-Write] Subdivision direction in point local space. (PCGSplitAxis)

### `unreal.PCGSubdivideSplineSettings`
Inherits: `PCGSubdivisionBaseSettings` | Header: `PCGSubdivideSpline.h`

PCGSubdivide Spline Settings

**Properties** (10):
  - `accept_incomplete_subdivision`: `bool` — [Read-Write] If the subdivision with a given grammar doesnât fill the entire spline, setting it to...
  - `is_final_attribute_name`: `Name` — [Read-Write] Name of the attribute labeling the final output point from the final module. (Name)
  - `is_first_attribute_name`: `Name` — [Read-Write] Name of the attribute labeling the first output point from the first module. (Name)
  - `module_height`: `float` — [Read-Write] The height of each placed module. (double)
  - `module_height_as_attribute`: `bool` — [Read-Write] Select the module height from an attribute. (bool)
  - `module_height_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] Selection will be used as the module height for placed modules. (PCGAttributePropertyIn...
  - `module_index_attribute_name`: `Name` — [Read-Write] Name of the module index output attribute name. (Name)
  - `module_placement_tolerance`: `float` — [Read-Write] Maximum acceptable distance tolerance between placed modules (overlap or gap) - a small...
  - `output_extremity_attributes`: `bool` — [Read-Write] Output attributes labeling the first and final points after subdivision. (bool)
  - `output_module_index_attribute`: `bool` — [Read-Write] (bool)

### `unreal.PCGSubdivisionBaseSettings`
Inherits: `PCGSettings` | Header: `PCGSubdivisionBase.h`

PCGSubdivision Base Settings

**Properties** (14):
  - `debug_color_attribute_name`: `Name` — [Read-Write] Name of the Debug Color output attribute name, ignored if Forward Attributes From Modul...
  - `forward_attributes_from_modules_info`: `bool` — [Read-Write] Do a match and set with the incoming modules info, only if the modules info is passed a...
  - `grammar_selection`: `PCGGrammarSelection` — [Read-Write] An encoded string that represents how to apply a set of rules to a series of defined mo...
  - `module_info_as_input`: `bool` — [Read-Write] Set it to true to pass the info as attribute set. (bool)
  - `modules_info`: `None` — [Read-Write] Fixed array of modules used for the subdivision. (Array[PCGSubdivisionSubmodule])
  - `modules_info_attribute_names`: `PCGSubdivisionModuleAttributeNames` — [Read-Write] Fixed array of modules used for the subdivision. (PCGSubdivisionModuleAttributeNames)
  - `output_debug_color_attribute`: `bool` — [Read-Write] (bool)
  - `output_scalable_attribute`: `bool` — [Read-Write] (bool)
  - `output_size_attribute`: `bool` — [Read-Write] (bool)
  - `scalable_attribute_name`: `Name` — [Read-Write] Name of the Scalable output attribute name, ignored if Forward Attributes From Modules ...
  - `seed_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] Attribute to use to drive seed selection. It should be convertible to an integer. (PCGA...
  - `size_attribute_name`: `Name` — [Read-Write] Name of the Size output attribute name, ignored if Forward Attributes From Modules Info...
  - `symbol_attribute_name`: `Name` — [Read-Write] Name of the Symbol output attribute name. (Name)
  - `use_seed_attribute`: `bool` — [Read-Write] Controls whether weâll use an attribute to drive random seeding for stochastic proces...

### `unreal.PCGSubgraphNode`
Inherits: `PCGBaseSubgraphNode` | Header: `PCGSubgraph.h`

PCGSubgraph Node

### `unreal.PCGSubgraphSettings`
Inherits: `PCGBaseSubgraphSettings` | Header: `PCGSubgraph.h`

PCGSubgraph Settings

**Properties** (2):
  - `subgraph_instance`: `PCGGraphInstance` [Read-Only] — [Read-Only] (PCGGraphInstance)
  - `subgraph_override`: `PCGGraphInterface` [Read-Only] — [Read-Only] (PCGGraphInterface)

### `unreal.PCGSurfaceData`
Inherits: `PCGSpatialDataWithPointCache` | Header: `PCGSurfaceData.h`

PCGSurface Data

**Properties** (2):
  - `local_bounds`: `Box` [Read-Only] — [Read-Only] (Box)
  - `transform`: `Transform` [Read-Only] — [Read-Only] (Transform)

### `unreal.PCGSurfaceSamplerSettings`
Inherits: `PCGSettings` | Header: `PCGSurfaceSampler.h`

PCGSurface Sampler Settings

**Properties** (8):
  - `apply_density_to_points`: `bool` — [Read-Write] (bool)
  - `keep_zero_density_points`: `bool` — [Read-Write] (bool)
  - `looseness`: `float` — [Read-Write] Controls how points are placed in their cell with 0 being in the center and 1 being any...
  - `point_extents`: `Vector` — [Read-Write] Extents of the points to create (e.g. half their total size) (Vector)
  - `point_steepness`: `float` — [Read-Write] Each PCG point represents a discretized, volumetric region of world space. The pointsâ...
  - `points_per_squared_meter`: `float` — [Read-Write] Controls the grid cell size, down to a minimum size defined by the Point Extents. (floa...
  - `unbounded`: `bool` — [Read-Write] If no Bounding Shape input is provided, the actor bounds are used to limit the sample g...
  - `use_legacy_grid_creation_method`: `bool` — [Read-Write] Controls whether the prior grid creation mechanism (with cells being extents * (1 + ste...

### `unreal.PCGSwitchSettings`
Inherits: `PCGControlFlowSettings` | Header: `PCGSwitch.h`

Routes data from the input pin, to a specific output pin based on a selection criteria (Int/String/Enum)

**Properties** (6):
  - `enum_selection`: `EnumSelector` — [Read-Write] Determines which output pin will be selected if the selection mode is Enum. (EnumSelect...
  - `int_options`: `None` — [Read-Write] Determines the available output pin selection options. (Array[int32])
  - `integer_selection`: `int` — [Read-Write] Determines which output will be selected if the selection mode is Integer. (int32)
  - `selection_mode`: `PCGControlFlowSelectionMode` — [Read-Write] Determines the type of value to be used to select an output. (PCGControlFlowSelectionMo...
  - `string_options`: `None` — [Read-Write] Determines the available output pin selection options. (Array[str])
  - `string_selection`: `str` — [Read-Write] Determines which output will be selected if the selection mode is String. (str)

### `unreal.PCGTagsToAttributeSetSettings`
Inherits: `PCGSettings` | Header: `PCGConvertToAttributeSet.h`

Converts tags on data collections to an attribute set (per input data), akin to how itâs done on Get Actor Data with the Single Point option.

### `unreal.PCGTextureData`
Inherits: `PCGBaseTextureData` | Header: `PCGTextureData.h`

PCGTexture Data

**Properties** (3):
  - `successfully_initialized`: `bool` [Read-Only] — [Read-Only] (bool)
  - `texture`: `Texture` [Read-Only] — [Read-Only] (Texture)
  - `texture_index`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.PCGTextureSamplerSettings`
Inherits: `PCGSettings` | Header: `PCGTextureSampler.h`

PCGTexture Sampler Settings

**Properties** (19):
  - `center_offset`: `Vector2D` — [Read-Write] (Vector2D)
  - `color_channel`: `PCGTextureColorChannel` — [Read-Write] (PCGTextureColorChannel)
  - `density_function`: `PCGTextureDensityFunction` — [Read-Write]
deprecated: Property âDensityFunctionâ is deprecated. (PCGTextureDensityFunction)
  - `filter`: `PCGTextureFilter` — [Read-Write] Method used to determine the value for a sample based on the value of nearby texels. (P...
  - `force_editor_only_cpu_sampling`: `bool` — [Read-Write] Even if the texture is not set to CPU-available, it can still be accessed from CPU memo...
  - `rotation`: `float` — [Read-Write] Rotation to apply when sampling texture. (float)
  - `skip_readback_to_cpu`: `bool` — [Read-Write] Skip CPU readback during initialization of the texture data. (bool)
  - `synchronous_load`: `bool` — [Read-Write] By default, texture loading is asynchronous, can force it synchronous if needed. (bool)
  - `texel_size`: `float` — [Read-Write] The size of one texel in cm, used when calling ToPointData. (float)
  - `texture`: `Texture` — [Read-Write] Texture specific parameters (Texture)
  - `texture_array_index`: `int` — [Read-Write] Index of texture array slice. Only used when built with editor and if the type of Textu...
  - `tile_bounds_max`: `Vector2D` — [Read-Write] (Vector2D)
  - `tile_bounds_min`: `Vector2D` — [Read-Write] (Vector2D)
  - `tiling`: `Vector2D` — [Read-Write] (Vector2D)
  - `transform`: `Transform` — [Read-Write] Surface transform (Transform)
  - `use_absolute_transform`: `bool` — [Read-Write] (bool)
  - `use_advanced_tiling`: `bool` — [Read-Write] Whether to tile the source or to stretch it to fit target area. (bool)
  - `use_density_source_channel`: `bool` — [Read-Write] (bool)
  - `use_tile_bounds`: `bool` — [Read-Write] (bool)

### `unreal.PCGTransformPointsSettings`
Inherits: `PCGSettings` | Header: `PCGTransformPoints.h`

PCGTransform Points Settings

**Properties** (13):
  - `absolute_offset`: `bool` — [Read-Write] Set offset in world space (bool)
  - `absolute_rotation`: `bool` — [Read-Write] Set rotation directly instead of additively (bool)
  - `absolute_scale`: `bool` — [Read-Write] Set scale directly instead of multiplicatively (bool)
  - `apply_to_attribute`: `bool` — [Read-Write] (bool)
  - `attribute_name`: `Name` — [Read-Write] (Name)
  - `offset_max`: `Vector` — [Read-Write] (Vector)
  - `offset_min`: `Vector` — [Read-Write] (Vector)
  - `recompute_seed`: `bool` — [Read-Write] Recompute the seed for each new point using its new location (bool)
  - `rotation_max`: `Rotator` — [Read-Write] (Rotator)
  - `rotation_min`: `Rotator` — [Read-Write] (Rotator)
  - `scale_max`: `Vector` — [Read-Write] (Vector)
  - `scale_min`: `Vector` — [Read-Write] (Vector)
  - `uniform_scale`: `bool` — [Read-Write] Scale uniformly on each axis. Uses the X component of ScaleMin and ScaleMax. (bool)

### `unreal.PCGTrivialSettings`
Inherits: `PCGSettings` | Header: `PCGSettings.h`

Trivial / Pass-through settings used for input/output nodes

### `unreal.PCGUnionData`
Inherits: `PCGSpatialDataWithPointCache` | Header: `PCGUnionData.h`

PCGUnion Data

**Methods** (2):
  - `add_data(data)` -> `None` — Add Data
  - `initialize(a, b)` -> `None` — Initialize

**Properties** (3):
  - `data`: `None` [Read-Only] — [Read-Only] (Array[PCGSpatialData])
  - `density_function`: `PCGUnionDensityFunction` — [Read-Write] (PCGUnionDensityFunction)
  - `union_type`: `PCGUnionType` — [Read-Write] (PCGUnionType)

### `unreal.PCGUnionSettings`
Inherits: `PCGSettingsWithDynamicInputs` | Header: `PCGUnionElement.h`

PCGUnion Settings

**Properties** (2):
  - `density_function`: `PCGUnionDensityFunction` — [Read-Write] (PCGUnionDensityFunction)
  - `type`: `PCGUnionType` — [Read-Write] (PCGUnionType)

### `unreal.PCGUnitTestDummyActor`
Inherits: `Actor` | Header: `PCGGetActorPropertyTest.h`

PCGUnit Test Dummy Actor

**Properties** (27):
  - `array_of_ints_property`: `None` [Read-Only] — [Read-Only] (Array[int32])
  - `array_of_objects_property`: `None` [Read-Only] — [Read-Only] (Array[PCGDummyGetPropertyTest])
  - `array_of_structs_property`: `None` [Read-Only] — [Read-Only] (Array[PCGTestMyColorStruct])
  - `array_of_vectors_property`: `None` [Read-Only] — [Read-Only] (Array[Vector])
  - `bool_property`: `bool` [Read-Only] — [Read-Only] (bool)
  - `class_property`: `Class` [Read-Only] — [Read-Only] (type(Class))
  - `color_property`: `Color` [Read-Only] — [Read-Only] (Color)
  - `double_property`: `float` [Read-Only] — [Read-Only] (double)
  - `dummy_struct`: `PCGDummyGetPropertyStruct` [Read-Only] — [Read-Only] (PCGDummyGetPropertyStruct)
  - `enum_property`: `PCGUnitTestDummyEnum` [Read-Only] — [Read-Only] (PCGUnitTestDummyEnum)
  - `float_property`: `float` [Read-Only] — [Read-Only] (float)
  - `int64_property`: `int` [Read-Only] — [Read-Only] (int64)
  - `int_property`: `int` [Read-Only] — [Read-Only] (int32)
  - `linear_color_property`: `LinearColor` [Read-Only] — [Read-Only] (LinearColor)
  - `name_property`: `Name` [Read-Only] — [Read-Only] (Name)
  - `object_property`: `PCGDummyGetPropertyTest` [Read-Only] — [Read-Only] (PCGDummyGetPropertyTest)
  - `pcg_color_property`: `PCGTestMyColorStruct` [Read-Only] — [Read-Only] (PCGTestMyColorStruct)
  - `quat_property`: `Quat` [Read-Only] — [Read-Only] (Quat)
  - `rotator_property`: `Rotator` [Read-Only] — [Read-Only] (Rotator)
  - `set_of_ints_property`: `None` [Read-Only] — [Read-Only] (Array[int32])
  - `soft_class_path_property`: `SoftClassPath` [Read-Only] — [Read-Only] (SoftClassPath)
  - `soft_object_path_property`: `SoftObjectPath` [Read-Only] — [Read-Only] (SoftObjectPath)
  - `string_property`: `str` [Read-Only] — [Read-Only] (str)
  - `transform_property`: `Transform` [Read-Only] — [Read-Only] (Transform)
  - `vector2_property`: `Vector2D` [Read-Only] — [Read-Only] (Vector2D)
  - `vector4_property`: `Vector4` [Read-Only] — [Read-Only] (Vector4)
  - `vector_property`: `Vector` [Read-Only] — [Read-Only] (Vector)

### `unreal.PCGUnitTestDummyComponent`
Inherits: `ActorComponent` | Header: `PCGGetActorPropertyTest.h`

PCGUnit Test Dummy Component

**Properties** (1):
  - `int_property`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.PCGUserParameterGetSettings`
Inherits: `PCGSettings` | Header: `PCGUserParameterGet.h`

Getter for user parameters defined in PCGGraph, by the user. Will pick up the value from the graph instance.

**Properties** (2):
  - `force_object_and_struct_extraction`: `bool` — [Read-Write] If the property is a struct/object supported by metadata, this option can be toggled to...
  - `sanitize_output_attribute_name`: `bool` — [Read-Write] If the output attribute name has special characters, remove them. (bool)

### `unreal.PCGUserParametersData`
Inherits: `PCGData` | Header: `PCGUserParametersData.h`

PCG Data meant only to be used internally. It contains a copy of UserParameters for a given graph instance, with overrides in it. The idea is to have a structure to hold our overrides, provided by the...

### `unreal.PCGVirtualTextureData`
Inherits: `PCGSurfaceData` | Header: `PCGVirtualTextureData.h`

PCGVirtual Texture Data

### `unreal.PCGVisualizeAttributeSettings`
Inherits: `PCGSettings` | Header: `PCGVisualizeAttribute.h`

Visualizes a selected attribute on screen at each pointâs transform.

**Properties** (9):
  - `attribute_source`: `PCGAttributePropertyInputSelector` — [Read-Write] This attribute will be have itâs value printed in proximity to each input pointâs t...
  - `color`: `Color` — [Read-Write] The color of the on displayed value. (Color)
  - `custom_prefix_string`: `str` — [Read-Write] A custom added prefix to which the attribute value will be appended. (str)
  - `duration`: `float` — [Read-Write] The duration (in seconds) of the displayed value. (double)
  - `local_offset`: `Vector` — [Read-Write] A local offset from the pointâs location to draw the text. (Vector)
  - `point_limit`: `int` — [Read-Write] The limit of points to draw debug messages. (int32)
  - `prefix_with_attribute_name`: `bool` — [Read-Write] Prefix the printed value with the attributeâs name. (bool)
  - `prefix_with_index`: `bool` — [Read-Write] Prefix the printed value with the pointâs index. (bool)
  - `visualize_enabled`: `bool` — [Read-Write] The visualizer is enabled. Useful for dynamically overriding. (bool)

### `unreal.PCGVolume`
Inherits: `Volume` | Header: `PCGVolume.h`

**Properties** (1):
  - `pcg_component`: `PCGComponent` — [Read-Write] (PCGComponent)

### `unreal.PCGVolumeData`
Inherits: `PCGSpatialDataWithPointCache` | Header: `PCGVolumeData.h`

PCGVolume Data

**Properties** (2):
  - `volume`: `Volume` — [Read-Write] (Volume)
  - `voxel_size`: `Vector` — [Read-Write] ~End UPCGSpatialDataWithPointCache interface (Vector)

### `unreal.PCGVolumeSamplerSettings`
Inherits: `PCGSettings` | Header: `PCGVolumeSampler.h`

PCGVolume Sampler Settings

**Properties** (3):
  - `point_steepness`: `float` — [Read-Write] Each PCG point represents a discretized, volumetric region of world space. The pointsâ...
  - `unbounded`: `bool` — [Read-Write] If no Bounding Shape input is provided, the actor bounds are used to limit the sample g...
  - `voxel_size`: `Vector` — [Read-Write] (Vector)

### `unreal.PCGWaitLandscapeReadySettings`
Inherits: `PCGSettings` | Header: `PCGWaitLandscapeReady.h`

Used to wait until the landscape is done updating anything.

### `unreal.PCGWaitSettings`
Inherits: `PCGSettings` | Header: `PCGWait.h`

Simple node to wait some amount of time and/or some amount of frames. Simply forwards inputs.

**Properties** (4):
  - `end_wait_when_all_conditions_are_met`: `bool` — [Read-Write] Controls whether all conditions are needed or any condition is sufficient to end the wa...
  - `wait_time_in_engine_frames`: `int` — [Read-Write] (int64)
  - `wait_time_in_render_frames`: `int` — [Read-Write] (int64)
  - `wait_time_in_seconds`: `float` — [Read-Write] (double)

### `unreal.PCGWorldActor`
Inherits: `Actor` | Header: `PCGWorldActor.h`

PCGWorld Actor

**Methods** (1):
  - `bp_get_pcg_grid_size()` -> `int64` — BP Get PCGGrid Size

**Properties** (3):
  - `enable_world_partition_generation_sources`: `bool` — [Read-Write] Allows World Partition streaming sources to act as Runtime Generation Sources. (bool)
  - `landscape_cache_object`: `PCGLandscapeCache` [Read-Only] — [Read-Only] Contains all the PCG data required to query the landscape complete. Serialized in cooked...
  - `treat_editor_viewport_as_generation_source`: `bool` — [Read-Write] Allows any currently active editor viewport to act as a Runtime Generation Source. (boo...

### `unreal.PCGWorldQuerySettings`
Inherits: `PCGSettings` | Header: `PCGWorldQuery.h`

PCGWorld Query Settings

**Properties** (1):
  - `query_params`: `PCGWorldVolumetricQueryParams` — [Read-Write] (PCGWorldVolumetricQueryParams)

### `unreal.PCGWorldRaycastElementSettings`
Inherits: `PCGSettings` | Header: `PCGWorldRaycast.h`

Casts rays from provided points along a given direction and transform points to the impact point.

**Properties** (13):
  - `collision_shape`: `PCGCollisionShape` — [Read-Write] Parameters for either using a line trace or specifying a collision shape. (PCGCollision...
  - `end_point_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] The selected attribute determines the ray terminal point. (PCGAttributePropertyInputSel...
  - `keep_original_point_on_miss`: `bool` — [Read-Write] Will keep the original points at their location if the raycast misses or if the hit res...
  - `origin_input_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] The selected attribute determines the ray origin. (PCGAttributePropertyInputSelector)
  - `override_ray_directions`: `bool` — [Read-Write] Use a selected attribute as the ray direction. (bool)
  - `override_ray_lengths`: `bool` — [Read-Write] Use a selected attribute as the ray length. (bool)
  - `ray_direction`: `Vector` — [Read-Write] A ray direction that will be used for all raycasts. (Vector)
  - `ray_direction_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] The selected attribute determines the ray direction. (PCGAttributePropertyInputSelector...
  - `ray_length`: `float` — [Read-Write] A ray length that will be used for all raycasts. (double)
  - `ray_length_attribute`: `PCGAttributePropertyInputSelector` — [Read-Write] The selected attribute determines the ray length. (PCGAttributePropertyInputSelector)
  - `raycast_mode`: `PCGWorldRaycastMode` — [Read-Write] Determines how the rayâs direction and distance will be calculated. (PCGWorldRaycastM...
  - `unbounded`: `bool` — [Read-Write] If no Bounding Shape input is provided, the actor bounds are used to limit the sample g...
  - `world_query_params`: `PCGWorldRaycastQueryParams` — [Read-Write] World ray trace parameters. (PCGWorldRaycastQueryParams)

### `unreal.PCGWorldRayHitData`
Inherits: `PCGSurfaceData` | Header: `PCGWorldData.h`

Executes collision queries against world collision.

**Properties** (2):
  - `collision_shape`: `PCGCollisionShape` — [Read-Write] Parameters for either using a line trace or specifying a collision shape for a sweep. (...
  - `query_params`: `PCGWorldRayHitQueryParams` — [Read-Write] (PCGWorldRayHitQueryParams)

### `unreal.PCGWorldRayHitSettings`
Inherits: `PCGSettings` | Header: `PCGWorldQuery.h`

PCGWorld Ray Hit Settings

**Properties** (2):
  - `collision_shape`: `PCGCollisionShape` — [Read-Write] Parameters for either using a line trace or specifying a collision shape for a sweep. (...
  - `query_params`: `PCGWorldRayHitQueryParams` — [Read-Write] (PCGWorldRayHitQueryParams)

### `unreal.PCGWorldVolumetricData`
Inherits: `PCGVolumeData` | Header: `PCGWorldData.h`

Queries volume for presence of world collision or not. Can be used to voxelize environment.

**Properties** (1):
  - `query_params`: `PCGWorldVolumetricQueryParams` — [Read-Write] (PCGWorldVolumetricQueryParams)

### `unreal.DeterminismLevel`
Inherits: `EnumBase` | Header: `PCGDeterminismTestsCommon.h`

This will include multiple values of different meanings, but we use an enum to facilitate data passing

**Properties** (7):
  - `BASIC`: `DeterminismLevel = Ellipsis` — 1
  - `DETERMINISTIC`: `DeterminismLevel = Ellipsis` — 4
  - `NONE`: `DeterminismLevel = Ellipsis` — 0
  - `NO_DETERMINISM`: `DeterminismLevel = Ellipsis` — 0
  - `ORDER_CONSISTENT`: `DeterminismLevel = Ellipsis` — 3
  - `ORDER_INDEPENDENT`: `DeterminismLevel = Ellipsis` — 4
  - `ORDER_ORTHOGONAL`: `DeterminismLevel = Ellipsis` — 2

### `unreal.PCGActorFilter`
Inherits: `EnumBase` | Header: `PCGActorSelector.h`

EPCGActor Filter

**Properties** (6):
  - `ALL_WORLD_ACTORS`: `PCGActorFilter = Ellipsis` — All actors in world. 3
  - `FROM_INPUT`: `PCGActorFilter = Ellipsis` — Consider only the provided list of actors 5
  - `ORIGINAL`: `PCGActorFilter = Ellipsis` — The source PCG actor (rather than the generated partition actor). 4
  - `PARENT`: `PCGActorFilter = Ellipsis` — The parent of this actor in the hierarchy. 1
  - `ROOT`: `PCGActorFilter = Ellipsis` — The top most parent of this actor in the hierarchy. 2
  - `SELF`: `PCGActorFilter = Ellipsis` — This actor (either the original PCG actor or the partition actor if partitioning is enabled). 0

### `unreal.PCGActorSelection`
Inherits: `EnumBase` | Header: `PCGActorSelector.h`

EPCGActor Selection

**Properties** (2):
  - `BY_CLASS`: `PCGActorSelection = Ellipsis` — 2
  - `BY_TAG`: `PCGActorSelection = Ellipsis` — 0

### `unreal.PCGApplyHierarchyOption`
Inherits: `EnumBase` | Header: `PCGApplyHierarchy.h`

EPCGApply Hierarchy Option

**Properties** (4):
  - `ALWAYS`: `PCGApplyHierarchyOption = Ellipsis` — 0
  - `NEVER`: `PCGApplyHierarchyOption = Ellipsis` — 1
  - `OPT_IN_BY_ATTRIBUTE`: `PCGApplyHierarchyOption = Ellipsis` — 2
  - `OPT_OUT_BY_ATTRIBUTE`: `PCGApplyHierarchyOption = Ellipsis` — 3

### `unreal.PCGAttachOptions`
Inherits: `EnumBase` | Header: `PCGCommon.h`

EPCGAttach Options

**Properties** (5):
  - `ATTACHED`: `PCGAttachOptions = Ellipsis` — Actor will be attached to the target actor in the given node 1
  - `IN_FOLDER`: `PCGAttachOptions = Ellipsis` — Actor will be placed in an actor folder containing the name of the target actor. 2
  - `IN_GENERATED_FOLDER`: `PCGAttachOptions = Ellipsis` — Actor will be placed in the PCG_Generated folder. 4
  - `IN_GRAPH_FOLDER`: `PCGAttachOptions = Ellipsis` — Actor will be placed in a folder named after the top graph it was generated from. 3
  - `NOT_ATTACHED`: `PCGAttachOptions = Ellipsis` — Actor will not be attached to the target actor nor placed in an actor folder 0

### `unreal.PCGAttractMode`
Inherits: `EnumBase` | Header: `PCGAttractElement.h`

EPCGAttract Mode

**Properties** (4):
  - `CLOSEST`: `PCGAttractMode = Ellipsis` — Attract to nearest target. 0
  - `FROM_INDEX`: `PCGAttractMode = Ellipsis` — Attracts to a fixed target point based on an attribute. 3
  - `MAX_ATTRIBUTE`: `PCGAttractMode = Ellipsis` — Attract to the maximum target inside the search radius. 2
  - `MIN_ATTRIBUTE`: `PCGAttractMode = Ellipsis` — Attract to the minimum target inside the search radius. 1

### `unreal.PCGAttributeFilterOperation`
Inherits: `EnumBase` | Header: `PCGDeleteAttributesElement.h`

EPCGAttribute Filter Operation

**Properties** (2):
  - `DELETE_SELECTED_ATTRIBUTES`: `PCGAttributeFilterOperation = Ellipsis` — 1
  - `KEEP_SELECTED_ATTRIBUTES`: `PCGAttributeFilterOperation = Ellipsis` — 0

### `unreal.PCGAttributeFilterOperator`
Inherits: `EnumBase` | Header: `PCGAttributeFilter.h`

EPCGAttribute Filter Operator

**Properties** (8):
  - `EQUAL`: `PCGAttributeFilterOperator = Ellipsis` — 4
  - `GREATER`: `PCGAttributeFilterOperator = Ellipsis` — 0
  - `GREATER_OR_EQUAL`: `PCGAttributeFilterOperator = Ellipsis` — 1
  - `LESSER`: `PCGAttributeFilterOperator = Ellipsis` — 2
  - `LESSER_OR_EQUAL`: `PCGAttributeFilterOperator = Ellipsis` — 3
  - `MATCHES`: `PCGAttributeFilterOperator = Ellipsis` — 8
  - `NOT_EQUAL`: `PCGAttributeFilterOperator = Ellipsis` — 5
  - `SUBSTRING`: `PCGAttributeFilterOperator = Ellipsis` — 7

### `unreal.PCGAttributeInheritanceMode`
Inherits: `EnumBase` | Header: `PCGPinPropertiesGPU.h`

Method for inheriting attribute data from input pins.

**Properties** (2):
  - `COPY_ATTRIBUTE_SETUP`: `PCGAttributeInheritanceMode = Ellipsis` — Take attribute names and types from initialization pins. Pins declared first will take priority duri...
  - `NONE`: `PCGAttributeInheritanceMode = Ellipsis` — No attributes inherited from initialization pins. 0

### `unreal.PCGAttributeNoiseMode`
Inherits: `EnumBase` | Header: `PCGAttributeNoise.h`

EPCGAttribute Noise Mode

**Properties** (5):
  - `ADD`: `PCGAttributeNoiseMode = Ellipsis` — 3
  - `MAXIMUM`: `PCGAttributeNoiseMode = Ellipsis` — 2
  - `MINIMUM`: `PCGAttributeNoiseMode = Ellipsis` — 1
  - `MULTIPLY`: `PCGAttributeNoiseMode = Ellipsis` — 4
  - `SET`: `PCGAttributeNoiseMode = Ellipsis` — 0

### `unreal.PCGAttributePropertySelection`
Inherits: `EnumBase` | Header: `PCGAttributePropertySelector.h`

EPCGAttribute Property Selection

**Properties** (3):
  - `ATTRIBUTE`: `PCGAttributePropertySelection = Ellipsis` — 0
  - `EXTRA_PROPERTY`: `PCGAttributePropertySelection = Ellipsis` — 2
  - `PROPERTY`: `PCGAttributePropertySelection = Ellipsis` — 3

### `unreal.PCGAttributeReduceOperation`
Inherits: `EnumBase` | Header: `PCGAttributeReduceElement.h`

EPCGAttribute Reduce Operation

**Properties** (5):
  - `AVERAGE`: `PCGAttributeReduceOperation = Ellipsis` — 0
  - `JOIN`: `PCGAttributeReduceOperation = Ellipsis` — 4
  - `MAX`: `PCGAttributeReduceOperation = Ellipsis` — 1
  - `MIN`: `PCGAttributeReduceOperation = Ellipsis` — 2
  - `SUM`: `PCGAttributeReduceOperation = Ellipsis` — 3

### `unreal.PCGAttributeSelectAxis`
Inherits: `EnumBase` | Header: `PCGAttributeSelectElement.h`

EPCGAttribute Select Axis

**Properties** (5):
  - `CUSTOM_AXIS`: `PCGAttributeSelectAxis = Ellipsis` — 4
  - `W`: `PCGAttributeSelectAxis = Ellipsis` — 3
  - `X`: `PCGAttributeSelectAxis = Ellipsis` — 0
  - `Y`: `PCGAttributeSelectAxis = Ellipsis` — 1
  - `Z`: `PCGAttributeSelectAxis = Ellipsis` — 2

### `unreal.PCGAttributeSelectOperation`
Inherits: `EnumBase` | Header: `PCGAttributeSelectElement.h`

EPCGAttribute Select Operation

**Properties** (3):
  - `MAX`: `PCGAttributeSelectOperation = Ellipsis` — 1
  - `MEDIAN`: `PCGAttributeSelectOperation = Ellipsis` — 2
  - `MIN`: `PCGAttributeSelectOperation = Ellipsis` — 0

### `unreal.PCGBlurElementMode`
Inherits: `EnumBase` | Header: `PCGBlurElement.h`

EPCGBlur Element Mode

**Properties** (3):
  - `CONSTANT`: `PCGBlurElementMode = Ellipsis` — Same weight for each point, which will be 1 / N, N being the number of points found in the given dis...
  - `GAUSSIAN`: `PCGBlurElementMode = Ellipsis` — Weight will be a gaussian distribution. 2
  - `LINEAR`: `PCGBlurElementMode = Ellipsis` — Weight for Point will be 1 - Dist(Point, Center) / SearchDistance. 1

### `unreal.PCGBoundsModifierMode`
Inherits: `EnumBase` | Header: `PCGBoundsModifier.h`

EPCGBounds Modifier Mode

**Properties** (5):
  - `INCLUDE`: `PCGBoundsModifierMode = Ellipsis` — 2
  - `INTERSECT`: `PCGBoundsModifierMode = Ellipsis` — 1
  - `SCALE`: `PCGBoundsModifierMode = Ellipsis` — 4
  - `SET`: `PCGBoundsModifierMode = Ellipsis` — 0
  - `TRANSLATE`: `PCGBoundsModifierMode = Ellipsis` — 3

### `unreal.PCGChangeType`
Inherits: `EnumBase` | Header: `PCGCommon.h`

EPCGChange Type

**Properties** (10):
  - `COSMETIC`: `PCGChangeType = Ellipsis` — 1
  - `EDGE`: `PCGChangeType = Ellipsis` — 8
  - `GENERATION_GRID`: `PCGChangeType = Ellipsis` — Anything related to generation grids - changing grid size or adding/removing grid size nodes. 64
  - `GRAPH_CUSTOMIZATION`: `PCGChangeType = Ellipsis` — Changes in the graph customization that will impact the editor. 256
  - `INPUT`: `PCGChangeType = Ellipsis` — 4
  - `NODE`: `PCGChangeType = Ellipsis` — 16
  - `NONE`: `PCGChangeType = Ellipsis` — 0
  - `SETTINGS`: `PCGChangeType = Ellipsis` — 2
  - `SHADER_SOURCE`: `PCGChangeType = Ellipsis` — Change to any shader source code. 128
  - `STRUCTURAL`: `PCGChangeType = Ellipsis` — 32

### `unreal.PCGClusterAlgorithm`
Inherits: `EnumBase` | Header: `PCGClusterElement.h`

EPCGCluster Algorithm

**Properties** (2):
  - `EM`: `PCGClusterAlgorithm = Ellipsis` — Expectation-Maximization - Categorizes points by using a Gaussian Mixture Model. 1
  - `K_MEANS`: `PCGClusterAlgorithm = Ellipsis` — K-Means - Categorizes points by their distance from a predefined number of continuously updated cent...

### `unreal.PCGCollapseComparisonMode`
Inherits: `EnumBase` | Header: `PCGCollapsePoints.h`

EPCGCollapse Comparison Mode

**Properties** (2):
  - `CENTER`: `PCGCollapseComparisonMode = Ellipsis` — Uses point centers (e.g. center of bounds) for distance testing, and ignore bounds otherwise. 1
  - `POSITION`: `PCGCollapseComparisonMode = Ellipsis` — Uses point position only for distance testing, regardless of bounds. 0

### `unreal.PCGCollapseMode`
Inherits: `EnumBase` | Header: `PCGCollapsePoints.h`

EPCGCollapse Mode

**Properties** (1):
  - `PAIRWISE_CLOSEST`: `PCGCollapseMode = Ellipsis` — At every iteration, will select exclusive pairs that are closest. 0

### `unreal.PCGCollapseVisitOrder`
Inherits: `EnumBase` | Header: `PCGCollapsePoints.h`

EPCGCollapse Visit Order

**Properties** (4):
  - `MAX_ATTRIBUTE`: `PCGCollapseVisitOrder = Ellipsis` — Will create pairs according to attribute value order (maximum value first). 3
  - `MIN_ATTRIBUTE`: `PCGCollapseVisitOrder = Ellipsis` — Will create pairs according to attribute value order (minimum value first). 2
  - `ORDERED`: `PCGCollapseVisitOrder = Ellipsis` — Will create pairs based on original point order. 0
  - `RANDOM`: `PCGCollapseVisitOrder = Ellipsis` — Will generate a random ordering that will drive pair order creation. 1

### `unreal.PCGCollisionQueryFlag`
Inherits: `EnumBase` | Header: `PCGCollisionWrapperData.h`

EPCGCollision Query Flag

**Properties** (4):
  - `COMPLEX`: `PCGCollisionQueryFlag = Ellipsis` — 1
  - `COMPLEX_FIRST`: `PCGCollisionQueryFlag = Ellipsis` — 3
  - `SIMPLE`: `PCGCollisionQueryFlag = Ellipsis` — 0
  - `SIMPLE_FIRST`: `PCGCollisionQueryFlag = Ellipsis` — 2

### `unreal.PCGCollisionShapeType`
Inherits: `EnumBase` | Header: `PCGCollisionShape.h`

EPCGCollision Shape Type

**Properties** (4):
  - `BOX`: `PCGCollisionShapeType = Ellipsis` — 1
  - `CAPSULE`: `PCGCollisionShapeType = Ellipsis` — 3
  - `LINE`: `PCGCollisionShapeType = Ellipsis` — 0
  - `SPHERE`: `PCGCollisionShapeType = Ellipsis` — 2

### `unreal.PCGComponentGenerationTrigger`
Inherits: `EnumBase` | Header: `PCGComponent.h`

EPCGComponent Generation Trigger

**Properties** (3):
  - `GENERATE_AT_RUNTIME`: `PCGComponentGenerationTrigger = Ellipsis` — Generates only when scheduled by the Runtime Generation Scheduler. 2
  - `GENERATE_ON_DEMAND`: `PCGComponentGenerationTrigger = Ellipsis` — Generates only when requested (e.g. via Blueprint). 1
  - `GENERATE_ON_LOAD`: `PCGComponentGenerationTrigger = Ellipsis` — Generates only when the component is loaded into the level. 0

### `unreal.PCGComponentInput`
Inherits: `EnumBase` | Header: `PCGComponent.h`

EPCGComponent Input

**Properties** (3):
  - `ACTOR`: `PCGComponentInput = Ellipsis` — 0
  - `LANDSCAPE`: `PCGComponentInput = Ellipsis` — Generates based on owning actor 1
  - `OTHER`: `PCGComponentInput = Ellipsis` — 2

### `unreal.PCGComponentSelection`
Inherits: `EnumBase` | Header: `PCGActorSelector.h`

EPCGComponent Selection

**Properties** (2):
  - `BY_CLASS`: `PCGComponentSelection = Ellipsis` — 1
  - `BY_TAG`: `PCGComponentSelection = Ellipsis` — 0

### `unreal.PCGControlFlowSelectionMode`
Inherits: `EnumBase` | Header: `PCGControlFlow.h`

EPCGControl Flow Selection Mode

**Properties** (3):
  - `ENUM`: `PCGControlFlowSelectionMode = Ellipsis` — 1
  - `INTEGER`: `PCGControlFlowSelectionMode = Ellipsis` — 0
  - `STRING`: `PCGControlFlowSelectionMode = Ellipsis` — 2

### `unreal.PCGControlPointFuseMode`
Inherits: `EnumBase` | Header: `PCGCleanSpline.h`

EPCGControl Point Fuse Mode

**Properties** (4):
  - `AUTO`: `PCGControlPointFuseMode = Ellipsis` — Will generally keep the second of both control points, except keep the first when it would otherwise...
  - `KEEP_FIRST`: `PCGControlPointFuseMode = Ellipsis` — Keep the first of two control points. 0
  - `KEEP_SECOND`: `PCGControlPointFuseMode = Ellipsis` — Keep the second of two control points. 1
  - `MERGE`: `PCGControlPointFuseMode = Ellipsis` — Fuse the two control points into a new control point, located halfway between the original two. 2

### `unreal.PCGCoordinateSpace`
Inherits: `EnumBase` | Header: `PCGCommon.h`

Describes space referential for operations that create data

**Properties** (3):
  - `LOCAL_COMPONENT`: `PCGCoordinateSpace = Ellipsis` — 2
  - `ORIGINAL_COMPONENT`: `PCGCoordinateSpace = Ellipsis` — 1
  - `WORLD`: `PCGCoordinateSpace = Ellipsis` — 0

### `unreal.PCGCopyAttributesOperation`
Inherits: `EnumBase` | Header: `PCGCopyAttributes.h`

EPCGCopy Attributes Operation

**Properties** (3):
  - `COPY_EACH_SOURCE_ON_EVERY_TARGET`: `PCGCopyAttributesOperation = Ellipsis` — M operation. If there are SourceA/SourceB and TargetA/TagretB, we will have those copies: SourceA ->...
  - `COPY_EACH_SOURCE_TO_EACH_TARGET_RESPECTIVELY`: `PCGCopyAttributesOperation = Ellipsis` — N operation, N:1 or 1:N Operation. If there are SourceA/SourceB and TargetA/TagretB, SourceA will be...
  - `MERGE_SOURCES_AND_COPY_TO_ALL_TARGETS`: `PCGCopyAttributesOperation = Ellipsis` — M operation. If there are SourceA/SourceB and TargetA/TagretB, SourceA and SourceB will be copied to...

### `unreal.PCGCopyPointsInheritanceMode`
Inherits: `EnumBase` | Header: `PCGCopyPoints.h`

EPCGCopy Points Inheritance Mode

**Properties** (3):
  - `RELATIVE`: `PCGCopyPointsInheritanceMode = Ellipsis` — 0
  - `SOURCE`: `PCGCopyPointsInheritanceMode = Ellipsis` — 1
  - `TARGET`: `PCGCopyPointsInheritanceMode = Ellipsis` — 2

### `unreal.PCGCopyPointsMetadataInheritanceMode`
Inherits: `EnumBase` | Header: `PCGCopyPoints.h`

EPCGCopy Points Metadata Inheritance Mode

**Properties** (5):
  - `NONE`: `PCGCopyPointsMetadataInheritanceMode = Ellipsis` — Points will have no metadata. 4
  - `SOURCE_FIRST`: `PCGCopyPointsMetadataInheritanceMode = Ellipsis` — Points will inherit from source metadata and apply only unique attributes from target. 0
  - `SOURCE_ONLY`: `PCGCopyPointsMetadataInheritanceMode = Ellipsis` — Points will inherit metadata only from the source. 2
  - `TARGET_FIRST`: `PCGCopyPointsMetadataInheritanceMode = Ellipsis` — Points will inherit from target metadata and apply only unique attributes from source. 1
  - `TARGET_ONLY`: `PCGCopyPointsMetadataInheritanceMode = Ellipsis` — Points will inherit metadata only from the target. 3

### `unreal.PCGCopyPointsTagInheritanceMode`
Inherits: `EnumBase` | Header: `PCGCopyPoints.h`

EPCGCopy Points Tag Inheritance Mode

**Properties** (3):
  - `BOTH`: `PCGCopyPointsTagInheritanceMode = Ellipsis` — 0
  - `SOURCE`: `PCGCopyPointsTagInheritanceMode = Ellipsis` — 1
  - `TARGET`: `PCGCopyPointsTagInheritanceMode = Ellipsis` — 2

### `unreal.PCGCreateSplineMode`
Inherits: `EnumBase` | Header: `PCGCreateSpline.h`

EPCGCreate Spline Mode

**Properties** (2):
  - `CREATE_COMPONENT`: `PCGCreateSplineMode = Ellipsis` — 1
  - `CREATE_DATA_ONLY`: `PCGCreateSplineMode = Ellipsis` — 0

### `unreal.PCGCullPointsMode`
Inherits: `EnumBase` | Header: `PCGCullPointsOutsideActorBounds.h`

EPCGCull Points Mode

**Properties** (2):
  - `ORDERED`: `PCGCullPointsMode = Ellipsis` — 0
  - `UNORDERED`: `PCGCullPointsMode = Ellipsis` — 1

### `unreal.PCGDataCountMode`
Inherits: `EnumBase` | Header: `PCGPinPropertiesGPU.h`

Method for computing data count.

**Properties** (2):
  - `FIXED`: `PCGDataCountMode = Ellipsis` — 1
  - `FROM_INPUT_DATA`: `PCGDataCountMode = Ellipsis` — 0

### `unreal.PCGDataLayerSource`
Inherits: `EnumBase` | Header: `PCGDataLayerHelpers.h`

EPCGData Layer Source

**Properties** (2):
  - `DATA_LAYER_REFERENCES`: `PCGDataLayerSource = Ellipsis` — 1
  - `SELF`: `PCGDataLayerSource = Ellipsis` — 0

### `unreal.PCGDataMultiplicity`
Inherits: `EnumBase` | Header: `PCGPinPropertiesGPU.h`

Method for combining two or more data counts.

**Properties** (2):
  - `CARTESIAN_PRODUCT`: `PCGDataMultiplicity = Ellipsis` — If there are two input pins with N and M data items respectively, the output will have NxM data item...
  - `PAIRWISE`: `PCGDataMultiplicity = Ellipsis` — A data item will be produced for each pair/tuple/etc of input data items across the input pins. Requ...

### `unreal.PCGDataType`
Inherits: `EnumBase` | Header: `PCGCommon.h`

Bitmask containing the various data types supported in PCG. Note that this enum cannot be a blueprint type because enums have to be uint8 for blueprint, and we already use more than 8 bits in the bitm...

**Properties** (20):
  - `ANY`: `PCGDataType = Ellipsis` — 1073741823
  - `BASE_TEXTURE`: `PCGDataType = Ellipsis` — Common base type for both textures and render targets. 96
  - `CONCRETE`: `PCGDataType = Ellipsis` — Simple concrete data. 5630
  - `DYNAMIC_MESH`: `PCGDataType = Ellipsis` — 1024
  - `LANDSCAPE`: `PCGDataType = Ellipsis` — 16
  - `LANDSCAPE_SPLINE`: `PCGDataType = Ellipsis` — 8
  - `OTHER`: `PCGDataType = Ellipsis` — 536870912
  - `PARAM`: `PCGDataType = Ellipsis` — 134217728
  - `POINT`: `PCGDataType = Ellipsis` — 2
  - `POINT_OR_PARAM`: `PCGDataType = Ellipsis` — Combination of Param and Point, necessary for named-based serialization of enums. 134217730
  - `POLY_LINE`: `PCGDataType = Ellipsis` — 12
  - `PRIMITIVE`: `PCGDataType = Ellipsis` — 256
  - `RENDER_TARGET`: `PCGDataType = Ellipsis` — 64
  - `SPATIAL`: `PCGDataType = Ellipsis` — Combinations of concrete data and/or boolean operations. 6142
  - `SPLINE`: `PCGDataType = Ellipsis` — 4
  - `STATIC_MESH_RESOURCE`: `PCGDataType = Ellipsis` — 2048
  - `SURFACE`: `PCGDataType = Ellipsis` — 4208
  - `TEXTURE`: `PCGDataType = Ellipsis` — 32
  - `VIRTUAL_TEXTURE`: `PCGDataType = Ellipsis` — VirtualTexture is not a subtype of BaseTexture because they share no common functionality, particula...
  - `VOLUME`: `PCGDataType = Ellipsis` — 128

### `unreal.PCGDebugVisScaleMethod`
Inherits: `EnumBase` | Header: `PCGDebug.h`

EPCGDebug Vis Scale Method

**Properties** (3):
  - `ABSOLUTE`: `PCGDebugVisScaleMethod = Ellipsis` — 1
  - `EXTENTS`: `PCGDebugVisScaleMethod = Ellipsis` — 2
  - `RELATIVE`: `PCGDebugVisScaleMethod = Ellipsis` — 0

### `unreal.PCGDensityMergeOperation`
Inherits: `EnumBase` | Header: `PCGCommon.h`

EPCGDensity Merge Operation

**Properties** (8):
  - `ADD`: `PCGDensityMergeOperation = Ellipsis` — D = A + B 4
  - `DIVIDE`: `PCGDensityMergeOperation = Ellipsis` — D = A / B 7
  - `IGNORE`: `PCGDensityMergeOperation = Ellipsis` — D = A 1
  - `MAXIMUM`: `PCGDensityMergeOperation = Ellipsis` — D = max(A, B) 3
  - `MINIMUM`: `PCGDensityMergeOperation = Ellipsis` — D = min(A, B) 2
  - `MULTIPLY`: `PCGDensityMergeOperation = Ellipsis` — D = A * B 6
  - `SET`: `PCGDensityMergeOperation = Ellipsis` — D = B 0
  - `SUBTRACT`: `PCGDensityMergeOperation = Ellipsis` — D = A - B 5

### `unreal.PCGDifferenceDensityFunction`
Inherits: `EnumBase` | Header: `PCGDifferenceData.h`

EPCGDifference Density Function

**Properties** (3):
  - `BINARY`: `PCGDifferenceDensityFunction = Ellipsis` — 2
  - `CLAMPED_SUBSTRACTION`: `PCGDifferenceDensityFunction = Ellipsis` — 1
  - `MINIMUM`: `PCGDifferenceDensityFunction = Ellipsis` — 0

### `unreal.PCGDifferenceMode`
Inherits: `EnumBase` | Header: `PCGDifferenceData.h`

EPCGDifference Mode

**Properties** (3):
  - `CONTINUOUS`: `PCGDifferenceMode = Ellipsis` — 1
  - `DISCRETE`: `PCGDifferenceMode = Ellipsis` — 2
  - `INFERRED`: `PCGDifferenceMode = Ellipsis` — 0

### `unreal.PCGDispatchThreadCount`
Inherits: `EnumBase` | Header: `PCGCustomHLSL.h`

Total number of threads that will be dispatched for this kernel.

**Properties** (3):
  - `FIXED`: `PCGDispatchThreadCount = Ellipsis` — 1
  - `FROM_FIRST_OUTPUT_PIN`: `PCGDispatchThreadCount = Ellipsis` — One thread per pin data element. 0
  - `FROM_PRODUCT_OF_INPUT_PINS`: `PCGDispatchThreadCount = Ellipsis` — Dispatches a thread per element in the product of one or more pins. So if there are 4 data elements ...

### `unreal.PCGDistanceShape`
Inherits: `EnumBase` | Header: `PCGDistance.h`

PCGDistance Shape

**Properties** (3):
  - `BOX_BOUNDS`: `PCGDistanceShape = Ellipsis` — 1
  - `CENTER`: `PCGDistanceShape = Ellipsis` — 2
  - `SPHERE_BOUNDS`: `PCGDistanceShape = Ellipsis` — 0

### `unreal.PCGEditorDirtyMode`
Inherits: `EnumBase` | Header: `PCGCommon.h`

EPCGEditor Dirty Mode

**Properties** (3):
  - `LOAD_AS_PREVIEW`: `PCGEditorDirtyMode = Ellipsis` — Acts as the normal editing mode until the next load of the component, at which state it acts as-if-t...
  - `NORMAL`: `PCGEditorDirtyMode = Ellipsis` — Normal editing mode where generation changes (generation, cleanup) dirty the component and its resou...
  - `PREVIEW`: `PCGEditorDirtyMode = Ellipsis` — Editing mode where generation changes (generation, cleanup, resources) on the component will not tri...

### `unreal.PCGElementCountMode`
Inherits: `EnumBase` | Header: `PCGPinPropertiesGPU.h`

Method for computing element count.

**Properties** (2):
  - `FIXED`: `PCGElementCountMode = Ellipsis` — 1
  - `FROM_INPUT_DATA`: `PCGElementCountMode = Ellipsis` — 0

### `unreal.PCGElementMultiplicity`
Inherits: `EnumBase` | Header: `PCGPinPropertiesGPU.h`

Method for combining two or more element counts.

**Properties** (2):
  - `PRODUCT`: `PCGElementMultiplicity = Ellipsis` — Element count will be the product of the elements in each pair/tuple/etc of input data. 0
  - `SUM`: `PCGElementMultiplicity = Ellipsis` — Element count will be the sum of the elements in each pair/tuple/etc of input data. 1

### `unreal.PCGExclusiveDataType`
Inherits: `EnumBase` | Header: `PCGCommon.h`

As discussed just before, a parallel version for âexclusiveâ (as in only type) of the EPCGDataType enum. Needed for blueprint compatibility.

**Properties** (19):
  - `ANY`: `PCGExclusiveDataType = Ellipsis` — 19
  - `CONCRETE`: `PCGExclusiveDataType = Ellipsis` — 13
  - `DYNAMIC_MESH`: `PCGExclusiveDataType = Ellipsis` — 21
  - `LANDSCAPE`: `PCGExclusiveDataType = Ellipsis` — 5
  - `LANDSCAPE_SPLINE`: `PCGExclusiveDataType = Ellipsis` — 3
  - `OTHER`: `PCGExclusiveDataType = Ellipsis` — 18
  - `PARAM`: `PCGExclusiveDataType = Ellipsis` — 16
  - `POINT`: `PCGExclusiveDataType = Ellipsis` — 1
  - `POINT_OR_PARAM`: `PCGExclusiveDataType = Ellipsis` — 20
  - `POLY_LINE`: `PCGExclusiveDataType = Ellipsis` — 4
  - `PRIMITIVE`: `PCGExclusiveDataType = Ellipsis` — 12
  - `RENDER_TARGET`: `PCGExclusiveDataType = Ellipsis` — 7
  - `SPATIAL`: `PCGExclusiveDataType = Ellipsis` — 15
  - `SPLINE`: `PCGExclusiveDataType = Ellipsis` — 2
  - `STATIC_MESH_RESOURCE`: `PCGExclusiveDataType = Ellipsis` — 22
  - `SURFACE`: `PCGExclusiveDataType = Ellipsis` — 10
  - `TEXTURE`: `PCGExclusiveDataType = Ellipsis` — 6
  - `VIRTUAL_TEXTURE`: `PCGExclusiveDataType = Ellipsis` — 8
  - `VOLUME`: `PCGExclusiveDataType = Ellipsis` — 11

### `unreal.PCGExportAttributesFormat`
Inherits: `EnumBase` | Header: `PCGExportSelectedAttributes.h`

EPCGExport Attributes Format

**Properties** (2):
  - `BINARY`: `PCGExportAttributesFormat = Ellipsis` — Export binary data to file using the Unreal archive system. 0
  - `JSON`: `PCGExportAttributesFormat = Ellipsis` — Output the asset values into a JSON format. 1

### `unreal.PCGExportAttributesLayout`
Inherits: `EnumBase` | Header: `PCGExportSelectedAttributes.h`

EPCGExport Attributes Layout

**Properties** (2):
  - `BY_ATTRIBUTE`: `PCGExportAttributesLayout = Ellipsis` — Use the attributes as the main data object. Each attribute grouping will contain the element values ...
  - `BY_ELEMENT`: `PCGExportAttributesLayout = Ellipsis` — Use the elements as the main data object. Each element contains all its attributes. 0

### `unreal.PCGExtraProperties`
Inherits: `EnumBase` | Header: `PCGAttributePropertySelector.h`

EPCGExtra Properties

**Properties** (1):
  - `INDEX`: `PCGExtraProperties = Ellipsis` — 0

### `unreal.PCGFilterByTagOperation`
Inherits: `EnumBase` | Header: `PCGFilterByTag.h`

EPCGFilter by Tag Operation

**Properties** (2):
  - `KEEP_TAGGED`: `PCGFilterByTagOperation = Ellipsis` — 0
  - `REMOVE_TAGGED`: `PCGFilterByTagOperation = Ellipsis` — 1

### `unreal.PCGGenerateSeedSource`
Inherits: `EnumBase` | Header: `PCGGenerateSeedElement.h`

EPCGGenerate Seed Source

**Properties** (3):
  - `HASH_EACH_SOURCE_ATTRIBUTE`: `PCGGenerateSeedSource = Ellipsis` — Hashes each value in a source attribute to determine the target seeds. Can be used to differentiate ...
  - `HASH_STRING_CONSTANT`: `PCGGenerateSeedSource = Ellipsis` — Creates a target seed by combining a stringâs hash value and the previous seed value. Quick, human...
  - `RANDOM_STREAM`: `PCGGenerateSeedSource = Ellipsis` — Creates a random stream using the nodeâs seed, and generates new seeds from that. Quick solution f...

### `unreal.PCGGenerationStatus`
Inherits: `EnumBase` | Header: `PCGCommon.h`

EPCGGeneration Status

**Properties** (2):
  - `ABORTED`: `PCGGenerationStatus = Ellipsis` — 1
  - `COMPLETED`: `PCGGenerationStatus = Ellipsis` — 0

### `unreal.PCGGetDataFromActorMode`
Inherits: `EnumBase` | Header: `PCGDataFromActor.h`

EPCGGet Data from Actor Mode

**Properties** (7):
  - `GET_ACTOR_REFERENCE`: `PCGGetDataFromActorMode = Ellipsis` — Produces one entry per actor with only the actor reference. 5
  - `GET_COMPONENTS_REFERENCE`: `PCGGetDataFromActorMode = Ellipsis` — Produces one entry per component within the actor selection. 6
  - `GET_DATA_FROM_PCG_COMPONENT`: `PCGGetDataFromActorMode = Ellipsis` — Copy generated output from other PCG components on the found actor(s). 3
  - `GET_DATA_FROM_PCG_COMPONENT_OR_PARSE_COMPONENTS`: `PCGGetDataFromActorMode = Ellipsis` — Attempts to copy generated output from other PCG components on the found actor(s), otherwise, falls ...
  - `GET_DATA_FROM_PROPERTY`: `PCGGetDataFromActorMode = Ellipsis` — Gets a data collection from an actor property. 2
  - `GET_SINGLE_POINT`: `PCGGetDataFromActorMode = Ellipsis` — Produces a single point per actor with the actor transform and bounds. 1
  - `PARSE_ACTOR_COMPONENTS`: `PCGGetDataFromActorMode = Ellipsis` — Parse the found actor(s) for relevant components such as Primitives, Splines, and Volumes. 0

### `unreal.PCGGetExecutionContextMode`
Inherits: `EnumBase` | Header: `PCGGetExecutionContext.h`

EPCGGet Execution Context Mode

**Properties** (6):
  - `IS_EDITOR`: `PCGGetExecutionContextMode = Ellipsis` — Returns whether the execution happens in the editor (not in PIE). 0
  - `IS_LOCAL`: `PCGGetExecutionContextMode = Ellipsis` — Returns whether the executing context is partitioned (in opposition to original). 3
  - `IS_ORIGINAL`: `PCGGetExecutionContextMode = Ellipsis` — Returns whether the executing context is the original context (e.g. not partitioned). 2
  - `IS_PARTITIONED`: `PCGGetExecutionContextMode = Ellipsis` — Returns whether the executing context is the original context and that it is partitioned. 4
  - `IS_RUNTIME`: `PCGGetExecutionContextMode = Ellipsis` — Returns whether the execution happens in a runtime environment (PIE or cooked build) or not. 1
  - `IS_RUNTIME_GENERATION`: `PCGGetExecutionContextMode = Ellipsis` — Returns whether the executing context is doing runtime gneration. 5

### `unreal.PCGGraphEditorFiltering`
Inherits: `EnumBase` | Header: `PCGGraphCustomization.h`

EPCGGraph Editor Filtering

**Properties** (2):
  - `ALLOW`: `PCGGraphEditorFiltering = Ellipsis` — 0
  - `DISALLOW`: `PCGGraphEditorFiltering = Ellipsis` — 1

### `unreal.PCGHiGenGrid`
Inherits: `EnumBase` | Header: `PCGCommon.h`

Describes one or more target execution grids.

**Properties** (11):
  - `GRID1024`: `PCGHiGenGrid = Ellipsis` — 1024
  - `GRID128`: `PCGHiGenGrid = Ellipsis` — 128
  - `GRID16`: `PCGHiGenGrid = Ellipsis` — 16
  - `GRID2048`: `PCGHiGenGrid = Ellipsis` — 2048
  - `GRID256`: `PCGHiGenGrid = Ellipsis` — 256
  - `GRID32`: `PCGHiGenGrid = Ellipsis` — 32
  - `GRID4`: `PCGHiGenGrid = Ellipsis` — When adding new grids, increment PCGHiGenGrid::NumGridValues below 4 NOTE
  - `GRID512`: `PCGHiGenGrid = Ellipsis` — 512
  - `GRID64`: `PCGHiGenGrid = Ellipsis` — 64
  - `GRID8`: `PCGHiGenGrid = Ellipsis` — 8
  - `UNBOUNDED`: `PCGHiGenGrid = Ellipsis` — Should execute once rather than executing on any grid 2147483648

### `unreal.PCGHLODSource`
Inherits: `EnumBase` | Header: `PCGHLODHelpers.h`

EPCGHLODSource

**Properties** (3):
  - `REFERENCE`: `PCGHLODSource = Ellipsis` — 1
  - `SELF`: `PCGHLODSource = Ellipsis` — 0
  - `TEMPLATE`: `PCGHLODSource = Ellipsis` — 2

### `unreal.PCGIntersectionDensityFunction`
Inherits: `EnumBase` | Header: `PCGIntersectionData.h`

EPCGIntersection Density Function

**Properties** (2):
  - `MINIMUM`: `PCGIntersectionDensityFunction = Ellipsis` — Chooses the minimum of the density values. 1
  - `MULTIPLY`: `PCGIntersectionDensityFunction = Ellipsis` — Multiplies the density values and results in the product. 0

### `unreal.PCGKernelAttributeType`
Inherits: `EnumBase` | Header: `PCGDataForGPU.h`

EPCGKernel Attribute Type

**Properties** (11):
  - `BOOL`: `PCGKernelAttributeType = Ellipsis` — 1
  - `FLOAT`: `PCGKernelAttributeType = Ellipsis` — 3
  - `FLOAT2`: `PCGKernelAttributeType = Ellipsis` — 4
  - `FLOAT3`: `PCGKernelAttributeType = Ellipsis` — 5
  - `FLOAT4`: `PCGKernelAttributeType = Ellipsis` — 6
  - `INT`: `PCGKernelAttributeType = Ellipsis` — 2
  - `NAME`: `PCGKernelAttributeType = Ellipsis` — 11
  - `QUAT`: `PCGKernelAttributeType = Ellipsis` — 8
  - `ROTATOR`: `PCGKernelAttributeType = Ellipsis` — 7
  - `STRING_KEY`: `PCGKernelAttributeType = Ellipsis` — 10
  - `TRANSFORM`: `PCGKernelAttributeType = Ellipsis` — 9

### `unreal.PCGKernelType`
Inherits: `EnumBase` | Header: `PCGCustomHLSL.h`

Type of kernel allows us to make decisions about execution automatically, streamlining authoring.

**Properties** (3):
  - `CUSTOM`: `PCGKernelType = Ellipsis` — Execution thread counts and output buffer sizes configurable on node. All data read/write indices mu...
  - `POINT_GENERATOR`: `PCGKernelType = Ellipsis` — Kernel executes for fixed number of points, configurable on node. 1
  - `POINT_PROCESSOR`: `PCGKernelType = Ellipsis` — Kernel executes on each point in first input pin. 0

### `unreal.PCGLandscapeCacheSerializationContents`
Inherits: `EnumBase` | Header: `PCGLandscapeCache.h`

EPCGLandscape Cache Serialization Contents

**Properties** (3):
  - `SERIALIZE_ALL`: `PCGLandscapeCacheSerializationContents = Ellipsis` — 2
  - `SERIALIZE_ONLY_LAYER_DATA`: `PCGLandscapeCacheSerializationContents = Ellipsis` — 1
  - `SERIALIZE_ONLY_POSITIONS_AND_NORMALS`: `PCGLandscapeCacheSerializationContents = Ellipsis` — 0

### `unreal.PCGLandscapeCacheSerializationMode`
Inherits: `EnumBase` | Header: `PCGLandscapeCache.h`

EPCGLandscape Cache Serialization Mode

**Properties** (3):
  - `ALWAYS_SERIALIZE`: `PCGLandscapeCacheSerializationMode = Ellipsis` — 2
  - `NEVER_SERIALIZE`: `PCGLandscapeCacheSerializationMode = Ellipsis` — 1
  - `SERIALIZE_ONLY_AT_COOK`: `PCGLandscapeCacheSerializationMode = Ellipsis` — 0

### `unreal.PCGMatchMaxDistanceMode`
Inherits: `EnumBase` | Header: `PCGMatchAndSetAttributes.h`

EPCGMatch Max Distance Mode

**Properties** (3):
  - `ATTRIBUTE_MAX_DISTANCE`: `PCGMatchMaxDistanceMode = Ellipsis` — 2
  - `NO_MAX_DISTANCE`: `PCGMatchMaxDistanceMode = Ellipsis` — 0
  - `USE_CONSTANT_MAX_DISTANCE`: `PCGMatchMaxDistanceMode = Ellipsis` — 1

### `unreal.PCGMetadataBitwiseOperation`
Inherits: `EnumBase` | Header: `PCGMetadataBitwiseOpElement.h`

EPCGMetadata Bitwise Operation

**Properties** (4):
  - `AND`: `PCGMetadataBitwiseOperation = Ellipsis` — 0
  - `NOT`: `PCGMetadataBitwiseOperation = Ellipsis` — 1
  - `OR`: `PCGMetadataBitwiseOperation = Ellipsis` — 2
  - `XOR`: `PCGMetadataBitwiseOperation = Ellipsis` — 3

### `unreal.PCGMetadataBooleanOperation`
Inherits: `EnumBase` | Header: `PCGMetadataBooleanOpElement.h`

EPCGMetadata Boolean Operation

**Properties** (4):
  - `AND`: `PCGMetadataBooleanOperation = Ellipsis` — 0
  - `NOT`: `PCGMetadataBooleanOperation = Ellipsis` — 1
  - `OR`: `PCGMetadataBooleanOperation = Ellipsis` — 2
  - `XOR`: `PCGMetadataBooleanOperation = Ellipsis` — 3

### `unreal.PCGMetadataCompareOperation`
Inherits: `EnumBase` | Header: `PCGMetadataCompareOpElement.h`

EPCGMetadata Compare Operation

**Properties** (6):
  - `EQUAL`: `PCGMetadataCompareOperation = Ellipsis` — 0
  - `GREATER`: `PCGMetadataCompareOperation = Ellipsis` — 2
  - `GREATER_OR_EQUAL`: `PCGMetadataCompareOperation = Ellipsis` — 3
  - `LESS`: `PCGMetadataCompareOperation = Ellipsis` — 4
  - `LESS_OR_EQUAL`: `PCGMetadataCompareOperation = Ellipsis` — 5
  - `NOT_EQUAL`: `PCGMetadataCompareOperation = Ellipsis` — 1

### `unreal.PCGMetadataDomainFlag`
Inherits: `EnumBase` | Header: `PCGMetadataCommon.h`

EPCGMetadata Domain Flag

**Properties** (5):
  - `CUSTOM`: `PCGMetadataDomainFlag = Ellipsis` — For data that can have more domains. 255
  - `DATA`: `PCGMetadataDomainFlag = Ellipsis` — Metadata at the data domain. 1
  - `DEFAULT`: `PCGMetadataDomainFlag = Ellipsis` — Depends on the data. Should map to the same concept before multi-domain metadata. 0
  - `ELEMENTS`: `PCGMetadataDomainFlag = Ellipsis` — Metadata on elements like points on point data and entries on param data. 2
  - `INVALID`: `PCGMetadataDomainFlag = Ellipsis` — For invalid domain. 254

### `unreal.PCGMetadataFilterMode`
Inherits: `EnumBase` | Header: `PCGMetadataCommon.h`

EPCGMetadata Filter Mode

**Properties** (2):
  - `EXCLUDE_ATTRIBUTES`: `PCGMetadataFilterMode = Ellipsis` — The listed attributes will be unchanged by the projection and will not be added from the target data...
  - `INCLUDE_ATTRIBUTES`: `PCGMetadataFilterMode = Ellipsis` — Only the listed attributes will be changed by the projection or added from the target data. 1

### `unreal.PCGMetadataMakeRotatorOp`
Inherits: `EnumBase` | Header: `PCGMetadataMakeRotator.h`

EPCGMetadata Make Rotator Op

**Properties** (11):
  - `MAKE_ROT_FROM_ANGLES`: `PCGMetadataMakeRotatorOp = Ellipsis` — 10
  - `MAKE_ROT_FROM_AXES`: `PCGMetadataMakeRotatorOp = Ellipsis` — 9
  - `MAKE_ROT_FROM_X`: `PCGMetadataMakeRotatorOp = Ellipsis` — 0
  - `MAKE_ROT_FROM_XY`: `PCGMetadataMakeRotatorOp = Ellipsis` — 3
  - `MAKE_ROT_FROM_XZ`: `PCGMetadataMakeRotatorOp = Ellipsis` — 5
  - `MAKE_ROT_FROM_Y`: `PCGMetadataMakeRotatorOp = Ellipsis` — 1
  - `MAKE_ROT_FROM_YX`: `PCGMetadataMakeRotatorOp = Ellipsis` — 4
  - `MAKE_ROT_FROM_YZ`: `PCGMetadataMakeRotatorOp = Ellipsis` — 7
  - `MAKE_ROT_FROM_Z`: `PCGMetadataMakeRotatorOp = Ellipsis` — 2
  - `MAKE_ROT_FROM_ZX`: `PCGMetadataMakeRotatorOp = Ellipsis` — 6
  - `MAKE_ROT_FROM_ZY`: `PCGMetadataMakeRotatorOp = Ellipsis` — 8

### `unreal.PCGMetadataMakeVector3`
Inherits: `EnumBase` | Header: `PCGMetadataMakeVector.h`

EPCGMetadata Make Vector 3

**Properties** (2):
  - `THREE_VALUES`: `PCGMetadataMakeVector3 = Ellipsis` — 0
  - `VECTOR2_AND_VALUE`: `PCGMetadataMakeVector3 = Ellipsis` — 1

### `unreal.PCGMetadataMakeVector4`
Inherits: `EnumBase` | Header: `PCGMetadataMakeVector.h`

EPCGMetadata Make Vector 4

**Properties** (4):
  - `FOUR_VALUES`: `PCGMetadataMakeVector4 = Ellipsis` — 0
  - `TWO_VECTOR2`: `PCGMetadataMakeVector4 = Ellipsis` — 2
  - `VECTOR2_AND_TWO_VALUES`: `PCGMetadataMakeVector4 = Ellipsis` — 1
  - `VECTOR3_AND_VALUE`: `PCGMetadataMakeVector4 = Ellipsis` — 3

### `unreal.PCGMetadataMathsOperation`
Inherits: `EnumBase` | Header: `PCGMetadataMathsOpElement.h`

EPCGMetadata Maths Operation

**Properties** (24):
  - `ABS`: `PCGMetadataMathsOperation = Ellipsis` — 1030
  - `ADD`: `PCGMetadataMathsOperation = Ellipsis` — 2049
  - `CEIL`: `PCGMetadataMathsOperation = Ellipsis` — 1032
  - `CLAMP`: `PCGMetadataMathsOperation = Ellipsis` — 4097
  - `DEC`: `PCGMetadataMathsOperation = Ellipsis` — X - 1 operation 1035
  - `DIVIDE`: `PCGMetadataMathsOperation = Ellipsis` — 2052
  - `FLOOR`: `PCGMetadataMathsOperation = Ellipsis` — 1031
  - `FRAC`: `PCGMetadataMathsOperation = Ellipsis` — 1026
  - `INC`: `PCGMetadataMathsOperation = Ellipsis` — X + 1 operation 1034
  - `LERP`: `PCGMetadataMathsOperation = Ellipsis` — 4098
  - `MAX`: `PCGMetadataMathsOperation = Ellipsis` — 2053
  - `MIN`: `PCGMetadataMathsOperation = Ellipsis` — 2054
  - `MODULO`: `PCGMetadataMathsOperation = Ellipsis` — 2058
  - `MULTIPLY`: `PCGMetadataMathsOperation = Ellipsis` — 2051
  - `MUL_ADD`: `PCGMetadataMathsOperation = Ellipsis` — Multiply Add (A + B * C) 4099
  - `NEGATE`: `PCGMetadataMathsOperation = Ellipsis` — -X operation 1036
  - `ONE_MINUS`: `PCGMetadataMathsOperation = Ellipsis` — 1 - X operation 1033
  - `POW`: `PCGMetadataMathsOperation = Ellipsis` — 2055
  - `ROUND`: `PCGMetadataMathsOperation = Ellipsis` — 1028
  - `SET`: `PCGMetadataMathsOperation = Ellipsis` — 2059
  - `SIGN`: `PCGMetadataMathsOperation = Ellipsis` — 1025
  - `SQRT`: `PCGMetadataMathsOperation = Ellipsis` — 1029
  - `SUBTRACT`: `PCGMetadataMathsOperation = Ellipsis` — 2050
  - `TRUNCATE`: `PCGMetadataMathsOperation = Ellipsis` — 1027

### `unreal.PCGMetadataOp`
Inherits: `EnumBase` | Header: `PCGMetadataCommon.h`

EPCGMetadata Op

**Properties** (8):
  - `ADD`: `PCGMetadataOp = Ellipsis` — Add the values. 3
  - `DIV`: `PCGMetadataOp = Ellipsis` — Divide the values. 5
  - `MAX`: `PCGMetadataOp = Ellipsis` — Take the maximum value. 1
  - `MIN`: `PCGMetadataOp = Ellipsis` — Take the minimum value. 0
  - `MUL`: `PCGMetadataOp = Ellipsis` — Multiply the values. 4
  - `SOURCE_VALUE`: `PCGMetadataOp = Ellipsis` — Pick the source (first) value. 6
  - `SUB`: `PCGMetadataOp = Ellipsis` — Subtract the values. 2
  - `TARGET_VALUE`: `PCGMetadataOp = Ellipsis` — Pick the target (second) value. 7

### `unreal.PCGMetadataRotatorOperation`
Inherits: `EnumBase` | Header: `PCGMetadataRotatorOpElement.h`

EPCGMetadata Rotator Operation

**Properties** (6):
  - `COMBINE`: `PCGMetadataRotatorOperation = Ellipsis` — 1
  - `INVERSE_TRANSFORM_ROTATION`: `PCGMetadataRotatorOperation = Ellipsis` — 102
  - `INVERT`: `PCGMetadataRotatorOperation = Ellipsis` — 2
  - `LERP`: `PCGMetadataRotatorOperation = Ellipsis` — 3
  - `NORMALIZE`: `PCGMetadataRotatorOperation = Ellipsis` — 4
  - `TRANSFORM_ROTATION`: `PCGMetadataRotatorOperation = Ellipsis` — 101

### `unreal.PCGMetadataStringOperation`
Inherits: `EnumBase` | Header: `PCGMetadataStringOpElement.h`

EPCGMetadata String Operation

**Properties** (7):
  - `APPEND`: `PCGMetadataStringOperation = Ellipsis` — 0
  - `REPLACE`: `PCGMetadataStringOperation = Ellipsis` — 1
  - `TO_LOWER`: `PCGMetadataStringOperation = Ellipsis` — Convert all characters to lower case. 3
  - `TO_UPPER`: `PCGMetadataStringOperation = Ellipsis` — Convert all characters to upper case. 2
  - `TRIM_END`: `PCGMetadataStringOperation = Ellipsis` — Trim whitespace from the end of the string. 5
  - `TRIM_START`: `PCGMetadataStringOperation = Ellipsis` — Trim whitespace from the beginning of the string. 4
  - `TRIM_START_AND_END`: `PCGMetadataStringOperation = Ellipsis` — Trim whitespace from the beginning and end of the string. 6

### `unreal.PCGMetadataTransformOperation`
Inherits: `EnumBase` | Header: `PCGMetadataTransformOpElement.h`

EPCGMetadata Transform Operation

**Properties** (3):
  - `COMPOSE`: `PCGMetadataTransformOperation = Ellipsis` — 0
  - `INVERT`: `PCGMetadataTransformOperation = Ellipsis` — 1
  - `LERP`: `PCGMetadataTransformOperation = Ellipsis` — 2

### `unreal.PCGMetadataTrigOperation`
Inherits: `EnumBase` | Header: `PCGMetadataTrigOpElement.h`

EPCGMetadata Trig Operation

**Properties** (9):
  - `ACOS`: `PCGMetadataTrigOperation = Ellipsis` — 0
  - `ASIN`: `PCGMetadataTrigOperation = Ellipsis` — 1
  - `ATAN`: `PCGMetadataTrigOperation = Ellipsis` — 2
  - `ATAN2`: `PCGMetadataTrigOperation = Ellipsis` — 3
  - `COS`: `PCGMetadataTrigOperation = Ellipsis` — 4
  - `DEG_TO_RAD`: `PCGMetadataTrigOperation = Ellipsis` — 7
  - `RAD_TO_DEG`: `PCGMetadataTrigOperation = Ellipsis` — 8
  - `SIN`: `PCGMetadataTrigOperation = Ellipsis` — 5
  - `TAN`: `PCGMetadataTrigOperation = Ellipsis` — 6

### `unreal.PCGMetadataTypes`
Inherits: `EnumBase` | Header: `PCGMetadataAttributeTraits.h`

EPCGMetadata Types

**Properties** (15):
  - `BOOLEAN`: `PCGMetadataTypes = Ellipsis` — 10
  - `DOUBLE`: `PCGMetadataTypes = Ellipsis` — 1
  - `FLOAT`: `PCGMetadataTypes = Ellipsis` — 0
  - `INTEGER32`: `PCGMetadataTypes = Ellipsis` — 2
  - `INTEGER64`: `PCGMetadataTypes = Ellipsis` — 3
  - `NAME`: `PCGMetadataTypes = Ellipsis` — 12
  - `QUATERNION`: `PCGMetadataTypes = Ellipsis` — 7
  - `ROTATOR`: `PCGMetadataTypes = Ellipsis` — 11
  - `SOFT_CLASS_PATH`: `PCGMetadataTypes = Ellipsis` — 14
  - `SOFT_OBJECT_PATH`: `PCGMetadataTypes = Ellipsis` — 13
  - `STRING`: `PCGMetadataTypes = Ellipsis` — 9
  - `TRANSFORM`: `PCGMetadataTypes = Ellipsis` — 8
  - `VECTOR`: `PCGMetadataTypes = Ellipsis` — 5
  - `VECTOR2`: `PCGMetadataTypes = Ellipsis` — 4
  - `VECTOR4`: `PCGMetadataTypes = Ellipsis` — 6

### `unreal.PCGMetadataVectorOperation`
Inherits: `EnumBase` | Header: `PCGMetadataVectorOpElement.h`

EPCGMetadata Vector Operation

**Properties** (10):
  - `CROSS`: `PCGMetadataVectorOperation = Ellipsis` — 1
  - `DISTANCE`: `PCGMetadataVectorOperation = Ellipsis` — 3
  - `DOT`: `PCGMetadataVectorOperation = Ellipsis` — 2
  - `INVERSE_TRANSFORM_DIRECTION`: `PCGMetadataVectorOperation = Ellipsis` — 103
  - `INVERSE_TRANSFORM_LOCATION`: `PCGMetadataVectorOperation = Ellipsis` — 104
  - `LENGTH`: `PCGMetadataVectorOperation = Ellipsis` — 5
  - `NORMALIZE`: `PCGMetadataVectorOperation = Ellipsis` — 4
  - `ROTATE_AROUND_AXIS`: `PCGMetadataVectorOperation = Ellipsis` — 6
  - `TRANSFORM_DIRECTION`: `PCGMetadataVectorOperation = Ellipsis` — 101
  - `TRANSFORM_LOCATION`: `PCGMetadataVectorOperation = Ellipsis` — 102

### `unreal.PCGNormalToDensityMode`
Inherits: `EnumBase` | Header: `PCGNormalToDensity.h`

PCGNormal to Density Mode

**Properties** (7):
  - `ADD`: `PCGNormalToDensityMode = Ellipsis` — 3
  - `DIVIDE`: `PCGNormalToDensityMode = Ellipsis` — 6
  - `MAXIMUM`: `PCGNormalToDensityMode = Ellipsis` — 2
  - `MINIMUM`: `PCGNormalToDensityMode = Ellipsis` — 1
  - `MULTIPLY`: `PCGNormalToDensityMode = Ellipsis` — 5
  - `SET`: `PCGNormalToDensityMode = Ellipsis` — 0
  - `SUBTRACT`: `PCGNormalToDensityMode = Ellipsis` — 4

### `unreal.PCGPathfindingCostFunctionMode`
Inherits: `EnumBase` | Header: `PCGPathfindingElement.h`

EPCGPathfinding Cost Function Mode

**Properties** (3):
  - `COST_MULTIPLIER`: `PCGPathfindingCostFunctionMode = Ellipsis` — Pathfinding cost will be the distance multiplied by the provided factor. Note that multipliers below...
  - `DISTANCE`: `PCGPathfindingCostFunctionMode = Ellipsis` — Pathfinding cost will be the distance only. 0
  - `FITNESS_SCORE`: `PCGPathfindingCostFunctionMode = Ellipsis` — Pathfinding cost will be driven by a fitness score (0-1 range), with a maximum penalty applied at fi...

### `unreal.PCGPathfindingGoalMappingMode`
Inherits: `EnumBase` | Header: `PCGPathfindingElement.h`

EPCGPathfinding Goal Mapping Mode

**Properties** (3):
  - `EACH_START_TO_EACH_GOAL`: `PCGPathfindingGoalMappingMode = Ellipsis` — For each starting location, find the optimal path to each of the goal locations. There will be an at...
  - `EACH_START_TO_NEAREST_GOAL`: `PCGPathfindingGoalMappingMode = Ellipsis` — For each starting location, find the optimal path to any of the goal locations. There will be one at...
  - `EACH_START_TO_PAIRWISE_GOAL`: `PCGPathfindingGoalMappingMode = Ellipsis` — Map each starting location to a consecutively corresponding goal location as a pair, and find the op...

### `unreal.PCGPathfindingSplineMode`
Inherits: `EnumBase` | Header: `PCGPathfindingElement.h`

EPCGPathfinding Spline Mode

**Properties** (2):
  - `CURVE`: `PCGPathfindingSplineMode = Ellipsis` — Interpret the spline as a continuous curve. 0
  - `LINEAR`: `PCGPathfindingSplineMode = Ellipsis` — Interpret the spline as a conjunction of linear segments. 1

### `unreal.PCGPinInitMode`
Inherits: `EnumBase` | Header: `PCGPinPropertiesGPU.h`

Method for initializing an output pin.

**Properties** (2):
  - `CUSTOM`: `PCGPinInitMode = Ellipsis` — Initialize from fixed values. 1
  - `FROM_INPUT_PINS`: `PCGPinInitMode = Ellipsis` — Initialize from one or more input pins. 0

### `unreal.PCGPinStatus`
Inherits: `EnumBase` | Header: `PCGPin.h`

EPCGPin Status

**Properties** (3):
  - `ADVANCED`: `PCGPinStatus = Ellipsis` — Advanced pin will be hidden by default in the UIand will be shown only if the user extends the node(...
  - `NORMAL`: `PCGPinStatus = Ellipsis` — Normal usage pin. 0
  - `REQUIRED`: `PCGPinStatus = Ellipsis` — Only for input pins, mark this pin as required.If set on an output pin, behave as Normal. 1

### `unreal.PCGPinUsage`
Inherits: `EnumBase` | Header: `PCGPin.h`

EPCGPin Usage

**Properties** (3):
  - `FEEDBACK`: `PCGPinUsage = Ellipsis` — When used in a loop subgraph node, will pass data on the feedback pins to the next iteration only if...
  - `LOOP`: `PCGPinUsage = Ellipsis` — When used in a loop subgraph node, will separate each data from that pin into separate subgraph exec...
  - `NORMAL`: `PCGPinUsage = Ellipsis` — Normal usage pin, will pass all data as is. 0

### `unreal.PCGPointExtentsModifierMode`
Inherits: `EnumBase` | Header: `PCGPointExtentsModifier.h`

EPCGPoint Extents Modifier Mode

**Properties** (5):
  - `ADD`: `PCGPointExtentsModifierMode = Ellipsis` — 3
  - `MAXIMUM`: `PCGPointExtentsModifierMode = Ellipsis` — 2
  - `MINIMUM`: `PCGPointExtentsModifierMode = Ellipsis` — 1
  - `MULTIPLY`: `PCGPointExtentsModifierMode = Ellipsis` — 4
  - `SET`: `PCGPointExtentsModifierMode = Ellipsis` — 0

### `unreal.PCGPointNativeProperties`
Inherits: `EnumBase` | Header: `PCGCommon.h`

Value names need to match EPCGPointProperties

**Properties** (9):
  - `ALL`: `PCGPointNativeProperties = Ellipsis` — 255
  - `BOUNDS_MAX`: `PCGPointNativeProperties = Ellipsis` — 8
  - `BOUNDS_MIN`: `PCGPointNativeProperties = Ellipsis` — 4
  - `COLOR`: `PCGPointNativeProperties = Ellipsis` — 16
  - `DENSITY`: `PCGPointNativeProperties = Ellipsis` — 2
  - `METADATA_ENTRY`: `PCGPointNativeProperties = Ellipsis` — 128
  - `SEED`: `PCGPointNativeProperties = Ellipsis` — 64
  - `STEEPNESS`: `PCGPointNativeProperties = Ellipsis` — 32
  - `TRANSFORM`: `PCGPointNativeProperties = Ellipsis` — 1

### `unreal.PCGPointNeighborhoodDensityMode`
Inherits: `EnumBase` | Header: `PCGPointNeighborhood.h`

EPCGPoint Neighborhood Density Mode

**Properties** (3):
  - `NONE`: `PCGPointNeighborhoodDensityMode = Ellipsis` — 0
  - `SET_AVERAGE_DENSITY`: `PCGPointNeighborhoodDensityMode = Ellipsis` — 2
  - `SET_NORMALIZED_DISTANCE_TO_DENSITY`: `PCGPointNeighborhoodDensityMode = Ellipsis` — 1

### `unreal.PCGPointPosition`
Inherits: `EnumBase` | Header: `PCGCreatePointsGrid.h`

EPCGPoint Position

**Properties** (2):
  - `CELL_CENTER`: `PCGPointPosition = Ellipsis` — 0
  - `CELL_CORNERS`: `PCGPointPosition = Ellipsis` — 1

### `unreal.PCGPointProperties`
Inherits: `EnumBase` | Header: `PCGPoint.h`

EPCGPoint Properties

**Properties** (14):
  - `BOUNDS_MAX`: `PCGPointProperties = Ellipsis` — Maximum corner of the pointâs bounds in local space. 2
  - `BOUNDS_MIN`: `PCGPointProperties = Ellipsis` — Minimum corner of the pointâs bounds in local space. 1
  - `COLOR`: `PCGPointProperties = Ellipsis` — An RGBA (four channel) color value. 4
  - `DENSITY`: `PCGPointProperties = Ellipsis` — When points are sampled, this density value represents the highest value of the density function wit...
  - `EXTENTS`: `PCGPointProperties = Ellipsis` — Half the local space difference between the maximum and minimum bounds of the pointâs volume. Can ...
  - `LOCAL_CENTER`: `PCGPointProperties = Ellipsis` — The local center location of the pointâs volume, halfway between the minimum and maximum bounds. 1...
  - `LOCAL_SIZE`: `PCGPointProperties = Ellipsis` — The difference between the maximum and minimum bounds of the point. 12
  - `POSITION`: `PCGPointProperties = Ellipsis` — Location component of the pointâs transform. 5
  - `ROTATION`: `PCGPointProperties = Ellipsis` — Rotation component of the pointâs transform. 6
  - `SCALE`: `PCGPointProperties = Ellipsis` — Scale component of the pointâs transform. 7
  - `SCALED_LOCAL_SIZE`: `PCGPointProperties = Ellipsis` — The difference between the maximum and minimum bounds of the point, after only the scale has been ap...
  - `SEED`: `PCGPointProperties = Ellipsis` — Used to seed random processes during various operations. 11
  - `STEEPNESS`: `PCGPointProperties = Ellipsis` — A normalized value that establishes how âhardâ or âsoftâ that volume will be represented. Fr...
  - `TRANSFORM`: `PCGPointProperties = Ellipsis` — The pointâs transform. 8

### `unreal.PCGPrintVerbosity`
Inherits: `EnumBase` | Header: `PCGPrintElement.h`

EPCGPrint Verbosity

**Properties** (5):
  - `DISPLAY`: `PCGPrintVerbosity = Ellipsis` — 4
  - `ERROR`: `PCGPrintVerbosity = Ellipsis` — 2
  - `LOG`: `PCGPrintVerbosity = Ellipsis` — 0 5
  - `NO_LOGGING`: `PCGPrintVerbosity = Ellipsis` — 0
  - `WARNING`: `PCGPrintVerbosity = Ellipsis` — 3

### `unreal.PCGProjectionColorBlendMode`
Inherits: `EnumBase` | Header: `PCGProjectionParams.h`

EPCGProjection Color Blend Mode

**Properties** (5):
  - `ADD`: `PCGProjectionColorBlendMode = Ellipsis` — 2
  - `MULTIPLY`: `PCGProjectionColorBlendMode = Ellipsis` — 4
  - `SOURCE_VALUE`: `PCGProjectionColorBlendMode = Ellipsis` — 0
  - `SUBTRACT`: `PCGProjectionColorBlendMode = Ellipsis` — 3
  - `TARGET_VALUE`: `PCGProjectionColorBlendMode = Ellipsis` — 1

### `unreal.PCGProjectionTagMergeMode`
Inherits: `EnumBase` | Header: `PCGProjectionParams.h`

EPCGProjection Tag Merge Mode

**Properties** (3):
  - `BOTH`: `PCGProjectionTagMergeMode = Ellipsis` — 2
  - `SOURCE`: `PCGProjectionTagMergeMode = Ellipsis` — 0
  - `TARGET`: `PCGProjectionTagMergeMode = Ellipsis` — 1

### `unreal.PCGProxyInterfaceMode`
Inherits: `EnumBase` | Header: `PCGIndirectionElement.h`

EPCGProxy Interface Mode

**Properties** (3):
  - `BY_BLUEPRINT_ELEMENT`: `PCGProxyInterfaceMode = Ellipsis` — Select a custom blueprint element to define the pin interface 1
  - `BY_NATIVE_ELEMENT`: `PCGProxyInterfaceMode = Ellipsis` — Select a native element to define the pin interface 0
  - `BY_SETTINGS`: `PCGProxyInterfaceMode = Ellipsis` — User defined settings will define the pin interface 2

### `unreal.PCGReverseSplineOperation`
Inherits: `EnumBase` | Header: `PCGSplineDirection.h`

EPCGReverse Spline Operation

**Properties** (3):
  - `FORCE_CLOCKWISE`: `PCGReverseSplineOperation = Ellipsis` — Will reverse the spline points if they are counter clockwise. 1
  - `FORCE_COUNTER_CLOCKWISE`: `PCGReverseSplineOperation = Ellipsis` — Will reverse the spline points if they are clockwise. 2
  - `REVERSE`: `PCGReverseSplineOperation = Ellipsis` — Will reverse the spline points regardless of their orientation. 0

### `unreal.PCGSelectGrammarComparator`
Inherits: `EnumBase` | Header: `PCGSelectGrammar.h`

An enum representation of basic numerical comparisons for the Select Grammar operation.

**Properties** (8):
  - `EQUAL_TO`: `PCGSelectGrammarComparator = Ellipsis` — Select if âequal toâ (A == B) 36
  - `GREATER_THAN`: `PCGSelectGrammarComparator = Ellipsis` — Select if âgreater thanâ (A > B) 38
  - `GREATER_THAN_EQUAL_TO`: `PCGSelectGrammarComparator = Ellipsis` — Select if âgreater than or equal toâ (A >= B) 37
  - `LESS_THAN`: `PCGSelectGrammarComparator = Ellipsis` — Select if âless thanâ (A < B) 34
  - `LESS_THAN_EQUAL_TO`: `PCGSelectGrammarComparator = Ellipsis` — Select if âless than or equal toâ (A <= B) 35
  - `RANGE_EXCLUSIVE`: `PCGSelectGrammarComparator = Ellipsis` — Select if âwithin exclusive rangeâ (B < A < C) 65
  - `RANGE_INCLUSIVE`: `PCGSelectGrammarComparator = Ellipsis` — Select if âwithin inclusive rangeâ (B <= A <= C) 66
  - `SELECT`: `PCGSelectGrammarComparator = Ellipsis` — Select this grammar. Always evaluates to true. 33

### `unreal.PCGSelfPruningType`
Inherits: `EnumBase` | Header: `PCGSelfPruning.h`

EPCGSelf Pruning Type

**Properties** (5):
  - `ALL_EQUAL`: `PCGSelfPruningType = Ellipsis` — 2
  - `LARGE_TO_SMALL`: `PCGSelfPruningType = Ellipsis` — 0
  - `NONE`: `PCGSelfPruningType = Ellipsis` — 3
  - `REMOVE_DUPLICATES`: `PCGSelfPruningType = Ellipsis` — 4
  - `SMALL_TO_LARGE`: `PCGSelfPruningType = Ellipsis` — 1

### `unreal.PCGSettingsType`
Inherits: `EnumBase` | Header: `PCGSettings.h`

EPCGSettings Type

**Properties** (21):
  - `BLUEPRINT`: `PCGSettingsType = Ellipsis` — 3
  - `CONTROL_FLOW`: `PCGSettingsType = Ellipsis` — 13
  - `DATA_LAYERS`: `PCGSettingsType = Ellipsis` — 19
  - `DEBUG`: `PCGSettingsType = Ellipsis` — 9
  - `DENSITY`: `PCGSettingsType = Ellipsis` — 2
  - `DYNAMIC_MESH`: `PCGSettingsType = Ellipsis` — 18
  - `FILTER`: `PCGSettingsType = Ellipsis` — 5
  - `GENERIC`: `PCGSettingsType = Ellipsis` — 10
  - `GPU`: `PCGSettingsType = Ellipsis` — 17
  - `GRAPH_PARAMETERS`: `PCGSettingsType = Ellipsis` — 15
  - `HIERARCHICAL_GENERATION`: `PCGSettingsType = Ellipsis` — 12
  - `INPUT_OUTPUT`: `PCGSettingsType = Ellipsis` — 0
  - `METADATA`: `PCGSettingsType = Ellipsis` — 4
  - `PARAM`: `PCGSettingsType = Ellipsis` — 11
  - `POINT_OPS`: `PCGSettingsType = Ellipsis` — 14
  - `REROUTE`: `PCGSettingsType = Ellipsis` — 16
  - `RESOURCE`: `PCGSettingsType = Ellipsis` — 20
  - `SAMPLER`: `PCGSettingsType = Ellipsis` — 6
  - `SPATIAL`: `PCGSettingsType = Ellipsis` — 1
  - `SPAWNER`: `PCGSettingsType = Ellipsis` — 7
  - `SUBGRAPH`: `PCGSettingsType = Ellipsis` — 8

### `unreal.PCGSortMethod`
Inherits: `EnumBase` | Header: `PCGSortAttributes.h`

Sorts points based on an attribute.

**Properties** (2):
  - `ASCENDING`: `PCGSortMethod = Ellipsis` — 0
  - `DESCENDING`: `PCGSortMethod = Ellipsis` — 1

### `unreal.PCGSpatialNoiseMask2DMode`
Inherits: `EnumBase` | Header: `PCGSpatialNoise.h`

PCGSpatial Noise Mask 2DMode

**Properties** (3):
  - `CAUSTIC`: `PCGSpatialNoiseMask2DMode = Ellipsis` — Based on underwater fake caustic rendering, gives swirly look. 1
  - `FRACTIONAL_BROWNIAN`: `PCGSpatialNoiseMask2DMode = Ellipsis` — Based on fractional brownian motion. 2
  - `PERLIN`: `PCGSpatialNoiseMask2DMode = Ellipsis` — Your classic perlin noise. 0

### `unreal.PCGSpatialNoiseMode`
Inherits: `EnumBase` | Header: `PCGSpatialNoise.h`

PCGSpatial Noise Mode

**Properties** (5):
  - `CAUSTIC2D`: `PCGSpatialNoiseMode = Ellipsis` — Based on underwater fake caustic rendering, gives swirly look. 1
  - `EDGE_MASK2D`: `PCGSpatialNoiseMode = Ellipsis` — Used to create masks to blend out edges. 4
  - `FRACTIONAL_BROWNIAN2D`: `PCGSpatialNoiseMode = Ellipsis` — Based on fractional brownian motion. 3
  - `PERLIN2D`: `PCGSpatialNoiseMode = Ellipsis` — Your classic perlin noise. 0
  - `VORONOI2D`: `PCGSpatialNoiseMode = Ellipsis` — Voronoi noise, result a the distance to edge and cell ID. 2

### `unreal.PCGSpawnActorGenerationTrigger`
Inherits: `EnumBase` | Header: `PCGSpawnActor.h`

EPCGSpawn Actor Generation Trigger

**Properties** (4):
  - `DEFAULT`: `PCGSpawnActorGenerationTrigger = Ellipsis` — 0
  - `DO_NOT_GENERATE`: `PCGSpawnActorGenerationTrigger = Ellipsis` — Does not call generate in editor, but decays to Default otherwise 3
  - `DO_NOT_GENERATE_IN_EDITOR`: `PCGSpawnActorGenerationTrigger = Ellipsis` — Generate in all cases 2
  - `FORCE_GENERATE`: `PCGSpawnActorGenerationTrigger = Ellipsis` — Generate if the component has âGenerate On Loadâ 1

### `unreal.PCGSpawnActorOption`
Inherits: `EnumBase` | Header: `PCGSpawnActor.h`

EPCGSpawn Actor Option

**Properties** (3):
  - `COLLAPSE_ACTORS`: `PCGSpawnActorOption = Ellipsis` — 0
  - `MERGE_PCG_ONLY`: `PCGSpawnActorOption = Ellipsis` — 1
  - `NO_MERGING`: `PCGSpawnActorOption = Ellipsis` — 2

### `unreal.PCGSphereGeneration`
Inherits: `EnumBase` | Header: `PCGCreatePointsSphere.h`

EPCGSphere Generation

**Properties** (5):
  - `ANGLE`: `PCGSphereGeneration = Ellipsis` — Points generated radially along longitude and latitude lines to form a sphere with user defined angl...
  - `GEODESIC`: `PCGSphereGeneration = Ellipsis` — Points generated from subdivided equilateral triangles across the sphereâs surface. 0
  - `POISSON`: `PCGSphereGeneration = Ellipsis` — Sample points along the sphereâs surface with a minimal distance between any given two points. 4
  - `RANDOM`: `PCGSphereGeneration = Ellipsis` — Points are generated with a uniform distribution on the surface of the sphere. 3
  - `SEGMENTS`: `PCGSphereGeneration = Ellipsis` — Points generated radially along longitude and latitude lines to form a sphere with user defined numb...

### `unreal.PCGSpherePointOrientation`
Inherits: `EnumBase` | Header: `PCGCreatePointsSphere.h`

EPCGSphere Point Orientation

**Properties** (3):
  - `CENTRIC`: `PCGSpherePointOrientation = Ellipsis` — Points are aligned inward toward the origin (inverse of the normal). 1
  - `NONE`: `PCGSpherePointOrientation = Ellipsis` — Points will not be explicitly aligned. 2
  - `RADIAL`: `PCGSpherePointOrientation = Ellipsis` — Points are aligned outward from the origin (the normal of the sphereâs surface). 0

### `unreal.PCGSplineMeshForwardAxis`
Inherits: `EnumBase` | Header: `PCGSplineMeshParams.h`

EPCGSpline Mesh Forward Axis

**Properties** (3):
  - `X`: `PCGSplineMeshForwardAxis = Ellipsis` — 0
  - `Y`: `PCGSplineMeshForwardAxis = Ellipsis` — 1
  - `Z`: `PCGSplineMeshForwardAxis = Ellipsis` — 2

### `unreal.PCGSplineSamplingDimension`
Inherits: `EnumBase` | Header: `PCGSplineSampler.h`

EPCGSpline Sampling Dimension

**Properties** (5):
  - `ON_HORIZONTAL`: `PCGSplineSamplingDimension = Ellipsis` — 1
  - `ON_INTERIOR`: `PCGSplineSamplingDimension = Ellipsis` — 4
  - `ON_SPLINE`: `PCGSplineSamplingDimension = Ellipsis` — 0
  - `ON_VERTICAL`: `PCGSplineSamplingDimension = Ellipsis` — 2
  - `ON_VOLUME`: `PCGSplineSamplingDimension = Ellipsis` — 3

### `unreal.PCGSplineSamplingFill`
Inherits: `EnumBase` | Header: `PCGSplineSampler.h`

EPCGSpline Sampling Fill

**Properties** (2):
  - `EDGES_ONLY`: `PCGSplineSamplingFill = Ellipsis` — 1
  - `FILL`: `PCGSplineSamplingFill = Ellipsis` — 0

### `unreal.PCGSplineSamplingInteriorOrientation`
Inherits: `EnumBase` | Header: `PCGSplineSampler.h`

EPCGSpline Sampling Interior Orientation

**Properties** (2):
  - `FOLLOW_CURVATURE`: `PCGSplineSamplingInteriorOrientation = Ellipsis` — 1
  - `UNIFORM`: `PCGSplineSamplingInteriorOrientation = Ellipsis` — 0

### `unreal.PCGSplineSamplingMode`
Inherits: `EnumBase` | Header: `PCGSplineSampler.h`

EPCGSpline Sampling Mode

**Properties** (3):
  - `DISTANCE`: `PCGSplineSamplingMode = Ellipsis` — 1
  - `NUMBER_OF_SAMPLES`: `PCGSplineSamplingMode = Ellipsis` — Samples a specified number of times, evenly spaced around the spline. 2
  - `SUBDIVISION`: `PCGSplineSamplingMode = Ellipsis` — 0

### `unreal.PCGSplineSamplingSeedingMode`
Inherits: `EnumBase` | Header: `PCGSplineSampler.h`

EPCGSpline Sampling Seeding Mode

**Properties** (2):
  - `SEED_FROM_INDEX`: `PCGSplineSamplingSeedingMode = Ellipsis` — Compute seed from sample index. 1
  - `SEED_FROM_POSITION`: `PCGSplineSamplingSeedingMode = Ellipsis` — Compute seed from sample position. 0

### `unreal.PCGSplitAxis`
Inherits: `EnumBase` | Header: `PCGSplitPoints.h`

EPCGSplit Axis

**Properties** (3):
  - `X`: `PCGSplitAxis = Ellipsis` — 0
  - `Y`: `PCGSplitAxis = Ellipsis` — 1
  - `Z`: `PCGSplitAxis = Ellipsis` — 2

### `unreal.PCGStringMatchingOperator`
Inherits: `EnumBase` | Header: `PCGCommon.h`

EPCGString Matching Operator

**Properties** (3):
  - `EQUAL`: `PCGStringMatchingOperator = Ellipsis` — Will return a match only if the two strings compared are the same 0
  - `MATCHES`: `PCGStringMatchingOperator = Ellipsis` — Will return a match if the first string matches the pattern defined by the second (including wildcar...
  - `SUBSTRING`: `PCGStringMatchingOperator = Ellipsis` — Will return a match if the first string contains the second 1

### `unreal.PCGSubgraphDepthMode`
Inherits: `EnumBase` | Header: `PCGGetSubgraphDepth.h`

EPCGSubgraph Depth Mode

**Properties** (2):
  - `DEPTH`: `PCGSubgraphDepthMode = Ellipsis` — Depth of the dynamic subgraph with respect to the top level graph. 0
  - `RECURSIVE_DEPTH`: `PCGSubgraphDepthMode = Ellipsis` — Recursive depth of the current subgraph, e.g. the number of times this graph is in the execution sta...

### `unreal.PCGTagFilterOperation`
Inherits: `EnumBase` | Header: `PCGDeleteTags.h`

EPCGTag Filter Operation

**Properties** (2):
  - `DELETE_SELECTED_TAGS`: `PCGTagFilterOperation = Ellipsis` — 1
  - `KEEP_ONLY_SELECTED_TAGS`: `PCGTagFilterOperation = Ellipsis` — 0

### `unreal.PCGTextureAddressMode`
Inherits: `EnumBase` | Header: `PCGTextureData.h`

EPCGTexture Address Mode

**Properties** (2):
  - `CLAMP`: `PCGTextureAddressMode = Ellipsis` — Clamps UV to 0-1. 0
  - `WRAP`: `PCGTextureAddressMode = Ellipsis` — Tiles the texture to fit. 1

### `unreal.PCGTextureColorChannel`
Inherits: `EnumBase` | Header: `PCGTextureData.h`

EPCGTexture Color Channel

**Properties** (4):
  - `ALPHA`: `PCGTextureColorChannel = Ellipsis` — 3
  - `BLUE`: `PCGTextureColorChannel = Ellipsis` — 2
  - `GREEN`: `PCGTextureColorChannel = Ellipsis` — 1
  - `RED`: `PCGTextureColorChannel = Ellipsis` — 0

### `unreal.PCGTextureDensityFunction`
Inherits: `EnumBase` | Header: `PCGTextureData.h`

EPCGTexture Density Function

**Properties** (2):
  - `IGNORE`: `PCGTextureDensityFunction = Ellipsis` — 0
  - `MULTIPLY`: `PCGTextureDensityFunction = Ellipsis` — 1

### `unreal.PCGTextureFilter`
Inherits: `EnumBase` | Header: `PCGTextureData.h`

Method used to determine the value for a sample based on the value of nearby texels.

**Properties** (2):
  - `BILINEAR`: `PCGTextureFilter = Ellipsis` — Bilinearly interpolates the values of the four nearest texels to the sample location. 1
  - `POINT`: `PCGTextureFilter = Ellipsis` — Takes the value of whatever texel the sample lands in. 0

### `unreal.PCGTextureMappingMethod`
Inherits: `EnumBase` | Header: `PCGSampleTexture.h`

EPCGTexture Mapping Method

**Properties** (2):
  - `PLANAR`: `PCGTextureMappingMethod = Ellipsis` — 0
  - `UV_COORDINATES`: `PCGTextureMappingMethod = Ellipsis` — 1

### `unreal.PCGTransformLerpMode`
Inherits: `EnumBase` | Header: `PCGMetadataTransformOpElement.h`

Taken from Kismet Math Library

**Properties** (3):
  - `DUAL_QUAT_INTERP`: `PCGTransformLerpMode = Ellipsis` — Dual quaternion interpolation, follows helix or screw-motion path between keyframes. 2
  - `EULER_INTERP`: `PCGTransformLerpMode = Ellipsis` — Rotor or Euler Angle interpolation. 1
  - `QUAT_INTERP`: `PCGTransformLerpMode = Ellipsis` — Shortest Path or Quaternion interpolation for the rotation. 0

### `unreal.PCGUnionDensityFunction`
Inherits: `EnumBase` | Header: `PCGUnionData.h`

EPCGUnion Density Function

**Properties** (3):
  - `BINARY`: `PCGUnionDensityFunction = Ellipsis` — 2
  - `CLAMPED_ADDITION`: `PCGUnionDensityFunction = Ellipsis` — 1
  - `MAXIMUM`: `PCGUnionDensityFunction = Ellipsis` — 0

### `unreal.PCGUnionType`
Inherits: `EnumBase` | Header: `PCGUnionData.h`

EPCGUnion Type

**Properties** (3):
  - `KEEP_ALL`: `PCGUnionType = Ellipsis` — 2
  - `LEFT_TO_RIGHT_PRIORITY`: `PCGUnionType = Ellipsis` — 0
  - `RIGHT_TO_LEFT_PRIORITY`: `PCGUnionType = Ellipsis` — 1

### `unreal.PCGUnitTestDummyEnum`
Inherits: `EnumBase` | Header: `PCGGetActorPropertyTest.h`

EPCGUnit Test Dummy Enum

**Properties** (3):
  - `ONE`: `PCGUnitTestDummyEnum = Ellipsis` — 0
  - `THREE`: `PCGUnitTestDummyEnum = Ellipsis` — 2
  - `TWO`: `PCGUnitTestDummyEnum = Ellipsis` — 1

### `unreal.PCGUserParameterSource`
Inherits: `EnumBase` | Header: `PCGUserParameterGet.h`

EPCGUser Parameter Source

**Properties** (3):
  - `CURRENT`: `PCGUserParameterSource = Ellipsis` — 0
  - `ROOT`: `PCGUserParameterSource = Ellipsis` — 2
  - `UPSTREAM`: `PCGUserParameterSource = Ellipsis` — 1

### `unreal.PCGWorldQueryFilter`
Inherits: `EnumBase` | Header: `PCGWorldData.h`

EPCGWorld Query Filter

**Properties** (4):
  - `EXCLUDE`: `PCGWorldQueryFilter = Ellipsis` — Always exclude an actor if it matches this filter. 2
  - `INCLUDE`: `PCGWorldQueryFilter = Ellipsis` — Includes the actor if no other filter explicitly filters it out (either by exclusion or by requiring...
  - `NONE`: `PCGWorldQueryFilter = Ellipsis` — Filter disabled 0
  - `REQUIRE`: `PCGWorldQueryFilter = Ellipsis` — Requires the actor to match to this filter to be included. 3

### `unreal.PCGWorldQuerySelectLandscapeHits`
Inherits: `EnumBase` | Header: `PCGWorldData.h`

EPCGWorld Query Select Landscape Hits

**Properties** (3):
  - `EXCLUDE`: `PCGWorldQuerySelectLandscapeHits = Ellipsis` — Excludes hits from the landscape. 0
  - `INCLUDE`: `PCGWorldQuerySelectLandscapeHits = Ellipsis` — Will report hits on the landscape. 1
  - `REQUIRE`: `PCGWorldQuerySelectLandscapeHits = Ellipsis` — Will return only hits on the landscape. 2

### `unreal.PCGWorldRaycastMode`
Inherits: `EnumBase` | Header: `PCGWorldQueryHelpers.h`

EPCGWorld Raycast Mode

**Properties** (4):
  - `INFINITE`: `PCGWorldRaycastMode = Ellipsis` — Use the direction vector with âinfiniteâ magnitude. 0
  - `NORMALIZED_WITH_LENGTH`: `PCGWorldRaycastMode = Ellipsis` — Normalize the direction vector and apply the length directly. 2
  - `SCALED_VECTOR`: `PCGWorldRaycastMode = Ellipsis` — Use the direction vector âas-isâ for casting the ray with its current magnitude. 1
  - `SEGMENTS`: `PCGWorldRaycastMode = Ellipsis` — N, N:1, or 1:N. 3 User provided end points. Must match input points N

### `unreal.OnPCGGraphCancelledExternal`
Inherits: `MulticastDelegateBase` | Header: `PCGComponent.h`

On PCGGraph Cancelled External Delegate Signature

### `unreal.OnPCGGraphCleanedExternal`
Inherits: `MulticastDelegateBase` | Header: `PCGComponent.h`

On PCGGraph Cleaned External Delegate Signature

### `unreal.OnPCGGraphGeneratedExternal`
Inherits: `MulticastDelegateBase` | Header: `PCGComponent.h`

On PCGGraph Generated External Delegate Signature

### `unreal.OnPCGGraphStartGeneratingExternal`
Inherits: `MulticastDelegateBase` | Header: `PCGComponent.h`

On PCGGraph Start Generating External Delegate Signature
