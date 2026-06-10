# UE Python API — BlueprintMaterialTextureNodes Module

**1 types** from the `BlueprintMaterialTextureNodes` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `BlueprintMaterialTextureNodesBPLibrary`

---

## Classes

### `unreal.BlueprintMaterialTextureNodesBPLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `BlueprintMaterialTextureNodesBPLibrary.h`

Function library class. Each function in it is expected to be static and represents blueprint node that can be called in any blueprint. When declaring function you can define metadata for the node. Ke...

**Methods** (12):
  - `create_mic_editor_only(material, name = 'MIC_')` -> `MaterialInstanceConstant` [classmethod] — Creates a new Material Instance Constant asset Only works in the editor
  - `render_target_sample_rectangle_editor_only(render_target, rect)` -> `Array [ LinearColor ]` [classmethod] — Samples an array of values from a Texture Render Target 2D. Currently only 4 channel formats are supported. Only works i...
  - `render_target_sample_uv_editor_only(render_target, uv)` -> `LinearColor` [classmethod] — Samples a value from a Texture Render Target 2D. Currently only 4 channel formats are supported. Only works in the edito...
  - `set_mic_blend_mode_editor_only(material, blend_mode = BlendMode.BLEND_OPAQUE)` -> `bool` [classmethod] — Overrides the Blend Mode of a Material Instance Constant Only works in the editor
  - `set_mic_dithered_lod_transition_editor_only(material, dithered_lod_transition = False)` -> `bool` [classmethod] — Overrides the Blend Mode of a Material Instance Constant Only works in the editor
  - `set_mic_is_thin_surface_editor_only(material, is_thin_surface = False)` -> `bool` [classmethod] — Overrides the IsThinSurface setting of a Material Instance Constant Only works in the editor
  - `set_mic_scalar_param_editor_only(material, param_name = 'test', value = 0.000000)` -> `bool` [classmethod] — Sets a Scalar Parameter value in a Material Instance Constant Only works in the editor
  - `set_mic_shading_model_editor_only(material, shading_model = MaterialShadingModel.MSM_DEFAULT_LIT)` -> `bool` [classmethod] — Overrides the Shading Model of a Material Instance Constant Only works in the editor
  - `set_mic_texture_param_editor_only(material, param_name, texture = None)` -> `bool` [classmethod] — Sets a Texture Parameter value in a Material Instance Constant Only works in the editor
  - `set_mic_two_sided_editor_only(material, two_sided = False)` -> `bool` [classmethod] — Overrides the Two Sided setting of a Material Instance Constant Only works in the editor
  - `set_mic_vector_param_editor_only(material, param_name, value = [0.000000,0.000000,0.000000,0.000000])` -> `bool` [classmethod] — Sets a Vector Parameter value in a Material Instance Constant Only works in the editor
  - `texture2d_sample_uv_editor_only(texture, uv)` -> `LinearColor` [classmethod] — Samples a texel from a Texture 2D with VectorDisplacement Compression
