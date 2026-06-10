# UE Python API — AsyncMessageSystem Module

**8 types** from the `AsyncMessageSystem` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AsyncMessage`, `AsyncMessageHandle`, `AsyncMessageId`, `AsyncAction_ListenForAsyncMessage`, `AsyncMessageBindingComponent`, `AsyncMessageBindingEndpointInterface`, `AsyncMessageSystemBlueprintLibrary`, `AsyncMessageReceivedDelegate`

---

## Classes

### `unreal.AsyncMessage`
Inherits: `StructBase` | Header: `AsyncMessage.h`

A single async message which has been queued for broadcasting, and listeners are interested in receiving the data from.

**Properties** (4):
  - `message_id`: `AsyncMessageId` [Read-Only] — [Read-Only] The Async message Id which this message is a part of. (AsyncMessageId)
  - `message_source_id`: `AsyncMessageId` [Read-Only] — [Read-Only] The source of this message. This might be different from the âMessageIdâ, because th...
  - `payload_copy`: `InstancedStruct` [Read-Only] — [Read-Only] A copy of the payload data that is created upon construction of this message. This data ...
  - `queue_time`: `float` [Read-Only] — [Read-Only] The time at which this message was queued ( FApp::GetCurrentTime() ) (double)

### `unreal.AsyncMessageHandle`
Inherits: `StructBase` | Header: `AsyncMessageHandle.h`

Handle used to identify a bound listener to an Async Message. These handles are unique to each bound listener and created by the owning FAsyncMessageSystemBase that the Message was bound to.

### `unreal.AsyncMessageId`
Inherits: `StructBase` | Header: `AsyncMessageId.h`

Represents a single message which can be bound to and queued in the async message system.

**Properties** (1):
  - `internal_message_tag`: `GameplayTag` — [Read-Write] The FName which represents this async message ID (GameplayTag)

### `unreal.AsyncAction_ListenForAsyncMessage`
Inherits: `BlueprintAsyncActionBase` | Header: `AsyncAction_ListenForMessage.h`

An async action for binding a listener to a message. The user will call the âStartListeningForAsyncMessageâ function from blueprints, which will create the async action object and an exec pin will...

**Methods** (1):
  - `stop_listening_for_async_message()` -> `None` — Stops the given message handle from receiving any more messages.

**Properties** (1):
  - `on_message_received`: `AsyncMessageReceivedDelegate` — [Read-Write] Delegate which executes when the bound message that this async action is listening for ...

### `unreal.AsyncMessageBindingComponent`
Inherits: `ActorComponent` | Header: `AsyncMessageBindingComponent.h`

A blueprint component which will allow you to specify a specific endpoint to use when queueing messages or binding listeners to the Async Message System.

### `unreal.AsyncMessageBindingEndpointInterface`
Inherits: `Interface` | Header: `AsyncMessageBindingComponent.h`

Async Message Binding Endpoint Interface

### `unreal.AsyncMessageSystemBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AsyncMessageBlueprintLibrary.h`

Blueprint function library for the Async Message System

**Methods** (4):
  - `conv_async_message_id_to_string(message_id)` -> `str` [classmethod] — Get the string representation of the given Async Message Id.
  - `get_message_blueprint_script_callstack(message)` -> `str` [classmethod] — Gets the given messageâs callstack of when and where it was queued from in blueprints/script Note: bShouldRecordQueueC...
  - `get_message_native_queue_callstack(message)` -> `str` [classmethod] — Gets the given messageâs callstack of when and where it was queued from native C++ code. Note: bShouldRecordQueueCalls...
  - `queue_async_message_for_broadcast(world_context_object, message_id, payload, desired_endpoint)` -> `bool` [classmethod] — Queues the given async message for broadcast the next time that this message system processes its message queue

### `unreal.AsyncMessageReceivedDelegate`
Inherits: `MulticastDelegateBase` | Header: `AsyncAction_ListenForMessage.h`

Async Message Received Delegate Delegate Signature
