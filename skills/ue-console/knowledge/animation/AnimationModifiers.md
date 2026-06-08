# UE Python API — AnimationModifiers Module

**2 types** from the `AnimationModifiers` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimationModifier`, `AnimationModifiersAssetUserData`

---

## Classes

### `unreal.AnimationModifier`
Inherits: `Object` | Header: `AnimationModifier.h`

Animation Modifier

**Methods** (2):
  - `on_apply(animation_sequence)` -> `None` — Executed when the Animation is initialized (native event for debugging / testing purposes)
  - `on_revert(animation_sequence)` -> `None` — On Revert

### `unreal.AnimationModifiersAssetUserData`
Inherits: `AssetUserData` | Header: `AnimationModifiersAssetUserData.h`

Asset user data which can be added to a USkeleton or UAnimSequence to keep track of Animation Modifiers

**Methods** (1):
  - `add_animation_modifier_of_class(animation_sequence_base, modifier_class)` -> `bool` [classmethod] — Add Animation Modifier Of Class
