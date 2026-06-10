# UE Python API — SkeletalMeshModifiers Module

**5 types** from the `SkeletalMeshModifiers` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MirrorOptions`, `OrientOptions`, `SkeletonModifier`, `SkinWeightModifier`, `OrientAxis`

---

## Classes

### `unreal.MirrorOptions`
Inherits: `StructBase` | Header: `SkeletonModifier.h`

FMirrorOptions

**Properties** (5):
  - `left_string`: `str` — [Read-Write] (str)
  - `mirror_axis`: `AxisType` — [Read-Write] (AxisType)
  - `mirror_children`: `bool` — [Read-Write] (bool)
  - `mirror_rotation`: `bool` — [Read-Write] (bool)
  - `right_string`: `str` — [Read-Write] (str)

### `unreal.OrientOptions`
Inherits: `StructBase` | Header: `SkeletonModifier.h`

Orient Options

**Properties** (5):
  - `orient_children`: `bool` — [Read-Write] (bool)
  - `primary`: `OrientAxis` — [Read-Write] (OrientAxis)
  - `secondary`: `OrientAxis` — [Read-Write] (OrientAxis)
  - `secondary_target`: `Vector` — [Read-Write] (Vector)
  - `use_plane_as_secondary`: `bool` — [Read-Write] (bool)

### `unreal.SkeletonModifier`
Inherits: `Object` | Header: `SkeletonModifier.h`

FSkeletalMeshSkeletonModifier

**Methods** (20):
  - `add_bone(bone_name, parent_name, transform)` -> `bool` — Creates a new bone in the skeleton hierarchy at desired transform
  - `add_bones(bones_name, parents_name, transforms)` -> `bool` — Add Bones
  - `commit_skeleton_to_skeletal_mesh()` -> `bool` — Actually applies the skeleton modifications to the skeletal mesh.
  - `get_all_bone_names()` -> `Array [ Name ]` — Get All Bone Names
  - `get_bone_transform(bone_name, global_ = False)` -> `Transform` — Get Bone Transform
  - `get_children_names(bone_name, recursive = False)` -> `Array [ Name ]` — Get Children Names
  - `get_parent_name(bone_name)` -> `Name` — Get Parent Name
  - `mirror_bone(bone_name, options = [AxisType.X,True,'_l','_r',True])` -> `bool` — Mirror bones
  - `mirror_bones(bones_name, options = [AxisType.X,True,'_l','_r',True])` -> `bool` — Mirror Bones
  - `orient_bone(bone_name, options = [OrientAxis.POSITIVE_X,OrientAxis.POSITIVE_Y,True,[0.000000,1.000000,0.000000],True])` -> `bool` — Align bones
  - `orient_bones(bone_names, options = [OrientAxis.POSITIVE_X,OrientAxis.POSITIVE_Y,True,[0.000000,1.000000,0.000000],True])` -> `bool` — Orient Bones
  - `parent_bone(bone_name, parent_name)` -> `bool` — Parent bones
  - `parent_bones(bone_names, parent_names)` -> `bool` — Parent Bones
  - `remove_bone(bone_name, remove_children)` -> `bool` — Remove a bone in the skeleton hierarchy
  - `remove_bones(bone_names, remove_children)` -> `bool` — Remove Bones
  - `rename_bone(old_bone_name, new_bone_name)` -> `bool` — Rename bones
  - `rename_bones(old_bone_names, new_bone_names)` -> `bool` — Rename Bones
  - `set_bone_transform(bone_name, new_transform, move_children)` -> `bool` — Sets the bone the desired local transform
  - `set_bones_transforms(bone_names, new_transforms, move_children)` -> `bool` — Set Bones Transforms
  - `set_skeletal_mesh(skeletal_mesh)` -> `bool` — Set Skeletal Mesh

### `unreal.SkinWeightModifier`
Inherits: `Object` | Header: `SkinWeightModifier.h`

API used to modify skin weights on a Skeletal Mesh asset.

**Methods** (12):
  - `commit_weights_to_skeletal_mesh()` -> `bool` — Actually applies the weight modifications to the skeletal mesh. This action creates an undo transaction. The skeletal me...
  - `enforce_max_influences(max_influences = -1)` -> `bool` — Strips out smallest influences to ensure each vertex does not have weight on more influences than MaxInfluences. Influen...
  - `get_all_bone_names()` -> `Array [ Name ]` — Get an array of all bone names in the skeletal mesh.
  - `get_num_vertices()` -> `int32` — Get the total number of vertices in the skeletal mesh.
  - `get_skeletal_mesh()` -> `SkeletalMesh` — Get a reference to the skeletal mesh that was loaded
  - `get_vertex_weights(vertex_id)` -> `Map [ Name , float ]` — Get all bone weights for a single vertex.
  - `normalize_all_weights()` -> `bool` — Normalize weights on all vertices in the mesh.
  - `normalize_vertex_weights(vertex_id)` -> `bool` — Normalize weights on the specified vertex.
  - `prune_all_weights(weight_threshold)` -> `bool` — Remove all weights below the given threshold value, on all vertices.
  - `prune_vertex_weights(vertex_id, weight_threshold)` -> `bool` — Remove all weights below the given threshold value, on the given vertex. Influences that are pruned will no longer recei...
  - `set_skeletal_mesh(mesh)` -> `bool` — Call this first to load the weights for a skeletal mesh for fast editing.
  - `set_vertex_weights(vertex_id, weights, replace_all = False)` -> `bool` — Set bone weights for a single vertex. The weights are stored as supplied and not normalized until either âCommitWeight...

### `unreal.OrientAxis`
Inherits: `EnumBase` | Header: `SkeletonModifier.h`

FOrientOptions

**Properties** (7):
  - `NEGATIVE_X`: `OrientAxis = Ellipsis` — Orients axis in the negative X direction 4
  - `NEGATIVE_Y`: `OrientAxis = Ellipsis` — Orients axis in the negative Y direction 5
  - `NEGATIVE_Z`: `OrientAxis = Ellipsis` — Orients axis in the negative Z direction 6
  - `NONE`: `OrientAxis = Ellipsis` — 0
  - `POSITIVE_X`: `OrientAxis = Ellipsis` — Orients axis in the positive X direction 1
  - `POSITIVE_Y`: `OrientAxis = Ellipsis` — Orients axis in the positive Y direction 2
  - `POSITIVE_Z`: `OrientAxis = Ellipsis` — Orients axis in the positive Z direction 3
