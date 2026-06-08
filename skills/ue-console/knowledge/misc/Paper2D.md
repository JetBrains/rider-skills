# UE Python API — Paper2D Module

**39 types** from the `Paper2D` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `IntMargin`, `PaperFlipbookKeyFrame`, `PaperSpriteSocket`, `PaperTerrainMaterialRule`, `PaperTileInfo`, `PaperTileMetadata`, `SpriteGeometryCollection`, `SpriteGeometryShape`, `SpriteInstanceData`, `MaterialExpressionSpriteTextureSampler`, `PaperCharacter`, `PaperFlipbook`, `PaperFlipbookActor`, `PaperFlipbookComponent`, `PaperGroupedSpriteActor`, `PaperGroupedSpriteComponent`, `PaperSprite`, `PaperSpriteActor`, `PaperSpriteAtlas`, `PaperSpriteComponent`, ... (39 total)

---

## Classes

### `unreal.IntMargin`
Inherits: `StructBase` | Header: `IntMargin.h`

Describes the space around a 2D area on an integer grid.

**Properties** (4):
  - `bottom`: `int` — [Read-Write] Holds the margin to the bottom. (int32)
  - `left`: `int` — [Read-Write] Holds the margin to the left. (int32)
  - `right`: `int` — [Read-Write] Holds the margin to the right. (int32)
  - `top`: `int` — [Read-Write] Holds the margin to the top. (int32)

### `unreal.PaperFlipbookKeyFrame`
Inherits: `StructBase` | Header: `PaperFlipbook.h`

Paper Flipbook Key Frame

### `unreal.PaperSpriteSocket`
Inherits: `StructBase` | Header: `PaperSprite.h`

TODO:: Should have some nice UI and enforce unique names, etcâ¦

**Properties** (2):
  - `local_transform`: `Transform` [Read-Only] — [Read-Only] Transform in pivot space (nottexture space) (Transform)
  - `socket_name`: `Name` [Read-Only] — [Read-Only] Name of the socket (Name)

### `unreal.PaperTerrainMaterialRule`
Inherits: `StructBase` | Header: `PaperTerrainMaterial.h`

Rule for a single section of a terrain material

### `unreal.PaperTileInfo`
Inherits: `StructBase` | Header: `PaperTileLayer.h`

This is the contents of a tile map cell

### `unreal.PaperTileMetadata`
Inherits: `StructBase` | Header: `PaperTileSet.h`

Information about a single tile in a tile set

**Properties** (1):
  - `user_data_name`: `Name` [Read-Only] — [Read-Only] A tag that can be used for grouping and categorizing (consider using it as the index int...

### `unreal.SpriteGeometryCollection`
Inherits: `StructBase` | Header: `SpriteEditorOnlyTypes.h`

Sprite Geometry Collection

### `unreal.SpriteGeometryShape`
Inherits: `StructBase` | Header: `SpriteEditorOnlyTypes.h`

A single piece of geometry (e.g., a polygon which may be convex or concave, a box, or a circle)

### `unreal.SpriteInstanceData`
Inherits: `StructBase` | Header: `PaperGroupedSpriteComponent.h`

Sprite Instance Data

### `unreal.MaterialExpressionSpriteTextureSampler`
Inherits: `MaterialExpressionTextureSampleParameter2D` | Header: `MaterialExpressionSpriteTextureSampler.h`

This is a texture sampler 2D with a special automatically defined parameter name. The texture specified here will be replaced by the SourceTexture or an AdditionalSourceTextures entry of a Paper2D spr...

### `unreal.PaperCharacter`
Inherits: `Character` | Header: `PaperCharacter.h`

APaperCharacter behaves like ACharacter, but uses a UPaperFlipbookComponent instead of a USkeletalMeshComponent as a visual representation Note: The variable named Mesh will not be set up on this acto...

**Properties** (1):
  - `sprite`: `PaperFlipbookComponent` [Read-Only] — [Read-Only] The main skeletal mesh associated with this Character (optional sub-object). (PaperFlipb...

### `unreal.PaperFlipbook`
Inherits: `Object` | Header: `PaperFlipbook.h`

Contains an animation sequence of sprite frames

**Methods** (7):
  - `get_key_frame_index_at_time(time, clamp_to_ends = False)` -> `int32` — Returns the keyframe index that covers the specified time (in seconds), or INDEX_NONE if none exists. When bClampToEnds ...
  - `get_num_frames()` -> `int32` — Returns the total number of frames
  - `get_num_key_frames()` -> `int32` — Returns the number of key frames
  - `get_sprite_at_frame(frame_index)` -> `PaperSprite` — Returns the sprite at the specified keyframe index, or nullptr if none exists
  - `get_sprite_at_time(time, clamp_to_ends = False)` -> `PaperSprite` — Returns the sprite at the specified time (in seconds), or nullptr if none exists. When bClampToEnds is true, it will cho...
  - `get_total_duration()` -> `float` — Returns the total duration in seconds
  - `is_valid_key_frame_index(index)` -> `bool` — Is the specified Index within the valid range of key frames?

**Properties** (3):
  - `collision_source`: `FlipbookCollisionMode` [Read-Only] — [Read-Only] Collision source (FlipbookCollisionMode)
  - `default_material`: `MaterialInterface` [Read-Only] — [Read-Only] The material to use on a flipbook player instance if not overridden (MaterialInterface)
  - `frames_per_second`: `float` [Read-Only] — [Read-Only] The nominal frame rate to play this flipbook animation back at (float)

### `unreal.PaperFlipbookActor`
Inherits: `Actor` | Header: `PaperFlipbookActor.h`

An instance of a UPaperFlipbook in a level.

**Properties** (1):
  - `render_component`: `PaperFlipbookComponent` [Read-Only] — [Read-Only] (PaperFlipbookComponent)

### `unreal.PaperFlipbookComponent`
Inherits: `MeshComponent` | Header: `PaperFlipbookComponent.h`

Paper Flipbook Component

**Methods** (23):
  - `get_flipbook()` -> `PaperFlipbook` — Gets the flipbook used by this instance.
  - `get_flipbook_framerate()` -> `float` — Get the nominal framerate that the flipbook will be played back at (ignoring PlayRate), in frames per second
  - `get_flipbook_length()` -> `float` — Get length of the flipbook (in seconds)
  - `get_flipbook_length_in_frames()` -> `int32` — Get length of the flipbook (in frames)
  - `get_play_rate()` -> `float` — Get the current play rate for this flipbook
  - `get_playback_position()` -> `float` — Get the current playback position (in seconds) of the flipbook
  - `get_playback_position_in_frames()` -> `int32` — Get the current playback position (in frames) of the flipbook
  - `get_sprite_color()` -> `LinearColor` — Returns the current color of the sprite
  - `is_looping()` -> `bool` — Get whether we are looping or not
  - `is_playing()` -> `bool` — Get whether this flipbook is playing or not.
  - `is_reversing()` -> `bool` — Get whether we are reversing or not
  - `play()` -> `None` — Start playback of flipbook
  - `play_from_start()` -> `None` — Start playback of flipbook from the start
  - `reverse()` -> `None` — Start playback of flipbook in reverse
  - `reverse_from_end()` -> `None` — Start playback of flipbook in reverse from the end
  - `set_flipbook(new_flipbook)` -> `bool` — Change the flipbook used by this instance (will reset the play time to 0 if it is a new flipbook).
  - `set_looping(new_looping)` -> `None` — true means we should loop, false means we should not.
  - `set_new_time(new_time)` -> `None` — Set the new playback position time to use
  - `set_play_rate(new_rate)` -> `None` — Sets the new play rate for this flipbook
  - `set_playback_position(new_position, fire_events)` -> `None` — Jump to a position in the flipbook (expressed in seconds). If bFireEvents is true, event functions will fire, otherwise ...
  - `set_playback_position_in_frames(new_frame_position, fire_events)` -> `None` — Jump to a position in the flipbook (expressed in frames). If bFireEvents is true, event functions will fire, otherwise t...
  - `set_sprite_color(new_color)` -> `None` — Set color of the sprite
  - `stop()` -> `None` — Stop playback of flipbook

**Properties** (2):
  - `on_finished_playing`: `FlipbookFinishedPlaySignature` — [Read-Write] Event called whenever a non-looping flipbook finishes playing (either reaching the begi...
  - `sprite_color`: `LinearColor` [Read-Only] — [Read-Only] Vertex color to apply to the frames (LinearColor)

### `unreal.PaperGroupedSpriteActor`
Inherits: `Actor` | Header: `PaperGroupedSpriteActor.h`

A group of sprites that will be rendered and culled as a single unit

**Properties** (1):
  - `render_component`: `PaperGroupedSpriteComponent` [Read-Only] — [Read-Only] (PaperGroupedSpriteComponent)

### `unreal.PaperGroupedSpriteComponent`
Inherits: `MeshComponent` | Header: `PaperGroupedSpriteComponent.h`

A component that handles rendering and collision for many instances of one or more UPaperSprite assets. see: UPrimitiveComponent, UPaperSprite

**Methods** (8):
  - `add_instance(transform, sprite, world_space = False, color = [1.000000,1.000000,1.000000,1.000000])` -> `int32` — Add an instance to this component. Transform can be given either in the local space of this component or world space.
  - `clear_instances()` -> `None` — Clear all instances being rendered by this component
  - `get_instance_count()` -> `int32` — Get the number of instances in this component
  - `get_instance_transform(instance_index, world_space = False)` -> `Transform or None` — Get the transform for the instance specified. Instance is returned in local space of this component unless bWorldSpace i...
  - `remove_instance(instance_index)` -> `bool` — Remove the instance specified. Returns True on success.
  - `sort_instances_along_axis(world_space_sort_axis)` -> `None` — Sort all instances by their world space position along the specified axis
  - `update_instance_color(instance_index, new_instance_color, mark_render_state_dirty = True)` -> `bool` — Update the color for the instance specified. Returns True on success.
  - `update_instance_transform(instance_index, new_instance_transform, world_space = False, mark_render_state_dirty = True, teleport = False)` -> `bool` — Update the transform for the instance specified. Instance is given in local space of this component unless bWorldSpace i...

### `unreal.PaperSprite`
Inherits: `Object` | Header: `PaperSprite.h`

Sprite Asset

**Properties** (2):
  - `alternate_material`: `MaterialInterface` [Read-Only] — [Read-Only] The alternate material to use on a sprite instance if not overridden (this is only used ...
  - `default_material`: `MaterialInterface` [Read-Only] — [Read-Only] The material to use on a sprite instance if not overridden (this is the default material...

### `unreal.PaperSpriteActor`
Inherits: `Actor` | Header: `PaperSpriteActor.h`

An instance of a UPaperSprite in a level.

**Properties** (1):
  - `render_component`: `PaperSpriteComponent` [Read-Only] — [Read-Only] (PaperSpriteComponent)

### `unreal.PaperSpriteAtlas`
Inherits: `Object` | Header: `PaperSpriteAtlas.h`

Groups together a set of sprites that will try to share the same texture atlas (allowing them to be combined into a single draw call)

### `unreal.PaperSpriteComponent`
Inherits: `MeshComponent` | Header: `PaperSpriteComponent.h`

A component that handles rendering and collision for a single instance of a UPaperSprite asset.

**Methods** (3):
  - `get_sprite()` -> `PaperSprite` — Gets the PaperSprite used by this instance.
  - `set_sprite(new_sprite)` -> `bool` — Change the PaperSprite used by this instance.
  - `set_sprite_color(new_color)` -> `None` — Set color of the sprite

**Properties** (2):
  - `source_sprite`: `PaperSprite` [Read-Only] — [Read-Only] The sprite asset used by this component (PaperSprite)
  - `sprite_color`: `LinearColor` [Read-Only] — [Read-Only] The color of the sprite (passed to the sprite material as a vertex color) (LinearColor)

### `unreal.PaperSpriteLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `PaperSpriteBlueprintLibrary.h`

Paper Sprite Blueprint Library

**Methods** (1):
  - `make_brush_from_sprite(sprite, width, height)` -> `SlateBrush` [classmethod] — Make Brush from Sprite

### `unreal.PaperTerrainActor`
Inherits: `Actor` | Header: `PaperTerrainActor.h`

An instance of a piece of 2D terrain in the level

**Properties** (1):
  - `render_component`: `PaperTerrainComponent` [Read-Only] — [Read-Only] (PaperTerrainComponent)

### `unreal.PaperTerrainComponent`
Inherits: `PrimitiveComponent` | Header: `PaperTerrainComponent.h`

The terrain visualization component for an associated spline component. This takes a 2D terrain material and instances sprite geometry along the spline path.

**Methods** (1):
  - `set_terrain_color(new_color)` -> `None` — Set color of the terrain

**Properties** (4):
  - `closed_spline`: `bool` [Read-Only] — [Read-Only] (bool)
  - `filled_spline`: `bool` [Read-Only] — [Read-Only] (bool)
  - `terrain_color`: `LinearColor` [Read-Only] — [Read-Only] The color of the terrain (passed to the sprite material as a vertex color) (LinearColor)
  - `terrain_material`: `PaperTerrainMaterial` [Read-Only] — [Read-Only] The terrain material to apply to this component (set of rules for which sprites are used...

### `unreal.PaperTerrainMaterial`
Inherits: `DataAsset` | Header: `PaperTerrainMaterial.h`

Paper Terrain Material

### `unreal.PaperTerrainSplineComponent`
Inherits: `SplineComponent` | Header: `PaperTerrainSplineComponent.h`

TODO:: Document

### `unreal.PaperTileLayer`
Inherits: `Object` | Header: `PaperTileLayer.h`

This class represents a single layer in a tile map. All layers in the map must have the size dimensions.

**Properties** (10):
  - `collision_offset_override`: `float` [Read-Only] — [Read-Only] The override offset of the collision for this layer (when bOverrideCollisionOffset is se...
  - `collision_thickness_override`: `float` [Read-Only] — [Read-Only] The override thickness of the collision for this layer (when bOverrideCollisionThickness...
  - `hidden_in_game`: `bool` [Read-Only] — [Read-Only] Should this layer be hidden in the game? (bool)
  - `layer_collides`: `bool` [Read-Only] — [Read-Only] Should this layer generate collision?
Note: This only has an effect if the owning tile m...
  - `layer_color`: `LinearColor` [Read-Only] — [Read-Only] The color of this layer (multiplied with the tile map color and passed to the material a...
  - `layer_height`: `int` [Read-Only] — [Read-Only] Height of the layer (in tiles) (int32)
  - `layer_name`: `Text` [Read-Only] — [Read-Only] Name of the layer (Text)
  - `layer_width`: `int` [Read-Only] — [Read-Only] Width of the layer (in tiles) (int32)
  - `override_collision_offset`: `bool` [Read-Only] — [Read-Only] Should this layer use a custom offset for generated collision instead of the layer drawi...
  - `override_collision_thickness`: `bool` [Read-Only] — [Read-Only] Should this layer use a custom thickness for generated collision instead of the thicknes...

### `unreal.PaperTileMap`
Inherits: `Object` | Header: `PaperTileMap.h`

A tile map is a 2D grid with a defined width and height (in tiles). There can be multiple layers, each of which can specify which tile should appear in each cell of the map for that layer.

**Properties** (10):
  - `collision_thickness`: `float` [Read-Only] — [Read-Only] The extrusion thickness of collision geometry when using a 3D collision domain (float)
  - `map_height`: `int` [Read-Only] — [Read-Only] Height of map (in tiles) (int32)
  - `map_width`: `int` [Read-Only] — [Read-Only] Width of map (in tiles) (int32)
  - `material`: `MaterialInterface` [Read-Only] — [Read-Only] The material to use on a tile map instance if not overridden (MaterialInterface)
  - `projection_mode`: `TileMapProjectionMode` [Read-Only] — [Read-Only] Tile map type (TileMapProjectionMode)
  - `separation_per_layer`: `float` [Read-Only] — [Read-Only] The Z-separation between each layer of the tile map (float)
  - `sprite_collision_domain`: `SpriteCollisionMode` [Read-Only] — [Read-Only] Collision domain (no collision, 2D, or 3D) (SpriteCollisionMode)
  - `tile_height`: `int` [Read-Only] — [Read-Only] Height of one tile (in pixels) (int32)
  - `tile_layers`: `None` [Read-Only] — [Read-Only] The list of layers (Array[PaperTileLayer])
  - `tile_width`: `int` [Read-Only] — [Read-Only] Width of one tile (in pixels) (int32)

### `unreal.PaperTileMapActor`
Inherits: `Actor` | Header: `PaperTileMapActor.h`

An instance of a UPaperTileMap in a level.

**Properties** (1):
  - `render_component`: `PaperTileMapComponent` [Read-Only] — [Read-Only] (PaperTileMapComponent)

### `unreal.PaperTileMapComponent`
Inherits: `MeshComponent` | Header: `PaperTileMapComponent.h`

A component that handles rendering and collision for a single instance of a UPaperTileMap asset.

**Methods** (19):
  - `add_new_layer()` -> `PaperTileLayer` — Creates and adds a new layer to the tile map Note: This will only work on components that own their own tile map (OwnsTi...
  - `create_new_tile_map(map_width = 4, map_height = 4, tile_width = 32, tile_height = 32, pixels_per_unreal_unit = 1.000000, create_layer = True)` -> `None` — Creates a new tile map of the specified size, replacing the TileMap reference (or dropping the previous owned one)
  - `get_layer_color(layer = 0)` -> `LinearColor` — Gets the per-layer color multiplier for a specific layer (multiplied with the tile map color and passed to the material ...
  - `get_map_size(map_height=int32, num_layers=int32)` — Returns the size of the tile map
  - `get_tile(x, y, layer = 0)` -> `PaperTileInfo` — Returns the contents of a specified tile cell
  - `get_tile_center_position(tile_x, tile_y, layer_index = 0, world_space = False)` -> `Vector` — Returns the position of the center of the specified tile
  - `get_tile_corner_position(tile_x, tile_y, layer_index = 0, world_space = False)` -> `Vector` — Returns the position of the top left corner of the specified tile
  - `get_tile_map_color()` -> `LinearColor` — Gets the tile map global color multiplier (multiplied with the per-layer color and passed to the material as a vertex co...
  - `get_tile_polygon(tile_x, tile_y, layer_index = 0, world_space = False)` -> `Array [ Vector ]` — Returns the polygon for the specified tile (will be 4 or 6 vertices as a rectangle, diamond, or hexagon)
  - `make_tile_map_editable()` -> `None` — Makes the tile map asset pointed to by this component editable. Nothing happens if it was already instanced, but if the ...
  - `owns_tile_map()` -> `bool` — Does this component own the tile map (is it instanced instead of being an asset reference)?
  - `rebuild_collision()` -> `None` — Rebuilds collision for the tile map
  - `resize_map(new_width_in_tiles, new_height_in_tiles)` -> `None` — Resizes the tile map (Note: This will only work on components that own their own tile map (OwnsTileMap returns true), yo...
  - `set_default_collision_thickness(thickness, rebuild_collision = True)` -> `None` — Sets the default thickness for any layers that donât override the collision thickness Note: This will only work on com...
  - `set_layer_collision(layer = 0, has_collision = True, override_thickness = True, custom_thickness = 50.000000, override_offset = False, custom_offset = 0.000000, rebuild_collision = True)` -> `None` — Sets the collision thickness for a specific layer Note: This will only work on components that own their own tile map (O...
  - `set_layer_color(new_color, layer = 0)` -> `None` — Sets the per-layer color multiplier for a specific layer (multiplied with the tile map color and passed to the material ...
  - `set_tile(x, y, layer=0, new_value)` -> `None` — Modifies the contents of a specified tile cell (Note: This will only work on components that own their own tile map (Own...
  - `set_tile_map(new_tile_map)` -> `bool` — Change the PaperTileMap used by this instance.
  - `set_tile_map_color(new_color)` -> `None` — Sets the tile map global color multiplier (multiplied with the per-layer color and passed to the material as a vertex co...

**Properties** (1):
  - `tile_map`: `PaperTileMap` [Read-Only] — [Read-Only] The tile map used by this component (PaperTileMap)

### `unreal.PaperTileSet`
Inherits: `Object` | Header: `PaperTileSet.h`

A tile set is a collection of tiles pulled from a texture that can be used to fill out a tile map. see: UPaperTileMap, UPaperTileMapComponent

**Properties** (5):
  - `border_margin`: `IntMargin` [Read-Only] — [Read-Only] The amount of padding around the border of the tile sheet (in pixels) (IntMargin)
  - `drawing_offset`: `IntPoint` [Read-Only] — [Read-Only] The drawing offset for tiles from this set (in pixels) (IntPoint)
  - `per_tile_spacing`: `IntPoint` [Read-Only] — [Read-Only] The amount of padding between tiles in the tile sheet (in pixels) (IntPoint)
  - `tile_sheet`: `Texture2D` [Read-Only] — [Read-Only] The tile sheet texture associated with this tile set (Texture2D)
  - `tile_size`: `IntPoint` [Read-Only] — [Read-Only] The width and height of a single tile (in pixels) (IntPoint)

### `unreal.TileMapLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `TileMapBlueprintLibrary.h`

A collection of utility methods for working with tile map components see: UPaperTileMap, UPaperTileMapComponent

**Methods** (4):
  - `break_tile(tile_set=PaperTileSet, flip_h=bool, flip_v=bool, flip_d=bool)` [classmethod] — Breaks out the information for a tile
  - `get_tile_transform(tile)` -> `Transform` [classmethod] — Returns the transform for a tile
  - `get_tile_user_data(tile)` -> `Name` [classmethod] — Returns the user data name for the specified tile, or NAME_None if there is no user-specified data
  - `make_tile(tile_index, tile_set, flip_h, flip_v, flip_d)` -> `PaperTileInfo` [classmethod] — Creates a tile from the specified information

### `unreal.FlipbookCollisionMode`
Inherits: `EnumBase` | Header: `PaperFlipbook.h`

EFlipbook Collision Mode

**Properties** (3):
  - `EACH_FRAME_COLLISION`: `FlipbookCollisionMode = Ellipsis` — This setting is not recommended and is very expensive, recreating the physics state every frame) 2 T...
  - `FIRST_FRAME_COLLISION`: `FlipbookCollisionMode = Ellipsis` — The flipbook has non-animated collision based on the first frame of the animation 1
  - `NO_COLLISION`: `FlipbookCollisionMode = Ellipsis` — The flipbook has no collision 0

### `unreal.PaperSpriteAtlasPadding`
Inherits: `EnumBase` | Header: `PaperSpriteAtlas.h`

EPaper Sprite Atlas Padding

**Properties** (2):
  - `DILATE_BORDER`: `PaperSpriteAtlasPadding = Ellipsis` — Dilate the texture to pad the atlas. 0
  - `PAD_WITH_ZERO`: `PaperSpriteAtlasPadding = Ellipsis` — Padding border filled with zeros. 1

### `unreal.SpriteCollisionMode`
Inherits: `EnumBase` | Header: `SpriteEditorOnlyTypes.h`

The kind of collision that a Paper2D asset or component might participate in

**Properties** (2):
  - `NONE`: `SpriteCollisionMode = Ellipsis` — Should this have no collison and not participate in physics? 0
  - `USE3D_PHYSICS`: `SpriteCollisionMode = Ellipsis` — Should this have 3D collision geometry and participate in the 3D physics world? 2

### `unreal.SpritePivotMode`
Inherits: `EnumBase` | Header: `SpriteEditorOnlyTypes.h`

ESprite Pivot Mode

**Properties** (10):
  - `BOTTOM_CENTER`: `SpritePivotMode = Ellipsis` — 7
  - `BOTTOM_LEFT`: `SpritePivotMode = Ellipsis` — 6
  - `BOTTOM_RIGHT`: `SpritePivotMode = Ellipsis` — 8
  - `CENTER_CENTER`: `SpritePivotMode = Ellipsis` — 4
  - `CENTER_LEFT`: `SpritePivotMode = Ellipsis` — 3
  - `CENTER_RIGHT`: `SpritePivotMode = Ellipsis` — 5
  - `CUSTOM`: `SpritePivotMode = Ellipsis` — 9
  - `TOP_CENTER`: `SpritePivotMode = Ellipsis` — 1
  - `TOP_LEFT`: `SpritePivotMode = Ellipsis` — 0
  - `TOP_RIGHT`: `SpritePivotMode = Ellipsis` — 2

### `unreal.SpritePolygonMode`
Inherits: `EnumBase` | Header: `SpriteEditorOnlyTypes.h`

Method of specifying polygons for a spriteâs render or collision data

**Properties** (5):
  - `DICED`: `SpritePolygonMode = Ellipsis` — Diced (split up into smaller squares, including only non-empty ones in the final geometry).  This op...
  - `FULLY_CUSTOM`: `SpritePolygonMode = Ellipsis` — Fully custom geometry; edited by hand 3
  - `SHRINK_WRAPPED`: `SpritePolygonMode = Ellipsis` — Shrink-wrapped geometry 2
  - `SOURCE_BOUNDING_BOX`: `SpritePolygonMode = Ellipsis` — Use the bounding box of the source sprite (no optimization) 0
  - `TIGHT_BOUNDING_BOX`: `SpritePolygonMode = Ellipsis` — Tighten the bounding box around the sprite to exclude fully transparent areas (the default) 1

### `unreal.SpriteShapeType`
Inherits: `EnumBase` | Header: `SpriteEditorOnlyTypes.h`

The type of a shape in a sprite geometry structure

**Properties** (3):
  - `BOX`: `SpriteShapeType = Ellipsis` — Box/Rectangular prism (size defined by BoxSize) 0
  - `CIRCLE`: `SpriteShapeType = Ellipsis` — Circle/Sphere (major axis is defined by BoxSize.X, minor axis by BoxSize.Y) 1
  - `POLYGON`: `SpriteShapeType = Ellipsis` — Custom closed polygon 2

### `unreal.TileMapProjectionMode`
Inherits: `EnumBase` | Header: `PaperTileMap.h`

The different kinds of projection modes supported

**Properties** (4):
  - `HEXAGONAL_STAGGERED`: `TileMapProjectionMode = Ellipsis` — Not fully supported yet. 3 Hexagonal tile layout (roughly in a square with alternating rows staggere...
  - `ISOMETRIC_DIAMOND`: `TileMapProjectionMode = Ellipsis` — Isometric tile layout (shaped like a diamond)*/ 1
  - `ISOMETRIC_STAGGERED`: `TileMapProjectionMode = Ellipsis` — Not fully supported yet. 2 Isometric tile layout (roughly in a square with alternating rows staggere...
  - `ORTHOGONAL`: `TileMapProjectionMode = Ellipsis` — Square tile layout 0

### `unreal.FlipbookFinishedPlaySignature`
Inherits: `MulticastDelegateBase` | Header: `PaperFlipbookComponent.h`

Event for a non-looping flipbook finishing play
