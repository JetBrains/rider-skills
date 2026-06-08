# UE Python API — MultiUserClientLibrary Module

**43 types** from the `MultiUserClientLibrary` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ChangeClientStreamFrequencyResponse`, `MultiUserBlueprintEventData`, `MultiUserChangeAuthorityRequest`, `MultiUserChangeClientAuthorityResponse`, `MultiUserChangeClientReplicationRequest`, `MultiUserChangeClientReplicationResult`, `MultiUserChangeClientStreamResponse`, `MultiUserChangeStreamRequest`, `MultiUserClientConfig`, `MultiUserClientDisplayInfo`, `MultiUserClientInfo`, `MultiUserConnectionError`, `MultiUserFrequencyChangeRequest`, `MultiUserObjectReplicationSettings`, `MultiUserPropertyChange`, `MultiUserReplicationRegistrationParams`, `MultiUserSessionInfo`, `ChangeClientAsyncAction`, `MultiUserClientStatics`, `MultiUserClientSyncDatabase`, ... (43 total)

---

## Classes

### `unreal.ChangeClientStreamFrequencyResponse`
Inherits: `StructBase` | Header: `ChangeClientBlueprintParams.h`

Result about changing frequency.

**Properties** (2):
  - `default_change_error_code`: `type` [Read-Only] — [Read-Only] Error for changing the default replication frequency. (âundefinedâ)
  - `object_errors`: `None` [Read-Only] — [Read-Only] Errors encountered for specific objects (Map[SoftObjectPath,MultiUserChangeFrequencyErro...

### `unreal.MultiUserBlueprintEventData`
Inherits: `StructBase` | Header: `MultiUserSubsystem.h`

Multi User Blueprint Event Data

### `unreal.MultiUserChangeAuthorityRequest`
Inherits: `StructBase` | Header: `ChangeClientBlueprintParams.h`

Params for changing a clientâs authority (what theyâre replicating).

**Properties** (2):
  - `object_to_stop_replicating`: `None` — [Read-Write] Objects that should stop replicating. (Set[SoftObjectPath])
  - `objects_to_start_replicating`: `None` — [Read-Write] Objects that should start replicating. The objects must previously have been registered...

### `unreal.MultiUserChangeClientAuthorityResponse`
Inherits: `StructBase` | Header: `ChangeClientBlueprintParams.h`

Multi User Change Client Authority Response

**Properties** (2):
  - `error_code`: `MultiUserChangeAuthorityOperationResult` [Read-Only] — [Read-Only] The error code of changing authority. Fails if StreamChangeResult fails. (MultiUserChang...
  - `rejected_objects`: `None` [Read-Only] — [Read-Only] Objects the client did not get authority over. (Set[SoftObjectPath])

### `unreal.MultiUserChangeClientReplicationRequest`
Inherits: `StructBase` | Header: `ChangeClientBlueprintParams.h`

Params for changing a clientâs stream or authority.

**Properties** (2):
  - `authority_change_request`: `MultiUserChangeAuthorityRequest` — [Read-Write] Changes to make to the objects the client is replicating.
Fails if StreamChangeRequest ...
  - `stream_change_request`: `MultiUserChangeStreamRequest` — [Read-Write] Changes to make to the clientâs registered objects.
Performed before AuthorityChangeR...

### `unreal.MultiUserChangeClientReplicationResult`
Inherits: `StructBase` | Header: `ChangeClientBlueprintParams.h`

Result of processing a FChangeClientReplicationRequest.

**Properties** (2):
  - `authority_response`: `MultiUserChangeClientAuthorityResponse` [Read-Only] — [Read-Only] The result of changing authority. Fails if StreamChangeResult fails.
You can inspect thi...
  - `stream_response`: `MultiUserChangeClientStreamResponse` [Read-Only] — [Read-Only] The result of changing streams.
You can inspect this for why the operation failed. (Mult...

### `unreal.MultiUserChangeClientStreamResponse`
Inherits: `StructBase` | Header: `ChangeClientBlueprintParams.h`

Multi User Change Client Stream Response

**Properties** (5):
  - `authority_conflicts`: `None` [Read-Only] — [Read-Only] Dynamic authority errors.
The change was rejected because
1. this client is replicating ...
  - `error_code`: `MultiUserChangeStreamOperationResult` [Read-Only] — [Read-Only] The error code of changing streams. (MultiUserChangeStreamOperationResult)
  - `failed_stream_creation`: `bool` [Read-Only] — [Read-Only] The client attempted to register the Multi-User stream but failed in doing so.
This usua...
  - `frequency_errors`: `ChangeClientStreamFrequencyResponse` [Read-Only] — [Read-Only] Errors made in the way frequency was changed. (ChangeClientStreamFrequencyResponse)
  - `semantic_errors`: `None` [Read-Only] — [Read-Only] Errors made in the format of the request (Map[SoftObjectPath,MultiUserPutObjectErrorCode...

### `unreal.MultiUserChangeStreamRequest`
Inherits: `StructBase` | Header: `ChangeClientBlueprintParams.h`

Params for changing a clientâs stream.

**Properties** (3):
  - `frequency_changes`: `MultiUserFrequencyChangeRequest` — [Read-Write] Change how often objects are supposed to be replicated. (MultiUserFrequencyChangeReques...
  - `objects_to_remove`: `None` — [Read-Write] Objects that should be unregistered (they will also stop replicating if added here) (Se...
  - `property_changes`: `None` — [Read-Write] Property changes to make to objects. (Map[Object,MultiUserPropertyChange])

### `unreal.MultiUserClientConfig`
Inherits: `StructBase` | Header: `MultiUserClientStatics.h`

Multi User Client Config

**Properties** (4):
  - `default_server_url`: `str` — [Read-Write] (str)
  - `default_session_name`: `str` — [Read-Write] (str)
  - `default_session_to_restore`: `str` — [Read-Write] (str)
  - `validation_mode`: `MultiUserSourceValidationMode` — [Read-Write] (MultiUserSourceValidationMode)

### `unreal.MultiUserClientDisplayInfo`
Inherits: `StructBase` | Header: `MultiUserClientDisplayInfo.h`

Blueprint copy of FConcertClientInfo. Can describe offline clients, too.

**Properties** (1):
  - `display_name`: `str` [Read-Only] — [Read-Only] Holds the display name of the user that owns this instance. (str)

### `unreal.MultiUserClientInfo`
Inherits: `StructBase` | Header: `MultiUserClientStatics.h`

BP copy of FConcertSessionClientInfo Holds info on a client connected through multi-user

**Properties** (4):
  - `avatar_color`: `LinearColor` [Read-Only] — [Read-Only] Holds the color of the user avatar in a session. (LinearColor)
  - `client_endpoint_id`: `Guid` [Read-Only] — [Read-Only] Holds the display name of the user that owns this instance. (Guid)
  - `display_name`: `str` [Read-Only] — [Read-Only] Holds the display name of the user that owns this instance. (str)
  - `tags`: `None` [Read-Only] — [Read-Only] Holds an array of tags that can be used for grouping and categorizing. (Array[Name])

### `unreal.MultiUserConnectionError`
Inherits: `StructBase` | Header: `MultiUserClientStatics.h`

Multi User Connection Error

**Properties** (2):
  - `error_code`: `MultiUserConnectionErrorType` [Read-Only] — [Read-Only] (MultiUserConnectionErrorType)
  - `error_message`: `Text` [Read-Only] — [Read-Only] (Text)

### `unreal.MultiUserFrequencyChangeRequest`
Inherits: `StructBase` | Header: `ChangeClientBlueprintParams.h`

Params for changing how often objects replicate.

**Properties** (4):
  - `change_defaults`: `bool` — [Read-Write] Whether to replace the defaults currently registered on the server with the ones specif...
  - `new_defaults`: `MultiUserObjectReplicationSettings` — [Read-Write] Set new frequency defaults for all objects that do not have any overrides. (MultiUserOb...
  - `overrides_to_add`: `None` — [Read-Write] Objects for which to add overrides (Map[SoftObjectPath,MultiUserObjectReplicationSettin...
  - `overrides_to_remove`: `None` — [Read-Write] Objects for which to remove overrides. (Set[SoftObjectPath])

### `unreal.MultiUserObjectReplicationSettings`
Inherits: `StructBase` | Header: `ChangeClientBlueprintParams.h`

Frequency settings for a particular object

**Properties** (2):
  - `mode`: `MultiUserObjectReplicationMode` — [Read-Write] Determines whether to send a replication event every tick (Realtime) or at the specifie...
  - `replication_rate`: `int` — [Read-Write] If Mode == SpecifiedRate, then replicate this many times per second. (uint8)

### `unreal.MultiUserPropertyChange`
Inherits: `StructBase` | Header: `ChangeClientBlueprintParams.h`

Multi User Property Change

**Properties** (2):
  - `change_type`: `MultiUserPropertyChangeType` — [Read-Write] How you want Properties to be applied to the object. (MultiUserPropertyChangeType)
  - `properties`: `None` — [Read-Write] The properties for the object. See ChangeType for how they are used (Array[ConcertPrope...

### `unreal.MultiUserReplicationRegistrationParams`
Inherits: `StructBase` | Header: `IMultiUserReplicationRegistration.h`

Multi User Replication Registration Params

**Properties** (2):
  - `client_endpoint_id`: `Guid` [Read-Only] — [Read-Only] The client for which the objects and properties are being registered. (Guid)
  - `context`: `MultiUserReplicationRegistrationContext` [Read-Only] — [Read-Only] Uses this to register properties and add additional objects for discovery. (MultiUserRep...

### `unreal.MultiUserSessionInfo`
Inherits: `StructBase` | Header: `MultiUserClientStatics.h`

BP copy of FConcertSessionInfo Holds info on a connected session.

**Properties** (5):
  - `endpoint_name`: `str` [Read-Only] — [Read-Only] Holds the resolved endpoint name (HostPC) for the connected session. (str)
  - `server_endpoint_id`: `Guid` [Read-Only] — [Read-Only] Holds the server endpoint id for this session. (Guid)
  - `server_name`: `str` [Read-Only] — [Read-Only] Holds the server name for the connected session. (str)
  - `session_name`: `str` [Read-Only] — [Read-Only] Holds the session name current connected. (str)
  - `valid`: `bool` [Read-Only] — [Read-Only] Indicates if the current session info is valid. If we are connected to a session this is...

### `unreal.ChangeClientAsyncAction`
Inherits: `BlueprintAsyncActionBase` | Header: `ChangeClientAsyncAction.h`

Enqueues a request for changing a specific clientâs stream and / or authority. This class exposes IMultiUserReplication::EnqueueChanges.

**Properties** (1):
  - `on_completed`: `OnChangeOperationCompleted` — [Read-Write] Event that triggers when the operation completes. (OnChangeOperationCompleted)

### `unreal.MultiUserClientStatics`
Inherits: `BlueprintFunctionLibrary` | Header: `MultiUserClientStatics.h`

Multi User Client Statics

**Methods** (27):
  - `concert_jump_to_presence(other_user_name: str, transform_offset: Transform)` -> `None` [classmethod] — deprecated: âconcert_jump_to_presenceâ was renamed to âjump_to_multi_user_presenceâ.
  - `configure_multi_user_client(client_config)` -> `bool` [classmethod] — Configure the Multi-User client.
  - `gather_session_changes(ignore_persisted = True)` -> `Array [ Name ]` [classmethod] — Get the list of packages that have changed since the last persist unless ignore persisted is false.
  - `get_concert_client_info_by_name(client_name: str)` -> `MultiUserClientInfo | None` [classmethod] — deprecated: âget_concert_client_info_by_nameâ was renamed to âget_multi_user_client_info_by_nameâ.
  - `get_concert_connection_status()` -> `bool` [classmethod] — deprecated: âget_concert_connection_statusâ was renamed to âget_multi_user_connection_statusâ.
  - `get_concert_sync_database()` -> `MultiUserClientSyncDatabase` [classmethod] — Get the proxy object for the sync database.
  - `get_last_multi_user_connection_error()` -> `MultiUserConnectionError` [classmethod] — Get the last Multi-User connection error that happened, if any
  - `get_local_concert_client_info()` -> `MultiUserClientInfo` [classmethod] — deprecated: âget_local_concert_client_infoâ was renamed to âget_local_multi_user_client_infoâ.
  - `get_local_multi_user_client_info()` -> `MultiUserClientInfo` [classmethod] — Get the local ClientInfo. Works when not connected to a session.
  - `get_multi_user_client_info_by_name(client_name)` -> `MultiUserClientInfo or None` [classmethod] — Get the ClientInfo for any Multi-User participant by name. The local user is found even when not connected to a session....
  - `get_multi_user_connection_status()` -> `bool` [classmethod] — Get Multi-User connection status. deprecated: âGet Multi-User Connection Statusâ is deprecated. Please use âGet Mu...
  - `get_multi_user_connection_status_detail()` -> `MultiUserConnectionStatus` [classmethod] — Get Multi-User connection status.
  - `get_multi_user_presence_transform(client_endpoint_id)` -> `Transform` [classmethod] — Get the Presence Actor transform for the specified client endpoint id or identity if the client isnât found
  - `get_multi_user_session_info()` -> `MultiUserSessionInfo` [classmethod] — Get the current SessionInfo. Works when not connected to a session, but returns an empty session info.
  - `get_remote_concert_client_infos()` -> `None` [classmethod] — deprecated: âget_remote_concert_client_infosâ was renamed to âget_remote_multi_user_client_infosâ.
  - `get_remote_multi_user_client_infos()` -> `Array[MultiUserClientInfo] or None` [classmethod] — Get ClientInfos of current Multi-User participants except for the local user. Returns false is no remote clients were fo...
  - `jump_to_multi_user_presence(other_user_name, transform_offset)` -> `None` [classmethod] — Teleport to another Multi-User userâs presence.
  - `persist_multi_user_session_changes()` -> `None` [classmethod] — Persist the session changes and prepare the files for source control submission.
  - `persist_session_changes()` -> `None` [classmethod] — deprecated: âpersist_session_changesâ was renamed to âpersist_multi_user_session_changesâ.
  - `persist_specified_packages(packages_to_persist)` -> `None` [classmethod] — Persist the specified sessions changes using source control.
  - `set_multi_user_presence_enabled(is_enabled = True)` -> `None` [classmethod] — Set whether presence is currently enabled and should be shown (unless hidden by other settings)
  - `set_multi_user_presence_visibility(name, visibility, propagate_to_all = False)` -> `None` [classmethod] — Set Presence Actor Visibility by display name
  - `set_multi_user_presence_visibility_by_id(client_endpoint_id, visibility, propagate_to_all = False)` -> `None` [classmethod] — Set Presence Actor Visibility by client id
  - `set_presence_enabled(is_enabled: bool = True)` -> `None` [classmethod] — deprecated: âset_presence_enabledâ was renamed to âset_multi_user_presence_enabledâ.
  - `set_presence_visibility(name: str, visibility: bool, propagate_to_all: bool = False)` -> `None` [classmethod] — deprecated: âset_presence_visibilityâ was renamed to âset_multi_user_presence_visibilityâ.
  - `start_multi_user_default_connection()` -> `bool` [classmethod] — Start the Multi-User default connection process.
  - `update_workspace_modified_packages()` -> `None` [classmethod] — Update Multi-User Workspace Modified Packages to be in sync for source control submission. deprecated: UpdateWorkspaceMo...

### `unreal.MultiUserClientSyncDatabase`
Inherits: `Object` | Header: `MultiUserClientStatics.h`

Multi User Client Sync Database

**Properties** (1):
  - `on_package_saved`: `OnPackageSavedSignature` [Read-Only] — [Read-Only] (OnPackageSavedSignature)

### `unreal.MultiUserReplicationRegistration`
Inherits: `Interface` | Header: `IMultiUserReplicationRegistration.h`

Multi User Replication Registration

**Methods** (1):
  - `discover_replication_settings(params)` -> `None` — Registers properties and additional objects that must be replicated.

### `unreal.MultiUserReplicationRegistrationContext`
Inherits: `Interface` | Header: `IMultiUserReplicationRegistrationContext.h`

Multi User Replication Registration Context

**Methods** (2):
  - `add_additional_object(object)` -> `None` — Adds an additional object. Properties will be automatically discovered for Object, as well. If the object implements IMu...
  - `add_properties_to_object(object, properties_to_add)` -> `None` — Extends the stream with the given object, if not yet added, and adds the properties to it. Properties will be automatica...

### `unreal.MultiUserReplicationRegistrationContextImpl`
Inherits: `Object` | Header: `MultiUserReplicationRegistrationContextImpl.h`

Instantiated once and passed to IMultiUserReplicationRegistration. Needed because TScriptInterface, which is passed via FMultiUserReplicationRegistrationParams, requires an UObject to bind to. see: FU...

**Methods** (2):
  - `add_additional_object(object)` -> `None` — Add Additional Object
  - `add_properties_to_object(object, properties_to_add)` -> `None` — Add Properties to Object

### `unreal.MultiUserReplicationSubsystem`
Inherits: `EngineSubsystem` | Header: `MultiUserReplicationSubsystem.h`

Exposes ways to interact with the Multi-user replication system via Blueprints.

**Methods** (8):
  - `get_object_replication_frequency(client_id, object_path)` -> `MultiUserObjectReplicationSettings or None` — note: An object can be registered but not replicated. see: UMultiUserSubsystem::GetLocalClientId and UMultiUserSubsystem...
  - `get_offline_client_ids()` -> `Array [ Guid ]`
  - `get_owning_offline_clients(object_path)` -> `Array [ Guid ]` — A list of offline clients that, upon rejoining a session, will attempt to reclaim properties they previously registered ...
  - `get_properties_registered_to_object(client_id, object_path)` -> `Array [ ConcertPropertyChainWrapper ]` — note: An object can be registered but not replicated. Use IsReplicatingObject to find out whether the client is replicat...
  - `get_registered_objects(client_id)` -> `Array [ SoftObjectPath ]` — Gets the objects the online or offline client has registered with the server. Just because an object is returned here, i...
  - `get_replicated_objects(client_id)` -> `Array [ SoftObjectPath ]` — Gets the objects that are currently being replicated by the client. note: There is a difference between registered and r...
  - `is_owned_by_offline_client(object_path)` -> `bool`
  - `is_replicating_object(client_id, object_path)` -> `bool` — note: An object can be registered but not replicated. see: UMultiUserSubsystem::GetLocalClientId and UMultiUserSubsystem...

**Properties** (4):
  - `on_client_authority_server_state_changed`: `OnServerStateChanged` — [Read-Write] Event triggered a client changes the objects it is replicating. (OnServerStateChanged)
  - `on_client_stream_server_state_changed`: `OnServerStateChanged` — [Read-Write] Event triggered when the following changes about a client:
- The registered object to p...
  - `on_offline_client_content_changed`: `OnServerStateChanged` — [Read-Write] Event triggered when the content that an offline client will attempt to re-claim change...
  - `on_offline_clients_changed`: `OnOfflineClientsChanged` — [Read-Write] Event triggered when the local list of offline clients has changed. (OnOfflineClientsCh...

### `unreal.MultiUserSubsystem`
Inherits: `EngineSubsystem` | Header: `MultiUserSubsystem.h`

Multi User Subsystem

**Methods** (5):
  - `get_local_client_id()` -> `Guid or None` — If connected to a session, gets the endpoint identifiers of client corresponding to the local editor instance.
  - `get_remote_client_ids()` -> `Array[Guid] or None` — If connected to a session, gets the endpoint identifiers of all remote clients.
  - `is_connected_to_session()` -> `bool` — Returns true if we are currently in a session.
  - `register_custom_event_handler(event_type, event_handler)` -> `bool` — Register an event handler for the given type. Only one handler per type is allowed. You should register your handler on ...
  - `unregister_custom_event_handler(event_type)` -> `bool` — Unregister an event handler for the given type.

**Properties** (3):
  - `on_session_client_changed`: `OnSessionClientChanged` — [Read-Write] Invoked when information about a client changes while the local editor instance is in a...
  - `on_session_connected`: `OnSessionConnected` — [Read-Write] Invoked when the local editor instance has joined a session. (OnSessionConnected)
  - `on_session_disconnected`: `OnSessionDisconnected` — [Read-Write] Invoked when the local editor instanced has left a session. (OnSessionDisconnected)

### `unreal.MultiUserChangeAuthorityOperationResult`
Inherits: `EnumBase` | Header: `ChangeClientBlueprintParams.h`

Result of changing a clientâs authority

**Properties** (11):
  - `CANCELLED`: `MultiUserChangeAuthorityOperationResult = Ellipsis` — The submission progress was cancelled, e.g. because the target client disconnected. 5
  - `CANCELLED_DUE_TO_STREAM_UPDATE`: `MultiUserChangeAuthorityOperationResult = Ellipsis` — The authority change was not submitted because the stream change was unsuccessful. 4
  - `FAILED_TO_SEND_REQUEST`: `MultiUserChangeAuthorityOperationResult = Ellipsis` — Unlikely. ISubmissionWorkflow validation rejected the change. See log. Could be e.g. that the remote...
  - `NOT_AVAILABLE`: `MultiUserChangeAuthorityOperationResult = Ellipsis` — The MultiUserClient module is not available. Usually when youâre in a runtime build but the operat...
  - `NOT_IN_SESSION`: `MultiUserChangeAuthorityOperationResult = Ellipsis` — No submission took place because the local editor is not in any session. 7
  - `NOT_ON_GAME_THREAD`: `MultiUserChangeAuthorityOperationResult = Ellipsis` — The request was not made on the game thread. 9
  - `NO_CHANGES`: `MultiUserChangeAuthorityOperationResult = Ellipsis` — No changes were requested to be made 1
  - `REJECTED_FULLY_OR_PARTIALLY`: `MultiUserChangeAuthorityOperationResult = Ellipsis` — Some of the authority changes were rejected by the server. 2
  - `SUCCESS`: `MultiUserChangeAuthorityOperationResult = Ellipsis` — All changes made or none were requested. 0
  - `TIMEOUT`: `MultiUserChangeAuthorityOperationResult = Ellipsis` — Failed because the request timed out. 3
  - `UNKNOWN_CLIENT`: `MultiUserChangeAuthorityOperationResult = Ellipsis` — No submission took place because the client ID was invalid. 8

### `unreal.MultiUserChangeFrequencyErrorCode`
Inherits: `EnumBase` | Header: `ChangeClientBlueprintParams.h`

EMulti User Change Frequency Error Code

**Properties** (2):
  - `INVALID_REPLICATION_RATE`: `MultiUserChangeFrequencyErrorCode = Ellipsis` — The replication rate parameter was rejected (it cannot be 0). 1
  - `UNREGISTERED_STREAM`: `MultiUserChangeFrequencyErrorCode = Ellipsis` — The object for which the frequency was being changed was not registered. 0

### `unreal.MultiUserChangeStreamOperationResult`
Inherits: `EnumBase` | Header: `ChangeClientBlueprintParams.h`

Result of changing a clientâs stream

**Properties** (10):
  - `CANCELLED`: `MultiUserChangeStreamOperationResult = Ellipsis` — The submission progress was cancelled, e.g. because the target client disconnected. 4
  - `FAILED_TO_SEND_REQUEST`: `MultiUserChangeStreamOperationResult = Ellipsis` — Unlikely. ISubmissionWorkflow validation rejected the change. See log. Could be e.g. that the remote...
  - `NOT_AVAILABLE`: `MultiUserChangeStreamOperationResult = Ellipsis` — The MultiUserClient module is not available. Usually when youâre in a runtime build but the operat...
  - `NOT_IN_SESSION`: `MultiUserChangeStreamOperationResult = Ellipsis` — No submission took place because the local editor is not in any session. 6
  - `NOT_ON_GAME_THREAD`: `MultiUserChangeStreamOperationResult = Ellipsis` — The request was not made on the game thread. 8
  - `NO_CHANGES`: `MultiUserChangeStreamOperationResult = Ellipsis` — No changes were requested to be made 1
  - `REJECTED`: `MultiUserChangeStreamOperationResult = Ellipsis` — The changes were rejected by the server. 2
  - `SUCCESS`: `MultiUserChangeStreamOperationResult = Ellipsis` — All changes made or none were requested. 0
  - `TIMEOUT`: `MultiUserChangeStreamOperationResult = Ellipsis` — Failed because the request timed out. 3
  - `UNKNOWN_CLIENT`: `MultiUserChangeStreamOperationResult = Ellipsis` — No submission took place because the client ID was invalid. 7

### `unreal.MultiUserClientStatus`
Inherits: `EnumBase` | Header: `MultiUserClientStatics.h`

Exposes EConcertClientStatus

**Properties** (3):
  - `CONNECTED`: `MultiUserClientStatus = Ellipsis` — Client connected 0
  - `DISCONNECTED`: `MultiUserClientStatus = Ellipsis` — Client disconnected 1
  - `UPDATED`: `MultiUserClientStatus = Ellipsis` — Client state updated 2

### `unreal.MultiUserConnectionErrorType`
Inherits: `EnumBase` | Header: `MultiUserClientStatics.h`

Enum of the known Multi-User connection error, their value needs to match the internally returned error code. see: FConcertConnectionError

**Properties** (10):
  - `CANCELED`: `MultiUserConnectionErrorType = Ellipsis` — 1
  - `CONNECTION_ATTEMPT_ABORTED`: `MultiUserConnectionErrorType = Ellipsis` — 2
  - `DIRTY_PACKAGE_VALIDATION_ERROR`: `MultiUserConnectionErrorType = Ellipsis` — 113
  - `NONE`: `MultiUserConnectionErrorType = Ellipsis` — 0
  - `SERVER_ERROR`: `MultiUserConnectionErrorType = Ellipsis` — 4
  - `SERVER_NOT_RESPONDING`: `MultiUserConnectionErrorType = Ellipsis` — 3
  - `SOURCE_CONTROL_VALIDATION_CANCELED`: `MultiUserConnectionErrorType = Ellipsis` — 111
  - `SOURCE_CONTROL_VALIDATION_ERROR`: `MultiUserConnectionErrorType = Ellipsis` — 112
  - `SOURCE_CONTROL_VALIDATION_UNKNOWN`: `MultiUserConnectionErrorType = Ellipsis` — 110
  - `WORKSPACE_VALIDATION_UNKNOWN`: `MultiUserConnectionErrorType = Ellipsis` — 100

### `unreal.MultiUserConnectionStatus`
Inherits: `EnumBase` | Header: `MultiUserClientStatics.h`

Connection status for Multi-User client sessions

**Properties** (4):
  - `CONNECTED`: `MultiUserConnectionStatus = Ellipsis` — Connection established and alive 1
  - `CONNECTING`: `MultiUserConnectionStatus = Ellipsis` — Currently establishing connection to the server session 0
  - `DISCONNECTED`: `MultiUserConnectionStatus = Ellipsis` — Disconnected 3
  - `DISCONNECTING`: `MultiUserConnectionStatus = Ellipsis` — Currently severing connection to the server session gracefully 2

### `unreal.MultiUserObjectReplicationMode`
Inherits: `EnumBase` | Header: `ChangeClientBlueprintParams.h`

EMulti User Object Replication Mode

**Properties** (2):
  - `REALTIME`: `MultiUserObjectReplicationMode = Ellipsis` — every tick. 1 Replicate the object as often as possible
  - `SPECIFIED_RATE`: `MultiUserObjectReplicationMode = Ellipsis` — Replicate at the rate specified at FMultiUserObjectReplicationSettings::ReplicationRate 0

### `unreal.MultiUserPropertyChangeType`
Inherits: `EnumBase` | Header: `ChangeClientBlueprintParams.h`

EMulti User Property Change Type

**Properties** (3):
  - `ADD`: `MultiUserPropertyChangeType = Ellipsis` — Append the given properties, keeping any preexisting properties. 1
  - `PUT`: `MultiUserPropertyChangeType = Ellipsis` — Replace all assigned properties with the given properties. 0
  - `REMOVE`: `MultiUserPropertyChangeType = Ellipsis` — Remove the given properties. 2

### `unreal.MultiUserPutObjectErrorCode`
Inherits: `EnumBase` | Header: `ChangeClientBlueprintParams.h`

Explains why a change to an object in the stream was invalid.

**Properties** (2):
  - `MISSING_DATA`: `MultiUserPutObjectErrorCode = Ellipsis` — Either PutObject contained no data to update with (ensure either ClassPath or Properties is set),
or...
  - `UNRESOLVED_STREAM`: `MultiUserPutObjectErrorCode = Ellipsis` — Stream that the object referenced was not registered on the server. 0

### `unreal.MultiUserSourceValidationMode`
Inherits: `EnumBase` | Header: `MultiUserClientStatics.h`

EMulti User Source Validation Mode

**Properties** (3):
  - `HARD`: `MultiUserSourceValidationMode = Ellipsis` — Source control validation will fail on any changes when connecting to a Multi-User Session. 0
  - `SOFT`: `MultiUserSourceValidationMode = Ellipsis` — Source control validation will warn and prompt on any changes when connecting to a Multi-User sessio...
  - `SOFT_AUTO_PROCEED`: `MultiUserSourceValidationMode = Ellipsis` — Soft validation mode with auto proceed on prompts. 2

### `unreal.ChangeClientAsyncAction_OnChangeOperationCompleted`
Inherits: `MulticastDelegateBase` | Header: `ChangeClientAsyncAction.h`

On Change Operation Completed Delegate Signature

### `unreal.CustomEventHandler`
Inherits: `DelegateBase` | Header: `MultiUserSubsystem.h`

Custom Event Handler Delegate Signature

### `unreal.MultiUserReplicationSubsystem_OnOfflineClientsChanged`
Inherits: `MulticastDelegateBase` | Header: `MultiUserReplicationSubsystem.h`

On Offline Clients Changed Delegate Signature

### `unreal.MultiUserReplicationSubsystem_OnServerStateChanged`
Inherits: `MulticastDelegateBase` | Header: `MultiUserReplicationSubsystem.h`

This would be the right place to expose additional MU specific replication functions in the future

### `unreal.OnPackageSavedSignature`
Inherits: `MulticastDelegateBase` | Header: `MultiUserClientStatics.h`

Delegate that is invoked when a package is saved.

### `unreal.OnSessionClientChanged`
Inherits: `MulticastDelegateBase` | Header: `MultiUserSubsystem.h`

On Session Client Changed Delegate Signature

### `unreal.OnSessionConnected`
Inherits: `MulticastDelegateBase` | Header: `MultiUserSubsystem.h`

On Session Connected Delegate Signature

### `unreal.OnSessionDisconnected`
Inherits: `MulticastDelegateBase` | Header: `MultiUserSubsystem.h`

On Session Disconnected Delegate Signature
