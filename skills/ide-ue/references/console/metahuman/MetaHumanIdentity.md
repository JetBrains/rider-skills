# UE Python API — MetaHumanIdentity Module

**21 types** from the `MetaHumanIdentity` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MetaHumanIdentityABViewportState`, `MetaHumanIdentityPoseState`, `MetaHumanIdentity`, `MetaHumanIdentityBody`, `MetaHumanIdentityCameraFrame`, `MetaHumanIdentityFace`, `MetaHumanIdentityFootageFrame`, `MetaHumanIdentityHands`, `MetaHumanIdentityOutfit`, `MetaHumanIdentityPart`, `MetaHumanIdentityPose`, `MetaHumanIdentityPromotedFrame`, `MetaHumanIdentityProp`, `MetaHumanIdentityViewportSettings`, `MetaHumanTemplateMesh`, `MetaHumanTemplateMeshComponent`, `PromotedFrameUtils`, `ConformType`, `IdentityPoseType`, `IdentityTreeNodeIdentifier`, ... (21 total)

---

## Classes

### `unreal.MetaHumanIdentityABViewportState`
Inherits: `StructBase` | Header: `MetaHumanIdentityViewportSettings.h`

UMetaHumanIdentityViewportSettings

### `unreal.MetaHumanIdentityPoseState`
Inherits: `StructBase` | Header: `MetaHumanIdentityViewportSettings.h`

MetaHuman Identity Pose State

### `unreal.MetaHumanIdentity`
Inherits: `Object` | Header: `MetaHumanIdentity.h`

MetaHuman Identity Asset

**Methods** (15):
  - `can_add_part_of_class(part_class)` -> `bool` — Returns true if the given Part class can be added to the MetaHuman Identity being edited
  - `can_add_pose_of_class(pose_class, pose_type)` -> `bool` — Returns true if the given Pose class can be added to the MetaHuman Identity being edited
  - `create_dna_for_identity(log_only)` -> `None` — Create DNAFor Identity
  - `diagnostics_indicates_processing_issue()` -> `Text or None` — Diagnostics Indicates Processing Issue
  - `export_dna_data_to_files(dna_path_with_name, brows_path_with_name)` -> `bool` — Export DNA and brows data to files at selected location
  - `find_part_of_class(part_class)` -> `MetaHumanIdentityPart` — Looks for a Part of the given class in the array of parts. Returns nullptr if no Part was found
  - `get_or_create_part_of_class(part_class)` -> `MetaHumanIdentityPart` — Looks for a Part of the given class in the array of parts. Creates and return a new one if not found
  - `handle_error(error_code, log_only = False)` -> `bool` [classmethod] — Deals with error produced by the MetaHuman Identity process - logs message and optionally show user dialog
  - `import_dna_file(dna_file_path, dna_data_layer, brows_file_path)` -> `IdentityErrorCode` — Initialize the MetaHuman Identity from a DNA file. The MetaHuman Identity must already have a face for this to succeeded
  - `is_auto_rigging_in_progress()` -> `bool` — Is Auto Rigging in Progress
  - `is_frame_tracking_pipeline_processing()` -> `bool` — Is Frame Tracking Pipeline Processing
  - `is_logged_in_to_service()` -> `bool` — This function checks if thereâs a session stored. There is NO request sent to check if the token is actually valid
  - `log_in_to_auto_rig_service()` -> `None` — Log in to Auto Rig Service
  - `set_blocking_processing(blocking_processing)` -> `None` — Set Blocking Processing
  - `start_frame_tracking_pipeline(image_data, width, height, depth_frame_path, pose, promoted_frame, show_progress)` -> `None` — Start Frame Tracking Pipeline

**Properties** (3):
  - `on_auto_rig_service_finished_dynamic_delegate`: `OnAutoRigServiceFinishedDynamicDelegate` — [Read-Write] Dynamic delegate called when the pipeline finishes running (OnAutoRigServiceFinishedDyn...
  - `parts`: `None` [Read-Only] — [Read-Only] The list of Parts the make this Identity. See UMetaHumanIdentityPart (Array[MetaHumanIde...
  - `viewport_settings`: `MetaHumanIdentityViewportSettings` — [Read-Write] Stores the viewport settings for this MetaHuman Identity (MetaHumanIdentityViewportSett...

### `unreal.MetaHumanIdentityBody`
Inherits: `MetaHumanIdentityPart` | Header: `MetaHumanIdentityParts.h`

UMetaHumanIdentityBody

**Properties** (2):
  - `body_type_index`: `int` — [Read-Write] (int32)
  - `height`: `int` — [Read-Write] (int32)

### `unreal.MetaHumanIdentityCameraFrame`
Inherits: `MetaHumanIdentityPromotedFrame` | Header: `MetaHumanIdentityPromotedFrames.h`

MetaHuman Identity Camera Frame

### `unreal.MetaHumanIdentityFace`
Inherits: `MetaHumanIdentityPart` | Header: `MetaHumanIdentityParts.h`

MetaHuman Identity Face

**Methods** (10):
  - `add_pose_of_type(pose_type, pose)` -> `None` — Adds the given pose to this face. Does nothing if a pose of the same type already exists
  - `conform(conform_type = ConformType.SOLVE)` -> `IdentityErrorCode` — MetaHuman Identity solve
  - `export_template_mesh(path, asset_name)` -> `None` — Export Template Mesh
  - `find_pose_by_type(pose_type)` -> `MetaHumanIdentityPose` — Finds a Pose of given type. Returns nullptr if one is not found.
  - `get_poses()` -> `Array [ MetaHumanIdentityPose ]` — Get Poses
  - `has_dna_buffer()` -> `bool` — Has DNABuffer
  - `has_predictive_solvers()` -> `bool` — Has Predictive Solvers
  - `is_conformal_rig_valid()` -> `bool` — Returns true if the conformal rig component is valid and points to a valid skeletal mesh
  - `remove_pose(pose)` -> `bool` — Remove Pose
  - `run_predictive_solver_training()` -> `bool` — Runs predictive solvers training externally (through python script or UE editor). Returns true if the process was succes...

**Properties** (3):
  - `dna_pivot`: `Vector` — [Read-Write] Holds the DNA Pivot as returned from the autorigging service
deprecated: The new autori...
  - `dna_scale`: `float` — [Read-Write] Holds the DNA Scale as returned from the autorigging service
deprecated: The new autori...
  - `dna_to_scan_transform`: `Transform` — [Read-Write] Holds the DNAToScan transform as returned from the autorigging service
deprecated: The ...

### `unreal.MetaHumanIdentityFootageFrame`
Inherits: `MetaHumanIdentityPromotedFrame` | Header: `MetaHumanIdentityPromotedFrames.h`

UMetaHumanIdentityFootageFrame

**Properties** (1):
  - `frame_number`: `int` — [Read-Write] (int32)

### `unreal.MetaHumanIdentityHands`
Inherits: `MetaHumanIdentityPart` | Header: `MetaHumanIdentityParts.h`

UMetaHumanIdentityHands

### `unreal.MetaHumanIdentityOutfit`
Inherits: `MetaHumanIdentityPart` | Header: `MetaHumanIdentityParts.h`

UMetaHumanIdentityOutfit

### `unreal.MetaHumanIdentityPart`
Inherits: `Object` | Header: `MetaHumanIdentityParts.h`

The base class for any Part that can be added to a MetaHumanIdentity

**Methods** (2):
  - `diagnostics_indicates_processing_issue()` -> `Text or None` — Returns true if diagnostics indicates an issue processing this part, and also passes back a warning message if a diagnos...
  - `initialize()` -> `None` — Perform any initialization required after the Part is created

### `unreal.MetaHumanIdentityPose`
Inherits: `Object` | Header: `MetaHumanIdentityPose.h`

A Pose describes the appearance of the MetaHuman Identity in some way. It could be a mesh or footage showing the Identityâs teeth or its neutral expression.

**Methods** (6):
  - `add_new_promoted_frame(out_promoted_frame_index=int32)` — brief: Creates a new promoted frame suitable for this pose. The type of the promoted frame will be based on PromotedFram...
  - `get_capture_data()` -> `CaptureData` — Get Capture Data
  - `is_capture_data_valid()` -> `bool` — Returns true if the capture is initialized
  - `load_default_tracker()` -> `None` — Sets the default tracker based on the PoseType. Only changes it DefaultTracker is not currently set
  - `remove_promoted_frame(promoted_frame)` -> `None` — Removes the given promoted frame from this pose
  - `set_capture_data(capture_data)` -> `None` — Set Capture Data

**Properties** (5):
  - `fit_eyes`: `bool` — [Read-Write] Whether or not to use the data driven approach to fit the eyes in the template mesh (bo...
  - `pose_type`: `IdentityPoseType` — [Read-Write] The type this pose represents (IdentityPoseType)
  - `promoted_frame_class`: `Class` [Read-Only] — [Read-Only] The class the defines the Promoted Frame type for this pose (type(Class))
  - `promoted_frames`: `None` [Read-Only] — [Read-Only] The array of Promoted Frames for this pose (Array[MetaHumanIdentityPromotedFrame])
  - `timecode_alignment`: `TimecodeAlignment` — [Read-Write] Controls alignment of media tracks via their timecode (TimecodeAlignment)

### `unreal.MetaHumanIdentityPromotedFrame`
Inherits: `Object` | Header: `MetaHumanIdentityPromotedFrames.h`

UMetaHumanIdentityPromotedFrame

**Methods** (8):
  - `can_track()` -> `bool` — Returns true if this Promoted Frame has all the required information to track
  - `diagnostics_indicates_processing_issue(minimum_depth_map_face_coverage, minimum_depth_map_face_width)` -> `Text or None`
  - `frame_contours_contain_active_data()` -> `bool` — Returns true if ContourData in ShapeAnnotation contains any curves that are active
  - `is_navigation_locked()` -> `bool` — Is Navigation Locked
  - `is_tracking_manually()` -> `bool` — Is Tracking Manually
  - `is_tracking_on_change()` -> `bool` — Is Tracking on Change
  - `set_navigation_locked(is_locked)` -> `None` — Set Navigation Locked
  - `toggle_navigation_locked()` -> `None` — Toggle Navigation Locked

**Properties** (1):
  - `is_front_view`: `bool` — [Read-Write] Whether this promoted frame is front view (bool)

### `unreal.MetaHumanIdentityProp`
Inherits: `MetaHumanIdentityPart` | Header: `MetaHumanIdentityParts.h`

UMetaHumanIdentityProp

### `unreal.MetaHumanIdentityViewportSettings`
Inherits: `MetaHumanViewportSettings` | Header: `MetaHumanIdentityViewportSettings.h`

MetaHuman Identity Viewport Settings

**Methods** (8):
  - `get_frame_time_for_pose(pose_type)` -> `FrameTime` — Get Frame Time for Pose
  - `get_selected_promoted_frame(pose_type)` -> `int32` — Get Selected Promoted Frame
  - `is_current_pose_visible(view)` -> `bool` — Is Current Pose Visible
  - `is_template_mesh_visible(view)` -> `bool` — Is Template Mesh Visible
  - `set_frame_time_for_pose(pose_type, frame_time)` -> `None` — Set Frame Time for Pose
  - `set_selected_promoted_frame(pose_type, promoted_frame_index)` -> `None` — Set Selected Promoted Frame
  - `toggle_current_pose_visibility(view)` -> `None` — Toggle Current Pose Visibility
  - `toggle_template_mesh_visibility(view)` -> `None` — Toggle Template Mesh Visibility

**Properties** (1):
  - `selected_tree_node`: `IdentityTreeNodeIdentifier` — [Read-Write] (IdentityTreeNodeIdentifier)

### `unreal.MetaHumanTemplateMesh`
Inherits: `DynamicMeshComponent` | Header: `MetaHumanIdentityParts.h`

UMetaHumanTemplateMesh

### `unreal.MetaHumanTemplateMeshComponent`
Inherits: `PrimitiveComponent` | Header: `MetaHumanTemplateMeshComponent.h`

Component to manages different aspects of the MetaHuman Identity Template Mesh. This component makes use of Dynamic Meshes to store and display data. It can be used to store one mesh for each supporte...

### `unreal.PromotedFrameUtils`
Inherits: `Object` | Header: `PromotedFrameUtils.h`

Utility functions to generate data for promoted frame

**Methods** (3):
  - `get_image_path_for_frame(footage_capture_data, camera, frame_id, is_image_sequence, alignment)` -> `str` [classmethod] — A helper function to determine the full path to a frame, taking into account timecode alignment
  - `get_promoted_frame_as_pixel_array_from_disk(image_path)` -> `(out_image_size=IntPoint, out_local_samples=Array[Color]) or None` [classmethod] — Assigns loaded texture from specified path to TArray of BGRA colors. Returns true if successfully read and assigned data
  - `initialize_contour_data_for_footage_frame(pose, footage_frame)` -> `bool` [classmethod] — Initialization function exposed for scripting - parses contour data config & updates footage frame

### `unreal.ConformType`
Inherits: `EnumBase` | Header: `MetaHumanIdentityParts.h`

EConform Type

**Properties** (2):
  - `COPY`: `ConformType = Ellipsis` — Copy the data from the Neutral Pose face mesh to the Template Mesh.
Assumes the target mesh is alrea...
  - `SOLVE`: `ConformType = Ellipsis` — Use the Face Fitting conformer, i.e. FitIdentity 0

### `unreal.IdentityPoseType`
Inherits: `EnumBase` | Header: `MetaHumanIdentityPose.h`

EIdentity Pose Type

**Properties** (4):
  - `CUSTOM`: `IdentityPoseType = Ellipsis` — 3
  - `INVALID`: `IdentityPoseType = Ellipsis` — 0
  - `NEUTRAL`: `IdentityPoseType = Ellipsis` — 1
  - `TEETH`: `IdentityPoseType = Ellipsis` — 2

### `unreal.IdentityTreeNodeIdentifier`
Inherits: `EnumBase` | Header: `MetaHumanIdentityViewportSettings.h`

EIdentity Tree Node Identifier

**Properties** (9):
  - `BODY_NODE`: `IdentityTreeNodeIdentifier = Ellipsis` — 5
  - `FACE_NEUTRAL_POSE`: `IdentityTreeNodeIdentifier = Ellipsis` — 7
  - `FACE_NODE`: `IdentityTreeNodeIdentifier = Ellipsis` — 4
  - `FACE_POSE_LIST`: `IdentityTreeNodeIdentifier = Ellipsis` — 6
  - `FACE_TEETH_POSE`: `IdentityTreeNodeIdentifier = Ellipsis` — 8
  - `IDENTITY_ROOT`: `IdentityTreeNodeIdentifier = Ellipsis` — 1
  - `NONE`: `IdentityTreeNodeIdentifier = Ellipsis` — 0
  - `SKELETAL_MESH`: `IdentityTreeNodeIdentifier = Ellipsis` — 3
  - `TEMPLATE_MESH`: `IdentityTreeNodeIdentifier = Ellipsis` — 2

### `unreal.MetaHumanIdentity_OnAutoRigServiceFinishedDynamicDelegate`
Inherits: `MulticastDelegateBase` | Header: `MetaHumanIdentity.h`

On Auto Rig Service Finished Dynamic Delegate Delegate Signature
