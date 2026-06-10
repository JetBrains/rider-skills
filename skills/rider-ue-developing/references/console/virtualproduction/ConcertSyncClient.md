# UE Python API — ConcertSyncClient Module

**3 types** from the `ConcertSyncClient` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ConcertClientDesktopPresenceActor`, `ConcertClientPresenceActor`, `ConcertClientVRPresenceActor`

---

## Classes

### `unreal.ConcertClientDesktopPresenceActor`
Inherits: `ConcertClientPresenceActor` | Header: `ConcertClientDesktopPresenceActor.h`

A AConcertClientDesktopPresenceActor is a child of AConcertClientPresenceActor that is used to represent users in desktop

**Properties** (2):
  - `desktop_mesh_component`: `StaticMeshComponent` [Read-Only] — [Read-Only] The camera mesh component to show visually where the camera is placed (StaticMeshCompone...
  - `laser_pointer`: `SplineMeshComponent` [Read-Only] — [Read-Only] Spline mesh representing laser (SplineMeshComponent)

### `unreal.ConcertClientPresenceActor`
Inherits: `Actor` | Header: `ConcertClientPresenceActor.h`

A ConcertClientPresenceActor is a transient actor representing other client presences during a concert client session.

**Properties** (3):
  - `presence_device_type`: `Name` [Read-Only] — [Read-Only] The device type that this presence represent (i.e Oculus, Vive, Desktop) (Name)
  - `presence_mesh_component`: `StaticMeshComponent` [Read-Only] — [Read-Only] The camera mesh component to show visually where the camera is placed (StaticMeshCompone...
  - `presence_text_component`: `TextRenderComponent` [Read-Only] — [Read-Only] The text render component to display the associated clientâs name (TextRenderComponent...

### `unreal.ConcertClientVRPresenceActor`
Inherits: `ConcertClientPresenceActor` | Header: `ConcertClientVRPresenceActor.h`

A ConcertClientVRPresenceActor is a child of AConcertClientPresenceActor that is used to represent users in VR

**Properties** (1):
  - `laser_thickness`: `float` — [Read-Write] (float)
