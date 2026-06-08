# UE Python API — MetaHumanCharacterPalette Module

**22 types** from the `MetaHumanCharacterPalette` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MetaHumanBuildInputBase`, `MetaHumanPaletteItemKey`, `MetaHumanPaletteItemPath`, `MetaHumanParameterValue`, `MetaHumanPipelineSlotSelection`, `MetaHumanPipelineSlotSelectionData`, `MetaHumanCharacterActorInterface`, `MetaHumanCharacterEditorPipeline`, `MetaHumanCharacterInstance`, `MetaHumanCharacterPalette`, `MetaHumanCharacterPipeline`, `MetaHumanCollection`, `MetaHumanCollectionEditorPipeline`, `MetaHumanCollectionPipeline`, `MetaHumanItemEditorPipeline`, `MetaHumanItemPipeline`, `MetaHumanCharacterAssemblyResult`, `MetaHumanCharacterUnpackPathMode`, `MetaHumanParameterMappingInputSourceType`, `MetaHumanCharacterAssembled`, ... (22 total)

---

## Classes

### `unreal.MetaHumanBuildInputBase`
Inherits: `StructBase` | Header: `MetaHumanCollectionEditorPipeline.h`

The Build Input struct that will be set by the Character editor for builds initiated from there.

### `unreal.MetaHumanPaletteItemKey`
Inherits: `StructBase` | Header: `MetaHumanPaletteItemKey.h`

Uniquely identifies an item in a UMetaHumanCharacterPalette

### `unreal.MetaHumanPaletteItemPath`
Inherits: `StructBase` | Header: `MetaHumanPaletteItemPath.h`

Represents the path to a Wardrobe Item within a Collection.

### `unreal.MetaHumanParameterValue`
Inherits: `StructBase` | Header: `MetaHumanParameterMappingTable.h`

TODO: Is there a neater way of doing this using existing engine functionality?

### `unreal.MetaHumanPipelineSlotSelection`
Inherits: `StructBase` | Header: `MetaHumanPipelineSlotSelection.h`

An item selected for a slot

### `unreal.MetaHumanPipelineSlotSelectionData`
Inherits: `StructBase` | Header: `MetaHumanPipelineSlotSelectionData.h`

An item selected for a slot, with additional data about the selection.

### `unreal.MetaHumanCharacterActorInterface`
Inherits: `Interface` | Header: `MetaHumanCharacterActorInterface.h`

MetaHuman Character Actor Interface

**Methods** (1):
  - `set_character_instance(character_instance)` -> `None` — Initializes the actor from the given Character Instance

### `unreal.MetaHumanCharacterEditorPipeline`
Inherits: `Object` | Header: `MetaHumanCharacterEditorPipeline.h`

The editor-only component of a UMetaHumanCharacterPipeline.

### `unreal.MetaHumanCharacterInstance`
Inherits: `Object` | Header: `MetaHumanCharacterInstance.h`

Used to assemble a renderable character from a MetaHuman Collection.

**Methods** (7):
  - `assemble(on_assembled)` -> `None` — Runs the associated Character Pipelineâs assembly function to populate the AssemblyOutput. Fails gracefully if no Meta...
  - `clear_assembly_output()` -> `None` — Clear the result of the last assembly. GetAssemblyOutput will return an empty struct after calling this. Instance Parame...
  - `get_assembly_output()` -> `InstancedStruct` — Fetch the result of the last assembly, if any
  - `get_meta_human_collection()` -> `MetaHumanCollection` — Return the MetaHuman Collection that this instance will assemble from. Returns nullptr if no collection has been set.
  - `register_on_instance_updated(delegate)` -> `None` — TODO: The OnInstanceUpdated interface is WIP and will change
  - `set_meta_human_collection(collection)` -> `None` — Set the MetaHuman Collection that this instance will assemble from. Call with nullptr to clear the existing Collection.
  - `unregister_on_instance_updated(object)` -> `None` — Unregister on Instance Updated

**Properties** (1):
  - `on_instance_updated`: `MetaHumanCharacterInstanceUpdated` — [Read-Write] (MetaHumanCharacterInstanceUpdated)

### `unreal.MetaHumanCharacterPalette`
Inherits: `Object` | Header: `MetaHumanCharacterPalette.h`

Base class for objects that can contain items targeting a Character Pipeline.

### `unreal.MetaHumanCharacterPipeline`
Inherits: `Object` | Header: `MetaHumanCharacterPipeline.h`

A Pipeline contains the functionality for building a Palette and assembling Character Instances from it.

### `unreal.MetaHumanCollection`
Inherits: `MetaHumanCharacterPalette` | Header: `MetaHumanCollection.h`

A collection of character parts (e.g. MetaHuman Characters, clothing, hairstyles) that target slots on a Character Pipeline.

### `unreal.MetaHumanCollectionEditorPipeline`
Inherits: `MetaHumanCharacterEditorPipeline` | Header: `MetaHumanCollectionEditorPipeline.h`

The editor-only component of a UMetaHumanCollectionPipeline.

### `unreal.MetaHumanCollectionPipeline`
Inherits: `MetaHumanCharacterPipeline` | Header: `MetaHumanCollectionPipeline.h`

A Collection-specific subclass of Character Pipeline

### `unreal.MetaHumanItemEditorPipeline`
Inherits: `MetaHumanCharacterEditorPipeline` | Header: `MetaHumanItemEditorPipeline.h`

The editor-only component of a UMetaHumanItemPipeline.

### `unreal.MetaHumanItemPipeline`
Inherits: `MetaHumanCharacterPipeline` | Header: `MetaHumanItemPipeline.h`

The Wardrobe Item-specific subclass of Character Pipeline

### `unreal.MetaHumanCharacterAssemblyResult`
Inherits: `EnumBase` | Header: `MetaHumanCharacterInstance.h`

EMeta Human Character Assembly Result

**Properties** (2):
  - `FAILED`: `MetaHumanCharacterAssemblyResult = Ellipsis` — 1
  - `SUCCEEDED`: `MetaHumanCharacterAssemblyResult = Ellipsis` — 0

### `unreal.MetaHumanCharacterUnpackPathMode`
Inherits: `EnumBase` | Header: `MetaHumanCollection.h`

EMeta Human Character Unpack Path Mode

**Properties** (2):
  - `ABSOLUTE`: `MetaHumanCharacterUnpackPathMode = Ellipsis` — UnpackFolderPath is an absolute path 2
  - `RELATIVE`: `MetaHumanCharacterUnpackPathMode = Ellipsis` — UnpackFolderPath is a relative path from the folder containing the Palette 1

### `unreal.MetaHumanParameterMappingInputSourceType`
Inherits: `EnumBase` | Header: `MetaHumanParameterMappingTable.h`

EMeta Human Parameter Mapping Input Source Type

**Properties** (4):
  - `CONSOLE_VARIABLE`: `MetaHumanParameterMappingInputSourceType = Ellipsis` — 2
  - `PARAMETER`: `MetaHumanParameterMappingInputSourceType = Ellipsis` — 0
  - `PLATFORM`: `MetaHumanParameterMappingInputSourceType = Ellipsis` — 3
  - `SCALABILITY`: `MetaHumanParameterMappingInputSourceType = Ellipsis` — 1

### `unreal.MetaHumanCharacterAssembled`
Inherits: `DelegateBase` | Header: `MetaHumanCharacterInstance.h`

MetaHuman Character Assembled Delegate Signature

### `unreal.MetaHumanCharacterInstanceUpdated`
Inherits: `MulticastDelegateBase` | Header: `MetaHumanCharacterInstance.h`

MetaHuman Character Instance Updated Delegate Signature

### `unreal.MetaHumanCharacterInstanceUpdated_Unicast`
Inherits: `DelegateBase` | Header: `MetaHumanCharacterInstance.h`

MetaHuman Character Instance Updated Unicast Delegate Signature
