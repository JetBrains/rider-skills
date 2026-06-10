# UE Python API — TechAudioToolsMetaSound Module

**4 types** from the `TechAudioToolsMetaSound` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MetaSoundInputViewModel`, `MetaSoundOutputViewModel`, `MetaSoundViewModel`, `MetaSoundViewModelConversionFunctions`

---

## Classes

### `unreal.MetaSoundInputViewModel`
Inherits: `MVVMViewModelBase` | Header: `MetaSoundViewModel.h`

Viewmodel class for MetaSound inputs. Allows widgets in UMG to bind to MetaSound literals. Useful for creating knobs, sliders, and other widgets for setting MetaSound input parameters.

**Methods** (1):
  - `get_literal_value_as_text()` -> `Text` — Returns the value of this inputâs MetaSound Literal as a text value.

**Properties** (6):
  - `data_type`: `Name` — [Read-Write] Returns the data type of the initialized MetaSound input. (Name)
  - `input_name`: `Name` — [Read-Write] Sets the name of the initialized MetaSound input. (Name)
  - `is_array`: `bool` — [Read-Write] True if the initialized MetaSound input is an array. (bool)
  - `is_initialized`: `bool` [Read-Only] — [Read-Only] True if this MetaSoundInputViewModel has been initialized. (bool)
  - `literal`: `MetasoundFrontendLiteral` — [Read-Write] The MetaSound Literal belonging to the initialized MetaSound input. (MetasoundFrontendL...
  - `literal_type`: `MetasoundFrontendLiteralType` [Read-Only] — [Read-Only] Returns the Literal Type belonging to the initialized MetaSound input. (MetasoundFronten...

### `unreal.MetaSoundOutputViewModel`
Inherits: `MVVMViewModelBase` | Header: `MetaSoundViewModel.h`

Viewmodel class for MetaSound outputs. Allows widgets in UMG to bind to data from a MetaSound output. Useful for driving visual parameters using MetaSound outputs.

**Properties** (5):
  - `data_type`: `Name` — [Read-Write] Returns the data type of the initialized MetaSound output. (Name)
  - `is_array`: `bool` — [Read-Write] True if the initialized MetaSound output is an array. (bool)
  - `is_initialized`: `bool` [Read-Only] — [Read-Only] True if this MetaSoundOutputViewModel has been initialized. (bool)
  - `meta_sound_output`: `MetaSoundOutput` — [Read-Write] The MetaSound Output belonging to the initialized MetaSound output. (MetaSoundOutput)
  - `output_name`: `Name` — [Read-Write] Sets the name of the initialized MetaSound output. (Name)

### `unreal.MetaSoundViewModel`
Inherits: `MVVMViewModelBase` | Header: `MetaSoundViewModel.h`

The base class for MetaSound viewmodels. Used for binding metadata and member inputs/outputs of a MetaSound to widgets in UMG. Can be initialized using a MetaSound Builder or a MetaSound asset. Create...

**Methods** (7):
  - `get_builder()` -> `MetaSoundBuilderBase` — Returns a reference to the initialized MetaSoundâs Builder.
  - `get_builder_name_as_text()` -> `Text` — Returns the object name of the initialized builder as text.
  - `get_input_view_models()` -> `Array [ MetaSoundInputViewModel ]` — Contains MetaSound Input Viewmodels for each input of the initialized MetaSound.
  - `get_output_view_models()` -> `Array [ MetaSoundOutputViewModel ]` — Contains MetaSound Output ViewModels for each output of the initialized MetaSound.
  - `initialize(builder)` -> `None` — Initializes the viewmodel using the given builder.
  - `initialize_meta_sound(meta_sound)` -> `None` — Initializes the viewmodel using the given MetaSound asset.
  - `reset()` -> `None` — Resets this MetaSoundViewModel instance to an uninitialized state.

**Properties** (2):
  - `is_initialized`: `bool` [Read-Only] — [Read-Only] True if this MetaSound Viewmodel has been initialized. (bool)
  - `is_preset`: `bool` [Read-Only] — [Read-Only] True if the initialized MetaSound is a preset. (bool)

### `unreal.MetaSoundViewModelConversionFunctions`
Inherits: `BlueprintFunctionLibrary` | Header: `MetaSoundViewModelConversionFunctions.h`

Collection of conversion functions to use with MetaSound Viewmodels.

**Methods** (2):
  - `find_input_view_model_by_name(meta_sound_input_view_models, input_name)` -> `MetaSoundInputViewModel` [classmethod] — Searches the given array of MetaSoundInputViewModels for the specified input. Returns nullptr if unable to find a matchi...
  - `find_output_view_model_by_name(meta_sound_output_view_models, output_name)` -> `MetaSoundOutputViewModel` [classmethod] — Searches the given array of MetaSoundOutputViewModels for the specified output. Returns nullptr if unable to find a matc...
