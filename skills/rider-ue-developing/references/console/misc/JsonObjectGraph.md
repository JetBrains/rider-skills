# UE Python API — JsonObjectGraph Module

**2 types** from the `JsonObjectGraph` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `JsonStringifyOptions`, `JsonStringifyFlags`

---

## Classes

### `unreal.JsonStringifyOptions`
Inherits: `StructBase` | Header: `Stringify.h`

Json Stringify Options

**Properties** (1):
  - `flags`: `JsonStringifyFlags` — [Read-Write] (JsonStringifyFlags)

### `unreal.JsonStringifyFlags`
Inherits: `EnumBase` | Header: `Stringify.h`

EJson Stringify Flags

**Properties** (3):
  - `DEFAULT`: `JsonStringifyFlags = Ellipsis` — The default representation of an object attempts to be complete and stable across time 0
  - `DISABLE_DELTA_ENCODING`: `JsonStringifyFlags = Ellipsis` — Disables delta encoding such that all properties are encoded in the Json, rather than only changes f...
  - `FILTER_EDITOR_ONLY_DATA`: `JsonStringifyFlags = Ellipsis` — Filters editor only data such that it is not written to the Json 1
