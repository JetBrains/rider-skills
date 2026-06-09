# UE Python API — ISMPool Module

**3 types** from the `ISMPool` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ISMPoolActor`, `ISMPoolComponent`, `ISMPoolDebugDrawComponent`

---

## Classes

### `unreal.ISMPoolActor`
Inherits: `Actor` | Header: `ISMPoolActor.h`

ISMPool Actor

**Properties** (2):
  - `ism_pool_comp`: `ISMPoolComponent` [Read-Only] — [Read-Only] (ISMPoolComponent)
  - `ism_pool_debug_draw_comp`: `ISMPoolDebugDrawComponent` [Read-Only] — [Read-Only] (ISMPoolDebugDrawComponent)

### `unreal.ISMPoolComponent`
Inherits: `SceneComponent` | Header: `ISMPoolComponent.h`

UISMPoolComponent. Component that manages a pool of ISM components in order to allow multiple client components that use the same meshes to the share ISMs.

### `unreal.ISMPoolDebugDrawComponent`
Inherits: `DebugDrawComponent` | Header: `ISMPoolDebugDrawComponent.h`

ISMPool Debug Draw Component
