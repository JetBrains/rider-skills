# UE Python API — SkeletalMerging Module

**3 types** from the `SkeletalMerging` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `SkeletalMeshMergeParams`, `SkeletonMergeParams`, `SkeletalMergingLibrary`

---

## Classes

### `unreal.SkeletalMeshMergeParams`
Inherits: `StructBase` | Header: `SkeletalMergingLibrary.h`

Struct containing all parameters used to perform a Skeletal Mesh merge.

**Properties** (7):
  - `mesh_section_mappings`: `None` — [Read-Write] An optional array to map sections from the source meshes to merged section entries (Arr...
  - `meshes_to_merge`: `None` — [Read-Write] The list of skeletal meshes to merge. (Array[SkeletalMesh])
  - `needs_cpu_access`: `bool` — [Read-Write] Whether or not the resulting mesh needs to be accessed by the CPU for any reason (e.g. ...
  - `skeleton`: `Skeleton` — [Read-Write] Skeleton that will be used for the merged mesh.
Leave empty if the generated skeleton i...
  - `skeleton_before`: `bool` — [Read-Write] Update skeleton before merge. Otherwise, update after.
Skeleton must also be provided. ...
  - `strip_top_lods`: `int` — [Read-Write] The number of high LODs to remove from input meshes (int32)
  - `uv_transforms_per_mesh`: `None` — [Read-Write] An optional array to transform the UVs in each mesh (Array[SkelMeshMergeMeshUVTransform...

### `unreal.SkeletonMergeParams`
Inherits: `StructBase` | Header: `SkeletalMergingLibrary.h`

Struct containing all parameters used to perform a Skeleton merge.

**Properties** (7):
  - `check_skeletons_compatibility`: `bool` — [Read-Write] Whether or not to check if there are invalid parent chains or shared bones with differe...
  - `merge_anim_slot_groups`: `bool` — [Read-Write] Whether or not to include Animation Slot Group (names) when merging the Skeletons (bool...
  - `merge_blend_profiles`: `bool` — [Read-Write] Whether or not to include Blend Profiles when merging the Skeletons (bool)
  - `merge_curve_names`: `bool` — [Read-Write] Whether or not to include (Animation) Curve names when merging the Skeletons (bool)
  - `merge_sockets`: `bool` — [Read-Write] Whether or not to include Sockets when merging the Skeletons (bool)
  - `merge_virtual_bones`: `bool` — [Read-Write] Whether or not to include Virtual Bones when merging the Skeletons (bool)
  - `skeletons_to_merge`: `None` — [Read-Write] The list of skeletons to merge. (Array[Skeleton])

### `unreal.SkeletalMergingLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `SkeletalMergingLibrary.h`

Component that can be used to perform Skeletal Mesh merges from Blueprints.

**Methods** (2):
  - `merge_meshes(params)` -> `SkeletalMesh` [classmethod] — Merges the given meshes into a single mesh.
  - `merge_skeletons(params)` -> `Skeleton` [classmethod] — Merges the skeletons for the provided meshes into a single skeleton.
