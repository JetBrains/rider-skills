# UE Python API — ScriptableEditorWidgets Module

**4 types** from the `ScriptableEditorWidgets` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DetailsView`, `PropertyViewBase`, `SinglePropertyView`, `OnPropertyValueChanged`

---

## Classes

### `unreal.DetailsView`
Inherits: `PropertyViewBase` | Header: `DetailsView.h`

The details view allows you to display the value of an object properties.

### `unreal.PropertyViewBase`
Inherits: `Widget` | Header: `PropertyViewBase.h`

Base of property view allows you to display the value of an object properties.

**Methods** (2):
  - `get_object()` -> `Object` — Get Object
  - `set_object(new_object)` -> `None` — Set Object

**Properties** (1):
  - `on_property_changed`: `OnPropertyValueChanged` — [Read-Write] Sets a delegate called when the property value changes (OnPropertyValueChanged)

### `unreal.SinglePropertyView`
Inherits: `PropertyViewBase` | Header: `SinglePropertyView.h`

The single property view allows you to display the value of an objectâs property.

**Methods** (4):
  - `get_name_override()` -> `Text` — Get Name Override
  - `get_property_name()` -> `Name` — Get Property Name
  - `set_name_override(new_property_name)` -> `None` — Set Name Override
  - `set_property_name(new_property_name)` -> `None` — Set Property Name

### `unreal.OnPropertyValueChanged`
Inherits: `MulticastDelegateBase` | Header: `PropertyViewBase.h`

Sets a delegate called when the property value changes
