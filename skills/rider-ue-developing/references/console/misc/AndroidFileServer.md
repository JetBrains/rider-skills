# UE Python API — AndroidFileServer Module

**2 types** from the `AndroidFileServer` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AndroidFileServerBPLibrary`, `AFSActiveType`

---

## Classes

### `unreal.AndroidFileServerBPLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AndroidFileServerBPLibrary.h`

Android File Server BPLibrary

**Methods** (3):
  - `is_file_server_running()` -> `AFSActiveType` [classmethod] — Check if Android FileServer is running
  - `start_file_server(usb = True, network = False, port = 57099)` -> `bool` [classmethod] — Request startup of Android FileServer
  - `stop_file_server(usb = True, network = True)` -> `bool` [classmethod] — Request termination of Android FileServer

### `unreal.AFSActiveType`
Inherits: `EnumBase` | Header: `AndroidFileServerBPLibrary.h`

EAFSActive Type

**Properties** (4):
  - `COMBINED`: `AFSActiveType = Ellipsis` — 3
  - `NETWORK_ONLY`: `AFSActiveType = Ellipsis` — 2
  - `NONE`: `AFSActiveType = Ellipsis` — 0
  - `USB_ONLY`: `AFSActiveType = Ellipsis` — 1
