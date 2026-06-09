# UE Python API — NeuralMorphModelEditor Module

**1 types** from the `NeuralMorphModelEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `NeuralMorphTrainingModel`

---

## Classes

### `unreal.NeuralMorphTrainingModel`
Inherits: `MLDeformerGeomCacheTrainingModel` | Header: `NeuralMorphTrainingModel.h`

The training model for the neural morph model. This class is our link to the Python training.

**Methods** (6):
  - `generate_bone_group_indices()` -> `Array [ int32 ]` — Generate Bone Group Indices
  - `generate_curve_group_indices()` -> `Array [ int32 ]` — Generate Curve Group Indices
  - `get_morph_target_masks()` -> `Array [ float ]` — Get Morph Target Masks
  - `get_num_bone_groups()` -> `int32` — Get Num Bone Groups
  - `get_num_curve_groups()` -> `int32` — Get Num Curve Groups
  - `train()` -> `int32` — Main training function, with implementation in python. You need to implement this method. See the UMLDeformerTrainingMod...
