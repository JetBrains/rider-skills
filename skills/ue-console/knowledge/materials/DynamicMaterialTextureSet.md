# UE Python API — DynamicMaterialTextureSet Module

**4 types** from the `DynamicMaterialTextureSet` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DMMaterialTexture`, `DMTextureSet`, `DMTextureChannelMask`, `DMTextureSetMaterialProperty`

---

## Classes

### `unreal.DMMaterialTexture`
Inherits: `StructBase` | Header: `DMMaterialTexture.h`

DMMaterial Texture

**Properties** (2):
  - `texture`: `Texture` — [Read-Write] (Texture)
  - `texture_channel`: `DMTextureChannelMask` — [Read-Write] (DMTextureChannelMask)

### `unreal.DMTextureSet`
Inherits: `Object` | Header: `DMTextureSet.h`

DMTexture Set

**Methods** (5):
  - `contains_texture(texture)` -> `bool` — Checks the Texture Map to see if a given Texture exists within it.
  - `get_material_texture(material_property)` -> `DMMaterialTexture or None` — Gets the Material Texture associated with a Material Property. Does not check whether a Texture is assigned to it.
  - `has_material_property(material_property)` -> `bool` — Checks whether a given Material Property exists in the Texture Map. Does not check whether that a Texture is assigned to...
  - `has_material_texture(material_property)` -> `bool` — Checks whether a given Material Property has a Texture assigned to it.
  - `set_material_texture(material_property, material_texture)` -> `None` — Sets the Material Texture for a given Material Property. Can be used to unset Textures.

**Properties** (1):
  - `textures`: `None` — [Read-Write] (Map[DMTextureSetMaterialProperty,DMMaterialTexture])

### `unreal.DMTextureChannelMask`
Inherits: `EnumBase` | Header: `DMTextureChannelMask.h`

EDMTexture Channel Mask

**Properties** (6):
  - `ALPHA`: `DMTextureChannelMask = Ellipsis` — 8
  - `BLUE`: `DMTextureChannelMask = Ellipsis` — 4
  - `GREEN`: `DMTextureChannelMask = Ellipsis` — 2
  - `RED`: `DMTextureChannelMask = Ellipsis` — 1
  - `RGB`: `DMTextureChannelMask = Ellipsis` — 7
  - `RGBA`: `DMTextureChannelMask = Ellipsis` — 15

### `unreal.DMTextureSetMaterialProperty`
Inherits: `EnumBase` | Header: `DMTextureSetMaterialProperty.h`

Copying the values from EMaterialProperty to change required meta data, such as DisplayName and Hidden.

**Properties** (17):
  - `AMBIENT_OCCLUSION`: `DMTextureSetMaterialProperty = Ellipsis` — 18
  - `ANISOTROPY`: `DMTextureSetMaterialProperty = Ellipsis` — 9
  - `BASE_COLOR`: `DMTextureSetMaterialProperty = Ellipsis` — 5
  - `DISPLACEMENT`: `DMTextureSetMaterialProperty = Ellipsis` — 32
  - `EMISSIVE_COLOR`: `DMTextureSetMaterialProperty = Ellipsis` — 0
  - `METALLIC`: `DMTextureSetMaterialProperty = Ellipsis` — 6
  - `NORMAL`: `DMTextureSetMaterialProperty = Ellipsis` — 10
  - `OPACITY`: `DMTextureSetMaterialProperty = Ellipsis` — 1
  - `OPACITY_MASK`: `DMTextureSetMaterialProperty = Ellipsis` — 2
  - `PIXEL_DEPTH_OFFSET`: `DMTextureSetMaterialProperty = Ellipsis` — 28
  - `REFRACTION`: `DMTextureSetMaterialProperty = Ellipsis` — 19
  - `ROUGHNESS`: `DMTextureSetMaterialProperty = Ellipsis` — 8
  - `SPECULAR`: `DMTextureSetMaterialProperty = Ellipsis` — 7
  - `SUBSURFACE_COLOR`: `DMTextureSetMaterialProperty = Ellipsis` — 15
  - `SURFACE_THICKNESS`: `DMTextureSetMaterialProperty = Ellipsis` — 31
  - `TANGENT`: `DMTextureSetMaterialProperty = Ellipsis` — 11
  - `WORLD_POSITION_OFFSET`: `DMTextureSetMaterialProperty = Ellipsis` — 12
