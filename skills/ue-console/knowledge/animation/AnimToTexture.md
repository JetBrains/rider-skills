# UE Python API — AnimToTexture Module

**9 types** from the `AnimToTexture` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimToTextureAnimInfo`, `AnimToTextureAnimSequenceInfo`, `AnimToTextureAutoPlayData`, `AnimToTextureFrameData`, `AnimToTextureDataAsset`, `AnimToTextureInstancePlaybackLibrary`, `AnimToTextureMode`, `AnimToTextureNumBoneInfluences`, `AnimToTexturePrecision`

---

## Classes

### `unreal.AnimToTextureAnimInfo`
Inherits: `StructBase` | Header: `AnimToTextureDataAsset.h`

Anim to Texture Anim Info

**Properties** (2):
  - `end_frame`: `int` [Read-Only] — [Read-Only] (int32)
  - `start_frame`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.AnimToTextureAnimSequenceInfo`
Inherits: `StructBase` | Header: `AnimToTextureDataAsset.h`

Anim to Texture Anim Sequence Info

**Properties** (5):
  - `anim_sequence`: `AnimSequence` — [Read-Write] (AnimSequence)
  - `enabled`: `bool` — [Read-Write] (bool)
  - `end_frame`: `int` — [Read-Write] Animation End Frame (Inclusive) (int32)
  - `start_frame`: `int` — [Read-Write] Animation Start Frame (int32)
  - `use_custom_range`: `bool` — [Read-Write] Use Custom FrameRange (bool)

### `unreal.AnimToTextureAutoPlayData`
Inherits: `StructBase` | Header: `AnimToTextureInstancePlaybackHelpers.h`

Anim to Texture Auto Play Data

**Properties** (4):
  - `end_frame`: `float` — [Read-Write] Last frame of animation (float)
  - `play_rate`: `float` — [Read-Write] Rate for increasing and decreasing speed. (float)
  - `start_frame`: `float` — [Read-Write] Starting frame for animation. (float)
  - `time_offset`: `float` — [Read-Write] Adds offset to time (float)

### `unreal.AnimToTextureFrameData`
Inherits: `StructBase` | Header: `AnimToTextureInstancePlaybackHelpers.h`

Anim to Texture Frame Data

**Properties** (2):
  - `frame`: `float` — [Read-Write] Frame to be played (float)
  - `prev_frame`: `float` — [Read-Write] Previous Frame (this is needeed for motion blur) (float)

### `unreal.AnimToTextureDataAsset`
Inherits: `PrimaryDataAsset` | Header: `AnimToTextureDataAsset.h`

Anim to Texture Data Asset

**Methods** (6):
  - `bp_get_bone_position_texture()` -> `Texture2D` — BP Get Bone Position Texture
  - `bp_get_bone_rotation_texture()` -> `Texture2D` — BP Get Bone Rotation Texture
  - `bp_get_bone_weight_texture()` -> `Texture2D` — BP Get Bone Weight Texture
  - `bp_get_skeletal_mesh()` -> `SkeletalMesh` — BP Get Skeletal Mesh
  - `bp_get_static_mesh()` -> `StaticMesh` — BP Get Static Mesh
  - `get_index_from_anim_sequence(sequence)` -> `int32`

**Properties** (35):
  - `anim_sequences`: `None` — [Read-Write] (Array[AnimToTextureAnimSequenceInfo])
  - `animation_index`: `int` — [Read-Write] AnimationIndex Index of the animation to play.
This will internally set Start and End F...
  - `animations`: `None` [Read-Only] — [Read-Only] (Array[AnimToTextureAnimInfo])
  - `attach_to_socket`: `Name` — [Read-Write] Bone used for Rigid Binding. The bone needs to be part of the RawBones.
Sockets and Vir...
  - `auto_play`: `bool` — [Read-Write] AutoPlay will use Engine Time for driving the animation.
This will be used by UpdateMat...
  - `bone_min_b_box`: `Vector3f` [Read-Only] — [Read-Only] (Vector3f)
  - `bone_position_texture`: `Texture2D` — [Read-Write] Texture for storing bone positions
This is only used on Bone Mode (Texture2D)
  - `bone_rotation_texture`: `Texture2D` — [Read-Write] Texture for storing bone rotations
This is only used on Bone Mode (Texture2D)
  - `bone_rows_per_frame`: `int` [Read-Only] — [Read-Only] (int32)
  - `bone_size_b_box`: `Vector3f` [Read-Only] — [Read-Only] (Vector3f)
  - `bone_weight_rows_per_frame`: `int` [Read-Only] — [Read-Only] (int32)
  - `bone_weight_texture`: `Texture2D` — [Read-Write] Texture for storing vertex/bone weighting
This is only used on Bone Mode (Texture2D)
  - `enforce_power_of_two`: `bool` — [Read-Write] Enforce Power Of Two on texture resolutions. (bool)
  - `frame`: `int` — [Read-Write] Frame to play
When not using AutoPlay, user is responsible of setting the frame.
This w...
  - `max_height`: `int` — [Read-Write] Max resolution of the texture.
A smaller size will be used if the data fits. (int32)
  - `max_width`: `int` — [Read-Write] Max resolution of the texture.
A smaller size will be used if the data fits. (int32)
  - `mode`: `AnimToTextureMode` — [Read-Write] Storage Mode.
Vertex: will store per-vertex position and normal.
Bone: Will store per-b...
  - `num_bone_influences`: `AnimToTextureNumBoneInfluences` — [Read-Write] Number of Bone Influences for deformation. More influences will produce smoother result...
  - `num_bones`: `int` [Read-Only] — [Read-Only] Total Number of Bones (int32)
  - `num_driver_triangles`: `int` — [Read-Write] Number of Driver Triangles
Each StaticMesh Vertex will be influenced by N SkeletalMesh ...
  - `num_frames`: `int` [Read-Only] — [Read-Only] Total Number of Frames in all animations (int32)
  - `precision`: `AnimToTexturePrecision` — [Read-Write] Texture Precision (AnimToTexturePrecision)
  - `root_transform`: `Transform` — [Read-Write] Adds transformation to baked textures.
This can be used for adding an offset to the ani...
  - `sample_rate`: `float` — [Read-Write] (float)
  - `sigma`: `float` — [Read-Write] Inverse Distance Weighting
This exponent value will be used for computing weights for t...
  - `skeletal_lod_index`: `int` — [Read-Write] SkeletalMesh LOD to bake. (int32)
  - `skeletal_mesh`: `SkeletalMesh` — [Read-Write] SkeletalMesh to bake animations from. (SkeletalMesh)
  - `static_lod_index`: `int` — [Read-Write] StaticMesh LOD to bake to. (int32)
  - `static_mesh`: `StaticMesh` — [Read-Write] StaticMesh to bake to. (StaticMesh)
  - `uv_channel`: `int` — [Read-Write] StaticMesh UVChannel Index for storing vertex information.
Make sure this index does no...
  - `vertex_min_b_box`: `Vector3f` [Read-Only] — [Read-Only] (Vector3f)
  - `vertex_normal_texture`: `Texture2D` — [Read-Write] Texture for storing vertex normals
This is only used on Vertex Mode (Texture2D)
  - `vertex_position_texture`: `Texture2D` — [Read-Write] Texture for storing vertex positions
This is only used on Vertex Mode (Texture2D)
  - `vertex_rows_per_frame`: `int` [Read-Only] — [Read-Only] (int32)
  - `vertex_size_b_box`: `Vector3f` [Read-Only] — [Read-Only] (Vector3f)

### `unreal.AnimToTextureInstancePlaybackLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AnimToTextureInstancePlaybackHelpers.h`

Anim to Texture Instance Playback Library

**Methods** (8):
  - `batch_update_instances_auto_play_data(instanced_mesh_component, auto_play_data, transforms, mark_render_state_dirty = True)` -> `bool` [classmethod] — Updates all instances with the given Transforms and AutoPlayData
  - `batch_update_instances_frame_data(instanced_mesh_component, frame_data, transforms, mark_render_state_dirty = True)` -> `bool` [classmethod] — Updates all instances with the given Transforms and FrameData
  - `get_auto_play_data_from_data_asset(data_asset, animation_index, time_offset = 0.000000, play_rate = 1.000000)` -> `AnimToTextureAutoPlayData or None` [classmethod] — Returns an AutoPlayData with the Start and End Frame for the given AnimationIndex. If AnimationIndex is out of range, fa...
  - `get_frame(time, start_frame, end_frame, time_offset = 0.000000, play_rate = 1.000000, sample_rate = 30.000000)` -> `float` [classmethod] — Get Frame
  - `get_frame_data_from_data_asset(data_asset, animation_index, time, time_offset = 0.000000, play_rate = 1.000000)` -> `AnimToTextureFrameData or None` [classmethod] — Get Frame Data from Data Asset
  - `setup_instanced_mesh_component(instanced_mesh_component, num_instances, auto_play)` -> `bool` [classmethod] — Adds Instances and allocates the necessary CustomData.
  - `update_instance_auto_play_data(instanced_mesh_component, instance_index, auto_play_data, mark_render_state_dirty = True)` -> `bool` [classmethod] — Updates a single instance with given AutoPlayData
  - `update_instance_frame_data(instanced_mesh_component, instance_index, frame_data, mark_render_state_dirty = True)` -> `bool` [classmethod]

### `unreal.AnimToTextureMode`
Inherits: `EnumBase` | Header: `AnimToTextureDataAsset.h`

EAnim to Texture Mode

**Properties** (2):
  - `BONE`: `AnimToTextureMode = Ellipsis` — Linear Blending Skinnin 1
  - `VERTEX`: `AnimToTextureMode = Ellipsis` — Position and Normal Per-Vertex 0

### `unreal.AnimToTextureNumBoneInfluences`
Inherits: `EnumBase` | Header: `AnimToTextureDataAsset.h`

EAnim to Texture Num Bone Influences

**Properties** (3):
  - `FOUR`: `AnimToTextureNumBoneInfluences = Ellipsis` — Blend between four influences 2
  - `ONE`: `AnimToTextureNumBoneInfluences = Ellipsis` — Single bone influence 0
  - `TWO`: `AnimToTextureNumBoneInfluences = Ellipsis` — Blend between two influences 1

### `unreal.AnimToTexturePrecision`
Inherits: `EnumBase` | Header: `AnimToTextureDataAsset.h`

EAnim to Texture Precision

**Properties** (2):
  - `EIGHT_BITS`: `AnimToTexturePrecision = Ellipsis` — 8 bits 0
  - `SIXTEEN_BITS`: `AnimToTexturePrecision = Ellipsis` — 16 bits 1
