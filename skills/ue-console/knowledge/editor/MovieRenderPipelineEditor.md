# UE Python API — MovieRenderPipelineEditor Module

**14 types** from the `MovieRenderPipelineEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DummyRenderLayerOnlyNode`, `MovieGraphConfigFactory`, `MovieGraphQuickRenderSubsystem`, `MoviePipelineEditorLibrary`, `MoviePipelineFunctionalTestBase`, `MoviePipelineNewProcessExecutor`, `MoviePipelinePIEExecutor`, `MoviePipelinePIEExecutorSettings`, `MoviePipelinePrimaryConfigFactory`, `MoviePipelineQueueSubsystem`, `MoviePipelineShotConfigFactory`, `MovieRenderPipelineProjectSettings`, `OnMoviePipelineIndividualJobFinished`, `OnMoviePipelineIndividualJobStarted`

---

## Classes

### `unreal.DummyRenderLayerOnlyNode`
Inherits: `MovieGraphSettingNode` | Header: `MovieGraphEditorTestUtilities.h`

A dummy render layer only node. Currently MRG does not ship with any nodes which are restricted to just render layer branches, so this node exists solely to test functionality of restricting nodes to ...

### `unreal.MovieGraphConfigFactory`
Inherits: `Factory` | Header: `MovieGraphConfigFactory.h`

Movie Graph Config Factory

### `unreal.MovieGraphQuickRenderSubsystem`
Inherits: `EditorSubsystem` | Header: `MovieGraphQuickRender.h`

Provides the ability to perform a âQuick Renderâ. A Quick Render is a render which requires no conventional Movie Render Queue setup, like creating a queue, adding a job(s) to it, specifying the l...

**Methods** (4):
  - `begin_quick_render(quick_render_mode, quick_render_settings)` -> `None` — Begins a quick render using the provided mode and settings.
  - `can_play_last_render()` -> `bool` — Determines if the last render can be played (ie, whether a render has been performed in the current editor session or no...
  - `open_output_directory(quick_render_settings)` -> `None` — Opens the output directory that Quick Render will save media into. This is sourced from the graph that is used for rende...
  - `play_last_render()` -> `None` — Plays the last render that Quick Render generated, using the settings specified in Editor Preferences. If no render has ...

### `unreal.MoviePipelineEditorLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MoviePipelineEditorBlueprintLibrary.h`

Movie Pipeline Editor Blueprint Library

**Methods** (9):
  - `convert_manifest_file_to_string(manifest_file_path)` -> `str` [classmethod] — Loads the specified manifest file and converts it into an FString to be embedded with HTTP REST requests. Use in combina...
  - `create_job_from_sequence(pipeline_queue, sequence)` -> `MoviePipelineExecutorJob` [classmethod] — Create a job from a level sequence. Sets the map as the currently editor world, the author, the sequence and the job nam...
  - `ensure_job_has_default_settings(job)` -> `None` [classmethod] — Ensure the job has the settings specified by the project settings added. If theyâre already added we donât modify th...
  - `export_config_to_asset(config, package_path, file_name, save_asset)` -> `(out_asset=MoviePipelinePrimaryConfig, out_error_reason=Text) or None` [classmethod] — Export Config to Asset
  - `get_display_output_path_from_job(job)` -> `str or None` [classmethod] — Returns display string for output directory for this job. Does not resolve the full path from tokens.
  - `is_map_valid_for_remote_render(jobs)` -> `bool` [classmethod] — Checks to see if any of the Jobs try to point to maps that wouldnât be valid on a remote render (ie: unsaved maps)
  - `resolve_output_directory_from_job(job)` -> `str` [classmethod] — Resolves as much of the output directory for this job into a usable directory path as possible. Cannot resolve anything ...
  - `save_queue_to_manifest_file(out_manifest_file_path=str)` [classmethod] — Take the specified Queue, duplicate it and write it to disk in the ../Saved/MovieRenderPipeline/ folder. Returns the dup...
  - `warn_user_of_unsaved_map()` -> `None` [classmethod] — Pop a dialog box that specifies that they cannot render due to never saved map. Only shows OK button.

### `unreal.MoviePipelineFunctionalTestBase`
Inherits: `FunctionalTest` | Header: `MoviePipelineFunctionalTestBase.h`

Base class for Movie Pipeline functional tests which render pre-made queues and compare their output against pre-existing render outputs.

**Properties** (1):
  - `queue_preset`: `MoviePipelineQueue` [Read-Only] — [Read-Only] (MoviePipelineQueue)

### `unreal.MoviePipelineNewProcessExecutor`
Inherits: `MoviePipelineExecutorBase` | Header: `MoviePipelineNewProcessExecutor.h`

This is the implementation responsible for executing the rendering of multiple movie pipelines on the local machine in an external process. This simply handles launching and managing the external proc...

### `unreal.MoviePipelinePIEExecutor`
Inherits: `MoviePipelineLinearExecutorBase` | Header: `MoviePipelinePIEExecutor.h`

This is the implementation responsible for executing the rendering of multiple movie pipelines in the currently running Editor process. This involves launching a Play in Editor session for each Movie ...

**Methods** (4):
  - `is_rendering_offscreen()` -> `bool` — Will it render without any UI elements showing up (such as the rendering progress window)?
  - `set_allow_using_unsaved_levels(should_allow)` -> `None` — Set whether the executor should be allowed to use unsaved levels when rendering (by default, this is not permitted). The...
  - `set_initialization_time(initialization_time)` -> `None` — Set Initialization Time
  - `set_is_rendering_offscreen(render_offscreen)` -> `None` — Should it render without any UI elements showing up (such as the rendering progress window)?

**Properties** (4):
  - `on_individual_job_finished_delegate`: `OnMoviePipelineIndividualJobFinished` — [Read-Write] (OnMoviePipelineIndividualJobFinished)
  - `on_individual_job_started_delegate`: `OnMoviePipelineIndividualJobStarted` — [Read-Write] Called right before this job is used to initialize a UMoviePipeline. (OnMoviePipelineIn...
  - `on_individual_job_work_finished_delegate`: `MoviePipelineWorkFinished` — [Read-Write] Called after each job is finished in the queue. Params struct contains an output of all...
  - `on_individual_shot_work_finished_delegate`: `MoviePipelineWorkFinished` — [Read-Write] Called after each shot is finished for a particular render. Params struct contains an o...

### `unreal.MoviePipelinePIEExecutorSettings`
Inherits: `DeveloperSettings` | Header: `MoviePipelinePIEExecutorSettings.h`

This is the implementation responsible for executing the rendering of multiple movie pipelines within the editor using PIE.

**Properties** (2):
  - `initial_delay_frame_count`: `int` — [Read-Write] How long should we wait after being initialized to start doing any work? This can be us...
  - `resize_pie_window_to_output_resolution`: `bool` — [Read-Write] Should the PIE Window be created at the same resolution as the MRQ Output? By default w...

### `unreal.MoviePipelinePrimaryConfigFactory`
Inherits: `Factory` | Header: `MoviePipelineConfigFactory.h`

Forward Declare

### `unreal.MoviePipelineQueueSubsystem`
Inherits: `EditorSubsystem` | Header: `MoviePipelineQueueSubsystem.h`

Movie Pipeline Queue Subsystem

**Methods** (9):
  - `get_active_executor()` -> `MoviePipelineExecutorBase` — Returns the active executor (if there is one). This can be used to subscribe to events on an already in-progress render....
  - `get_queue()` -> `MoviePipelineQueue` — Returns the queue of Movie Pipelines that need to be rendered.
  - `is_queue_dirty()` -> `bool` — Returns true if the current queue has been modified since it was loaded, else returns false. Note that the empty queue t...
  - `is_rendering()` -> `bool` — Returns true if there is an active executor working on producing a movie. This could be actively rendering frames, or wo...
  - `load_queue(queue_to_load, prompt_on_replacing_dirty_queue = True)` -> `bool` — Loads a new queue by copying it into the queue subsystemâs current transient queue (the one returned by GetQueue()). I...
  - `render_queue_instance_with_executor(queue, executor_type)` -> `MoviePipelineExecutorBase` — Like RenderQueueWithExecutor(), but a specific queue instance is used rather than the current queue.
  - `render_queue_instance_with_executor_instance(queue, executor)` -> `None` — Like RenderQueueWithExecutorInstance(), but a specific queue instance is used rather than the current queue.
  - `render_queue_with_executor(executor_type)` -> `MoviePipelineExecutorBase` — Starts processing the current queue with the supplied executor class. This starts an async process which may or may not ...
  - `render_queue_with_executor_instance(executor)` -> `None` — Starts processing the current queue with the supplied executor. This starts an async process which may or may not run in...

### `unreal.MoviePipelineShotConfigFactory`
Inherits: `Factory` | Header: `MoviePipelineConfigFactory.h`

Forward Declare

### `unreal.MovieRenderPipelineProjectSettings`
Inherits: `Object` | Header: `MovieRenderPipelineSettings.h`

Universal Movie Render Pipeline settings that apply to the whole project.

**Properties** (9):
  - `default_classes`: `None` — [Read-Write] The settings specified here will automatically be added to a Movie Pipeline Primary Con...
  - `default_executor_job`: `SoftClassPath` — [Read-Write] Which Job class should we create by default when adding a job? This allows you to make ...
  - `default_graph`: `MovieGraphConfig` — [Read-Write] The graph that newly-created graph assets will be based off of. (MovieGraphConfig)
  - `default_local_executor`: `SoftClassPath` — [Read-Write] When the user uses the UI to request we render a movie locally, which implementation sh...
  - `default_pipeline`: `SoftClassPath` — [Read-Write] This allows you to implement your own Pipeline to handle timing and rendering of a movi...
  - `default_quick_render_graph`: `MovieGraphConfig` — [Read-Write] The graph that quick renders will use. (MovieGraphConfig)
  - `default_remote_executor`: `SoftClassPath` — [Read-Write] When the user uses the UI to request we render a movie remotely, which implementation s...
  - `last_preset_origin`: `MoviePipelinePrimaryConfig` — [Read-Write] What was the last configuration preset the user used? Can be null. (MoviePipelinePrimar...
  - `preset_save_dir`: `DirectoryPath` — [Read-Write] Which directory should we try to save presets in by default? (DirectoryPath)

### `unreal.OnMoviePipelineIndividualJobFinished`
Inherits: `MulticastDelegateBase` | Header: `MoviePipelinePIEExecutor.h`

On Movie Pipeline Individual Job Finished Delegate Signature

### `unreal.OnMoviePipelineIndividualJobStarted`
Inherits: `MulticastDelegateBase` | Header: `MoviePipelinePIEExecutor.h`

On Movie Pipeline Individual Job Started Delegate Signature
