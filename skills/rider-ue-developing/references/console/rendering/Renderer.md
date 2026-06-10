# UE Python API — Renderer Module

**4 types** from the `Renderer` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MaterialCacheVirtualTexture`, `SparseVolumeTextureViewer`, `SparseVolumeTextureViewerComponent`, `SparseVolumeTexturePreviewAttribute`

---

## Classes

### `unreal.MaterialCacheVirtualTexture`
Inherits: `Texture` | Header: `MaterialCacheVirtualTexture.h`

Material Cache Virtual Texture

### `unreal.SparseVolumeTextureViewer`
Inherits: `Info` | Header: `SparseVolumeTextureViewerComponent.h`

A placeable actor that represents a participating media material around a planet, e.g. clouds.

**Properties** (1):
  - `sparse_volume_texture_viewer_component`: `SparseVolumeTextureViewerComponent` [Read-Only] — [Read-Only] (SparseVolumeTextureViewerComponent)

### `unreal.SparseVolumeTextureViewerComponent`
Inherits: `PrimitiveComponent` | Header: `SparseVolumeTextureViewerComponent.h`

A component used to inspect sparse volume textures.

**Properties** (13):
  - `apply_per_frame_transforms`: `bool` [Read-Only] — [Read-Only] (bool)
  - `blocking_streaming_requests`: `bool` [Read-Only] — [Read-Only] (bool)
  - `extinction`: `float` — [Read-Write] (float)
  - `frame`: `float` — [Read-Write] (float)
  - `frame_rate`: `float` — [Read-Write] (float)
  - `looping`: `bool` — [Read-Write] (bool)
  - `mip_level`: `int` — [Read-Write] (int32)
  - `pivot_at_centroid`: `bool` [Read-Only] — [Read-Only] (bool)
  - `playing`: `bool` — [Read-Write] (bool)
  - `preview_attribute`: `SparseVolumeTexturePreviewAttribute` — [Read-Write] (SparseVolumeTexturePreviewAttribute)
  - `reverse_playback`: `bool` [Read-Only] — [Read-Only] (bool)
  - `sparse_volume_texture_preview`: `SparseVolumeTexture` — [Read-Write] (SparseVolumeTexture)
  - `voxel_size`: `float` — [Read-Write] (float)

### `unreal.SparseVolumeTexturePreviewAttribute`
Inherits: `EnumBase` | Header: `SparseVolumeTextureViewerComponent.h`

ESparse Volume Texture Preview Attribute

**Properties** (8):
  - `ESVTPA_ATTRIBUTES_A_A`: `SparseVolumeTexturePreviewAttribute = Ellipsis` — 3
  - `ESVTPA_ATTRIBUTES_A_B`: `SparseVolumeTexturePreviewAttribute = Ellipsis` — 2
  - `ESVTPA_ATTRIBUTES_A_G`: `SparseVolumeTexturePreviewAttribute = Ellipsis` — 1
  - `ESVTPA_ATTRIBUTES_A_R`: `SparseVolumeTexturePreviewAttribute = Ellipsis` — 0
  - `ESVTPA_ATTRIBUTES_B_A`: `SparseVolumeTexturePreviewAttribute = Ellipsis` — 7
  - `ESVTPA_ATTRIBUTES_B_B`: `SparseVolumeTexturePreviewAttribute = Ellipsis` — 6
  - `ESVTPA_ATTRIBUTES_B_G`: `SparseVolumeTexturePreviewAttribute = Ellipsis` — 5
  - `ESVTPA_ATTRIBUTES_B_R`: `SparseVolumeTexturePreviewAttribute = Ellipsis` — 4
