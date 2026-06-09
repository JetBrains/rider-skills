# UE Python API — XRCreativeEditor Module

**2 types** from the `XRCreativeEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `XRCreativeEditorUtilityToolActor`, `XRCreativeVREditorMode`

---

## Classes

### `unreal.XRCreativeEditorUtilityToolActor`
Inherits: `XRCreativeToolActor` | Header: `XRCreativeEditorUtilityToolActor.h`

XRCreative Editor Utility Tool Actor

**Methods** (2):
  - `get_input_component()` -> `InputComponent` — Returns the current InputComponent on this utility actor. This will be NULL unless bReceivesEditorInput is set to true.
  - `run()` -> `None` — Standard function to execute

**Properties** (1):
  - `receives_editor_input`: `bool` — [Read-Write] If set to true, then this actor will be able to recieve input delegate callbacks when i...

### `unreal.XRCreativeVREditorMode`
Inherits: `VREditorModeBase` | Header: `XRCreativeVREditorMode.h`

XRCreative VREditor Mode

**Methods** (7):
  - `bp_on_enter()` -> `None` — BP on Enter
  - `bp_on_exit()` -> `None` — BP on Exit
  - `bp_tick(delta_seconds)` -> `None` — BP Tick
  - `get_head_transform()` -> `Transform` — Get Head Transform
  - `get_room_transform()` -> `Transform` — Get Room Transform
  - `set_head_transform(head_to_world)` -> `None` — Set Head Transform
  - `set_room_transform(room_to_world)` -> `None` — Set Room Transform

**Properties** (1):
  - `avatar`: `XRCreativeAvatar` [Read-Only] — [Read-Only] (XRCreativeAvatar)
