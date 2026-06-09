# UE Python API — MassCrowd Module

**6 types** from the `MassCrowd` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MassCrowdClientBubbleInfo`, `MassCrowdLaneDataRenderingComponent`, `MassCrowdMemberTrait`, `MassCrowdServerRepresentationTrait`, `MassCrowdVisualizationTrait`, `ZoneGraphCrowdLaneAnnotations`

---

## Classes

### `unreal.MassCrowdClientBubbleInfo`
Inherits: `MassClientBubbleInfoBase` | Header: `MassCrowdBubble.h`

This class will allow us to replicate Mass data based on the fidelity required for each player controller. There is one AMassReplicationActor per PlayerController and which is also its owner.

### `unreal.MassCrowdLaneDataRenderingComponent`
Inherits: `PrimitiveComponent` | Header: `MassCrowdLaneDataRenderingComponent.h`

Primitive component that can be used to render runtime state of zone graph lanes (e.g. Opened|Closed, Density, etc.) The component must be added on a ZoneGraphData actor.

### `unreal.MassCrowdMemberTrait`
Inherits: `MassEntityTraitBase` | Header: `MassCrowdMemberTrait.h`

Trait to mark an entity with the crowd tag and add required fragments to track current lane

### `unreal.MassCrowdServerRepresentationTrait`
Inherits: `MassEntityTraitBase` | Header: `MassCrowdServerRepresentationTrait.h`

Mass Crowd Server Representation Trait

### `unreal.MassCrowdVisualizationTrait`
Inherits: `MassVisualizationTrait` | Header: `MassCrowdVisualizationTrait.h`

Mass Crowd Visualization Trait

### `unreal.ZoneGraphCrowdLaneAnnotations`
Inherits: `ZoneGraphAnnotationComponent` | Header: `ZoneGraphCrowdLaneAnnotations.h`

Zone graph blocking behavior
