# UE Python API — Lobby Module

**4 types** from the `Lobby` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `LobbyBeaconClient`, `LobbyBeaconHost`, `LobbyBeaconPlayerState`, `LobbyBeaconState`

---

## Classes

### `unreal.LobbyBeaconClient`
Inherits: `OnlineBeaconClient` | Header: `LobbyBeaconClient.h`

A beacon client used for quality timings to a specified session

### `unreal.LobbyBeaconHost`
Inherits: `OnlineBeaconHostObject` | Header: `LobbyBeaconHost.h`

Host object for maintaining a lobby before players actually join a server ready to receive them

### `unreal.LobbyBeaconPlayerState`
Inherits: `Info` | Header: `LobbyBeaconPlayerState.h`

Lightweight representation of a player while connected to the game through the lobby exists for the lifetime of a player whether they are in the lobby or not assumption that the data here doesnât ch...

### `unreal.LobbyBeaconState`
Inherits: `Info` | Header: `LobbyBeaconState.h`

Shared state of the game from the lobby perspective Duplicates much of the data in the traditional AGameState object for sharing with players connected via beacon only
