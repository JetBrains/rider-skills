# UE Python API — ActorSequence Module

**3 types** from the `ActorSequence` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ActorSequence`, `ActorSequenceComponent`, `ActorSequencePlayer`

---

## Classes

### `unreal.ActorSequence`
Inherits: `MovieSceneSequence` | Header: `ActorSequence.h`

Movie scene animation embedded within an actor.

### `unreal.ActorSequenceComponent`
Inherits: `ActorComponent` | Header: `ActorSequenceComponent.h`

Movie scene animation embedded within an actor.

**Methods** (3):
  - `pause_sequence()` -> `None` — Calls the Pause function on the SequencePlayer if its valid.
  - `play_sequence()` -> `None` — Calls the Play function on the SequencePlayer if its valid.
  - `stop_sequence()` -> `None` — Calls the Stop function on the SequencePlayer if its valid.

**Properties** (1):
  - `sequence_player`: `ActorSequencePlayer` [Read-Only] — [Read-Only] (ActorSequencePlayer)

### `unreal.ActorSequencePlayer`
Inherits: `MovieSceneSequencePlayer` | Header: `ActorSequencePlayer.h`

UActorSequencePlayer is used to actually âplayâ an actor sequence asset at runtime.
