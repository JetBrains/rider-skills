# UE Python API — CineAssemblyTools Module

**5 types** from the `CineAssemblyTools` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AssemblyMetadataDesc`, `CineAssembly`, `CineAssemblyNamingTokens`, `CineAssemblySchema`, `CineAssemblyMetadataType`

---

## Classes

### `unreal.AssemblyMetadataDesc`
Inherits: `StructBase` | Header: `CineAssemblySchema.h`

Structure defining a single metadata field that can be associated with an assembly built from this schema, including its type, key, and default value

### `unreal.CineAssembly`
Inherits: `LevelSequence` | Header: `CineAssembly.h`

A cinematic building block that associates a level sequence with a level

**Methods** (12):
  - `append_to_note_text(note)` -> `None` — Append to the note text associated with this assembly
  - `get_full_metadata_string()` -> `str` — Get all of the metadata for this assembly as a formatted JSON string
  - `get_level()` -> `World` — Get the target level associated with this assembly
  - `get_metadata_as_bool(key)` -> `bool or None` — Get the metadata value for the input key as a boolean (if it exists)
  - `get_metadata_as_number(key)` -> `double or None` — Get the metadata value for the input key as a double-precision floating-point number (if it exists)
  - `get_metadata_as_string(key)` -> `str or None` — Get the metadata value for the input key as a string (if it exists)
  - `get_note_text()` -> `str` — Get the note text associated with this assembly
  - `set_level(level)` -> `None` — Set the target level associated with this assembly
  - `set_metadata_as_bool(key, value)` -> `None` — Add a boolean as metadata to this assembly
  - `set_metadata_as_number(key, value)` -> `None` — Add a double-precision floating point number as metadata to this assembly
  - `set_metadata_as_string(key, value)` -> `None` — Add a string as metadata to this assembly
  - `set_note_text(note)` -> `None` — Set the note text associated with this assembly

### `unreal.CineAssemblyNamingTokens`
Inherits: `NamingTokens` | Header: `CineAssemblyNamingTokens.h`

Naming Tokens related to Cinematic Assemblies

### `unreal.CineAssemblySchema`
Inherits: `Object` | Header: `CineAssemblySchema.h`

A template object for building different Cine Assembly types

### `unreal.CineAssemblyMetadataType`
Inherits: `EnumBase` | Header: `CineAssemblySchema.h`

The types of assembly metadata supported by Cine Assembly Schemas

**Properties** (5):
  - `ASSET_PATH`: `CineAssemblyMetadataType = Ellipsis` — 3
  - `BOOL`: `CineAssemblyMetadataType = Ellipsis` — 1
  - `CINE_ASSEMBLY`: `CineAssemblyMetadataType = Ellipsis` — 4
  - `NUMBER`: `CineAssemblyMetadataType = Ellipsis` — 2
  - `STRING`: `CineAssemblyMetadataType = Ellipsis` — 0
