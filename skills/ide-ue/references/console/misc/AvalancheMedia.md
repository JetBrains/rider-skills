# UE Python API — AvalancheMedia Module

**33 types** from the `AvalancheMedia` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AvaPlayableRemoteControlValues`, `AvaRundownMacroCommand`, `AvaRundownMacroKeyBinding`, `AvaRundownPage`, `AvaRundownPageCommand`, `AvaRundownPageCommandSetSpawnPoint`, `AvaRundownPageCommandSetTransform`, `AvaRundownPageCommandStopLayers`, `AvaRundownPageListReference`, `AvaBroadcast`, `AvaBroadcastComponent`, `AvaBroadcastDisplayMediaCapture`, `AvaBroadcastDisplayMediaOutput`, `AvaBroadcastOutputChannelViewInterface`, `AvaBroadcastRenderTargetMediaCapture`, `AvaBroadcastRenderTargetMediaOutput`, `AvaGameViewportMediaCapture`, `AvaGameViewportMediaOutput`, `AvaPlayable`, `AvaPlayableLevelStreaming`, ... (33 total)

---

## Classes

### `unreal.AvaPlayableRemoteControlValues`
Inherits: `StructBase` | Header: `AvaPlayableRemoteControlValues.h`

Ava Playable Remote Control Values

### `unreal.AvaRundownMacroCommand`
Inherits: `StructBase` | Header: `AvaRundownMacroCollection.h`

Ava Rundown Macro Command

### `unreal.AvaRundownMacroKeyBinding`
Inherits: `StructBase` | Header: `AvaRundownMacroCollection.h`

Defines a macro (list of commands) that is assigned to a shortcut key.

### `unreal.AvaRundownPage`
Inherits: `StructBase` | Header: `AvaRundownPage.h`

Ava Rundown Page

**Properties** (13):
  - `asset_path`: `SoftObjectPath` [Read-Only] — path for this template. (SoftObjectPath) [Read-Only] Template property
  - `combined_template_ids`: `None` [Read-Only] — For combination template, lists the templates that are combined.
A combination template can only be ...
  - `enabled`: `bool` [Read-Only] — [Read-Only] (bool)
  - `friendly_name`: `Text` [Read-Only] — [Read-Only] (Text)
  - `has_transition_logic`: `bool` [Read-Only] — [Read-Only] Indicate if the template asset has transition logic. (bool)
  - `instanced_commands`: `None` — [Read-Write] Page command that can be executed when playing this page. (Array[InstancedStruct])
  - `instances`: `None` [Read-Only] — List the Ids of all instances. (Set[int32]) [Read-Only] Template property
  - `output_channel`: `int` [Read-Only] — [Read-Only] (int32)
  - `page_id`: `int` [Read-Only] — [Read-Only] (int32)
  - `page_name`: `str` [Read-Only] — [Read-Only] (str)
  - `page_summary`: `Text` [Read-Only] — [Read-Only] (Text)
  - `template_id`: `int` [Read-Only] — Template Id for this page. (int32) [Read-Only] Page Instance Property
  - `transition_mode`: `AvaTransitionInstancingMode` [Read-Only] — [Read-Only] (AvaTransitionInstancingMode)

### `unreal.AvaRundownPageCommand`
Inherits: `StructBase` | Header: `AvaRundownPageCommand.h`

Base class for page commands. remark: this API is experimental.

### `unreal.AvaRundownPageCommandSetSpawnPoint`
Inherits: `AvaRundownPageCommand` | Header: `AvaRundownPageCommandSetSpawnPoint.h`

Specify a reference null actor to use the position to load the graphic at. This can be used to position a null actor with the given tag in the base level and have the graphics load at those positions.

**Properties** (1):
  - `spawn_point_tag`: `Name` — [Read-Write] Indicate which spawn point, by tag, to search for. (Name)

### `unreal.AvaRundownPageCommandSetTransform`
Inherits: `AvaRundownPageCommand` | Header: `AvaRundownPageCommandSetTransform.h`

Page Command to specify the transform when loading the graphic. For streaming levels, this is applied when the level is loaded.

**Properties** (1):
  - `transform`: `Transform` — [Read-Write] Specify the root transform to apply at load time. (Transform)

### `unreal.AvaRundownPageCommandStopLayers`
Inherits: `AvaRundownPageCommand` | Header: `AvaRundownPageCommandStopLayers.h`

Ava Rundown Page Command Stop Layers

**Properties** (1):
  - `layers`: `AvaTagHandleContainer` — [Read-Write] Layers to stop. (AvaTagHandleContainer)

### `unreal.AvaRundownPageListReference`
Inherits: `StructBase` | Header: `AvaMediaDefines.h`

Ava Rundown Page List Reference

### `unreal.AvaBroadcast`
Inherits: `Object` | Header: `AvaBroadcast.h`

Single Instance Class that manages all the Output Channels

**Methods** (6):
  - `get_avalanche_broadcast()` -> `AvaBroadcast` [classmethod] — deprecated: âget_avalanche_broadcastâ was renamed to âget_broadcastâ.
  - `get_broadcast()` -> `AvaBroadcast` [classmethod] — Get Broadcast
  - `is_broadcasting_all_channels()` -> `bool` — Is Broadcasting All Channels
  - `is_broadcasting_any_channel()` -> `bool` — Is Broadcasting Any Channel
  - `start_broadcast()` -> `None` — Start Broadcast
  - `stop_broadcast()` -> `None` — Stop Broadcast

### `unreal.AvaBroadcastComponent`
Inherits: `ActorComponent` | Header: `AvaBroadcastComponent.h`

Add this actor component to blueprint actor to expose the API to control the broadcasting of channels in game.

**Methods** (2):
  - `start_broadcasting()` -> `str or None` — Start broadcasting all channels. Returns true on partial success, i.e. will be true even if some channels didnât start...
  - `stop_broadcasting()` -> `bool` — Stop broadcasting all channels.

### `unreal.AvaBroadcastDisplayMediaCapture`
Inherits: `MediaCapture` | Header: `AvaBroadcastDisplayMediaCapture.h`

Ava Broadcast Display Media Capture

### `unreal.AvaBroadcastDisplayMediaOutput`
Inherits: `MediaOutput` | Header: `AvaBroadcastDisplayMediaOutput.h`

Output Media to a display adapter.

### `unreal.AvaBroadcastOutputChannelViewInterface`
Inherits: `Interface` | Header: `IAvaBroadcastOutputChannelViewInterface.h`

Ava Broadcast Output Channel View Interface

**Methods** (1):
  - `set_channel_name(channel_name)` -> `None` — Set Channel Name

### `unreal.AvaBroadcastRenderTargetMediaCapture`
Inherits: `MediaCapture` | Header: `AvaBroadcastRenderTargetMediaCapture.h`

Ava Broadcast Render Target Media Capture

### `unreal.AvaBroadcastRenderTargetMediaOutput`
Inherits: `MediaOutput` | Header: `AvaBroadcastRenderTargetMediaOutput.h`

Capture a Media to a render target.

**Properties** (2):
  - `invert_key_output`: `bool` — [Read-Write] Invert the key (alpha channel). (bool)
  - `render_target`: `TextureRenderTarget2D` — [Read-Write] Specify the render target to be capturing to. (TextureRenderTarget2D)

### `unreal.AvaGameViewportMediaCapture`
Inherits: `MediaCapture` | Header: `AvaGameViewportMediaCapture.h`

Ava Game Viewport Media Capture

### `unreal.AvaGameViewportMediaOutput`
Inherits: `MediaOutput` | Header: `AvaGameViewportMediaOutput.h`

Ava Game Viewport Media Output

### `unreal.AvaPlayable`
Inherits: `Object` | Header: `AvaPlayable.h`

Base class for a Motion Design playable. A playable (a.k.a. graphic or page) is the basic element that can be rendered and controlled through the animations and remote control. Design goal: The design...

### `unreal.AvaPlayableLevelStreaming`
Inherits: `AvaPlayable` | Header: `AvaPlayableLevelStreaming.h`

Ava Playable Level Streaming

### `unreal.AvaPlayableRemoteProxy`
Inherits: `AvaPlayable` | Header: `AvaPlayableRemoteProxy.h`

Ava Playable Remote Proxy

### `unreal.AvaPlaybackGraph`
Inherits: `Object` | Header: `AvaPlaybackGraph.h`

A Playback Graph is used for playing Motion Design assets integrated with the broadcast framework. It allows the creation of a playback graph with some logic and inputs routed to player nodes, the res...

**Methods** (5):
  - `is_playing()` -> `bool` — Is Playing
  - `load_instances()` -> `None` — Load Instances
  - `play()` -> `None` — Play
  - `stop(stop_options)` -> `None` — Stop
  - `unload_instances(unload_options)` -> `None` — Unload all game instanceâs worlds from this playback.

### `unreal.AvaRundown`
Inherits: `Object` | Header: `AvaRundown.h`

This class is a container for what could be described as a âshowâ for broadcast purposes.

### `unreal.AvaRundownComponent`
Inherits: `ActorComponent` | Header: `AvaRundownComponent.h`

Add this actor component to blueprint actor to expose the API to control an Motion Design Rundown in game.

**Methods** (4):
  - `get_number_of_pages()` -> `int32` — Get Number Of Pages
  - `get_page_id_for_index(page_index)` -> `int32` — Get Page Id for Index
  - `play_page(page_id)` -> `bool` — Play Page
  - `stop_page(page_id)` -> `bool` — Stop Page

### `unreal.AvaRundownMacroCollection`
Inherits: `Object` | Header: `AvaRundownMacroCollection.h`

Collection of rundown commands and bindings (either keys or other).

### `unreal.MotionDesignBroadcastLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AvaBroadcastLibrary.h`

Ava Broadcast Library

**Methods** (4):
  - `get_channel_name(world_context_object)` -> `Name` [classmethod] — Returns the current channelâs name. Will return âNoneâ if not running as part of the broadcast framework.
  - `get_channel_status(channel_name)` -> `AvaBroadcastChannelState` [classmethod] — Returns the channel status.
  - `get_channel_type(channel_name)` -> `AvaBroadcastChannelType` [classmethod] — Returns the channel type.
  - `get_channel_viewport_size(world_context_object)` -> `Vector2D` [classmethod] — Returns the current channelâs viewport size.

### `unreal.MotionDesignPlayableLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AvaPlayableLibrary.h`

Ava Playable Library

**Methods** (4):
  - `is_playable_hidden(world_context_object)` -> `bool` [classmethod] — Returns the current hidden state of this playable. remark: This only works if current level is managed by a playable (i....
  - `playable_sync_event_latent(world_context_object, latent_info, event_signature)` -> `bool` [classmethod] — Push a playable sync event with the given signature on the cluster. The action will complete when the event has occured ...
  - `set_playable_hidden(world_context_object, should_be_hidden)` -> `bool` [classmethod] — Sets the hidden state of all primitives under this playable. Hidden primitives will not be rendered. remark: This only w...
  - `update_playable_remote_control_values(world_context_object)` -> `bool` [classmethod] — Injects the remote control values from current transition for the current playable. remark: This does nothing if there i...

### `unreal.AvaBroadcastChannelState`
Inherits: `EnumBase` | Header: `AvaMediaDefines.h`

Channel state is a union summary of the outputâs states.

**Properties** (3):
  - `IDLE`: `AvaBroadcastChannelState = Ellipsis` — Indicates that at least some of the channel outputs are idle (but none are live). 1
  - `LIVE`: `AvaBroadcastChannelState = Ellipsis` — Indicates that at least some of the channel outputs are live. 2
  - `OFFLINE`: `AvaBroadcastChannelState = Ellipsis` — Indicates that all channel outputs are offline. 0

### `unreal.AvaBroadcastChannelType`
Inherits: `EnumBase` | Header: `AvaMediaDefines.h`

The channel type defines what it is used for in the broadcast framework.

**Properties** (2):
  - `PREVIEW`: `AvaBroadcastChannelType = Ellipsis` — 1
  - `PROGRAM`: `AvaBroadcastChannelType = Ellipsis` — 0

### `unreal.AvaPlaybackStopOptions`
Inherits: `EnumBase` | Header: `AvaPlaybackGraph.h`

EAva Playback Stop Options

**Properties** (4):
  - `DEFAULT`: `AvaPlaybackStopOptions = Ellipsis` — Default option allows for deferred execution of the request when it is safe to do so. 0
  - `FORCE_IMMEDIATE`: `AvaPlaybackStopOptions = Ellipsis` — Forces the execution of the request when it is called. Typically during shut down. 2
  - `NONE`: `AvaPlaybackStopOptions = Ellipsis` — Default option allows for deferred execution of the request when it is safe to do so. 0
  - `UNLOAD`: `AvaPlaybackStopOptions = Ellipsis` — Unload from memory after being stopped. 4

### `unreal.AvaPlaybackUnloadOptions`
Inherits: `EnumBase` | Header: `AvaPlaybackGraph.h`

EAva Playback Unload Options

**Properties** (3):
  - `DEFAULT`: `AvaPlaybackUnloadOptions = Ellipsis` — Default option allows for deferred execution of the request when it is safe to do so. 0
  - `FORCE_IMMEDIATE`: `AvaPlaybackUnloadOptions = Ellipsis` — Forces the execution of the request when it is called. Typically during shut down. 2
  - `NONE`: `AvaPlaybackUnloadOptions = Ellipsis` — Default option allows for deferred execution of the request when it is safe to do so. 0

### `unreal.AvaRundownPageListType`
Inherits: `EnumBase` | Header: `AvaMediaDefines.h`

Rundownâs page list type.

**Properties** (3):
  - `INSTANCE`: `AvaRundownPageListType = Ellipsis` — 1
  - `TEMPLATE`: `AvaRundownPageListType = Ellipsis` — 0
  - `VIEW`: `AvaRundownPageListType = Ellipsis` — 2

### `unreal.AvaRundownPagePlayType`
Inherits: `EnumBase` | Header: `AvaRundownDefines.h`

EAva Rundown Page Play Type

**Properties** (3):
  - `PLAY_FROM_START`: `AvaRundownPagePlayType = Ellipsis` — 0
  - `PREVIEW_FROM_FRAME`: `AvaRundownPagePlayType = Ellipsis` — 2
  - `PREVIEW_FROM_START`: `AvaRundownPagePlayType = Ellipsis` — 1
