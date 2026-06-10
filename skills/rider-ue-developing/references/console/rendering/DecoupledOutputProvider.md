# UE Python API — DecoupledOutputProvider Module

**2 types** from the `DecoupledOutputProvider` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DecoupledOutputProvider`, `VCamPixelStreamingSession`

---

## Classes

### `unreal.DecoupledOutputProvider`
Inherits: `VCamOutputProviderBase` | Header: `DecoupledOutputProvider.h`

A decoupled output provider only contains data and forwards all important events to an IOutputProviderLogic, which may or may not exist. This allows the data to be loaded on all platforms but perform ...

### `unreal.VCamPixelStreamingSession`
Inherits: `DecoupledOutputProvider` | Header: `VCamPixelStreamingSession.h`

VCam Pixel Streaming Session

**Properties** (7):
  - `auto_set_live_link_subject`: `bool` — [Read-Write] If true then the Live Link Subject of the owning VCam Component will be set to the subj...
  - `enable_ar_kit_tracking`: `bool` — [Read-Write] Check this if you wish to control the corresponding CineCamera with transform data rece...
  - `from_composure_output_provider_index`: `int` — [Read-Write] If using the output from a Composure Output Provider, specify it here (int32)
  - `match_remote_resolution`: `bool` — [Read-Write] If true the streamed UE viewport will match the resolution of the remote device. (bool)
  - `override_streamer_name`: `bool` — [Read-Write] Whether to override StreamerId with a user provided name. (bool)
  - `prevent_editor_idle`: `bool` — [Read-Write] If not selected, when the editor is not the foreground application, input through the v...
  - `streamer_id`: `str` — [Read-Write] The name of this streamer to be reported to the signalling server.
Defaults to the acto...
