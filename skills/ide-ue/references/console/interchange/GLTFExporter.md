# UE Python API — GLTFExporter Module

**18 types** from the `GLTFExporter` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `GLTFExportMessages`, `GLTFMaterialBakeSize`, `GLTFOverrideMaterialBakeSettings`, `GLTFAnimSequenceExporter`, `GLTFExporter`, `GLTFExportOptions`, `GLTFLevelExporter`, `GLTFLevelSequenceExporter`, `GLTFLevelVariantSetsExporter`, `GLTFMaterialExporter`, `GLTFMaterialExportOptions`, `GLTFProxyOptions`, `GLTFSkeletalMeshExporter`, `GLTFStaticMeshExporter`, `GLTFMaterialBakeMode`, `GLTFMaterialPropertyGroup`, `GLTFMaterialVariantMode`, `GLTFTextureImageFormat`

---

## Classes

### `unreal.GLTFExportMessages`
Inherits: `StructBase` | Header: `GLTFExporter.h`

GLTFExport Messages

**Properties** (3):
  - `errors`: `None` — [Read-Write] (Array[str])
  - `suggestions`: `None` — [Read-Write] (Array[str])
  - `warnings`: `None` — [Read-Write] (Array[str])

### `unreal.GLTFMaterialBakeSize`
Inherits: `StructBase` | Header: `GLTFMaterialUserData.h`

GLTFMaterial Bake Size

**Properties** (3):
  - `auto_detect`: `bool` — [Read-Write] If enabled, bake size is based on the largest texture used in the material inputâs ex...
  - `x`: `int` — [Read-Write] (int32)
  - `y`: `int` — [Read-Write] (int32)

### `unreal.GLTFOverrideMaterialBakeSettings`
Inherits: `StructBase` | Header: `GLTFMaterialUserData.h`

GLTFOverride Material Bake Settings

**Properties** (6):
  - `filter`: `TextureFilter` — [Read-Write] Overrides the default filtering mode used when sampling the baked out texture. (Texture...
  - `override_filter`: `bool` — [Read-Write] If enabled, default filtering mode will be overridden by the corresponding property. (b...
  - `override_size`: `bool` — [Read-Write] If enabled, default size will be overridden by the corresponding property. (bool)
  - `override_tiling`: `bool` — [Read-Write] If enabled, default addressing mode will be overridden by the corresponding property. (...
  - `size`: `GLTFMaterialBakeSize` — [Read-Write] Overrides default size of the baked out texture. (GLTFMaterialBakeSize)
  - `tiling`: `TextureAddress` — [Read-Write] Overrides the default addressing mode used when sampling the baked out texture. (Textur...

### `unreal.GLTFAnimSequenceExporter`
Inherits: `GLTFExporter` | Header: `GLTFAnimSequenceExporter.h`

GLTFAnim Sequence Exporter

### `unreal.GLTFExporter`
Inherits: `Exporter` | Header: `GLTFExporter.h`

**Methods** (1):
  - `export_to_gltf(object, file_path, options, selected_actors)` -> `GLTFExportMessages or None` [classmethod] — Export the specified object to a glTF file (.gltf or .glb)

### `unreal.GLTFExportOptions`
Inherits: `Object` | Header: `GLTFExportOptions.h`

GLTFExport Options

**Methods** (1):
  - `reset_to_default()` -> `None` — Reset to Default

**Properties** (34):
  - `adjust_normalmaps`: `bool` — [Read-Write] If enabled, exported normalmaps will be adjusted from Unreal to glTF convention (i.e. t...
  - `bake_material_inputs`: `GLTFMaterialBakeMode` — [Read-Write] Bake mode determining if and how a material input is baked out to a texture. Baking is ...
  - `default_input_bake_settings`: `None` — [Read-Write] Input-specific default bake settings that override the general defaults above. (Map[GLT...
  - `default_level_of_detail`: `int` — [Read-Write] Default LOD level used for exporting a mesh. Can be overridden by component or asset se...
  - `default_material_bake_filter`: `TextureFilter` — [Read-Write] Default filtering mode used when sampling the baked out texture. Can be overridden by m...
  - `default_material_bake_size`: `GLTFMaterialBakeSize` — [Read-Write] Default size of the baked out texture (containing the material input). Can be overridde...
  - `default_material_bake_tiling`: `TextureAddress` — [Read-Write] Default addressing mode used when sampling the baked out texture. Can be overridden by ...
  - `export_animation_sequences`: `bool` — [Read-Write] If enabled, export single animation asset used by a skeletal mesh component. Export of ...
  - `export_cameras`: `bool` — [Read-Write] If enabled, export camera components. (bool)
  - `export_clear_coat_materials`: `bool` — [Read-Write] If enabled, materials with shading model clear coat will be properly exported. Uses ext...
  - `export_cloth_materials`: `bool` — [Read-Write] If enabled, materials with shading model cloth will be properly exported. Uses extensio...
  - `export_emissive_strength`: `bool` — [Read-Write] If enabled, allows materials to have an emissive factor that exceeds the standard range...
  - `export_hidden_in_game`: `bool` — [Read-Write] If enabled, export actors and components that are flagged as hidden in-game. (bool)
  - `export_level_sequences`: `bool` — [Read-Write] If enabled, export level sequences. Only transform tracks are currently supported. The ...
  - `export_lightmaps`: `bool` — [Read-Write] If enabled, export lightmaps (created by Lightmass) when exporting a level. Uses extens...
  - `export_lights`: `bool` — [Read-Write] If enabled, export directional, point, and spot light components. Uses extension KHR_li...
  - `export_material_variants`: `GLTFMaterialVariantMode` — [Read-Write] Mode determining if and how to export material variants that change the materials prope...
  - `export_preview_mesh`: `bool` — [Read-Write] If enabled, the preview mesh for a standalone animation or material asset will also be ...
  - `export_proxy_materials`: `bool` — [Read-Write] If enabled, materials that have a proxy defined in their user data, will be exported us...
  - `export_source_model`: `bool` — [Read-Write] If enabled, exports the SourceModel. If false, exports the Render Data. (bool)
  - `export_specular_glossiness_materials`: `bool` — [Read-Write] If enabled, materials using the Importerâs SpecularGlossiness material function will ...
  - `export_texture_transforms`: `bool` — [Read-Write] If enabled, export UV offset and scale/tiling used in materials. Uses extension KHR_tex...
  - `export_thin_translucent_materials`: `bool` — [Read-Write] If enabled, materials with shading model thin translucency will be exported. Export is ...
  - `export_uniform_scale`: `float` — [Read-Write] Scale factor used for exporting all assets (0.01 by default) for conversion from centim...
  - `export_unlit_materials`: `bool` — [Read-Write] If enabled, materials with shading model unlit will be properly exported. Uses extensio...
  - `export_vertex_colors`: `bool` — [Read-Write] If enabled, export vertex color. Not recommended due to vertex colors always being used...
  - `export_vertex_skin_weights`: `bool` — [Read-Write] If enabled, export vertex bone weights and indices in skeletal meshes. Necessary for an...
  - `include_copyright_notice`: `bool` — [Read-Write] If enabled, the copyright notice from project settings will be included as metadata in ...
  - `make_skinned_meshes_root`: `bool` — [Read-Write] If enabled, make skeletal meshes into root nodes to strictly comply with the glTF speci...
  - `skip_near_default_values`: `bool` — [Read-Write] If enabled, floating-point-based JSON properties that are nearly equal to their default...
  - `texture_image_format`: `GLTFTextureImageFormat` — [Read-Write] Desired image format used for exported textures. (GLTFTextureImageFormat)
  - `texture_image_quality`: `int` — [Read-Write] Level of compression used for textures exported with lossy image formats, 0 (default) o...
  - `use_importer_material_mapping`: `bool` — [Read-Write] If enabled, materials imported with the Interchange-glTF importer will be directly mapp...
  - `use_mesh_quantization`: `bool` — [Read-Write] If enabled, use quantization for vertex tangents and normals, reducing size. Requires e...

### `unreal.GLTFLevelExporter`
Inherits: `GLTFExporter` | Header: `GLTFLevelExporter.h`

GLTFLevel Exporter

### `unreal.GLTFLevelSequenceExporter`
Inherits: `GLTFExporter` | Header: `GLTFLevelSequenceExporter.h`

GLTFLevel Sequence Exporter

### `unreal.GLTFLevelVariantSetsExporter`
Inherits: `GLTFExporter` | Header: `GLTFLevelVariantSetsExporter.h`

GLTFLevel Variant Sets Exporter

### `unreal.GLTFMaterialExporter`
Inherits: `GLTFExporter` | Header: `GLTFMaterialExporter.h`

GLTFMaterial Exporter

### `unreal.GLTFMaterialExportOptions`
Inherits: `AssetUserData` | Header: `GLTFMaterialUserData.h`

glTF-specific user data that can be added to material assets to override export options

**Properties** (3):
  - `default`: `GLTFOverrideMaterialBakeSettings` — [Read-Write] Default bake settings for this material in general. (GLTFOverrideMaterialBakeSettings)
  - `inputs`: `None` — [Read-Write] Input-specific bake settings that override the defaults above. (Map[GLTFMaterialPropert...
  - `proxy`: `MaterialInterface` — [Read-Write] If assigned, export will use the proxy instead of the original material. (MaterialInter...

### `unreal.GLTFProxyOptions`
Inherits: `Object` | Header: `GLTFProxyOptions.h`

GLTFProxy Options

**Methods** (1):
  - `reset_to_default()` -> `None` — Reset to Default

**Properties** (6):
  - `bake_material_inputs`: `bool` — [Read-Write] If enabled, a material input may be baked out to a texture (using a simple quad). Bakin...
  - `default_input_bake_settings`: `None` — [Read-Write] Input-specific default bake settings that override the general defaults above. (Map[GLT...
  - `default_material_bake_filter`: `TextureFilter` — [Read-Write] Default filtering mode used when sampling the baked out texture. Can be overridden by m...
  - `default_material_bake_size`: `GLTFMaterialBakeSize` — [Read-Write] Default size of the baked out texture (containing the material input). Can be overridde...
  - `default_material_bake_tiling`: `TextureAddress` — [Read-Write] Default addressing mode used when sampling the baked out texture. Can be overridden by ...
  - `use_thin_translucent_shading_model`: `bool` — [Read-Write] If enabled, materials with shading model thin translucency will be used. Conversion is ...

### `unreal.GLTFSkeletalMeshExporter`
Inherits: `GLTFExporter` | Header: `GLTFSkeletalMeshExporter.h`

GLTFSkeletal Mesh Exporter

### `unreal.GLTFStaticMeshExporter`
Inherits: `GLTFExporter` | Header: `GLTFStaticMeshExporter.h`

GLTFStatic Mesh Exporter

### `unreal.GLTFMaterialBakeMode`
Inherits: `EnumBase` | Header: `GLTFMaterialUserData.h`

EGLTFMaterial Bake Mode

**Properties** (3):
  - `DISABLED`: `GLTFMaterialBakeMode = Ellipsis` — Never bake material inputs. 0
  - `SIMPLE`: `GLTFMaterialBakeMode = Ellipsis` — Only use a simple quad if a material input needs to be baked out. 1
  - `USE_MESH_DATA`: `GLTFMaterialBakeMode = Ellipsis` — Allow usage of the mesh data if a material input needs to be baked out with vertex data. 2

### `unreal.GLTFMaterialPropertyGroup`
Inherits: `EnumBase` | Header: `GLTFMaterialUserData.h`

EGLTFMaterial Property Group

**Properties** (8):
  - `AMBIENT_OCCLUSION`: `GLTFMaterialPropertyGroup = Ellipsis` — 5
  - `BASE_COLOR_OPACITY`: `GLTFMaterialPropertyGroup = Ellipsis` — 1
  - `CLEAR_COAT_BOTTOM_NORMAL`: `GLTFMaterialPropertyGroup = Ellipsis` — 7
  - `CLEAR_COAT_ROUGHNESS`: `GLTFMaterialPropertyGroup = Ellipsis` — 6
  - `EMISSIVE_COLOR`: `GLTFMaterialPropertyGroup = Ellipsis` — 3
  - `METALLIC_ROUGHNESS`: `GLTFMaterialPropertyGroup = Ellipsis` — 2
  - `NONE`: `GLTFMaterialPropertyGroup = Ellipsis` — 0
  - `NORMAL`: `GLTFMaterialPropertyGroup = Ellipsis` — 4

### `unreal.GLTFMaterialVariantMode`
Inherits: `EnumBase` | Header: `GLTFExportOptions.h`

EGLTFMaterial Variant Mode

**Properties** (3):
  - `NONE`: `GLTFMaterialVariantMode = Ellipsis` — Never export material variants. 0
  - `SIMPLE`: `GLTFMaterialVariantMode = Ellipsis` — Export material variants but only use a simple quad if a material input needs to be baked out. 1
  - `USE_MESH_DATA`: `GLTFMaterialVariantMode = Ellipsis` — Export material variants and allow usage of the mesh data if a material input needs to be baked out ...

### `unreal.GLTFTextureImageFormat`
Inherits: `EnumBase` | Header: `GLTFExportOptions.h`

EGLTFTexture Image Format

**Properties** (3):
  - `JPEG`: `GLTFTextureImageFormat = Ellipsis` — If texture does not have an alpha channel, use JPEG (lossy compression); otherwise fallback to PNG. ...
  - `NONE`: `GLTFTextureImageFormat = Ellipsis` — Donât export any textures. 0
  - `PNG`: `GLTFTextureImageFormat = Ellipsis` — Always use PNG (lossless compression). 1
