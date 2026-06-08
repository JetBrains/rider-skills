# UE Python API — HttpBlueprint Module

**6 types** from the `HttpBlueprint` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `HttpHeader`, `HttpBlueprintFunctionLibrary`, `HttpRequestProxyObject`, `HttpVerbs`, `RequestPresets`, `OnRequestComplete`

---

## Classes

### `unreal.HttpHeader`
Inherits: `StructBase` | Header: `HttpHeader.h`

Provides a way for blueprint to create and store a map of HTTP headers

### `unreal.HttpBlueprintFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `HttpBlueprintFunctionLibrary.h`

Http Blueprint Function Library

**Methods** (5):
  - `add_header(header_object, new_header, new_header_value)` -> `HttpHeader` [classmethod] — Adds a new Header
  - `get_all_headers(header_object)` -> `Array [ str ]` [classmethod] — Returns all of the headers and their values by value
  - `get_all_headers_map(header_object)` -> `Map [ str , str ]` [classmethod] — Returns all of the headers and their values as a map by value
  - `get_header_value(header_object, header_name)` -> `str or None` [classmethod] — Get the value associated with a Header name
  - `remove_header(header_object, header_to_remove)` -> `HttpHeader or None` [classmethod] — Removes a header from the HeaderObject

### `unreal.HttpRequestProxyObject`
Inherits: `Object` | Header: `HttpRequestProxyObject.h`

Http Request Proxy Object

**Properties** (1):
  - `on_request_complete`: `OnRequestComplete` — [Read-Write] (OnRequestComplete)

### `unreal.HttpVerbs`
Inherits: `EnumBase` | Header: `HttpBlueprintTypes.h`

EHttp Verbs

**Properties** (5):
  - `DELETE`: `HttpVerbs = Ellipsis` — 2
  - `GET`: `HttpVerbs = Ellipsis` — 4:
note:: Anything past Patch will not display the input body pin
  - `PATCH`: `HttpVerbs = Ellipsis` — 3
  - `POST`: `HttpVerbs = Ellipsis` — 0
  - `PUT`: `HttpVerbs = Ellipsis` — 1

### `unreal.RequestPresets`
Inherits: `EnumBase` | Header: `HttpBlueprintTypes.h`

ERequest Presets

**Properties** (4):
  - `CUSTOM`: `RequestPresets = Ellipsis` — 3
  - `HTTP`: `RequestPresets = Ellipsis` — 1
  - `JSON`: `RequestPresets = Ellipsis` — The order here matters. 0
  - `URL`: `RequestPresets = Ellipsis` — 2

### `unreal.OnRequestComplete`
Inherits: `MulticastDelegateBase` | Header: `HttpRequestProxyObject.h`

On Request Complete Delegate Signature
