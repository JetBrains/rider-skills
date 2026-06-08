# UE Python API — Persona Module

**4 types** from the `Persona` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimationEditorPreviewActor`, `AnimationSequenceBrowserContextMenuContext`, `PersonaPreviewSceneDescription`, `PersonaToolMenuContext`

---

## Classes

### `unreal.AnimationEditorPreviewActor`
Inherits: `Actor` | Header: `AnimationEditorPreviewActor.h`

Animation Editor Preview Actor

### `unreal.AnimationSequenceBrowserContextMenuContext`
Inherits: `Object` | Header: `AnimationSequenceBrowserMenuContexts.h`

Animation Sequence Browser Context Menu Context

**Methods** (1):
  - `get_selected_objects()` -> `Array [ Object ]` — Get Selected Objects

### `unreal.PersonaPreviewSceneDescription`
Inherits: `Object` | Header: `PersonaPreviewSceneDescription.h`

Persona Preview Scene Description

**Properties** (1):
  - `preview_controller`: `Class` [Read-Only] — [Read-Only] The method by which the preview is animated (type(Class))

### `unreal.PersonaToolMenuContext`
Inherits: `Object` | Header: `PersonaToolMenuContext.h`

Persona Tool Menu Context

**Methods** (5):
  - `get_anim_blueprint()` -> `AnimBlueprint` — Get the anim blueprint that we are editing
  - `get_animation_asset()` -> `AnimationAsset` — Get the animation asset that we are editing
  - `get_mesh()` -> `SkeletalMesh` — Get the skeletal mesh that we are editing
  - `get_preview_mesh_component()` -> `DebugSkelMeshComponent` — Get the preview component that we are using
  - `get_skeleton()` -> `Skeleton` — Get the skeleton that we are editing
