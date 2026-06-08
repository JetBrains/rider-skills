# UE Python API — ActorModifier Module

**10 types** from the `ActorModifier` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ActorModifierAnchorAlignment`, `ActorModifierSceneTreeActor`, `ActorModifierArrangeBaseModifier`, `ActorModifierAttachmentBaseModifier`, `ActorModifierAlignment`, `ActorModifierAxis`, `ActorModifierDepthAlignment`, `ActorModifierHorizontalAlignment`, `ActorModifierReferenceContainer`, `ActorModifierVerticalAlignment`

---

## Classes

### `unreal.ActorModifierAnchorAlignment`
Inherits: `StructBase` | Header: `ActorModifierTypes.h`

Specifies a set of anchor alignments, one for each 3D axis.

**Properties** (3):
  - `depth`: `ActorModifierDepthAlignment` — [Read-Write] (ActorModifierDepthAlignment)
  - `horizontal`: `ActorModifierHorizontalAlignment` — [Read-Write] (ActorModifierHorizontalAlignment)
  - `vertical`: `ActorModifierVerticalAlignment` — [Read-Write] (ActorModifierVerticalAlignment)

### `unreal.ActorModifierSceneTreeActor`
Inherits: `StructBase` | Header: `ActorModifierSceneTreeUpdateExtension.h`

Actor Modifier Scene Tree Actor

**Properties** (3):
  - `reference_actor_weak`: `Actor` — [Read-Write] The actor being followed by the modifier. This is user selectable if the Reference Cont...
  - `reference_container`: `ActorModifierReferenceContainer` — [Read-Write] The method for finding a reference actor based on itâs position in the parentâs hie...
  - `skip_hidden_actors`: `bool` — [Read-Write] If true, will search for the next visible actor based on the selected reference contain...

### `unreal.ActorModifierArrangeBaseModifier`
Inherits: `ActorModifierAttachmentBaseModifier` | Header: `ActorModifierArrangeBaseModifier.h`

Abstract base class for modifiers dealing with arrangement and attachment actors on self

### `unreal.ActorModifierAttachmentBaseModifier`
Inherits: `ActorModifierCoreBase` | Header: `ActorModifierAttachmentBaseModifier.h`

Abstract base class for all modifiers that deal with attachments

### `unreal.ActorModifierAlignment`
Inherits: `EnumBase` | Header: `ActorModifierTypes.h`

EActor Modifier Alignment

**Properties** (3):
  - `DEPTH`: `ActorModifierAlignment = Ellipsis` — 2
  - `HORIZONTAL`: `ActorModifierAlignment = Ellipsis` — 0
  - `VERTICAL`: `ActorModifierAlignment = Ellipsis` — 1

### `unreal.ActorModifierAxis`
Inherits: `EnumBase` | Header: `ActorModifierTypes.h`

EActor Modifier Axis

**Properties** (3):
  - `X`: `ActorModifierAxis = Ellipsis` — 1
  - `Y`: `ActorModifierAxis = Ellipsis` — 2
  - `Z`: `ActorModifierAxis = Ellipsis` — 4

### `unreal.ActorModifierDepthAlignment`
Inherits: `EnumBase` | Header: `ActorModifierTypes.h`

EActor Modifier Depth Alignment

**Properties** (3):
  - `BACK`: `ActorModifierDepthAlignment = Ellipsis` — 2
  - `CENTER`: `ActorModifierDepthAlignment = Ellipsis` — 1
  - `FRONT`: `ActorModifierDepthAlignment = Ellipsis` — 0

### `unreal.ActorModifierHorizontalAlignment`
Inherits: `EnumBase` | Header: `ActorModifierTypes.h`

EActor Modifier Horizontal Alignment

**Properties** (3):
  - `CENTER`: `ActorModifierHorizontalAlignment = Ellipsis` — 1
  - `LEFT`: `ActorModifierHorizontalAlignment = Ellipsis` — 0
  - `RIGHT`: `ActorModifierHorizontalAlignment = Ellipsis` — 2

### `unreal.ActorModifierReferenceContainer`
Inherits: `EnumBase` | Header: `ActorModifierSceneTreeUpdateExtension.h`

Specifies the method for finding a reference actor based on itâs position in the parentâs hierarchy.

**Properties** (5):
  - `FIRST`: `ActorModifierReferenceContainer = Ellipsis` — Uses the first actor in the parentâs hierarchy. 2
  - `LAST`: `ActorModifierReferenceContainer = Ellipsis` — Uses the last actor in the parentâs hierarchy. 3
  - `NEXT`: `ActorModifierReferenceContainer = Ellipsis` — Uses the next actor in the parentâs hierarchy. 1
  - `OTHER`: `ActorModifierReferenceContainer = Ellipsis` — Uses a specified reference actor set by the user. 4
  - `PREVIOUS`: `ActorModifierReferenceContainer = Ellipsis` — Uses the previous actor in the parentâs hierarchy. 0

### `unreal.ActorModifierVerticalAlignment`
Inherits: `EnumBase` | Header: `ActorModifierTypes.h`

EActor Modifier Vertical Alignment

**Properties** (3):
  - `BOTTOM`: `ActorModifierVerticalAlignment = Ellipsis` — 2
  - `CENTER`: `ActorModifierVerticalAlignment = Ellipsis` — 1
  - `TOP`: `ActorModifierVerticalAlignment = Ellipsis` — 0
