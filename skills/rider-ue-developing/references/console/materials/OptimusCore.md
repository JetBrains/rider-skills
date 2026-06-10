# UE Python API — OptimusCore Module

**100 types** from the `OptimusCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `Optimus_ShaderBinding`, `OptimusDataDomain`, `OptimusDataTypeRef`, `OptimusDeformerInstanceComponentBinding`, `OptimusExecutionDomain`, `OptimusLoopTerminalInfo`, `OptimusParameterBinding`, `OptimusParameterBindingArray`, `OptimusSecondaryInputBindingsGroup`, `OptimusShaderText`, `OptimusValidatedName`, `OptimusValueContainerStruct`, `RigUnit_AddOptimusDeformer`, `RigVMTrait_OptimusDeformerSettings`, `RigVMTrait_OptimusVariableBase`, `RigVMTrait_SetDeformerBoolArrayVariable`, `RigVMTrait_SetDeformerBoolVariable`, `RigVMTrait_SetDeformerFloatArrayVariable`, `RigVMTrait_SetDeformerFloatVariable`, `RigVMTrait_SetDeformerInt2ArrayVariable`, ... (100 total)

---

## Classes

### `unreal.Optimus_ShaderBinding`
Inherits: `StructBase` | Header: `OptimusBindingTypes.h`

Optimus Shader Binding

### `unreal.OptimusDataDomain`
Inherits: `StructBase` | Header: `OptimusDataDomain.h`

### `unreal.OptimusDataTypeRef`
Inherits: `StructBase` | Header: `OptimusDataType.h`

A reference object for an Optimus data type to use in UObjects and other UStruct-like things

### `unreal.OptimusDeformerInstanceComponentBinding`
Inherits: `StructBase` | Header: `OptimusDeformerInstance.h`

Defines a binding between a component provider in the graph and an actor component in the component hierarchy on the actor whose deformable component weâre bound to.

### `unreal.OptimusExecutionDomain`
Inherits: `StructBase` | Header: `OptimusExecutionDomain.h`

A struct to hold onto a single-level domain for controlling a kernelâs execution domain. The reason itâs in a struct is so that we can apply a property panel customization for it to make it easier...

### `unreal.OptimusLoopTerminalInfo`
Inherits: `StructBase` | Header: `OptimusNode_LoopTerminal.h`

Optimus Loop Terminal Info

### `unreal.OptimusParameterBinding`
Inherits: `StructBase` | Header: `OptimusBindingTypes.h`

Optimus Parameter Binding

### `unreal.OptimusParameterBindingArray`
Inherits: `StructBase` | Header: `OptimusBindingTypes.h`

Optimus Parameter Binding Array

### `unreal.OptimusSecondaryInputBindingsGroup`
Inherits: `StructBase` | Header: `OptimusNode_CustomComputeKernel.h`

Optimus Secondary Input Bindings Group

### `unreal.OptimusShaderText`
Inherits: `StructBase` | Header: `OptimusShaderText.h`

Optimus Shader Text

### `unreal.OptimusValidatedName`
Inherits: `StructBase` | Header: `OptimusValidatedName.h`

Structure containing a FName that has been validated for use as a variable or function name in HLSL code. When using this as a UPROPERTY, the UI will use a property customization that validates text e...

### `unreal.OptimusValueContainerStruct`
Inherits: `StructBase` | Header: `OptimusValueContainerStruct.h`

Optimus Value Container Struct

### `unreal.RigUnit_AddOptimusDeformer`
Inherits: `RigUnitMutable` | Header: `RigUnit_Optimus.h`

Adds a deformer to the Skeletal Mesh Component

### `unreal.RigVMTrait_OptimusDeformerSettings`
Inherits: `RigVMTrait` | Header: `RigUnit_Optimus.h`

Rig VMTrait Optimus Deformer Settings

**Properties** (4):
  - `deform_child_components`: `bool` — [Read-Write] Whether to apply the deformer to all child components as well (bool)
  - `exclude_child_components_with_tag`: `Name` — [Read-Write] Deformer wonât be applied to child components that have the specified component tag (...
  - `execution_group`: `int` — [Read-Write] Deformers are first sorted by execution group index, then by the order in which they ar...
  - `execution_phase`: `OptimusDeformerExecutionPhase` — [Read-Write] (OptimusDeformerExecutionPhase)

### `unreal.RigVMTrait_OptimusVariableBase`
Inherits: `RigVMTrait` | Header: `RigUnit_Optimus.h`

Rig VMTrait Optimus Variable Base

### `unreal.RigVMTrait_SetDeformerBoolArrayVariable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Bool Array Variable

### `unreal.RigVMTrait_SetDeformerBoolVariable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Bool Variable

### `unreal.RigVMTrait_SetDeformerFloatArrayVariable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Float Array Variable

### `unreal.RigVMTrait_SetDeformerFloatVariable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Float Variable

### `unreal.RigVMTrait_SetDeformerInt2ArrayVariable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Int 2Array Variable

### `unreal.RigVMTrait_SetDeformerInt2Variable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Int 2Variable

### `unreal.RigVMTrait_SetDeformerInt3ArrayVariable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Int 3Array Variable

### `unreal.RigVMTrait_SetDeformerInt3Variable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Int 3Variable

### `unreal.RigVMTrait_SetDeformerInt4ArrayVariable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Int 4Array Variable

### `unreal.RigVMTrait_SetDeformerInt4Variable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Int 4Variable

### `unreal.RigVMTrait_SetDeformerIntArrayVariable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Int Array Variable

### `unreal.RigVMTrait_SetDeformerIntVariable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Int Variable

### `unreal.RigVMTrait_SetDeformerLinearColorArrayVariable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Linear Color Array Variable

### `unreal.RigVMTrait_SetDeformerLinearColorVariable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Linear Color Variable

### `unreal.RigVMTrait_SetDeformerNameArrayVariable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Name Array Variable

### `unreal.RigVMTrait_SetDeformerNameVariable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Name Variable

### `unreal.RigVMTrait_SetDeformerQuatArrayVariable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Quat Array Variable

### `unreal.RigVMTrait_SetDeformerQuatVariable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Quat Variable

### `unreal.RigVMTrait_SetDeformerRotatorArrayVariable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Rotator Array Variable

### `unreal.RigVMTrait_SetDeformerRotatorVariable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Rotator Variable

### `unreal.RigVMTrait_SetDeformerTransformArrayVariable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Transform Array Variable

### `unreal.RigVMTrait_SetDeformerTransformVariable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Transform Variable

### `unreal.RigVMTrait_SetDeformerVector2ArrayVariable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Vector 2Array Variable

### `unreal.RigVMTrait_SetDeformerVector2Variable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Vector 2Variable

### `unreal.RigVMTrait_SetDeformerVector4ArrayVariable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Vector 4Array Variable

### `unreal.RigVMTrait_SetDeformerVector4Variable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Vector 4Variable

### `unreal.RigVMTrait_SetDeformerVectorArrayVariable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Vector Array Variable

### `unreal.RigVMTrait_SetDeformerVectorVariable`
Inherits: `RigVMTrait_OptimusVariableBase` | Header: `RigUnit_Optimus.h`

Rig VMTrait Set Deformer Vector Variable

### `unreal.OptimusAdvancedSkeletonDataProvider`
Inherits: `ComputeDataProvider` | Header: `OptimusDataInterfaceAdvancedSkeleton.h`

Compute Framework Data Provider for reading skeletal mesh.

**Properties** (1):
  - `skeletal_mesh`: `SkeletalMeshComponent` — [Read-Write] (SkeletalMeshComponent)

### `unreal.OptimusAnimAttributeDataProvider`
Inherits: `ComputeDataProvider` | Header: `OptimusDataInterfaceAnimAttribute.h`

Compute Framework Data Provider for reading animation attributes on skeletal mesh.

**Properties** (1):
  - `skeletal_mesh`: `SkeletalMeshComponent` — [Read-Write] (SkeletalMeshComponent)

### `unreal.OptimusClothDataProvider`
Inherits: `ComputeDataProvider` | Header: `OptimusDataInterfaceCloth.h`

Compute Framework Data Provider for reading skeletal mesh.

**Properties** (1):
  - `skinned_mesh`: `SkinnedMeshComponent` — [Read-Write] (SkinnedMeshComponent)

### `unreal.OptimusComponentSourceBinding`
Inherits: `Object` | Header: `OptimusComponentSource.h`

Optimus Component Source Binding

### `unreal.OptimusComputeDataInterface`
Inherits: `ComputeDataInterface` | Header: `OptimusComputeDataInterface.h`

Optimus Compute Data Interface

### `unreal.OptimusConnectivityDataProvider`
Inherits: `ComputeDataProvider` | Header: `OptimusDataInterfaceConnectivity.h`

Compute Framework Data Provider for reading skeletal mesh.

**Properties** (1):
  - `skinned_mesh`: `SkinnedMeshComponent` — [Read-Write] (SkinnedMeshComponent)

### `unreal.OptimusDebugDrawDataProvider`
Inherits: `ComputeDataProvider` | Header: `OptimusDataInterfaceDebugDraw.h`

Compute Framework Data Provider for writing skinned mesh.

**Properties** (1):
  - `primitive_component`: `PrimitiveComponent` — [Read-Write] (PrimitiveComponent)

### `unreal.OptimusDeformer`
Inherits: `MeshDeformer` | Header: `OptimusDeformer.h`

A Deformer Graph is an asset that is used to create and control custom deformations on skeletal meshes.

### `unreal.OptimusDeformerInstance`
Inherits: `MeshDeformerInstance` | Header: `OptimusDeformerInstance.h`

Class representing an instance of an Optimus Mesh Deformer, used in a OptimusDeformerDynamicInstanceManager It contains the per instance deformer variable state and local state for each of the graphs ...

**Methods** (29):
  - `enqueue_trigger_graph(trigger_graph_name)` -> `bool` — Trigger a named trigger graph to run on the next tick
  - `set_bool_array_variable(variable_name, value)` -> `bool` — Set Bool Array Variable
  - `set_bool_variable(variable_name, value)` -> `bool` — Set the value of a boolean variable.
  - `set_float_array_variable(variable_name, value)` -> `bool` — Set Float Array Variable
  - `set_float_variable(variable_name, value)` -> `bool` — Set Float Variable
  - `set_int2_array_variable(variable_name, value)` -> `bool` — Set Int 2Array Variable
  - `set_int2_variable(variable_name, value)` -> `bool` — Set Int 2Variable
  - `set_int3_array_variable(variable_name, value)` -> `bool` — Set Int 3Array Variable
  - `set_int3_variable(variable_name, value)` -> `bool` — Set Int 3Variable
  - `set_int4_array_variable(variable_name, value)` -> `bool` — Set Int 4Array Variable
  - `set_int4_variable(variable_name, value)` -> `bool` — Set Int 4Variable
  - `set_int_array_variable(variable_name, value)` -> `bool` — Set Int Array Variable
  - `set_int_variable(variable_name, value)` -> `bool` — Set the value of an integer variable.
  - `set_linear_color_array_variable(variable_name, value)` -> `bool` — Set Linear Color Array Variable
  - `set_linear_color_variable(variable_name, value)` -> `bool` — Set Linear Color Variable
  - `set_name_array_variable(variable_name, value)` -> `bool` — Set Name Array Variable
  - `set_name_variable(variable_name, value)` -> `bool` — Set Name Variable
  - `set_quat_array_variable(variable_name, value)` -> `bool` — Set Quat Array Variable
  - `set_quat_variable(variable_name, value)` -> `bool` — Set Quat Variable
  - `set_rotator_array_variable(variable_name, value)` -> `bool` — Set Rotator Array Variable
  - `set_rotator_variable(variable_name, value)` -> `bool` — Set Rotator Variable
  - `set_transform_array_variable(variable_name, value)` -> `bool` — Set Transform Array Variable
  - `set_transform_variable(variable_name, value)` -> `bool` — Set the value of a transform variable.
  - `set_vector2_array_variable(variable_name, value)` -> `bool` — Set Vector 2Array Variable
  - `set_vector2_variable(variable_name, value)` -> `bool` — Set Vector 2Variable
  - `set_vector4_array_variable(variable_name, value)` -> `bool` — Set Vector 4Array Variable
  - `set_vector4_variable(variable_name, value)` -> `bool` — Set Vector 4Variable
  - `set_vector_array_variable(variable_name, value)` -> `bool` — Set Vector Array Variable
  - `set_vector_variable(variable_name, value)` -> `bool` — Set Vector Variable

### `unreal.OptimusDeformerInstanceSettings`
Inherits: `MeshDeformerInstanceSettings` | Header: `OptimusDeformerInstance.h`

Optimus Deformer Instance Settings

### `unreal.OptimusDuplicateVerticesDataProvider`
Inherits: `ComputeDataProvider` | Header: `OptimusDataInterfaceDuplicateVertices.h`

Compute Framework Data Provider for reading skeletal mesh.

**Properties** (1):
  - `skinned_mesh`: `SkinnedMeshComponent` — [Read-Write] (SkinnedMeshComponent)

### `unreal.OptimusFunctionNodeGraph`
Inherits: `OptimusNodeSubGraph` | Header: `OptimusFunctionNodeGraph.h`

Optimus Function Node Graph

### `unreal.OptimusGraphDataProvider`
Inherits: `ComputeDataProvider` | Header: `OptimusDataInterfaceGraph.h`

Compute Framework Data Provider for marshaling compute graph parameters and variables.

**Properties** (1):
  - `mesh_component`: `MeshComponent` — [Read-Write] (MeshComponent)

### `unreal.OptimusHalfEdgeDataProvider`
Inherits: `ComputeDataProvider` | Header: `OptimusDataInterfaceHalfEdge.h`

Compute Framework Data Provider for reading skeletal mesh.

**Properties** (1):
  - `skinned_mesh`: `SkinnedMeshComponent` — [Read-Write] (SkinnedMeshComponent)

### `unreal.OptimusImplicitPersistentBufferDataProvider`
Inherits: `OptimusRawBufferDataProvider` | Header: `OptimusDataInterfaceRawBuffer.h`

Compute Framework Data Provider for a transient buffer.

### `unreal.OptimusLoopTerminalDataProvider`
Inherits: `ComputeDataProvider` | Header: `OptimusDataInterfaceLoopTerminal.h`

Compute Framework Data Provider for reading loop data.

### `unreal.OptimusMorphTargetDataProvider`
Inherits: `ComputeDataProvider` | Header: `OptimusDataInterfaceMorphTarget.h`

Compute Framework Data Provider for reading skeletal mesh.

**Properties** (1):
  - `skinned_mesh`: `SkinnedMeshComponent` — [Read-Write] (SkinnedMeshComponent)

### `unreal.OptimusNode`
Inherits: `Object` | Header: `OptimusNode.h`

Optimus Node

**Methods** (5):
  - `get_display_name()` -> `Text` — Returns the display name to use on the graphical node in the graph editor.
  - `get_graph_position()` -> `Vector2D` — Returns the position in the graph UI where the node is shown.
  - `get_node_category()` -> `Name` — Returns the node class category. This is used for categorizing the node for display.
  - `get_node_name()` -> `Name` — Returns the node class name. This name is immutable for the given node class.
  - `set_graph_position(position)` -> `bool` — Sets the position in the graph UI that the node should be shown at.

### `unreal.OptimusNode_AnimAttributeDataInterface`
Inherits: `OptimusNode_DataInterface` | Header: `OptimusNode_AnimAttributeDataInterface.h`

### `unreal.OptimusNode_Comment`
Inherits: `OptimusNode` | Header: `OptimusNode_Comment.h`

Optimus Node Comment

### `unreal.OptimusNode_ComponentSource`
Inherits: `OptimusNode` | Header: `OptimusNode_ComponentSource.h`

Optimus Node Component Source

### `unreal.OptimusNode_ComputeKernelBase`
Inherits: `OptimusNode` | Header: `OptimusNode_ComputeKernelBase.h`

Optimus Node Compute Kernel Base

### `unreal.OptimusNode_ComputeKernelFunction`
Inherits: `OptimusNode_ComputeKernelBase` | Header: `OptimusNode_ComputeKernelFunction.h`

Optimus Node Compute Kernel Function

### `unreal.OptimusNode_ConstantValue`
Inherits: `OptimusNode` | Header: `OptimusNode_ConstantValue.h`

Optimus Node Constant Value

### `unreal.OptimusNode_CustomComputeKernel`
Inherits: `OptimusNode_ComputeKernelBase` | Header: `OptimusNode_CustomComputeKernel.h`

Optimus Node Custom Compute Kernel

**Properties** (3):
  - `input_bindings`: `None` — [Read-Write] Input bindings. Each one is a function that should be connected to an implementation in...
  - `output_bindings`: `None` — [Read-Write] Output bindings. Each one is a function that should be connected to an implementation i...
  - `parameters`: `None` — [Read-Write]
deprecated: Property âParametersâ is deprecated. (Array[Optimus_ShaderBinding])

### `unreal.OptimusNode_DataInterface`
Inherits: `OptimusNode` | Header: `OptimusNode_DataInterface.h`

Optimus Node Data Interface

### `unreal.OptimusNode_FunctionReference`
Inherits: `OptimusNode` | Header: `OptimusNode_FunctionReference.h`

Optimus Node Function Reference

**Properties** (1):
  - `function_graph`: `OptimusFunctionNodeGraph` — [Read-Write]
deprecated: Property âFunctionGraphâ is deprecated. (OptimusFunctionNodeGraph)

### `unreal.OptimusNode_GetResource`
Inherits: `OptimusNode_ResourceAccessorBase` | Header: `OptimusNode_GetResource.h`

Optimus Node Get Resource

### `unreal.OptimusNode_GetVariable`
Inherits: `OptimusNode` | Header: `OptimusNode_GetVariable.h`

Optimus Node Get Variable

### `unreal.OptimusNode_GraphTerminal`
Inherits: `OptimusNode` | Header: `OptimusNode_GraphTerminal.h`

Optimus Node Graph Terminal

### `unreal.OptimusNode_LoopTerminal`
Inherits: `OptimusNode` | Header: `OptimusNode_LoopTerminal.h`

Optimus Node Loop Terminal

### `unreal.OptimusNode_Resource`
Inherits: `OptimusNode_ResourceAccessorBase` | Header: `OptimusNode_Resource.h`

Optimus Node Resource

### `unreal.OptimusNode_ResourceAccessorBase`
Inherits: `OptimusNode` | Header: `OptimusNode_ResourceAccessorBase.h`

Optimus Node Resource Accessor Base

**Properties** (1):
  - `write_type`: `OptimusBufferWriteType` — [Read-Write] Logical operation when writing to the resource.
deprecated: Property âWriteTypeâ is...

### `unreal.OptimusNode_SetResource`
Inherits: `OptimusNode_ResourceAccessorBase` | Header: `OptimusNode_SetResource.h`

Optimus Node Set Resource

### `unreal.OptimusNode_SubGraphReference`
Inherits: `OptimusNode` | Header: `OptimusNode_SubGraphReference.h`

Optimus Node Sub Graph Reference

### `unreal.OptimusNodeGraph`
Inherits: `Object` | Header: `OptimusNodeGraph.h`

Optimus Node Graph

**Methods** (37):
  - `add_comment_node(position, size, color)` -> `OptimusNode` — Add Comment Node
  - `add_component_binding_get_node(component_binding, position)` -> `OptimusNode` — Add Component Binding Get Node
  - `add_data_interface_node(data_interface_class, position)` -> `OptimusNode` — Add Data Interface Node
  - `add_function_reference_node(function_graph, position)` -> `OptimusNode` — Add Function Reference Node
  - `add_link(node_output_pin, node_input_pin)` -> `bool` — Add Link
  - `add_loop_terminal_nodes(position)` -> `Array [ OptimusNode ]` — Add Loop Terminal Nodes
  - `add_node(node_class, position)` -> `OptimusNode` — TODO: Add magic connection from a pin.
  - `add_resource_get_node(resource_desc, position)` -> `OptimusNode` — Add Resource Get Node
  - `add_resource_node(resource_desc, position)` -> `OptimusNode` — Add Resource Node
  - `add_resource_set_node(resource_desc, position)` -> `OptimusNode` — Add Resource Set Node
  - `add_value_node(data_type_ref, position)` -> `OptimusNode` — Add Value Node
  - `add_variable_get_node(variable_desc, position)` -> `OptimusNode` — Add Variable Get Node
  - `collapse_nodes_to_function(nodes)` -> `OptimusNode` — Take a set of nodes and collapse them into a single function, replacing the given nodes with the new function node and r...
  - `collapse_nodes_to_sub_graph(nodes)` -> `OptimusNode` — Take a set of nodes and collapse them into a subgraph, replacing the given nodes with a new subgraph node and returning ...
  - `convert_custom_kernel_to_function(custom_kernel)` -> `OptimusNode` — Takes a custom kernel and converts to a packaged function. If the given node is not a custom kernel or cannot be convert...
  - `convert_function_to_custom_kernel(kernel_function)` -> `OptimusNode` — Takes a kernel function and unpackages to a custom kernel. If the given node is not a kernel function or cannot be conve...
  - `convert_to_function(sub_graph_node)` -> `bool` — Take a subgraph node convert it to a function in-place
  - `convert_to_sub_graph(function_node)` -> `bool` — Take a function node convert it to a subgraph node in-place
  - `duplicate_node(node, position)` -> `OptimusNode` — Duplicate Node
  - `duplicate_nodes(nodes, position)` -> `bool` — Duplicate a collection of nodes from the same graph, using the InPosition position to be the top-left origin of the past...
  - `expand_collapsed_nodes(graph_reference_node)` -> `Array [ OptimusNode ]` — Take a function or subgraph node and expand it in-place, replacing the given function node. The function definition stil...
  - `get_graph_index()` -> `int32` — Get Graph Index
  - `get_graph_type()` -> `OptimusNodeGraphType` — Get Graph Type
  - `get_graphs()` -> `Array [ OptimusNodeGraph ]` — Get Graphs
  - `is_custom_kernel(node)` -> `bool` — Returns true if the node in question is a custom kernel node that can be converted to a kernel function with ConvertCust...
  - `is_execution_graph()` -> `bool` — Is Execution Graph
  - `is_function_graph()` -> `bool` — Is Function Graph
  - `is_function_reference(node)` -> `bool` — Returns true if the node in question is a function reference node that can be expanded into a group of nodes using Expan...
  - `is_kernel_function(node)` -> `bool` — Returns true if the node in question is a kernel function node that can be converted to a custom kernel using ConvertFun...
  - `is_sub_graph_reference(node)` -> `bool` — Returns true if the node in question is a function sub-graph node that can be expanded into a group of nodes using Expan...
  - `move_graph_direct(graph, insert_before)` -> `bool` — Move Graph Direct
  - `remove_all_links(node_pin)` -> `bool` — brief: Removes all links to the given pin, whether itâs an input or an output pin.
  - `remove_link(node_output_pin, node_input_pin)` -> `bool` — brief: Removes a single link between two nodes. FIXME: Use UOptimusNodeLink instead.
  - `remove_node(node)` -> `bool` — Remove Node
  - `remove_nodes(nodes)` -> `bool` — Remove Nodes
  - `rename_graph(graph, new_name)` -> `bool` — Rename Graph
  - `rename_graph_direct(graph, new_name)` -> `bool` — Rename Graph Direct

**Properties** (1):
  - `graph_type`: `OptimusNodeGraphType` [Read-Only] — [Read-Only] The type of graph this represents. (OptimusNodeGraphType)

### `unreal.OptimusNodePin`
Inherits: `Object` | Header: `OptimusNodePin.h`

Optimus Node Pin

### `unreal.OptimusNodeSubGraph`
Inherits: `OptimusNodeGraph` | Header: `OptimusNodeSubGraph.h`

Optimus Node Sub Graph

### `unreal.OptimusPersistentBufferDataProvider`
Inherits: `OptimusRawBufferDataProvider` | Header: `OptimusDataInterfaceRawBuffer.h`

Compute Framework Data Provider for a transient buffer.

### `unreal.OptimusRawBufferDataProvider`
Inherits: `ComputeDataProvider` | Header: `OptimusDataInterfaceRawBuffer.h`

Compute Framework Data Provider for a transient buffer.

### `unreal.OptimusResourceDescription`
Inherits: `Object` | Header: `OptimusResourceDescription.h`

Optimus Resource Description

**Properties** (1):
  - `resource_name`: `Name` [Read-Only] — [Read-Only] (Name)

### `unreal.OptimusSceneDataProvider`
Inherits: `ComputeDataProvider` | Header: `OptimusDataInterfaceScene.h`

Compute Framework Data Provider for reading general scene data.

**Properties** (1):
  - `scene_component`: `SceneComponent` — [Read-Write] (SceneComponent)

### `unreal.OptimusSkeletonDataProvider`
Inherits: `ComputeDataProvider` | Header: `OptimusDataInterfaceSkeleton.h`

Compute Framework Data Provider for reading skeletal mesh.

**Properties** (1):
  - `skinned_mesh`: `SkinnedMeshComponent` — [Read-Write] (SkinnedMeshComponent)

### `unreal.OptimusSkinnedMeshDataProvider`
Inherits: `ComputeDataProvider` | Header: `OptimusDataInterfaceSkinnedMesh.h`

Compute Framework Data Provider for reading skeletal mesh.

**Properties** (1):
  - `skinned_mesh`: `SkinnedMeshComponent` — [Read-Write] (SkinnedMeshComponent)

### `unreal.OptimusSkinnedMeshReadDataProvider`
Inherits: `ComputeDataProvider` | Header: `OptimusDataInterfaceSkinnedMeshRead.h`

Compute Framework Data Provider for writing skinned mesh.

**Properties** (1):
  - `skinned_mesh`: `SkinnedMeshComponent` — [Read-Write] (SkinnedMeshComponent)

### `unreal.OptimusSkinnedMeshVertexAttributeDataProvider`
Inherits: `ComputeDataProvider` | Header: `OptimusDataInterfaceSkinnedMeshVertexAttribute.h`

Compute Framework Data Provider for reading skeletal mesh.

**Properties** (3):
  - `attribute_name`: `Name` — [Read-Write] (Name)
  - `default_value`: `float` — [Read-Write] (float)
  - `skinned_mesh_component`: `SkinnedMeshComponent` — [Read-Write] (SkinnedMeshComponent)

### `unreal.OptimusSkinnedMeshWriteDataProvider`
Inherits: `ComputeDataProvider` | Header: `OptimusDataInterfaceSkinnedMeshWrite.h`

Compute Framework Data Provider for writing skinned mesh.

**Properties** (1):
  - `skinned_mesh`: `SkinnedMeshComponent` — [Read-Write] (SkinnedMeshComponent)

### `unreal.OptimusSkinWeightsAsVertexMaskDataProvider`
Inherits: `ComputeDataProvider` | Header: `OptimusDataInterfaceSkinWeightsAsVertexMask.h`

Compute Framework Data Provider for reading skeletal mesh.

**Properties** (1):
  - `skeletal_mesh`: `SkeletalMeshComponent` — [Read-Write] (SkeletalMeshComponent)

### `unreal.OptimusTransientBufferDataProvider`
Inherits: `OptimusRawBufferDataProvider` | Header: `OptimusDataInterfaceRawBuffer.h`

Compute Framework Data Provider for a transient buffer.

### `unreal.OptimusValueContainer`
Inherits: `Object` | Header: `OptimusValueContainer.h`

### `unreal.OptimusVariableDescription`
Inherits: `Object` | Header: `OptimusVariableDescription.h`

Optimus Variable Description

**Properties** (2):
  - `default_value`: `OptimusValueContainer` — [Read-Write] Deprecated
deprecated: use DefaultValueStruct instead (OptimusValueContainer)
  - `value_data`: `None` — [Read-Write] Deprecated
deprecated: Use CachedShaderValue instead (Array[uint8])

### `unreal.OptimusBufferWriteType`
Inherits: `EnumBase` | Header: `OptimusDataInterfaceRawBuffer.h`

Write to buffer operation types.

**Properties** (4):
  - `WRITE`: `OptimusBufferWriteType = Ellipsis` — Write the value to resource buffer. 0
  - `WRITE_ATOMIC_ADD`: `OptimusBufferWriteType = Ellipsis` — AtomicAdd the value to the value in the resource buffer. 1
  - `WRITE_ATOMIC_MAX`: `OptimusBufferWriteType = Ellipsis` — AtomicMax the value with the value in the resource buffer. 3
  - `WRITE_ATOMIC_MIN`: `OptimusBufferWriteType = Ellipsis` — AtomicMin the value with the value in the resource buffer. 2

### `unreal.OptimusDataDomainType`
Inherits: `EnumBase` | Header: `OptimusDataDomain.h`

EOptimus Data Domain Type

**Properties** (2):
  - `DIMENSIONAL`: `OptimusDataDomainType = Ellipsis` — 0
  - `EXPRESSION`: `OptimusDataDomainType = Ellipsis` — Dimensional, e.g. has zero or more named dimensions of lookup. Zero-dimensional data domain is a sin...

### `unreal.OptimusDeformerExecutionPhase`
Inherits: `EnumBase` | Header: `OptimusDeformerDynamicInstanceManager.h`

EOptimus Deformer Execution Phase

**Properties** (3):
  - `AFTER_DEFAULT_DEFORMER`: `OptimusDeformerExecutionPhase = Ellipsis` — 0
  - `BEFORE_DEFAULT_DEFORMER`: `OptimusDeformerExecutionPhase = Ellipsis` — 2
  - `OVERRIDE_DEFAULT_DEFORMER`: `OptimusDeformerExecutionPhase = Ellipsis` — 1

### `unreal.OptimusExecutionDomainType`
Inherits: `EnumBase` | Header: `OptimusExecutionDomain.h`

EOptimus Execution Domain Type

**Properties** (2):
  - `DOMAIN_NAME`: `OptimusExecutionDomainType = Ellipsis` — 0
  - `EXPRESSION`: `OptimusExecutionDomainType = Ellipsis` — 1

### `unreal.OptimusNodeGraphType`
Inherits: `EnumBase` | Header: `OptimusNodeGraph.h`

The use type of a particular graph

**Properties** (6):
  - `EXTERNAL_TRIGGER`: `OptimusNodeGraphType = Ellipsis` — Called on every tick 2
  - `FUNCTION`: `OptimusNodeGraphType = Ellipsis` — Called when triggered from a blueprint // Storage graphs 3
  - `SETUP`: `OptimusNodeGraphType = Ellipsis` — Execution graphs 0
  - `SUB_GRAPH`: `OptimusNodeGraphType = Ellipsis` — Used to store function graphs 4
  - `TRANSIENT`: `OptimusNodeGraphType = Ellipsis` — Used to store sub-graphs within other graphs 5
  - `UPDATE`: `OptimusNodeGraphType = Ellipsis` — Called once during an actorâs setup event 1

### `unreal.OptimusTerminalType`
Inherits: `EnumBase` | Header: `OptimusNode_GraphTerminal.h`

EOptimus Terminal Type

**Properties** (3):
  - `ENTRY`: `OptimusTerminalType = Ellipsis` — 1
  - `RETURN`: `OptimusTerminalType = Ellipsis` — 2
  - `UNKNOWN`: `OptimusTerminalType = Ellipsis` — 0
