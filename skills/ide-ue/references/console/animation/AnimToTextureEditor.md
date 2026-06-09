# UE Python API — AnimToTextureEditor Module

**1 types** from the `AnimToTextureEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimToTextureBPLibrary`

---

## Classes

### `unreal.AnimToTextureBPLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AnimToTextureBPLibrary.h`

Converts a series of animation frames into a Vertex Animation Texture (VAT)

**Methods** (4):
  - `animation_to_texture(data_asset)` -> `bool` [classmethod] — Bakes Animation Data into Textures.
  - `convert_skeletal_mesh_to_static_mesh(skeletal_mesh, package_name, lod_index = -1)` -> `StaticMesh` [classmethod] — Utility for converting SkeletalMesh into a StaticMesh
  - `set_light_map_index(static_mesh, lod_index, lightmap_index = 1, generate_lightmap_u_vs = True)` -> `bool` [classmethod] — Utility for setting a StaticMesh LightMapIndex.
  - `update_material_instance_from_data_asset(data_asset, material_instance, material_parameter_association = MaterialParameterAssociation.LAYER_PARAMETER)` -> `None` [classmethod] — Updates a materialâs parameters to match those of an AnimToTexture DataAsset
