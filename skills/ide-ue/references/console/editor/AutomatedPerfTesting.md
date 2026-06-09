# UE Python API — AutomatedPerfTesting Module

**11 types** from the `AutomatedPerfTesting` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AutomatedPerfTestMapSequenceCombo`, `AutomatedMaterialPerfTestProjectSettings`, `AutomatedPerfTestGameModeBase`, `AutomatedPerfTestInterface`, `AutomatedPerfTestProjectSettings`, `AutomatedPerfTestStaticCamera`, `AutomatedPerfTestSubsystem`, `AutomatedReplayPerfTestProjectSettings`, `AutomatedSequencePerfTestProjectSettings`, `AutomatedStaticCameraPerfTestProjectSettings`, `AutomatedPerfTestCSVOutputMode`

---

## Classes

### `unreal.AutomatedPerfTestMapSequenceCombo`
Inherits: `StructBase` | Header: `AutomatedSequencePerfTest.h`

Automated Perf Test Map Sequence Combo

**Properties** (4):
  - `combo_name`: `Name` — [Read-Write] Use this name to directly reference this map/sequence combo via BuildGraph or UAT with ...
  - `game_mode_override`: `str` — [Read-Write] * The name of the alias of the game mode you can optionally override when opening the l...
  - `map`: `SoftObjectPath` — [Read-Write] (SoftObjectPath)
  - `sequence`: `SoftObjectPath` — [Read-Write] (SoftObjectPath)

### `unreal.AutomatedMaterialPerfTestProjectSettings`
Inherits: `DeveloperSettings` | Header: `AutomatedMaterialPerfTest.h`

Automated Material Perf Test Project Settings

**Properties** (11):
  - `camera_projection_mode`: `CameraProjectionMode` — [Read-Write] * Which camera projection mode to use (CameraProjectionMode)
  - `capture_screenshots`: `bool` — [Read-Write] * If true, will capture a screenshot for each material tested after gathering data (boo...
  - `cooldown_time`: `float` — [Read-Write] * For how long the material performance test should delay after ending evaluation befor...
  - `csv_output_mode`: `AutomatedPerfTestCSVOutputMode` — [Read-Write] * For Material Perf Tests, Granular will output one CSV per-material. (AutomatedPerfTes...
  - `game_mode_override`: `str` — [Read-Write] * If set, will launch the material performance test map with this game mode alias (make...
  - `material_performance_test_map`: `SoftObjectPath` — [Read-Write] * The map in which the material test will take place. Useful if you need to set up thin...
  - `material_plate`: `SoftObjectPath` — [Read-Write] * Which static mesh to use as the material plate (SoftObjectPath)
  - `materials_to_test`: `None` — [Read-Write] * List of materials to load and review for the Material Performance Test (Array[SoftObj...
  - `plate_distance_from_camera`: `float` — [Read-Write] * How far away from the camera should the material test plate be placed
* (will also be...
  - `soak_time`: `float` — [Read-Write] * For how long the material performance test should gather data on each material, in se...
  - `warm_up_time`: `float` — [Read-Write] * For how long the material performance test should delay before beginning to gather da...

### `unreal.AutomatedPerfTestGameModeBase`
Inherits: `GameModeBase` | Header: `AutomatedPerfTestGameModeBase.h`

Automated Perf Test Game Mode Base

**Methods** (4):
  - `exit()` -> `None` — Exit
  - `run_test()` -> `None` — Run Test
  - `setup_test()` -> `None` — Setup Test
  - `teardown_test()` -> `None` — Teardown Test

### `unreal.AutomatedPerfTestInterface`
Inherits: `Interface` | Header: `AutomatedPerfTestInterface.h`

Automated Perf Test Interface

**Methods** (4):
  - `exit()` -> `None` — Exit
  - `run_test()` -> `None` — Run Test
  - `setup_test()` -> `None` — Setup Test
  - `teardown_test()` -> `None` — Teardown Test

### `unreal.AutomatedPerfTestProjectSettings`
Inherits: `DeveloperSettings` | Header: `AutomatedPerfTestProjectSettings.h`

Automated Perf Test Project Settings

**Properties** (1):
  - `teardown_to_exit_delay`: `float` — [Read-Write] How many seconds to wait before transition from Teardown to Exiting the test (float)

### `unreal.AutomatedPerfTestStaticCamera`
Inherits: `CameraActor` | Header: `AutomatedPerfTestStaticCamera.h`

Automated Perf Test Static Camera

### `unreal.AutomatedPerfTestSubsystem`
Inherits: `EngineSubsystem` | Header: `AutomatedPerfTestSubsystem.h`

Automated Perf Test Subsystem

**Methods** (1):
  - `get_test_id()` -> `str` [classmethod] — Get Test ID

### `unreal.AutomatedReplayPerfTestProjectSettings`
Inherits: `DeveloperSettings` | Header: `AutomatedReplayPerfTest.h`

Automated Replay Perf Test Project Settings

**Methods** (1):
  - `get_replay_path_from_name(test_name)` -> `str or None` — Get replay path from given replay name

**Properties** (2):
  - `csv_output_mode`: `AutomatedPerfTestCSVOutputMode` — [Read-Write] (AutomatedPerfTestCSVOutputMode)
  - `replays_to_test`: `None` — [Read-Write] Path to replay file to be used during Replay Perf Test (Array[FilePath])

### `unreal.AutomatedSequencePerfTestProjectSettings`
Inherits: `DeveloperSettings` | Header: `AutomatedSequencePerfTest.h`

Automated Sequence Perf Test Project Settings

**Methods** (1):
  - `get_combo_from_test_name(test_name)` -> `AutomatedPerfTestMapSequenceCombo or None` — Get Combo from Test Name

**Properties** (3):
  - `csv_output_mode`: `AutomatedPerfTestCSVOutputMode` — [Read-Write] * For Sequence Perf Tests, Separate will output one CSV per map tested, and Granular wi...
  - `maps_and_sequences_to_test`: `None` — [Read-Write] * When the project is run with a Sequence Perf Test, cycle through the input maps, and ...
  - `sequence_start_delay`: `float` — [Read-Write] How long to delay between setting up the sequence for the map before the sequence actua...

### `unreal.AutomatedStaticCameraPerfTestProjectSettings`
Inherits: `DeveloperSettings` | Header: `AutomatedStaticCameraPerfTestBase.h`

Automated Static Camera Perf Test Project Settings

**Methods** (1):
  - `get_map_from_asset_name(asset_name)` -> `SoftObjectPath or None` — Get Map from Asset Name

**Properties** (7):
  - `capture_screenshots`: `bool` — [Read-Write] * If true, will capture a screenshot for each camera tested after gathering data (bool)
  - `cooldown_time`: `float` — [Read-Write] * For how long the static camera performance test should delay after ending evaluation ...
  - `csv_output_mode`: `AutomatedPerfTestCSVOutputMode` — [Read-Write] * For Static Camera Perf Tests, Separate will output one CSV per map tested, and Granul...
  - `game_mode_override`: `str` — [Read-Write] * If set, will launch the material performance test map with this game mode alias (make...
  - `maps_to_test`: `None` — [Read-Write] * List of levels to test (Array[SoftObjectPath])
  - `soak_time`: `float` — [Read-Write] * For how long the static camera performance test should gather data on each camera, in...
  - `warm_up_time`: `float` — [Read-Write] * For how long the material performance test should delay before beginning to gather da...

### `unreal.AutomatedPerfTestCSVOutputMode`
Inherits: `EnumBase` | Header: `AutomatedPerfTestControllerBase.h`

EAutomated Perf Test CSVOutput Mode

**Properties** (3):
  - `GRANULAR`: `AutomatedPerfTestCSVOutputMode = Ellipsis` — Output granular CSVs during the test run, resulting in multiple CSVs between RunTest and TeardownTes...
  - `SEPARATE`: `AutomatedPerfTestCSVOutputMode = Ellipsis` — Output CSVs from RunTest to TeardownTest. May result into multiple output CSVs that require special ...
  - `SINGLE`: `AutomatedPerfTestCSVOutputMode = Ellipsis` — Output a single CSV with all of the results for the entire session, from SetupTest to ExitTest. 0
