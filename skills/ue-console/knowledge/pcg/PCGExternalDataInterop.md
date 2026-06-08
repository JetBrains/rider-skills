# UE Python API — PCGExternalDataInterop Module

**2 types** from the `PCGExternalDataInterop` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `PCGLoadAlembicSettings`, `PCGLoadAlembicStandardSetup`

---

## Classes

### `unreal.PCGLoadAlembicSettings`
Inherits: `PCGExternalDataSettings` | Header: `PCGLoadAlembicElement.h`

PCGLoad Alembic Settings

**Methods** (1):
  - `setup_from_standard(setup)` -> `None` — Setup from Standard

**Properties** (4):
  - `alembic_file_path`: `FilePath` — [Read-Write] (FilePath)
  - `conversion_flip_handedness`: `bool` — [Read-Write] Flips rotation direction (W), useful together with swizzling (bool)
  - `conversion_rotation`: `Vector` — [Read-Write] Rotation in Euler angles applied during import. For Max, use (90, 0, 0). (Vector)
  - `conversion_scale`: `Vector` — [Read-Write] Scale to apply during import. Note that for both Max/Maya presets the value flips the Y...

### `unreal.PCGLoadAlembicStandardSetup`
Inherits: `EnumBase` | Header: `PCGLoadAlembicElement.h`

EPCGLoad Alembic Standard Setup

**Properties** (2):
  - `CITY_SAMPLE`: `PCGLoadAlembicStandardSetup = Ellipsis` — right handed Y-up and the orient and scale mapping to the rotation and scale, respectively 1 Uses th...
  - `NONE`: `PCGLoadAlembicStandardSetup = Ellipsis` — 0
