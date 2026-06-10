# UE Python API — TakeRecorder Module

**32 types** from the `TakeRecorder` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `TakeRecorderParameters`, `TakeRecorderProjectParameters`, `TakeRecorderSequenceParameters`, `TakeRecorderUserParameters`, `TakeRecorder`, `TakeRecorderBlueprintLibrary`, `TakeRecorderOverlayWidget`, `TakeRecorderPanel`, `TakeRecorderProjectSettings`, `TakeRecorderSubsystem`, `TakeRecorderUserSettings`, `TakeRecorderMode`, `TakeRecorderPanelMode`, `TakeRecorderState`, `OnTakeRecorderCancelled`, `OnTakeRecorderFinished`, `OnTakeRecorderMarkedFrameAdded`, `OnTakeRecorderPanelChanged`, `OnTakeRecorderPreInitialize`, `OnTakeRecorderSourceAddedDynamic`, ... (32 total)

---

## Classes

### `unreal.TakeRecorderParameters`
Inherits: `StructBase` | Header: `TakeRecorderParameters.h`

Structure housing all configurable parameters for a take recorder instance

**Properties** (5):
  - `open_sequencer`: `bool` — [Read-Write] If sequencer should open when starting a recording. (bool)
  - `project`: `TakeRecorderProjectParameters` — [Read-Write] (TakeRecorderProjectParameters)
  - `start_frame`: `FrameNumber` — [Read-Write] (FrameNumber)
  - `take_recorder_mode`: `TakeRecorderMode` — [Read-Write] (TakeRecorderMode)
  - `user`: `TakeRecorderUserParameters` — [Read-Write] (TakeRecorderUserParameters)

### `unreal.TakeRecorderProjectParameters`
Inherits: `StructBase` | Header: `TakeRecorderParameters.h`

Take Recorder Project Parameters

**Properties** (9):
  - `default_slate`: `str` — [Read-Write] The default name to use for the Slate information (str)
  - `record_sources_into_sub_sequences`: `bool` — [Read-Write] If enabled, each Source will be recorded into a separate Sequence and embedded in the R...
  - `record_timecode`: `bool` — [Read-Write] If enabled, timecode will be recorded into each actor track (bool)
  - `record_to_possessable`: `bool` — [Read-Write] * If enabled, all recorded actors will be recorded to possessable object bindings in Se...
  - `recording_clock_source`: `UpdateClockSource` — [Read-Write] The clock source to use when recording (UpdateClockSource)
  - `root_take_save_dir`: `DirectoryPath` — [Read-Write] The root of the directory in which to save recorded takes. (DirectoryPath)
  - `show_notifications`: `bool` — [Read-Write] Whether to show notification windows or not when recording (bool)
  - `start_at_current_timecode`: `bool` — [Read-Write] If enabled, track sections will start at the current timecode. Otherwise, 0. (bool)
  - `take_save_dir`: `str` — [Read-Write] The name of the directory in which to save recorded takes. Supports any of the followin...

### `unreal.TakeRecorderSequenceParameters`
Inherits: `StructBase` | Header: `TakeRecorderParameters.h`

Parameters for initializing a new sequence.

**Properties** (4):
  - `base_preset`: `TakePreset` — [Read-Write] A preset asset to base the recording off (TakePreset)
  - `base_sequence`: `LevelSequence` — [Read-Write] A level sequence asset to base the recording off (LevelSequence)
  - `record_into_sequence`: `LevelSequence` — [Read-Write] A level sequence asset to record into (LevelSequence)
  - `sequence_to_view`: `LevelSequence` — [Read-Write] A sequence that should be shown directly on the take recorder UI (LevelSequence)

### `unreal.TakeRecorderUserParameters`
Inherits: `StructBase` | Header: `TakeRecorderParameters.h`

Take Recorder User Parameters

**Properties** (10):
  - `auto_lock`: `bool` — [Read-Write] Whether to lock the level sequence when done recording (bool)
  - `auto_serialize`: `bool` — [Read-Write] Whether to incrementally serialize and store some data while recording (bool)
  - `countdown_seconds`: `float` — [Read-Write] Delay that we will use before starting recording (float)
  - `engine_time_dilation`: `float` — [Read-Write] The engine time dilation to apply during the recording (float)
  - `maximize_viewport`: `bool` — [Read-Write] Whether to maximize the viewport (enter Immersive Mode) when recording (bool)
  - `reduce_keys_tolerance`: `float` — [Read-Write] Tolerance to use when reducing keys (float)
  - `remove_redundant_tracks`: `bool` — [Read-Write] Recommended for use with recorded spawnables. Beware that changes to actor instances in...
  - `reset_playhead`: `bool` — [Read-Write] Reset playhead to beginning of the playback range when starting recording (bool)
  - `save_recorded_assets`: `bool` — [Read-Write] Whether to save recorded level sequences and assets when done recording (bool)
  - `stop_at_playback_end`: `bool` — [Read-Write] Automatically stop recording when reaching the end of the playback range (bool)

### `unreal.TakeRecorder`
Inherits: `Object` | Header: `TakeRecorder.h`

Take Recorder

**Methods** (4):
  - `get_countdown_seconds()` -> `float` — Access the number of seconds remaining before this recording will start
  - `get_sequence()` -> `LevelSequence` — Access the sequence asset that this recorder is recording into
  - `get_state()` -> `TakeRecorderState` — Get the current state of this recorder
  - `set_countdown(seconds)` -> `None` — Sets the current countdown time in seconds.

### `unreal.TakeRecorderBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `TakeRecorderBlueprintLibrary.h`

Take Recorder Blueprint Library

**Methods** (17):
  - `cancel_recording()` -> `None` [classmethod] — Cancel recording if there is a recorder currently active
  - `get_active_recorder()` -> `TakeRecorder` [classmethod] — Retrieve the currently active recorder, or None if there none are active
  - `get_default_parameters()` -> `TakeRecorderParameters` [classmethod] — Get the default recorder parameters according to the project and user settings
  - `get_take_recorder_panel()` -> `TakeRecorderPanel` [classmethod] — Get the currently open take recorder panel, if one is open
  - `is_recording()` -> `bool` [classmethod] — Check whether a recording is currently active
  - `is_take_recorder_enabled()` -> `bool` [classmethod] — Is the Take Recorder enabled in the build
  - `open_take_recorder_panel()` -> `TakeRecorderPanel` [classmethod] — Get the currently open take recorder panel, if one is open, opening a new one if not
  - `set_default_parameters(default_parameters)` -> `None` [classmethod] — Set the default recorder parameters
  - `set_on_take_recorder_cancelled(on_take_recorder_cancelled)` -> `None` [classmethod] — Set on Take Recorder Cancelled deprecated: Please use TakeRecorderSubsystem::TakeRecorderCancelled
  - `set_on_take_recorder_finished(on_take_recorder_finished)` -> `None` [classmethod] — Set on Take Recorder Finished deprecated: Please use TakeRecorderSubsystem::TakeRecorderFinished
  - `set_on_take_recorder_marked_frame_added(on_take_recorder_marked_frame_added)` -> `None` [classmethod] — Set on Take Recorder Marked Frame Added deprecated: Please use TakeRecorderSubsystem::TakeRecorderMarkedFrameAdded
  - `set_on_take_recorder_panel_changed(on_take_recorder_panel_changed)` -> `None` [classmethod] — Called when a Take Panel is constructed or destroyed.
  - `set_on_take_recorder_pre_initialize(on_take_recorder_pre_initialize)` -> `None` [classmethod] — Set on Take Recorder Pre Initialize deprecated: Please use TakeRecorderSubsystem::TakeRecorderPreInitialize
  - `set_on_take_recorder_started(on_take_recorder_started)` -> `None` [classmethod] — Set on Take Recorder Started deprecated: Please use TakeRecorderSubsystem::TakeRecorderStarted
  - `set_on_take_recorder_stopped(on_take_recorder_stopped)` -> `None` [classmethod] — Set on Take Recorder Stopped deprecated: Please use TakeRecorderSubsystem::TakeRecorderStopped
  - `start_recording(level_sequence, sources, meta_data, parameters)` -> `TakeRecorder` [classmethod] — Start a new recording using the specified parameters. Will fail if a recording is currently in progress
  - `stop_recording()` -> `None` [classmethod] — Stop recording if there is a recorder currently active

### `unreal.TakeRecorderOverlayWidget`
Inherits: `UserWidget` | Header: `TakeRecorderOverlayWidget.h`

Take Recorder Overlay Widget

**Properties** (1):
  - `recorder`: `TakeRecorder` [Read-Only] — [Read-Only] The recorder that this overlay is reflecting (TakeRecorder)

### `unreal.TakeRecorderPanel`
Inherits: `Object` | Header: `TakeRecorderPanel.h`

Take recorder UI panel interop object

**Methods** (17):
  - `can_start_recording()` -> `Text or None` — Whether the panel is ready to start recording
  - `clear_pending_take()` -> `None`
  - `get_frame_rate()` -> `FrameRate` — Access the frame rate for this take
  - `get_last_recorded_level_sequence()` -> `LevelSequence` — Access the last level sequence that was recorded
  - `get_level_sequence()` -> `LevelSequence` — Access the level sequence for this take
  - `get_mode()` -> `TakeRecorderPanelMode` — Get the mode that the panel is currently in
  - `get_sources()` -> `TakeRecorderSources` — Access the sources that are to be (or were) used for recording this take
  - `get_take_meta_data()` -> `TakeMetaData` — Access take meta data for this take
  - `set_frame_rate(frame_rate)` -> `None` — Set the frame rate for this take
  - `set_frame_rate_from_timecode(from_timecode)` -> `None` — Set if the frame rate is set from the Timecode frame rate
  - `setup_for_editing(take_preset)` -> `None` — Setup this panel as an editor for the specified take preset asset.
  - `setup_for_recording_into_level_sequence(level_sequence_asset)` -> `None` — Setup this panel such that it is ready to start recording using the specified level sequence asset to record into.
  - `setup_for_recording_level_sequence(level_sequence_asset)` -> `None` — Setup this panel such that it is ready to start recording using the specified level sequence asset as a template for the...
  - `setup_for_recording_take_preset(take_preset_asset)` -> `None` — Setup this panel such that it is ready to start recording using the specified take preset as a template for the recordin...
  - `setup_for_viewing(level_sequence_asset)` -> `None` — Setup this panel as a viewer for a previously recorded take.
  - `start_recording()` -> `None` — Start recording with the current take
  - `stop_recording()` -> `None` — Stop recording with the current take

### `unreal.TakeRecorderProjectSettings`
Inherits: `Object` | Header: `TakeRecorderSettings.h`

Universal take recorder settings that apply to a whole take

**Properties** (1):
  - `settings`: `TakeRecorderProjectParameters` [Read-Only] — [Read-Only] (TakeRecorderProjectParameters)

### `unreal.TakeRecorderSubsystem`
Inherits: `EngineSubsystem` | Header: `TakeRecorderSubsystem.h`

UTakeRecorderSubsystem Subsystem for Take Recorder. SetTargetSequence() needs to be called at least once prior to use. This will perform additional initialization and register the subsystem as tickabl...

**Methods** (40):
  - `add_source(source_class)` -> `TakeRecorderSource` — Add a source by a source class.
  - `add_source_for_actor(actor, reduce_keys = True, show_progress = True)` -> `None`
  - `can_review_last_recording()` -> `bool` — Can we review the last recording?
  - `cancel_recording(show_confirm_message = True)` -> `None` — Cancel an in-progress recording.
  - `clear_pending_take()` -> `None` — Clear the pending take.
  - `clear_sources()` -> `None` — Remove all sources from the current sequence.
  - `get_all_sources_copy()` -> `Array [ TakeRecorderSource ]` — Retrieves a copy of the list of sources that are being recorded. This is intended for Blueprint usages which cannot use ...
  - `get_frame_rate()` -> `FrameRate` — Access the frame rate for this take
  - `get_global_record_settings()` -> `TakeRecorderParameters` — Retrieve the global take recorder settings.
  - `get_last_recorded_level_sequence()` -> `LevelSequence` — Retrieve the Last Recorded Level Sequence if it exists.
  - `get_level_sequence()` -> `LevelSequence` — Return the level sequence we are using.
  - `get_next_take_number(slate)` -> `int32` — Compute the next take number given a slate.
  - `get_number_of_takes(out_num_takes=int32)` — Find both the current maximum take value and the total number of takes for a given slate.
  - `get_pending_take()` -> `TakePreset` — Retrieve the pending take. This may be null.
  - `get_slates(package_path = 'None')` -> `Array [ AssetData ]` — Retrieve all slates.
  - `get_source_actor(source)` -> `Actor` — Retrieve the actor from a source, if applicable.
  - `get_source_by_class(source_class)` -> `TakeRecorderSource` — Retrieve the first source of the given class.
  - `get_source_record_settings(source)` -> `Array [ Object ]` — Retrieve additional settings objects from a source.
  - `get_sources()` -> `TakeRecorderSources` — Retrieve the sources.
  - `get_state()` -> `TakeRecorderState` — Retrieve the current take recorder state.
  - `get_take_meta_data()` -> `TakeMetaData` — Retrieve the current meta data.
  - `get_take_recorder_mode()` -> `TakeRecorderMode` — The current take recorder mode.
  - `is_recording()` -> `bool` — If Take Recorder is currently recording.
  - `is_reviewing()` -> `bool` — If Take Recorder is currently reviewing.
  - `mark_frame()` -> `bool` — Mark the current frame.
  - `remove_actor_from_sources(actor)` -> `None` — Remove an actor from available sources.
  - `remove_source(source)` -> `None` — Remove a given source.
  - `reset_to_pending_take()` -> `None` — Reset to the pending take.
  - `revert_changes()` -> `None` — Revert any changes restoring the preset origin.
  - `review_last_recording()` -> `bool` — Supply the last recording if it exists.
  - `set_frame_rate(frame_rate)` -> `None` — Set the frame rate for this take
  - `set_frame_rate_from_timecode()` -> `None` — Set if the frame rate is set from the Timecode frame rate
  - `set_global_record_settings(parameters)` -> `None` — Set the global take recorder settings.
  - `set_sequence_countdown(seconds)` -> `None` — Sets the current sequenceâs countdown.
  - `set_slate_name(slate_name, emit_changed = True)` -> `None` — Directly set the slate name.
  - `set_take_number(new_take_number, emit_changed = True)` -> `None` — Directly set the take number.
  - `set_target_sequence(data = [None,None,None,None])` -> `None` — Provide sequence data for this take recorder. This will also perform initialization of the subsystem. This must be calle...
  - `start_recording(open_sequencer = True, show_error_message = True)` -> `bool` — Begin a new recording.
  - `stop_recording()` -> `None` — Stop an existing recording.
  - `try_get_sequence_countdown()` -> `float or None` — Retrieve the current sequenceâs countdown.

**Properties** (11):
  - `take_recorder_cancelled`: `TakeRecorderCancelled` — [Read-Write] Called when take recorder is cancelled (TakeRecorderCancelled)
  - `take_recorder_finished`: `TakeRecorderFinished` — [Read-Write] Called when take recorder has finished (TakeRecorderFinished)
  - `take_recorder_initialized`: `TakeRecorderInitialized` — [Read-Write] called when take recorder is initializing. (TakeRecorderInitialized)
  - `take_recorder_marked_frame_added`: `TakeRecorderMarkedFrameAdded` — [Read-Write] Called when a marked frame is added to take recorder (TakeRecorderMarkedFrameAdded)
  - `take_recorder_pre_initialize`: `TakeRecorderPreInitialize` — [Read-Write] Called before initialization occurs (ie. when the recording button is pressed and befor...
  - `take_recorder_slate_changed`: `TakeRecorderSlateChanged` — [Read-Write] Called when a take recorder slate changes. (TakeRecorderSlateChanged)
  - `take_recorder_source_added`: `OnTakeRecorderSourceAddedDynamic` — [Read-Write] Multicast delegate when any source has been added. (OnTakeRecorderSourceAddedDynamic)
  - `take_recorder_source_removed`: `OnTakeRecorderSourceRemovedDynamic` — [Read-Write] Multicast delegate when any source has been removed. (OnTakeRecorderSourceRemovedDynami...
  - `take_recorder_started`: `TakeRecorderStarted` — [Read-Write] Called when take recorder is started (TakeRecorderStarted)
  - `take_recorder_stopped`: `TakeRecorderStopped` — [Read-Write] Called when take recorder is stopped (TakeRecorderStopped)
  - `take_recorder_take_number_changed`: `TakeRecorderTakeNumberChanged` — [Read-Write] Called when a take recorder take number changes. (TakeRecorderTakeNumberChanged)

### `unreal.TakeRecorderUserSettings`
Inherits: `Object` | Header: `TakeRecorderSettings.h`

Universal take recorder settings that apply to a whole take

**Properties** (1):
  - `settings`: `TakeRecorderUserParameters` [Read-Only] — [Read-Only] User settings that should be passed to a recorder instance (TakeRecorderUserParameters)

### `unreal.TakeRecorderMode`
Inherits: `EnumBase` | Header: `TakeRecorderParameters.h`

ETake Recorder Mode

**Properties** (2):
  - `RECORD_INTO_SEQUENCE`: `TakeRecorderMode = Ellipsis` — Record into an existing sequence 1
  - `RECORD_NEW_SEQUENCE`: `TakeRecorderMode = Ellipsis` — Record into a new sequence 0

### `unreal.TakeRecorderPanelMode`
Inherits: `EnumBase` | Header: `TakeRecorderPanel.h`

ETake Recorder Panel Mode

**Properties** (4):
  - `EDITING_PRESET`: `TakeRecorderPanelMode = Ellipsis` — The panel is editing a Take Preset asset 2
  - `NEW_RECORDING`: `TakeRecorderPanelMode = Ellipsis` — The panel is setting up a new recording 0
  - `RECORDING_INTO`: `TakeRecorderPanelMode = Ellipsis` — The panel is setting up recording into an existing level sequence 1
  - `REVIEWING_RECORDING`: `TakeRecorderPanelMode = Ellipsis` — The panel is reviewing a previously recorded take 3

### `unreal.TakeRecorderState`
Inherits: `EnumBase` | Header: `TakeRecorder.h`

ETake Recorder State

**Properties** (7):
  - `CANCELLED`: `TakeRecorderState = Ellipsis` — 6
  - `COUNTING_DOWN`: `TakeRecorderState = Ellipsis` — 1
  - `PRE_INITIALIZATION`: `TakeRecorderState = Ellipsis` — 0
  - `PRE_RECORD`: `TakeRecorderState = Ellipsis` — 2
  - `STARTED`: `TakeRecorderState = Ellipsis` — 4
  - `STOPPED`: `TakeRecorderState = Ellipsis` — 5
  - `TICKING_AFTER_PRE`: `TakeRecorderState = Ellipsis` — 3

### `unreal.OnTakeRecorderCancelled`
Inherits: `DelegateBase` | Header: `TakeRecorderBlueprintLibrary.h`

On Take Recorder Cancelled Delegate Signature

### `unreal.OnTakeRecorderFinished`
Inherits: `DelegateBase` | Header: `TakeRecorderBlueprintLibrary.h`

On Take Recorder Finished Delegate Signature

### `unreal.OnTakeRecorderMarkedFrameAdded`
Inherits: `DelegateBase` | Header: `TakeRecorderBlueprintLibrary.h`

On Take Recorder Marked Frame Added Delegate Signature

### `unreal.OnTakeRecorderPanelChanged`
Inherits: `DelegateBase` | Header: `TakeRecorderBlueprintLibrary.h`

On Take Recorder Panel Changed Delegate Signature

### `unreal.OnTakeRecorderPreInitialize`
Inherits: `DelegateBase` | Header: `TakeRecorderBlueprintLibrary.h`

On Take Recorder Pre Initialize Delegate Signature

### `unreal.OnTakeRecorderSourceAddedDynamic`
Inherits: `MulticastDelegateBase` | Header: `TakeRecorderSubsystem.h`

Dynamic delegates for source modification. These are reproductions of static ones declared under UTakeRecorderSource. We do this so we can successfully leverage static delegates within the TakesCore m...

### `unreal.OnTakeRecorderSourceRemovedDynamic`
Inherits: `MulticastDelegateBase` | Header: `TakeRecorderSubsystem.h`

On Take Recorder Source Removed Dynamic Delegate Signature

### `unreal.OnTakeRecorderStarted`
Inherits: `DelegateBase` | Header: `TakeRecorderBlueprintLibrary.h`

On Take Recorder Started Delegate Signature

### `unreal.OnTakeRecorderStopped`
Inherits: `DelegateBase` | Header: `TakeRecorderBlueprintLibrary.h`

On Take Recorder Stopped Delegate Signature

### `unreal.TakeRecorderCancelled`
Inherits: `MulticastDelegateBase` | Header: `TakeRecorderSubsystem.h`

Take Recorder Cancelled Delegate Signature

### `unreal.TakeRecorderFinished`
Inherits: `MulticastDelegateBase` | Header: `TakeRecorderSubsystem.h`

Take Recorder Finished Delegate Signature

### `unreal.TakeRecorderInitialized`
Inherits: `MulticastDelegateBase` | Header: `TakeRecorderSubsystem.h`

Take Recorder Initialized Delegate Signature

### `unreal.TakeRecorderMarkedFrameAdded`
Inherits: `MulticastDelegateBase` | Header: `TakeRecorderSubsystem.h`

Take Recorder Marked Frame Added Delegate Signature

### `unreal.TakeRecorderPreInitialize`
Inherits: `MulticastDelegateBase` | Header: `TakeRecorderSubsystem.h`

Take Recorder Pre Initialize Delegate Signature

### `unreal.TakeRecorderSlateChanged`
Inherits: `MulticastDelegateBase` | Header: `TakeRecorderSubsystem.h`

Take Recorder Slate Changed Delegate Signature

### `unreal.TakeRecorderStarted`
Inherits: `MulticastDelegateBase` | Header: `TakeRecorderSubsystem.h`

Take Recorder Started Delegate Signature

### `unreal.TakeRecorderStopped`
Inherits: `MulticastDelegateBase` | Header: `TakeRecorderSubsystem.h`

Take Recorder Stopped Delegate Signature

### `unreal.TakeRecorderTakeNumberChanged`
Inherits: `MulticastDelegateBase` | Header: `TakeRecorderSubsystem.h`

Take Recorder Take Number Changed Delegate Signature
