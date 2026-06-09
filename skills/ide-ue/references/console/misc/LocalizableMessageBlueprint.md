# UE Python API — LocalizableMessageBlueprint Module

**1 types** from the `LocalizableMessageBlueprint` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `LocalizableMessageLibrary`

---

## Classes

### `unreal.LocalizableMessageLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `LocalizableMessageLibrary.h`

BlueprintFunctionLibrary for LocalizableMessage

**Methods** (3):
  - `conv_localizable_message_to_text(world_context_object, message)` -> `Text` [classmethod] — Conversion function from LocalizableMessage to FText.
  - `is_empty_localizable_message(message)` -> `bool` [classmethod] — Returns true if the message is empty
  - `reset_localizable_message(message)` -> `LocalizableMessage` [classmethod] — Resets the Localizable Message
