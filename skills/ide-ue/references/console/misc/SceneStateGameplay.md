# UE Python API — SceneStateGameplay Module

**3 types** from the `SceneStateGameplay` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `SceneStateActor`, `SceneStateComponent`, `SceneStateComponentPlayer`

---

## Classes

### `unreal.SceneStateActor`
Inherits: `Actor` | Header: `SceneStateActor.h`

Scene State Actor

**Methods** (1):
  - `get_scene_state()` -> `SceneStateObject` — Get Scene State

**Properties** (1):
  - `scene_state_component`: `SceneStateComponent` [Read-Only] — [Read-Only] (SceneStateComponent)

### `unreal.SceneStateComponent`
Inherits: `ActorComponent` | Header: `SceneStateComponent.h`

Scene State Component

**Methods** (1):
  - `get_scene_state()` -> `SceneStateObject` — Get Scene State

### `unreal.SceneStateComponentPlayer`
Inherits: `SceneStatePlayer` | Header: `SceneStateComponentPlayer.h`

Scene State Player for Scene State Components
