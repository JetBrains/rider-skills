# UE Python API — JsonBlueprintUtilities Module

**1 types** from the `JsonBlueprintUtilities` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `JsonBlueprintFunctionLibrary`

---

## Classes

### `unreal.JsonBlueprintFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `JsonBlueprintFunctionLibrary.h`

Json Blueprint Function Library

**Methods** (6):
  - `from_file(file)` -> `JsonObjectWrapper or None` [classmethod] — Creates a JsonObject from the provided Json file.
  - `from_string(json_string)` -> `JsonObjectWrapper or None` [classmethod] — Creates a JsonObject from the provided Json string.
  - `get_field_names(json_object)` -> `Array[str] or None` [classmethod] — Gets all field names on the JsonObject
  - `has_field(json_object, field_name)` -> `bool` [classmethod] — Checks if the field exists on the object.
  - `to_file(json_object, file)` -> `bool` [classmethod] — Creates a file from the provided JsonObject.
  - `to_string(json_object)` -> `str or None` [classmethod] — Creates a Json string from the provided JsonObject.
