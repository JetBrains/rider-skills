# UE Python API — HarmonixMetasoundTests Module

**10 types** from the `HarmonixMetasoundTests` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `HarmonixFunctionalTestAction`, `HarmonixFunctionalTestActionDelay`, `HarmonixFunctionalTestActionFinishTest`, `HarmonixFunctionalTestActionParallel`, `HarmonixFunctionalTestActionSequence`, `HarmonixFunctionalTestActionWaitForTimeout`, `HarmonixMetasoundFunctionalTest`, `HarmonixMetasoundFunctionalTestActionSetAudioParameter`, `HarmonixMetasoundFunctionalTestActionSetWaitForAudioFinished`, `HarmonixMetasoundFunctionalTestLibrary`

---

## Classes

### `unreal.HarmonixFunctionalTestAction`
Inherits: `Object` | Header: `HarmonixFunctionalTestAction.h`

Harmonix Functional Test Action

**Methods** (6):
  - `finish(continue_ = True)` -> `None` — called by the user when finished with the step
  - `is_finished()` -> `bool` — Is Finished
  - `on_finished()` -> `None` — On Finished
  - `on_start(test)` -> `None` — On Start
  - `prepare(test)` -> `None` — Prepare
  - `tick(test, delta_seconds)` -> `None` — Tick

### `unreal.HarmonixFunctionalTestActionDelay`
Inherits: `HarmonixFunctionalTestAction` | Header: `HarmonixFunctionalTestAction.h`

Harmonix Functional Test Action Delay

### `unreal.HarmonixFunctionalTestActionFinishTest`
Inherits: `HarmonixFunctionalTestAction` | Header: `HarmonixFunctionalTestAction.h`

Harmonix Functional Test Action Finish Test

### `unreal.HarmonixFunctionalTestActionParallel`
Inherits: `HarmonixFunctionalTestAction` | Header: `HarmonixFunctionalTestAction.h`

Harmonix Functional Test Action Parallel

### `unreal.HarmonixFunctionalTestActionSequence`
Inherits: `HarmonixFunctionalTestAction` | Header: `HarmonixFunctionalTestAction.h`

Harmonix Functional Test Action Sequence

### `unreal.HarmonixFunctionalTestActionWaitForTimeout`
Inherits: `HarmonixFunctionalTestAction` | Header: `HarmonixFunctionalTestAction.h`

Harmonix Functional Test Action Wait for Timeout

### `unreal.HarmonixMetasoundFunctionalTest`
Inherits: `FunctionalTest` | Header: `HarmonixMetasoundFunctionalTest.h`

Harmonix Metasound Functional Test

### `unreal.HarmonixMetasoundFunctionalTestActionSetAudioParameter`
Inherits: `HarmonixFunctionalTestAction` | Header: `HarmonixMetasoundFunctionalTestAction.h`

Harmonix Metasound Functional Test Action Set Audio Parameter

### `unreal.HarmonixMetasoundFunctionalTestActionSetWaitForAudioFinished`
Inherits: `HarmonixFunctionalTestAction` | Header: `HarmonixMetasoundFunctionalTestAction.h`

Harmonix Metasound Functional Test Action Set Wait for Audio Finished

### `unreal.HarmonixMetasoundFunctionalTestLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `HarmonixMetasoundFunctionalTest.h`

Harmonix Metasound Functional Test Library

**Methods** (2):
  - `add_midi_stream_logger(generator_handle, output_name)` -> `bool` [classmethod] — Add Midi Stream Logger
  - `add_output_logger(generator_handle, output_name, type)` -> `bool` [classmethod] — Add Output Logger
