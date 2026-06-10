# UE Python API — AppleARKitFaceSupport Module

**2 types** from the `AppleARKitFaceSupport` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AppleARKitFaceMeshComponent`, `ARFaceComponentTransformMixing`

---

## Classes

### `unreal.AppleARKitFaceMeshComponent`
Inherits: `ProceduralMeshComponent` | Header: `AppleARKitFaceMeshComponent.h`

This component is updated by the ARSystem with face data on devices that have support for it

**Methods** (11):
  - `create_mesh(vertices, triangles, uv0)` -> `None` — Create the initial face mesh from raw mesh data
  - `get_face_blend_shape_amount(blend_shape)` -> `float` — Returns the value of the specified blend shape
  - `get_last_update_frame_number()` -> `int32` — Returns the frame number that was last used to update this component
  - `get_last_update_timestamp()` -> `float` — Returns the frame timestamp that was last used to update this component
  - `get_transform()` -> `Transform` — Get the transform that the AR camera has detected
  - `publish_via_live_link(subject_name)` -> `None` — Starts LiveLink publishing of this face componentâs data so that it can be used by the animation system
  - `set_auto_bind(auto_bind)` -> `None` — If auto bind is true, then this component will update itself from the local face tracking data each tick. If auto bind i...
  - `set_blend_shape_amount(blend_shape, amount)` -> `None` — Sets the amount for a given blend shape
  - `set_blend_shapes(blend_shapes)` -> `None` — Set all of the blend shapes for this instance from a set of blend shapes
  - `update_mesh(vertices)` -> `None` — Updates the face mesh vertices. The topology and UVs do not change post creation so only vertices are updated
  - `update_mesh_from_blend_shapes()` -> `None` — Create/replace the face mesh from the current set of blend shapes if the device supports it

**Properties** (7):
  - `auto_bind_to_local_face_mesh`: `bool` [Read-Only] — [Read-Only] If true, the mesh data will come from the local ARKit face mesh data. The face mesh will...
  - `face_material`: `MaterialInterface` [Read-Only] — [Read-Only] Used when rendering the face mesh (mostly debug reasons) (MaterialInterface)
  - `flip_tracked_rotation`: `bool` [Read-Only] — [Read-Only] If true, the face mesh will be rotated to face out of the screen (-X) rather than into t...
  - `live_link_subject_name`: `Name` [Read-Only] — [Read-Only] Used to identify this componentâs face ar data uniquely as part of the LiveLink animat...
  - `transform_setting`: `ARFaceComponentTransformMixing` [Read-Only] — [Read-Only] Determines how the transform from tracking data and the componentâs transform are mixe...
  - `wants_collision`: `bool` [Read-Only] — [Read-Only] Indicates whether collision should be created for this face mesh. This adds significant ...
  - `wants_mesh_updates`: `bool` [Read-Only] — [Read-Only] Indicates whether the face mesh data should be built for rendering or not (bool)

### `unreal.ARFaceComponentTransformMixing`
Inherits: `EnumBase` | Header: `AppleARKitFaceMeshComponent.h`

EARFace Component Transform Mixing

**Properties** (4):
  - `COMPONENT_LOCATION_TRACKED_ROTATION`: `ARFaceComponentTransformMixing = Ellipsis` — Use the componentâs location and apply the rotation from the tracked mesh 1
  - `COMPONENT_ONLY`: `ARFaceComponentTransformMixing = Ellipsis` — Uses the componentâs transform exclusively. Only setting for non-tracked meshes 0
  - `COMPONENT_WITH_TRACKED`: `ARFaceComponentTransformMixing = Ellipsis` — Concatenate the component and the tracked face transforms 2
  - `TRACKING_ONLY`: `ARFaceComponentTransformMixing = Ellipsis` — Use only the tracked face transform 3
