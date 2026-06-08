# UE Python API — Kismet Module

**2 types** from the `Kismet` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `BlueprintEditorToolMenuContext`, `JsonObjectGraphFunctionLibrary`

---

## Classes

### `unreal.BlueprintEditorToolMenuContext`
Inherits: `Object` | Header: `BlueprintEditorContext.h`

Blueprint Editor Tool Menu Context

**Methods** (1):
  - `get_blueprint_obj()` -> `Blueprint` — Get Blueprint Obj

### `unreal.JsonObjectGraphFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `JsonObjectGraphFunctionLibrary.h`

Json Object Graph Function Library

**Methods** (3):
  - `stringify(root_objects, options)` -> `str` [classmethod] — ! EXPERIMENTAL ! Writes the provided objects to a string output, using the JsonObjectGraph format. Reachable nested obje...
  - `write_blueprint_class_to_temp_file(bp, label, options)` -> `str` [classmethod] — ! EXPERIMENTAL ! Writes only the provided blueprintâs Class and CDO to a temporary file using the JsonObjectGraph form...
  - `write_package_to_temp_file(object, label, options)` -> `str` [classmethod] — ! EXPERIMENTAL ! Writes all objects in the provided objectâs package to a temporary file using the JsonObjectGraph for...
