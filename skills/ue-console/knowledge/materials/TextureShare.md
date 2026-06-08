# UE Python API — TextureShare Module

**9 types** from the `TextureShare` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `TextureShareCustomData`, `TextureShareObjectDesc`, `TextureShareObjectSyncSettings`, `TextureShareReceiveTextureDesc`, `TextureShareSendTextureDesc`, `TextureShareTexturesDesc`, `TextureShare`, `TextureShareObject`, `TextureShareWorldSubsystem`

---

## Classes

### `unreal.TextureShareCustomData`
Inherits: `StructBase` | Header: `TextureShareBlueprintContainersBase.h`

Custom data for sharing

**Properties** (2):
  - `received_parameters`: `None` — [Read-Write] This user data is received from remote processes. Updated every frame tick (Map[str,str...
  - `send_parameters`: `None` — [Read-Write] These custom data will be sent to remote processes. (Map[str,str])

### `unreal.TextureShareObjectDesc`
Inherits: `StructBase` | Header: `TextureShareBlueprintContainersBase.h`

Object descriptor

**Properties** (2):
  - `settings`: `TextureShareObjectSyncSettings` — [Read-Write] Settings (TextureShareObjectSyncSettings)
  - `share_name`: `str` — [Read-Write] Unique share name (case insensitive). When empty, used default name (str)

### `unreal.TextureShareObjectSyncSettings`
Inherits: `StructBase` | Header: `TextureShareBlueprintContainersBase.h`

Sync settings

**Properties** (2):
  - `frame_connect_time_out`: `int` — [Read-Write] MaxMillisecondsToWait for first connection. 0 -infinite (int32)
  - `frame_sync_time_out`: `int` — [Read-Write] MaxMillisecondsToWait for sync. 0 -infinite (int32)

### `unreal.TextureShareReceiveTextureDesc`
Inherits: `StructBase` | Header: `TextureShareBlueprintContainersBase.h`

Texture with name for receive

**Properties** (2):
  - `name`: `str` — [Read-Write] Resource name (used for IPC) (str)
  - `texture`: `TextureRenderTarget` — [Read-Write] Resource to receive (TextureRenderTarget)

### `unreal.TextureShareSendTextureDesc`
Inherits: `StructBase` | Header: `TextureShareBlueprintContainersBase.h`

Texture with name for sending

**Properties** (2):
  - `name`: `str` — [Read-Write] Resource name (used for IPC) (str)
  - `texture`: `Texture` — [Read-Write] Resource to send (Texture)

### `unreal.TextureShareTexturesDesc`
Inherits: `StructBase` | Header: `TextureShareBlueprintContainersBase.h`

Custom textures for sharing

**Properties** (2):
  - `receive_textures`: `None` — [Read-Write] Receive all this textures (Array[TextureShareReceiveTextureDesc])
  - `send_textures`: `None` — [Read-Write] Send all this textures (Array[TextureShareSendTextureDesc])

### `unreal.TextureShare`
Inherits: `Object` | Header: `TextureShareBlueprintContainers.h`

TextureShare UObject interface

**Methods** (3):
  - `get_or_create_texture_share_object(share_name)` -> `TextureShareObject` — Create new or get exist UTextureShare object
  - `get_texture_share_objects()` -> `Array [ TextureShareObject ]` — Get Texture Share Objects
  - `remove_texture_share_object(share_name)` -> `bool` — Remove Texture Share Object

**Properties** (2):
  - `enable`: `bool` — [Read-Write] Enable sharing for all objects (bool)
  - `process_name`: `str` — [Read-Write] Unique process name (optional). When empty, used default name (str)

### `unreal.TextureShareObject`
Inherits: `Object` | Header: `TextureShareBlueprintContainers.h`

TextureShare UObject container

**Methods** (1):
  - `send_custom_data(send_parameters)` -> `None` — Override CustomData SendParameters

**Properties** (4):
  - `custom_data`: `TextureShareCustomData` — [Read-Write] Shared custom data (TextureShareCustomData)
  - `desc`: `TextureShareObjectDesc` — [Read-Write] Object description (TextureShareObjectDesc)
  - `enable`: `bool` — [Read-Write] Enable this texture share object (bool)
  - `textures`: `TextureShareTexturesDesc` — [Read-Write] Shared resources (TextureShareTexturesDesc)

### `unreal.TextureShareWorldSubsystem`
Inherits: `TickableWorldSubsystem` | Header: `TextureShareWorldSubsystem.h`

Tickable TextureShare World Subsystem used to handle tick and react to level and world changes.

**Methods** (1):
  - `get_texture_share()` -> `TextureShare` — Get textureshare API UObject
