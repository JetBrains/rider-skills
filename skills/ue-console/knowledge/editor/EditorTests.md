# UE Python API — EditorTests Module

**5 types** from the `EditorTests` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `EditorTestsUtilityLibrary`, `EditorUtilityTest`, `EditorUtilityTestResult`, `EditorUtilityTestEventSignature`, `EditorUtilityTestFinishedSignature`

---

## Classes

### `unreal.EditorTestsUtilityLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `EditorTestsUtilityLibrary.h`

Blueprint library for altering and analyzing animation / skeletal data

**Methods** (6):
  - `bake_materials_for_component(static_mesh_component, material_options, material_merge_options)` -> `None` [classmethod] — Bakes out material in-place for the given set of static mesh components using the MaterialMergeOptions
  - `create_proxy_mesh(static_mesh_components, proxy_settings)` -> `None` [classmethod] — Simplify meshes and bakes out materials into a atlas-material for the given set of static mesh components using the Prox...
  - `get_child_editor_widget_by_name(widget_blueprint, name)` -> `Widget` [classmethod] — Finds a UWidget object used by the editor - useful for testing widget editing
  - `get_editor_widget_navigation_rule(widget, nav)` -> `UINavigationRule` [classmethod] — Simple logic for getting data within UWidget::Navigation, which has a details customization
  - `merge_static_mesh_components(static_mesh_components, merge_settings, replace_actors)` -> `Array [ int32 ]` [classmethod] — Merges meshes and bakes out materials into a atlas-material for the given set of static mesh components using the MergeS...
  - `set_editor_widget_navigation_rule(widget, nav, rule)` -> `None` [classmethod] — Simple function for setting UWidget::Navigation, which has a details customization

### `unreal.EditorUtilityTest`
Inherits: `Object` | Header: `EditorUtilityTest.h`

Editor Utility Test

**Methods** (13):
  - `add_error(message)` -> `None` — Add Error
  - `add_info(message)` -> `None` — Add Info
  - `add_warning(message)` -> `None` — Add Warning
  - `expect_false(condition, error_message)` -> `None` — Add error if expected condition is true
  - `expect_true(condition, error_message)` -> `None` — Add error if expected condition is false
  - `finish_prepare_test()` -> `None` — Tell the blueprint VM to start the test (to use at the end of Prepare Test event).
  - `finish_test(test_state, message)` -> `None` — Tell the VM the test is finished with specify state.
  - `get_state()` -> `EditorUtilityTestResult` — Get test state
  - `is_running()` -> `bool` — Is test ruuning
  - `prepare_test()` -> `None` — Use to setup test before running, must call FinishPrepareTest at the end to actual start the test.
  - `receive_finished_test(test_state)` -> `EditorUtilityTestResult` — Use to add clean up steps, the call is blocking.
  - `run()` -> `None` — Blueprint Utility Editor entry point
  - `start_test()` -> `None` — Actual run the test, must call FinishTest at then end of test with a state to signify the test is done.

**Properties** (7):
  - `description`: `str` [Read-Only] — [Read-Only] A description of the test, like what is this test trying to determine. (str)
  - `on_test_finished`: `EditorUtilityTestFinishedSignature` — [Read-Write] Called when the test is finished. Use it to clean up (EditorUtilityTestFinishedSignatur...
  - `on_test_prepare`: `EditorUtilityTestEventSignature` — [Read-Write] Called when the test is ready to prepare (EditorUtilityTestEventSignature)
  - `on_test_start`: `EditorUtilityTestEventSignature` — [Read-Write] Called when the test is started (EditorUtilityTestEventSignature)
  - `owner`: `str` [Read-Only] — [Read-Only] The owner is the group or person responsible for the test. Generally you should use a gr...
  - `preparation_time_limit`: `float` [Read-Only] — [Read-Only] The Testâs time limit for preparation, this is the time it has to trigger IsReadyToSta...
  - `time_limit`: `float` [Read-Only] — [Read-Only] Testâs total run time limit. â0â means no limit (float)

### `unreal.EditorUtilityTestResult`
Inherits: `EnumBase` | Header: `EditorUtilityTest.h`

EEditor Utility Test Result

**Properties** (6):
  - `DEFAULT`: `EditorUtilityTestResult = Ellipsis` — When finishing a test if you use Default, youâre not explicitly stating if the test passed or fail...
  - `FAILED`: `EditorUtilityTestResult = Ellipsis` — 4
  - `INVALID`: `EditorUtilityTestResult = Ellipsis` — 1
  - `PREPARING`: `EditorUtilityTestResult = Ellipsis` — 2
  - `RUNNING`: `EditorUtilityTestResult = Ellipsis` — 3
  - `SUCCEEDED`: `EditorUtilityTestResult = Ellipsis` — 5

### `unreal.EditorUtilityTestEventSignature`
Inherits: `MulticastDelegateBase` | Header: `EditorUtilityTest.h`

Editor Utility Test Event Signature Delegate Signature

### `unreal.EditorUtilityTestFinishedSignature`
Inherits: `MulticastDelegateBase` | Header: `EditorUtilityTest.h`

Editor Utility Test Finished Signature Delegate Signature
