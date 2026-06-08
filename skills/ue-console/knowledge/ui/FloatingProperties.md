# UE Python API — FloatingProperties Module

**5 types** from the `FloatingProperties` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `FloatingPropertiesClassProperties`, `FloatingPropertiesClassProperty`, `FloatingPropertiesClassPropertyAnchor`, `FloatingPropertiesClassPropertyPosition`, `FloatingPropertiesSettings`

---

## Classes

### `unreal.FloatingPropertiesClassProperties`
Inherits: `StructBase` | Header: `FloatingPropertiesSettings.h`

Floating Properties Class Properties

### `unreal.FloatingPropertiesClassProperty`
Inherits: `StructBase` | Header: `FloatingPropertiesSettings.h`

Floating Properties Class Property

### `unreal.FloatingPropertiesClassPropertyAnchor`
Inherits: `StructBase` | Header: `FloatingPropertiesSettings.h`

Floating Properties Class Property Anchor

### `unreal.FloatingPropertiesClassPropertyPosition`
Inherits: `StructBase` | Header: `FloatingPropertiesSettings.h`

The Fill alignments are used as a ânot setâ value.

### `unreal.FloatingPropertiesSettings`
Inherits: `DeveloperSettings` | Header: `FloatingPropertiesSettings.h`

Floating Properties Settings

**Properties** (4):
  - `enabled`: `bool` — [Read-Write] (bool)
  - `property_anchors`: `None` — [Read-Write] (Map[FloatingPropertiesClassProperty,FloatingPropertiesClassPropertyAnchor])
  - `property_positions`: `None` — [Read-Write] (Map[FloatingPropertiesClassProperty,FloatingPropertiesClassPropertyPosition])
  - `saved_values`: `None` — [Read-Write] (Map[FloatingPropertiesClassProperty,FloatingPropertiesClassProperties])
