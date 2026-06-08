# UE Python API — CableComponent Module

**2 types** from the `CableComponent` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CableActor`, `CableComponent`

---

## Classes

### `unreal.CableActor`
Inherits: `Actor` | Header: `CableActor.h`

An actor that renders a simulated cable

**Properties** (1):
  - `cable_component`: `CableComponent` [Read-Only] — [Read-Only] Cable component that performs simulation and rendering (CableComponent)

### `unreal.CableComponent`
Inherits: `MeshComponent` | Header: `CableComponent.h`

Component that allows you to specify custom triangle mesh geometry

**Methods** (5):
  - `get_attached_actor()` -> `Actor` — Gets the Actor that the cable is attached to *
  - `get_attached_component()` -> `SceneComponent` — Gets the specific USceneComponent that the cable is attached to *
  - `get_cable_particle_locations()` -> `Array [ Vector ]` — Get array of locations of particles (in world space) making up the cable simulation.
  - `set_attach_end_to(actor, component_property, socket_name = 'None')` -> `None` — Attaches the end of the cable to a specific Component within an Actor *
  - `set_attach_end_to_component(component, socket_name = 'None')` -> `None` — Attaches the end of the cable to a specific Component *

**Properties** (22):
  - `attach_end`: `bool` — [Read-Write] Should we fix the end to something (using AttachEndTo and EndLocation), or leave it fre...
  - `attach_start`: `bool` — [Read-Write] Should we fix the start to something, or leave it free.
If false, component transform i...
  - `cable_force`: `Vector` — [Read-Write] Force vector (world space) applied to all particles in cable. (Vector)
  - `cable_gravity_scale`: `float` — [Read-Write] Scaling applied to world gravity affecting this cable. (float)
  - `cable_length`: `float` — [Read-Write] Rest length of the cable (float)
  - `cable_width`: `float` — [Read-Write] How wide the cable geometry is (float)
  - `collision_friction`: `float` — [Read-Write] If collision is enabled, control how much sliding friction is applied when cable is in ...
  - `enable_collision`: `bool` — [Read-Write] EXPERIMENTAL. Perform sweeps for each cable particle, each substep, to avoid collisions...
  - `enable_stiffness`: `bool` — [Read-Write] Add stiffness constraints to cable. (bool)
  - `end_location`: `Vector` — [Read-Write] End location of cable, relative to AttachEndTo (or AttachEndToSocketName) if specified,...
  - `num_segments`: `int` [Read-Only] — [Read-Only] How many segments the cable has (int32)
  - `num_sides`: `int` [Read-Only] — [Read-Only] Number of sides of the cable geometry (int32)
  - `reset_after_teleport`: `bool` — [Read-Write] Always reset cable particle positions and velocities on a teleport. (bool)
  - `skip_cable_update_when_not_owner_recently_rendered`: `bool` — [Read-Write] (bool)
  - `skip_cable_update_when_not_visible`: `bool` — [Read-Write] (bool)
  - `solver_iterations`: `int` — [Read-Write] The number of solver iterations controls how âstiffâ the cable is (int32)
  - `substep_time`: `float` [Read-Only] — [Read-Only] Controls the simulation substep time for the cable (float)
  - `teleport_after_reattach`: `bool` — [Read-Write] Teleport the cable particles on reattaching any end of the cable. (bool)
  - `teleport_distance_threshold`: `float` — [Read-Write] Conduct teleportation if the movement of either fixed end point of the cable is greater...
  - `teleport_rotation_threshold`: `float` — [Read-Write] Rotation threshold in degrees.
Conduct teleportation if the cableâs rotation is great...
  - `tile_material`: `float` — [Read-Write] How many times to repeat the material along the length of the cable (float)
  - `use_substepping`: `bool` — [Read-Write] When false, will still wait for SubstepTime to elapse before updating, but will only ru...
