# UE Python API — SlateRHIRenderer Module

**5 types** from the `SlateRHIRenderer` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `SlatePostSettings`, `SlateFXSubsystem`, `SlatePostBufferBlur`, `SlateRHIPostBufferProcessor`, `SlateRHIRendererSettings`

---

## Classes

### `unreal.SlatePostSettings`
Inherits: `StructBase` | Header: `SlateRHIRendererSettings.h`

Settings for a particular Slate Post RT. Notably if enabled & blur by default. To be updated with additional effects & to be expandable in game code / settings.

**Properties** (2):
  - `enabled`: `bool` — [Read-Write] Should this post buffer be enabled for updating (bool)
  - `post_processor_class`: `Class` — [Read-Write] Copy of actually loaded post processor class (type(Class))

### `unreal.SlateFXSubsystem`
Inherits: `EngineSubsystem` | Header: `SlateFXSubsystem.h`

Slate FXSubsystem

**Methods** (1):
  - `get_slate_post_processor(post_buffer_bit)` -> `SlateRHIPostBufferProcessor` — Get post processor for a particular post buffer index, if it exists

### `unreal.SlatePostBufferBlur`
Inherits: `SlateRHIPostBufferProcessor` | Header: `SlatePostBufferBlur.h`

Slate Post Buffer Processor that performs a simple gaussian blur to the backbuffer

**Properties** (1):
  - `gaussian_blur_strength`: `float` — [Read-Write] (float)

### `unreal.SlateRHIPostBufferProcessor`
Inherits: `Object` | Header: `SlateRHIPostBufferProcessor.h`

Base class for types that can process the backbuffer scene into the slate post buffer.

### `unreal.SlateRHIRendererSettings`
Inherits: `DeveloperSettings` | Header: `SlateRHIRendererSettings.h`

Settings used to control slate rendering

**Methods** (2):
  - `get_mutable_slate_post_setting(post_buffer_bit)` -> `SlatePostSettings` — Get settings struct for a particular post buffer index
  - `get_slate_post_setting(post_buffer_bit)` -> `SlatePostSettings` — Get settings struct for a particular post buffer index
