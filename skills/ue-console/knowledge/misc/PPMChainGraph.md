# UE Python API — PPMChainGraph Module

**9 types** from the `PPMChainGraph` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `PPMChainGraphInput`, `PPMChainGraphPostProcessPass`, `PPMChainGraph`, `PPMChainGraphActor`, `PPMChainGraphExecutorComponent`, `CameraViewHandling`, `PPMChainGraphExecutionLocation`, `PPMChainGraphOutput`, `PPMChainGraphPPMInputId`

---

## Classes

### `unreal.PPMChainGraphInput`
Inherits: `StructBase` | Header: `PPMChainGraph.h`

This struct is used for customizing Input and External Texture input selection.

**Properties** (1):
  - `input_id`: `str` — [Read-Write] (str)

### `unreal.PPMChainGraphPostProcessPass`
Inherits: `StructBase` | Header: `PPMChainGraph.h`

PPMChain Graph Post Process Pass

**Properties** (5):
  - `enabled`: `bool` — [Read-Write] Is pass enabled. (bool)
  - `inputs`: `None` — [Read-Write] Inputs from previous passes. Map this to Scene Texture node in Post Process Material. (...
  - `output`: `PPMChainGraphOutput` — [Read-Write] Where should this pass write to. By selecting Temporary Render Target as an option,
Use...
  - `post_process_material`: `Material` — [Read-Write] Which material should be executed during this pass. (Material)
  - `temporary_render_target_id`: `str` — [Read-Write] Use this to identify the Output of the current pass to be used later. (str)

### `unreal.PPMChainGraph`
Inherits: `Object` | Header: `PPMChainGraph.h`

Post Process Material Chain Graph defines a collection of Post Process Material of passes that are executed one after another. Individual passes can write into Scene Color or Temporary render target, ...

**Properties** (3):
  - `external_textures`: `None` — [Read-Write] External textures and rendertargets that can be mapped to Scene Texture Inputs. (Map[st...
  - `passes`: `None` — [Read-Write] Post Process Material Passes. Each pass can write into the Scene Color or into a tempor...
  - `point_of_execution`: `PPMChainGraphExecutionLocation` — [Read-Write] Identifies at which point of post processing this graph is going to be executed.
These ...

### `unreal.PPMChainGraphActor`
Inherits: `Actor` | Header: `PPMChainGraphActor.h`

PPMChain Graph Actor

**Properties** (1):
  - `ppm_chain_graph_executor_component`: `PPMChainGraphExecutorComponent` [Read-Only] — [Read-Only] (PPMChainGraphExecutorComponent)

### `unreal.PPMChainGraphExecutorComponent`
Inherits: `SceneComponent` | Header: `PPMChainGraphComponent.h`

PPMChain Graph Executor Component

**Properties** (3):
  - `camera_list`: `None` — [Read-Write] Depending on the selection in the option above the following cameras will either:
1. Be...
  - `camera_view_handling_mode`: `CameraViewHandling` — [Read-Write] PPM Chain Graph Component can either exclude selected cameras from being rendered or re...
  - `ppm_chain_graphs`: `None` — [Read-Write] A list of graphs to be executed. (Array[PPMChainGraph])

### `unreal.CameraViewHandling`
Inherits: `EnumBase` | Header: `PPMChainGraphComponent.h`

ECamera View Handling

**Properties** (2):
  - `IGNORE_CAMERA_VIEWS`: `CameraViewHandling = Ellipsis` — 0
  - `RENDER_ONLY_IN_SELECTED_CAMERA_VIEWS`: `CameraViewHandling = Ellipsis` — 1

### `unreal.PPMChainGraphExecutionLocation`
Inherits: `EnumBase` | Header: `PPMChainGraph.h`

EPPMChain Graph Execution Location

**Properties** (5):
  - `AFTER_FXAA`: `PPMChainGraphExecutionLocation = Ellipsis` — 4
  - `AFTER_MOTION_BLUR`: `PPMChainGraphExecutionLocation = Ellipsis` — SSR Input isnât supported.
AfterSSRInput                          UMETA(DisplayName = âAfter SSR...
  - `AFTER_TONE_MAP`: `PPMChainGraphExecutionLocation = Ellipsis` — 3
  - `AFTER_VISUALIZE_DEPTH_OF_FIELD`: `PPMChainGraphExecutionLocation = Ellipsis` — 5
  - `PRE_POST_PROCESS`: `PPMChainGraphExecutionLocation = Ellipsis` — Default place of execution right before the rest of post processing starts. 0

### `unreal.PPMChainGraphOutput`
Inherits: `EnumBase` | Header: `PPMChainGraph.h`

EPPMChain Graph Output

**Properties** (2):
  - `PPM_OUTPUT_RENDER_TARGET`: `PPMChainGraphOutput = Ellipsis` — Writes into a temporary render target to be used later in the chain.
Users need to provide the name ...
  - `PPM_OUTPUT_SCENE_COLOR`: `PPMChainGraphOutput = Ellipsis` — Write back into Scene Color. 0

### `unreal.PPMChainGraphPPMInputId`
Inherits: `EnumBase` | Header: `PPMChainGraph.h`

EPPMChain Graph PPMInput Id

**Properties** (6):
  - `PPM_INPUT_MAPING_0`: `PPMChainGraphPPMInputId = Ellipsis` — Map to equivalent input in Scene Textures node in the material. 1
  - `PPM_INPUT_MAPING_1`: `PPMChainGraphPPMInputId = Ellipsis` — 2
  - `PPM_INPUT_MAPING_2`: `PPMChainGraphPPMInputId = Ellipsis` — 3
  - `PPM_INPUT_MAPING_3`: `PPMChainGraphPPMInputId = Ellipsis` — 4
  - `PPM_INPUT_MAPING_4`: `PPMChainGraphPPMInputId = Ellipsis` — 5
  - `PPM_INPUT_MAPING_UNASSIGNED`: `PPMChainGraphPPMInputId = Ellipsis` — 0
