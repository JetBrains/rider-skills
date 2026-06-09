# UE Python API — VPBookmark Module

**5 types** from the `VPBookmark` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `VPBookmarkCreationContext`, `VPBookmarkViewportData`, `VPBookmark`, `VPBookmarkLibrary`, `VPBookmarkProvider`

---

## Classes

### `unreal.VPBookmarkCreationContext`
Inherits: `StructBase` | Header: `VPBookmarkContext.h`

VPBookmark Creation Context

**Properties** (3):
  - `category_name`: `Name` — [Read-Write] Category of the Bookmark (Name)
  - `concert_creator`: `str` — [Read-Write] Username of the Concert client who is creating this bookmark. (str)
  - `display_name`: `str` — [Read-Write] Name of the Bookmark (str)

### `unreal.VPBookmarkViewportData`
Inherits: `StructBase` | Header: `VPBookmark.h`

VPBookmark Viewport Data

**Properties** (4):
  - `flatten_rotation`: `bool` [Read-Only] — [Read-Only] (bool)
  - `jump_to_offset_location`: `Vector` — [Read-Write] (Vector)
  - `look_rotation`: `Rotator` — [Read-Write] (Rotator)
  - `ortho_zoom`: `float` — [Read-Write] (float)

### `unreal.VPBookmark`
Inherits: `BookmarkBase` | Header: `VPBookmark.h`

**Methods** (4):
  - `get_associated_bookmark_actor()` -> `Actor` — Get Associated Bookmark Actor
  - `get_bookmark_index()` -> `int32` — Get Bookmark Index
  - `get_display_name()` -> `Text` — Get Display Name
  - `is_active()` -> `bool` — Is Active

**Properties** (2):
  - `cached_viewport_data`: `VPBookmarkViewportData` [Read-Only] — [Read-Only] (VPBookmarkViewportData)
  - `creation_context`: `VPBookmarkCreationContext` [Read-Only] — [Read-Only] (VPBookmarkCreationContext)

### `unreal.VPBookmarkLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `VPBookmarkBlueprintLibrary.h`

VPBookmark Blueprint Library

**Methods** (4):
  - `create_vp_bookmark_name(bookmark, format_string)` -> `(generated_number=str, generated_letter=str) or None` [classmethod] — Create VPBookmark Name
  - `find_vp_bookmark(actor)` -> `VPBookmark` [classmethod] — Find VPBookmark
  - `get_all_vp_bookmark(world_context_object)` -> `Array [ VPBookmark ]` [classmethod] — Get All VPBookmark
  - `get_all_vp_bookmark_actors(world_context_object)` -> `Array [ Actor ]` [classmethod] — Get All VPBookmark Actors

### `unreal.VPBookmarkProvider`
Inherits: `Interface` | Header: `IVPBookmarkProvider.h`

VPBookmark Provider

**Methods** (5):
  - `generate_bookmark_name()` -> `None` — Generate Bookmark Name
  - `hide_bookmark_spline_mesh_indicator()` -> `None` — Hide Bookmark Spline Mesh Indicator
  - `on_bookmark_activation(bookmark, activate)` -> `None` — On Bookmark Activation
  - `on_bookmark_changed(bookmark)` -> `None` — On Bookmark Changed
  - `update_bookmark_spline_mesh_indicator()` -> `None` — Update Bookmark Spline Mesh Indicator
