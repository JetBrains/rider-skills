# UE Python API — MLDeformerFrameworkEditor Module

**3 types** from the `MLDeformerFrameworkEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MLDeformerFactory`, `MLDeformerGeomCacheTrainingModel`, `MLDeformerTrainingModel`

---

## Classes

### `unreal.MLDeformerFactory`
Inherits: `Factory` | Header: `MLDeformerAssetFactory.h`

The factory for the ML Deformer asset type. This basically integrates the new asset type into the editor, so you can right click and create a new ML Deformer asset.

### `unreal.MLDeformerGeomCacheTrainingModel`
Inherits: `MLDeformerTrainingModel` | Header: `MLDeformerGeomCacheTrainingModel.h`

The training model base class for geometry cache based models. This class is our link to the Python training.

**Methods** (1):
  - `generate_basic_inputs_and_output_buffers(inputs_file_path, outputs_file_path)` -> `bool` — Sample all input frames.

### `unreal.MLDeformerTrainingModel`
Inherits: `Object` | Header: `MLDeformerTrainingModel.h`

The training model base class. This class is used to interface with Python by providing some methods you can call inside your python training code. For example it allows you to get all the sampled dat...

**Methods** (15):
  - `get_mask_index_per_sample_array()` -> `Array [ int32 ]` — For each sample we took, this contains the index inside the mask as returned by the GetTrainingInputAnimMasks() array.
  - `get_model()` -> `MLDeformerModel` — Get the runtime ML Deformer model object.
  - `get_needs_resampling()` -> `bool` — Check whether we need to resample the inputs and outputs, or if we can use a cached version. This will return true if an...
  - `get_number_sample_curves()` -> `int32` — Get number of input curves.
  - `get_number_sample_deltas()` -> `int32` — Get the number of vertex deltas.
  - `get_number_sample_transforms()` -> `int32` — Get the number of input transforms. This is the number of bones.
  - `get_training_input_anim_mask_data(mask_name)` -> `Array [ float ]` — Get the per vertex data for a given mask name. The mask name must be one that is present in the array returned by GetTra...
  - `get_training_input_anim_masks()` -> `Array [ Name ]` — Get the names of all valid training animation masks. They are valid when they are used, the anim is enabled, and the att...
  - `next_sample()` -> `bool` — Take the next sample. This will update the deltas, curve values and bone rotation arrays with values sampled at the next...
  - `num_samples()` -> `int32` — Get the number of samples in this data set. This is the number of sample frames we want to train on.
  - `reset_sampling()` -> `None` — This will make the sampling start again from the beginning. This can be used if you have to iterate multiple times over ...
  - `set_device_list(device_names, preferred_device_index)` -> `None` — Set the list of possible training devices.
  - `set_needs_resampling(needs_resampling)` -> `None` — Specify whether we need to resample any cached data or not, because our input assets, or any other relevant settings cha...
  - `set_num_floats_per_curve(num_floats_per_curve)` -> `None` — Set the number of floats per curve. On default this is one.
  - `update_available_devices()` -> `None` — Update Available Devices

**Properties** (4):
  - `mask_index_per_sample`: `None` — [Read-Write] The mask index for each sample.
See GetTrainingInputAnimMasks() and GetTrainingInputAni...
  - `sample_bone_rotations`: `None` — [Read-Write] The bone rotations in bone (local) space for this sample. This is updated after NextSam...
  - `sample_curve_values`: `None` — [Read-Write] The curve weights. This is updated after NextSample is called. (Array[float])
  - `sample_deltas`: `None` — [Read-Write] The delta values per vertex for this sample. This is updated after NextSample is called...
