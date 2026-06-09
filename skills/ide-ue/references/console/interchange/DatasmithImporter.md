# UE Python API — DatasmithImporter Module

**35 types** from the `DatasmithImporter` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DatasmithImportFactoryCreateFileResult`, `DataprepSetupStaticLightingOperation`, `DatasmithActorBindingElement`, `DatasmithActorElement`, `DatasmithBaseMaterialElement`, `DatasmithBasePropertyCaptureElement`, `DatasmithCameraActorElement`, `DatasmithConsumer`, `DatasmithCustomActorElement`, `DatasmithDirProducer`, `DatasmithFileProducer`, `DatasmithImportFactory`, `DatasmithKeyValueProperty`, `DatasmithLevelVariantSetsElement`, `DatasmithLightActorElement`, `DatasmithMaterialIDElement`, `DatasmithMeshActorElement`, `DatasmithMeshElement`, `DatasmithMetaDataElement`, `DatasmithObjectElement`, ... (35 total)

---

## Classes

### `unreal.DatasmithImportFactoryCreateFileResult`
Inherits: `StructBase` | Header: `DatasmithBlueprintLibrary.h`

Datasmith Import Factory Create File Result

**Properties** (4):
  - `import_succeed`: `bool` — [Read-Write] (bool)
  - `imported_actors`: `None` — [Read-Write] List of all created actors if user requires to use multiple actors. The root actor will...
  - `imported_meshes`: `None` — [Read-Write] Meshes created during the import process (Array[Object])
  - `scene`: `DatasmithScene` — [Read-Write] (DatasmithScene)

### `unreal.DataprepSetupStaticLightingOperation`
Inherits: `DataprepOperation` | Header: `DatasmithDataprepOperation.h`

For each static mesh to process, setup the settings to enable lightmap UVs generation and compute the lightmap resolution.

**Properties** (2):
  - `enable_lightmap_uv_generation`: `bool` — [Read-Write] Enable the lightmap UV generation. (bool)
  - `lightmap_resolution_ideal_ratio`: `float` — [Read-Write] The ratio used to compute the resolution of the lightmap. (float)

### `unreal.DatasmithActorBindingElement`
Inherits: `DatasmithObjectElement` | Header: `DatasmithUObjectElements.h`

UDatasmithActorBindingElement

**Methods** (8):
  - `add_property_capture(prop)` -> `None` — Adds an existing property capture to this binding
  - `create_object_property_capture()` -> `DatasmithObjectPropertyCaptureElement` — Create a new object property capture and add it to this binding
  - `create_property_capture()` -> `DatasmithPropertyCaptureElement` — Create a new property capture and add it to this binding
  - `get_actor()` -> `DatasmithActorElement` — Gets the actor that this binding will try capturing
  - `get_property_capture(index)` -> `DatasmithBasePropertyCaptureElement` — Gets property that will be captured from the bound actor
  - `get_property_captures_count()` -> `int32` — Gets how many properties will be captured from the bound actor
  - `remove_property_capture(prop)` -> `None` — Removes one of the properties that will be captured from the bound actor
  - `set_actor(actor)` -> `None` — Sets the actor that this binding will try capturing

### `unreal.DatasmithActorElement`
Inherits: `DatasmithObjectElement` | Header: `DatasmithUObjectElements.h`

UDatasmithActorElement

**Methods** (16):
  - `add_child(child)` -> `None` — Adds a child to the Actor Element
  - `get_children()` -> `Array [ DatasmithActorElement ]` — Get the children of the mesh actor. Use AddChild -or- RemoveChild to modify the actorâs children
  - `get_children_count()` -> `int32` — Get the number of children on this actor
  - `get_layer()` -> `str` — Get the the name of the layer that contains this entity
  - `get_rotation()` -> `Quat` — Get rotation (in quaternion format) of this entity
  - `get_scale()` -> `Vector` — Get absolute scale of this entity
  - `get_tags()` -> `Array [ str ]` — Get the tags of an Actor element
  - `get_translation()` -> `Vector` — Get absolute translation of this entity
  - `get_visibility()` -> `bool` — Get the actorâs visibility
  - `remove_child(child)` -> `None` — Remove a new child from the Actor Element
  - `set_layer(layer)` -> `None` — Set the the the layer that contains this entity, layer will be auto-created from its name
  - `set_rotation(value)` -> `None` — Set rotation (in quaternion format) of this entity
  - `set_scale(value)` -> `None` — Set absolute scale of this entity
  - `set_tags(tags)` -> `None` — Set the tags of an Actor element
  - `set_translation(value)` -> `None` — Set absolute translation of this entity
  - `set_visibility(visibility)` -> `None` — Set the actorâs visibility

### `unreal.DatasmithBaseMaterialElement`
Inherits: `DatasmithObjectElement` | Header: `DatasmithUObjectElements.h`

UDatasmithBaseMaterialElement

### `unreal.DatasmithBasePropertyCaptureElement`
Inherits: `DatasmithObjectElement` | Header: `DatasmithUObjectElements.h`

UDatasmithBasePropertyCaptureElement

**Methods** (4):
  - `get_category()` -> `DatasmithPropertyCategory` — Gets the category of this property capture
  - `get_property_path()` -> `str` — Gets the path used when attempting to capture a generic property
  - `set_category(category)` -> `None` — Sets the category of this property capture
  - `set_property_path(path)` -> `None` — Sets the path used when attempting to capture a generic property

### `unreal.DatasmithCameraActorElement`
Inherits: `DatasmithActorElement` | Header: `DatasmithUObjectElements.h`

UDatasmithCameraActorElement

**Methods** (15):
  - `get_f_stop()` -> `float` — Get camera FStop also known as FNumber
  - `get_focal_length()` -> `float` — Get camera focal length in millimeters
  - `get_focus_distance()` -> `float` — Get camera focus distance in centimeters
  - `get_look_at_actor()` -> `str` — Get camera look at actor name
  - `get_look_at_allow_roll()` -> `bool` — Get camera look at allow roll state
  - `get_post_process()` -> `DatasmithPostProcessElement` — Get cameraâs postprocess
  - `get_sensor_aspect_ratio()` -> `float` — Get framebuffer aspect ratio (width/height)
  - `get_sensor_width()` -> `float` — Get camera sensor width in millimeters
  - `set_f_stop(f_stop)` -> `None` — Set camera FStop also known as FNumber
  - `set_focal_length(focal_length)` -> `None` — Set camera focal length in millimeters
  - `set_focus_distance(focus_distance)` -> `None` — Set camera focus distance in centimeters
  - `set_look_at_actor(actor_path_name)` -> `None` — Set camera look at actor name
  - `set_look_at_allow_roll(allow)` -> `None` — Set camera look at allow roll state
  - `set_sensor_aspect_ratio(sensor_aspect_ratio)` -> `None` — Set framebuffer aspect ratio (width/height)
  - `set_sensor_width(sensor_width)` -> `None` — Set camera sensor width in millimeters

### `unreal.DatasmithConsumer`
Inherits: `DataprepContentConsumer` | Header: `DatasmithConsumer.h`

Datasmith Consumer

**Methods** (1):
  - `get_datasmith_scene()` -> `DatasmithScene` — Get Datasmith Scene

**Properties** (5):
  - `datasmith_scene`: `DatasmithScene` — Removing use of TSoftObjectPtr
deprecated: Use GetDatasmithScene method to obtain the associated UDa...
  - `datasmith_scene_object_path`: `str` [Read-Only] — [Read-Only] Path to UDatasmithScene potentially linked to (str)
  - `output_level_object_path`: `str` [Read-Only] — [Read-Only] Path to ULevel potentially linked to (str)
  - `output_level_soft_object`: `SoftObjectPath` — [Read-Write]
deprecated: Property âOutputLevelSoftObjectâ is deprecated. (SoftObjectPath)
  - `unique_id`: `str` [Read-Only] — [Read-Only] Stores the level used on the last call to UDatasmithConsumer::Run (str)

### `unreal.DatasmithCustomActorElement`
Inherits: `DatasmithActorElement` | Header: `DatasmithUObjectElements.h`

UDatasmithCustomActorElement

**Methods** (7):
  - `add_property(property_)` -> `None` — Add a property to this blueprint actor
  - `get_class_or_path_name()` -> `str` — The blueprint to instantiate.
  - `get_properties_count()` -> `int32` — Get the total amount of properties in this blueprint actor
  - `get_property(i)` -> `DatasmithKeyValueProperty` — Get the property i-th of this blueprint actor
  - `get_property_by_name(name)` -> `DatasmithKeyValueProperty` — Get a property by its name if it exists
  - `remove_property(property_)` -> `None` — Removes a property from this blueprint actor, doesnât preserve ordering
  - `set_class_or_path_name(path_name)` -> `None` — Set Class or Path Name

### `unreal.DatasmithDirProducer`
Inherits: `DataprepContentProducer` | Header: `DatasmithFileProducer.h`

Datasmith Dir Producer

### `unreal.DatasmithFileProducer`
Inherits: `DataprepContentProducer` | Header: `DatasmithFileProducer.h`

Datasmith File Producer

### `unreal.DatasmithImportFactory`
Inherits: `SceneImportFactory` | Header: `DatasmithImportFactory.h`

ns DatasmithImportFactoryImpl

### `unreal.DatasmithKeyValueProperty`
Inherits: `DatasmithObjectElement` | Header: `DatasmithUObjectElements.h`

UDatasmithKeyValueProperty

**Methods** (4):
  - `get_property_type()` -> `DatasmithKeyValuePropertyType` — Get the type of this property
  - `get_value()` -> `str` — Get the value of this property
  - `set_property_type(type)` -> `None` — Set the type of this property
  - `set_value(value)` -> `None` — Sets the value of this property

### `unreal.DatasmithLevelVariantSetsElement`
Inherits: `DatasmithObjectElement` | Header: `DatasmithUObjectElements.h`

UDatasmithLevelVariantSetsElement

**Methods** (5):
  - `add_variant_set(variant_set)` -> `None` — Adds an existing variant set to this level variant sets
  - `create_variant_set(element_name)` -> `DatasmithVariantSetElement` — Create a new variant set and add it to the parent level variant sets
  - `get_variant_set(index)` -> `DatasmithVariantSetElement` — Gets a variant set from this level variant sets
  - `get_variant_sets_count()` -> `int32` — Gets how many variant sets are in this level variant sets
  - `remove_variant_set(variant_set)` -> `None` — Removes a variant set from this level variant sets

### `unreal.DatasmithLightActorElement`
Inherits: `DatasmithActorElement` | Header: `DatasmithUObjectElements.h`

UDatasmithLightActorElement

**Methods** (18):
  - `get_color()` -> `LinearColor` — Get light color on linear mode
  - `get_ies_brightness_scale()` -> `float` — Get the Ies brightness multiplier
  - `get_ies_file()` -> `str` — Get the path of the Ies definition file
  - `get_intensity()` -> `float` — Get light intensity
  - `get_temperature()` -> `float` — Get the light temperature in Kelvin
  - `get_use_ies()` -> `bool` — Set if this light is controlled by Ies definition file
  - `get_use_ies_brightness()` -> `bool` — Get if the emissive amount of the ies is controlled by the brightness scale
  - `get_use_temperature()` -> `bool` — Get if the light color is controlled by temperature
  - `is_enabled()` -> `bool` — Return true on light enabled, false otherwise
  - `set_color(color)` -> `None` — Set light color on linear mode
  - `set_enabled(is_enabled)` -> `None` — Set enable property of the light
  - `set_ies_brightness_scale(ies_brightness_scale)` -> `None` — Set the Ies brightness multiplier
  - `set_ies_file(ies_file)` -> `None` — Set the path of the Ies definition file
  - `set_intensity(intensity)` -> `None` — Set light intensity
  - `set_temperature(temperature)` -> `None` — Set the light temperature in Kelvin
  - `set_use_ies(use_ies)` -> `None` — Get if this light is controlled by Ies definition file
  - `set_use_ies_brightness(use_ies_brightness)` -> `None` — Set if the emissive amount of the ies is controlled by the brightness scale
  - `set_use_temperature(use_temperature)` -> `None` — Set if the light color is controlled by temperature

### `unreal.DatasmithMaterialIDElement`
Inherits: `DatasmithObjectElement` | Header: `DatasmithUObjectElements.h`

UDatasmithMaterialIDElement

**Methods** (1):
  - `get_id()` -> `int32` — Get Id

### `unreal.DatasmithMeshActorElement`
Inherits: `DatasmithActorElement` | Header: `DatasmithUObjectElements.h`

UDatasmithMeshActorElement

**Methods** (8):
  - `add_material_override(material)` -> `None` — Adds a new material to the Actor Element
  - `get_bounding_box_size()` -> `Vector` — Get the Bounding Box of the Actor as a Vector. X is Width, Y is Height, Z is Depth. The value will are taken from the Me...
  - `get_material_overrides_count()` -> `int32` — Get the amount of materials on this mesh
  - `get_materials()` -> `Array [ DatasmithMaterialIDElement ]` — Get the i-th material of this actor
  - `get_mesh_element()` -> `DatasmithMeshElement` — Get the Datasmith MeshElement associated with the actor. The Mesh can be a direct reference to an Unreal Mesh. If itâs...
  - `get_static_mesh_path_name()` -> `str` — Get the path name of the StaticMesh associated with the actor
  - `remove_material_override(material)` -> `None` — Get the amount of materials on this mesh
  - `set_static_mesh_path_name(static_mesh_name)` -> `None` — Set the path name of the StaticMesh that the actor is using It can be either a package path to refer to an existing mesh...

### `unreal.DatasmithMeshElement`
Inherits: `DatasmithObjectElement` | Header: `DatasmithUObjectElements.h`

UDatasmithMeshElement defines an actual geometry.

**Methods** (12):
  - `get_bounding_box_depth()` -> `float` — Get the bounding box depth
  - `get_bounding_box_height()` -> `float` — Get the bounding box height
  - `get_bounding_box_size()` -> `Vector` — Get the bounding box represented by a Vector. X is Width, Y is Height, Z is Depth.
  - `get_bounding_box_width()` -> `float` — Get the bounding box width
  - `get_file()` -> `str` — Get the output filename, it can be absolute or relative to the scene file
  - `get_light_map_area()` -> `float` — Get the total surface area
  - `get_lightmap_coordinate_index()` -> `int32` — Get the UV channel that will be used for the lightmap
  - `get_lightmap_source_uv()` -> `int32` — Get the source UV channel that will be used at import to generate the lightmap UVs
  - `get_material(slot_id)` -> `str` — Get the material name in the material slot SlotId
  - `set_lightmap_coordinate_index(uv_channel)` -> `None` — Set the UV channel that will be used for the lightmap Note: If the lightmap coordinate index is something greater than -...
  - `set_lightmap_source_uv(uv_channel)` -> `None` — Set the source UV channel that will be used at import to generate the lightmap UVs
  - `set_material(material_name, slot_id)` -> `None` — Set the material name to associate with slot SlotId

### `unreal.DatasmithMetaDataElement`
Inherits: `DatasmithObjectElement` | Header: `DatasmithUObjectElements.h`

UDatasmithMetaDataElement

**Methods** (5):
  - `get_associated_element()` -> `DatasmithObjectElement` — Get the element that is associated with this meta data
  - `get_properties()` — Get this metadata element properties as a map of keys and values
  - `get_properties_count()` -> `int32` — Get Properties Count
  - `get_property(i)` -> `DatasmithKeyValueProperty` — Get the property i-th of this meta data
  - `get_property_by_name(name)` -> `DatasmithKeyValueProperty` — Get a property by its name if it exists

### `unreal.DatasmithObjectElement`
Inherits: `Object` | Header: `DatasmithUObjectElements.h`

UDatasmithObjectElement

**Methods** (4):
  - `get_element_name()` -> `str` — Gets the element name
  - `get_label()` -> `str` — Gets the element label used in the UI
  - `is_element_valid()` -> `bool` — Is the Element still valid for the Datasmith Scene
  - `set_label(label)` -> `None` — Sets the element label used in the UI

### `unreal.DatasmithObjectPropertyCaptureElement`
Inherits: `DatasmithBasePropertyCaptureElement` | Header: `DatasmithUObjectElements.h`

UDatasmithObjectPropertyCaptureElement

**Methods** (2):
  - `get_recorded_object()` -> `DatasmithObjectElement` — Gets the category of this property capture
  - `set_recorded_object(object)` -> `None` — Gets the category of this property capture

### `unreal.DatasmithPostProcessElement`
Inherits: `DatasmithObjectElement` | Header: `DatasmithUObjectElements.h`

UDatasmithPostProcessElement

**Methods** (16):
  - `get_camera_iso()` -> `float` — Get camera ISO
  - `get_camera_shutter_speed()` -> `float` — Get camera shutter speed in 1/seconds (ie: 60 = 1/60s)
  - `get_color_filter()` -> `LinearColor` — Set color filter in linear color scale
  - `get_dof()` -> `float` — Get depth of field multiplier
  - `get_motion_blur()` -> `float` — Get motion blur multiplier
  - `get_saturation()` -> `float` — Get color saturation
  - `get_temperature()` -> `float` — Get color filter temperature in Kelvin
  - `get_vignette()` -> `float` — Get vignette amount
  - `set_camera_iso(camera_iso)` -> `None` — Set camera ISO
  - `set_camera_shutter_speed(camera_shutter_speed)` -> `None` — Set camera shutter speed in 1/seconds (ie: 60 = 1/60s)
  - `set_color_filter(color_filter)` -> `None` — Get color filter in linear color scale
  - `set_dof(dof)` -> `None` — Set depth of field multiplier
  - `set_motion_blur(motion_blur)` -> `None` — Set motion blur multiplier
  - `set_saturation(saturation)` -> `None` — Set color saturation
  - `set_temperature(temperature)` -> `None` — Set color filter temperature in Kelvin
  - `set_vignette(vignette)` -> `None` — Set vignette amount

### `unreal.DatasmithPropertyCaptureElement`
Inherits: `DatasmithBasePropertyCaptureElement` | Header: `DatasmithUObjectElements.h`

UDatasmithPropertyCaptureElement

**Methods** (24):
  - `get_value_bool()` -> `bool` — Get the recorded value for this property as a boolean. Returned value is meaningless if the property is not of boolean t...
  - `get_value_color()` -> `Color` — Get the recorded value for this property as a color. Returned value is meaningless if the property is not of color type.
  - `get_value_float()` -> `float` — Get the recorded value for this property as a float. Returned value is meaningless if the property is not of float type.
  - `get_value_int()` -> `int32` — Get the recorded value for this property as an int32. Returned value is meaningless if the property is not of int32 type...
  - `get_value_int_point()` -> `IntPoint` — Get the recorded value for this property as an int point. Returned value is meaningless if the property is not of int po...
  - `get_value_linear_color()` -> `LinearColor` — Get the recorded value for this property as a linear color. Returned value is meaningless if the property is not of line...
  - `get_value_quat()` -> `Quat` — Get the recorded value for this property as a quat. Returned value is meaningless if the property is not of quat type.
  - `get_value_rotator()` -> `Rotator` — Get the recorded value for this property as a rotator. Returned value is meaningless if the property is not of rotator t...
  - `get_value_string()` -> `str` — Get the recorded value for this property as a string. Returned value is meaningless if the property is not of string typ...
  - `get_value_vector()` -> `Vector` — Get the recorded value for this property as a vector. Returned value is meaningless if the property is not of vector typ...
  - `get_value_vector2d()` -> `Vector2D` — Get the recorded value for this property as a vector2d. Returned value is meaningless if the property is not of vector2 ...
  - `get_value_vector4()` -> `Vector4` — Get the recorded value for this property as a vector4. Returned value is meaningless if the property is not of vector4 t...
  - `set_value_bool(value)` -> `None` — Set the recorded value for this capture
  - `set_value_color(value)` -> `None` — Set the recorded value for this capture
  - `set_value_float(value)` -> `None` — Set the recorded value for this capture
  - `set_value_int(value)` -> `None` — Set the recorded value for this capture
  - `set_value_int_point(value)` -> `None` — Set the recorded value for this capture
  - `set_value_linear_color(value)` -> `None` — Set the recorded value for this capture
  - `set_value_quat(value)` -> `None` — Set the recorded value for this capture
  - `set_value_rotator(value)` -> `None` — Set the recorded value for this capture
  - `set_value_string(value)` -> `None` — Set the recorded value for this capture
  - `set_value_vector(value)` -> `None` — Set the recorded value for this capture
  - `set_value_vector2d(value)` -> `None` — Set the recorded value for this capture
  - `set_value_vector4(value)` -> `None` — Set the recorded value for this capture

### `unreal.DatasmithSceneElement`
Inherits: `DatasmithSceneElementBase` | Header: `DatasmithBlueprintLibrary.h`

Datasmith Scene Element

**Methods** (12):
  - `construct_datasmith_scene_from_cad_files(file_paths)` -> `DatasmithSceneElement` [classmethod] — Open set of CAD files as actors in a single datasmith scene Importing set of files into single DatasmithScene asset(with...
  - `construct_datasmith_scene_from_file(file_path)` -> `DatasmithSceneElement` [classmethod] — Open an existing UDatasmith file from disk.
  - `construct_datasmith_scene_from_source_uri(source_uri)` -> `DatasmithSceneElement` [classmethod] — Open an existing Datasmith source from the SourceUri.
  - `destroy_scene()` -> `None` — Destroy reference to the udatasmith file. The Scene will no longer be available. DestroyScene is called automatically af...
  - `get_all_options()` -> `Map [ type ( Class ) , Object ]` — List all the options structures applicable on this scene
  - `get_existing_datasmith_scene(asset_path)` -> `DatasmithSceneElement` [classmethod] — Open an existing DatasmithScene asset file from disk.
  - `get_import_options()` -> `DatasmithImportOptions` — Get Import Options deprecated: GetImportOptions is deprecated, use GetOptions instead.
  - `get_options(option_type = None)` -> `Object` — Fetch the typed options for this scene
  - `import_scene(destination_folder)` -> `DatasmithImportFactoryCreateFileResult` — Import a Datasmith Scene created with ConstructDatasmithSceneFromFile.
  - `import_scenes(destination_folder)` -> `Array [ DatasmithImportFactoryCreateFileResult ]` — Import a Datasmith Scene created with ConstructDatasmithSceneFromFiles into an array of scenes.
  - `reimport_scene()` -> `DatasmithImportFactoryCreateFileResult` — Reimport a scene opened with GetExistingDatasmithScene
  - `translate_scene()` -> `bool` — Trigger the translation phase, which populates the DatasmithScene. note that options should have been set before that an...

### `unreal.DatasmithSceneElementBase`
Inherits: `Object` | Header: `DatasmithUSceneElement.h`

Datasmith Scene Element Base

**Methods** (43):
  - `attach_actor(new_parent, child, attachment_rule)` -> `None` — Attach the actor to its new parent. Detach the actor if it was already attached.
  - `attach_actor_to_scene_root(new_parent, attachment_rule)` -> `None` — Attach the actor to the scene root. Detach the actor if it was already attached.
  - `create_camera_actor(element_name)` -> `DatasmithCameraActorElement` — Create a new Camera Actor and add it to the Datasmith scene
  - `create_level_variant_sets(element_name)` -> `DatasmithLevelVariantSetsElement` — Create a new level variant sets and add it to the Datasmith scene
  - `create_mesh(element_name)` -> `DatasmithMeshElement` — Create a new Mesh and add it to the Datasmith scene
  - `create_mesh_actor(element_name)` -> `DatasmithMeshActorElement` — Create a new MeshActor and add it to the Datasmith scene
  - `create_texture(element_name)` -> `DatasmithTextureElement` — Create a new Texture and add it to the Datasmith scene
  - `get_all_camera_actors()` -> `Array [ DatasmithCameraActorElement ]` — Create an array with all the CameraActor in the Datasmith scene without taking into account the hierarchy. Use CreateCam...
  - `get_all_custom_actors()` -> `Array [ DatasmithCustomActorElement ]` — Create an array with all the CustomActor in the Datasmith scene without taking into account the hierarchy. Use RemoveCus...
  - `get_all_level_variant_sets()` -> `Array [ DatasmithLevelVariantSetsElement ]` — Create an array with all the level variants sets from the Datasmith scene Use CreateLevelVariantSets -or- RemoveLevelVar...
  - `get_all_light_actors()` -> `Array [ DatasmithLightActorElement ]` — Create an array with all the LightActor in the Datasmith scene without taking into account the hierarchy. Use RemoveLigh...
  - `get_all_materials()` -> `Array [ DatasmithBaseMaterialElement ]` — Create an array with all the Materials in the Datasmith scene
  - `get_all_mesh_actors()` -> `Array [ DatasmithMeshActorElement ]` — Create an array with all the MeshActor in the Datasmith scene without taking into account the hierarchy. Use CreateMeshA...
  - `get_all_metadata(object_class)` -> `Array [ DatasmithMetaDataElement ]` — Find all metadata elements associated with objects of the given type.
  - `get_all_objects_and_values_for_key()` — Find all objects of the given type that have a metadata element that contains the given key and their associated values.
  - `get_camera_actors()` -> `Array [ DatasmithCameraActorElement ]` — Create an array with the CameraActor in the Datasmith scene that are at the root level of the hierarchy. Use CreateCamer...
  - `get_custom_actors()` -> `Array [ DatasmithCustomActorElement ]` — Create an array with the CustomActor in the Datasmith scene that are at the root level of the hierarchy. Use RemoveCusto...
  - `get_export_duration()` -> `int32` — Returns the time taken to export the scene
  - `get_exporter_version()` -> `str` — Returns the Datasmith version used to export the scene
  - `get_host()` -> `str` — Sets the name of the host application which created the scene
  - `get_light_actors()` -> `Array [ DatasmithLightActorElement ]` — Create an array with the LightActor in the Datasmith scene that are at the root level of the hierarchy. Use RemoveLightA...
  - `get_mesh_actors()` -> `Array [ DatasmithMeshActorElement ]` — Create an array with the MeshActor in the Datasmith scene that are at the root level of the hierarchy. Use CreateMeshAct...
  - `get_mesh_by_path_name(mesh_path_name)` -> `DatasmithMeshElement` — Find in the Datasmith scene the MeshElement that correspond to the mesh path name. The function will return an invalid M...
  - `get_meshes()` -> `Array [ DatasmithMeshElement ]` — Create an array with all the Mesh in the Datasmith scene. Use CreateMesh -or- RemoveMesh to modify the Datasmith scene.
  - `get_metadata_for_object(object)` -> `DatasmithMetaDataElement` — Get Meta Data for Object
  - `get_metadata_keys_and_values_for_value()` — Get the keys and values for which the associated value contains the string to match for the metadata element associated ...
  - `get_metadata_value_for_key(object, key)` -> `str` — Get the value associated with the given key of the metadata element associated with the given object.
  - `get_post_process()` -> `DatasmithPostProcessElement` — Get the Postprocess used by the scene. Can be invalid.
  - `get_product_name()` -> `str` — Returns the product name of the application used to export the scene
  - `get_product_version()` -> `str` — Returns the product version of the application used to export the scene
  - `get_textures()` -> `Array [ DatasmithTextureElement ]` — Create an array with all the Textures in the Datasmith scene. Call CreateTexture -or- RemoveTexture to modify the Datasm...
  - `get_use_physical_sky()` -> `bool` — Physical Sky could be generated in a large amount of modes, like material, lights etc thatâs why it has been added as ...
  - `get_user_id()` -> `str` — Returns the user identifier who exported the scene
  - `get_user_os()` -> `str` — Returns the OS name used by user who exported the scene
  - `get_vendor()` -> `str` — Returns the vendor name of the application used to export the scene
  - `remove_camera_actor(mesh_actor, remove_rule = DatasmithActorRemovalRule.REMOVE_CHILDREN)` -> `None` — Remove the Camera actor from the Datasmith scene
  - `remove_custom_actor(custom_actor, remove_rule = DatasmithActorRemovalRule.REMOVE_CHILDREN)` -> `None` — Remove the LightActor from the Datasmith scene
  - `remove_level_variant_sets(element)` -> `None` — Remove the level variant sets from the Datasmith scene
  - `remove_light_actor(light_actor, remove_rule = DatasmithActorRemovalRule.REMOVE_CHILDREN)` -> `None` — Remove the LightActor from the Datasmith scene
  - `remove_material(element)` -> `None` — Remove the material from the Datasmith scene
  - `remove_mesh(mesh)` -> `None` — Remove the mesh from the Datasmith scene
  - `remove_mesh_actor(mesh_actor, remove_rule = DatasmithActorRemovalRule.REMOVE_CHILDREN)` -> `None` — Remove the MeshActor from the Datasmith scene
  - `remove_texture(element)` -> `None` — Remove the Texture from the Datasmith scene

### `unreal.DatasmithStaticMeshLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `DatasmithBlueprintLibrary.h`

Datasmith Static Mesh Blueprint Library

**Methods** (2):
  - `compute_lightmap_resolution(objects, apply_changes, ideal_ratio = 0.200000)` -> `None` [classmethod] — Sets the proper lightmap resolution to get the desired lightmap density ratio
  - `setup_static_lighting(objects, apply_changes, generate_lightmap_u_vs, lightmap_resolution_ideal_ratio = 0.200000)` -> `None` [classmethod] — Setup the Lightmap UVs settings to enable or disable the lightmap generation on the static meshes found in the Assets li...

### `unreal.DatasmithStringMetadataValueFetcher`
Inherits: `DataprepStringsArrayFetcher` | Header: `DatasmithDataprepFetcher.h`

Filter objects based on the key value of their metadata.

**Properties** (2):
  - `key`: `Name` — [Read-Write] The key for the for the string (Name)
  - `key_match`: `MetadataKeyMatchingCriteria` — [Read-Write] (MetadataKeyMatchingCriteria)

### `unreal.DatasmithTextureElement`
Inherits: `DatasmithObjectElement` | Header: `DatasmithUObjectElements.h`

UDatasmithTextureElement

**Methods** (10):
  - `get_allow_resize()` -> `bool` — Get allow texture resizing
  - `get_color_space()` -> `DatasmithColorSpace` — Gets the color space of the texture
  - `get_file()` -> `str` — Get texture filename
  - `get_rgb_curve()` -> `float` — Get texture gamma <= 0 for auto
  - `get_texture_mode()` -> `DatasmithTextureMode` — Get texture usage
  - `set_allow_resize(allow_resize)` -> `None` — Set allow texture resizing
  - `set_color_space(option)` -> `None` — Sets the color space of the texture
  - `set_file(file)` -> `None` — Set texture filename
  - `set_rgb_curve(rgb_curve)` -> `None` — Set texture gamma <= 0 for auto
  - `set_texture_mode(mode)` -> `None` — Set texture usage

### `unreal.DatasmithTexturePipeline`
Inherits: `InterchangePipelineBase` | Header: `DatasmithTextureImporter.h`

Datasmith Texture Pipeline

### `unreal.DatasmithVariantElement`
Inherits: `DatasmithObjectElement` | Header: `DatasmithUObjectElements.h`

UDatasmithVariantElement

**Methods** (5):
  - `add_actor_binding(binding)` -> `None` — Adds an existing actor binding to this variant
  - `create_actor_binding()` -> `DatasmithActorBindingElement` — Create a new actor binding and add it to this variant
  - `get_actor_binding(index)` -> `DatasmithActorBindingElement` — Gets an actor binding from this variant
  - `get_actor_bindings_count()` -> `int32` — Gets how many actor bindings are in this variant
  - `remove_actor_binding(binding)` -> `None` — Removes an actor binding from this variant

### `unreal.DatasmithVariantSetElement`
Inherits: `DatasmithObjectElement` | Header: `DatasmithUObjectElements.h`

UDatasmithVariantSetElement

**Methods** (5):
  - `add_variant(variant)` -> `None` — Adds an existing variant to this variant set
  - `create_variant(element_name)` -> `DatasmithVariantElement` — Create a new variant and add it to the parent variant set
  - `get_variant(index)` -> `DatasmithVariantElement` — Gets a variant from this variant set
  - `get_variants_count()` -> `int32` — Gets how many variants are in this variant set
  - `remove_variant(variant)` -> `None` — Removes a variant from this variant set

### `unreal.UVGenerationFlattenMapping`
Inherits: `BlueprintFunctionLibrary` | Header: `UVGenerationFlattenMapping.h`

UVGeneration Flatten Mapping

**Methods** (1):
  - `generate_flatten_mapping_u_vs(static_mesh, uv_channel, angle_threshold = 66.000000)` -> `None` [classmethod] — Generate Flatten Mapping UVs

### `unreal.UVGenerationFlattenMappingOperation`
Inherits: `DataprepOperation` | Header: `UVGenerationDataprepOperation.h`

For each static mesh to process, generate an unwrapped UV map in the specified channel

**Properties** (3):
  - `angle_threshold`: `float` — [Read-Write] (float)
  - `channel_selection`: `UnwrappedUVDatasmithOperationChannelSelection` — [Read-Write] (UnwrappedUVDatasmithOperationChannelSelection)
  - `uv_channel`: `int` — [Read-Write] The UV channel where to generate the flatten mapping (int32)

### `unreal.MetadataKeyMatchingCriteria`
Inherits: `EnumBase` | Header: `DatasmithDataprepFetcher.h`

EMetadata Key Matching Criteria

**Properties** (2):
  - `CONTAINS`: `MetadataKeyMatchingCriteria = Ellipsis` — 1
  - `EXACT_MATCH`: `MetadataKeyMatchingCriteria = Ellipsis` — 0

### `unreal.UnwrappedUVDatasmithOperationChannelSelection`
Inherits: `EnumBase` | Header: `UVGenerationDataprepOperation.h`

EUnwrapped UVDatasmith Operation Channel Selection

**Properties** (2):
  - `FIRST_EMPTY_CHANNEL`: `UnwrappedUVDatasmithOperationChannelSelection = Ellipsis` — Generate the unwrapped UV in the first UV channel that is empty. 0
  - `SPECIFY_CHANNEL`: `UnwrappedUVDatasmithOperationChannelSelection = Ellipsis` — Manually select the target UV channel for the unwrapped UV generation. 1
