# UE Python API — ChaosCloth Module

**2 types** from the `ChaosCloth` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ChaosClothingInteractor`, `ChaosClothingSimulationInteractor`

---

## Classes

### `unreal.ChaosClothingInteractor`
Inherits: `ClothingInteractor` | Header: `ChaosClothingSimulationInteractor.h`

Chaos Clothing Interactor

**Methods** (17):
  - `reset_and_teleport(reset = False, teleport = False)` -> `None` — Reset and Teleport
  - `set_aerodynamics(drag_coefficient = 0.070000, lift_coefficient = 0.035000, wind_velocity = [0.000000,0.000000,0.000000])` -> `None` — Deprecated. This function cannot set different Low and High values for the Drag and Lift weight maps. Use SetWind instea...
  - `set_anim_drive(anim_drive_stiffness = [0.000000,1.000000], anim_drive_damping = [0.000000,1.000000])` -> `None` — Set Anim Drive
  - `set_anim_drive_linear(anim_drive_stiffness = 0.000000)` -> `None` — Set Anim Drive Linear
  - `set_backstop(enabled = True)` -> `None` — Set Backstop
  - `set_collision(collision_thickness = 1.000000, friction_coefficient = 0.800000, use_ccd = False, self_collision_thickness = 2.000000)` -> `None` — Set Collision
  - `set_damping(damping_coefficient = 0.010000, local_damping_coefficient = 0.000000)` -> `None` — Set Damping
  - `set_gravity(gravity_scale = 1.000000, is_gravity_overridden = False, gravity_override = [0.000000,0.000000,-981.000000])` -> `None` — Set Gravity
  - `set_long_range_attachment(tether_stiffness = [1.000000,1.000000], tether_scale = [1.000000,1.000000])` -> `None` — Set Long Range Attachment
  - `set_long_range_attachment_linear(tether_stiffness = 1.000000, tether_scale = 1.000000)` -> `None` — Set Long Range Attachment Linear
  - `set_material(edge_stiffness = [1.000000,1.000000], bending_stiffness = [1.000000,1.000000], area_stiffness = [1.000000,1.000000])` -> `None` — Set Material
  - `set_material_buckling(buckling_ratio = [0.000000,0.000000], buckling_stiffness = [1.000000,1.000000])` -> `None` — Set Material Buckling
  - `set_material_linear(edge_stiffness = 1.000000, bending_stiffness = 1.000000, area_stiffness = 1.000000)` -> `None` — Set Material Linear
  - `set_pressure(pressure = [0.000000,1.000000])` -> `None` — Set Pressure
  - `set_velocity_clamps(enable_linear_velocity_clamping = False, max_linear_velocity = [1000.000000,1000.000000,1000.000000], enable_linear_acceleration_clamping = False, max_linear_acceleration = [60000.000000,60000.000000,60000.000000], enable_angular_velocity_clamping = False, max_angular_velocity = 200.000000, enable_angular_acceleration_clamping = False, max_angular_acceleration = 12000.000000)` -> `None` — Set Velocity Clamps
  - `set_velocity_scale(linear_velocity_scale = [0.750000,0.750000,0.750000], angular_velocity_scale = 0.750000, fictitious_angular_scale = 1.000000)` -> `None` — Set Velocity Scale
  - `set_wind(drag = [0.070000,0.500000], lift = [0.070000,0.500000], air_density = 0.000001, wind_velocity = [0.000000,0.000000,0.000000], outer_drag = [0.070000,0.500000], outer_lift = [0.070000,0.500000])` -> `None` — Set Wind

### `unreal.ChaosClothingSimulationInteractor`
Inherits: `ClothingSimulationInteractor` | Header: `ChaosClothingSimulationInteractor.h`

Chaos Clothing Simulation Interactor
