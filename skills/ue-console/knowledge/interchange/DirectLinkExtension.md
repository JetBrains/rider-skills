# UE Python API — DirectLinkExtension Module

**1 types** from the `DirectLinkExtension` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DirectLinkExtensionLibrary`

---

## Classes

### `unreal.DirectLinkExtensionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `DirectLinkExtensionBlueprintLibrary.h`

Direct Link Extension Blueprint Library

**Methods** (2):
  - `get_available_direct_link_sources_uri()` -> `Array [ str ]` [classmethod] — Get Available Direct Link Sources Uri
  - `parse_direct_link_source_uri(source_uri_string)` -> `(out_computer_name=str, out_endpoint_name=str, out_executable_name=str, out_source_name=str) or None` [classmethod] — Parse Direct Link Source Uri
