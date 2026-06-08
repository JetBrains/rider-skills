# UE Python API — MQTTCore Module

**19 types** from the `MQTTCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MQTTClientMessage`, `MQTTTopic`, `MQTTTopicFilter`, `MQTTTopicTemplate`, `MQTTURL`, `MQTTClientObject`, `MQTTSubscriptionObject`, `MQTTSubsystem`, `MQTTConnectReturnCode`, `MQTTQualityOfService`, `MQTTScheme`, `MQTTSubscribeReturnCode`, `MQTTClientObject_OnConnectDelegate`, `MQTTClientObject_OnDisconnectDelegate`, `MQTTClientObject_OnMessageDelegate`, `MQTTClientObject_OnPublishDelegate`, `MQTTClientObject_OnSubscribeDelegate`, `MQTTClientObject_OnUnsubscribeDelegate`, `MQTTSubscriptionObject_OnMessageDelegate`

---

## Classes

### `unreal.MQTTClientMessage`
Inherits: `StructBase` | Header: `MQTTClientMessage.h`

MQTTClient Message

**Properties** (5):
  - `payload`: `None` — [Read-Write] Packet content. (Array[uint8])
  - `qo_s`: `MQTTQualityOfService` — [Read-Write] Quality of Service. (MQTTQualityOfService)
  - `retain`: `bool` — [Read-Write] Retain flag. (bool)
  - `time_stamp`: `DateTime` — [Read-Write] TimeStamp as UTC. (DateTime)
  - `topic`: `str` — [Read-Write] Packet topic. (str)

### `unreal.MQTTTopic`
Inherits: `StructBase` | Header: `MQTTShared.h`

**Properties** (1):
  - `path`: `str` — [Read-Write] (str)

### `unreal.MQTTTopicFilter`
Inherits: `MQTTTopic` | Header: `MQTTShared.h`

MQTTTopic Filter

### `unreal.MQTTTopicTemplate`
Inherits: `MQTTTopic` | Header: `MQTTShared.h`

An MQTT Topic tokenized template

### `unreal.MQTTURL`
Inherits: `StructBase` | Header: `MQTTShared.h`

mqtt[s]:[username][:password] host.domain[:port]:

**Properties** (5):
  - `host`: `str` — [Read-Write] (str)
  - `password`: `str` — [Read-Write] (str)
  - `port`: `int` — [Read-Write] Default port is 1883 for MQTT scheme, 8883 for MQTTS. (int32)
  - `scheme`: `MQTTScheme` — [Read-Write] (MQTTScheme)
  - `username`: `str` — [Read-Write] (str)

### `unreal.MQTTClientObject`
Inherits: `Object` | Header: `MQTTClientObject.h`

MQTTClient Object

**Methods** (8):
  - `connect(on_connect)` -> `None` — Connect
  - `disconnect(on_disconnect)` -> `None` — Disconnect
  - `get_client_id()` -> `str` — Get Client Id
  - `get_url()` -> `MQTTURL` — URL for this client.
  - `publish(topic, payload, qo_s = MQTTQualityOfService.ONCE, retain = False)` -> `None` — OutMessageId can be used to match this request with the callback response.
  - `subscribe(topic, qo_s = MQTTQualityOfService.ONCE)` -> `MQTTSubscriptionObject` — OutMessageId can be used to match this request with the callback response.
  - `subscribe_many(topics, qo_s)` -> `Array [ MQTTSubscriptionObject ]` — OutMessageId can be used to match this request with the callback response.
  - `unsubscribe(topic)` -> `None` — OutMessageId can be used to match this request with the callback response.

### `unreal.MQTTSubscriptionObject`
Inherits: `Object` | Header: `MQTTClientObject.h`

MQTTSubscription Object

**Methods** (2):
  - `is_valid()` -> `bool` — Is Valid
  - `set_on_message_handler(on_message_callback)` -> `None` — Set on Message Handler

### `unreal.MQTTSubsystem`
Inherits: `EngineSubsystem` | Header: `MQTTSubsystem.h`

Provides persistent access to clients

**Methods** (4):
  - `get_or_create_client(parent, url)` -> `MQTTClientObject` [classmethod] — Get or Create Client
  - `get_or_create_client_with_project_url(parent)` -> `MQTTClientObject` [classmethod] — Get or Create Client with Project URL
  - `get_payload_json(parent, client_message)` -> `JsonObjectWrapper or None` [classmethod] — Get Payload Json
  - `get_payload_string(client_message)` -> `str` [classmethod] — Get Payload String

### `unreal.MQTTConnectReturnCode`
Inherits: `EnumBase` | Header: `MQTTProtocol.h`

MQTT v3.1.1

**Properties** (9):
  - `ACCEPTED`: `MQTTConnectReturnCode = Ellipsis` — Connection accepted. 0
  - `ALREADY_CONNECTED`: `MQTTConnectReturnCode = Ellipsis` — The Client is already connected to the Server. 6
  - `INVALID_URL`: `MQTTConnectReturnCode = Ellipsis` — The provided URL is malformed. 7
  - `REFUSED_BAD_USERNAME_PASSWORD`: `MQTTConnectReturnCode = Ellipsis` — The data in the user name or password is malformed. 4
  - `REFUSED_IDENTIFIER_REJECTED`: `MQTTConnectReturnCode = Ellipsis` — The Client identifier is correct UTF-8 but not allowed by the Server. 2
  - `REFUSED_NOT_AUTHORIZED`: `MQTTConnectReturnCode = Ellipsis` — The Client is not authorized to connect. 5
  - `REFUSED_PROTOCOL_VERSION`: `MQTTConnectReturnCode = Ellipsis` — The Server does not the support the level of the MQTT protocol requested by the Client. 1
  - `REFUSED_SERVER_UNAVAILABLE`: `MQTTConnectReturnCode = Ellipsis` — The Network Connection has been made but the MQTT service is unavailable. 3
  - `SOCKET_ERROR`: `MQTTConnectReturnCode = Ellipsis` — Socket error. 8

### `unreal.MQTTQualityOfService`
Inherits: `EnumBase` | Header: `MQTTShared.h`

EMQTTQuality Of Service

**Properties** (3):
  - `AT_LEAST_ONCE`: `MQTTQualityOfService = Ellipsis` — 1
  - `EXACTLY_ONCE`: `MQTTQualityOfService = Ellipsis` — 2
  - `ONCE`: `MQTTQualityOfService = Ellipsis` — 0

### `unreal.MQTTScheme`
Inherits: `EnumBase` | Header: `MQTTShared.h`

EMQTTScheme

**Properties** (2):
  - `MQTT`: `MQTTScheme = Ellipsis` — 0
  - `MQTTS`: `MQTTScheme = Ellipsis` — 1

### `unreal.MQTTSubscribeReturnCode`
Inherits: `EnumBase` | Header: `MQTTProtocol.h`

MQTT v3.1.1

**Properties** (4):
  - `FAILURE`: `MQTTSubscribeReturnCode = Ellipsis` — SubscribeAcknowledge 128
  - `SUCCESS_QO_S0`: `MQTTSubscribeReturnCode = Ellipsis` — 0
  - `SUCCESS_QO_S1`: `MQTTSubscribeReturnCode = Ellipsis` — SubscribeAcknowledge 1
  - `SUCCESS_QO_S2`: `MQTTSubscribeReturnCode = Ellipsis` — SubscribeAcknowledge 2

### `unreal.MQTTClientObject_OnConnectDelegate`
Inherits: `DelegateBase` | Header: `MQTTClientObject.h`

On Connect Delegate Delegate Signature

### `unreal.MQTTClientObject_OnDisconnectDelegate`
Inherits: `DelegateBase` | Header: `MQTTClientObject.h`

On Disconnect Delegate Delegate Signature

### `unreal.MQTTClientObject_OnMessageDelegate`
Inherits: `DelegateBase` | Header: `MQTTClientObject.h`

On Message Delegate Delegate Signature

### `unreal.MQTTClientObject_OnPublishDelegate`
Inherits: `DelegateBase` | Header: `MQTTClientObject.h`

On Publish Delegate Delegate Signature

### `unreal.MQTTClientObject_OnSubscribeDelegate`
Inherits: `DelegateBase` | Header: `MQTTClientObject.h`

On Subscribe Delegate Delegate Signature

### `unreal.MQTTClientObject_OnUnsubscribeDelegate`
Inherits: `DelegateBase` | Header: `MQTTClientObject.h`

On Unsubscribe Delegate Delegate Signature

### `unreal.MQTTSubscriptionObject_OnMessageDelegate`
Inherits: `DelegateBase` | Header: `MQTTClientObject.h`

On Message Delegate Delegate Signature
