# UE Python API — GeometryMask Module

**12 types** from the `GeometryMask` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `GeometryMaskReadParameters`, `GeometryMaskWriteParameters`, `GeometryMaskCanvas`, `GeometryMaskCanvasActor`, `GeometryMaskCanvasReferenceComponentBase`, `GeometryMaskCanvasResource`, `GeometryMaskReadComponent`, `GeometryMaskSubsystem`, `GeometryMaskWriteMeshComponent`, `GeometryMaskColorChannel`, `GeometryMaskCompositeOperation`, `OnGeometryMaskSetCanvasDelegate`

---

## Classes

### `unreal.GeometryMaskReadParameters`
Inherits: `StructBase` | Header: `GeometryMaskTypes.h`

Geometry Mask Read Parameters

**Properties** (1):
  - `canvas_name`: `Name` — [Read-Write] Specifies the GeometryMaskCanvas to read from. (Name)

### `unreal.GeometryMaskWriteParameters`
Inherits: `StructBase` | Header: `GeometryMaskTypes.h`

Geometry Mask Write Parameters

**Properties** (1):
  - `canvas_name`: `Name` — [Read-Write] Specifies the GeometryMaskCanvas to reference. (Name)

### `unreal.GeometryMaskCanvas`
Inherits: `Object` | Header: `GeometryMaskCanvas.h`

A uniquely identified Canvas.

**Methods** (2):
  - `get_color_channel()` -> `GeometryMaskColorChannel` — Get the color channel to write to in the texture.
  - `get_texture()` -> `CanvasRenderTarget2D` — Get the underlying render target.

**Properties** (6):
  - `apply_blur`: `bool` — [Read-Write] Optional Blur Toggle. (bool)
  - `apply_feather`: `bool` — [Read-Write] Optional Feather Toggle. (bool)
  - `blur_strength`: `float` — [Read-Write] Optional Blur Strength. (double)
  - `canvas_name`: `Name` [Read-Only] — [Read-Only] Uniquely identifies this canvas. (Name)
  - `inner_feather_radius`: `int` — [Read-Write] Optional Inner Feather Radius. (int32)
  - `outer_feather_radius`: `int` — [Read-Write] Optional Outer Feather Radius. (int32)

### `unreal.GeometryMaskCanvasActor`
Inherits: `Actor` | Header: `GeometryMaskCanvasActor.h`

Wraps a GeometryMaskCanvas, and discovers/registers writers.

**Methods** (1):
  - `get_texture()` -> `CanvasRenderTarget2D` — Returns the Canvas Texture.

**Properties** (1):
  - `canvas_name`: `Name` [Read-Only] — [Read-Only] Identifies the referenced Canvas. (Name)

### `unreal.GeometryMaskCanvasReferenceComponentBase`
Inherits: `ActorComponent` | Header: `GeometryMaskTypes.h`

Geometry Mask Canvas Reference Component Base

**Methods** (2):
  - `get_texture()` -> `CanvasRenderTarget2D` — Returns the Canvas Texture.
  - `receive_set_canvas(canvas)` -> `None` — Implement to perform an operation with the provided canvas.

### `unreal.GeometryMaskCanvasResource`
Inherits: `Object` | Header: `GeometryMaskCanvasResource.h`

Geometry Mask Canvas Resource

**Properties** (1):
  - `max_viewport_size`: `IntPoint` — [Read-Write] The default viewport size to use when it canât be resolved from the actual viewport. ...

### `unreal.GeometryMaskReadComponent`
Inherits: `GeometryMaskCanvasReferenceComponentBase` | Header: `GeometryMaskReadComponent.h`

Geometry Mask Read Component

**Properties** (1):
  - `parameters`: `GeometryMaskReadParameters` — [Read-Write] (GeometryMaskReadParameters)

### `unreal.GeometryMaskSubsystem`
Inherits: `EngineSubsystem` | Header: `GeometryMaskSubsystem.h`

Maintains the registered named canvases.

**Methods** (1):
  - `get_default_canvas()` -> `GeometryMaskCanvas` — Returns the default, blank canvas.

### `unreal.GeometryMaskWriteMeshComponent`
Inherits: `GeometryMaskCanvasReferenceComponentBase` | Header: `GeometryMaskWriteComponent.h`

Geometry Mask Write Mesh Component

**Properties** (2):
  - `parameters`: `GeometryMaskWriteParameters` — [Read-Write] (GeometryMaskWriteParameters)
  - `write_when_hidden`: `bool` — [Read-Write] Write to the mask even when this or itâs owner is hidden. (bool)

### `unreal.GeometryMaskColorChannel`
Inherits: `EnumBase` | Header: `GeometryMaskTypes.h`

EGeometry Mask Color Channel

**Properties** (6):
  - `ALPHA`: `GeometryMaskColorChannel = Ellipsis` — 4
  - `BLUE`: `GeometryMaskColorChannel = Ellipsis` — 2
  - `GREEN`: `GeometryMaskColorChannel = Ellipsis` — 1
  - `NONE`: `GeometryMaskColorChannel = Ellipsis` — 8
  - `NUM`: `GeometryMaskColorChannel = Ellipsis` — 9
  - `RED`: `GeometryMaskColorChannel = Ellipsis` — 0

### `unreal.GeometryMaskCompositeOperation`
Inherits: `EnumBase` | Header: `GeometryMaskTypes.h`

EGeometry Mask Composite Operation

**Properties** (4):
  - `ADD`: `GeometryMaskCompositeOperation = Ellipsis` — 0
  - `INTERSECT`: `GeometryMaskCompositeOperation = Ellipsis` — 2
  - `NUM`: `GeometryMaskCompositeOperation = Ellipsis` — 3
  - `SUBTRACT`: `GeometryMaskCompositeOperation = Ellipsis` — 1

### `unreal.OnGeometryMaskSetCanvasDelegate`
Inherits: `MulticastDelegateBase` | Header: `GeometryMaskTypes.h`

On Geometry Mask Set Canvas Delegate Delegate Signature
