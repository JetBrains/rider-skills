# UE Python API — CommonConversationRuntime Module

**31 types** from the `CommonConversationRuntime` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AdvanceConversationRequest`, `ClientConversationMessage`, `ClientConversationMessagePayload`, `ClientConversationOptionEntry`, `CommonDialogueBankParticipant`, `ConversationChoiceReference`, `ConversationContext`, `ConversationNodeHandle`, `ConversationNodeParameterPair`, `ConversationParticipantEntry`, `ConversationParticipants`, `ConversationTaskResult`, `ConversationChoiceNode`, `ConversationContextHelpers`, `ConversationDatabase`, `ConversationEntryPointNode`, `ConversationInstance`, `ConversationLibrary`, `ConversationLinkNode`, `ConversationNode`, ... (31 total)

---

## Classes

### `unreal.AdvanceConversationRequest`
Inherits: `StructBase` | Header: `ConversationTypes.h`

Advance Conversation Request

**Properties** (2):
  - `choice`: `ConversationChoiceReference` — [Read-Write] (ConversationChoiceReference)
  - `user_parameters`: `None` — [Read-Write]
TODO:: CONVERSATION: Not currently supported, TODO. (Array[ConversationNodeParameterPai...

### `unreal.ClientConversationMessage`
Inherits: `StructBase` | Header: `ConversationTypes.h`

Client Conversation Message

**Properties** (4):
  - `metadata_parameters`: `None` — âAngryâ/âHappyâ) (Array[ConversationNodeParameterPair]) [Read-Write] Additional metadata for...
  - `participant_display_name`: `Text` — [Read-Write] (Text)
  - `speaker_id`: `GameplayTag` — [Read-Write] (GameplayTag)
  - `text`: `Text` — [Read-Write] (Text)

### `unreal.ClientConversationMessagePayload`
Inherits: `StructBase` | Header: `ConversationTypes.h`

Client Conversation Message Payload

**Properties** (4):
  - `current_node`: `ConversationNodeHandle` — [Read-Write] (ConversationNodeHandle)
  - `message`: `ClientConversationMessage` — [Read-Write] (ClientConversationMessage)
  - `options`: `None` — [Read-Write] (Array[ClientConversationOptionEntry])
  - `participants`: `ConversationParticipants` — [Read-Write] (ConversationParticipants)

### `unreal.ClientConversationOptionEntry`
Inherits: `StructBase` | Header: `ConversationTypes.h`

The conversation option entry is what we send to the client, one entry per choice.

**Properties** (5):
  - `choice_reference`: `ConversationChoiceReference` — [Read-Write] (ConversationChoiceReference)
  - `choice_tags`: `GameplayTagContainer` — [Read-Write] (GameplayTagContainer)
  - `choice_text`: `Text` — [Read-Write] (Text)
  - `choice_type`: `ConversationChoiceType` — [Read-Write] (ConversationChoiceType)
  - `extra_data`: `None` — [Read-Write] Occasionally a choice might need to send down metadata thatâs entirely extra.
Itâs ...

### `unreal.CommonDialogueBankParticipant`
Inherits: `StructBase` | Header: `ConversationDatabase.h`

/

### `unreal.ConversationChoiceReference`
Inherits: `StructBase` | Header: `ConversationTypes.h`

The conversation choice reference is the closest thing there is to a link at runtime for a choice. Choices always map to a Task node, which is the NodeReference. However some tasks could potentially d...

**Properties** (2):
  - `node_parameters`: `None` — [Read-Write] These are the parameters required by that node to be activated.  The
same node could po...
  - `node_reference`: `ConversationNodeHandle` — [Read-Write] This is the node that weâre targeting with our choice. (ConversationNodeHandle)

### `unreal.ConversationContext`
Inherits: `StructBase` | Header: `ConversationContext.h`

Information about a currently active conversation

### `unreal.ConversationNodeHandle`
Inherits: `StructBase` | Header: `ConversationNode.h`

Conversation Node Handle

### `unreal.ConversationNodeParameterPair`
Inherits: `StructBase` | Header: `ConversationTypes.h`

Conversation Node Parameter Pair

**Properties** (2):
  - `name`: `str` — [Read-Write] (str)
  - `value`: `str` — [Read-Write] (str)

### `unreal.ConversationParticipantEntry`
Inherits: `StructBase` | Header: `ConversationTypes.h`

Conversation Participant Entry

**Properties** (2):
  - `actor`: `Actor` — [Read-Write] (Actor)
  - `participant_id`: `GameplayTag` — [Read-Write] (GameplayTag)

### `unreal.ConversationParticipants`
Inherits: `StructBase` | Header: `ConversationTypes.h`

Conversation Participants

**Properties** (1):
  - `list`: `None` — [Read-Write] (Array[ConversationParticipantEntry])

### `unreal.ConversationTaskResult`
Inherits: `StructBase` | Header: `ConversationContext.h`

The FConversationTaskResult encompasses the type of result along with any extra data we need for that kind of result, for example if weâre giving the player a message and giving them a choice, what ...

### `unreal.ConversationChoiceNode`
Inherits: `ConversationSubNode` | Header: `ConversationChoiceNode.h`

A choice on a task indicates that an option be presented to the user when the owning task is one of the available options of a preceding task.

**Methods** (1):
  - `fill_choice(context)` -> `ClientConversationOptionEntry` — Fill Choice

**Properties** (2):
  - `choice_tags`: `GameplayTagContainer` [Read-Only] — [Read-Only] (GameplayTagContainer)
  - `default_choice_display_text`: `Text` [Read-Only] — [Read-Only] (Text)

### `unreal.ConversationContextHelpers`
Inherits: `BlueprintFunctionLibrary` | Header: `ConversationContext.h`

Wrapper methods from FConversationContext

**Methods** (14):
  - `abort_conversation(context)` -> `ConversationTaskResult` [classmethod] — Constructs and returns a FConversationTaskResult configured with EConversationTaskResultType::AbortConversation
  - `advance_conversation(context)` -> `ConversationTaskResult` [classmethod] — Constructs and returns a FConversationTaskResult configured with EConversationTaskResultType::AdvanceConversation
  - `advance_conversation_with_choice(context, choice)` -> `ConversationTaskResult` [classmethod] — Constructs and returns a FConversationTaskResult configured with EConversationTaskResultType::AdvanceConversationWithCho...
  - `can_conversation_continue(conversation_tas_result)` -> `bool` [classmethod] — Checks the provided task result against any which would end the conversation e.g. EConversationTaskResultType::Invalid o...
  - `find_conversation_component(actor)` -> `ConversationParticipantComponent` [classmethod] — Wrapper to find and return any UConversationParticipantComponent belonging to the provided parameter actor
  - `get_conversation_instance(context)` -> `ConversationInstance` [classmethod] — Returns the conversation instance object associated with the conversation context provided, or nullptr if not valid
  - `get_conversation_participant(context, participant_tag)` -> `ConversationParticipantComponent` [classmethod] — Returns the conversation participant component belonging to the participant indicated by âParticipantTagâ, or nullpt...
  - `get_conversation_participant_actor(context, participant_tag)` -> `Actor` [classmethod] — Returns the conversation participant actor indicated by âParticipantTagâ, or nullptr if not found
  - `get_current_conversation_node_handle(context)` -> `ConversationNodeHandle` [classmethod] — Returns the FConversationNodeHandle of the conversation instance associated with this context, or a handle with an inval...
  - `make_conversation_participant(context, participant_actor, participant_tag)` -> `None` [classmethod] — Registers an actor as part of the conversation, that actor doesnât need to have the UConversationParticipantComponent ...
  - `pause_conversation_and_send_client_choices(context, message)` -> `ConversationTaskResult` [classmethod] — Constructs and returns a FConversationTaskResult configured with EConversationTaskResultType::PauseConversationAndSendCl...
  - `return_to_conversation_start(context)` -> `ConversationTaskResult` [classmethod] — Constructs and returns a FConversationTaskResult configured with EConversationTaskResultType::ReturnToConversationStart
  - `return_to_current_client_choice(context)` -> `ConversationTaskResult` [classmethod] — Constructs and returns a FConversationTaskResult configured with EConversationTaskResultType::ReturnToCurrentClientChoic...
  - `return_to_last_client_choice(context)` -> `ConversationTaskResult` [classmethod] — Constructs and returns a FConversationTaskResult configured with EConversationTaskResultType::ReturnToLastClientChoice

### `unreal.ConversationDatabase`
Inherits: `PrimaryDataAsset` | Header: `ConversationDatabase.h`

### `unreal.ConversationEntryPointNode`
Inherits: `ConversationNodeWithLinks` | Header: `ConversationEntryPointNode.h`

Conversation Entry Point Node

### `unreal.ConversationInstance`
Inherits: `Object` | Header: `ConversationInstance.h`

An active conversation between one or more participants

### `unreal.ConversationLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `ConversationLibrary.h`

Conversation Library

**Methods** (2):
  - `start_conversation(conversation_entry_tag, instigator, instigator_tag, target, target_tag, conversation_instance_class = None)` -> `ConversationInstance` [classmethod] — Start Conversation
  - `start_conversation_from_graph(conversation_entry_tag, instigator, instigator_tag, target, target_tag, graph, entry_point_identifier = '')` -> `ConversationInstance` [classmethod] — Start Conversation from Graph

### `unreal.ConversationLinkNode`
Inherits: `ConversationTaskNode` | Header: `ConversationLinkNode.h`

Conversation Link Node

### `unreal.ConversationNode`
Inherits: `Object` | Header: `ConversationNode.h`

Represents a single runtime node in the conversation database.

**Methods** (1):
  - `get_debug_participant_color(participant_id)` -> `LinearColor` — Get Debug Participant Color

### `unreal.ConversationNodeWithLinks`
Inherits: `ConversationNode` | Header: `ConversationNode.h`

Conversation Node with Links

### `unreal.ConversationParticipantComponent`
Inherits: `ActorComponent` | Header: `ConversationParticipantComponent.h`

Active conversation participants should have this component on them. It keeps track of what conversations they are participating in (typically no more than one)

**Methods** (4):
  - `get_participant_actor(participant_tag)` -> `Actor` — Get Participant Actor
  - `get_participant_display_name()` -> `Text` — Get Participant Display Name
  - `is_in_active_conversation()` -> `bool` — Is in Active Conversation
  - `request_server_advance_conversation(choice_picked)` -> `None` — Request Server Advance Conversation

### `unreal.ConversationRequirementNode`
Inherits: `ConversationSubNode` | Header: `ConversationRequirementNode.h`

A requirement is placed on a parent node to control whether or not it can be activated (when a link to the parent node is being evaluated, the requirement will be asked if it is satisfied or not)

**Methods** (1):
  - `is_requirement_satisfied(context)` -> `ConversationRequirementResult` — Is Requirement Satisfied

### `unreal.ConversationSideEffectNode`
Inherits: `ConversationSubNode` | Header: `ConversationSideEffectNode.h`

Side effects are actions that are performed just after a task is executed (this allows state-altering or cosmetic actions to be mixed in to other nodes)

**Methods** (2):
  - `client_cause_side_effect(context)` -> `None` — Client Cause Side Effect
  - `server_cause_side_effect(context)` -> `None` — Server Cause Side Effect

### `unreal.ConversationSubNode`
Inherits: `ConversationNode` | Header: `ConversationSubNode.h`

TODO:: CONVERSATION: Comment me

### `unreal.ConversationTaskNode`
Inherits: `ConversationNodeWithLinks` | Header: `ConversationTaskNode.h`

The ConversationTaskNode is the basis of any task in the conversation graph, that task may be as simple as saying some text to the user, and providing some choices. However more complex tasks can fire...

**Methods** (5):
  - `execute_client_effects(context)` -> `None` — Execute Client Effects
  - `execute_task_node(context)` -> `ConversationTaskResult` — Execute Task Node
  - `gather_static_extra_data(context)` -> `Array [ ConversationNodeParameterPair ]` — Gather Static Extra Data
  - `get_node_body_color()` -> `LinearColor or None` — Get Node Body Color
  - `is_requirement_satisfied(context)` -> `ConversationRequirementResult` — Is Requirement Satisfied

### `unreal.ConversationChoiceType`
Inherits: `EnumBase` | Header: `ConversationTypes.h`

EConversation Choice Type

**Properties** (3):
  - `SERVER_ONLY`: `ConversationChoiceType = Ellipsis` — ServerOnly choices are the choices the user shouldnât see and are filtered from the client. 0
  - `USER_CHOICE_AVAILABLE`: `ConversationChoiceType = Ellipsis` — 1
  - `USER_CHOICE_UNAVAILABLE`: `ConversationChoiceType = Ellipsis` — 2

### `unreal.ConversationRequirementResult`
Inherits: `EnumBase` | Header: `ConversationRequirementNode.h`

The requirement result.

**Properties** (3):
  - `FAILED_AND_HIDDEN`: `ConversationRequirementResult = Ellipsis` — This option is not available, and we should keep it hidden. 2
  - `FAILED_BUT_VISIBLE`: `ConversationRequirementResult = Ellipsis` — This option is not available, but we should tell the player about it still. 1
  - `PASSED`: `ConversationRequirementResult = Ellipsis` — This option is available 0

### `unreal.ConversationTaskResultType`
Inherits: `EnumBase` | Header: `ConversationContext.h`

The conversation task result type gives the conversation system the instruction it needs after running a task. Should we continue to the next task? or stop and give the player the choice of moving for...

**Properties** (8):
  - `ABORT_CONVERSATION`: `ConversationTaskResultType = Ellipsis` — Aborts the conversation. 1
  - `ADVANCE_CONVERSATION`: `ConversationTaskResultType = Ellipsis` — Advances the conversation to the next task, or a random one if there are multiple. 2
  - `ADVANCE_CONVERSATION_WITH_CHOICE`: `ConversationTaskResultType = Ellipsis` — Advances the conversation to a choice, this choice does not have to be one that would normally come ...
  - `INVALID`: `ConversationTaskResultType = Ellipsis` — 0
  - `PAUSE_CONVERSATION_AND_SEND_CLIENT_CHOICES`: `ConversationTaskResultType = Ellipsis` — Stops the conversation flow and notifies the client that there are choices, with a payload of anythi...
  - `RETURN_TO_CONVERSATION_START`: `ConversationTaskResultType = Ellipsis` — Allows jumping back to the beginning of the entire conversation tree, so that you can effectively, r...
  - `RETURN_TO_CURRENT_CLIENT_CHOICE`: `ConversationTaskResultType = Ellipsis` — Does not advance the conversation, just refreshes the current choices again.
This option is really u...
  - `RETURN_TO_LAST_CLIENT_CHOICE`: `ConversationTaskResultType = Ellipsis` — Dynamically allows jumping âbackâ one step in the conversation.  This does not go back one Task,...

### `unreal.OnAllParticipantsNotifiedOfStartEvent`
Inherits: `MulticastDelegateBase` | Header: `ConversationInstance.h`

On All Participants Notified Of Start Event Delegate Signature

### `unreal.OnConversationStatusChanged`
Inherits: `MulticastDelegateBase` | Header: `ConversationParticipantComponent.h`

On Conversation Status Changed Delegate Signature
