# Niagara Particle System — Python API Limitations & Best Practices

## Critical Rule: Do NOT Author Niagara Systems from Python

The Niagara Python API is **extremely limited**. You CANNOT configure emitter internals (modules, spawn rate, velocity, lifetime, forces, renderers) from Python scripts executed via AgentBridge.

### What Python CAN Do

- Create a `NiagaraSystem` asset via `NiagaraSystemFactoryNew`
- Create a `NiagaraEmitter` asset via factory
- Load existing Niagara assets: `unreal.load_asset('/Game/...')`
- Spawn a `NiagaraActor` in the level
- Set **user parameter overrides** on `NiagaraComponent`:
  - `component.set_float_parameter('User.SpawnRate', 50.0)`
  - `component.set_vector_parameter('User.Color', unreal.Vector(1, 0.5, 0))`
  - `component.set_color_parameter('User.Color', unreal.LinearColor(...))`
- Activate/deactivate: `component.activate()`, `component.deactivate()`
- Set component transform (position, rotation, scale)

### AgentBridgeLibrary Niagara Extensions

The `AgentBridgeLibrary` C++ extension exposes additional Niagara inspection APIs to Python:

- **Get system parameters**: `unreal.AgentBridgeLibrary.get_niagara_system_parameters('/Game/FX/NS_Fire')` — returns JSON with all user-exposed parameters (name, type, value)
- **Get emitter info**: `unreal.AgentBridgeLibrary.get_niagara_system_emitters('/Game/FX/NS_Fire')` — returns JSON with emitter names, enabled state, sim target (CPU/GPU), determinism
- These are also available via REST: `GET /agent/niagara/params?path=...` and `GET /agent/niagara/emitters?path=...`

### What Python Still CANNOT Do

- Configure Spawn Rate, Initialize Particle, Particle Update, or any emitter module
- Set particle velocity, lifetime, gravity, size, sprite renderer properties
- Set `auto_deactivate` (not exposed)
- Set `warm_up_time` (only `warmup_time` exists, as read-only)
- Access `override_parameters` on `NiagaraComponent` (not exposed)
- Use `NiagaraPythonEmitter` or `NiagaraPythonModule` from AgentBridge — these are for Niagara's **internal Python scripting system** (run from within the Niagara Editor's "Python Script" action), NOT from external Python execution

### Properties That Don't Exist (Crash/Error Triggers)

| Attempted Property | Error |
|---|---|
| `auto_deactivate` | `Failed to find property 'auto_deactivate'` |
| `warm_up_time` | `Failed to find property 'warm_up_time'` |
| `emitter_handles` | `Failed to find property 'emitter_handles'` |
| `emitters` | `Failed to find property 'emitters'` |
| `num_emitters` | `Failed to find property 'num_emitters'` |
| `override_parameters` (on NiagaraComponent) | `Failed to find property 'override_parameters'` |
| `local_space` (on NiagaraEmitter) | Deprecated — `DeprecationWarning` |
| `renderer_properties` (on NiagaraEmitter) | Deprecated — `DeprecationWarning` |

### Crash: NiagaraPythonEmitter.GetObject()

Constructing a `NiagaraPythonEmitter` outside of Niagara's internal scripting context causes a **SIGSEGV crash**:
```
Assertion failed: IsValid() [SharedPointer.h:1082]
UNiagaraPythonEmitter::GetObject() -> SIGSEGV: invalid attempt to access memory at address 0x3
```
`NiagaraPythonEmitter` expects to be created by the Niagara editor's Python script action runner, which provides a valid shared pointer. Constructing it from AgentBridge gives a null pointer.

**NEVER instantiate `NiagaraPythonEmitter` from AgentBridge scripts.**

## Correct Approaches for Particle Effects

### 1. Best: Reuse Existing Project Effects

Most UE projects have existing particle effects. Search the project first:

```python
import unreal
eal = unreal.EditorAssetLibrary

# Search for existing Niagara systems in the project
for folder in ['/Game/Effects/', '/Game/FX/', '/Game/Particles/', '/Game/VFX/']:
    if eal.does_directory_exist(folder):
        assets = eal.list_assets(folder, recursive=True)
        for a in assets:
            obj = unreal.load_asset(a)
            if obj and 'NiagaraSystem' in type(obj).__name__:
                print(a)
```

Look for: impact effects, hit sparks, muzzle flash, explosions — then duplicate and reposition.

### 2. Good: Place Existing System, Tell User to Customize

```python
import unreal

# Find and place a Niagara system
system = unreal.load_asset('/Game/Path/To/NS_ExistingEffect')
if system:
    subsys = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
    actor = subsys.spawn_actor_from_class(
        unreal.NiagaraActor,
        unreal.Vector(0, 0, 0)
    )
    comp = actor.get_component_by_class(unreal.NiagaraComponent)
    comp.set_asset(system)
    # Set user parameters if the system exposes them
    comp.set_vector_parameter('User.Color', unreal.Vector(1.0, 0.6, 0.1))
    print("Placed effect — open Niagara Editor to customize behavior")
```

Then tell the user: "The particle system is placed. To customize behavior (velocity, lifetime, gravity), open it in the Niagara Editor UI."

### 3. Avoid: Trying to Configure Niagara Internals from Python

Do NOT:
- Enumerate Niagara classes with `dir(unreal)` looking for configuration APIs
- Call `help()` on `NiagaraStackEntry`, `NiagaraPythonEmitter`, etc.
- Try to set module parameters via `set_editor_property`
- Iterate >3 times trying different property names on NiagaraSystem
- Create multiple v2/v3/v4 versions of the same system hoping one will work

If the first attempt to set a Niagara property fails, **stop and switch strategy** to approach 1 or 2 above.

## Performance & Stability Notes

- Niagara system compilation takes 1-2 seconds each time — repeated create/compile cycles slow down the session
- LWC (Large World Coordinates) warnings flood the log when Niagara uses position types — not critical but noisy
- Opening the Niagara editor via `open_editor_for_assets()` creates additional worlds — increases memory pressure
- Shader compilation for Niagara materials adds ~30 more shader jobs per system

## Anti-Pattern: API Exploration via help()

Dumping `help(unreal.NiagaraStackEntry)` produces 150+ lines of useless output. `NiagaraStackEntry` is an editor-internal base class with no actionable methods for particle configuration.

**Rule**: Do NOT explore Niagara API via `help()` or `dir()`. The useful Python API surface is fully documented in the "What Python CAN Do" section above.
