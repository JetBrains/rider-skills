# UE Python API — DirectLinkTest Module

**1 types** from the `DirectLinkTest` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DirectLinkTestLibrary`

---

## Classes

### `unreal.DirectLinkTestLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `DirectLinkTestLibrary.h`

Direct Link Test Library

**Methods** (14):
  - `add_public_destination(endpoint_id, dest_name)` -> `bool` [classmethod] — Add Public Destination
  - `add_public_source(endpoint_id, source_name)` -> `bool` [classmethod] — Add Public Source
  - `delete_all_endpoint()` -> `bool` [classmethod] — Delete All Endpoint
  - `delete_endpoint(endpoint_id)` -> `bool` [classmethod] — Delete Endpoint
  - `dump_received_scene()` -> `bool` [classmethod] — Dump Received Scene
  - `make_endpoint(nice_name, verbose = True)` -> `int32` [classmethod] — Make Endpoint
  - `send_scene(file_path)` -> `bool` [classmethod] — Send Scene
  - `setup_receiver()` -> `bool` [classmethod] — Setup Receiver
  - `setup_sender()` -> `bool` [classmethod] — Setup Sender
  - `start_receiver()` -> `bool` [classmethod] — Start Receiver
  - `start_sender()` -> `bool` [classmethod] — Start Sender
  - `stop_receiver()` -> `bool` [classmethod] — Stop Receiver
  - `stop_sender()` -> `bool` [classmethod] — Stop Sender
  - `test_parameters()` -> `bool` [classmethod] — Test Parameters
