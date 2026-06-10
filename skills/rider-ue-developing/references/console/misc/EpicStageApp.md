# UE Python API — EpicStageApp Module

**1 types** from the `EpicStageApp` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `StageAppFunctionLibrary`

---

## Classes

### `unreal.StageAppFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `StageAppLibrary.h`

Generally useful Blueprint/remote functions for Epic Stage App integration.

**Methods** (2):
  - `get_api_version()` -> `str` [classmethod] — Get the current semantic version for the stage app API as a formatted string.
  - `get_remote_control_web_interface_port()` -> `int32` [classmethod] — Get the port number used to access the remote control web interface for this engine instance.
