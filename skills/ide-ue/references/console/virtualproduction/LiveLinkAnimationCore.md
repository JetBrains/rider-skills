# UE Python API — LiveLinkAnimationCore Module

**4 types** from the `LiveLinkAnimationCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimNode_LiveLinkPose`, `LiveLinkInstance`, `LiveLinkRemapAsset`, `LiveLinkRetargetAsset`

---

## Classes

### `unreal.AnimNode_LiveLinkPose`
Inherits: `AnimNode_Base` | Header: `AnimNode_LiveLinkPose.h`

Anim Node Live Link Pose

**Properties** (4):
  - `do_live_link_evaluation`: `bool` — [Read-Write] (bool)
  - `input_pose`: `PoseLink` — [Read-Write] (PoseLink)
  - `live_link_subject_name`: `LiveLinkSubjectName` — [Read-Write] (LiveLinkSubjectName)
  - `retarget_asset`: `Class` — [Read-Write] (type(Class))

### `unreal.LiveLinkInstance`
Inherits: `AnimInstance` | Header: `LiveLinkInstance.h`

Live Link Instance

**Methods** (3):
  - `enable_live_link_evaluation(do_enable)` -> `None` — Enable Live Link Evaluation
  - `set_retarget_asset(retarget_asset)` -> `None` — Set Retarget Asset
  - `set_subject(subject_name)` -> `None` — Set Subject

### `unreal.LiveLinkRemapAsset`
Inherits: `LiveLinkRetargetAsset` | Header: `LiveLinkRemapAsset.h`

Remap asset for data coming from Live Link. Allows simple application of bone transforms into current pose based on name remapping only

**Methods** (3):
  - `get_remapped_bone_name(bone_name)` -> `Name` — Blueprint Implementable function for getting a remapped bone name from the original
  - `get_remapped_curve_name(curve_name)` -> `Name` — Blueprint Implementable function for getting a remapped curve name from the original
  - `remap_curve_elements(curve_items)` -> `Map [ Name , float ]` — Blueprint Implementable function for remapping, adding or otherwise modifying the curve element data from Live Link. Thi...

### `unreal.LiveLinkRetargetAsset`
Inherits: `Object` | Header: `LiveLinkRetargetAsset.h`

Base class for retargeting live link data.
