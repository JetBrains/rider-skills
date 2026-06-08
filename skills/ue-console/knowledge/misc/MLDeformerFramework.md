# UE Python API — MLDeformerFramework Module

**13 types** from the `MLDeformerFramework` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MLDeformerGeomCacheTrainingInputAnim`, `MLDeformerTrainingInputAnim`, `DeformerGraphSkeletonWithWeightedQuatsDataProvider`, `MLDeformerAsset`, `MLDeformerComponent`, `MLDeformerGeomCacheModel`, `MLDeformerGraphDebugDataProvider`, `MLDeformerModel`, `MLDeformerModelInstance`, `MLDeformerMorphModel`, `MLDeformerMorphModelInstance`, `MLDeformerMaskChannel`, `MLDeformerSkinningMode`

---

## Classes

### `unreal.MLDeformerGeomCacheTrainingInputAnim`
Inherits: `MLDeformerTrainingInputAnim` | Header: `MLDeformerGeomCacheTrainingInputAnim.h`

An animation that is input to the training process, which has a geometry cache as target.

### `unreal.MLDeformerTrainingInputAnim`
Inherits: `StructBase` | Header: `MLDeformerTrainingInputAnim.h`

An animation that is input to the training process. This is a base struct that only contains the animation sequence. For example a geometry cache based model should inherit from this struct and add a ...

### `unreal.DeformerGraphSkeletonWithWeightedQuatsDataProvider`
Inherits: `ComputeDataProvider` | Header: `DeformerGraphDataInterfaceSkeletonWithQuats.h`

Compute Framework Data Provider for reading skeletal mesh.

**Properties** (1):
  - `skinned_mesh`: `SkinnedMeshComponent` — [Read-Write] (SkinnedMeshComponent)

### `unreal.MLDeformerAsset`
Inherits: `Object` | Header: `MLDeformerAsset.h`

The machine learning deformer asset class. This class contains a Model property, through which most functionality happens.

### `unreal.MLDeformerComponent`
Inherits: `ActorComponent` | Header: `MLDeformerComponent.h`

The ML mesh deformer component. This works in combination with a MLDeformerAsset and SkeletalMeshComponent. The component will perform runtime inference of the deformer model setup inside the asset. W...

**Methods** (8):
  - `find_skeletal_mesh_component(asset)` -> `SkeletalMeshComponent` — Find the skeletal mesh component to apply the deformer on. This will return the skeletal mesh component (on this actor) ...
  - `get_deformer_asset()` -> `MLDeformerAsset` — Get the ML Deformer asset that is used by this component.
  - `get_model_instance()` -> `MLDeformerModelInstance` — Get the ML Deformer model instance that this component currently uses. The instance is responsible for running inference...
  - `get_skeletal_mesh_component()` -> `SkeletalMeshComponent` — Get the skeletal mesh component that the ML Deformer will work on. The skeletal mesh that is setup inside the skeletal m...
  - `get_weight()` -> `float` — Get the current ML Deformer weight. A value of 0 means it is fully disabled, while 1 means fully active. Values can be a...
  - `set_deformer_asset(deformer_asset)` -> `None` — Set the deformer asset that is used by this component. This will trigger the internal ML Deformer instance to be recreat...
  - `set_weight(normalized_weight_value)` -> `None` — Set the ML Deformer weight. This determines how active the deformer is. You can see it as a blend weight. A value of 0 m...
  - `update_skeletal_mesh_component()` -> `None` — Find the skeletal mesh component that this deformer should work on, and set it as our target component.

### `unreal.MLDeformerGeomCacheModel`
Inherits: `MLDeformerModel` | Header: `MLDeformerGeomCacheModel.h`

An ML Deformer model that has a geometry cache as target mesh. Use this in combination with UMLDeformerGeomCacheVizSettings, FMLDeformerGeomCacheEditorModel, FMLDeformerGeomCacheVizSettingsDetails and...

**Properties** (1):
  - `geometry_cache`: `GeometryCache` — [Read-Write] The geometry cache that represents the target deformations.
deprecated: Use the trainin...

### `unreal.MLDeformerGraphDebugDataProvider`
Inherits: `ComputeDataProvider` | Header: `MLDeformerGraphDebugDataInterface.h`

Compute Framework Data Provider for MLDeformer debugging data.

**Properties** (2):
  - `deformer_asset`: `MLDeformerAsset` — [Read-Write] (MLDeformerAsset)
  - `deformer_component`: `MLDeformerComponent` — [Read-Write] (MLDeformerComponent)

### `unreal.MLDeformerModel`
Inherits: `Object` | Header: `MLDeformerModel.h`

The ML Deformer runtime model base class. All models should be inherited from this class.

**Methods** (1):
  - `get_training_device()` -> `str` — Get Training Device

**Properties** (4):
  - `anim_sequence`: `AnimSequence` — [Read-Write] The animation sequence to apply to the base mesh. This has to match the animation of th...
  - `delta_cutoff_length`: `float` — [Read-Write]
deprecated: This property has been removed and isnât used anymore. (float)
  - `include_bones`: `bool` — [Read-Write]
deprecated: This property has been removed and isnât used anymore. (bool)
  - `include_curves`: `bool` — [Read-Write]
deprecated: This property has been removed and isnât used anymore. (bool)

### `unreal.MLDeformerModelInstance`
Inherits: `Object` | Header: `MLDeformerModelInstance.h`

An instance of the ML Deformer model. The ML Deformer model contains shared data, while this instance contains data unique to the actor it is being applied to. So if you have 1 ML Deformer model, appl...

### `unreal.MLDeformerMorphModel`
Inherits: `MLDeformerGeomCacheModel` | Header: `MLDeformerMorphModel.h`

The morph model base class. This is the base class for models that generate and drive morph targets. Use this in combination with UMLDeformerMorphModelInstance or inherited classes.

**Methods** (6):
  - `can_dynamically_update_morph_targets()` -> `bool` — Can Dynamically Update Morph Targets
  - `set_morph_target_delta_floats(deltas)` -> `None` — Set the per vertex deltas, as a set of floats. Each vertex delta must have 3 floats. These deltas are used to generate c...
  - `set_morph_target_deltas(deltas)` -> `None` — Set the morph target model deltas as an array of 3D vectors. These deltas are used to generate compressed morph targets ...
  - `set_morph_targets_error_order(morph_target_order, error_values)` -> `None` — Set the order of importance during LOD, for the morph targets. Basically this specifies the sorted order of the morph ta...
  - `set_morph_targets_max_weights(max_weights)` -> `None` — Set Morph Targets Max Weights
  - `set_morph_targets_min_max_weights(min_values, max_values)` -> `None` — Set the minimum and maximum values that the morph targets weights have seen during training. We can clamp the network ou...

### `unreal.MLDeformerMorphModelInstance`
Inherits: `MLDeformerModelInstance` | Header: `MLDeformerMorphModelInstance.h`

The model instance for the UMLDeformerMorphModel. This instance will assume the neural network outputs a set of weights, one for each morph target. The weights of the morph targets in the external mor...

### `unreal.MLDeformerMaskChannel`
Inherits: `EnumBase` | Header: `MLDeformerModel.h`

The channel to get the mask data from.

**Properties** (6):
  - `DISABLED`: `MLDeformerMaskChannel = Ellipsis` — Disable the weight mask. 0
  - `VERTEX_ATTRIBUTE`: `MLDeformerMaskChannel = Ellipsis` — Use a set of vertex attributes on the skeletal mesh. You can create and editor those using the Skele...
  - `VERTEX_COLOR_ALPHA`: `MLDeformerMaskChannel = Ellipsis` — The alpha vertex color channel. 4
  - `VERTEX_COLOR_BLUE`: `MLDeformerMaskChannel = Ellipsis` — The blue vertex color channel. 3
  - `VERTEX_COLOR_GREEN`: `MLDeformerMaskChannel = Ellipsis` — The green vertex color channel. 2
  - `VERTEX_COLOR_RED`: `MLDeformerMaskChannel = Ellipsis` — The red vertex color channel. 1

### `unreal.MLDeformerSkinningMode`
Inherits: `EnumBase` | Header: `MLDeformerModel.h`

The skinning mode to use as base.

**Properties** (2):
  - `DUAL_QUATERNION`: `MLDeformerSkinningMode = Ellipsis` — Dual quaternion skinning. This is slower at runtime, but can result in better deformations. 1
  - `LINEAR`: `MLDeformerSkinningMode = Ellipsis` — Linear blend skinning. This is the fastest at runtime, but can have a harder time reconstructing the...
