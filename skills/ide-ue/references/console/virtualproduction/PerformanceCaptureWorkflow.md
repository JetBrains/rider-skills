# UE Python API — PerformanceCaptureWorkflow Module

**46 types** from the `PerformanceCaptureWorkflow` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimNode_LiveLinkProp`, `PCapProductionRecord`, `PCapRecordBase`, `PCapSessionRecord`, `PCapSlateRecord`, `PCapTakeRecord`, `PCapTokenisedFolderPath`, `PCapTokenisedString`, `LiveLinkDataPreview`, `LiveLinkDataPreviewComponent`, `PCap_DataAssetFactory`, `PCapBoneVisualiser`, `PCapCharacterDataAsset`, `PCapDataAsset`, `PCapDataTable`, `PCapDataTableFactory`, `PCapMarkerVisualizer`, `PCapMVVMResolver`, `PCapNamingTokens`, `PCapPerformerDataAsset`, ... (46 total)

---

## Classes

### `unreal.AnimNode_LiveLinkProp`
Inherits: `AnimNode_Base` | Header: `AnimNode_LiveLinkProp.h`

This animnode is exclusively for Mocap props - single bone skeleton meshes. Not exposed to the animation graph

**Properties** (4):
  - `do_live_link_evaluation`: `bool` — [Read-Write] (bool)
  - `input_pose`: `PoseLink` — [Read-Write] (PoseLink)
  - `live_link_subject_name`: `LiveLinkSubjectName` — [Read-Write] (LiveLinkSubjectName)
  - `offset_transform`: `Transform` — [Read-Write] (Transform)

### `unreal.PCapProductionRecord`
Inherits: `PCapRecordBase` | Header: `PCapDatabase.h`

PCap Production Record

**Properties** (2):
  - `production_name`: `Name` — [Read-Write] (Name)
  - `production_notes`: `str` — [Read-Write] (str)

### `unreal.PCapRecordBase`
Inherits: `TableRowBase` | Header: `PCapDatabase.h`

Database structs

**Properties** (2):
  - `is_archived`: `bool` — [Read-Write] (bool)
  - `uid`: `Guid` [Read-Only] — [Read-Only] (Guid)

### `unreal.PCapSessionRecord`
Inherits: `PCapRecordBase` | Header: `PCapDatabase.h`

PCap Session Record

**Properties** (23):
  - `additional_folders`: `None` [Read-Only] — [Read-Only] (Array[str])
  - `character_path`: `str` [Read-Only] — [Read-Only] (str)
  - `characters`: `None` [Read-Only] — [Read-Only] (Array[PCapCharacterDataAsset])
  - `common_path`: `str` [Read-Only] — [Read-Only] (str)
  - `is_world_partition`: `bool` [Read-Only] — [Read-Only] (bool)
  - `performer_path`: `str` [Read-Only] — [Read-Only] (str)
  - `performers`: `None` [Read-Only] — [Read-Only] (Array[PCapPerformerDataAsset])
  - `production_name`: `Name` [Read-Only] — [Read-Only] ID of Production this Session belongs to (Name)
  - `production_uid`: `Guid` [Read-Only] — [Read-Only] (Guid)
  - `prop_path`: `str` [Read-Only] — [Read-Only] (str)
  - `props`: `None` [Read-Only] — [Read-Only] (Array[PCapPropDataAsset])
  - `scene_path`: `str` [Read-Only] — [Read-Only] (str)
  - `session_data_layer`: `DataLayerAsset` [Read-Only] — [Read-Only] (DataLayerAsset)
  - `session_date_time`: `DateTime` [Read-Only] — [Read-Only] (DateTime)
  - `session_name`: `Name` [Read-Only] — [Read-Only] Name for this session (Name)
  - `session_notes`: `str` — [Read-Write] (str)
  - `session_output_name`: `str` [Read-Only] — [Read-Only] (str)
  - `session_path`: `str` [Read-Only] — [Read-Only] (str)
  - `session_slate_table`: `PCapDataTable` — [Read-Write] (PCapDataTable)
  - `session_template`: `PCapSessionTemplate` [Read-Only] — [Read-Only] (PCapSessionTemplate)
  - `sub_level`: `World` [Read-Only] — [Read-Only] (World)
  - `takes_data_table`: `DataTable` [Read-Only] — [Read-Only] (DataTable)
  - `takes_path`: `str` [Read-Only] — [Read-Only] (str)

### `unreal.PCapSlateRecord`
Inherits: `PCapRecordBase` | Header: `PCapDatabase.h`

PCap Slate Record

**Properties** (4):
  - `session_uid`: `Guid` [Read-Only] — [Read-Only] /UID of the session this Slate is used in (Guid)
  - `slate`: `str` — [Read-Write] /Name of slate (str)
  - `slate_note`: `str` — [Read-Write] /Note on slate. This will be passed to Take Recorder (str)
  - `slate_status`: `PCapSlateStatus` — [Read-Write] /Status of Slate (PCapSlateStatus)

### `unreal.PCapTakeRecord`
Inherits: `PCapRecordBase` | Header: `PCapDatabase.h`

PCap Take Record

**Properties** (14):
  - `contains_live_link_sources`: `bool` — [Read-Write] Does this recording LiveLinkSource tracks (bool)
  - `end_timecode`: `Timecode` [Read-Only] — [Read-Only] End Timecode (Timecode)
  - `externally_replaced`: `bool` — [Read-Write] Has the animation recorded for this take been replaced with an external asset import.
T...
  - `flag`: `bool` — [Read-Write] Temporary Flag. Transient, so will not be saved (bool)
  - `framerate`: `FrameRate` [Read-Only] — [Read-Only] Recorded Framerate (FrameRate)
  - `live_link_plotted`: `bool` — [Read-Write] Has this take been processed for plotting (bool)
  - `mocap_stage_root_transform`: `Transform` — [Read-Write] Transform of the stage root when this recording was made (Transform)
  - `rating`: `int` — [Read-Write] 5-Star Rating (int32)
  - `recorded_take`: `LevelSequence` — [Read-Write] The level sequence recorded (LevelSequence)
  - `session_uid`: `Guid` [Read-Only] — [Read-Only] (Guid)
  - `start_timecode`: `Timecode` [Read-Only] — [Read-Only] Start Timecode (Timecode)
  - `take_duration_seconds`: `float` [Read-Only] — [Read-Only] Seconds Duration (float)
  - `take_duration_timecode`: `Timecode` [Read-Only] — [Read-Only] HHMMSSFF Duration (Timecode)
  - `take_status`: `PCapTakeStatus` — [Read-Write] Status of Take - Thumbs Up, Thumbs Down or None (PCapTakeStatus)

### `unreal.PCapTokenisedFolderPath`
Inherits: `StructBase` | Header: `PCapSessionTemplate.h`

PCap Tokenised Folder Path

**Properties** (2):
  - `folder_path_output`: `str` [Read-Only] — [Read-Only] (str)
  - `folder_path_template`: `str` [Read-Only] — [Read-Only] (str)

### `unreal.PCapTokenisedString`
Inherits: `StructBase` | Header: `PCapSessionTemplate.h`

Struct for handling conversion of token entry template into a validated folder path

**Properties** (2):
  - `output`: `str` [Read-Only] — [Read-Only] (str)
  - `template`: `str` [Read-Only] — [Read-Only] (str)

### `unreal.LiveLinkDataPreview`
Inherits: `Actor` | Header: `LiveLinkDataPreview.h`

Actor for visualizing LiveLink data in the viewport/level editor

**Methods** (2):
  - `initialize_subjects()` -> `None` — Initialize Subjects
  - `set_enable_live_link_data(new_evaluate)` -> `None` — Set Enable Live Link Data

**Properties** (4):
  - `billboard_component`: `BillboardComponent` — [Read-Write] (BillboardComponent)
  - `draw_labels`: `bool` — [Read-Write] (bool)
  - `evaluate_live_link`: `bool` — [Read-Write] (bool)
  - `subjects`: `None` — [Read-Write] (Array[LiveLinkSubjectName])

### `unreal.LiveLinkDataPreviewComponent`
Inherits: `InstancedStaticMeshComponent` | Header: `LiveLinkDataPreviewComponent.h`

An instance static mesh component for drawing LiveLink subject data in-level. Support drawing Transforms, Locators, Skeletons and Cameras

**Methods** (2):
  - `set_draw_labels(new_draw_label)` -> `None` — Set Draw Labels
  - `set_evaluate_live_link_data(new_evaluate_live_link)` -> `None` — Set Evaluate Live Link Data

**Properties** (4):
  - `bone_visual_type`: `LiveLinkVisualBoneType` — [Read-Write] (LiveLinkVisualBoneType)
  - `draw_labels`: `bool` [Read-Only] — [Read-Only] (bool)
  - `evaluate_live_link`: `bool` [Read-Only] — [Read-Only] (bool)
  - `subject_name`: `LiveLinkSubjectName` — [Read-Write] (LiveLinkSubjectName)

### `unreal.PCap_DataAssetFactory`
Inherits: `Factory` | Header: `PCapAssetFactory.h`

PCap Data Asset Factory

### `unreal.PCapBoneVisualiser`
Inherits: `InstancedStaticMeshComponent` | Header: `PCapBoneVisualizer.h`

Instanced Static Mesh Component for drawing bones and joints on Skeletal Mesh. Only usable with SkeletalMesh Actors

**Properties** (3):
  - `color`: `LinearColor` — [Read-Write] (LinearColor)
  - `dynamic_material`: `MaterialInstanceDynamic` [Read-Only] — [Read-Only] (MaterialInstanceDynamic)
  - `visualization_type`: `BoneVisualType` — [Read-Write] Whether to draw joints along the length of the bone, or just at the pivot or scaled by ...

### `unreal.PCapCharacterDataAsset`
Inherits: `PCapDataAsset` | Header: `PCapDatabase.h`

Mocap Character Data asset

**Properties** (7):
  - `additional_meshes`: `None` — [Read-Write] Additional meshes that will be added as child components (Array[SkeletalMesh])
  - `capture_character_class`: `Class` — [Read-Write] Character actor Class (Class)
  - `character_name`: `Name` — [Read-Write] Optional Name for Character. If blank DataAsset name will be used (Name)
  - `ik_rig`: `IKRigDefinition` — [Read-Write] IKRig Asset (IKRigDefinition)
  - `retargeter`: `IKRetargeter` — [Read-Write] Retarget Asset (IKRetargeter)
  - `skeletal_mesh`: `SkeletalMesh` — [Read-Write] Main Skeletal Mesh Asset. This will be the root component of any characters spawned. A ...
  - `source_performer_asset`: `PCapPerformerDataAsset` — [Read-Write] Source Performer Asset for this Character (PCapPerformerDataAsset)

### `unreal.PCapDataAsset`
Inherits: `PrimaryDataAsset` | Header: `PCapDatabase.h`

Performance Capture DataAsset. Contains references to assets used for Performance Capture Workflows

**Properties** (1):
  - `asset_uid`: `Guid` [Read-Only] — [Read-Only] Guid for disambiguating actors spawned by the data assets (Guid)

### `unreal.PCapDataTable`
Inherits: `DataTable` | Header: `PCapDataTable.h`

PCap Data Table

**Methods** (4):
  - `add_table_row(new_row)` -> `bool` — Add a given new row to the datatable.
  - `duplicate_table_row(source_row, new_row)` -> `bool` — Duplicate a given new row to the datatable.
  - `insert_table_row(selected_row, new_row, above)` -> `bool` — Insert a given new row in to the datatable, above or below the selected row.
  - `remove_table_row(row_name)` -> `bool` — Remove a given row from the datatable.

**Properties** (1):
  - `on_datatable_modified`: `OnDatatableModified` — [Read-Write] (OnDatatableModified)

### `unreal.PCapDataTableFactory`
Inherits: `DataTableFactory` | Header: `PCapAssetFactory.h`

Custom PCapDataTable Factory

### `unreal.PCapMarkerVisualizer`
Inherits: `InstancedStaticMeshComponent` | Header: `PCapMarkerVisualizer.h`

An Instanced Static Mesh Component to represent Motion Capture marker data locations

**Properties** (7):
  - `draw_labels`: `bool` — [Read-Write] To Do - add text labels to drawn markers (bool)
  - `dynamic_material`: `MaterialInstanceDynamic` [Read-Only] — [Read-Only] UPROPERTY(EditAnywhere, BlueprintReadWrite, Category=âPerformanceCapture|Visualization...
  - `evaluate_live_link`: `bool` — [Read-Write] To Do - add text labels to drawn markers (bool)
  - `live_link_subject`: `LiveLinkSubjectName` — [Read-Write] (LiveLinkSubjectName)
  - `marker_locations`: `None` — [Read-Write] (Array[Transform])
  - `x_axis_sign`: `AxisSign` — [Read-Write] (AxisSign)
  - `y_axis_sign`: `AxisSign` — [Read-Write] (AxisSign)

### `unreal.PCapMVVMResolver`
Inherits: `MVVMViewModelContextResolver` | Header: `PCapMVVMResolver.h`

Editor-only resolver class

### `unreal.PCapNamingTokens`
Inherits: `NamingTokens` | Header: `PCapNamingTokens.h`

PCap Naming Tokens

### `unreal.PCapPerformerDataAsset`
Inherits: `PCapDataAsset` | Header: `PCapDatabase.h`

Mocap Performer DataAsset

**Properties** (7):
  - `base_skeletal_mesh`: `SkeletalMesh` — [Read-Write] Performer Base Skeleton (SkeletalMesh)
  - `ik_rig`: `IKRigDefinition` — [Read-Write] Performer IKRig (IKRigDefinition)
  - `live_link_subject`: `LiveLinkSubjectName` — [Read-Write] LiveLink Subject for this Performer (LiveLinkSubjectName)
  - `performer_actor_class`: `Class` — [Read-Write] Performer Actor class to use for this performer (Class)
  - `performer_color`: `LinearColor` — [Read-Write] Color for this performer (LinearColor)
  - `performer_name`: `Name` — [Read-Write] LiveLink Subject for the body of this Performer (Name)
  - `performer_proportioned_mesh`: `SkeletalMesh` — [Read-Write] Performer Mesh. This must be created in a T or A Pose performer from a LiveLink pose (S...

### `unreal.PCapPropComponent`
Inherits: `ActorComponent` | Header: `PCapPropComponent.h`

A component for use in Motion Capture props. Accepts data as either a LiveLink Transform Role or an Animation Role. If the Live Link data is in the Animation role, this component will take the root bo...

**Methods** (7):
  - `get_controlled_component()` -> `SceneComponent` — Returns the component controlled by this component. Can return null.
  - `get_evaluate_live_link_data()` -> `bool` — Get the LiveLink Evaluation State. Subject must have the Animation Role Type.
  - `get_live_link_subject()` -> `LiveLinkSubjectName` — Get the LiveLink Subject Name.
  - `set_controlled_component(component)` -> `None` — Sets the component controlled by this component. Component must be within the same actor as this Prop component.
  - `set_evaluate_live_link_data(evaluate_link_link)` -> `None` — Set the LiveLink data to update the Skeletal Mesh pose.
  - `set_live_link_subject(subject)` -> `None` — Set Live Link Subject
  - `set_offset_transform(new_offset)` -> `None` — Update the local space offset to this propâs Live Link pose.

**Properties** (3):
  - `is_controlled_by_sequencer`: `bool` [Read-Only] — [Read-Only] Overrides all LiveLink data and offset transform. Must be manually set on possessable bi...
  - `offset_transform`: `Transform` [Read-Only] — [Read-Only] Offset the incoming LiveLink Transform data in the local space of the controlled compone...
  - `spawning_data_asset`: `Name` [Read-Only] — [Read-Only] The package name of the spawning data asset, if there is one. (Name)

### `unreal.PCapPropDataAsset`
Inherits: `PCapDataAsset` | Header: `PCapDatabase.h`

Prop DataAsset

**Properties** (7):
  - `custom_prop_class`: `Class` — [Read-Write] Custom Class - if you want your prop to be created from a custom BP actor, set the clas...
  - `hidden_in_game`: `bool` — [Read-Write] Choose True for props you want to hide in âGameâ view e.g. Proxies or integrators (...
  - `live_link_subject`: `LiveLinkSubjectName` — [Read-Write] Propâs LiveLinkSubject (LiveLinkSubjectName)
  - `prop_name`: `Name` — [Read-Write] Optional Name for Prop. If blank LiveLinkSubject name will be used (Name)
  - `prop_offset_transform`: `Transform` — [Read-Write] Static Mesh Offset Transform * (Transform)
  - `prop_skeletal_mesh`: `SkeletalMesh` — [Read-Write] Prop SkelMesh - if this is left blank the mocap static mesh will be used (SkeletalMesh)
  - `prop_static_mesh`: `StaticMesh` — [Read-Write] Prop Static - if this is left blank the mocap static mesh will be used (StaticMesh)

### `unreal.PCapPropLiveLinkAnimInstance`
Inherits: `AnimInstance` | Header: `PCapPropLiveLinkAnimInstance.h`

PCap Prop Live Link Anim Instance

**Methods** (3):
  - `enable_live_link_evaluation(do_enable)` -> `None` — Enable Live Link Evaluation
  - `set_offset_transform(offset)` -> `None` — Set Offset Transform
  - `set_subject(subject_name)` -> `None` — Set Subject

### `unreal.PCapSessionTemplate`
Inherits: `PCapDataAsset` | Header: `PCapSessionTemplate.h`

Data asset for defining all the folders that will be created for a session Can be duplicated and locked to ensure all tokenized strings become serialized static data.

**Methods** (1):
  - `update_all_fields()` -> `None` — Update All Fields

**Properties** (25):
  - `additional_folders`: `None` [Read-Only] — [Read-Only] Use the additional folders for any extra data you want contain in your session - eg audi...
  - `animation_asset_name`: `PCapTokenisedString` [Read-Only] — [Read-Only] (PCapTokenisedString)
  - `animation_sub_directory`: `PCapTokenisedString` [Read-Only] — [Read-Only] (PCapTokenisedString)
  - `animation_track_name`: `PCapTokenisedString` [Read-Only] — [Read-Only] (PCapTokenisedString)
  - `audio_asset_name`: `PCapTokenisedString` [Read-Only] — [Read-Only] (PCapTokenisedString)
  - `audio_source_name`: `PCapTokenisedString` [Read-Only] — [Read-Only] (PCapTokenisedString)
  - `audio_sub_directory`: `PCapTokenisedString` [Read-Only] — [Read-Only] (PCapTokenisedString)
  - `audio_track_name`: `PCapTokenisedString` [Read-Only] — [Read-Only] (PCapTokenisedString)
  - `character_folder`: `PCapTokenisedFolderPath` [Read-Only] — [Read-Only] Character folder template (PCapTokenisedFolderPath)
  - `common_folder`: `PCapTokenisedFolderPath` [Read-Only] — [Read-Only] Common folder template* (PCapTokenisedFolderPath)
  - `is_editable`: `bool` [Read-Only] — [Read-Only] * Use this to effectively âlockâ the asset and prevent any dynamic tokens from being...
  - `performer_folder`: `PCapTokenisedFolderPath` [Read-Only] — [Read-Only] Performer folder template (PCapTokenisedFolderPath)
  - `production_name`: `str` — [Read-Write] (str)
  - `prop_folder`: `PCapTokenisedFolderPath` [Read-Only] — [Read-Only] Prop folder template (PCapTokenisedFolderPath)
  - `record_possessable`: `bool` [Read-Only] — [Read-Only] (bool)
  - `record_subscenes`: `bool` [Read-Only] — [Read-Only] (bool)
  - `record_timecode`: `bool` [Read-Only] — [Read-Only] * Take Record related fields (bool)
  - `scene_folder`: `PCapTokenisedFolderPath` [Read-Only] — [Read-Only] Scene data folder template (PCapTokenisedFolderPath)
  - `session_folder`: `PCapTokenisedFolderPath` [Read-Only] — [Read-Only] Session folder template (PCapTokenisedFolderPath)
  - `session_name`: `str` — [Read-Write] (str)
  - `session_token`: `PCapTokenisedString` [Read-Only] — [Read-Only] The final name of our session, including any tokens you include in itâs construction. ...
  - `start_at_current_timecode`: `bool` [Read-Only] — [Read-Only] (bool)
  - `take_folder`: `PCapTokenisedFolderPath` [Read-Only] — [Read-Only] Take Recorder folder template (PCapTokenisedFolderPath)
  - `take_save_name`: `PCapTokenisedString` [Read-Only] — [Read-Only] This be used by take recorder as the name of the recorded level sequence and the folder ...
  - `template_root_folder`: `DirectoryPath` [Read-Only] — [Read-Only] * Core session fields (DirectoryPath)

### `unreal.PCapViewmodel`
Inherits: `MVVMViewModelBase` | Header: `PCapViewmodel.h`

PCap Viewmodel

**Methods** (1):
  - `initialize()` -> `None` — Initialize

### `unreal.PerformanceCaptureBPFunctionLibrary`
Inherits: `EditorFunctionLibrary` | Header: `PCapBPFunctionLibrary.h`

Performance Capture BPFunction Library

**Methods** (3):
  - `get_all_actors_with_component(world_context_object, component)` -> `Array [ Actor ]` [classmethod] — Find all Actors in the world containing at least one instance of the given component class. This is a very slow operatio...
  - `sanitize_file_string(string)` -> `str` [classmethod] — Returns a string stripped of the following characters []{}1!â$Â£%^&*()+=;:?/|â #~:
  - `sanitize_path_string(string)` -> `str` [classmethod] — Returns a string stripped of the following characters []{}1!â$Â£%^&*()+=;:?|â #~: Note filepath delimiters are not e...

### `unreal.PerformanceCaptureDatabaseHelper`
Inherits: `Object` | Header: `PCapDatabase.h`

Performance Capture Database Helper

**Methods** (2):
  - `create_record()` -> `None` — Create Record
  - `delete_record()` -> `None` — Delete Record

### `unreal.PerformanceCaptureSettings`
Inherits: `Object` | Header: `PCapSettings.h`

Per Project Settings for Performance Capture.

**Methods** (4):
  - `get_performance_capture_settings()` -> `PerformanceCaptureSettings` [classmethod] — Get Performance Capture Settings
  - `set_production_table(new_data_table)` -> `None` — Set Production Table
  - `set_session_table(new_data_table)` -> `None` — Set Session Table
  - `show_performance_capture_project_settings()` -> `None` — Show Performance Capture Project Settings

**Properties** (8):
  - `default_performer_skel_mesh`: `SkeletalMesh` [Read-Only] — [Read-Only] Base skeletal mesh for Mocap performers (SkeletalMesh)
  - `default_session_template`: `PCapSessionTemplate` [Read-Only] — [Read-Only] This Asset defines the folder structure and settings used in a performance capture sessi...
  - `mocap_manager_ui`: `EditorUtilityWidgetBlueprint` [Read-Only] — [Read-Only] Editor Utility Widget class that will be used for the Mocap Manager UI (EditorUtilityWid...
  - `on_p_cap_settings_changed`: `OnPCapSettingsChanged` — [Read-Write] (OnPCapSettingsChanged)
  - `production_table`: `PCapDataTable` [Read-Only] — [Read-Only] (PCapDataTable)
  - `session_table`: `PCapDataTable` [Read-Only] — [Read-Only] (PCapDataTable)
  - `stage_root`: `Class` [Read-Only] — [Read-Only] Stage Root Actor to spawn for Performance Capture. Class must derive from APerformanceCa...
  - `view_model_class`: `Class` [Read-Only] — [Read-Only] Blueprint Viewmodel class. If you change class you will need to restart the editor to pi...

### `unreal.PerformanceCaptureStageRoot`
Inherits: `Actor` | Header: `PCapStageRoot.h`

Performance Capture Stage Root

**Properties** (3):
  - `decal_component`: `DecalComponent` — [Read-Write] (DecalComponent)
  - `map_capture_component`: `SceneCaptureComponent2D` — [Read-Write] (SceneCaptureComponent2D)
  - `stage_mesh_parent`: `SceneComponent` — [Read-Write] (SceneComponent)

### `unreal.PerformanceCaptureSubsystem`
Inherits: `EngineSubsystem` | Header: `PCapSubsystem.h`

Performance Capture Subsystem

**Methods** (2):
  - `get_database_helper()` -> `PerformanceCaptureDatabaseHelper` — ~End UEditorSubsystem
  - `get_view_model_collection()` -> `MVVMViewModelCollectionObject` — Get View Model Collection

**Properties** (9):
  - `on_p_cap_actor_modified`: `OnPCapActorModified` — [Read-Write] Editor Only (OnPCapActorModified)
  - `on_p_cap_asset_added`: `OnPCapAssetAdded` — [Read-Write] Editor Only (OnPCapAssetAdded)
  - `on_p_cap_asset_editor_close`: `OnPCapAssetEditorClose` — [Read-Write] Editor Only (OnPCapAssetEditorClose)
  - `on_p_cap_asset_editor_open`: `OnPCapAssetEditorOpen` — [Read-Write] Editor Only (OnPCapAssetEditorOpen)
  - `on_p_cap_asset_removed`: `OnPCapAssetRemoved` — [Read-Write] Editor Only (OnPCapAssetRemoved)
  - `on_p_cap_asset_renamed`: `OnPCapAssetRenamed` — [Read-Write] Editor Only (OnPCapAssetRenamed)
  - `on_p_cap_editor_redo`: `OnPCapEditorRedo` — [Read-Write] Editor Only (OnPCapEditorRedo)
  - `on_p_cap_editor_undo`: `OnPCapEditorUndo` — [Read-Write] Editor Only (OnPCapEditorUndo)
  - `on_p_cap_live_link_subject_update`: `OnPCapLiveLinkSubjectUpdate` — [Read-Write] Editor Only (OnPCapLiveLinkSubjectUpdate)

### `unreal.AxisSign`
Inherits: `EnumBase` | Header: `PCapMarkerVisualizer.h`

EAxis Sign

**Properties** (2):
  - `NEGATIVE`: `AxisSign = Ellipsis` — 1
  - `POSITIVE`: `AxisSign = Ellipsis` — 0

### `unreal.BoneVisualType`
Inherits: `EnumBase` | Header: `PCapBoneVisualizer.h`

EBone Visual Type

**Properties** (2):
  - `BONE`: `BoneVisualType = Ellipsis` — 1
  - `JOINT`: `BoneVisualType = Ellipsis` — 0

### `unreal.LiveLinkVisualBoneType`
Inherits: `EnumBase` | Header: `LiveLinkDataPreviewComponent.h`

ELive Link Visual Bone Type

**Properties** (2):
  - `BONE`: `LiveLinkVisualBoneType = Ellipsis` — 1
  - `JOINT`: `LiveLinkVisualBoneType = Ellipsis` — 0

### `unreal.PCapSlateStatus`
Inherits: `EnumBase` | Header: `PCapDatabase.h`

EPCap Slate Status

**Properties** (3):
  - `COMPLETE`: `PCapSlateStatus = Ellipsis` — Slate is marked complete 1
  - `INCOMPLETE`: `PCapSlateStatus = Ellipsis` — Slate is incomplete 0
  - `SKIP`: `PCapSlateStatus = Ellipsis` — Slate is marked to skip 2

### `unreal.PCapTakeStatus`
Inherits: `EnumBase` | Header: `PCapDatabase.h`

EPCap Take Status

**Properties** (3):
  - `NEUTRAL`: `PCapTakeStatus = Ellipsis` — 2
  - `THUMBS_DOWN`: `PCapTakeStatus = Ellipsis` — 1
  - `THUMBS_UP`: `PCapTakeStatus = Ellipsis` — 0

### `unreal.PCapDataTable_OnDatatableModified`
Inherits: `MulticastDelegateBase` | Header: `PCapDataTable.h`

On Datatable Modified Delegate Signature

### `unreal.PerformanceCaptureSettings_OnPCapSettingsChanged`
Inherits: `MulticastDelegateBase` | Header: `PCapSettings.h`

On PCap Settings Changed Delegate Signature

### `unreal.PerformanceCaptureSubsystem_OnPCapActorModified`
Inherits: `MulticastDelegateBase` | Header: `PCapSubsystem.h`

On PCap Actor Modified Delegate Signature

### `unreal.PerformanceCaptureSubsystem_OnPCapAssetAdded`
Inherits: `MulticastDelegateBase` | Header: `PCapSubsystem.h`

On PCap Asset Added Delegate Signature

### `unreal.PerformanceCaptureSubsystem_OnPCapAssetEditorClose`
Inherits: `MulticastDelegateBase` | Header: `PCapSubsystem.h`

On PCap Asset Editor Close Delegate Signature

### `unreal.PerformanceCaptureSubsystem_OnPCapAssetEditorOpen`
Inherits: `MulticastDelegateBase` | Header: `PCapSubsystem.h`

On PCap Asset Editor Open Delegate Signature

### `unreal.PerformanceCaptureSubsystem_OnPCapAssetRemoved`
Inherits: `MulticastDelegateBase` | Header: `PCapSubsystem.h`

On PCap Asset Removed Delegate Signature

### `unreal.PerformanceCaptureSubsystem_OnPCapAssetRenamed`
Inherits: `MulticastDelegateBase` | Header: `PCapSubsystem.h`

On PCap Asset Renamed Delegate Signature

### `unreal.PerformanceCaptureSubsystem_OnPCapEditorRedo`
Inherits: `MulticastDelegateBase` | Header: `PCapSubsystem.h`

On PCap Editor Redo Delegate Signature

### `unreal.PerformanceCaptureSubsystem_OnPCapEditorUndo`
Inherits: `MulticastDelegateBase` | Header: `PCapSubsystem.h`

On PCap Editor Undo Delegate Signature

### `unreal.PerformanceCaptureSubsystem_OnPCapLiveLinkSubjectUpdate`
Inherits: `MulticastDelegateBase` | Header: `PCapSubsystem.h`

On PCap Live Link Subject Update Delegate Signature
