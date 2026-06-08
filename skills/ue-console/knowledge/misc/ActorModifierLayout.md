# UE Python API — ActorModifierLayout Module

**16 types** from the `ActorModifierLayout` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ActorModifierAlignBetweenWeightedActor`, `ActorModifierAlignBetweenModifier`, `ActorModifierAutoFollowModifier`, `ActorModifierGridArrangeModifier`, `ActorModifierJustifyModifier`, `ActorModifierLookAtModifier`, `ActorModifierRadialArrangeModifier`, `ActorModifierSplinePathModifier`, `ActorModifierGridArrangeCorner2D`, `ActorModifierGridArrangeDirection`, `ActorModifierJustifyDepth`, `ActorModifierJustifyHorizontal`, `ActorModifierJustifyVertical`, `ActorModifierLayoutSplinePathSampleMode`, `ActorModifierRadialArrangeMode`, `ActorModifierRadialArrangePlane`

---

## Classes

### `unreal.ActorModifierAlignBetweenWeightedActor`
Inherits: `StructBase` | Header: `ActorModifierAlignBetweenModifier.h`

Represents an actor with a weight and an enabled state.

**Properties** (3):
  - `actor_weak`: `Actor` — [Read-Write] An actor that will effect the placement location. (Actor)
  - `enabled`: `bool` — [Read-Write] If true, will consider this weighted actor when calculating the placement location. (bo...
  - `weight`: `float` — [Read-Write] How much effect this actor has on the placement location. (float)

### `unreal.ActorModifierAlignBetweenModifier`
Inherits: `ActorModifierCoreBase` | Header: `ActorModifierAlignBetweenModifier.h`

Moves the modifying actor to the averaged location between an array of specified actors.

**Methods** (5):
  - `add_reference_actor(reference_actor)` -> `bool` — Adds an actor to the reference list.
  - `find_reference_actor(actor)` -> `ActorModifierAlignBetweenWeightedActor or None` — Finds an actor in the reference list.
  - `get_reference_actors()` -> `Set [ ActorModifierAlignBetweenWeightedActor ]` — Gets all reference actors and their weights.
  - `remove_reference_actor(actor)` -> `bool` — Removes an actor from the reference list.
  - `set_reference_actors(reference_actors)` -> `None` — Sets all reference actors and their weights.

### `unreal.ActorModifierAutoFollowModifier`
Inherits: `ActorModifierAttachmentBaseModifier` | Header: `ActorModifierAutoFollowModifier.h`

Moves the modifying actor along with a specified actor relative to the specified actorâs bounds.

**Methods** (16):
  - `get_default_distance()` -> `Vector` — Gets the distance from this actor to the followed actor.
  - `get_followed_alignment()` -> `ActorModifierAnchorAlignment` — Gets the alignment for the followed actorâs center.
  - `get_followed_axis()` -> `int32` — Get Followed Axis
  - `get_local_alignment()` -> `ActorModifierAnchorAlignment` — Gets the alignment for this actorâs center.
  - `get_max_distance()` -> `Vector` — Gets the maximum distance from this actor to the followed actor.
  - `get_offset_axis()` -> `Vector` — Gets the axis direction to offset this actor from the followed actorâs bounds.
  - `get_progress()` -> `Vector` — Gets the percent % progress from the maximum distance to the default distance.
  - `get_reference_actor()` -> `ActorModifierSceneTreeActor` — Get Reference Actor
  - `set_default_distance(default_distance)` -> `None` — Sets the distance from this actor to the followed actor.
  - `set_followed_alignment(followed_alignment)` -> `None` — Sets the alignment for the followed actorâs center.
  - `set_followed_axis(followed_axis)` -> `None` — Set Followed Axis
  - `set_local_alignment(local_alignment)` -> `None` — Sets the alignment for this actorâs center.
  - `set_max_distance(max_distance)` -> `None` — Sets the maximum distance from this actor to the followed actor.
  - `set_offset_axis(offset_axis)` -> `None` — Sets the axis direction to offset this actor from the followed actorâs bounds.
  - `set_progress(progress)` -> `None` — Sets the percent % progress from the maximum distance to the default distance.
  - `set_reference_actor(reference_actor)` -> `None` — Set Reference Actor

**Properties** (7):
  - `default_distance`: `Vector` — [Read-Write] The distance from this actor to the followed actor. (Vector)
  - `ignore_hidden_actors`: `bool` — [Read-Write] If true, will search for the next visible actor based on the selected reference contain...
  - `max_distance`: `Vector` — [Read-Write] The maximum distance from this actor to the followed actor. (Vector)
  - `offset_axis`: `Vector` — [Read-Write] Based on followed axis, the direction to offset this actor from the followed actorâs ...
  - `progress`: `Vector` — [Read-Write] Percent % progress from the maximum distance to the default distance. (Vector)
  - `reference_actor_weak`: `Actor` — [Read-Write] The actor being followed by the modifier. This is user selectable if the Reference Cont...
  - `reference_container`: `ActorModifierReferenceContainer` — [Read-Write] The method for finding a reference actor based on itâs position in the parentâs hie...

### `unreal.ActorModifierGridArrangeModifier`
Inherits: `ActorModifierArrangeBaseModifier` | Header: `ActorModifierGridArrangeModifier.h`

Arranges child actors in a 2D grid format.

**Methods** (8):
  - `get_count()` -> `IntPoint` — Returns the width and height of the grid.
  - `get_spread()` -> `Vector2D` — Returns the distance between each horizontal and vertical child.
  - `get_start_corner()` -> `ActorModifierGridArrangeCorner2D` — Get Start Corner
  - `get_start_direction()` -> `ActorModifierGridArrangeDirection` — Get Start Direction
  - `set_count(count)` -> `None` — Sets the width and height of the grid.
  - `set_spread(spread)` -> `None` — Sets the distance between each horizontal and vertical child.
  - `set_start_corner(corner)` -> `None` — Set Start Corner
  - `set_start_direction(direction)` -> `None` — Set Start Direction

**Properties** (1):
  - `spread`: `Vector2D` — [Read-Write] The distance between each horizontal and vertical child. (Vector2D)

### `unreal.ActorModifierJustifyModifier`
Inherits: `ActorModifierArrangeBaseModifier` | Header: `ActorModifierJustifyModifier.h`

Justify Modifier

**Methods** (12):
  - `get_depth_alignment()` -> `ActorModifierJustifyDepth` — Get Depth Alignment
  - `get_depth_anchor()` -> `float` — Get Depth Anchor
  - `get_horizontal_alignment()` -> `ActorModifierJustifyHorizontal` — Get Horizontal Alignment
  - `get_horizontal_anchor()` -> `float` — Get Horizontal Anchor
  - `get_vertical_alignment()` -> `ActorModifierJustifyVertical` — Get Vertical Alignment
  - `get_vertical_anchor()` -> `float` — Get Vertical Anchor
  - `set_depth_alignment(depth_alignment)` -> `None` — Set Depth Alignment
  - `set_depth_anchor(depth_anchor)` -> `None` — Set Depth Anchor
  - `set_horizontal_alignment(horizontal_alignment)` -> `None` — Set Horizontal Alignment
  - `set_horizontal_anchor(horizontal_anchor)` -> `None` — Set Horizontal Anchor
  - `set_vertical_alignment(vertical_alignment)` -> `None` — Set Vertical Alignment
  - `set_vertical_anchor(vertical_anchor)` -> `None` — Set Vertical Anchor

**Properties** (3):
  - `depth_anchor`: `float` — [Read-Write] (float)
  - `horizontal_anchor`: `float` — [Read-Write] (float)
  - `vertical_anchor`: `float` — [Read-Write] (float)

### `unreal.ActorModifierLookAtModifier`
Inherits: `ActorModifierAttachmentBaseModifier` | Header: `ActorModifierLookAtModifier.h`

Rotates the modifying actor to point itâs specified axis at another actor.

**Methods** (6):
  - `get_flip_axis()` -> `bool` — Returns true if flipping the look-at rotation axis.
  - `get_orientation_axis()` -> `ActorModifierAxis` — Returns the axis that will point towards the reference actor.
  - `get_reference_actor()` -> `ActorModifierSceneTreeActor` — Get Reference Actor
  - `set_flip_axis(flip_axis)` -> `None` — Sets the look-at direction to be flipped.
  - `set_orientation_axis(axis)` -> `None` — Sets the axis that will point towards the reference actor.
  - `set_reference_actor(reference_actor)` -> `None` — Set Reference Actor

**Properties** (2):
  - `axis`: `ActorModifierAlignment` — [Read-Write]
deprecated: Use OrientationAxis instead (ActorModifierAlignment)
  - `reference_actor_weak`: `Actor` — [Read-Write] The actor to look at.
deprecated: Use ReferenceActor instead (Actor)

### `unreal.ActorModifierRadialArrangeModifier`
Inherits: `ActorModifierArrangeBaseModifier` | Header: `ActorModifierRadialArrangeModifier.h`

Arranges child actors in a circular rings around its center

**Methods** (24):
  - `get_arrangement()` -> `ActorModifierRadialArrangeMode` — Defines how to arrange the child elements around the center.
  - `get_base_orientation()` -> `Rotator` — Gets the base rotation
  - `get_count()` -> `int32` — Gets the number of child elements to use in the arrangement. Children whose index is greater than or equal to this value...
  - `get_end_angle()` -> `float` — Gets the end angle for the arrangement space. 0 = Up, -90 = Left, 90 = Right
  - `get_flip_orient()` -> `bool` — If true, will flip the center orientation to face outwards.
  - `get_inner_radius()` -> `float` — Gets the radius from the center to the first inner ring.
  - `get_orient()` -> `bool` — If true, will orient the selected axis torwards the center.
  - `get_orientation_axis()` -> `ActorModifierAxis` — Gets the axis to look at the center.
  - `get_outer_radius()` -> `float` — Gets the radius from the center to the last outer ring.
  - `get_rings()` -> `int32` — Gets the number of rings.
  - `get_start_angle()` -> `float` — Gets the start angle for the arrangement space and moving clockwise. 0 = Up, -90 = Left, 90 = Right
  - `get_start_from_outer_radius()` -> `bool` — If true, will arrange the child elements starting from the outer radius and moving to the inner radius. Has no effect if...
  - `set_arrangement(arrangement)` -> `None` — Defines how to arrange the child elements around the center.
  - `set_base_orientation(rotation)` -> `None` — Sets the base rotation
  - `set_count(count)` -> `None` — Sets the number of child elements to use in the arrangement. Children whose index is greater than or equal to this value...
  - `set_end_angle(end_angle)` -> `None` — Sets the end angle for the arrangement space. 0 = Up, -90 = Left, 90 = Right
  - `set_flip_orient(flip_orient)` -> `None` — If true, will flip the center orientation to face outwards.
  - `set_inner_radius(inner_radius)` -> `None` — Sets the radius from the center to the first inner ring.
  - `set_orient(orient)` -> `None` — If true, will orient the selected axis torwards the center.
  - `set_orientation_axis(axis)` -> `None` — Sets the axis to look at the center.
  - `set_outer_radius(outer_radius)` -> `None` — Sets the radius from the center to the last outer ring.
  - `set_rings(rings)` -> `None` — Sets the number of rings.
  - `set_start_angle(start_angle)` -> `None` — Sets the start angle for the arrangement space and moving clockwise. 0 = Up, -90 = Left, 90 = Right
  - `set_start_from_outer_radius(start_from_outer_radius)` -> `None` — If true, will arrange the child elements starting from the outer radius and moving to the inner radius. Has no effect if...

**Properties** (5):
  - `end_angle`: `float` — [Read-Write] The end angle for the arrangement space. 0 = Up, -90 = Left, 90 = Right (float)
  - `inner_radius`: `float` — [Read-Write] The radius from the center to the first inner ring. (float)
  - `orient_axis`: `ActorModifierAlignment` — [Read-Write]
deprecated: Use OrientationAxis instead (ActorModifierAlignment)
  - `outer_radius`: `float` — [Read-Write] The radius from the center to the last outer ring. (float)
  - `start_angle`: `float` — [Read-Write] The start angle for the arrangement space and moving clockwise. 0 = Up, -90 = Left, 90 ...

### `unreal.ActorModifierSplinePathModifier`
Inherits: `ActorModifierCoreBase` | Header: `ActorModifierSplinePathModifier.h`

This modifier allows to sample a spline and update the actor transform based on the spline path

**Methods** (18):
  - `get_base_orientation()` -> `Rotator` — Get Base Orientation
  - `get_distance()` -> `float` — Get Distance
  - `get_orient()` -> `bool` — Get Orient
  - `get_point_index()` -> `int32` — Get Point Index
  - `get_progress()` -> `float` — Get Progress
  - `get_sample_mode()` -> `ActorModifierLayoutSplinePathSampleMode` — Get Sample Mode
  - `get_scale()` -> `bool` — Get Scale
  - `get_spline_actor()` -> `Actor` — Get Spline Actor
  - `get_time()` -> `float` — Get Time
  - `set_base_orientation(orientation)` -> `None` — Set Base Orientation
  - `set_distance(distance)` -> `None` — Set Distance
  - `set_orient(orient)` -> `None` — Set Orient
  - `set_point_index(index)` -> `None` — Set Point Index
  - `set_progress(progress)` -> `None` — Set Progress
  - `set_sample_mode(mode)` -> `None` — Set Sample Mode
  - `set_scale(scale)` -> `None` — Set Scale
  - `set_spline_actor(actor)` -> `None` — Set Spline Actor
  - `set_time(time)` -> `None` — Set Time

### `unreal.ActorModifierGridArrangeCorner2D`
Inherits: `EnumBase` | Header: `ActorModifierGridArrangeModifier.h`

Specifies a corner for a 2D rectangle.

**Properties** (4):
  - `BOTTOM_LEFT`: `ActorModifierGridArrangeCorner2D = Ellipsis` — 2
  - `BOTTOM_RIGHT`: `ActorModifierGridArrangeCorner2D = Ellipsis` — 3
  - `TOP_LEFT`: `ActorModifierGridArrangeCorner2D = Ellipsis` — 0
  - `TOP_RIGHT`: `ActorModifierGridArrangeCorner2D = Ellipsis` — 1

### `unreal.ActorModifierGridArrangeDirection`
Inherits: `EnumBase` | Header: `ActorModifierGridArrangeModifier.h`

Specifies a starting direction when laying out a grid arrangement.

**Properties** (2):
  - `HORIZONTAL`: `ActorModifierGridArrangeDirection = Ellipsis` — 0
  - `VERTICAL`: `ActorModifierGridArrangeDirection = Ellipsis` — 1

### `unreal.ActorModifierJustifyDepth`
Inherits: `EnumBase` | Header: `ActorModifierJustifyModifier.h`

EActor Modifier Justify Depth

**Properties** (4):
  - `BACK`: `ActorModifierJustifyDepth = Ellipsis` — 3
  - `CENTER`: `ActorModifierJustifyDepth = Ellipsis` — 2
  - `FRONT`: `ActorModifierJustifyDepth = Ellipsis` — 1
  - `NONE`: `ActorModifierJustifyDepth = Ellipsis` — 0

### `unreal.ActorModifierJustifyHorizontal`
Inherits: `EnumBase` | Header: `ActorModifierJustifyModifier.h`

EActor Modifier Justify Horizontal

**Properties** (4):
  - `CENTER`: `ActorModifierJustifyHorizontal = Ellipsis` — 2
  - `LEFT`: `ActorModifierJustifyHorizontal = Ellipsis` — 1
  - `NONE`: `ActorModifierJustifyHorizontal = Ellipsis` — 0
  - `RIGHT`: `ActorModifierJustifyHorizontal = Ellipsis` — 3

### `unreal.ActorModifierJustifyVertical`
Inherits: `EnumBase` | Header: `ActorModifierJustifyModifier.h`

EActor Modifier Justify Vertical

**Properties** (4):
  - `BOTTOM`: `ActorModifierJustifyVertical = Ellipsis` — 3
  - `CENTER`: `ActorModifierJustifyVertical = Ellipsis` — 2
  - `NONE`: `ActorModifierJustifyVertical = Ellipsis` — 0
  - `TOP`: `ActorModifierJustifyVertical = Ellipsis` — 1

### `unreal.ActorModifierLayoutSplinePathSampleMode`
Inherits: `EnumBase` | Header: `ActorModifierSplinePathModifier.h`

EActor Modifier Layout Spline Path Sample Mode

**Properties** (4):
  - `DISTANCE`: `ActorModifierLayoutSplinePathSampleMode = Ellipsis` — 1
  - `PERCENTAGE`: `ActorModifierLayoutSplinePathSampleMode = Ellipsis` — 0
  - `POINT`: `ActorModifierLayoutSplinePathSampleMode = Ellipsis` — 3
  - `TIME`: `ActorModifierLayoutSplinePathSampleMode = Ellipsis` — 2

### `unreal.ActorModifierRadialArrangeMode`
Inherits: `EnumBase` | Header: `ActorModifierRadialArrangeModifier.h`

Specifies how child elements will be arranged radially.

**Properties** (2):
  - `EQUAL`: `ActorModifierRadialArrangeMode = Ellipsis` — All elements in all radial rings have the same spacing between them.
The number of elements in the i...
  - `MONOSPACE`: `ActorModifierRadialArrangeMode = Ellipsis` — Each radial ring will contain the same number of elements.
The space between elements in the outer r...

### `unreal.ActorModifierRadialArrangePlane`
Inherits: `EnumBase` | Header: `ActorModifierRadialArrangeModifier.h`

Enumerates how to layout the ring

**Properties** (3):
  - `XY`: `ActorModifierRadialArrangePlane = Ellipsis` — 0
  - `XZ`: `ActorModifierRadialArrangePlane = Ellipsis` — 2
  - `YZ`: `ActorModifierRadialArrangePlane = Ellipsis` — 1
