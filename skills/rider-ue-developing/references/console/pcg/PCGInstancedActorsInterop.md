# UE Python API — PCGInstancedActorsInterop Module

**2 types** from the `PCGInstancedActorsInterop` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `PCGInstancedActorsManagedResource`, `PCGSpawnInstancedActorsSettings`

---

## Classes

### `unreal.PCGInstancedActorsManagedResource`
Inherits: `PCGManagedResource` | Header: `PCGInstancedActorsResource.h`

PCGInstanced Actors Managed Resource

**Properties** (1):
  - `handles`: `None` [Read-Only] — [Read-Only] (Array[InstancedActorsInstanceHandle])

### `unreal.PCGSpawnInstancedActorsSettings`
Inherits: `PCGSettings` | Header: `PCGSpawnInstancedActors.h`

Node that allows to spawn instanced actors. Important notes: - In some cases, the actor class must be properly registered in the project settings prior to spawning. See the Instanced Actor plugin docu...

**Properties** (4):
  - `actor_class`: `Class` — [Read-Write] Actor class to spawn when not using the âSpawn by Attributeâ mode. (type(Class))
  - `mute_on_empty_class`: `bool` — [Read-Write] Mutes warnings on empty class, which can be useful when some points might not have a va...
  - `spawn_attribute_selector`: `PCGAttributePropertyInputSelector` — [Read-Write] Attribute specifier for the attribute class to spawn. (PCGAttributePropertyInputSelecto...
  - `spawn_by_attribute`: `bool` — [Read-Write] Controls whether the actor class to use will be driven by an attribute on the input dat...
