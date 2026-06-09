# UE Python API — Landscape Module

**50 types** from the `Landscape` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `GrassInput`, `GrassVariety`, `LandscapeBrushParameters`, `LandscapePerLODMaterialOverride`, `LandscapeSplineMeshEntry`, `LandscapeSplineSegmentConnection`, `LandscapeTargetLayerSettings`, `LayerBlendInput`, `PhysicalMaterialInput`, `ControlPointMeshActor`, `ControlPointMeshComponent`, `Landscape`, `LandscapeBlueprintBrushBase`, `LandscapeComponent`, `LandscapeGizmoActiveActor`, `LandscapeGizmoActor`, `LandscapeGizmoRenderComponent`, `LandscapeGrassType`, `LandscapeHeightfieldCollisionComponent`, `LandscapeInfo`, ... (50 total)

---

## Classes

### `unreal.GrassInput`
Inherits: `StructBase` | Header: `MaterialExpressionLandscapeGrassOutput.h`

Grass Input

### `unreal.GrassVariety`
Inherits: `StructBase` | Header: `LandscapeGrassType.h`

Grass Variety

**Properties** (28):
  - `affect_distance_field_lighting`: `bool` [Read-Only] — [Read-Only] Controls whether the primitive should affect dynamic distance field lighting methods. (b...
  - `align_to_surface`: `bool` [Read-Only] — [Read-Only] Whether the grass instances should be tilted to the normal of the landscape (true), or a...
  - `allowed_density_range`: `FloatInterval` [Read-Only] — [Read-Only] Specifies the density range where the grass variety is allowed to be spawned ([0,1] repr...
  - `cast_contact_shadow`: `bool` [Read-Only] — [Read-Only] Whether the grass should cast contact shadows. * (bool)
  - `cast_dynamic_shadow`: `bool` [Read-Only] — [Read-Only] Whether the grass should cast shadows when using non-precomputed shadowing. * (bool)
  - `end_cull_distance`: `PerPlatformInt` [Read-Only] — [Read-Only] The distance where instances will have completely faded out when using a PerInstanceFade...
  - `end_cull_distance_quality`: `PerQualityLevelInt` [Read-Only] — [Read-Only] (PerQualityLevelInt)
  - `grass_density`: `PerPlatformFloat` [Read-Only] — [Read-Only] Instances per 10 square meters. (PerPlatformFloat)
  - `grass_density_quality`: `PerQualityLevelFloat` [Read-Only] — [Read-Only] (PerQualityLevelFloat)
  - `grass_mesh`: `StaticMesh` [Read-Only] — [Read-Only] (StaticMesh)
  - `keep_instance_buffer_cpu_copy`: `bool` [Read-Only] — [Read-Only] Whether we should keep a cpu copy of the instance buffer. This should be set to true if ...
  - `lighting_channels`: `LightingChannels` [Read-Only] — [Read-Only] Lighting channels that the grass will be assigned. Lights with matching channels will af...
  - `max_scale_weight_attenuation`: `float` [Read-Only] — [Read-Only] Modulate the scale of the instances based on weight (normalized density). The weight ran...
  - `min_lod`: `int` [Read-Only] — [Read-Only] Specifies the smallest LOD that will be used for this component.
If -1 (default), the Mi...
  - `override_materials`: `None` [Read-Only] — [Read-Only] Material Overrides. (Array[MaterialInterface])
  - `placement_jitter`: `float` [Read-Only] — [Read-Only] (float)
  - `random_rotation`: `bool` [Read-Only] — [Read-Only] Whether the grass instances should be placed at random rotation (true) or all at the sam...
  - `receives_decals`: `bool` [Read-Only] — [Read-Only] Whether the grass instances should receive decals. (bool)
  - `scale_x`: `FloatInterval` [Read-Only] — [Read-Only] Specifies the range of scale, from minimum to maximum, to apply to a grass instanceâs ...
  - `scale_y`: `FloatInterval` [Read-Only] — [Read-Only] Specifies the range of scale, from minimum to maximum, to apply to a grass instanceâs ...
  - `scale_z`: `FloatInterval` [Read-Only] — [Read-Only] Specifies the range of scale, from minimum to maximum, to apply to a grass instanceâs ...
  - `scaling`: `GrassScaling` [Read-Only] — [Read-Only] Specifies grass instance scaling type (GrassScaling)
  - `shadow_cache_invalidation_behavior`: `ShadowCacheInvalidationBehavior` [Read-Only] — [Read-Only] Control shadow invalidation behavior, in particular with respect to Virtual Shadow Maps ...
  - `start_cull_distance`: `PerPlatformInt` [Read-Only] — [Read-Only] The distance where instances will begin to fade out if using a PerInstanceFadeAmount mat...
  - `start_cull_distance_quality`: `PerQualityLevelInt` [Read-Only] — [Read-Only] (PerQualityLevelInt)
  - `use_grid`: `bool` [Read-Only] — [Read-Only] If true, use a jittered grid sequence for placement, otherwise use a halton sequence. (b...
  - `use_landscape_lightmap`: `bool` [Read-Only] — [Read-Only] Whether to use the landscapeâs lightmap when rendering the grass. (bool)
  - `weight_attenuates_max_scale`: `bool` [Read-Only] — [Read-Only] If enabled the the scale of instances is reduced as the weight (density) decreases (bool...

### `unreal.LandscapeBrushParameters`
Inherits: `StructBase` | Header: `LandscapeBlueprintBrushBase.h`

Landscape Brush Parameters

**Properties** (5):
  - `combined_result`: `TextureRenderTarget2D` — [Read-Write] (TextureRenderTarget2D)
  - `layer_type`: `LandscapeToolTargetType` — [Read-Write] (LandscapeToolTargetType)
  - `render_area_size`: `IntPoint` — [Read-Write] (IntPoint)
  - `render_area_world_transform`: `Transform` — [Read-Write] (Transform)
  - `weightmap_layer_name`: `Name` — [Read-Write] (Name)

### `unreal.LandscapePerLODMaterialOverride`
Inherits: `StructBase` | Header: `LandscapeComponent.h`

Landscape Per LODMaterial Override

### `unreal.LandscapeSplineMeshEntry`
Inherits: `StructBase` | Header: `LandscapeSplineSegment.h`

Landscape Spline Mesh Entry

### `unreal.LandscapeSplineSegmentConnection`
Inherits: `StructBase` | Header: `LandscapeSplineSegment.h`

Landscape Spline Segment Connection

### `unreal.LandscapeTargetLayerSettings`
Inherits: `StructBase` | Header: `LandscapeProxy.h`

Landscape Target Layer Settings

### `unreal.LayerBlendInput`
Inherits: `StructBase` | Header: `MaterialExpressionLandscapeLayerBlend.h`

Layer Blend Input

### `unreal.PhysicalMaterialInput`
Inherits: `StructBase` | Header: `MaterialExpressionLandscapePhysicalMaterialOutput.h`

Structure linking a material expression input with a physical material. For use by UMaterialExpressionLandscapePhysicalMaterialOutput.

### `unreal.ControlPointMeshActor`
Inherits: `Actor` | Header: `ControlPointMeshActor.h`

ControlPointMeshActor is an actor with a ControlPointMeshComponent. see: UControlPointMeshComponent

**Properties** (1):
  - `control_point_mesh_component`: `ControlPointMeshComponent` [Read-Only] — [Read-Only] (ControlPointMeshComponent)

### `unreal.ControlPointMeshComponent`
Inherits: `StaticMeshComponent` | Header: `ControlPointMeshComponent.h`

Control Point Mesh Component

### `unreal.Landscape`
Inherits: `LandscapeProxy` | Header: `Landscape.h`

**Methods** (5):
  - `force_layers_full_update()` -> `None` — Force Layers Full Update
  - `get_target_layer_names(include_visibility_layer = False)` -> `Array [ Name ]` — Retrieves the names of valid paint layers on this landscape (editor-only : returns nothing at runtime)
  - `render_heightmap(world_transform, extents, out_render_target)` -> `bool`
  - `render_weightmap(world_transform, extents, weightmap_layer_name, out_render_target)` -> `bool`
  - `render_weightmaps(world_transform, extents, weightmap_layer_names, out_render_target)` -> `bool`

### `unreal.LandscapeBlueprintBrushBase`
Inherits: `Actor` | Header: `LandscapeBlueprintBrushBase.h`

Landscape Blueprint Brush Base

**Methods** (5):
  - `get_blueprint_render_dependencies()` -> `Array [ Object ]` — Get Blueprint Render Dependencies
  - `initialize(landscape_transform, landscape_size, landscape_render_target_size)` -> `None` — Initialize
  - `render(is_heightmap, combined_result, weightmap_layer_name)` -> `TextureRenderTarget2D` — Render deprecated: Please use RenderLayer instead.
  - `render_layer(parameters)` -> `TextureRenderTarget2D` — Render Layer
  - `request_landscape_update(user_triggered = False)` -> `None` — Request Landscape Update

**Properties** (6):
  - `affect_heightmap`: `bool` — [Read-Write] (bool)
  - `affect_visibility_layer`: `bool` — [Read-Write] (bool)
  - `affect_weightmap`: `bool` — [Read-Write] (bool)
  - `affected_weightmap_layers`: `None` — [Read-Write] (Array[Name])
  - `update_on_property_change`: `bool` — [Read-Write] (bool)
  - `use_power_of_two_render_target`: `bool` — [Read-Write] It is possible to define whether this BP brush works exclusively with power-of-2 render...

### `unreal.LandscapeComponent`
Inherits: `PrimitiveComponent` | Header: `LandscapeComponent.h`

Landscape Component

**Methods** (5):
  - `editor_get_paint_layer_weight_at_location(location, paint_layer)` -> `float` — Gets the landscape paint layer weight value at the given position using LandscapeLayerInfo . Returns 0 in case it fails.
  - `editor_get_paint_layer_weight_by_name_at_location(location, paint_layer_name)` -> `float` — Gets the landscape paint layer weight value at the given position using layer name. Returns 0 in case it fails.
  - `get_material_instance_dynamic(index)` -> `MaterialInstanceDynamic` — Gets the landscape material instance dynamic for this component
  - `set_forced_lod(forced_lod)` -> `None` — Set Forced LOD
  - `set_lod_bias(lod_bias)` -> `None` — Set LODBias

**Properties** (6):
  - `forced_lod`: `int` [Read-Only] — [Read-Only] Forced LOD level to use when rendering (int32)
  - `lod_bias`: `int` [Read-Only] — [Read-Only] LOD level Bias to use when rendering (int32)
  - `override_hole_material`: `MaterialInterface` — [Read-Write] (MaterialInterface)
  - `override_material`: `MaterialInterface` — [Read-Write] (MaterialInterface)
  - `section_base_x`: `int` [Read-Only] — [Read-Only] X offset from global components grid origin (in quads) (int32)
  - `section_base_y`: `int` [Read-Only] — [Read-Only] Y offset from global components grid origin (in quads) (int32)

### `unreal.LandscapeGizmoActiveActor`
Inherits: `LandscapeGizmoActor` | Header: `LandscapeGizmoActiveActor.h`

Landscape Gizmo Active Actor

### `unreal.LandscapeGizmoActor`
Inherits: `Actor` | Header: `LandscapeGizmoActor.h`

Landscape Gizmo Actor

### `unreal.LandscapeGizmoRenderComponent`
Inherits: `PrimitiveComponent` | Header: `LandscapeGizmoRenderComponent.h`

Landscape Gizmo Render Component

### `unreal.LandscapeGrassType`
Inherits: `Object` | Header: `LandscapeGrassType.h`

Landscape Grass Type

**Properties** (2):
  - `enable_density_scaling`: `bool` [Read-Only] — [Read-Only] Whether this grass type should be affected by the Engine Scalability systemâs Foliage ...
  - `grass_varieties`: `None` [Read-Only] — [Read-Only] (Array[GrassVariety])

### `unreal.LandscapeHeightfieldCollisionComponent`
Inherits: `PrimitiveComponent` | Header: `LandscapeHeightfieldCollisionComponent.h`

Landscape Heightfield Collision Component

**Methods** (1):
  - `get_render_component()` -> `LandscapeComponent` — Returns associated landscape component

### `unreal.LandscapeInfo`
Inherits: `Object` | Header: `LandscapeInfo.h`

Landscape Info

### `unreal.LandscapeLayerInfoObject`
Inherits: `Object` | Header: `LandscapeLayerInfoObject.h`

Landscape Layer Info Object

### `unreal.LandscapeLODStreamingProxy_DEPRECATED`
Inherits: `StreamableRenderAsset` | Header: `LandscapeComponent.h`

Landscape LODStreaming Proxy DEPRECATED

### `unreal.LandscapeMaterialInstanceConstant`
Inherits: `MaterialInstanceConstant` | Header: `LandscapeMaterialInstanceConstant.h`

Landscape Material Instance Constant

### `unreal.LandscapeMeshCollisionComponent`
Inherits: `LandscapeHeightfieldCollisionComponent` | Header: `LandscapeMeshCollisionComponent.h`

Landscape Mesh Collision Component

### `unreal.LandscapeMeshProxyActor`
Inherits: `Actor` | Header: `LandscapeMeshProxyActor.h`

Landscape Mesh Proxy Actor

**Properties** (1):
  - `landscape_mesh_proxy_component`: `LandscapeMeshProxyComponent` [Read-Only] — [Read-Only] (LandscapeMeshProxyComponent)

### `unreal.LandscapeMeshProxyComponent`
Inherits: `StaticMeshComponent` | Header: `LandscapeMeshProxyComponent.h`

Landscape Mesh Proxy Component

### `unreal.LandscapeNaniteComponent`
Inherits: `StaticMeshComponent` | Header: `LandscapeNaniteComponent.h`

Landscape Nanite Component

### `unreal.LandscapeProxy`
Inherits: `PartitionActor` | Header: `LandscapeProxy.h`

Landscape Proxy

**Methods** (12):
  - `change_component_screen_size_to_use_sub_sections(component_screen_size_to_use_sub_sections)` -> `None` — Change Component Screen Size to Use Sub Sections deprecated: This value canât be changed anymore and has been ineffect...
  - `change_lod_distance_factor(lod_distance_factor)` -> `None` — Change the Level of Detail distance factor deprecated: This value canât be changed anymore, you should edit the proper...
  - `delete_unused_layers()` -> `None` — Delete all unused layers in components. Warning: any update of the component could re-introduce them.
  - `editor_apply_spline(spline_component, start_width = 200.000000, end_width = 200.000000, start_side_falloff = 200.000000, end_side_falloff = 200.000000, start_roll = 0.000000, end_roll = 0.000000, num_subdivisions = 20, raise_heights = True, lower_heights = True, paint_layer = None, edit_layer_name = 'None')` -> `None` — Deform landscape using a given spline
  - `get_landscape_actor()` -> `Landscape` — Get Landscape Actor
  - `landscape_export_heightmap_to_render_target(render_target, export_height_into_rg_channel = False, export_landscape_proxies = True)` -> `bool` — Output a landscape heightmap to a render target
  - `landscape_export_weightmap_to_render_target(render_target, layer_name)` -> `bool` — Output a landscape weightmap to a render target Only works in the editor
  - `landscape_import_heightmap_from_render_target(render_target, import_height_from_rg_channel = False)` -> `bool` — Overwrites a landscape heightmap with render target data
  - `landscape_import_weightmap_from_render_target(render_target, layer_name)` -> `bool` — Overwrites a landscape weightmap with render target data Only works in the editor
  - `set_landscape_material_scalar_parameter_value(parameter_name, value)` -> `None` — Set a MID scalar (float) parameter value for all landscape components.
  - `set_landscape_material_texture_parameter_value(parameter_name, value)` -> `None` — Set an MID texture parameter value for all landscape components.
  - `set_landscape_material_vector_parameter_value(parameter_name, value)` -> `None` — Set an MID vector parameter value for all landscape components.

**Properties** (27):
  - `affect_distance_field_lighting`: `bool` [Read-Only] — [Read-Only] Controls whether the primitive should affect dynamic distance field lighting methods.  T...
  - `affect_dynamic_indirect_lighting`: `bool` [Read-Only] — [Read-Only] Controls whether the primitive should influence indirect lighting. (bool)
  - `affect_indirect_lighting_while_hidden`: `bool` [Read-Only] — [Read-Only] Controls whether the primitive should affect indirect lighting when hidden. This flag is...
  - `body_instance`: `BodyInstance` [Read-Only] — [Read-Only] Collision profile settings for this landscape (BodyInstance)
  - `cast_contact_shadow`: `bool` [Read-Only] — [Read-Only] Whether the object should cast contact shadows. This flag is only used if CastShadow is ...
  - `cast_dynamic_shadow`: `bool` [Read-Only] — [Read-Only] Controls whether the primitive should cast shadows in the case of non precomputed shadow...
  - `cast_far_shadow`: `bool` [Read-Only] — [Read-Only] When enabled, the component will be rendering into the far shadow cascades(only for dire...
  - `cast_hidden_shadow`: `bool` [Read-Only] — [Read-Only] If true, the primitive will cast shadows even if bHidden is true.  Controls whether the ...
  - `cast_shadow`: `bool` [Read-Only] — [Read-Only] Controls whether the primitive component should cast a shadow or not. (bool)
  - `cast_shadow_as_two_sided`: `bool` [Read-Only] — [Read-Only] Whether this primitive should cast dynamic shadows as if it were a two sided material.  ...
  - `cast_static_shadow`: `bool` [Read-Only] — [Read-Only] Whether the object should cast a static shadow from shadow casting lights.  This flag is...
  - `custom_depth_stencil_value`: `int` [Read-Only] — [Read-Only] Optionally write this 0-255 value to the stencil buffer in CustomDepth pass (Requires pr...
  - `custom_depth_stencil_write_mask`: `RendererStencilMask` [Read-Only] — [Read-Only] Mask used for stencil buffer writes. (RendererStencilMask)
  - `enable_nanite`: `bool` [Read-Only] — [Read-Only] Use Nanite to render landscape as a mesh on supported platforms. (bool)
  - `generate_overlap_events`: `bool` [Read-Only] — [Read-Only] If true, Landscape will generate overlap events when other components are overlapping it...
  - `holdout`: `bool` — [Read-Write] If this is True, this primitive will render black with an alpha of 0, but all secondary...
  - `landscape_material`: `MaterialInterface` — [Read-Write] Combined material used to render the landscape (MaterialInterface)
  - `ld_max_draw_distance`: `float` [Read-Only] — [Read-Only] Max draw distance exposed to LDs. The real max draw distance is the min (disregarding 0)...
  - `lighting_channels`: `LightingChannels` [Read-Only] — [Read-Only] Channels that this Landscape should be in.  Lights with matching channels will affect th...
  - `render_custom_depth`: `bool` [Read-Only] — [Read-Only] If true, the Landscape will be rendered in the CustomDepth pass (usually used for outlin...
  - `runtime_virtual_textures`: `None` — [Read-Write] Array of runtime virtual textures into which we draw this landscape.
The material also ...
  - `shadow_cache_invalidation_behavior`: `ShadowCacheInvalidationBehavior` [Read-Only] — [Read-Only] Control shadow invalidation behavior, in particular with respect to Virtual Shadow Maps ...
  - `virtual_texture_lod_bias`: `int` [Read-Only] — [Read-Only] Bias to the LOD selected for rendering to runtime virtual textures.
Higher values reduce...
  - `virtual_texture_num_lods`: `int` [Read-Only] — [Read-Only] Number of mesh levels to use when rendering landscape into runtime virtual texture.
Lowe...
  - `virtual_texture_render_pass_type`: `RuntimeVirtualTextureMainPassType` — [Read-Write] Controls if this component draws in the main pass as well as in the virtual texture. (R...
  - `virtual_texture_render_with_quad`: `bool` [Read-Only] — [Read-Only] Use a single quad to render this landscape to runtime virtual texture pages.
This is the...
  - `virtual_texture_render_with_quad_hq`: `bool` [Read-Only] — [Read-Only] Use highest quality heightmap interpolation when using a single quad to render this land...

### `unreal.LandscapeSplineActor`
Inherits: `Actor` | Header: `LandscapeSplineActor.h`

Landscape Spline Actor

### `unreal.LandscapeSplineControlPoint`
Inherits: `Object` | Header: `LandscapeSplineControlPoint.h`

Landscape Spline Control Point

**Properties** (1):
  - `body_instance`: `BodyInstance` [Read-Only] — [Read-Only] Mesh Collision Settings (BodyInstance)

### `unreal.LandscapeSplineMeshesActor`
Inherits: `PartitionActor` | Header: `LandscapeSplineMeshesActor.h`

This class is only intended to be used by UWorldPartitionLandscapeSplineMeshesBuilder which extracts and clones landscape spline and control point static meshes into partitioned actors

**Properties** (1):
  - `static_mesh_components`: `None` [Read-Only] — [Read-Only] (Array[StaticMeshComponent])

### `unreal.LandscapeSplinesComponent`
Inherits: `PrimitiveComponent` | Header: `LandscapeSplinesComponent.h`

ULandscapeSplinesComponent

**Methods** (1):
  - `get_spline_mesh_components()` -> `Array [ SplineMeshComponent ]` — Get a list of spline mesh components representing this landscape spline (Editor only)

### `unreal.LandscapeSplineSegment`
Inherits: `Object` | Header: `LandscapeSplineSegment.h`

Landscape Spline Segment

**Properties** (1):
  - `body_instance`: `BodyInstance` [Read-Only] — [Read-Only] Mesh Collision Settings (BodyInstance)

### `unreal.LandscapeStreamingProxy`
Inherits: `LandscapeProxy` | Header: `LandscapeStreamingProxy.h`

Landscape Streaming Proxy

### `unreal.MaterialExpressionLandscapeGrassOutput`
Inherits: `MaterialExpressionCustomOutput` | Header: `MaterialExpressionLandscapeGrassOutput.h`

Material Expression Landscape Grass Output

### `unreal.MaterialExpressionLandscapeLayerBlend`
Inherits: `MaterialExpression` | Header: `MaterialExpressionLandscapeLayerBlend.h`

Material Expression Landscape Layer Blend

### `unreal.MaterialExpressionLandscapeLayerCoords`
Inherits: `MaterialExpression` | Header: `MaterialExpressionLandscapeLayerCoords.h`

Material Expression Landscape Layer Coords

### `unreal.MaterialExpressionLandscapeLayerSample`
Inherits: `MaterialExpression` | Header: `MaterialExpressionLandscapeLayerSample.h`

Material Expression Landscape Layer Sample

### `unreal.MaterialExpressionLandscapeLayerSwitch`
Inherits: `MaterialExpression` | Header: `MaterialExpressionLandscapeLayerSwitch.h`

Material Expression Landscape Layer Switch

### `unreal.MaterialExpressionLandscapeLayerWeight`
Inherits: `MaterialExpression` | Header: `MaterialExpressionLandscapeLayerWeight.h`

Material Expression Landscape Layer Weight

### `unreal.MaterialExpressionLandscapePhysicalMaterialOutput`
Inherits: `MaterialExpressionCustomOutput` | Header: `MaterialExpressionLandscapePhysicalMaterialOutput.h`

Custom output node to write out physical material weights. This can be used to generate the dominant physical material for each point on a landscape. Note that the use of a material output node to gen...

### `unreal.MaterialExpressionLandscapeVisibilityMask`
Inherits: `MaterialExpression` | Header: `MaterialExpressionLandscapeVisibilityMask.h`

Material Expression Landscape Visibility Mask

### `unreal.GrassScaling`
Inherits: `EnumBase` | Header: `LandscapeGrassType.h`

EGrass Scaling

**Properties** (3):
  - `FREE`: `GrassScaling = Ellipsis` — Grass instances will have random X, Y and Z scales. 1
  - `LOCK_XY`: `GrassScaling = Ellipsis` — X and Y will be the same random scale, Z will be another 2
  - `UNIFORM`: `GrassScaling = Ellipsis` — Grass instances will have uniform X, Y and Z scales. 0

### `unreal.LandscapeCustomizedCoordType`
Inherits: `EnumBase` | Header: `MaterialExpressionLandscapeLayerCoords.h`

ELandscape Customized Coord Type

**Properties** (5):
  - `LCCT_CUSTOM_UV0`: `LandscapeCustomizedCoordType = Ellipsis` — 1
  - `LCCT_CUSTOM_UV1`: `LandscapeCustomizedCoordType = Ellipsis` — 2
  - `LCCT_CUSTOM_UV2`: `LandscapeCustomizedCoordType = Ellipsis` — 3
  - `LCCT_NONE`: `LandscapeCustomizedCoordType = Ellipsis` — Donât use customized UV, just use original UV. 0
  - `LCCT_WEIGHT_MAP_UV`: `LandscapeCustomizedCoordType = Ellipsis` — Use original WeightMapUV, which could not be customized. 4

### `unreal.LandscapeHLODMeshSourceLODPolicy`
Inherits: `EnumBase` | Header: `LandscapeProxy.h`

ELandscape HLODMesh Source LODPolicy

**Properties** (3):
  - `AUTOMATIC_LOD`: `LandscapeHLODMeshSourceLODPolicy = Ellipsis` — Automatic LOD selection, based on the expected HLOD draw distance and the landscape LOD Distribution...
  - `LOWEST_DETAIL_LOD`: `LandscapeHLODMeshSourceLODPolicy = Ellipsis` — Use the lowest detailed LOD of this landscape. 2
  - `SPECIFIC_LOD`: `LandscapeHLODMeshSourceLODPolicy = Ellipsis` — User specified landscape LOD. 1

### `unreal.LandscapeHLODTextureSizePolicy`
Inherits: `EnumBase` | Header: `LandscapeProxy.h`

ELandscape HLODTexture Size Policy

**Properties** (2):
  - `AUTOMATIC_SIZE`: `LandscapeHLODTextureSizePolicy = Ellipsis` — Automatic texture size, based on the expected HLOD draw distance and the landscape size. 0
  - `SPECIFIC_SIZE`: `LandscapeHLODTextureSizePolicy = Ellipsis` — User specified texture size. 1

### `unreal.LandscapeLayerBlendType`
Inherits: `EnumBase` | Header: `MaterialExpressionLandscapeLayerBlend.h`

ELandscape Layer Blend Type

**Properties** (3):
  - `LB_ALPHA_BLEND`: `LandscapeLayerBlendType = Ellipsis` — 1
  - `LB_HEIGHT_BLEND`: `LandscapeLayerBlendType = Ellipsis` — 2
  - `LB_WEIGHT_BLEND`: `LandscapeLayerBlendType = Ellipsis` — 0

### `unreal.LandscapeToolTargetType`
Inherits: `EnumBase` | Header: `LandscapeEditTypes.h`

ELandscape Tool Target Type

**Properties** (3):
  - `HEIGHTMAP`: `LandscapeToolTargetType = Ellipsis` — 0
  - `VISIBILITY`: `LandscapeToolTargetType = Ellipsis` — 2
  - `WEIGHTMAP`: `LandscapeToolTargetType = Ellipsis` — 1

### `unreal.SplineModulationColorMask`
Inherits: `EnumBase` | Header: `LandscapeLayerInfoObject.h`

ESpline Modulation Color Mask

**Properties** (4):
  - `ALPHA`: `SplineModulationColorMask = Ellipsis` — 3
  - `BLUE`: `SplineModulationColorMask = Ellipsis` — 2
  - `GREEN`: `SplineModulationColorMask = Ellipsis` — 1
  - `RED`: `SplineModulationColorMask = Ellipsis` — 0

### `unreal.TerrainCoordMappingType`
Inherits: `EnumBase` | Header: `MaterialExpressionLandscapeLayerCoords.h`

ETerrain Coord Mapping Type

**Properties** (4):
  - `TCMT_AUTO`: `TerrainCoordMappingType = Ellipsis` — 0
  - `TCMT_XY`: `TerrainCoordMappingType = Ellipsis` — 1
  - `TCMT_XZ`: `TerrainCoordMappingType = Ellipsis` — 2
  - `TCMT_YZ`: `TerrainCoordMappingType = Ellipsis` — 3
