# UE Python API — SVGImporter Module

**21 types** from the `SVGImporter` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `SVGBakeElement`, `SVGPathPolygon`, `SVGShapeParameters`, `JoinedSVGDynamicMeshComponent`, `SVGActor`, `SVGActorEditorComponent`, `SVGBakedActor`, `SVGBaseDynamicMeshComponent`, `SVGData`, `SVGDynamicMeshComponent`, `SVGDynamicMeshesContainerActor`, `SVGFillComponent`, `SVGJoinedShapesActor`, `SVGShapeActor`, `SVGShapesParentActor`, `SVGStrokeComponent`, `JoinedSVGMeshColoring`, `PolygonOffsetJoinType`, `SVGExtrudeType`, `SVGRenderMode`, ... (21 total)

---

## Classes

### `unreal.SVGBakeElement`
Inherits: `StructBase` | Header: `SVGBakedActor.h`

SVGBake Element

### `unreal.SVGPathPolygon`
Inherits: `StructBase` | Header: `SVGTypes.h`

SVGPath Polygon

### `unreal.SVGShapeParameters`
Inherits: `StructBase` | Header: `JoinedSVGDynamicMeshComponent.h`

SVGShape Parameters

### `unreal.JoinedSVGDynamicMeshComponent`
Inherits: `SVGBaseDynamicMeshComponent` | Header: `JoinedSVGDynamicMeshComponent.h`

Joined SVGDynamic Mesh Component

### `unreal.SVGActor`
Inherits: `SVGDynamicMeshesContainerActor` | Header: `SVGActor.h`

**Properties** (13):
  - `bevel_distance`: `float` — [Read-Write] (float)
  - `extrude_type`: `SVGExtrudeType` — [Read-Write] (SVGExtrudeType)
  - `fills_extrude`: `float` — [Read-Write] (float)
  - `ignore_strokes`: `bool` — [Read-Write] SVG strokes geometry will not be generated, even when available in SVG Data asset. (boo...
  - `render_mode`: `SVGRenderMode` — [Read-Write] (SVGRenderMode)
  - `scale`: `float` — [Read-Write] Scale each SVG shape (float)
  - `shapes_offset`: `float` — [Read-Write] Applies an offset to all SVG shapes along the X axis. Offset increases with each shapes...
  - `smooth_fill_shapes`: `bool` — [Read-Write] Applies an offset to all SVG fill shapes edges, resulting in smoother geometry. (bool)
  - `smoothing_offset`: `float` — [Read-Write] (float)
  - `stroke_join_style`: `PolygonOffsetJoinType` — [Read-Write] (PolygonOffsetJoinType)
  - `strokes_extrude`: `float` — [Read-Write] (float)
  - `strokes_width`: `float` — [Read-Write] (float)
  - `svg_data`: `SVGData` — [Read-Write] (SVGData)

### `unreal.SVGActorEditorComponent`
Inherits: `SceneComponent` | Header: `SVGActorEditorComponent.h`

SVGActor Editor Component

### `unreal.SVGBakedActor`
Inherits: `Actor` | Header: `SVGBakedActor.h`

SVGBaked Actor

### `unreal.SVGBaseDynamicMeshComponent`
Inherits: `DynamicMeshComponent` | Header: `SVGBaseDynamicMeshComponent.h`

SVGBase Dynamic Mesh Component

### `unreal.SVGData`
Inherits: `Object` | Header: `SVGData.h`

### `unreal.SVGDynamicMeshComponent`
Inherits: `SVGBaseDynamicMeshComponent` | Header: `SVGDynamicMeshComponent.h`

SVGDynamic Mesh Component

**Methods** (1):
  - `set_color(color)` -> `None` — Set Color

**Properties** (2):
  - `color`: `Color` — [Read-Write] (Color)
  - `extrude`: `float` — [Read-Write] (float)

### `unreal.SVGDynamicMeshesContainerActor`
Inherits: `Actor` | Header: `SVGDynamicMeshesContainerActor.h`

SVGDynamic Meshes Container Actor

### `unreal.SVGFillComponent`
Inherits: `SVGDynamicMeshComponent` | Header: `SVGFillComponent.h`

SVGFill Component

### `unreal.SVGJoinedShapesActor`
Inherits: `SVGDynamicMeshesContainerActor` | Header: `SVGJoinedShapesActor.h`

SVGJoined Shapes Actor

**Properties** (1):
  - `joint_dynamic_mesh_component`: `JoinedSVGDynamicMeshComponent` [Read-Only] — [Read-Only] (JoinedSVGDynamicMeshComponent)

### `unreal.SVGShapeActor`
Inherits: `SVGDynamicMeshesContainerActor` | Header: `SVGShapeActor.h`

Upon splitting SVG Actors, multiple shape actors will be created. Each will have their own SVG Shape.

**Properties** (1):
  - `svg_shape`: `SVGDynamicMeshComponent` [Read-Only] — [Read-Only] (SVGDynamicMeshComponent)

### `unreal.SVGShapesParentActor`
Inherits: `SVGDynamicMeshesContainerActor` | Header: `SVGShapesParentActor.h`

This actor is used as a parent to organize SVG Shape Actors

### `unreal.SVGStrokeComponent`
Inherits: `SVGDynamicMeshComponent` | Header: `SVGStrokeComponent.h`

SVGStroke Component

### `unreal.JoinedSVGMeshColoring`
Inherits: `EnumBase` | Header: `JoinedSVGDynamicMeshComponent.h`

EJoined SVGMesh Coloring

**Properties** (2):
  - `SEPARATE_COLORS`: `JoinedSVGMeshColoring = Ellipsis` — 0
  - `SINGLE_COLOR`: `JoinedSVGMeshColoring = Ellipsis` — 1

### `unreal.PolygonOffsetJoinType`
Inherits: `EnumBase` | Header: `SVGDynamicMeshComponent.h`

note:: the below two enums should match the native ones exactly, so they can be cast directly

**Properties** (3):
  - `MITER`: `PolygonOffsetJoinType = Ellipsis` — Arcs on all convex edge joins. 2
  - `ROUND`: `PolygonOffsetJoinType = Ellipsis` — Uniform squaring on all convex edge joins. 1
  - `SQUARE`: `PolygonOffsetJoinType = Ellipsis` — 0

### `unreal.SVGExtrudeType`
Inherits: `EnumBase` | Header: `SVGDynamicMeshComponent.h`

ESVGExtrude Type

**Properties** (3):
  - `FRONT_BACK_MIRROR`: `SVGExtrudeType = Ellipsis` — 2
  - `FRONT_FACE_ONLY`: `SVGExtrudeType = Ellipsis` — 1
  - `NONE`: `SVGExtrudeType = Ellipsis` — 0

### `unreal.SVGRenderMode`
Inherits: `EnumBase` | Header: `SVGActor.h`

ESVGRender Mode

**Properties** (2):
  - `DYNAMIC_MESH3D`: `SVGRenderMode = Ellipsis` — 0
  - `TEXTURE2D`: `SVGRenderMode = Ellipsis` — 1

### `unreal.SVGSplineConversionQuality`
Inherits: `EnumBase` | Header: `SVGData.h`

Can be used to set the desired fidelity when converting SVG Splines into Polylines

**Properties** (6):
  - `HIGH`: `SVGSplineConversionQuality = Ellipsis` — 5
  - `INCREASED`: `SVGSplineConversionQuality = Ellipsis` — 4
  - `LOW`: `SVGSplineConversionQuality = Ellipsis` — 2
  - `NORMAL`: `SVGSplineConversionQuality = Ellipsis` — 3
  - `VERY_HIGH`: `SVGSplineConversionQuality = Ellipsis` — 6
  - `VERY_LOW`: `SVGSplineConversionQuality = Ellipsis` — 1
