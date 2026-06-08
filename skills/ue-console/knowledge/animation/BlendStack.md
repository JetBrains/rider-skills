# UE Python API — BlendStack Module

**8 types** from the `BlendStack` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimNode_BlendStack`, `AnimNode_BlendStack_Standalone`, `AnimNode_BlendStackInput`, `BlendStackAnimNodeReference`, `BlendStackInputAnimNodeReference`, `BlendStackAnimNodeLibrary`, `BlendStackInputAnimNodeLibrary`, `BlendStack_BlendspaceUpdateMode`

---

## Classes

### `unreal.AnimNode_BlendStack`
Inherits: `AnimNode_BlendStack_Standalone` | Header: `AnimNode_BlendStack.h`

Anim Node Blend Stack

**Properties** (11):
  - `activation_delay_time`: `float` — [Read-Write] delay in seconds before activating AnimationAsset playing from AnimationTime
assets que...
  - `animation_asset`: `AnimationAsset` — [Read-Write] requested animation to play (AnimationAsset)
  - `animation_time`: `float` — [Read-Write] requested animation time (float)
  - `blend_option`: `AlphaBlendOption` — [Read-Write] (AlphaBlendOption)
  - `blend_parameters`: `Vector` — [Read-Write] requested blend space blend parameters (if AnimationAsset is a blend space) (Vector)
  - `blend_profile`: `BlendProfile` — [Read-Write] (BlendProfile)
  - `blend_time`: `float` — [Read-Write] tunable animation transition blend time (float)
  - `loop`: `bool` — [Read-Write] requested AnimationAsset looping (bool)
  - `max_animation_delta_time`: `float` — [Read-Write] if MaxAnimationDeltaTime is positive and the currently playing animation accumulated ti...
  - `mirrored`: `bool` — [Read-Write] requested AnimationAsset mirroring (bool)
  - `wanted_play_rate`: `float` — [Read-Write] requested animation play rate (float)

### `unreal.AnimNode_BlendStack_Standalone`
Inherits: `AnimNode_AssetPlayerBase` | Header: `AnimNode_BlendStack.h`

namespace UE::BlendStack

**Properties** (4):
  - `notify_recency_time_out`: `float` — [Read-Write] Window of time after firing a notify that any instance of the same notify will be filte...
  - `stitch_blend_max_cost`: `float` — [Read-Write] if the cost from searching StitchDatabase is above StitchBlendMaxCost, blend stack will...
  - `stitch_blend_time`: `float` — [Read-Write] blend time in seconds used to blend into and out from a stitch animation (float)
  - `stitch_database`: `Object` — [Read-Write] database used to search for an animation stitch to use as blend (Object)

### `unreal.AnimNode_BlendStackInput`
Inherits: `AnimNode_Base` | Header: `AnimNode_BlendStackInput.h`

Input pose that links the blend stackâs sample graph with the sample/pose chosen by the blend stack. Todo:: It might be better to reuse FAnimNode_LinkedInputPose, since we will most likely need vari...

### `unreal.BlendStackAnimNodeReference`
Inherits: `AnimNodeReference` | Header: `BlendStackAnimNodeLibrary.h`

Blend Stack Anim Node Reference

### `unreal.BlendStackInputAnimNodeReference`
Inherits: `AnimNodeReference` | Header: `BlendStackInputAnimNodeLibrary.h`

Blend Stack Input Anim Node Reference

### `unreal.BlendStackAnimNodeLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `BlendStackAnimNodeLibrary.h`

Exposes operations that can be run on a Blend Stack node via Anim Node Functions such as âOn Become Relevantâ and âOn Updateâ.

**Methods** (14):
  - `blend_to(context, blend_stack_node, animation_asset = None, animation_time = 0.000000, loop = False, mirrored = False, blend_time = 0.200000, blend_parameters = [0.000000,0.000000,0.000000], wanted_play_rate = 1.000000, activation_delay = 0.000000)` -> `None` [classmethod] — Blend To
  - `blend_to_with_settings(context, blend_stack_node, animation_asset = None, animation_time = 0.000000, loop = False, mirrored = False, blend_time = 0.200000, blend_profile = None, blend_option = AlphaBlendOption.HERMITE_CUBIC, inertial_blend = False, blend_parameters = [0.000000,0.000000,0.000000], wanted_play_rate = 1.000000, activation_delay = 0.000000)` -> `None` [classmethod] — Note: Experimental and subject to change!
  - `convert_to_blend_stack_node(result=AnimNodeReferenceConversionResult)` [classmethod] — Get a blend stack node context from an anim node context
  - `convert_to_blend_stack_node_pure(result=bool)` [classmethod] — Get a blend stack node context from an anim node context (pure)
  - `force_blend_next_update(blend_stack_node)` -> `None` [classmethod] — Force Blend Next Update
  - `get_current_asset(blend_stack_node)` -> `AnimationAsset` [classmethod] — Get Current Asset
  - `get_current_asset_time(blend_stack_node)` -> `float` [classmethod] — Get Current Asset Time
  - `get_current_asset_time_remaining(blend_stack_node)` -> `float` [classmethod] — Get Current Asset Time Remaining
  - `get_current_blend_stack_anim_asset(node)` -> `AnimationAsset` [classmethod] — Get the current AnimationAsset that is playing from a Blend Stack Input node
  - `get_current_blend_stack_anim_asset_mirror_table(node)` -> `MirrorDataTable` [classmethod] — Get current AssetMirrorTable from a Blend Stack Input node
  - `get_current_blend_stack_anim_asset_mirrored(node)` -> `bool` [classmethod] — Get if we are currently mirrored from a Blend Stack Input node
  - `get_current_blend_stack_anim_asset_time(node)` -> `float` [classmethod] — Get the current elapsed time of the animation that is playing from a Blend Stack Input node
  - `get_current_blend_stack_anim_is_active(node)` -> `bool` [classmethod] — Get if current anim is active
  - `is_current_asset_looping(blend_stack_node)` -> `bool` [classmethod] — Is Current Asset Looping

### `unreal.BlendStackInputAnimNodeLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `BlendStackInputAnimNodeLibrary.h`

Exposes operations that can be run on a Blend Stack node via Anim Node Functions such as âOn Become Relevantâ and âOn Updateâ.

**Methods** (3):
  - `convert_to_blend_stack_input_node(result=AnimNodeReferenceConversionResult)` [classmethod] — Get a blend stack input node context from an anim node context
  - `convert_to_blend_stack_input_node_pure(result=bool)` [classmethod] — Get a blend stack input node context from an anim node context (pure)
  - `get_properties(accumulated_time=float)` [classmethod] — Get Properties

### `unreal.BlendStack_BlendspaceUpdateMode`
Inherits: `EnumBase` | Header: `AnimNode_BlendStack.h`

EBlend Stack Blendspace Update Mode

**Properties** (3):
  - `INITIAL_ONLY`: `BlendStack_BlendspaceUpdateMode = Ellipsis` — Only update the blendspace xy inputs once on blend in. 0
  - `UPDATE_ACTIVE_ONLY`: `BlendStack_BlendspaceUpdateMode = Ellipsis` — Update the active/most recent blendspace xy inputs every frame. 1
  - `UPDATE_ALL`: `BlendStack_BlendspaceUpdateMode = Ellipsis` — Update all blendspaces xy inputs every frame. 2
