# UE Docs — Remote Control API

Extracted from UE 5.6 official documentation. Beta feature.

## Overview

Remote Control enables managing UE projects from external web apps via a web server running inside the Engine. Supports reading/writing properties and calling functions exposed to Blueprint and Python.

### Setup

1. Enable plugin: `Edit > Plugins > Messaging > Remote Control API`
2. Console commands:
   - `WebControl.StartServer` — starts on port **30010**
   - `WebControl.StopServer` — stops accepting requests
   - `WebControl.EnableServerOnStartup` — auto-start with project

### Command-Line Flags (packaged builds)

```
-RCWebControlEnable -RCWebInterfaceEnable
```

### Network Security

Default binding: `127.0.0.1` (localhost). For remote access, modify `DefaultEngine.ini`:

```ini
[HTTPServer.Listeners]
DefaultBindAddress=0.0.0.0
```

**Never** expose to the open Internet. Use LAN or VPN only.

---

## HTTP Endpoints (Port 30010)

### GET /remote/info
Returns available HTTP routes and descriptions.

### PUT /remote/object/call
Invoke functions on UObjects.

```json
{
  "objectPath": "/Game/Maps/MyMap.MyMap:PersistentLevel.CubeMesh_5",
  "functionName": "SetActorLocation",
  "parameters": {
    "NewLocation": {"X": 100, "Y": 0, "Z": 30},
    "bSweep": true
  },
  "generateTransaction": true
}
```

### PUT /remote/object/property
Read/write object properties.

**Read all properties** (omit `propertyName`):
```json
{
  "objectPath": "/Game/Maps/MyMap.MyMap:PersistentLevel.LightSource_0.LightComponent0",
  "access": "READ_ACCESS"
}
```

**Read single property:**
```json
{
  "objectPath": "...",
  "access": "READ_ACCESS",
  "propertyName": "RelativeRotation"
}
```

**Write property:**
```json
{
  "objectPath": "...",
  "access": "WRITE_TRANSACTION_ACCESS",
  "propertyName": "RelativeRotation",
  "propertyValue": {"Pitch": 90, "Yaw": 0, "Roll": 0}
}
```

Access modes: `READ_ACCESS`, `WRITE_ACCESS`, `WRITE_TRANSACTION_ACCESS`

### PUT /remote/object/thumbnail
Get asset thumbnail image. Requires `objectPath`.

### PUT /remote/search/assets
Search Asset Registry.

```json
{
  "Query": "StaticMesh",
  "Filter": {
    "PackagePaths": ["/Game/Meshes"],
    "RecursivePaths": true
  }
}
```

### PUT /remote/object/describe
Return metadata (properties, functions, descriptions) for a UObject.

### PUT /remote/batch
Batch multiple requests:

```json
{
  "Requests": [
    {"RequestId": 1, "URL": "/remote/object/property", "Verb": "PUT", "Body": {...}},
    {"RequestId": 2, "URL": "/remote/object/call", "Verb": "PUT", "Body": {...}}
  ]
}
```

---

## UObject Path Format

```
/path/PackageName.ObjectName:SubObjectName.SubObject
```

Example: `/Game/Maps/MyMap.MyMap:PersistentLevel.CubeMesh_5.StaticMeshComponent0`

### Path Discovery

1. **Undo History** — view paths in transaction tooltips
2. **GetAllLevelActors()** — via `/remote/object/call`
3. **CDO paths**:
   - C++: `/Script/ModuleName.Default__ClassName`
   - Python: `/Engine/PythonTypes.Default__ClassName`

### PIE Mode

Object paths include `UEDPIE_X_` prefix where X = PIE instance ID.

---

## Constraints

- Functions must have `BlueprintCallable` specifier
- Properties must be public, without `BlueprintGetter`/`BlueprintSetter`
- Editor writes need `EditAnywhere` and not `EditConst`

---

## WebSocket API (Port 30020)

**URL**: `ws://127.0.0.1:30020` (configurable in Project Settings)

### Message Format

```json
{
  "MessageName": "preset.register",
  "Parameters": {"PresetName": "MyPreset"},
  "Id": 1
}
```

### Message Types

| Type | Purpose |
| --- | --- |
| HTTP | Call HTTP routes through WebSocket |
| preset.register | Subscribe to preset events |
| preset.unregister | Unsubscribe from preset events |

### Preset Events

| Event | Trigger |
| --- | --- |
| PresetFieldsChanged | Property value modified |
| PresetFieldsAdded | Property exposed to preset |
| PresetFieldsRemoved | Property/function removed |
| PresetFieldsRenamed | Property/function renamed |

---

## Preset API HTTP Endpoints

### GET /remote/presets
List all presets.

### GET /remote/preset/{name}
Get preset details (exposed properties, functions, groups).

### GET/PUT/DELETE /remote/preset/{name}/metadata/{key}
CRUD metadata key-value pairs.

### GET /remote/preset/{name}/property/{property}
Read exposed property value.

### PUT /remote/preset/{name}/property/{property}
Write property:
```json
{"PropertyValue": {"Pitch": 45}, "GenerateTransaction": true}
```

### PUT /remote/preset/{name}/function/{function}
Call exposed function:
```json
{"Parameters": {"Text": "Hello"}, "GenerateTransaction": true}
```
Returns `ReturnedValues` array.
