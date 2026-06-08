# UE Python API — NiagaraAnimNotifies Module

**4 types** from the `NiagaraAnimNotifies` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CurveParameterPair`, `AnimNotify_PlayNiagaraEffect`, `AnimNotifyState_TimedNiagaraEffect`, `AnimNotifyState_TimedNiagaraEffectAdvanced`

---

## Classes

### `unreal.CurveParameterPair`
Inherits: `StructBase` | Header: `AnimNotifyState_TimedNiagaraEffect.h`

Curve Parameter Pair

**Properties** (2):
  - `anim_curve_name`: `Name` [Read-Only] — [Read-Only] Name of the curve in this montage. (Name)
  - `user_variable_name`: `Name` [Read-Only] — [Read-Only] Name of the Niagara user float variable. (Name)

### `unreal.AnimNotify_PlayNiagaraEffect`
Inherits: `AnimNotify` | Header: `AnimNotify_PlayNiagaraEffect.h`

Anim Notify Play Niagara Effect

**Methods** (1):
  - `get_spawned_effect()` -> `FXSystemComponent` — Return FXSystemComponent created from SpawnEffect

**Properties** (5):
  - `attached`: `bool` [Read-Only] — [Read-Only] Should attach to the bone/socket (bool)
  - `location_offset`: `Vector` [Read-Only] — [Read-Only] Location offset from the socket (Vector)
  - `rotation_offset`: `Rotator` [Read-Only] — [Read-Only] Rotation offset from socket (Rotator)
  - `socket_name`: `Name` [Read-Only] — [Read-Only] SocketName to attach to (Name)
  - `template`: `NiagaraSystem` [Read-Only] — [Read-Only] Niagara System to Spawn (NiagaraSystem)

### `unreal.AnimNotifyState_TimedNiagaraEffect`
Inherits: `AnimNotifyState` | Header: `AnimNotifyState_TimedNiagaraEffect.h`

Timed Niagara Effect Notify Allows a looping Niagara effect to be played in an animation that will activate at the beginning of the notify and deactivate at the end.

**Methods** (1):
  - `get_spawned_effect(mesh_comp)` -> `FXSystemComponent` — Return FXSystemComponent created from SpawnEffect

**Properties** (6):
  - `apply_rate_scale_as_time_dilation`: `bool` [Read-Only] — [Read-Only] Should we set the animation rate scale as time dilation on the spawn effect? (bool)
  - `destroy_at_end`: `bool` [Read-Only] — [Read-Only] Whether the Niagara system should be immediately destroyed at the end of the notify stat...
  - `location_offset`: `Vector` [Read-Only] — [Read-Only] Offset from the socket or bone to place the Niagara system (Vector)
  - `rotation_offset`: `Rotator` [Read-Only] — [Read-Only] Rotation offset from the socket or bone for the Niagara system (Rotator)
  - `socket_name`: `Name` [Read-Only] — [Read-Only] The socket or bone to attach the system to (Name)
  - `template`: `NiagaraSystem` [Read-Only] — [Read-Only] The niagara system to spawn for the notify state (NiagaraSystem)

### `unreal.AnimNotifyState_TimedNiagaraEffectAdvanced`
Inherits: `AnimNotifyState_TimedNiagaraEffect` | Header: `AnimNotifyState_TimedNiagaraEffect.h`

Same as Timed Niagara Effect but also provides some more advanced abilities at an additional cost.

**Methods** (1):
  - `get_notify_progress(mesh_comp)` -> `float` — Returns a 0 to 1 value for the progress of this component along the notify.

**Properties** (1):
  - `apply_rate_scale_to_progress`: `bool` [Read-Only] — [Read-Only] Should we apply the animation rate scale when calculating the elasped time. (bool)
