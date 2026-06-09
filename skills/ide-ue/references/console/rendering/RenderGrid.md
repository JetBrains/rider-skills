# UE Python API — RenderGrid Module

**9 types** from the `RenderGrid` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `RenderGridRemoteControlPropertyData`, `RenderGrid`, `RenderGridJob`, `RenderGridPropsSourceBase`, `RenderGridPropsSourceLocal`, `RenderGridPropsSourceRemoteControl`, `RenderGridQueue`, `RenderGridRemoteControlUtils`, `RenderGridPropsSourceType`

---

## Classes

### `unreal.RenderGridRemoteControlPropertyData`
Inherits: `StructBase` | Header: `RenderGrid.h`

This struct contains the data for a certain remote control property.

### `unreal.RenderGrid`
Inherits: `Object` | Header: `RenderGrid.h`

This class represents a render grid, which is basically just a collection of render grid jobs. A render grid is the asset that is shown in the content browser, itâs the asset that can be opened and ...

**Methods** (54):
  - `add_render_grid_job(job)` -> `None` — Add Render Grid Job
  - `clear_render_grid_jobs()` -> `None` — Clear Render Grid Jobs
  - `create_and_add_new_render_grid_job()` -> `RenderGridJob` — Creates a new job and adds it to this grid. *
  - `create_temp_render_grid_job()` -> `RenderGridJob` — Creates a new job. This job wonât be added to the grid, so it will eventually be garbage collected. *
  - `does_job_id_exist(job_id)` -> `bool` — Finds whether given job ID already exists in this grid. *
  - `duplicate_and_add_render_grid_job(job)` -> `RenderGridJob` — Copy the given job in this grid. *
  - `generate_new_guid()` -> `None` — Randomly generates a new GUID.
  - `generate_next_job_id()` -> `str` — Generates a unique job ID by finding the currently highest job ID and increasing it by one. *
  - `generate_unique_random_job_id()` -> `str` — Generates a unique job ID by grabbing the current time, as well as 16 random bytes, and converting that to a base64 stri...
  - `get_default_level_sequence()` -> `LevelSequence` — Get Default Level Sequence
  - `get_default_output_directory()` -> `str` — Get Default Output Directory
  - `get_default_output_directory_for_display()` -> `str` — Get Default Output Directory for Display
  - `get_default_render_preset()` -> `MoviePipelinePrimaryConfig` — Get Default Render Preset
  - `get_default_render_preset_output_settings()` -> `MoviePipelineOutputSetting` — Get Default Render Preset Output Settings
  - `get_disabled_render_grid_jobs()` -> `Array [ RenderGridJob ]` — Get Disabled Render Grid Jobs
  - `get_enabled_render_grid_jobs()` -> `Array [ RenderGridJob ]` — Get Enabled Render Grid Jobs
  - `get_guid()` -> `Guid` — Returns the GUID, which is randomly generated at creation.
  - `get_index_of_render_grid_job(job)` -> `int32` — Get Index Of Render Grid Job
  - `get_level()` -> `World` — Get Level
  - `get_props_source()` -> `RenderGridPropsSourceBase` — Get Props Source
  - `get_props_source_origin()` -> `Object` — Get Props Source Origin
  - `get_props_source_type()` -> `RenderGridPropsSourceType` — Get Props Source Type
  - `get_render_grid_jobs()` -> `Array [ RenderGridJob ]` — Get Render Grid Jobs
  - `has_any_render_grid_jobs()` -> `bool` — Has Any Render Grid Jobs
  - `has_render_grid_job(job)` -> `bool` — Has Render Grid Job
  - `insert_render_grid_job(job, index)` -> `None` — Insert Render Grid Job
  - `insert_render_grid_job_after(job, after_job)` -> `None` — Insert Render Grid Job After
  - `insert_render_grid_job_before(job, before_job)` -> `None` — Insert Render Grid Job Before
  - `receive_begin_batch_render(queue)` -> `None` — Event for when batch rendering begins. In here, you could for example obtain jobs from an external source and add them t...
  - `receive_begin_editor()` -> `None` — Event for when this asset is opened in the editor. The asset will also be closed and reopened during a blueprint compile...
  - `receive_begin_job_render(queue, job)` -> `None` — Event for when job rendering begins. In here, you could for example change elements in the world according to what job t...
  - `receive_begin_viewport_render(job)` -> `None` — Event for when job rendering for the viewport viewer-mode begins. This event will fire every frame, as long as the viewp...
  - `receive_end_batch_render(queue)` -> `None` — Event for when batch rendering ends. In here, you could do any cleanup required at the end of a batch render.
  - `receive_end_editor()` -> `None` — Event for when this asset is closed in the editor. The asset will also be closed and reopened during a blueprint compile...
  - `receive_end_job_render(queue, job)` -> `None` — Event for when job rendering ends. In here, you could do any cleanup required at the end of rendering out a job, like fo...
  - `receive_end_viewport_render(job)` -> `None` — Event for when job rendering for the viewport viewer-mode ends. This event will fire every frame, as long as the viewpor...
  - `receive_tick(delta_time)` -> `None` — The tick event, will only execute when the asset is open in the editor.
  - `remove_render_grid_job(job)` -> `None` — Remove Render Grid Job
  - `render()` -> `RenderGridQueue` — Renders all the enabled jobs of this render grid.
  - `render_job(job)` -> `RenderGridQueue` — Renders the given job of this render grid.
  - `render_job_single_frame(job, frame)` -> `RenderGridQueue` — Renders the given job of this render grid. Only renders a single frame.
  - `render_job_single_frame_position(job, frame_position)` -> `RenderGridQueue` — Renders the given job of this render grid. Only renders a single frame. The frame number it renders is based on the give...
  - `render_jobs(jobs)` -> `RenderGridQueue` — Renders all the given jobs of this render grid.
  - `render_jobs_single_frame(jobs, frame)` -> `RenderGridQueue` — Renders all the given jobs of this render grid. Only renders a single frame of each job.
  - `render_jobs_single_frame_position(jobs, frame_position)` -> `RenderGridQueue` — Renders all the given jobs of this render grid. Only renders a single frame of each job. The frame number it renders is ...
  - `render_single_frame(frame)` -> `RenderGridQueue` — Renders all the enabled jobs of this render grid. Only renders a single frame of each job.
  - `render_single_frame_position(frame_position)` -> `RenderGridQueue` — Renders all the enabled jobs of this render grid. Only renders a single frame of each job. The frame number it renders i...
  - `reorder_render_grid_job(job, dropped_on_job, after = True)` -> `bool` — Relocates the given job in this grid to the position of the given dropped-on job. *
  - `set_default_level_sequence(new_sequence)` -> `None` — Set Default Level Sequence
  - `set_default_output_directory(new_output_directory)` -> `None` — Set Default Output Directory
  - `set_default_render_preset(new_render_preset)` -> `None` — Set Default Render Preset
  - `set_props_source(props_source_type, props_source_origin = None)` -> `None` — Set Props Source
  - `set_render_grid_jobs(jobs)` -> `None` — Set Render Grid Jobs
  - `to_debug_string()` -> `str` — Obtains a string representation of this object. Shouldnât be used for anything other than logging/debugging.

### `unreal.RenderGridJob`
Inherits: `Object` | Header: `RenderGrid.h`

This class represents a render grid job, in other words, an entry (a row) of a render grid. It contains a level sequence and custom properties that will be applied while rendering.

**Methods** (44):
  - `generate_new_guid()` -> `None` — Randomly generates a new GUID.
  - `get_custom_end_frame()` -> `int32` — Get Custom End Frame
  - `get_custom_resolution()` -> `IntPoint` — Get Custom Resolution
  - `get_custom_start_frame()` -> `int32` — Get Custom Start Frame
  - `get_duration(duration=double)` — Gets the calculated duration in seconds, if possible.
  - `get_end_frame(end_frame=int32)` — Gets the calculated end frame, if possible.
  - `get_end_time(end_time=double)` — Gets the calculated end time, if possible.
  - `get_guid()` -> `Guid` — Returns the GUID, which is randomly generated at creation.
  - `get_is_enabled()` -> `bool` — Get Is Enabled
  - `get_is_using_custom_end_frame()` -> `bool` — Get Is Using Custom End Frame
  - `get_is_using_custom_resolution()` -> `bool` — Get Is Using Custom Resolution
  - `get_is_using_custom_start_frame()` -> `bool` — Get Is Using Custom Start Frame
  - `get_job_id()` -> `str` — Get Job Id
  - `get_job_name()` -> `str` — Get Job Name
  - `get_level_sequence()` -> `LevelSequence` — Get Level Sequence
  - `get_output_aspect_ratio()` -> `double` — Gets the aspect ratio that this job will be rendered in.
  - `get_output_directory()` -> `str` — Get Output Directory
  - `get_output_directory_for_display()` -> `str` — Get Output Directory for Display
  - `get_output_resolution()` -> `IntPoint` — Gets the resolution that this job will be rendered in.
  - `get_remote_control_field_id_from_label(label)` -> `Guid or None` — Get Remote Control Field Id from Label
  - `get_remote_control_label_from_field_id(field_id)` -> `str or None` — Get Remote Control Label from Field Id
  - `get_remote_control_value(field_id)` -> `str or None` — Get Remote Control Value
  - `get_remote_control_values()` -> `Map [ Guid , str ]` — Get Remote Control Values
  - `get_render_preset()` -> `MoviePipelinePrimaryConfig` — Get Render Preset
  - `get_render_preset_output_settings()` -> `MoviePipelineOutputSetting` — Get Render Preset Output Settings
  - `get_start_frame(start_frame=int32)` — Gets the calculated start frame, if possible.
  - `get_start_time(start_time=double)` — Gets the calculated start time, if possible.
  - `get_wait_frames_before_rendering()` -> `int32` — Get Wait Frames Before Rendering
  - `matches_search_term(search_term)` -> `bool` — Checks whether the job contains data that matches the search terms.
  - `set_custom_end_frame(new_custom_end_frame)` -> `None` — Set Custom End Frame
  - `set_custom_resolution(new_custom_resolution)` -> `None` — Set Custom Resolution
  - `set_custom_start_frame(new_custom_start_frame)` -> `None` — Set Custom Start Frame
  - `set_is_enabled(enabled)` -> `None` — Set Is Enabled
  - `set_is_using_custom_end_frame(new_override_end_frame)` -> `None` — Set Is Using Custom End Frame
  - `set_is_using_custom_resolution(new_override_resolution)` -> `None` — Set Is Using Custom Resolution
  - `set_is_using_custom_start_frame(new_override_start_frame)` -> `None` — Set Is Using Custom Start Frame
  - `set_job_id(new_job_id)` -> `None` — Set Job Id
  - `set_job_name(new_job_name)` -> `None` — Set Job Name
  - `set_level_sequence(new_sequence)` -> `None` — Set Level Sequence
  - `set_output_directory(new_output_directory)` -> `None` — Set Output Directory
  - `set_remote_control_value(field_id, json)` -> `bool` — Set Remote Control Value
  - `set_render_preset(new_render_preset)` -> `None` — Set Render Preset
  - `set_wait_frames_before_rendering(new_wait_frames_before_rendering)` -> `None` — Set Wait Frames Before Rendering
  - `to_debug_string()` -> `str` — Obtains a string representation of this object. Shouldnât be used for anything other than logging/debugging.

### `unreal.RenderGridPropsSourceBase`
Inherits: `Object` | Header: `RenderGridPropsSource.h`

The base class of the render grid properties source abstraction.

### `unreal.RenderGridPropsSourceLocal`
Inherits: `RenderGridPropsSourceBase` | Header: `RenderGridPropsSource.h`

The local properties implementation of the render grid properties source abstraction.

### `unreal.RenderGridPropsSourceRemoteControl`
Inherits: `RenderGridPropsSourceBase` | Header: `RenderGridPropsSource.h`

The remote control properties implementation of the render grid properties source abstraction.

### `unreal.RenderGridQueue`
Inherits: `Object` | Header: `RenderGridQueue.h`

This class is responsible for rendering the given render grid jobs.

**Methods** (25):
  - `add_job(job)` -> `None` — Queues the given job.
  - `cancel()` -> `None` — Cancels the current and the remaining queued jobs. Relies on the internal movie pipeline implementation of job canceling...
  - `close_editor_on_completion()` -> `None` [classmethod] — Call this function to make it so that the editor will be closed when all rendering queues have finished. This function h...
  - `generate_new_guid()` -> `None` — Randomly generates a new GUID.
  - `get_currently_rendering_job()` -> `RenderGridJob` — Retrieves the currently rendering render grid job, can return NULL.
  - `get_currently_rendering_queue()` -> `RenderGridQueue` [classmethod] — Returns the currently rendering queue, or NULL if there isnât any currently rendering.
  - `get_guid()` -> `Guid` — Returns the GUID, which is randomly generated at creation.
  - `get_job_status(job)` -> `str` — Retrieves the rendering status of the given render grid job. Will return an empty string if this job wasnât found in t...
  - `get_job_status_percentage(job)` -> `float` — Returns the percentage of the rendering status of the given render grid job. Will return 0 if this job wasnât found in...
  - `get_jobs()` -> `Array [ RenderGridJob ]` — Returns all the jobs that have been and will be rendered.
  - `get_jobs_completed_count()` -> `int32` — Returns the number of jobs that have finished rendering. Basically just returns [Get Jobs Count] minus [Get Jobs Remaini...
  - `get_jobs_count()` -> `int32` — Returns the number of jobs that have been and will be rendered.
  - `get_jobs_remaining_count()` -> `int32` — Returns the number of jobs that are still left to render, includes the job that is currently rendering.
  - `get_remaining_rendering_queues_count()` -> `int32` [classmethod] — Returns the number of rendering queues that are currently queued up. This also includes the currently rendering queue.
  - `get_render_grid()` -> `RenderGrid` — Retrieves the rendering status of the given render grid job.
  - `get_status()` -> `str` — Returns the status of the rendering process.
  - `get_status_percentage()` -> `float` — Returns the percentage of jobs finished, this includes the progression of the job that is currently rendering.
  - `is_canceled()` -> `bool` — Returns true if this queue has been canceled.
  - `is_currently_rendering()` -> `bool` — Returns true if this queue is the one thatâs currently rendering, returns false if it hasnât started yet, or if itâ...
  - `is_finished()` -> `bool` — Returns true if this queue has been canceled.
  - `is_paused()` -> `bool` — Returns true if this queue is currently paused.
  - `is_started()` -> `bool` — Returns true if this queue has been started.
  - `pause()` -> `None` — Pauses the queue.
  - `resume()` -> `None` — Resumes the queue.
  - `to_debug_string()` -> `str` — Obtains a string representation of this object. Shouldnât be used for anything other than logging/debugging.

### `unreal.RenderGridRemoteControlUtils`
Inherits: `BlueprintFunctionLibrary` | Header: `RenderGridRemoteControlUtils.h`

Render Grid Remote Control Utils

**Methods** (32):
  - `boolean_to_json(value)` -> `str` [classmethod] — Boolean to Json
  - `byte_to_json(value)` -> `str` [classmethod] — Byte to Json
  - `class_reference_to_json(value)` -> `str` [classmethod] — Class Reference to Json
  - `color_to_json(value)` -> `str` [classmethod] — Color to Json
  - `float_to_json(value)` -> `str` [classmethod] — Float to Json
  - `int32_to_json(value)` -> `str` [classmethod] — Int 32To Json
  - `int64_to_json(value)` -> `str` [classmethod] — Int 64To Json
  - `linear_color_to_json(value)` -> `str` [classmethod] — Linear Color to Json
  - `name_to_json(value)` -> `str` [classmethod] — Name to Json
  - `object_reference_to_json(value)` -> `str` [classmethod] — Object Reference to Json
  - `parse_json_as_boolean(json, value=bool)` [classmethod] — Parse Json as Boolean
  - `parse_json_as_byte(json, value=uint8)` [classmethod] — Parse Json as Byte
  - `parse_json_as_class_reference(json, value=type(Class))` [classmethod] — Parse Json as Class Reference
  - `parse_json_as_color(json, value=Color)` [classmethod] — Parse Json as Color
  - `parse_json_as_float(json, value=double)` [classmethod] — Parse Json as Float
  - `parse_json_as_int32(json, value=int32)` [classmethod] — Parse Json as Int 32
  - `parse_json_as_int64(json, value=int64)` [classmethod] — Parse Json as Int 64
  - `parse_json_as_linear_color(json, value=LinearColor)` [classmethod] — Parse Json as Linear Color
  - `parse_json_as_name(json, value=Name)` [classmethod] — Parse Json as Name
  - `parse_json_as_object_reference(json, value=Object)` [classmethod] — Parse Json as Object Reference
  - `parse_json_as_rotator(json, value=Rotator)` [classmethod] — Parse Json as Rotator
  - `parse_json_as_string(json, value=str)` [classmethod] — Parse Json as String
  - `parse_json_as_struct(json, value=InstancedStruct)` [classmethod] — Parse Json as Struct
  - `parse_json_as_text(json, value=Text)` [classmethod] — Parse Json as Text
  - `parse_json_as_transform(json, value=Transform)` [classmethod] — Parse Json as Transform
  - `parse_json_as_vector(json, value=Vector)` [classmethod] — Parse Json as Vector
  - `rotator_to_json(value)` -> `str` [classmethod] — Rotator to Json
  - `string_to_json(value)` -> `str` [classmethod] — String to Json
  - `struct_to_json(value)` -> `str` [classmethod] — Struct to Json
  - `text_to_json(value)` -> `str` [classmethod] — Text to Json
  - `transform_to_json(value)` -> `str` [classmethod] — Transform to Json
  - `vector_to_json(value)` -> `str` [classmethod] — Vector to Json

### `unreal.RenderGridPropsSourceType`
Inherits: `EnumBase` | Header: `RenderGridPropsSource.h`

The type of the properties source. In other words, where the properties come from that each render grid job can have.

**Properties** (1):
  - `REMOTE_CONTROL`: `RenderGridPropsSourceType = Ellipsis` — 1
