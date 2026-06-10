# UE Python API — DynamicMaterialMediaStreamBridge Module

**2 types** from the `DynamicMaterialMediaStreamBridge` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DMMaterialValueMediaStream`, `DMMaterialValueMediaStreamDynamic`

---

## Classes

### `unreal.DMMaterialValueMediaStream`
Inherits: `DMMaterialValueTexture` | Header: `DMMaterialValueMediaStream.h`

Component representing a render target texture value. Manages its own parameter.

**Methods** (1):
  - `get_media_stream()` -> `MediaStream` — Get Media Stream

**Properties** (1):
  - `media_stream`: `MediaStream` [Read-Only] — [Read-Only] (MediaStream)

### `unreal.DMMaterialValueMediaStreamDynamic`
Inherits: `DMMaterialValueTextureDynamic` | Header: `DMMaterialValueMediaStreamDynamic.h`

Link to a UDMMaterialValueMediaStream for Material Designer Model Dynamics.

**Methods** (1):
  - `get_media_stream()` -> `MediaStream` — Get Media Stream

**Properties** (1):
  - `media_stream`: `MediaStream` [Read-Only] — [Read-Only] (MediaStream)
