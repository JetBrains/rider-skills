# UE Python API — GeoReferencingEditor Module

**1 types** from the `GeoReferencingEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `GeoReferencingEditorBPLibrary`

---

## Classes

### `unreal.GeoReferencingEditorBPLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `GeoReferencingEditorBPLibrary.h`

Geo Referencing Editor BPLibrary

**Methods** (4):
  - `get_viewport_cursor_information(screen_location=Vector2D, world_location=Vector, world_direction=Vector)` [classmethod] — Retrieve information about the viewport under the mouse cursor.
  - `get_viewport_cursor_location(screen_location=Vector2D)` [classmethod] — Retrieve the Viewport-Space position of the mouse in the Level Editor Viewport. If the Level editor not are in focus it ...
  - `line_trace(world_location, world_direction, actors_to_ignore, trace_complex, hit_result=HitResult)` [classmethod] — LineTrace at specific location/direction
  - `line_trace_viewport(actors_to_ignore, trace_complex, success=bool, hit_result=HitResult)` [classmethod] — LineTrace under mouse cursor and return various information
