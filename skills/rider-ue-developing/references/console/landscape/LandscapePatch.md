# UE Python API — LandscapePatch Module

**15 types** from the `LandscapePatch` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `LandscapeTexturePatchEncodingSettings`, `LandscapeCircleHeightPatch`, `LandscapeHeightTextureBackedRenderTarget`, `LandscapePatchComponent`, `LandscapePatchManager`, `LandscapeTextureBackedRenderTargetBase`, `LandscapeTexturePatch`, `LandscapeWeightPatchTextureInfo`, `LandscapeWeightTextureBackedRenderTarget`, `LandscapePatchPriorityInitialization`, `LandscapeTextureHeightPatchEncoding`, `LandscapeTextureHeightPatchZeroHeightMeaning`, `LandscapeTexturePatchBlendMode`, `LandscapeTexturePatchFalloffMode`, `LandscapeTexturePatchSourceMode`

---

## Classes

### `unreal.LandscapeTexturePatchEncodingSettings`
Inherits: `StructBase` | Header: `LandscapeTexturePatch.h`

Landscape Texture Patch Encoding Settings

**Properties** (2):
  - `world_space_encoding_scale`: `float` — [Read-Write] The scale that should be aplied to the data stored in the patch relative to the zero in...
  - `zero_in_encoding`: `float` — [Read-Write] The value in the patch data that corresponds to 0 height relative to the starting point...

### `unreal.LandscapeCircleHeightPatch`
Inherits: `LandscapePatchComponent` | Header: `LandscapeCircleHeightPatch.h`

The simplest height patch: a circle of flat ground with a falloff past the initial radius across which the alpha decreases linearly. When added to an actor, initializes itself to the bottom of the bou...

### `unreal.LandscapeHeightTextureBackedRenderTarget`
Inherits: `LandscapeTextureBackedRenderTargetBase` | Header: `LandscapeTextureBackedRenderTarget.h`

Landscape Height Texture Backed Render Target

### `unreal.LandscapePatchComponent`
Inherits: `SceneComponent` | Header: `LandscapePatchComponent.h`

Base class for landscape patches: components that can be attached to meshes and moved around to make the meshes affect the landscape around themselves.

**Methods** (9):
  - `get_landscape_heightmap_coords_to_world()` -> `Transform` — Get Landscape Heightmap Coords to World
  - `get_patch_manager()` -> `LandscapePatchManager` — Get Patch Manager
  - `get_priority()` -> `double` — Get Priority
  - `is_enabled()` -> `bool`
  - `request_landscape_update(user_triggered_update = False)` -> `None` — Request Landscape Update
  - `set_is_enabled(enabled_in)` -> `None` — Allows the patch to be disabled, so that it no longer affects the landscape. This can be useful when deleting the patch ...
  - `set_landscape(new_landscape)` -> `None` — Set Landscape
  - `set_patch_manager(new_patch_manager)` -> `None` — Set Patch Manager
  - `set_priority(priority_in)` -> `None` — Set Priority

### `unreal.LandscapePatchManager`
Inherits: `LandscapeBlueprintBrushBase` | Header: `LandscapePatchManager.h`

Actor used in legacy landscape patch handling where a manager keeps a serialized list of patches that determines their priority. This approach is deprecated- patches now point to a special landscape p...

**Methods** (6):
  - `add_patch(patch)` -> `None` — Add Patch
  - `contains_patch(patch)` -> `bool` — Contains Patch
  - `get_index_of_patch(patch)` -> `int32` — Gets the index of a particular patch in the managerâs stack of patches (later indices get applied after earlier ones.
  - `move_patch_to_index(patch, index)` -> `None` — Moves patch to given index in the list of patches held by the manager (so that it is applied at a particular time relati...
  - `remove_patch(patch)` -> `bool` — Remove Patch
  - `set_target_landscape(owning_landscape)` -> `None` — Adds the brush to the given landscape, removing it from any previous one. This differs from SetOwningLandscape in that S...

### `unreal.LandscapeTextureBackedRenderTargetBase`
Inherits: `Object` | Header: `LandscapeTextureBackedRenderTarget.h`

A combination of a render target and UTexture2D that allows render target to be saved across save/load/etc by copying the data back and forth from the internal texture.

### `unreal.LandscapeTexturePatch`
Inherits: `LandscapePatchComponent` | Header: `LandscapeTexturePatch.h`

Landscape Texture Patch

**Methods** (35):
  - `add_weight_patch(weightmap_layer_name, source_mode, use_alpha_channel)` -> `None` — By default, the layer is added with source mode set to be a texture-backed render target.
  - `clear_weight_patch_blend_mode_override(weightmap_layer_name)` -> `None` — Clear Weight Patch Blend Mode Override
  - `disable_all_weight_patches()` -> `None` — Sets the source mode of all weight patches to âNoneâ.
  - `get_all_weight_patch_layer_names()` -> `Array [ Name ]` — Get All Weight Patch Layer Names
  - `get_full_unscaled_world_size()` -> `Vector2D` — When using an internal texture, gives size in unscaled world coordinates of the patch in the world, based off of Unscale...
  - `get_height_render_target(mark_dirty = True)` -> `TextureRenderTarget2D` — Gets the internal height render target, if source mode is set to Texture Backed Render Target. Things that should be set...
  - `get_height_source_mode()` -> `LandscapeTexturePatchSourceMode` — Height related functions:
  - `get_init_resolution_from_landscape(resolution_multiplier = 1.000000)` -> `Vector2D or None` — Given the landscape resolution, current patch coverage, and a landscape resolution multiplier, gives the needed resoluti...
  - `get_patch_to_world_transform()` -> `Transform` — Gets the transform from patch to world. The transform is based off of the component transform, but with rotation changed...
  - `get_resolution()` -> `Vector2D` — Gets the size (in pixels) of the internal textures used by the patch. Does not reflect the resolution of any used textur...
  - `get_unscaled_coverage()` -> `Vector2D` — Gives size in unscaled world coordinates (ie before applying patch transform) of the patch as measured between the cente...
  - `get_weight_patch_render_target(weightmap_layer_name, mark_dirty = True)` -> `TextureRenderTarget2D`
  - `get_weight_patch_source_mode(weightmap_layer_name)` -> `LandscapeTexturePatchSourceMode` — Get Weight Patch Source Mode
  - `get_weight_patch_texture_asset(weightmap_layer_name)` -> `Texture` — Get Weight Patch Texture Asset
  - `remove_all_weight_patches()` -> `None` — Remove All Weight Patches
  - `remove_weight_patch(weightmap_layer_name)` -> `None` — Remove Weight Patch
  - `reset_height_encoding_mode(encoding_mode)` -> `None` — Just like SetSourceEncodingMode, but resets ZeroInEncoding, WorldSpaceEncodingScale, and height render target format to ...
  - `set_blend_mode(blend_mode_in)` -> `None` — Determines how the height patch is blended into the existing terrain.
  - `set_edit_visibility_layer(weightmap_layer_name, edit_visibility_layer)` -> `None` — Set Edit Visibility Layer
  - `set_falloff(falloff_in)` -> `None` — Set Falloff
  - `set_falloff_mode(falloff_mode_in)` -> `None` — Set Falloff Mode
  - `set_height_encoding_mode(encoding_mode)` -> `None` — Set the height encoding mode for the patch, which determines how stored values in the patch are translated into heights ...
  - `set_height_encoding_settings(settings)` -> `None` — Set settings that determine how values in the patch are translated into heights. This is only used if the encoding mode ...
  - `set_height_render_target_format(format)` -> `None` — Set Height Render Target Format
  - `set_height_source_mode(new_mode)` -> `None` — Changes source mode. There are currently no API guarantees regarding the initialization of the new source data. E.g. whe...
  - `set_height_texture_asset(texture_in)` -> `None` — Sets the texture used for height when the height source mode is set to texture asset. Note that virtual textures are not...
  - `set_resolution(resolution_in)` -> `None` — Sets the resolution of the currently used internal texture or render target. Has no effect if the source mode is set to ...
  - `set_unscaled_coverage(coverage)` -> `None` — Set the patch coverage (see GetUnscaledCoverage for description).
  - `set_use_alpha_channel_for_height(use)` -> `None` — Determines whether the height patch alpha channel is used for blending into the existing values. Note that the source da...
  - `set_use_alpha_channel_for_weight_patch(weightmap_layer_name, use_alpha_channel)` -> `None` — Set Use Alpha Channel for Weight Patch
  - `set_weight_patch_blend_mode_override(weightmap_layer_name, blend_mode)` -> `None` — Set Weight Patch Blend Mode Override
  - `set_weight_patch_source_mode(weightmap_layer_name, new_mode)` -> `None` — Set Weight Patch Source Mode
  - `set_weight_patch_texture_asset(weightmap_layer_name, texture_in)` -> `None` — Set Weight Patch Texture Asset
  - `set_zero_height_meaning(zero_height_meaning_in)` -> `None` — Set how zero height is interpreted, see comments in ELandscapeTextureHeightPatchZeroHeightMeaning.
  - `snap_to_landscape()` -> `None` — Adjusts patch rotation to be aligned to a 90 degree increment relative to the landscape, adjusts UnscaledPatchCoverage s...

**Properties** (2):
  - `height_encoding_settings`: `LandscapeTexturePatchEncodingSettings` [Read-Only] — [Read-Only] Encoding settings. Not relevant when using native packed height as the encoding. (Landsc...
  - `height_texture_asset`: `Texture` [Read-Only] — [Read-Only] Texture used when source mode is set to a texture asset. (Texture)

### `unreal.LandscapeWeightPatchTextureInfo`
Inherits: `Object` | Header: `LandscapeTexturePatch.h`

Helper class for ULandscapeTexturePatch that stores information for a given weight layer. Should not be used outside this class.

### `unreal.LandscapeWeightTextureBackedRenderTarget`
Inherits: `LandscapeTextureBackedRenderTargetBase` | Header: `LandscapeTextureBackedRenderTarget.h`

Landscape Weight Texture Backed Render Target

### `unreal.LandscapePatchPriorityInitialization`
Inherits: `EnumBase` | Header: `LandscapePatchComponent.h`

ELandscape Patch Priority Initialization

**Properties** (3):
  - `ACQUIRE_HIGHEST`: `LandscapePatchPriorityInitialization = Ellipsis` — Initialize priority to highest currently known value, so that the new patch is on top of any existin...
  - `KEEP_ORIGINAL`: `LandscapePatchPriorityInitialization = Ellipsis` — Do not change the default/archetype priority value. This is useful when using custom priority
values...
  - `SMALL_INCREMENT`: `LandscapePatchPriorityInitialization = Ellipsis` — Increment the original priority by a small amount (0.01). This can be useful when copying a patch
ar...

### `unreal.LandscapeTextureHeightPatchEncoding`
Inherits: `EnumBase` | Header: `LandscapeTexturePatch.h`

ELandscape Texture Height Patch Encoding

**Properties** (3):
  - `NATIVE_PACKED_HEIGHT`: `LandscapeTextureHeightPatchEncoding = Ellipsis` — as 16 bit integers packed
into two bytes, mapping to [-256, 256 - 1/128] before applying landscape s...
  - `WORLD_UNITS`: `LandscapeTextureHeightPatchEncoding = Ellipsis` — Values in texture are direct world-space heights. 1
  - `ZERO_TO_ONE`: `LandscapeTextureHeightPatchEncoding = Ellipsis` — Values in texture should be interpreted as being floats in the range [0,1]. User specifies what
valu...

### `unreal.LandscapeTextureHeightPatchZeroHeightMeaning`
Inherits: `EnumBase` | Header: `LandscapeTexturePatch.h`

ELandscape Texture Height Patch Zero Height Meaning

**Properties** (3):
  - `LANDSCAPE_Z`: `LandscapeTextureHeightPatchZeroHeightMeaning = Ellipsis` — Zero height corresponds to Z = 0 in the local space of the landscape, regardless of the patch vertic...
  - `PATCH_Z`: `LandscapeTextureHeightPatchZeroHeightMeaning = Ellipsis` — Zero height corresponds to the patch vertical position relative to the landscape. This moves
the res...
  - `WORLD_ZERO`: `LandscapeTextureHeightPatchZeroHeightMeaning = Ellipsis` — Zero height corresponds to the height of the world origin relative to landscape. In other words, wri...

### `unreal.LandscapeTexturePatchBlendMode`
Inherits: `EnumBase` | Header: `LandscapeTexturePatch.h`

Determines how the patch is combined with the previous state of the landscape.

**Properties** (4):
  - `ADDITIVE`: `LandscapeTexturePatchBlendMode = Ellipsis` — Interpreting the landscape mid value as 0, use the texture patch as an offset to
apply to the landsc...
  - `ALPHA_BLEND`: `LandscapeTexturePatchBlendMode = Ellipsis` — Let the patch specify the actual target height, and blend that with the existing
height using fallof...
  - `MAX`: `LandscapeTexturePatchBlendMode = Ellipsis` — Like Alpha Blend mode, but limited to only raising the existing landscape values 3
  - `MIN`: `LandscapeTexturePatchBlendMode = Ellipsis` — Like Alpha Blend mode, but limited to only lowering the existing landscape values 2

### `unreal.LandscapeTexturePatchFalloffMode`
Inherits: `EnumBase` | Header: `LandscapeTexturePatch.h`

Determines falloff method for the patchâs influence.

**Properties** (2):
  - `CIRCLE`: `LandscapeTexturePatchFalloffMode = Ellipsis` — Affect landscape in a circle inscribed in the patch, and fall off across
a margin extending into tha...
  - `ROUNDED_RECTANGLE`: `LandscapeTexturePatchFalloffMode = Ellipsis` — Affect entire rectangle of patch (except for circular corners), and fall off
across a margin extendi...

### `unreal.LandscapeTexturePatchSourceMode`
Inherits: `EnumBase` | Header: `LandscapeTexturePatch.h`

Determines where the patch gets its information, which affects its memory usage in editor (not in runtime, since patches are baked directly into landscape and removed for runtime).

**Properties** (4):
  - `INTERNAL_TEXTURE`: `LandscapeTexturePatchSourceMode = Ellipsis` — The data will be read from an internally-stored UTexture2D. In this mode, the patch canât be writt...
  - `NONE`: `LandscapeTexturePatchSourceMode = Ellipsis` — The patch is considered not to have any data stored for this element. Setting source mode to this is...
  - `TEXTURE_ASSET`: `LandscapeTexturePatchSourceMode = Ellipsis` — The data will be read from a UTexture asset (which can be a render target). Allows multiple patches
...
  - `TEXTURE_BACKED_RENDER_TARGET`: `LandscapeTexturePatchSourceMode = Ellipsis` — The patch data will be read from an internally-stored render target, which can be written to via Blu...
