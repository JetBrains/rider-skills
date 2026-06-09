# UE Python API — ClothingSystemRuntimeInterface Module

**5 types** from the `ClothingSystemRuntimeInterface` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ClothConfigBase`, `ClothingAssetBase`, `ClothingInteractor`, `ClothingSimulationInteractor`, `ClothingTeleportMode`

---

## Classes

### `unreal.ClothConfigBase`
Inherits: `Object` | Header: `ClothConfigBase.h`

Base class for simulator specific simulation controls. Each cloth instance on a skeletal mesh can have a unique cloth config

### `unreal.ClothingAssetBase`
Inherits: `Object` | Header: `ClothingAssetBase.h`

An interface object for any clothing asset the engine can use. Any clothing asset concrete object should derive from this.

### `unreal.ClothingInteractor`
Inherits: `Object` | Header: `ClothingSimulationInteractor.h`

Abstract class to control clothing specific interaction. Must be cast to the end used clothing simulation object before use.

### `unreal.ClothingSimulationInteractor`
Inherits: `Object` | Header: `ClothingSimulationInteractor.h`

If a clothing simulation is able to be interacted with at runtime then a derived interactor should be created, and at least the basic API implemented for that simulation. Only write to the simulation ...

**Methods** (15):
  - `cloth_config_updated()` -> `None` — Called to update the cloth config without restarting the simulation.
  - `disable_gravity_override()` -> `None` — Disable any currently set gravity override.
  - `enable_gravity_override(vector)` -> `None` — Set a new gravity override and enable the override.
  - `get_clothing_interactor(clothing_asset_name)` -> `ClothingInteractor` — Return a cloth interactor for this simulation.
  - `get_num_cloths()` -> `int32` — Return the number of cloths run by the simulation.
  - `get_num_dynamic_particles()` -> `int32` — Return the number of dynamic (simulated) particles.
  - `get_num_iterations()` -> `int32` — Return the solver number of iterations. This could be different from the number set if the simulation hasnât updated y...
  - `get_num_kinematic_particles()` -> `int32` — Return the number of kinematic (animated) particles.
  - `get_num_substeps()` -> `int32` — Return the solver number of subdivisions./ This could be different from the number set if the simulation hasnât update...
  - `get_simulation_time()` -> `float` — Return the instant average simulation time in ms.
  - `physics_asset_updated()` -> `None` — Called to update collision status without restarting the simulation.
  - `set_anim_drive_spring_stiffness(stiffness)` -> `None` — Set the stiffness of the spring force for the animation drive.
  - `set_max_num_iterations(max_num_iterations = 10)` -> `None` — Set the maximum number of solver iterations.
  - `set_num_iterations(num_iterations = 1)` -> `None` — Set the number of time dependent solver iterations.
  - `set_num_substeps(num_substeps = 1)` -> `None` — Set the number of substeps or subdivisions.

### `unreal.ClothingTeleportMode`
Inherits: `EnumBase` | Header: `ClothingSystemRuntimeTypes.h`

EClothing Teleport Mode

**Properties** (4):
  - `HARD_RESET`: `ClothingTeleportMode = Ellipsis` — Hard reset the simulation by refreshing the cloth config 3
  - `NONE`: `ClothingTeleportMode = Ellipsis` — No teleport, simulate as normal 0
  - `TELEPORT`: `ClothingTeleportMode = Ellipsis` — Teleport the simulation, causing no intertial effects but keep the sim mesh shape 1
  - `TELEPORT_AND_RESET`: `ClothingTeleportMode = Ellipsis` — Teleport the simulation, causing no intertial effects and reset the sim mesh shape 2
