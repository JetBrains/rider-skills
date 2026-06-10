# UE Python API — HierarchyTableAnimationRuntime Module

**3 types** from the `HierarchyTableAnimationRuntime` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimNode_BlendProfileLayeredBlend`, `BlendProfileStandalone`, `BlendProfileStandaloneType`

---

## Classes

### `unreal.AnimNode_BlendProfileLayeredBlend`
Inherits: `AnimNode_Base` | Header: `AnimNode_BlendProfileLayeredBlend.h`

Anim Node Blend Profile Layered Blend

**Properties** (7):
  - `base_pose`: `PoseLink` — [Read-Write] The source pose (PoseLink)
  - `blend_pose`: `PoseLink` — [Read-Write] The target pose (PoseLink)
  - `blend_profile_asset`: `BlendProfileStandalone` — [Read-Write] The blend profile mask asset to use to control layering of the pose, curves, and attrib...
  - `blend_weight`: `float` — [Read-Write] The weight of target pose (float)
  - `curve_blending_option`: `CurveBlendOption` — [Read-Write] (CurveBlendOption)
  - `custom_curve_blending`: `bool` — [Read-Write] (bool)
  - `mesh_space_rotation_blend`: `bool` — [Read-Write] Whether to blend bone rotations in mesh space or in local space (bool)

### `unreal.BlendProfileStandalone`
Inherits: `Object` | Header: `BlendProfileStandalone.h`

Blend Profile Standalone

### `unreal.BlendProfileStandaloneType`
Inherits: `EnumBase` | Header: `BlendProfileStandalone.h`

EBlend Profile Standalone Type

**Properties** (3):
  - `BLEND_MASK`: `BlendProfileStandaloneType = Ellipsis` — 2
  - `TIME_FACTOR`: `BlendProfileStandaloneType = Ellipsis` — 1
  - `WEIGHT_FACTOR`: `BlendProfileStandaloneType = Ellipsis` — 0
