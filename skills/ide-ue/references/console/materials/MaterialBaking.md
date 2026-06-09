# UE Python API — MaterialBaking Module

**4 types** from the `MaterialBaking` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `PropertyEntry`, `AssetBakeOptions`, `MaterialMergeOptions`, `MaterialOptions`

---

## Classes

### `unreal.PropertyEntry`
Inherits: `StructBase` | Header: `MaterialOptions.h`

Structure to represent a single property the user wants to bake out for a given set of materials

**Properties** (5):
  - `constant_value`: `float` — [Read-Write] Defines the value representing this property in the final proxy material (float)
  - `custom_size`: `IntPoint` — [Read-Write] Defines the size of the output textures for the baked out material properties (IntPoint...
  - `property_`: `MaterialProperty` — [Read-Write] Property which should be baked out (MaterialProperty)
  - `use_constant_value`: `bool` — [Read-Write] Wheter or not to use Constant Value as the final âbaked outâ value for the this pro...
  - `use_custom_size`: `bool` — [Read-Write] Whether or not to use the value of custom size for the output texture (bool)

### `unreal.AssetBakeOptions`
Inherits: `Object` | Header: `MaterialOptions.h`

Asset bake options object

### `unreal.MaterialMergeOptions`
Inherits: `Object` | Header: `MaterialOptions.h`

Material merge options object

**Properties** (1):
  - `blend_mode`: `BlendMode` — [Read-Write] Blend mode for the final proxy material(s) (BlendMode)

### `unreal.MaterialOptions`
Inherits: `Object` | Header: `MaterialOptions.h`

Options object to define what and how a material should be baked out

**Properties** (6):
  - `lod_indices`: `None` — [Read-Write] LOD indices for which the materials should be baked out (Array[int32])
  - `properties`: `None` — [Read-Write] Properties which are supposed to be baked out for the material(s) (Array[PropertyEntry]...
  - `texture_coordinate_index`: `int` — [Read-Write] Specific texture coordinate which should be used to while baking out material propertie...
  - `texture_size`: `IntPoint` — [Read-Write] Size of the final texture(s) containing the baked out property data (IntPoint)
  - `use_mesh_data`: `bool` — [Read-Write] Determines whether to not allow usage of the source mesh data while baking out material...
  - `use_specific_uv_index`: `bool` — [Read-Write] Flag whether or not the value of TextureCoordinateIndex should be used while baking out...
