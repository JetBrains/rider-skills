# UE Python API — DataprepEditorScriptingUtilities Module

**2 types** from the `DataprepEditorScriptingUtilities` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `EditorDataprepAssetLibrary`, `DataprepReportMethod`

---

## Classes

### `unreal.EditorDataprepAssetLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `EditorDataprepAssetLibrary.h`

Utility class to do most expose most of the common functionalities of the dataprep editor plugin (Visual Dataprep).

**Methods** (20):
  - `add_action(dataprep_asset)` -> `DataprepActionAsset` [classmethod] — Add an action to a dataprep asset note: the action is added at the end of the action list
  - `add_action_by_duplication(dataprep_asset, action_to_duplicate)` -> `DataprepActionAsset` [classmethod] — Add an action to a dataprep asset note: the action is added at the end of the action list
  - `add_producer(dataprep_asset_interface, producer_class)` -> `DataprepContentProducer` [classmethod] — Add a producer to a dataprep asset (The producer will act as if was call from the dataprep editor, use the automated ver...
  - `add_producer_automated(dataprep_asset_interface, producer_class)` -> `DataprepContentProducer` [classmethod] — Add a producer to a dataprep asset
  - `add_step(dataprep_action, step_type)` -> `DataprepParameterizableObject` [classmethod] — Add a step to a dataprep action
  - `add_step_by_duplication(dataprep_action, step_object)` -> `DataprepParameterizableObject` [classmethod] — Add a step to a dataprep action by duplicating the step object
  - `execute_dataprep(dataprep_asset_interface, log_reporting_method, progress_reporting_method)` -> `bool` [classmethod] — Runs the Dataprep assetâs producers, execute its recipe and finally runs the consumer to output the results.
  - `get_action(dataprep_asset, index)` -> `DataprepActionAsset` [classmethod] — Get an action from a dataprep asset.
  - `get_action_count(dataprep_asset)` -> `int32` [classmethod] — Get number of actions of a dataprep asset
  - `get_consumer(dataprep_asset_interface)` -> `DataprepContentConsumer` [classmethod] — Access the consumer of a dataprep asset
  - `get_producer(dataprep_asset_interface, index)` -> `DataprepContentProducer` [classmethod] — Get a producer from a dataprep asset.
  - `get_producers_count(dataprep_asset_interface)` -> `int32` [classmethod] — Get number of the producer of a dataprep asset
  - `get_step_object(dataprep_action, index)` -> `DataprepParameterizableObject` [classmethod] — Return the object of a step from the dataprep action
  - `get_steps_count(dataprep_action)` -> `int32` [classmethod] — Get the number of steps for a dataprep action
  - `move_step(dataprep_action, step_index, destination_index)` -> `None` [classmethod] — Move a step of the dataprep action
  - `remove_action(dataprep_asset, index)` -> `None` [classmethod] — Remove an action from a dataprep asset
  - `remove_producer(dataprep_asset_interface, index)` -> `None` [classmethod] — Remove a producer from a dataprep asset
  - `remove_step(dataprep_action, index)` -> `None` [classmethod] — Remove a step from the action
  - `swap_actions(dataprep_asset, first_action_index, second_action_index)` -> `None` [classmethod] — Swap the actions of a dataprep asset
  - `swap_steps(dataprep_action, first_index, second_index)` -> `None` [classmethod] — Swap the steps of a dataprep action

### `unreal.DataprepReportMethod`
Inherits: `EnumBase` | Header: `EditorDataprepAssetLibrary.h`

EDataprep Report Method

**Properties** (3):
  - `NO_FEEDBACK`: `DataprepReportMethod = Ellipsis` — Donât report the feedback 2
  - `SAME_FEEDBACK_AS_EDITOR`: `DataprepReportMethod = Ellipsis` — Report the feedback the same way that the dataprep asset editor does 1
  - `STANDARD_LOG`: `DataprepReportMethod = Ellipsis` — Report the feedback into the output log only 0
