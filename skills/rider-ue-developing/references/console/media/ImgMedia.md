# UE Python API — ImgMedia Module

**4 types** from the `ImgMedia` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ImgMediaSourceCustomizationSequenceProxy`, `MediaSourceColorSettings`, `ImgMediaSource`, `MediaSourceEncoding`

---

## Classes

### `unreal.ImgMediaSourceCustomizationSequenceProxy`
Inherits: `StructBase` | Header: `ImgMediaSource.h`

This provides customized editing of SequencePath.

### `unreal.MediaSourceColorSettings`
Inherits: `StructBase` | Header: `ImgMediaSourceColorSettings.h`

Manual definition of media source color space & encoding.

**Properties** (7):
  - `blue_chromaticity_coordinate`: `Vector2D` — [Read-Write] Blue chromaticity coordinate of the source color space. (Vector2D)
  - `chromatic_adaptation_method`: `TextureChromaticAdaptationMethod` — [Read-Write] Chromatic adaption method applied if the source white point differs from the working co...
  - `color_space_override`: `TextureColorSpace` — [Read-Write] Source color space of the media. (TextureColorSpace)
  - `encoding_override`: `MediaSourceEncoding` — [Read-Write] Source encoding of the media. (MediaSourceEncoding)
  - `green_chromaticity_coordinate`: `Vector2D` — [Read-Write] Green chromaticity coordinate of the source color space. (Vector2D)
  - `red_chromaticity_coordinate`: `Vector2D` — [Read-Write] Red chromaticity coordinate of the source color space. (Vector2D)
  - `white_chromaticity_coordinate`: `Vector2D` — [Read-Write] White chromaticity coordinate of the source color space. (Vector2D)

### `unreal.ImgMediaSource`
Inherits: `BaseMediaSource` | Header: `ImgMediaSource.h`

Media source for EXR image sequences.

**Methods** (6):
  - `add_target_object(actor)` -> `None` — This object is using our img sequence.
  - `get_proxies()` -> `Array [ str ]` — Get the names of available proxy directories. see: GetSequencePath
  - `get_sequence_path()` -> `str` — Get the path to the image sequence directory to be played. Supported tokens will be expanded. see: SetSequencePath
  - `remove_target_object(actor)` -> `None` — This object is no longer using our img sequence.
  - `set_sequence_path(path)` -> `None` — Set the path to the image sequence directory this source represents. see: GetSequencePath
  - `set_tokenized_sequence_path(path)` -> `None` — Set the path to the image sequence directory this source represents. see: GetSequencePath

**Properties** (6):
  - `fill_gaps_in_sequence`: `bool` — [Read-Write] If true, then any gaps in the sequence will be filled with blank frames. (bool)
  - `frame_rate_override`: `FrameRate` — [Read-Write] Overrides the default frame rate stored in the image files (0/0 = do not override). (Fr...
  - `proxy_override`: `str` — [Read-Write] Name of the proxy directory to use. (str)
  - `sequence_path`: `DirectoryPath` [Read-Only] — [Read-Only] The directory that contains the image sequence files. Relative paths will be with respec...
  - `source_color_settings`: `MediaSourceColorSettings` [Read-Only] — [Read-Only] Manual definition of media source color space & encoding. (MediaSourceColorSettings)
  - `start_timecode`: `Timecode` [Read-Only] — [Read-Only] Specification of a timecode associated with the start of the sequence. (Timecode)

### `unreal.MediaSourceEncoding`
Inherits: `EnumBase` | Header: `ImgMediaSourceColorSettings.h`

List of source encodings that can be converted to linear. (Integer values match the ETextureSourceEncoding values in TextureDefines.h

**Properties** (5):
  - `MSE_LINEAR`: `MediaSourceEncoding = Ellipsis` — The source encoding is considered linear. 1
  - `MSE_NONE`: `MediaSourceEncoding = Ellipsis` — The source encoding is not overridden. 0
  - `MSE_ST2084`: `MediaSourceEncoding = Ellipsis` — SMPTE ST 2084/PQ source encoding to be linearized 3
  - `MSE_S_LOG3`: `MediaSourceEncoding = Ellipsis` — Sony SLog3 source encoding to be linearized 12
  - `MSE_S_RGB`: `MediaSourceEncoding = Ellipsis` — sRGB source encoding to be linearized 2
