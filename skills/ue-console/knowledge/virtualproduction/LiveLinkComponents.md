# UE Python API — LiveLinkComponents Module

**6 types** from the `LiveLinkComponents` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `LiveLinkTransformControllerData`, `LiveLinkComponentController`, `LiveLinkControllerBase`, `LiveLinkTransformController`, `LiveLinkTickDelegate`, `OnControllerMapUpdatedDelegate`

---

## Classes

### `unreal.LiveLinkTransformControllerData`
Inherits: `StructBase` | Header: `LiveLinkTransformController.h`

Live Link Transform Controller Data

**Properties** (6):
  - `sweep`: `bool` — [Read-Write] Whether we sweep to the destination location, triggering overlaps along the way and sto...
  - `teleport`: `bool` — [Read-Write] Whether we teleport the physics state (if physics collision is enabled for this object)...
  - `use_location`: `bool` — [Read-Write] Whether we should set the owning actorâs location with the value coming from live lin...
  - `use_rotation`: `bool` — [Read-Write] Whether we should set the owning actorâs rotation with the value coming from live lin...
  - `use_scale`: `bool` — [Read-Write] Whether we should set the owning actorâs scale with the value coming from live link. ...
  - `world_transform`: `bool` — [Read-Write] Set the transform of the component in world space of in its local reference frame. (boo...

### `unreal.LiveLinkComponentController`
Inherits: `ActorComponent` | Header: `LiveLinkComponentController.h`

Live Link Component Controller

**Methods** (2):
  - `get_controlled_component(role_class)` -> `ActorComponent` — Returns the component controlled by the LiveLink controller of the input Role. Returns null if there is no controller fo...
  - `set_controlled_component(role_class, component)` -> `None` — Set the component to control for the LiveLink controller of the input Role

**Properties** (6):
  - `controller_map`: `None` [Read-Only] — [Read-Only] Instanced controllers used to control the desired role (Map[type(Class),LiveLinkControll...
  - `disable_evaluate_live_link_when_spawnable`: `bool` — [Read-Write] If true, will not evaluate LiveLink if the attached actor is a spawnable in Sequencer (...
  - `evaluate_live_link`: `bool` — [Read-Write] If false, will not evaluate live link, effectively pausing. (bool)
  - `on_controller_map_updated_delegate`: `OnControllerMapUpdatedDelegate` — [Read-Write] This Event is triggered any time the controller map is updated (OnControllerMapUpdatedD...
  - `on_live_link_updated`: `LiveLinkTickDelegate` — [Read-Write] This Event is triggered any time new LiveLink data is available, including in the edito...
  - `subject_representation`: `LiveLinkSubjectRepresentation` — [Read-Write] (LiveLinkSubjectRepresentation)

### `unreal.LiveLinkControllerBase`
Inherits: `Object` | Header: `LiveLinkControllerBase.h`

Live Link Controller Base

### `unreal.LiveLinkTransformController`
Inherits: `LiveLinkControllerBase` | Header: `LiveLinkTransformController.h`

Live Link Transform Controller

**Properties** (2):
  - `offset_transform`: `Transform` — [Read-Write] Offset transform applied in local space to the controlled scene component (Transform)
  - `transform_data`: `LiveLinkTransformControllerData` — [Read-Write] (LiveLinkTransformControllerData)

### `unreal.LiveLinkTickDelegate`
Inherits: `MulticastDelegateBase` | Header: `LiveLinkComponentController.h`

Live Link Tick Delegate Delegate Signature

### `unreal.OnControllerMapUpdatedDelegate`
Inherits: `MulticastDelegateBase` | Header: `LiveLinkComponentController.h`

On Controller Map Updated Delegate Delegate Signature
