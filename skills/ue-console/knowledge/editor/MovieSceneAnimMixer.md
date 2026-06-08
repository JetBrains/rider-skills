# UE Python API — MovieSceneAnimMixer Module

**5 types** from the `MovieSceneAnimMixer` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimNode_SequencerMixerTarget`, `MovieSceneAnimationMixerTrack`, `MovieSceneRootMotionSection`, `SequencerMixedAnimInstance`, `MovieSceneRootMotionSpace`

---

## Classes

### `unreal.AnimNode_SequencerMixerTarget`
Inherits: `AnimNode_Base` | Header: `AnimNode_SequencerMixerTarget.h`

Anim Node Sequencer Mixer Target

**Properties** (2):
  - `source_pose`: `PoseLink` — [Read-Write] The source input. This is passed through if there is no animation received from the lev...
  - `target_name`: `Name` — [Read-Write] The target name for the level sequence to match with when applying its animation. (Name...

### `unreal.MovieSceneAnimationMixerTrack`
Inherits: `MovieSceneCommonAnimationTrack` | Header: `MovieSceneAnimationMixerTrack.h`

Movie Scene Animation Mixer Track

### `unreal.MovieSceneRootMotionSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneRootMotionSection.h`

Movie Scene Root Motion Section

### `unreal.SequencerMixedAnimInstance`
Inherits: `AnimInstance` | Header: `MovieSceneAnimInstanceTargetSystem.h`

Custom anim instance and proxy that take an anim evaluation task, evaluate it, and push the resulting pose to the skeleton.

### `unreal.MovieSceneRootMotionSpace`
Inherits: `EnumBase` | Header: `MovieSceneAnimationMixerTrack.h`

Enum describing what space that root motion should be applied in.

**Properties** (2):
  - `ANIMATION_SPACE`: `MovieSceneRootMotionSpace = Ellipsis` — Root motion should be applied in animation space, meaning that it will be applied on top of the blen...
  - `WORLD_SPACE`: `MovieSceneRootMotionSpace = Ellipsis` — Root motion should be applied in world space, meaning that it will override any transform track or t...
