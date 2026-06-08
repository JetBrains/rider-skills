# UE Python API — ComputeFramework Module

**15 types** from the `ComputeFramework` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ComputeKernelDefinition`, `ComputeKernelDefinitionSet`, `ComputeKernelPermutationBool`, `ComputeKernelPermutationSet`, `ShaderFunctionDefinition`, `ShaderParamTypeDefinition`, `ComputeDataInterface`, `ComputeDataProvider`, `ComputeGraph`, `ComputeGraphComponent`, `ComputeKernel`, `ComputeKernelFromText`, `ComputeKernelSource`, `ComputeSource`, `ComputeSourceFromText`

---

## Classes

### `unreal.ComputeKernelDefinition`
Inherits: `StructBase` | Header: `ComputeKernelPermutationSet.h`

Compute Kernel Definition

### `unreal.ComputeKernelDefinitionSet`
Inherits: `StructBase` | Header: `ComputeKernelPermutationSet.h`

Compute Kernel Definition Set

### `unreal.ComputeKernelPermutationBool`
Inherits: `StructBase` | Header: `ComputeKernelPermutationSet.h`

Compute Kernel Permutation Bool

### `unreal.ComputeKernelPermutationSet`
Inherits: `StructBase` | Header: `ComputeKernelPermutationSet.h`

Compute Kernel Permutation Set

### `unreal.ShaderFunctionDefinition`
Inherits: `StructBase` | Header: `ShaderParamTypeDefinition.h`

Describes a shader function signature.

### `unreal.ShaderParamTypeDefinition`
Inherits: `StructBase` | Header: `ShaderParamTypeDefinition.h`

Fully describes the name and type of a parameter a shader exposes.

### `unreal.ComputeDataInterface`
Inherits: `Object` | Header: `ComputeDataInterface.h`

Compute Data Interface required to compile a Compute Graph. Compute Kernels require Data Interfaces to fulfill their external functions. Compute Data Interfaces define how Compute Data Providers will ...

### `unreal.ComputeDataProvider`
Inherits: `Object` | Header: `ComputeDataProvider.h`

Compute Framework Data Provider. A concrete instance of this is responsible for supplying data declared by a UComputeDataInterface. One of these must be created for each UComputeDataInterface object i...

### `unreal.ComputeGraph`
Inherits: `Object` | Header: `ComputeGraph.h`

Class representing a Compute Graph. This holds the basic topology of the graph and is responsible for linking Kernels with Data Interfaces and compiling the resulting shader code. Multiple Compute Gra...

### `unreal.ComputeGraphComponent`
Inherits: `ActorComponent` | Header: `ComputeGraphComponent.h`

Component which holds a context for a UComputeGraph. This object binds the graph to its data providers, and queues the execution.

**Methods** (3):
  - `create_data_providers(binding_index, binding_object)` -> `None` — Create all the Data Provider objects for a given binding object of the ComputeGraph.
  - `destroy_data_providers()` -> `None` — Destroy all associated DataProvider objects.
  - `queue_execute()` -> `None` — Queue the graph for execution at the next render update.

**Properties** (1):
  - `compute_graph`: `ComputeGraph` — [Read-Write] The Compute Graph asset. (ComputeGraph)

### `unreal.ComputeKernel`
Inherits: `Object` | Header: `ComputeKernel.h`

Base class representing a kernel that will be run as a shader on the GPU.

**Properties** (1):
  - `kernel_flags`: `int` [Read-Only] — [Read-Only] Specifying certain memory access flags allows for optimizations such as kernel fusing. (...

### `unreal.ComputeKernelFromText`
Inherits: `ComputeKernelSource` | Header: `ComputeKernelFromText.h`

Class responsible for loading HLSL text and parsing the options available.

### `unreal.ComputeKernelSource`
Inherits: `Object` | Header: `ComputeKernelSource.h`

Class representing the source for a UComputeKernel We derive from this for each authoring mechanism. (HLSL text, VPL graph, ML Meta Lang, etc.)

### `unreal.ComputeSource`
Inherits: `Object` | Header: `ComputeSource.h`

Class representing some source for inclusion in a UComputeKernel. We derive from this for each authoring mechanism. (HLSL text, VPL graph, ML Meta Lang, etc.)

### `unreal.ComputeSourceFromText`
Inherits: `ComputeSource` | Header: `ComputeSourceFromText.h`

Class responsible for loading HLSL text and parsing any metadata available.
