# UE Python API — RigMapperEditor Module

**2 types** from the `RigMapperEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnimGraphNode_RigMapper`, `RigMapperEditorSubsystem`

---

## Classes

### `unreal.AnimGraphNode_RigMapper`
Inherits: `AnimGraphNode_Base` | Header: `AnimGraphNode_RigMapper.h`

Anim Graph Node Rig Mapper

**Properties** (1):
  - `node`: `AnimNode_RigMapper` — [Read-Write] (AnimNode_RigMapper)

### `unreal.RigMapperEditorSubsystem`
Inherits: `EditorSubsystem` | Header: `RigMapperEditorSubsystem.h`

URigMapperEditorSubsystem Subsystem to remap animation from/to all kinds of formats using the Rig Mapper API.

**Methods** (19):
  - `convert_anim_sequence(source, target, definitions)` -> `bool` [classmethod] — Remap an anim sequence to another existing one, remapping it using the given definitions The target sequence rate will b...
  - `convert_anim_sequence_new(source, target_mesh, definitions, new_asset_path, new_asset_name)` -> `AnimSequence` [classmethod] — Remap an anim sequence to a new one, remapping it using the given definitions
  - `convert_anim_sequence_to_control_rig_section(source, target, definitions)` -> `bool` [classmethod] — Convert an AnimSequence to an existing Control Rig section, remapping it using the given definitions Control Rig transfo...
  - `convert_anim_sequence_to_control_rig_section_new(source, target_mesh, definitions, control_rig_class, new_asset_path, new_asset_name)` -> `MovieSceneControlRigParameterSection` [classmethod] — Convert an AnimSequence to a Control Rig section in a new Level Sequence, remapping it using the given definitions Contr...
  - `convert_anim_sequence_to_csv(source, output_file, definitions, output_intermediate_csv_files = False)` -> `bool` [classmethod] — Export a CSV file from an anim sequence, remapping it using the given definitions
  - `convert_control_rig_section(source, target, definitions)` -> `bool` [classmethod] — Convert a Control Rig section to another existing one, remapping it using the given definitions Control Rig transform/ve...
  - `convert_control_rig_section_new(source, target_mesh, definitions, control_rig_class, new_asset_path, new_asset_name)` -> `MovieSceneControlRigParameterSection` [classmethod] — Convert a Control Rig section to a section in a new Level Sequence, remapping it using the given definitions Control Rig...
  - `convert_control_rig_section_to_anim_sequence(source, target, definitions)` -> `bool` [classmethod] — Convert a Control Rig section to an existing AnimSequence, remapping it using the given definitions The target sequence ...
  - `convert_control_rig_section_to_anim_sequence_new(source, target_mesh, definitions, new_asset_path, new_asset_name)` -> `AnimSequence` [classmethod] — Convert a Control Rig section to a new AnimSequence asset, remapping it using the given definitions
  - `convert_control_rig_section_to_csv(source, output_file, definitions, output_intermediate_csv_files = False)` -> `bool` [classmethod] — Export a CSV file from a Control Rig Section, remapping it using the given definitions
  - `convert_csv(input_file, output_file, definitions, output_intermediate_csv_files = False)` -> `bool` [classmethod] — Remap a CSV file using the given definitions, and optionally outputting separate files for each definitionâs output Th...
  - `convert_csv_to_anim_sequence(input_file, target, definitions)` -> `bool` [classmethod] — Import a CSV file to an existing anim sequence, remapping it using the given definitions The following header is expecte...
  - `convert_csv_to_anim_sequence_new(input_file, target_mesh, definitions, frame_rate, new_asset_path, new_asset_name)` -> `AnimSequence` [classmethod] — Import a CSV file to a new anim sequence asset, remapping it using the given definitions The following header is expecte...
  - `convert_csv_to_control_rig_section(input_file, target, definitions)` -> `bool` [classmethod] — Import a CSV file to the given control rig section, remapping it using the given definitions The following header is exp...
  - `convert_csv_to_control_rig_section_new(input_file, target_mesh, definitions, frame_rate, control_rig_class, new_asset_path, new_asset_name)` -> `MovieSceneControlRigParameterSection` [classmethod] — Import a CSV file to a control rig section in a new Level Sqeuence, remapping it using the given definitions The followi...
  - `get_anim_sequence_rate(anim_sequence)` -> `FrameRate` [classmethod] — Get Anim Sequence Rate
  - `get_sections_from_sequence(sequence)` -> `Array [ MovieSceneControlRigParameterSection ]` [classmethod] — Get Sections from Sequence
  - `get_sequence_from_section(section)` -> `LevelSequence` [classmethod] — Get Sequence from Section
  - `set_anim_sequence_rate(anim_sequence, frame_rate, set_import_properties)` -> `None` [classmethod] — Set Anim Sequence Rate
