# UE Python API — ZoneGraph Module

**18 types** from the `ZoneGraph` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ZoneGraphDataHandle`, `ZoneGraphTag`, `ZoneGraphTagFilter`, `ZoneGraphTagMask`, `ZoneLaneDesc`, `ZoneLaneProfileRef`, `ZoneShapePoint`, `ZoneGraphData`, `ZoneGraphRenderingComponent`, `ZoneShape`, `ZoneShapeComponent`, `FZoneShapePointType`, `FZoneShapeType`, `ZoneGraphLaneRoutingCountRule`, `ZoneLaneDirection`, `ZoneLaneTagMaskComparison`, `ZoneShapeLaneConnectionRestrictions`, `ZoneShapePolygonRoutingType`

---

## Classes

### `unreal.ZoneGraphDataHandle`
Inherits: `StructBase` | Header: `ZoneGraphTypes.h`

Zone Graph Data Handle

### `unreal.ZoneGraphTag`
Inherits: `StructBase` | Header: `ZoneGraphTypes.h`

Zone Graph Tag

**Properties** (1):
  - `bit`: `int` — [Read-Write] (uint8)

### `unreal.ZoneGraphTagFilter`
Inherits: `StructBase` | Header: `ZoneGraphTypes.h`

Filter passes if any of the âAnyTagsâ, and all of the âAllTagsâ, and none of the âNotTagsâ are present. Setting include or exclude tags to None, will skip that particular check.

### `unreal.ZoneGraphTagMask`
Inherits: `StructBase` | Header: `ZoneGraphTypes.h`

Zone Graph Tag Mask

### `unreal.ZoneLaneDesc`
Inherits: `StructBase` | Header: `ZoneGraphTypes.h`

Describes single lane.

**Properties** (3):
  - `direction`: `ZoneLaneDirection` [Read-Only] — [Read-Only] Direction of the lane (ZoneLaneDirection)
  - `tags`: `ZoneGraphTagMask` [Read-Only] — [Read-Only] Lane tags (ZoneGraphTagMask)
  - `width`: `float` [Read-Only] — [Read-Only] Width of the lane (float)

### `unreal.ZoneLaneProfileRef`
Inherits: `StructBase` | Header: `ZoneGraphTypes.h`

Reference to a lane profile.

**Properties** (2):
  - `id`: `Guid` — [Read-Write] (Guid)
  - `name`: `Name` — [Read-Write] (Name)

### `unreal.ZoneShapePoint`
Inherits: `StructBase` | Header: `ZoneGraphTypes.h`

Zone Shape Point

**Properties** (9):
  - `inner_turn_radius`: `float` — [Read-Write] Inner turn radius associated with this point. Used when polygon shape routing is set to...
  - `lane_connection_restrictions`: `int` — [Read-Write] Lane connection restrictions (int32)
  - `lane_profile`: `int` — [Read-Write] Index to external array referring to Lane Profile, or FZoneShapePoint::InheritLaneProfi...
  - `lane_template`: `int` — âlane_templateâ was renamed to âlane_profileâ. deprecated
  - `position`: `Vector` — [Read-Write] Position of the point (Vector)
  - `reverse_lane_profile`: `bool` — [Read-Write] True of lane profile should be reversed. (bool)
  - `rotation`: `Rotator` — [Read-Write] Rotation of the point. Forward direction of the rotation matches the tangents.
For Lane...
  - `tangent_length`: `float` — [Read-Write] Length of the Bezier point tangents, or cached half-width of the lane profile. (float)
  - `type`: `FZoneShapePointType` — [Read-Write] Type of the control point (FZoneShapePointType)

### `unreal.ZoneGraphData`
Inherits: `Actor` | Header: `ZoneGraphData.h`

Zone Graph Data

### `unreal.ZoneGraphRenderingComponent`
Inherits: `PrimitiveComponent` | Header: `ZoneGraphRenderingComponent.h`

Zone Graph Rendering Component

### `unreal.ZoneShape`
Inherits: `Actor` | Header: `ZoneShapeActor.h`

Zone Shape actor for standalone zone markup.

**Properties** (1):
  - `shape_component`: `ZoneShapeComponent` [Read-Only] — [Read-Only] (ZoneShapeComponent)

### `unreal.ZoneShapeComponent`
Inherits: `PrimitiveComponent` | Header: `ZoneShapeComponent.h`

Zone Shape Component

**Methods** (7):
  - `get_shape_type()` -> `FZoneShapeType`
  - `get_tags()` -> `ZoneGraphTagMask`
  - `is_lane_profile_reversed()` -> `bool`
  - `set_polygon_routing_type(new_type)` -> `None` — Sets the polygon routing type.
  - `set_reverse_lane_profile(reverse)` -> `bool` — Set whether common lane profile should be reversed.
  - `set_shape_type(type)` -> `None` — Sets shape type.
  - `set_tags(new_tags)` -> `None` — Sets shape tags.

**Properties** (7):
  - `lane_profile`: `ZoneLaneProfileRef` — [Read-Write] Common lane template for whole shape (ZoneLaneProfileRef)
  - `lane_template`: `ZoneLaneProfileRef` — âlane_templateâ was renamed to âlane_profileâ. deprecated
  - `points`: `None` — [Read-Write] Shape points (Array[ZoneShapePoint])
  - `polygon_routing_type`: `ZoneShapePolygonRoutingType` — [Read-Write] Polygon shape routing type (ZoneShapePolygonRoutingType)
  - `reverse_lane_profile`: `bool` — [Read-Write] True if lane profile should be reversed (bool)
  - `shape_type`: `FZoneShapeType` — [Read-Write] Shape type, spline or polygon (FZoneShapeType)
  - `tags`: `ZoneGraphTagMask` — [Read-Write] Zone tags, the lanes inherit zone tags. (ZoneGraphTagMask)

### `unreal.FZoneShapePointType`
Inherits: `EnumBase` | Header: `ZoneGraphTypes.h`

FZone Shape Point Type

**Properties** (4):
  - `AUTO_BEZIER`: `FZoneShapePointType = Ellipsis` — Round corner, defined by manual bezier handles 2
  - `BEZIER`: `FZoneShapePointType = Ellipsis` — Sharp corner 1
  - `LANE_PROFILE`: `FZoneShapePointType = Ellipsis` — Round corner, defined by automatic bezier handles 3
  - `SHARP`: `FZoneShapePointType = Ellipsis` — 0

### `unreal.FZoneShapeType`
Inherits: `EnumBase` | Header: `ZoneGraphTypes.h`

FZone Shape Type

**Properties** (2):
  - `POLYGON`: `FZoneShapeType = Ellipsis` — Bezier spline shape 1
  - `SPLINE`: `FZoneShapeType = Ellipsis` — 0

### `unreal.ZoneGraphLaneRoutingCountRule`
Inherits: `EnumBase` | Header: `ZoneGraphTypes.h`

EZone Graph Lane Routing Count Rule

**Properties** (3):
  - `ANY`: `ZoneGraphLaneRoutingCountRule = Ellipsis` — 0
  - `MANY`: `ZoneGraphLaneRoutingCountRule = Ellipsis` — Just one entry 2
  - `ONE`: `ZoneGraphLaneRoutingCountRule = Ellipsis` — Any number of entries 1

### `unreal.ZoneLaneDirection`
Inherits: `EnumBase` | Header: `ZoneGraphTypes.h`

EZone Lane Direction

**Properties** (3):
  - `BACKWARD`: `ZoneLaneDirection = Ellipsis` — Move forward relative to the markup. 2
  - `FORWARD`: `ZoneLaneDirection = Ellipsis` — No movement, this lane is treated as spacer or median. 1
  - `NONE`: `ZoneLaneDirection = Ellipsis` — 0

### `unreal.ZoneLaneTagMaskComparison`
Inherits: `EnumBase` | Header: `ZoneGraphTypes.h`

EZone Lane Tag Mask Comparison

**Properties** (3):
  - `ALL`: `ZoneLaneTagMaskComparison = Ellipsis` — Does masks share ANY tags. 1
  - `ANY`: `ZoneLaneTagMaskComparison = Ellipsis` — 0
  - `NOT`: `ZoneLaneTagMaskComparison = Ellipsis` — Does masks share ALL tags. 2

### `unreal.ZoneShapeLaneConnectionRestrictions`
Inherits: `EnumBase` | Header: `ZoneGraphTypes.h`

EZone Shape Lane Connection Restrictions

**Properties** (4):
  - `MERGE_LANES_TO_ONE_DESTINATION_LANE`: `ZoneShapeLaneConnectionRestrictions = Ellipsis` — Connect to only one nearest lane per destination. 8
  - `NO_LEFT_TURN`: `ZoneShapeLaneConnectionRestrictions = Ellipsis` — 1
  - `NO_RIGHT_TURN`: `ZoneShapeLaneConnectionRestrictions = Ellipsis` — No left turning destinations allowed. 2
  - `ONE_LANE_PER_DESTINATION`: `ZoneShapeLaneConnectionRestrictions = Ellipsis` — No right turning destinations allowed. 4

### `unreal.ZoneShapePolygonRoutingType`
Inherits: `EnumBase` | Header: `ZoneGraphTypes.h`

EZone Shape Polygon Routing Type

**Properties** (2):
  - `ARCS`: `ZoneShapePolygonRoutingType = Ellipsis` — Use bezier curves for routing. 1
  - `BEZIER`: `ZoneShapePolygonRoutingType = Ellipsis` — 0
