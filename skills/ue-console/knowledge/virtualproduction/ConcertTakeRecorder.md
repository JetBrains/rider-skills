# UE Python API — ConcertTakeRecorder Module

**2 types** from the `ConcertTakeRecorder` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ConcertTakeSynchronization`, `MultiUserTakesFunctionLibrary`

---

## Classes

### `unreal.ConcertTakeSynchronization`
Inherits: `Object` | Header: `ConcertTakeRecorderMessages.h`

Concert Take Synchronization

**Properties** (2):
  - `sync_take_recording_transactions`: `bool` — [Read-Write] (bool)
  - `transact_take_metadata`: `bool` — [Read-Write] (bool)

### `unreal.MultiUserTakesFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MultiUserTakesFunctionLibrary.h`

Exposes some of the recorder settings to Blueprints to allow for more editor scripting capabilities.

**Methods** (7):
  - `get_record_on_client(client_endpoint_id)` -> `bool` [classmethod] — Gets the checkbox value in the âRecord On Clientâ column in the settings displayed at the bottom of the âTake Reco...
  - `get_record_on_client_local()` -> `bool` [classmethod] — Gets the checkbox value in the âRecord On Clientâ column in the settings displayed at the bottom of the âTake Reco...
  - `get_synchronize_take_recorder_transactions(client_endpoint_id)` -> `bool` [classmethod] — Gets the value of the âSynchronizeTakeRecorderTransactionsâ checkbox in the settings displayed at the bottom of the ...
  - `get_synchronize_take_recorder_transactions_local()` -> `bool` [classmethod] — Gets the value of the âSynchronizeTakeRecorderTransactionsâ checkbox in the settings displayed at the bottom of the ...
  - `set_record_on_client(client_endpoint_id, new_value)` -> `None` [classmethod] — Sets the checkbox value in the âRecord On Clientâ column in the settings displayed at the bottom of the âTake Reco...
  - `set_record_on_client_local(new_value)` -> `None` [classmethod] — Sets the checkbox value in the âRecord On Clientâ column in the settings displayed at the bottom of the âTake Reco...
  - `set_synchronize_take_recorder_transactions_local(new_value)` -> `None` [classmethod] — Sets the value of the âSynchronizeTakeRecorderTransactionsâ checkbox in the settings displayed at the bottom of the ...
