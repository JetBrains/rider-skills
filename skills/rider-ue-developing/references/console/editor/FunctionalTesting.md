# UE Python API — FunctionalTesting Module

**38 types** from the `FunctionalTesting` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AITestSpawnInfo`, `AITestSpawnInfoBase`, `AITestSpawnSet`, `AITestSpawnSetBase`, `AutomationScreenshotOptions`, `AutomationWaitForLoadingOptions`, `ComparisonToleranceAmount`, `PendingDelayedSpawn`, `TraceChannelTestBatchOptions`, `TraceQueryTestNames`, `TraceQueryTestResultsInner`, `TraceQueryTestResultsInnerMost`, `AutomationEditorTask`, `AutomationLibrary`, `AutomationPerformaceHelper`, `AutomationViewSettings`, `FuncTestRenderingComponent`, `FunctionalAITest`, `FunctionalAITestBase`, `FunctionalTest`, ... (38 total)

---

## Classes

### `unreal.AITestSpawnInfo`
Inherits: `AITestSpawnInfoBase` | Header: `FunctionalAITest.h`

FAITestSpawnInfo

**Properties** (4):
  - `behavior_tree`: `BehaviorTree` — [Read-Write] if set will be applied to spawned AI (BehaviorTree)
  - `controller_class`: `Class` — [Read-Write] class to override default pawnâs controller class. If None the default will be used (...
  - `pawn_class`: `Class` — [Read-Write] Determines AI to be spawned (type(Class))
  - `team_id`: `GenericTeamId` — [Read-Write] (GenericTeamId)

### `unreal.AITestSpawnInfoBase`
Inherits: `StructBase` | Header: `FunctionalAITest.h`

FAITestSpawnInfoBase

**Properties** (4):
  - `number_to_spawn`: `int` — [Read-Write] (int32)
  - `pre_spawn_delay`: `float` — [Read-Write] delay before attempting first spawn (float)
  - `spawn_delay`: `float` — [Read-Write] delay between consecutive spawn attempts (float)
  - `spawn_location`: `Actor` — [Read-Write] Where should AI be spawned (Actor)

### `unreal.AITestSpawnSet`
Inherits: `AITestSpawnSetBase` | Header: `FunctionalAITest.h`

FAITestSpawnSet

**Properties** (1):
  - `spawn_info_container`: `None` — [Read-Write] what to spawn (Array[AITestSpawnInfo])

### `unreal.AITestSpawnSetBase`
Inherits: `StructBase` | Header: `FunctionalAITest.h`

FAITestSpawnSetBase

**Properties** (3):
  - `enabled`: `bool` — [Read-Write] (bool)
  - `fallback_spawn_location`: `Actor` — [Read-Write] location used for spawning if spawn info doesnât define one (Actor)
  - `name`: `Name` — [Read-Write] give the set a name to help identify it if need be (Name)

### `unreal.AutomationScreenshotOptions`
Inherits: `StructBase` | Header: `AutomationScreenshotOptions.h`

Automation Screenshot Options

**Properties** (15):
  - `delay`: `float` — [Read-Write] The delay before we take the screenshot (measured in seconds). Both this delay and the ...
  - `disable_noisy_rendering_features`: `bool` — [Read-Write] Disables Anti-Aliasing, Motion Blur, Screen Space Reflections, Eye Adaptation, Tonemapp...
  - `disable_tonemapping`: `bool` — [Read-Write] Disables Eye Adaptation and sets Tonemapper to fixed gamma curve. Should generally be o...
  - `frame_delay`: `int` — [Read-Write] The delay before we take the screenshot (measured in number of frames). Both this frame...
  - `ignore_anti_aliasing`: `bool` — [Read-Write] If this is true, we search neighboring pixels looking for the expected pixel as what ma...
  - `ignore_colors`: `bool` — [Read-Write] If this is true, all we compare is luminance of the scene. (bool)
  - `maximum_global_error`: `float` — [Read-Write] After youâve accounted for color tolerance changes, you now need to control for total...
  - `maximum_local_error`: `float` — [Read-Write] After youâve accounted for color tolerance changes, you now need to control for local...
  - `override_override_time_to`: `bool` — [Read-Write] (bool)
  - `override_time_to`: `float` — [Read-Write] Overrides World Time, Real Time to the value provided.  Sets Delta Time to 0.  Only
aff...
  - `resolution`: `Vector2D` — [Read-Write] The desired resolution of the screenshot, if none is provided, it will use the default ...
  - `tolerance`: `ComparisonTolerance` — [Read-Write] These are quick defaults for tolerance levels, we default to low, because generally the...
  - `tolerance_amount`: `ComparisonToleranceAmount` — [Read-Write] For each channel and brightness levels you can control a region where the colors are fo...
  - `view_settings`: `AutomationViewSettings` — [Read-Write] Assign custom view settings to control which rendering options we allow on while taking...
  - `visualize_buffer`: `Name` — [Read-Write] Allows you to screenshot a buffer other than the default final lit scene image.  Useful...

### `unreal.AutomationWaitForLoadingOptions`
Inherits: `StructBase` | Header: `AutomationBlueprintFunctionLibrary.h`

Automation Wait for Loading Options

**Properties** (1):
  - `wait_for_replication_to_settle`: `bool` — [Read-Write] (bool)

### `unreal.ComparisonToleranceAmount`
Inherits: `StructBase` | Header: `AutomationScreenshotOptions.h`

Comparison Tolerance Amount

### `unreal.PendingDelayedSpawn`
Inherits: `StructBase` | Header: `FunctionalAITest.h`

FPendingDelayedSpawn

### `unreal.TraceChannelTestBatchOptions`
Inherits: `StructBase` | Header: `TraceQueryTestResults.h`

Trace Channel Test Batch Options

**Properties** (7):
  - `box_trace`: `bool` — [Read-Write] Whether to do box traces (bool)
  - `capsule_trace`: `bool` — [Read-Write] Whether to do capsule traces (bool)
  - `channel_trace`: `bool` — [Read-Write] Whether to do channel traces (bool)
  - `line_trace`: `bool` — [Read-Write] Whether to do line traces (bool)
  - `objects_trace`: `bool` — [Read-Write] Whether to do object traces (bool)
  - `profile_trace`: `bool` — [Read-Write] Whether to do profile traces (bool)
  - `sphere_trace`: `bool` — [Read-Write] Whether to do sphere traces (bool)

### `unreal.TraceQueryTestNames`
Inherits: `StructBase` | Header: `TraceQueryTestResults.h`

Trace Query Test Names

**Properties** (3):
  - `actor_name`: `Name` — [Read-Write] (Name)
  - `component_name`: `Name` — [Read-Write] (Name)
  - `physical_material_name`: `Name` — [Read-Write] (Name)

### `unreal.TraceQueryTestResultsInner`
Inherits: `StructBase` | Header: `TraceQueryTestResults.h`

Trace Query Test Results Inner

**Properties** (4):
  - `box_results`: `TraceQueryTestResultsInnerMost` — [Read-Write] The results associated with the box (TraceQueryTestResultsInnerMost)
  - `capsule_results`: `TraceQueryTestResultsInnerMost` — [Read-Write] The results associated with the capsule (TraceQueryTestResultsInnerMost)
  - `line_results`: `TraceQueryTestResultsInnerMost` — [Read-Write] The results associated with the line trace (TraceQueryTestResultsInnerMost)
  - `sphere_results`: `TraceQueryTestResultsInnerMost` — [Read-Write] The results associated with the sphere (TraceQueryTestResultsInnerMost)

### `unreal.TraceQueryTestResultsInnerMost`
Inherits: `StructBase` | Header: `TraceQueryTestResults.h`

Trace Query Test Results Inner Most

**Properties** (6):
  - `multi_hits`: `None` — [Read-Write] Result from doing a multi sweep (Array[HitResult])
  - `multi_names`: `None` — [Read-Write] Names found from doing a multi sweep (Array[TraceQueryTestNames])
  - `multi_result`: `bool` — [Read-Write] The true/false value returned from the multi sweep (bool)
  - `single_hit`: `HitResult` — [Read-Write] Result from doing a single sweep (HitResult)
  - `single_names`: `TraceQueryTestNames` — [Read-Write] Names found from doing a single sweep (TraceQueryTestNames)
  - `single_result`: `bool` — [Read-Write] The true/false value returned from the single sweep (bool)

### `unreal.AutomationEditorTask`
Inherits: `Object` | Header: `AutomationBlueprintFunctionLibrary.h`

UAutomationEditorTask

**Methods** (2):
  - `is_task_done()` -> `bool` — Query if the Editor task is done
  - `is_valid_task()` -> `bool` — Query if a task was setup

### `unreal.AutomationLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AutomationBlueprintFunctionLibrary.h`

Automation Blueprint Function Library

**Methods** (35):
  - `add_expected_log_error(expected_pattern_string, occurrences = 1, exact_match = False, is_regex = True)` -> `None` [classmethod] — Mute the report of log error and warning matching a pattern during an automated test. Treat the pattern as regex by defa...
  - `add_expected_log_message(expected_pattern_string, occurrences = 1, exact_match = False, is_regex = True)` -> `None` [classmethod] — Expect a specific log message to match a pattern during an automated test regardless of its verbosity. Treat the pattern...
  - `add_expected_plain_log_error(expected_string, occurrences = 1, exact_match = False)` -> `None` [classmethod] — Mute the report of log error and warning matching a plain string during an automated test
  - `add_expected_plain_log_message(expected_string, occurrences = 1, exact_match = False)` -> `None` [classmethod] — Expect a specific log message to match a plain string during an automated test regardless of its verbosity
  - `add_test_error(log_item)` -> `None` [classmethod] — Add error to currently running automated test.
  - `add_test_info(log_item)` -> `None` [classmethod] — Add info to currently running automated test.
  - `add_test_telemetry_data(data_point, measurement, context = '')` -> `None` [classmethod] — Add Telemetry data to currently running automated test.
  - `add_test_warning(log_item)` -> `None` [classmethod] — Add warning to currently running automated test.
  - `are_automated_tests_running()` -> `bool` [classmethod] — Lets you know if any automated tests are running, or are about to run and the automation system is spinning up tests.
  - `automation_wait_for_loading(world_context_object, latent_info, options)` -> `None` [classmethod] — Automation Wait for Loading
  - `compare_image_against_reference(image_file_path, comparison_name = '', comparison_tolerance = ComparisonTolerance.LOW, comparison_notes = '', world_context_object = None)` -> `bool` [classmethod] — request image comparison.
  - `disable_stat_group(world_context_object, group_name)` -> `None` [classmethod] — Disable Stat Group
  - `enable_stat_group(world_context_object, group_name)` -> `None` [classmethod] — Enable Stat Group
  - `finish_loading_before_screenshot()` -> `None` [classmethod] — Finish Loading Before Screenshot
  - `get_default_screenshot_options_for_gameplay(tolerance = ComparisonTolerance.LOW, delay = 0.200000)` -> `AutomationScreenshotOptions` [classmethod] — Get Default Screenshot Options for Gameplay
  - `get_default_screenshot_options_for_rendering(tolerance = ComparisonTolerance.LOW, delay = 0.200000)` -> `AutomationScreenshotOptions` [classmethod] — Get Default Screenshot Options for Rendering
  - `get_editor_active_viewport_view_mode()` -> `ViewModeIndex` [classmethod] — Get the ViewMode (Lit/Unlit/etc.) of the active viewport. Returns VMI_Unknown if fails to get the active viewport view m...
  - `get_editor_active_viewport_wireframe_opacity()` -> `float` [classmethod] — Retrieves the opacity for wireframe viewport view modes of the active viewport. *
  - `get_stat_call_count(stat_name)` -> `float` [classmethod] — Get Stat Call Count
  - `get_stat_exc_average(stat_name)` -> `float` [classmethod] — Get Stat Exc Average
  - `get_stat_exc_max(stat_name)` -> `float` [classmethod] — Get Stat Exc Max
  - `get_stat_inc_average(stat_name)` -> `float` [classmethod] — Get Stat Inc Average
  - `get_stat_inc_max(stat_name)` -> `float` [classmethod] — Get Stat Inc Max
  - `set_editor_active_viewport_view_mode(index)` -> `None` [classmethod] — Sets ViewMode (Lit/Unlit/etc.) of the first active viewport found *
  - `set_editor_active_viewport_wireframe_opacity(opacity)` -> `None` [classmethod] — Sets the opacity for wireframe viewport view modes of the active viewport. *
  - `set_editor_viewport_view_mode(index)` -> `None` [classmethod] — Sets all viewports of the first found level editor to have the given ViewMode (Lit/Unlit/etc.) *
  - `set_editor_viewport_visualize_buffer(buffer_name)` -> `None` [classmethod] — Sets all viewports of the first found level editor to have the VisualizeBuffer ViewMode and also display a given buffer ...
  - `set_scalability_quality_level_relative_to_max(world_context_object, value = 1)` -> `None` [classmethod] — Sets all other settings based on an overall value
  - `set_scalability_quality_to_epic(world_context_object)` -> `None` [classmethod] — Set Scalability Quality to Epic
  - `set_scalability_quality_to_low(world_context_object)` -> `None` [classmethod] — Set Scalability Quality to Low
  - `set_test_telemetry_storage(storage_name)` -> `None` [classmethod] — Set Telemetry data storage name of currently running automated test.
  - `take_automation_screenshot(world_context_object, latent_info, name="", notes, options)` -> `None` [classmethod] — Takes a screenshot of the gameâs viewport. Does not capture any UI.
  - `take_automation_screenshot_at_camera(world_context_object, latent_info, camera, name_override="", notes, options)` -> `None` [classmethod] — Takes a screenshot of the gameâs viewport, from a particular camera actors POV. Does not capture any UI.
  - `take_automation_screenshot_of_ui(world_context_object, latent_info, name, options)` -> `None` [classmethod] — Take Automation Screenshot Of UI
  - `take_high_res_screenshot(res_x, res_y, filename, camera = None, mask_enabled = False, capture_hdr = False, comparison_tolerance = ComparisonTolerance.LOW, comparison_notes = '', delay = 0.000000, force_game_view = True)` -> `AutomationEditorTask` [classmethod] — take high res screenshot in editor.

### `unreal.AutomationPerformaceHelper`
Inherits: `Object` | Header: `FunctionalTest.h`

Class for use with functional tests which provides various performance measuring features. Recording of basic, unintrusive performance stats. Automatic captures using external CPU and GPU profilers. T...

**Methods** (18):
  - `begin_recording(record_name, gpu_budget, render_thread_budget, game_thread_budget)` -> `None` — Begins recording a new named performance stats record. We start by recording the baseline.
  - `begin_recording_baseline(record_name)` -> `None` — Begins recording a new named performance stats record. We start by recording the baseline
  - `begin_stats_file(record_name)` -> `None` — Begins recording stats to a file.
  - `end_recording()` -> `None` — Stops recording performance stats.
  - `end_recording_baseline()` -> `None` — Stops recording the baseline and moves to the main record.
  - `end_stats_file()` -> `None` — Ends recording stats to a file.
  - `is_current_record_within_game_thread_budget()` -> `bool` — Is Current Record Within Game Thread Budget
  - `is_current_record_within_gpu_budget()` -> `bool` — Is Current Record Within GPUBudget
  - `is_current_record_within_render_thread_budget()` -> `bool` — Is Current Record Within Render Thread Budget
  - `is_recording()` -> `bool` — Returns true if this stats tracker is currently recording performance stats.
  - `on_all_tests_complete()` -> `None` — Does any final work needed as all tests are complete.
  - `on_begin_tests()` -> `None` — Does any init work across all tests..
  - `sample(delta_seconds)` -> `None` — Adds a sample to the stats counters for the current performance stats record.
  - `start_cpu_profiling()` -> `None` — Communicates with external profiler to being a CPU capture.
  - `stop_cpu_profiling()` -> `None` — Communicates with external profiler to end a CPU capture.
  - `tick(delta_seconds)` -> `None` — Begin basic stat recording
  - `trigger_gpu_trace_if_record_falls_below_budget()` -> `None` — Will trigger a GPU trace next time the current test falls below GPU budget.
  - `write_log_file(capture_dir, capture_extension)` -> `None` — Writes the current set of performance stats records to a csv file in the profiling directory. An additional directory an...

### `unreal.AutomationViewSettings`
Inherits: `DataAsset` | Header: `AutomationViewSettings.h`

Automation View Settings

### `unreal.FuncTestRenderingComponent`
Inherits: `PrimitiveComponent` | Header: `FuncTestRenderingComponent.h`

Func Test Rendering Component

### `unreal.FunctionalAITest`
Inherits: `FunctionalAITestBase` | Header: `FunctionalAITest.h`

FuntionalAITest

**Properties** (1):
  - `spawn_sets`: `None` [Read-Only] — [Read-Only] (Array[AITestSpawnSet])

### `unreal.FunctionalAITestBase`
Inherits: `FunctionalTest` | Header: `FunctionalAITest.h`

AFunctionalAITestBase

**Methods** (1):
  - `is_one_of_spawned_pawns(actor)` -> `bool` — Is One Of Spawned Pawns

**Properties** (8):
  - `current_spawn_set_index`: `int` [Read-Only] — [Read-Only] (int32)
  - `current_spawn_set_name`: `str` [Read-Only] — [Read-Only] (str)
  - `on_ai_spawned`: `FunctionalTestAISpawned` — [Read-Write] Called when a single AI finished spawning (FunctionalTestAISpawned)
  - `on_all_ais_pawned`: `FunctionalTestEventSignature` — [Read-Write] Called when a all AI finished spawning (FunctionalTestEventSignature)
  - `pending_delayed_spawns`: `None` [Read-Only] — [Read-Only] (Array[PendingDelayedSpawn])
  - `spawn_location_randomization_range`: `float` [Read-Only] — [Read-Only] (float)
  - `spawned_pawns`: `None` [Read-Only] — [Read-Only] (Array[Pawn])
  - `wait_for_nav_mesh`: `bool` [Read-Only] — [Read-Only] if set, ftest will postpone start until navmesh is fully generated (bool)

### `unreal.FunctionalTest`
Inherits: `Actor` | Header: `FunctionalTest.h`

Functional Test

**Methods** (58):
  - `add_error(message)` -> `None` — Add Error
  - `add_info(message)` -> `None` — Add Info
  - `add_rerun(reason)` -> `None` — Causes the test to be rerun for a specific named reason.
  - `add_warning(message)` -> `None` — Add Warning
  - `assert_equal_bool(actual, expected, what, context_object = None)` -> `bool` — Assert that two bools are equal
  - `assert_equal_box2d(actual, expected, what, tolerance = 0.000100, context_object = None)` -> `bool` — Assert that two two-component boxes are (memberwise) equal within a small tolerance.
  - `assert_equal_double(actual, expected, what, tolerance = 0.000100, context_object = None)` -> `bool` — Assert that two double are equal within tolerance between two doubles.
  - `assert_equal_float(actual, expected, what, tolerance = 0.000100, context_object = None)` -> `bool` — Assert that two floats are equal within tolerance between two floats.
  - `assert_equal_int(actual, expected, what, context_object = None)` -> `bool` — Assert that two ints are equal
  - `assert_equal_matrix(actual, expected, what, tolerance = 0.000100, context_object = None)` -> `bool` — Assert that two 4x4 matrices are (memberwise) equal within a small tolerance.
  - `assert_equal_name(actual, expected, what, context_object = None)` -> `bool` — Assert that two FNames are equal
  - `assert_equal_object(actual, expected, what, context_object = None)` -> `bool` — Assert that two Objects are equal
  - `assert_equal_plane(actual, expected, what, tolerance = 0.000100, context_object = None)` -> `bool` — Assert that two planes are (memberwise) equal within a small tolerance.
  - `assert_equal_quat(actual, expected, what, tolerance = 0.000100, context_object = None)` -> `bool` — Assert that two quats are (memberwise) equal within a small tolerance.
  - `assert_equal_rotator(actual, expected, what, tolerance = 0.000100, context_object = None)` -> `bool` — Assert that the component angles of two rotators are all equal within a small tolerance.
  - `assert_equal_rotator_orientation(actual, expected, what, tolerance = 0.000100, context_object = None)` -> `bool` — Assert that the orientation of two rotators is the same within a small tolerance. Robust to quaternion singularities whe...
  - `assert_equal_string(actual, expected, what, context_object = None)` -> `bool` — Assert that two Strings are equal.
  - `assert_equal_trace_query_results(actual, expected, what, context_object = None)` -> `bool` — Assert that two TraceQueryResults are equal.
  - `assert_equal_transform(actual, expected, what, tolerance = 0.000100, context_object = None)` -> `bool` — Assert that two transforms are (components memberwise - translation, rotation, scale) equal within a small tolerance.
  - `assert_equal_vector(actual, expected, what, tolerance = 0.000100, context_object = None)` -> `bool` — Assert that two vectors are (memberwise) equal within a small tolerance.
  - `assert_equal_vector2d(actual, expected, what, tolerance = 0.000100, context_object = None)` -> `bool` — Assert that two two-component vectors are (memberwise) equal within a small tolerance.
  - `assert_equal_vector4(actual, expected, what, tolerance = 0.000100, context_object = None)` -> `bool` — Assert that two four-component vectors are (memberwise) equal within a small tolerance.
  - `assert_false(condition, message, context_object = None)` -> `bool` — Assert that a boolean value is false.
  - `assert_is_valid(object, message, context_object = None)` -> `bool` — Assert that a UObject is valid
  - `assert_not_equal_box2d(actual, not_expected, what, context_object = None)` -> `bool` — Assert that two two-component boxes are (memberwise) not equal within a small tolerance.
  - `assert_not_equal_matrix(actual, not_expected, what, context_object = None)` -> `bool` — Assert that two 4x4 matrices are (memberwise) not equal within a small tolerance.
  - `assert_not_equal_plane(actual, not_expected, what, context_object = None)` -> `bool` — Assert that two planes are (memberwise) not equal within a small tolerance.
  - `assert_not_equal_quat(actual, not_expected, what, context_object = None)` -> `bool` — Assert that two quats are (memberwise) not equal within a small tolerance.
  - `assert_not_equal_rotator(actual, not_expected, what, context_object = None)` -> `bool` — Assert that the component angles of two rotators are all not equal within a small tolerance.
  - `assert_not_equal_string(actual, not_expected, what, context_object = None)` -> `bool` — Assert that two Strings are not equal.
  - `assert_not_equal_transform(actual, not_expected, what, context_object = None)` -> `bool` — Assert that two transforms are (components memberwise - translation, rotation, scale) not equal within a small tolerance...
  - `assert_not_equal_vector(actual, not_expected, what, context_object = None)` -> `bool` — Assert that two vectors are (memberwise) not equal within a small tolerance.
  - `assert_not_equal_vector2d(actual, not_expected, what, context_object = None)` -> `bool` — Assert that two two-component vectors are (memberwise) not equal within a small tolerance.
  - `assert_not_equal_vector4(actual, not_expected, what, context_object = None)` -> `bool` — Assert that two four-component vectors are (memberwise) not equal within a small tolerance.
  - `assert_true(condition, message, context_object = None)` -> `bool` — Assert that a boolean value is true.
  - `assert_value_date_time(actual, should_be, expected, what, context_object = None)` -> `bool` — Assert on a relationship between two DateTimes.
  - `assert_value_double(actual, should_be, expected, what, context_object = None)` -> `bool` — Assert on a relationship between two doubles.
  - `assert_value_float(actual, should_be, expected, what, context_object = None)` -> `bool` — Assert on a relationship between two floats.
  - `assert_value_int(actual, should_be, expected, what, context_object = None)` -> `bool` — Assert on a relationship between two integers.
  - `debug_gather_relevant_actors()` -> `Array [ Actor ]` — Used by debug drawing to gather actors this test is using and point at them on the level to better understand testâs s...
  - `finish_test(test_result, message)` -> `None` — Finish Test
  - `get_current_rerun_reason()` -> `Name` — Returns the current re-run reason if weâre in a named re-run.
  - `is_enabled()` -> `bool` — Is Enabled
  - `is_enabled_in_world(world)` -> `bool` — Is Enabled in World
  - `is_ready()` -> `bool` — IsReady() is called once per frame after a test is run, until it returns true. You should use this function to delay Sta...
  - `is_running()` -> `bool` — AActor interface end
  - `log_message(message)` -> `None` — Log Message
  - `on_additional_test_finished_message_request(test_result)` -> `str` — On Additional Test Finished Message Request
  - `on_wants_re_run_check()` -> `bool` — retrieves information whether test wants to have another run just after finishing
  - `receive_prepare_test()` -> `None` — Prepare Test is fired once the test starts up, before the test IsReady() and thus before Start Test is called. So if the...
  - `receive_start_test()` -> `None` — Called once the IsReady() check for the test returns true. After that happens the test has Officially started, and it wi...
  - `receive_test_finished()` -> `None` — Called during FinishTest(). Allows for clean-up on the blueprint side, so that the user can bring the test back to its d...
  - `register_auto_destroy_actor(actor_to_auto_destroy)` -> `None`
  - `set_console_variable(name, value)` -> `None` — Sets the CVar from the given input. Variable gets reset after the test.
  - `set_console_variable_from_boolean(name, value)` -> `None` — Sets the CVar from the given input. Variable gets reset after the test.
  - `set_console_variable_from_float(name, value)` -> `None` — Sets the CVar from the given input. Variable gets reset after the test.
  - `set_console_variable_from_integer(name, value)` -> `None` — Sets the CVar from the given input. Variable gets reset after the test.
  - `set_time_limit(new_time_limit, result_when_time_runs_out)` -> `None` — Set Time Limit

**Properties** (18):
  - `author`: `str` [Read-Only] — [Read-Only] The owner is the group or person responsible for the test. Generally you should use a gr...
  - `description`: `str` [Read-Only] — [Read-Only] A description of the test, like what is this test trying to determine. (str)
  - `is_enabled_value`: `bool` [Read-Only] — [Read-Only] Allows a test to be disabled.  If a test is disabled, it will not appear in the set of
r...
  - `log_error_handling`: `FunctionalTestLogHandling` [Read-Only] — [Read-Only] Determines how LogErrors are handled during this test. (FunctionalTestLogHandling)
  - `log_warning_handling`: `FunctionalTestLogHandling` [Read-Only] — [Read-Only] Determines how LogWarnings are handled during this test. (FunctionalTestLogHandling)
  - `observation_point`: `Actor` — [Read-Write] Allows you to specify another actor to view the test from.  Usually this is a camera yo...
  - `on_test_finished`: `FunctionalTestEventSignature` — [Read-Write] Called when the test is finished. Use it to clean up (FunctionalTestEventSignature)
  - `on_test_prepare`: `FunctionalTestEventSignature` — [Read-Write] Called when the test is ready to prepare (FunctionalTestEventSignature)
  - `on_test_start`: `FunctionalTestEventSignature` — [Read-Write] Called when the test is started (FunctionalTestEventSignature)
  - `preparation_time_limit`: `float` [Read-Only] — [Read-Only] The Testâs time limit for preparation, this is the time it has to return true when che...
  - `random_numbers_stream`: `RandomStream` — [Read-Write] A random number stream that you can use during testing.  This number stream will be con...
  - `result`: `FunctionalTestResult` — [Read-Write] (FunctionalTestResult)
  - `should_delay_garbage_collection`: `bool` [Read-Only] — [Read-Only] Allows for garbage collection to be delayed. If delayed, garbage collection will be trig...
  - `test_label`: `str` [Read-Only] — [Read-Only] (str)
  - `test_tags`: `str` [Read-Only] — [Read-Only] Tags describing this test separated by square brackets, such as â[dog]â or â[cat]â...
  - `time_limit`: `float` [Read-Only] — [Read-Only] Testâs time limit. â0â means no limit (float)
  - `times_up_message`: `Text` — [Read-Write] (Text)
  - `total_time`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.FunctionalTestGameMode`
Inherits: `GameModeBase` | Header: `FunctionalTestGameMode.h`

Functional Test Game Mode

### `unreal.FunctionalTestingManager`
Inherits: `BlueprintFunctionLibrary` | Header: `FunctionalTestingManager.h`

Functional Testing Manager

**Methods** (1):
  - `run_all_functional_tests(world_context_object, new_log = True, run_looped = False, failed_tests_repro_string = '')` -> `bool` [classmethod] — Triggers in sequence all functional tests found on the level.

**Properties** (3):
  - `on_setup_tests`: `FunctionalTestEventSignature` — [Read-Write] (FunctionalTestEventSignature)
  - `on_tests_begin`: `FunctionalTestEventSignature` — [Read-Write] (FunctionalTestEventSignature)
  - `on_tests_complete`: `FunctionalTestEventSignature` — [Read-Write] (FunctionalTestEventSignature)

### `unreal.FunctionalTestLevelScript`
Inherits: `LevelScriptActor` | Header: `FunctionalTestLevelScript.h`

Functional Test Level Script

### `unreal.FunctionalTestUtilityLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `FunctionalTestUtilityLibrary.h`

Used to expose C++ functions to tests that we donât want to make BP accessible in the engine itself.

**Methods** (1):
  - `trace_channel_test_util()` -> `TraceQueryTestResults` [classmethod] — Helper function to trace and permute many options at once

### `unreal.FunctionalUIScreenshotTest`
Inherits: `ScreenshotFunctionalTestBase` | Header: `FunctionalUIScreenshotTest.h`

Functional UIScreenshot Test

### `unreal.GroundTruthData`
Inherits: `Object` | Header: `GroundTruthData.h`

Ground Truth Data

**Methods** (4):
  - `can_modify()` -> `bool` — Can Modify
  - `load_object()` -> `Object` — Load Object
  - `reset_object()` -> `None` — Reset Object
  - `save_object(ground_truth)` -> `None` — Save Object

### `unreal.PhasedAutomationActorBase`
Inherits: `Actor` | Header: `FunctionalTestingManager.h`

Phased Automation Actor Base

**Methods** (2):
  - `on_functional_testing_begin()` -> `None` — On Functional Testing Begin
  - `on_functional_testing_complete()` -> `None` — On Functional Testing Complete

### `unreal.ScreenshotFunctionalTest`
Inherits: `ScreenshotFunctionalTestBase` | Header: `ScreenshotFunctionalTest.h`

No UI

**Properties** (1):
  - `camera_cut_on_screenshot_prep`: `bool` — [Read-Write] Tests not relying on temporal effects can force a camera cut to flush stale data (bool)

### `unreal.ScreenshotFunctionalTestBase`
Inherits: `FunctionalTest` | Header: `ScreenshotFunctionalTestBase.h`

Base class for screenshot functional test

**Properties** (3):
  - `notes`: `str` [Read-Only] — [Read-Only] (str)
  - `screenshot_camera`: `CameraComponent` [Read-Only] — [Read-Only] (CameraComponent)
  - `screenshot_options`: `AutomationScreenshotOptions` [Read-Only] — [Read-Only] (AutomationScreenshotOptions)

### `unreal.TestPhaseComponent`
Inherits: `SceneComponent` | Header: `TestPhaseComponent.h`

Test Phase Component

### `unreal.TraceQueryTestResults`
Inherits: `Object` | Header: `TraceQueryTestResults.h`

Trace Query Test Results

**Methods** (1):
  - `to_string()` -> `str` — Output string value

**Properties** (4):
  - `batch_options`: `TraceChannelTestBatchOptions` — [Read-Write] (TraceChannelTestBatchOptions)
  - `channel_results`: `TraceQueryTestResultsInner` — [Read-Write] Results for channel trace (TraceQueryTestResultsInner)
  - `object_results`: `TraceQueryTestResultsInner` — [Read-Write] Results for object trace (TraceQueryTestResultsInner)
  - `profile_results`: `TraceQueryTestResultsInner` — [Read-Write] Results for profile trace (TraceQueryTestResultsInner)

### `unreal.ComparisonMethod`
Inherits: `EnumBase` | Header: `FunctionalTest.h`

EComparison Method

**Properties** (6):
  - `EQUAL_TO`: `ComparisonMethod = Ellipsis` — 0
  - `GREATER_THAN`: `ComparisonMethod = Ellipsis` — 4
  - `GREATER_THAN_OR_EQUAL_TO`: `ComparisonMethod = Ellipsis` — 2
  - `LESS_THAN`: `ComparisonMethod = Ellipsis` — 5
  - `LESS_THAN_OR_EQUAL_TO`: `ComparisonMethod = Ellipsis` — 3
  - `NOT_EQUAL_TO`: `ComparisonMethod = Ellipsis` — 1

### `unreal.ComparisonTolerance`
Inherits: `EnumBase` | Header: `AutomationScreenshotOptions.h`

EComparison Tolerance

**Properties** (5):
  - `CUSTOM`: `ComparisonTolerance = Ellipsis` — 4
  - `HIGH`: `ComparisonTolerance = Ellipsis` — 3
  - `LOW`: `ComparisonTolerance = Ellipsis` — 1
  - `MEDIUM`: `ComparisonTolerance = Ellipsis` — 2
  - `ZERO`: `ComparisonTolerance = Ellipsis` — 0

### `unreal.FunctionalTestLogHandling`
Inherits: `EnumBase` | Header: `FunctionalTest.h`

EFunctional Test Log Handling

**Properties** (3):
  - `OUTPUT_IGNORED`: `FunctionalTestLogHandling = Ellipsis` — 2
  - `OUTPUT_IS_ERROR`: `FunctionalTestLogHandling = Ellipsis` — 1
  - `PROJECT_DEFAULT`: `FunctionalTestLogHandling = Ellipsis` — How do log categories affect rest results. ProjectDefault can be set in DefaultEngine.ini
but indivi...

### `unreal.FunctionalTestResult`
Inherits: `EnumBase` | Header: `FunctionalTest.h`

EFunctional Test Result

**Properties** (6):
  - `DEFAULT`: `FunctionalTestResult = Ellipsis` — When finishing a test if you use Default, youâre not explicitly stating if the test passed or fail...
  - `ERROR`: `FunctionalTestResult = Ellipsis` — 2
  - `FAILED`: `FunctionalTestResult = Ellipsis` — 4
  - `INVALID`: `FunctionalTestResult = Ellipsis` — 1
  - `RUNNING`: `FunctionalTestResult = Ellipsis` — 3
  - `SUCCEEDED`: `FunctionalTestResult = Ellipsis` — 5

### `unreal.WidgetTestAppearLocation`
Inherits: `EnumBase` | Header: `FunctionalUIScreenshotTest.h`

EWidget Test Appear Location

**Properties** (2):
  - `PLAYER_SCREEN`: `WidgetTestAppearLocation = Ellipsis` — 1
  - `VIEWPORT`: `WidgetTestAppearLocation = Ellipsis` — 0

### `unreal.FunctionalTestAISpawned`
Inherits: `MulticastDelegateBase` | Header: `FunctionalAITest.h`

Functional Test AISpawned Delegate Signature

### `unreal.FunctionalTestEventSignature`
Inherits: `MulticastDelegateBase` | Header: `FunctionalTest.h`

Functional Test Event Signature Delegate Signature
