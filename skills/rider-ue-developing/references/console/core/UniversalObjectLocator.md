# UE Python API — UniversalObjectLocator Module

**3 types** from the `UniversalObjectLocator` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `UniversalObjectLocator`, `UniversalObjectLocatorFragment`, `LocatorResolveFlags`

---

## Classes

### `unreal.UniversalObjectLocator`
Inherits: `StructBase` | Header: `UniversalObjectLocator.h`

Universal Object Locators (UOLs) define an address to an object.

**Methods** (5):
  - `is_empty()` -> `bool` — Check whether the specified locator is empty; not equivalent to Resolve() != None. An empty locator will never resolve t...
  - `sync_find(context = None)` -> `Object` — Attempt to resolve the object locator by finding the object. If it is not currently loaded or created,
  - `sync_load(context = None)` -> `Object` — Attempt to resolve the object locator by finding or loading the object.
  - `sync_unload(context = None)` -> `None` — Attempt to resolve the object locator by unloading the object if possible.
  - `to_string()` -> `str` — Convert the specified locator to its string representation

### `unreal.UniversalObjectLocatorFragment`
Inherits: `StructBase` | Header: `UniversalObjectLocatorFragment.h`

### `unreal.LocatorResolveFlags`
Inherits: `EnumBase` | Header: `UniversalObjectLocatorResolveParams.h`

ELocator Resolve Flags

**Properties** (6):
  - `ASYNC`: `LocatorResolveFlags = Ellipsis` — Indicates that the operation should be performed asynchronously if possible.
When not combined with ...
  - `ASYNC_WAIT`: `LocatorResolveFlags = Ellipsis` — Combination of Async and WillWait. 12
  - `LOAD`: `LocatorResolveFlags = Ellipsis` — Flag to indicate whether the object should be loaded if it is not currently findable 1
  - `NONE`: `LocatorResolveFlags = Ellipsis` — 0
  - `UNLOAD`: `LocatorResolveFlags = Ellipsis` — Flag to indicate whether the object should be unloaded or destroyed. Mutually exclusive with bLoad. ...
  - `WILL_WAIT`: `LocatorResolveFlags = Ellipsis` — Indicates the calling code is going to block waiting for the result. 8
