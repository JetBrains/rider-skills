# UE Python API — CustomizableObjectEditor Module

**29 types** from the `CustomizableObjectEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `NewCustomizableObjectParameters`, `PostEditChangePropertyDelegateParameters`, `CustomizableObjectEditorFunctionLibrary`, `CustomizableObjectFactory`, `CustomizableObjectMacroLibraryFactory`, `CustomizableObjectNode`, `CustomizableObjectNodeComponentMeshInterface`, `CustomizableObjectNodeModifierBase`, `CustomizableObjectNodeModifierClipDeform`, `CustomizableObjectNodeModifierClipMorph`, `CustomizableObjectNodeModifierClipWithMesh`, `CustomizableObjectNodeModifierClipWithUVMask`, `CustomizableObjectNodeModifierEditLayoutBlocks`, `CustomizableObjectNodeModifierEditMeshSection`, `CustomizableObjectNodeModifierEditMeshSectionBase`, `CustomizableObjectNodeModifierExtendMeshSection`, `CustomizableObjectNodeModifierMorphMeshSection`, `CustomizableObjectNodeModifierRemoveMesh`, `CustomizableObjectNodeModifierRemoveMeshBlocks`, `CustomizableObjectNodeModifierTransformInMesh`, ... (29 total)

---

## Classes

### `unreal.NewCustomizableObjectParameters`
Inherits: `StructBase` | Header: `CustomizableObjectEditorFunctionLibrary.h`

New Customizable Object Parameters

**Properties** (4):
  - `asset_name`: `str` — [Read-Write] For example âSampleAssetNameâ (str)
  - `package_path`: `str` — [Read-Write] Must not end with slash. For example â/Gameâ (str)
  - `parent_group_node`: `str` — [Read-Write] Group to attach the child Customizable Object to. Only used if ParentObject is provided...
  - `parent_object`: `CustomizableObject` — [Read-Write] Parent to attach the child Customizable Object to. (CustomizableObject)

### `unreal.PostEditChangePropertyDelegateParameters`
Inherits: `StructBase` | Header: `CustomizableObjectNode.h`

Encapsulation of parameters for the FPostEditChangePropertyDelegate delegate function.

### `unreal.CustomizableObjectEditorFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `CustomizableObjectEditorFunctionLibrary.h`

Functions we want to be able to call on CustomizableObjects at edit time - could be exposed to cook as well.

**Methods** (2):
  - `compile_customizable_object_synchronously(customizable_object, optimization_level = CustomizableObjectOptimizationLevel.NONE, texture_compression = CustomizableObjectTextureCompression.FAST, gather_references = False)` -> `CustomizableObjectCompilationState` [classmethod] — DEPRECATED. Use UCustomizableObject::Compile instead.
  - `new_customizable_object(parameters)` -> `CustomizableObject` [classmethod] — Create a new Customizable Object inside a package.

### `unreal.CustomizableObjectFactory`
Inherits: `Factory` | Header: `CustomizableObjectFactory.h`

Customizable Object Factory

### `unreal.CustomizableObjectMacroLibraryFactory`
Inherits: `Factory` | Header: `CustomizableObjectMacroLibraryFactory.h`

Customizable Object Macro Library Factory

### `unreal.CustomizableObjectNode`
Inherits: `EdGraphNode` | Header: `CustomizableObjectNode.h`

Base class of all Customizable Object nodes.

### `unreal.CustomizableObjectNodeComponentMeshInterface`
Inherits: `Interface` | Header: `CustomizableObjectNodeComponentMeshBase.h`

Customizable Object Node Component Mesh Interface

### `unreal.CustomizableObjectNodeModifierBase`
Inherits: `CustomizableObjectNode` | Header: `CustomizableObjectNodeModifierBase.h`

Customizable Object Node Modifier Base

**Properties** (1):
  - `required_tags`: `None` — [Read-Write] Materials in all other objects that activate this tags will be affected by this modifie...

### `unreal.CustomizableObjectNodeModifierClipDeform`
Inherits: `CustomizableObjectNodeModifierBase` | Header: `CustomizableObjectNodeModifierClipDeform.h`

Customizable Object Node Modifier Clip Deform

### `unreal.CustomizableObjectNodeModifierClipMorph`
Inherits: `CustomizableObjectNodeModifierBase` | Header: `CustomizableObjectNodeModifierClipMorph.h`

Customizable Object Node Modifier Clip Morph

### `unreal.CustomizableObjectNodeModifierClipWithMesh`
Inherits: `CustomizableObjectNodeModifierBase` | Header: `CustomizableObjectNodeModifierClipWithMesh.h`

Customizable Object Node Modifier Clip with Mesh

### `unreal.CustomizableObjectNodeModifierClipWithUVMask`
Inherits: `CustomizableObjectNodeModifierBase` | Header: `CustomizableObjectNodeModifierClipWithUVMask.h`

Customizable Object Node Modifier Clip with UVMask

**Properties** (1):
  - `uv_channel_for_mask`: `int` — [Read-Write] UV channel index that will be used to get the UVs to apply the clipping mask to. (int32...

### `unreal.CustomizableObjectNodeModifierEditLayoutBlocks`
Inherits: `CustomizableObjectNodeModifierEditMeshSectionBase` | Header: `CustomizableObjectNodeModifierEditLayoutBlocks.h`

Customizable Object Node Modifier Edit Layout Blocks

### `unreal.CustomizableObjectNodeModifierEditMeshSection`
Inherits: `CustomizableObjectNodeModifierEditLayoutBlocks` | Header: `CustomizableObjectNodeModifierEditMeshSection.h`

Customizable Object Node Modifier Edit Mesh Section

### `unreal.CustomizableObjectNodeModifierEditMeshSectionBase`
Inherits: `CustomizableObjectNodeModifierWithMaterial` | Header: `CustomizableObjectNodeModifierEditMeshSectionBase.h`

Customizable Object Node Modifier Edit Mesh Section Base

### `unreal.CustomizableObjectNodeModifierExtendMeshSection`
Inherits: `CustomizableObjectNodeModifierWithMaterial` | Header: `CustomizableObjectNodeModifierExtendMeshSection.h`

Customizable Object Node Modifier Extend Mesh Section

**Properties** (1):
  - `tags`: `None` — [Read-Write] Tags enabled when the modifier is applied. Also used to decide what modifiers get appli...

### `unreal.CustomizableObjectNodeModifierMorphMeshSection`
Inherits: `CustomizableObjectNodeModifierEditMeshSectionBase` | Header: `CustomizableObjectNodeModifierMorphMeshSection.h`

Customizable Object Node Modifier Morph Mesh Section

### `unreal.CustomizableObjectNodeModifierRemoveMesh`
Inherits: `CustomizableObjectNodeModifierEditMeshSectionBase` | Header: `CustomizableObjectNodeModifierRemoveMesh.h`

Customizable Object Node Modifier Remove Mesh

### `unreal.CustomizableObjectNodeModifierRemoveMeshBlocks`
Inherits: `CustomizableObjectNodeModifierEditLayoutBlocks` | Header: `CustomizableObjectNodeModifierRemoveMeshBlocks.h`

Customizable Object Node Modifier Remove Mesh Blocks

### `unreal.CustomizableObjectNodeModifierTransformInMesh`
Inherits: `CustomizableObjectNodeModifierBase` | Header: `CustomizableObjectNodeModifierTransformInMesh.h`

Customizable Object Node Modifier Transform in Mesh

### `unreal.CustomizableObjectNodeModifierWithMaterial`
Inherits: `CustomizableObjectNodeModifierBase` | Header: `CustomizableObjectNodeModifierWithMaterial.h`

Customizable Object Node Modifier with Material

### `unreal.CustomizableObjectVersionBridgeInterface`
Inherits: `Interface` | Header: `CustomizableObjectVersionBridge.h`

Customizable Object Version Bridge Interface

### `unreal.ColorArithmeticOperation`
Inherits: `EnumBase` | Header: `CustomizableObjectNodeColorArithmeticOp.h`

EColor Arithmetic Operation

**Properties** (4):
  - `E_ADD`: `ColorArithmeticOperation = Ellipsis` — 0
  - `E_DIV`: `ColorArithmeticOperation = Ellipsis` — 3
  - `E_MUL`: `ColorArithmeticOperation = Ellipsis` — 2
  - `E_SUB`: `ColorArithmeticOperation = Ellipsis` — 1

### `unreal.CustomizableObjectCompilationState`
Inherits: `EnumBase` | Header: `CustomizableObjectEditorFunctionLibrary.h`

This mirrors the logic in CustomizableObjectEditor.cpp

**Properties** (4):
  - `COMPLETED`: `CustomizableObjectCompilationState = Ellipsis` — 2
  - `FAILED`: `CustomizableObjectCompilationState = Ellipsis` — 3
  - `IN_PROGRESS`: `CustomizableObjectCompilationState = Ellipsis` — 1
  - `NONE`: `CustomizableObjectCompilationState = Ellipsis` — 0

### `unreal.CustomizableObjectNodeComponentVariationType`
Inherits: `EnumBase` | Header: `CustomizableObjectNodeComponentVariation.h`

ECustomizable Object Node Component Variation Type

**Properties** (2):
  - `STATE`: `CustomizableObjectNodeComponentVariationType = Ellipsis` — 1
  - `TAG`: `CustomizableObjectNodeComponentVariationType = Ellipsis` — 0

### `unreal.CustomizableObjectNodeMaterialVariationType`
Inherits: `EnumBase` | Header: `CustomizableObjectNodeMaterialVariation.h`

ECustomizable Object Node Material Variation Type

**Properties** (2):
  - `STATE`: `CustomizableObjectNodeMaterialVariationType = Ellipsis` — 1
  - `TAG`: `CustomizableObjectNodeMaterialVariationType = Ellipsis` — 0

### `unreal.FloatArithmeticOperation`
Inherits: `EnumBase` | Header: `CustomizableObjectNodeFloatArithmeticOp.h`

EFloat Arithmetic Operation

**Properties** (4):
  - `E_ADD`: `FloatArithmeticOperation = Ellipsis` — 0
  - `E_DIV`: `FloatArithmeticOperation = Ellipsis` — 3
  - `E_MUL`: `FloatArithmeticOperation = Ellipsis` — 2
  - `E_SUB`: `FloatArithmeticOperation = Ellipsis` — 1

### `unreal.ShapeBindingMethod`
Inherits: `EnumBase` | Header: `CustomizableObjectNodeModifierClipDeform.h`

EShape Binding Method

**Properties** (3):
  - `CLOSEST_PROJECT`: `ShapeBindingMethod = Ellipsis` — 0
  - `CLOSEST_TO_SURFACE`: `ShapeBindingMethod = Ellipsis` — 1
  - `NORMAL_PROJECT`: `ShapeBindingMethod = Ellipsis` — 2

### `unreal.PostEditChangePropertyDelegate`
Inherits: `MulticastDelegateBase` | Header: `CustomizableObjectNode.h`

Post Edit Change Property Delegate Delegate Signature
