# UE Python API — AnimationLocomotionLibraryRuntime Module

**2 types** from the `AnimationLocomotionLibraryRuntime` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimCharacterMovementLibrary`, `AnimDistanceMatchingLibrary`

---

## Classes

### `unreal.AnimCharacterMovementLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AnimCharacterMovementLibrary.h`

Library of common techniques for driving character locomotion animations.

**Methods** (2):
  - `predict_ground_movement_pivot_location(acceleration, velocity, ground_friction)` -> `Vector` [classmethod] — Predict where the character will change direction during a pivot based on its current movement properties and parameters...
  - `predict_ground_movement_stop_location(velocity, use_separate_braking_friction, braking_friction, ground_friction, braking_friction_factor, braking_deceleration_walking)` -> `Vector` [classmethod] — Predict where the character will stop based on its current movement properties and parameters from the movement componen...

### `unreal.AnimDistanceMatchingLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AnimDistanceMatchingLibrary.h`

Library of techniques for driving animations by distance metrics rather than by time. These techniques can be effective at compensating for differences between character movement and authored motion i...

**Methods** (3):
  - `advance_time_by_distance_matching(update_context, sequence_evaluator, distance_traveled, distance_curve_name, play_rate_clamp = [0.750000,1.250000])` -> `SequenceEvaluatorReference` [classmethod] — Advance the sequence evaluator forward by distance traveled rather than time. A distance curve is required on the animat...
  - `distance_match_to_target(sequence_evaluator, distance_to_target, distance_curve_name)` -> `SequenceEvaluatorReference` [classmethod] — Set the time of the sequence evaluator to the point in the animation where the distance curve matches the DistanceToTarg...
  - `set_playrate_to_match_speed(sequence_player, speed_to_match, play_rate_clamp = [0.750000,1.250000])` -> `SequencePlayerReference` [classmethod] — Set the play rate of the sequence player so that the speed of the animation matches in-game movement speed. While distan...
