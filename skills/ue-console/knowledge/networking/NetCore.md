# UE Python API — NetCore Module

**4 types** from the `NetCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `FastArraySerializer`, `FastArraySerializerItem`, `NetworkFailure`, `ReplicationSystem`

---

## Classes

### `unreal.FastArraySerializer`
Inherits: `StructBase` | Header: `FastArraySerializer.h`

Base struct for wrapping the array used in Fast TArray Replication

### `unreal.FastArraySerializerItem`
Inherits: `StructBase` | Header: `FastArraySerializer.h`

Base struct for items using Fast TArray Replication

### `unreal.NetworkFailure`
Inherits: `EnumBase` | Header: `NetEnums.h`

Types of network failures broadcast from the engine

**Properties** (11):
  - `CONNECTION_LOST`: `NetworkFailure = Ellipsis` — A connection to the net driver has been lost 3
  - `CONNECTION_TIMEOUT`: `NetworkFailure = Ellipsis` — A connection to the net driver has timed out 4
  - `FAILURE_RECEIVED`: `NetworkFailure = Ellipsis` — The net driver received an NMT_Failure message 5
  - `NET_CHECKSUM_MISMATCH`: `NetworkFailure = Ellipsis` — Network checksum mismatch 10
  - `NET_DRIVER_ALREADY_EXISTS`: `NetworkFailure = Ellipsis` — A relevant net driver has already been created for this service 0
  - `NET_DRIVER_CREATE_FAILURE`: `NetworkFailure = Ellipsis` — The net driver creation failed 1
  - `NET_DRIVER_LISTEN_FAILURE`: `NetworkFailure = Ellipsis` — The net driver failed its Listen() call 2
  - `NET_GUID_MISMATCH`: `NetworkFailure = Ellipsis` — NetGuid mismatch 9
  - `OUTDATED_CLIENT`: `NetworkFailure = Ellipsis` — The client needs to upgrade their game 6
  - `OUTDATED_SERVER`: `NetworkFailure = Ellipsis` — The server needs to upgrade their game 7
  - `PENDING_CONNECTION_FAILURE`: `NetworkFailure = Ellipsis` — There was an error during connection to the game 8

### `unreal.ReplicationSystem`
Inherits: `EnumBase` | Header: `NetEnums.h`

EReplication System

**Properties** (3):
  - `DEFAULT`: `ReplicationSystem = Ellipsis` — 0
  - `GENERIC`: `ReplicationSystem = Ellipsis` — 1
  - `IRIS`: `ReplicationSystem = Ellipsis` — 2
