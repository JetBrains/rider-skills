# UE Python API — PerformanceCaptureCore Module

**5 types** from the `PerformanceCaptureCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CaptureCharacter`, `CapturePerformer`, `PerformerComponent`, `RetargetAnimInstance`, `RetargetComponent`

---

## Classes

### `unreal.CaptureCharacter`
Inherits: `SkeletalMeshActor` | Header: `CaptureCharacter.h`

Capture Character

**Methods** (5):
  - `get_custom_retarget_profile()` -> `RetargetProfile` — Get a Custom Retarget Profile.
  - `set_custom_retarget_profile(profile)` -> `None` — Set a Custom Retarget Profile.
  - `set_force_all_skeletal_meshes_to_follow_leader(follow_leader)` -> `None` — Force all Skeletal Meshes to follow the Controlled Skeletal mesh.
  - `set_retarget_asset(retarget_asset)` -> `None` — Set the Retarget Asset.
  - `set_source_performer(performer)` -> `None` — Set the Source CapturePerformer Actor.

**Properties** (3):
  - `force_all_skeletal_meshes_to_follow_leader`: `bool` [Read-Only] — [Read-Only] Force all skeletal meshes to use the root SkeletalMesh as their Leader. Default = True. ...
  - `retarget_asset`: `IKRetargeter` [Read-Only] — [Read-Only] The IKRetarget Asset to use for retargeting between the SourcePerformer and this Charact...
  - `source_performer`: `CapturePerformer` [Read-Only] — [Read-Only] CapturePerformer Actor that will be the source for retargeting. (CapturePerformer)

### `unreal.CapturePerformer`
Inherits: `SkeletalMeshActor` | Header: `CapturePerformer.h`

Capture Performer

**Methods** (5):
  - `get_evaluate_live_link_data()` -> `bool` — Get state of LiveLink data evaluation. True = animation is updated.
  - `get_live_link_subject()` -> `LiveLinkSubjectName` — Get the LiveLink Subject Name.
  - `set_evaluate_live_link_data(evaluate_link_link)` -> `None` — Set the LiveLink data to update the Skeletal Mesh pose.
  - `set_live_link_subject(subject)` -> `None` — Set the LiveLink Subject Name. Subject must have the Animation Role Type.
  - `set_mocap_mesh(mocap_mesh)` -> `None` — Set the Skeletal Mesh Asset of the root Skeletal Mesh.

**Properties** (3):
  - `evaluate_animation`: `bool` [Read-Only] — [Read-Only] Evaluate LiveLink animation. Set to false to pause animation. (bool)
  - `force_all_meshes_to_follow_leader`: `bool` [Read-Only] — [Read-Only] Force all skeletal meshes to follow the pose of the Controlled Skeletal Mesh. (bool)
  - `subject_name`: `LiveLinkSubjectName` [Read-Only] — [Read-Only] LiveLink Subject Name. Must have the Animation Role Type. (LiveLinkSubjectName)

### `unreal.PerformerComponent`
Inherits: `ActorComponent` | Header: `PerformerComponent.h`

Performer Component

**Methods** (6):
  - `get_evaluate_live_link_data()` -> `bool` — Get the LiveLink Evaluation State. Subject must have the Animation Role Type.
  - `get_live_link_subject()` -> `LiveLinkSubjectName` — Get the LiveLink Subject Name.
  - `set_controlled_mesh(skeletal_mesh)` -> `bool` — Set the controlled skeletal mesh component. Must be a member of the owner actor of this component.
  - `set_evaluate_live_link_data(evaluate_link_link)` -> `None` — Set the LiveLink data to update the Skeletal Mesh pose.
  - `set_force_meshes_follow_leader(bool)` -> `None` — Set the bForceOtherMeshesToFollowControlledMesh variable. Changing will re-initialise animation.
  - `set_live_link_subject(subject)` -> `None` — Set the LiveLink Subject Name. Subject must have the Animation Role Type.

**Properties** (3):
  - `controlled_skeletal_mesh`: `ComponentReference` [Read-Only] — [Read-Only] The Skeletal Mesh driven by the LiveLink subject. Skeleton mush be compatible with the L...
  - `force_other_meshes_to_follow_controlled_mesh`: `bool` [Read-Only] — [Read-Only] Force all other skeletal meshes in the Owner Actor to follow the pose of the Controlled ...
  - `subject_name`: `LiveLinkSubjectName` [Read-Only] — [Read-Only] LiveLink Subject Name. Must have the Animation Role Type. (LiveLinkSubjectName)

### `unreal.RetargetAnimInstance`
Inherits: `AnimInstance` | Header: `RetargetAnimInstance.h`

Anim Instance

### `unreal.RetargetComponent`
Inherits: `ActorComponent` | Header: `RetargetComponent.h`

Retarget Component

**Methods** (6):
  - `get_custom_retarget_profile()` -> `RetargetProfile` — Get Retarget Profile.
  - `set_controlled_mesh(controlled_mesh)` -> `None` — Set the Controlled Skeletal Mesh.
  - `set_custom_retarget_profile(profile)` -> `None` — Set a Custom Retarget Profile.
  - `set_force_meshes_follow_leader(bool)` -> `None` — Set the bForceOtherMeshesToFollowControlledMesh variable. Changing will re-initialise animation.
  - `set_retarget_asset(retarget_asset)` -> `None` — Set the Retarget Asset.
  - `set_source_performer_mesh(performer_mesh)` -> `None` — Set the Source Performer Mesh.

**Properties** (5):
  - `controlled_skeletal_mesh_component`: `ComponentReference` [Read-Only] — [Read-Only] Skeletal Mesh that will be driven by the IKRetargeter. Limited to skeletal meshes on thi...
  - `custom_retarget_profile`: `RetargetProfile` [Read-Only] — [Read-Only] Custom Retarget Profile. Should be used to override Retarget settings on the RetargetAss...
  - `force_other_meshes_to_follow_controlled_mesh`: `bool` [Read-Only] — [Read-Only] Force all skeletal meshes to use the ControlledSkeletalMeshComponent as their Leader. De...
  - `retarget_asset`: `IKRetargeter` [Read-Only] — [Read-Only] The IKRetarget Asset to use for retargeting between the source and controlled skeletal m...
  - `source_skeletal_mesh_component`: `ComponentReference` [Read-Only] — [Read-Only] Skeletal Mesh component that will be the source for retargeting. Can be on the Owner Act...
