# UE Python API — ACLPlugin Module

**3 types** from the `ACLPlugin` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimationCompressionLibraryDatabase`, `ACLVisualFidelity`, `ACLVisualFidelityChangeResult`

---

## Classes

### `unreal.AnimationCompressionLibraryDatabase`
Inherits: `Object` | Header: `AnimationCompressionLibraryDatabase.h`

An ACL database object references several UAnimSequence instances that it contains.

**Methods** (2):
  - `get_visual_fidelity(database_asset)` -> `ACLVisualFidelity` [classmethod] — Get Visual Fidelity
  - `set_visual_fidelity(world_context_object, latent_info, database_asset, visual_fidelity = ACLVisualFidelity.HIGHEST)` -> `ACLVisualFidelityChangeResult` [classmethod] — Initiate a latent database change in quality by streaming in/out as necessary.

### `unreal.ACLVisualFidelity`
Inherits: `EnumBase` | Header: `AnimationCompressionLibraryDatabase.h`

An enum to represent the ACL visual fidelity level.

**Properties** (3):
  - `HIGHEST`: `ACLVisualFidelity = Ellipsis` — 0
  - `LOWEST`: `ACLVisualFidelity = Ellipsis` — 2
  - `MEDIUM`: `ACLVisualFidelity = Ellipsis` — 1

### `unreal.ACLVisualFidelityChangeResult`
Inherits: `EnumBase` | Header: `AnimationCompressionLibraryDatabase.h`

An enum to represent the result of latent visual fidelity change requests.

**Properties** (3):
  - `COMPLETED`: `ACLVisualFidelityChangeResult = Ellipsis` — 1
  - `DISPATCHED`: `ACLVisualFidelityChangeResult = Ellipsis` — 0
  - `FAILED`: `ACLVisualFidelityChangeResult = Ellipsis` — 2
