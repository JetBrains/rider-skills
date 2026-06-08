# UE Python API — CaptureManagerUnrealEndpoint Module

**1 types** from the `CaptureManagerUnrealEndpoint` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `CaptureManagerUnrealEndpointManager`

---

## Classes

### `unreal.CaptureManagerUnrealEndpointManager`
Inherits: `Object` | Header: `UCaptureManagerUnrealEndpointManager.h`

This class wraps an underlying Unreal Endpoint Manager so that python and blueprints can make use of it.

**Methods** (3):
  - `start()` -> `None` — Starts the endpoint manager and the discovery of unreal endpoints.
  - `stop()` -> `None` — Stops the endpoint manager.
  - `wait_for_endpoint_by_host_name(host_name, timeout_ms)` -> `bool` — Waits for an endpoint with a particular host name to be discovered or a timeout is reached. returns true if the host was...
