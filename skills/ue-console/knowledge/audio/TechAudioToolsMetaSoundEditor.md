# UE Python API — TechAudioToolsMetaSoundEditor Module

**4 types** from the `TechAudioToolsMetaSoundEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MetaSoundEditorViewModel`, `MetaSoundEditorViewModelConversionFunctions`, `MetaSoundInputEditorViewModel`, `MetaSoundOutputEditorViewModel`

---

## Classes

### `unreal.MetaSoundEditorViewModel`
Inherits: `MetaSoundViewModel` | Header: `MetaSoundEditorViewModel.h`

Editor viewmodel for MetaSounds. Creates MetaSoundEditorBuilderListener bindings upon initialization, allowing changes made to assets in the MetaSound Editor to be reflected in UMG widgets.

**Properties** (6):
  - `author`: `str` — [Read-Write] Sets the author of the initialized MetaSound. (str)
  - `category_hierarchy`: `None` — [Read-Write] Sets the category hierarchy of the initialized MetaSound. (Array[Text])
  - `description`: `Text` — [Read-Write] Sets the description of the initialized MetaSound. (Text)
  - `display_name`: `Text` — [Read-Write] Sets the display name of the initialized MetaSound. (Text)
  - `is_deprecated`: `bool` — [Read-Write] Sets the initialized MetaSound asset as deprecated. (bool)
  - `keywords`: `None` — [Read-Write] Sets the keywords of the initialized MetaSound. (Array[Text])

### `unreal.MetaSoundEditorViewModelConversionFunctions`
Inherits: `BlueprintFunctionLibrary` | Header: `MetaSoundEditorViewModelConversionFunctions.h`

Collection of conversion functions to use with MetaSound Editor Viewmodels.

**Methods** (1):
  - `get_meta_sound_data_type_pin_color(data_type)` -> `LinearColor` [classmethod] — Returns the pin color associated with the given data type.

### `unreal.MetaSoundInputEditorViewModel`
Inherits: `MetaSoundInputViewModel` | Header: `MetaSoundEditorViewModel.h`

Editor viewmodel class for MetaSound inputs. Extends the runtime MetaSoundInputViewModel with editor-only functionality.

**Properties** (4):
  - `input_description`: `Text` — [Read-Write] Sets the description of the initialized MetaSound input. (Text)
  - `input_display_name`: `Text` — [Read-Write] Sets the display name of the initialized MetaSound input. (Text)
  - `is_advanced_display`: `bool` — [Read-Write] Sets whether the initialized MetaSound input should be located in the Advanced Display ...
  - `sort_order_index`: `int` — [Read-Write] Sets the sort order index of the initialized MetaSound input. (int32)

### `unreal.MetaSoundOutputEditorViewModel`
Inherits: `MetaSoundOutputViewModel` | Header: `MetaSoundEditorViewModel.h`

Editor viewmodel class for MetaSound outputs. Extends the runtime MetaSoundOutputViewModel with editor-only functionality.

**Properties** (4):
  - `is_advanced_display`: `bool` — [Read-Write] Sets whether the initialized MetaSound output should be located in the Advanced Display...
  - `output_description`: `Text` — [Read-Write] Sets the description of the initialized MetaSound output. (Text)
  - `output_display_name`: `Text` — [Read-Write] Sets the display name of the initialized MetaSound output. (Text)
  - `sort_order_index`: `int` — [Read-Write] Sets the sort order index of the initialized MetaSound output. (int32)
