# UE Python API — NiagaraEditor Module

**36 types** from the `NiagaraEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MovieSceneNiagaraEmitterSection`, `MovieSceneNiagaraEmitterSectionBase`, `MovieSceneNiagaraEmitterTrack`, `NiagaraAssetTagDefinitionsFactory`, `NiagaraBakerFunctionLibrary`, `NiagaraBakerStaticMeshFactoryNew`, `NiagaraClipboardEditorScriptingUtilities`, `NiagaraClipboardFunctionInput`, `NiagaraDataChannelAssetFactoryNew`, `NiagaraDynamicInputScriptFactory`, `NiagaraEffectTypeFactoryNew`, `NiagaraEmitterFactoryNew`, `NiagaraFunctionScriptFactory`, `NiagaraModuleScriptFactory`, `NiagaraNode`, `NiagaraNodeFunctionCall`, `NiagaraNodeWithDynamicPins`, `NiagaraParameterCollectionFactoryNew`, `NiagaraParameterCollectionInstanceFactoryNew`, `NiagaraParameterDefinitionsFactory`, ... (36 total)

---

## Classes

### `unreal.MovieSceneNiagaraEmitterSection`
Inherits: `MovieSceneNiagaraEmitterSectionBase` | Header: `MovieSceneNiagaraEmitterSection.h`

Niagara editor movie scene section; represents one emitter in the timeline

### `unreal.MovieSceneNiagaraEmitterSectionBase`
Inherits: `MovieSceneSection` | Header: `MovieSceneNiagaraEmitterTrack.h`

Movie Scene Niagara Emitter Section Base

### `unreal.MovieSceneNiagaraEmitterTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneNiagaraEmitterTrack.h`

A track representing an emitter in the niagara effect editor timeline.

### `unreal.NiagaraAssetTagDefinitionsFactory`
Inherits: `Factory` | Header: `NiagaraAssetTagDefinitionsFactory.h`

Niagara Asset Tag Definitions Factory

### `unreal.NiagaraBakerFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `NiagaraBakerFunctionLibrary.h`

Niagara Baker Function Library

**Methods** (1):
  - `capture_niagara_to_static_mesh(component_to_capture, static_mesh_output, readback_parameters = [True,True,True,1,True,False,0])` -> `None` [classmethod] — Capture Niagara to Static Mesh

### `unreal.NiagaraBakerStaticMeshFactoryNew`
Inherits: `Factory` | Header: `NiagaraBakerRendererOutputStaticMesh.h`

Niagara Baker Static Mesh Factory New

### `unreal.NiagaraClipboardEditorScriptingUtilities`
Inherits: `Object` | Header: `NiagaraClipboard.h`

Niagara Clipboard Editor Scripting Utilities

**Methods** (16):
  - `create_bool_local_value_input(outer, input_name, has_edit_condition, edit_condition_value, bool_value)` -> `NiagaraClipboardFunctionInput` [classmethod] — Create Bool Local Value Input
  - `create_data_value_input(outer, input_name, has_edit_condition, edit_condition_value, data_value)` -> `NiagaraClipboardFunctionInput` [classmethod] — Create Data Value Input
  - `create_dynamic_value_input(outer, input_name, input_type_name, has_edit_condition, edit_condition_value, dynamic_value_name, dynamic_value)` -> `NiagaraClipboardFunctionInput` [classmethod] — Create Dynamic Value Input
  - `create_enum_local_value_input(outer, input_name, has_edit_condition, edit_codition_value, enum_type, enum_value)` -> `NiagaraClipboardFunctionInput` [classmethod] — Create Enum Local Value Input
  - `create_expression_value_input(outer, input_name, input_type_name, has_edit_condition, edit_condition_value, expression_value)` -> `NiagaraClipboardFunctionInput` [classmethod] — Create Expression Value Input
  - `create_float_local_value_input(outer, input_name, has_edit_condition, edit_condition_value, local_value)` -> `NiagaraClipboardFunctionInput` [classmethod] — Create Float Local Value Input
  - `create_int_local_value_input(outer, input_name, has_edit_condition, edit_condition_value, local_value)` -> `NiagaraClipboardFunctionInput` [classmethod] — Create Int Local Value Input
  - `create_linked_value_input(outer, input_name, input_type_name, has_edit_condition, edit_condition_value, linked_value)` -> `NiagaraClipboardFunctionInput` [classmethod] — Create Linked Value Input
  - `create_struct_local_value_input(outer, input_name, has_edit_condition, edit_condition_value, struct_value)` -> `NiagaraClipboardFunctionInput` [classmethod] — Create Struct Local Value Input
  - `create_vec2_local_value_input(outer, input_name, has_edit_condition, edit_condition_value, vec2_value)` -> `NiagaraClipboardFunctionInput` [classmethod] — Create Vec 2Local Value Input
  - `create_vec3_local_value_input(outer, input_name, has_edit_condition, edit_condition_value, vec3_value)` -> `NiagaraClipboardFunctionInput` [classmethod] — Create Vec 3Local Value Input
  - `get_type_name(input)` -> `Name` [classmethod] — Get Type Name
  - `try_get_input_by_name(inputs, out_input=NiagaraClipboardFunctionInput)` [classmethod] — Try Get Input by Name
  - `try_get_local_value_as_float(out_value=float)` [classmethod] — Try Get Local Value as Float
  - `try_get_local_value_as_int(out_value=int32)` [classmethod] — Try Get Local Value as Int
  - `try_set_local_value_as_int(input, value, loose_typing = True)` -> `bool` [classmethod] — Try Set Local Value as Int

### `unreal.NiagaraClipboardFunctionInput`
Inherits: `Object` | Header: `NiagaraClipboard.h`

Niagara Clipboard Function Input

### `unreal.NiagaraDataChannelAssetFactoryNew`
Inherits: `Factory` | Header: `NiagaraDataChannelAssetFactoryNew.h`

Niagara Data Channel Asset Factory New

### `unreal.NiagaraDynamicInputScriptFactory`
Inherits: `NiagaraScriptFactoryNew` | Header: `NiagaraScriptFactoryNew.h`

Niagara dynamic input script factory.

### `unreal.NiagaraEffectTypeFactoryNew`
Inherits: `Factory` | Header: `NiagaraEffectTypeFactoryNew.h`

Niagara Effect Type Factory New

### `unreal.NiagaraEmitterFactoryNew`
Inherits: `Factory` | Header: `NiagaraEmitterFactoryNew.h`

A factory for niagara emitter assets.

### `unreal.NiagaraFunctionScriptFactory`
Inherits: `NiagaraScriptFactoryNew` | Header: `NiagaraScriptFactoryNew.h`

Niagara function factory.

### `unreal.NiagaraModuleScriptFactory`
Inherits: `NiagaraScriptFactoryNew` | Header: `NiagaraScriptFactoryNew.h`

Niagara module script factory.

### `unreal.NiagaraNode`
Inherits: `EdGraphNode` | Header: `NiagaraNode.h`

Niagara Node

### `unreal.NiagaraNodeFunctionCall`
Inherits: `NiagaraNodeWithDynamicPins` | Header: `NiagaraNodeFunctionCall.h`

Niagara Node Function Call

### `unreal.NiagaraNodeWithDynamicPins`
Inherits: `NiagaraNode` | Header: `NiagaraNodeWithDynamicPins.h`

A base node for niagara nodes with pins which can be dynamically added and removed by the user.

### `unreal.NiagaraParameterCollectionFactoryNew`
Inherits: `Factory` | Header: `NiagaraParameterCollectionFactoryNew.h`

Niagara Parameter Collection Factory New

### `unreal.NiagaraParameterCollectionInstanceFactoryNew`
Inherits: `Factory` | Header: `NiagaraParameterCollectionFactoryNew.h`

Niagara Parameter Collection Instance Factory New

### `unreal.NiagaraParameterDefinitionsFactory`
Inherits: `Factory` | Header: `NiagaraParameterDefinitionsFactory.h`

Niagara Parameter Definitions Factory

### `unreal.NiagaraPythonEmitter`
Inherits: `Object` | Header: `UpgradeNiagaraScriptResults.h`

Wrapper for an emitter stack.

**Methods** (6):
  - `get_module(module_name)` -> `NiagaraPythonModule` — returns a module by name
  - `get_modules()` -> `Array [ NiagaraPythonModule ]` — returns a list of all modules contained in this emitter
  - `get_object()` -> `NiagaraEmitter` — Returns the raw underlying object
  - `get_properties()` -> `VersionedNiagaraEmitterData` — returns the emitter properties, such as determinism or interpolated spawning
  - `has_module(module_name)` -> `bool` — returns true if the emitter contains a certain module
  - `set_properties(data)` -> `None` — sets the new emitter properties

### `unreal.NiagaraPythonModule`
Inherits: `Object` | Header: `UpgradeNiagaraScriptResults.h`

Wrapper for a module from the emitter stack.

**Methods** (1):
  - `get_object()` -> `NiagaraStackModuleItem` — Returns the raw underlying object

### `unreal.NiagaraPythonScriptModuleInput`
Inherits: `Object` | Header: `UpgradeNiagaraScriptResults.h`

Wrapper for setting the value on a parameter of a UNiagaraScript, applied through a UUpgradeNiagaraScriptResults.

**Methods** (13):
  - `as_bool()` -> `bool` — As Bool
  - `as_color()` -> `LinearColor` — As Color
  - `as_enum()` -> `str` — As Enum
  - `as_float()` -> `float` — As Float
  - `as_int()` -> `int32` — As Int
  - `as_linked_value()` -> `str` — As Linked Value
  - `as_quat()` -> `Quat` — As Quat
  - `as_vec2()` -> `Vector2D` — As Vec 2
  - `as_vec3()` -> `Vector` — As Vec 3
  - `as_vec4()` -> `Vector4` — As Vec 4
  - `is_linked_value()` -> `bool` — Is Linked Value
  - `is_local_value()` -> `bool` — Is Local Value
  - `is_set()` -> `bool` — Is Set

### `unreal.NiagaraScriptFactoryNew`
Inherits: `Factory` | Header: `NiagaraScriptFactoryNew.h`

Niagara Script Factory New

### `unreal.NiagaraSequence`
Inherits: `MovieSceneSequence` | Header: `NiagaraSequence.h`

Movie scene sequence used by Niagara.

### `unreal.NiagaraSimCacheFactoryNew`
Inherits: `Factory` | Header: `NiagaraSimCacheFactoryNew.h`

Niagara Sim Cache Factory New

### `unreal.NiagaraStackEntry`
Inherits: `Object` | Header: `NiagaraStackEntry.h`

Niagara Stack Entry

### `unreal.NiagaraStackItem`
Inherits: `NiagaraStackEntry` | Header: `NiagaraStackItem.h`

Niagara Stack Item

### `unreal.NiagaraStackModuleItem`
Inherits: `NiagaraStackItem` | Header: `NiagaraStackModuleItem.h`

Niagara Stack Module Item

### `unreal.NiagaraSystemFactoryNew`
Inherits: `Factory` | Header: `NiagaraSystemFactoryNew.h`

Niagara System Factory New

### `unreal.NiagaraValidationRuleSetFactoryNew`
Inherits: `Factory` | Header: `NiagaraValidationRuleSetFactoryNew.h`

Niagara Validation Rule Set Factory New

### `unreal.UpgradeNiagaraEmitterContext`
Inherits: `Object` | Header: `UpgradeNiagaraScriptResults.h`

Wrapper class for passing results back from the version upgrade python script.

**Properties** (3):
  - `cancelled_by_python_error`: `bool` — [Read-Write] Whether the converter process was cancelled due to an unrecoverable error in the python...
  - `new_emitter`: `NiagaraPythonEmitter` — [Read-Write] (NiagaraPythonEmitter)
  - `old_emitter`: `NiagaraPythonEmitter` — [Read-Write] (NiagaraPythonEmitter)

### `unreal.UpgradeNiagaraScriptResults`
Inherits: `Object` | Header: `UpgradeNiagaraScriptResults.h`

Wrapper class for passing results back from the version upgrade python script.

**Methods** (14):
  - `get_old_input(input_name)` -> `NiagaraPythonScriptModuleInput` — Get Old Input
  - `reset_to_default(input_name)` -> `None` — Reset to Default
  - `set_bool_input(input_name, value)` -> `None` — Set Bool Input
  - `set_color_input(input_name, value)` -> `None` — Set Color Input
  - `set_enum_input(input_name, value)` -> `None` — Set Enum Input
  - `set_enum_input_from_int(input_name, value)` -> `None` — Set Enum Input from Int
  - `set_float_input(input_name, value)` -> `None` — Set Float Input
  - `set_int_input(input_name, value)` -> `None` — Set Int Input
  - `set_linked_input(input_name, value)` -> `None` — Set Linked Input
  - `set_new_input(input_name, value)` -> `None` — Set New Input
  - `set_quat_input(input_name, value)` -> `None` — Set Quat Input
  - `set_vec2_input(input_name, value)` -> `None` — Set Vec 2Input
  - `set_vec3_input(input_name, value)` -> `None` — Set Vec 3Input
  - `set_vec4_input(input_name, value)` -> `None` — Set Vec 4Input

**Properties** (3):
  - `cancelled_by_python_error`: `bool` — [Read-Write] Whether the converter process was cancelled due to an unrecoverable error in the python...
  - `new_inputs`: `None` — [Read-Write] (Array[NiagaraPythonScriptModuleInput])
  - `old_inputs`: `None` — [Read-Write] (Array[NiagaraPythonScriptModuleInput])

### `unreal.VolumeCacheFactory`
Inherits: `Factory` | Header: `VolumeCacheFactory.h`

Volume Cache Factory

### `unreal.NiagaraMessageSeverity`
Inherits: `EnumBase` | Header: `NiagaraMessages.h`

ENiagara Message Severity

**Properties** (5):
  - `CRITICAL_ERROR`: `NiagaraMessageSeverity = Ellipsis` — 0
  - `ERROR`: `NiagaraMessageSeverity = Ellipsis` — 1
  - `INFO`: `NiagaraMessageSeverity = Ellipsis` — 4
  - `PERFORMANCE_WARNING`: `NiagaraMessageSeverity = Ellipsis` — 2
  - `WARNING`: `NiagaraMessageSeverity = Ellipsis` — 3

### `unreal.NiagaraClipboardFunction_OnPastedFunctionCallNode`
Inherits: `DelegateBase` | Header: `NiagaraClipboard.h`

On Pasted Function Call Node Delegate Signature
