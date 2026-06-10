# UE Python API — Buoyancy Module

**2 types** from the `Buoyancy` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `BuoyancyEventInterface`, `BuoyancyEventFlags`

---

## Classes

### `unreal.BuoyancyEventInterface`
Inherits: `Interface` | Header: `BuoyancyEventInterface.h`

Buoyancy Event Interface

**Methods** (3):
  - `on_surface_touch_begin(water_body_actor, water_component, submerged_component, submerged_volume, submerged_center_of_mass, submerged_velocity)` -> `None` — Called when part of a submerged simulated actor first comes in contact with a water surface. This can be called for mult...
  - `on_surface_touch_end(water_body_actor, water_component, submerged_component, submerged_volume, submerged_center_of_mass, submerged_velocity)` -> `None` — Called when a submerged body loses contact with all water surfaces. This can result from total submersion or from coming...
  - `on_surface_touching(water_body_actor, water_component, submerged_component, submerged_volume, submerged_center_of_mass, submerged_velocity)` -> `None` — Called continually while objects maintain contact with a water surface. May be called multiple times for different parts...

### `unreal.BuoyancyEventFlags`
Inherits: `EnumBase` | Header: `BuoyancyEventFlags.h`

EBuoyancy Event Flags

**Properties** (3):
  - `BEGIN`: `BuoyancyEventFlags = Ellipsis` — 1
  - `CONTINUE`: `BuoyancyEventFlags = Ellipsis` — 2
  - `END`: `BuoyancyEventFlags = Ellipsis` — 4
