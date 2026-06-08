# UE Python API — VPBookmarkEditor Module

**1 types** from the `VPBookmarkEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `VPBookmarkEditorBlueprintLibrary`

---

## Classes

### `unreal.VPBookmarkEditorBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `VPBookmarkEditorBlueprintLibrary.h`

VPBookmark Editor Blueprint Library

**Methods** (4):
  - `add_bookmark_at_current_level_editor_position(actor_class, creation_context, offset, flatten_rotation = True)` -> `Actor` [classmethod] — Add Bookmark at Current Level Editor Position
  - `get_all_actors_class_tham_implements_vp_bookmark_interface()` -> `Array [ type ( Class ) ]` [classmethod] — Get All Actors Class Tham Implements VPBookmark Interface
  - `jump_to_bookmark_in_level_editor(bookmark)` -> `bool` [classmethod] — Jump to Bookmark in Level Editor
  - `jump_to_bookmark_in_level_editor_by_index(bookmark_index)` -> `bool` [classmethod] — Jump to Bookmark in Level Editor by Index
