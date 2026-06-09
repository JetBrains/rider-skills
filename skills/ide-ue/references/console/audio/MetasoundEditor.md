# UE Python API — MetasoundEditor Module

**37 types** from the `MetasoundEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MetasoundEditorGraphMemberDefaultBoolRef`, `MetasoundEditorGraphMemberDefaultIntRef`, `MetasoundEditorGraphMemberDefaultObjectRef`, `MetasoundEditorMemberPageDefault`, `MetasoundEditorMemberPageDefaultBool`, `MetasoundEditorMemberPageDefaultBoolArray`, `MetasoundEditorMemberPageDefaultFloat`, `MetasoundEditorMemberPageDefaultFloatArray`, `MetasoundEditorMemberPageDefaultInt`, `MetasoundEditorMemberPageDefaultIntArray`, `MetasoundEditorMemberPageDefaultObjectArray`, `MetasoundEditorMemberPageDefaultObjectRef`, `MetasoundEditorMemberPageDefaultString`, `MetasoundEditorMemberPageDefaultStringArray`, `MetaSoundBaseFactory`, `MetaSoundEditorBuilderListener`, `MetasoundEditorGraphMemberDefaultBool`, `MetasoundEditorGraphMemberDefaultBoolArray`, `MetasoundEditorGraphMemberDefaultFloat`, `MetasoundEditorGraphMemberDefaultFloatArray`, ... (37 total)

---

## Classes

### `unreal.MetasoundEditorGraphMemberDefaultBoolRef`
Inherits: `StructBase` | Header: `MetasoundEditorGraphMemberDefaults.h`

Broken out to be able to customize and swap enum behavior for boolean literal behavior (ex. for triggers)

### `unreal.MetasoundEditorGraphMemberDefaultIntRef`
Inherits: `StructBase` | Header: `MetasoundEditorGraphMemberDefaults.h`

Broken out to be able to customize and swap enum behavior for basic integer literal behavior

### `unreal.MetasoundEditorGraphMemberDefaultObjectRef`
Inherits: `StructBase` | Header: `MetasoundEditorGraphMemberDefaults.h`

Broken out to be able to customize and swap AllowedClass based on provided object proxy

### `unreal.MetasoundEditorMemberPageDefault`
Inherits: `StructBase` | Header: `MetasoundEditorGraphMemberDefaults.h`

Editor-only page default for more desirable customization behavior in representing Frontend Literal value. Should never be serialized as generation is non-deterministic.

### `unreal.MetasoundEditorMemberPageDefaultBool`
Inherits: `MetasoundEditorMemberPageDefault` | Header: `MetasoundEditorGraphMemberDefaults.h`

Metasound Editor Member Page Default Bool

### `unreal.MetasoundEditorMemberPageDefaultBoolArray`
Inherits: `MetasoundEditorMemberPageDefault` | Header: `MetasoundEditorGraphMemberDefaults.h`

Metasound Editor Member Page Default Bool Array

### `unreal.MetasoundEditorMemberPageDefaultFloat`
Inherits: `MetasoundEditorMemberPageDefault` | Header: `MetasoundEditorGraphMemberDefaults.h`

Metasound Editor Member Page Default Float

### `unreal.MetasoundEditorMemberPageDefaultFloatArray`
Inherits: `MetasoundEditorMemberPageDefault` | Header: `MetasoundEditorGraphMemberDefaults.h`

Metasound Editor Member Page Default Float Array

### `unreal.MetasoundEditorMemberPageDefaultInt`
Inherits: `MetasoundEditorMemberPageDefault` | Header: `MetasoundEditorGraphMemberDefaults.h`

Metasound Editor Member Page Default Int

### `unreal.MetasoundEditorMemberPageDefaultIntArray`
Inherits: `MetasoundEditorMemberPageDefault` | Header: `MetasoundEditorGraphMemberDefaults.h`

Metasound Editor Member Page Default Int Array

### `unreal.MetasoundEditorMemberPageDefaultObjectArray`
Inherits: `MetasoundEditorMemberPageDefault` | Header: `MetasoundEditorGraphMemberDefaults.h`

Metasound Editor Member Page Default Object Array

### `unreal.MetasoundEditorMemberPageDefaultObjectRef`
Inherits: `MetasoundEditorMemberPageDefault` | Header: `MetasoundEditorGraphMemberDefaults.h`

Metasound Editor Member Page Default Object Ref

### `unreal.MetasoundEditorMemberPageDefaultString`
Inherits: `MetasoundEditorMemberPageDefault` | Header: `MetasoundEditorGraphMemberDefaults.h`

Metasound Editor Member Page Default String

### `unreal.MetasoundEditorMemberPageDefaultStringArray`
Inherits: `MetasoundEditorMemberPageDefault` | Header: `MetasoundEditorGraphMemberDefaults.h`

Metasound Editor Member Page Default String Array

### `unreal.MetaSoundBaseFactory`
Inherits: `Factory` | Header: `MetasoundFactory.h`

Meta Sound Base Factory

### `unreal.MetaSoundEditorBuilderListener`
Inherits: `Object` | Header: `MetasoundEditorBuilderListener.h`

Meta Sound Editor Builder Listener

**Methods** (1):
  - `remove_all_delegates()` -> `None` — Remove All Delegates

**Properties** (9):
  - `on_graph_input_added_delegate`: `OnMetaSoundBuilderGraphInterfaceMutate` — [Read-Write] (OnMetaSoundBuilderGraphInterfaceMutate)
  - `on_graph_input_data_type_changed_delegate`: `OnMetaSoundBuilderGraphInterfaceMutate` — [Read-Write] (OnMetaSoundBuilderGraphInterfaceMutate)
  - `on_graph_input_default_changed_delegate`: `OnMetaSoundBuilderGraphLiteralMutate` — [Read-Write] (OnMetaSoundBuilderGraphLiteralMutate)
  - `on_graph_input_name_changed_delegate`: `OnMetaSoundBuilderGraphVertexRename` — [Read-Write] (OnMetaSoundBuilderGraphVertexRename)
  - `on_graph_output_added_delegate`: `OnMetaSoundBuilderGraphInterfaceMutate` — [Read-Write] (OnMetaSoundBuilderGraphInterfaceMutate)
  - `on_graph_output_data_type_changed_delegate`: `OnMetaSoundBuilderGraphInterfaceMutate` — [Read-Write] (OnMetaSoundBuilderGraphInterfaceMutate)
  - `on_graph_output_name_changed_delegate`: `OnMetaSoundBuilderGraphVertexRename` — [Read-Write] (OnMetaSoundBuilderGraphVertexRename)
  - `on_removing_graph_input_delegate`: `OnMetaSoundBuilderGraphInterfaceMutate` — [Read-Write] (OnMetaSoundBuilderGraphInterfaceMutate)
  - `on_removing_graph_output_delegate`: `OnMetaSoundBuilderGraphInterfaceMutate` — [Read-Write] (OnMetaSoundBuilderGraphInterfaceMutate)

### `unreal.MetasoundEditorGraphMemberDefaultBool`
Inherits: `MetasoundEditorGraphMemberDefaultLiteral` | Header: `MetasoundEditorGraphMemberDefaults.h`

Metasound Editor Graph Member Default Bool

### `unreal.MetasoundEditorGraphMemberDefaultBoolArray`
Inherits: `MetasoundEditorGraphMemberDefaultLiteral` | Header: `MetasoundEditorGraphMemberDefaults.h`

Metasound Editor Graph Member Default Bool Array

### `unreal.MetasoundEditorGraphMemberDefaultFloat`
Inherits: `MetasoundEditorGraphMemberDefaultLiteral` | Header: `MetasoundEditorGraphMemberDefaults.h`

Metasound Editor Graph Member Default Float

**Properties** (2):
  - `range`: `Vector2D` — [Read-Write] (Vector2D)
  - `widget_value_type`: `MetasoundMemberDefaultWidgetValueType` — [Read-Write]
deprecated: WidgetValueType has been deprecated. Use WidgetUnitValueType instead. (Meta...

### `unreal.MetasoundEditorGraphMemberDefaultFloatArray`
Inherits: `MetasoundEditorGraphMemberDefaultLiteral` | Header: `MetasoundEditorGraphMemberDefaults.h`

Metasound Editor Graph Member Default Float Array

### `unreal.MetasoundEditorGraphMemberDefaultInt`
Inherits: `MetasoundEditorGraphMemberDefaultLiteral` | Header: `MetasoundEditorGraphMemberDefaults.h`

Metasound Editor Graph Member Default Int

### `unreal.MetasoundEditorGraphMemberDefaultIntArray`
Inherits: `MetasoundEditorGraphMemberDefaultLiteral` | Header: `MetasoundEditorGraphMemberDefaults.h`

Metasound Editor Graph Member Default Int Array

### `unreal.MetasoundEditorGraphMemberDefaultLiteral`
Inherits: `MetaSoundFrontendMemberMetadata` | Header: `MetasoundEditorGraph.h`

Metasound Editor Graph Member Default Literal

### `unreal.MetasoundEditorGraphMemberDefaultObject`
Inherits: `MetasoundEditorGraphMemberDefaultLiteral` | Header: `MetasoundEditorGraphMemberDefaults.h`

Metasound Editor Graph Member Default Object

### `unreal.MetasoundEditorGraphMemberDefaultObjectArray`
Inherits: `MetasoundEditorGraphMemberDefaultLiteral` | Header: `MetasoundEditorGraphMemberDefaults.h`

Metasound Editor Graph Member Default Object Array

### `unreal.MetasoundEditorGraphMemberDefaultString`
Inherits: `MetasoundEditorGraphMemberDefaultLiteral` | Header: `MetasoundEditorGraphMemberDefaults.h`

Metasound Editor Graph Member Default String

### `unreal.MetasoundEditorGraphMemberDefaultStringArray`
Inherits: `MetasoundEditorGraphMemberDefaultLiteral` | Header: `MetasoundEditorGraphMemberDefaults.h`

Metasound Editor Graph Member Default String Array

### `unreal.MetaSoundEditorSubsystem`
Inherits: `EditorSubsystem` | Header: `MetasoundEditorSubsystem.h`

The subsystem in charge of editor MetaSound functionality

**Methods** (6):
  - `add_builder_delegate_listener(out_result=MetaSoundBuilderResult)` — Add a builder listener for a builder which is used to add and remove custom editor builder delegates.
  - `build_to_asset(builder, author, asset_name, package_path, out_result=MetaSoundBuilderResult)` — Build the given builder to a MetaSound asset
  - `find_or_begin_building(out_result=MetaSoundBuilderResult)` — Returns a builder for the given MetaSound asset. Returns null if provided a transient MetaSound. For finding builders fo...
  - `find_or_create_graph_input_metadata(builder, out_result=MetaSoundBuilderResult)` — Find graph input metadata (which includes editor only range information for floats) for a given input. If the metadata d...
  - `set_focused_page(builder, page_name, open_editor)` -> `MetaSoundBuilderResult` — If the given page name is implemented on the provided builder, sets the focused page of the provided builder to the asso...
  - `set_node_location(builder, node, location)` -> `MetaSoundBuilderResult` — Sets the visual location to InLocation of a given node InNode of a given builderâs document.

### `unreal.MetaSoundFactory`
Inherits: `MetaSoundBaseFactory` | Header: `MetasoundFactory.h`

Meta Sound Factory

### `unreal.MetaSoundPresetWidgetInterface`
Inherits: `AudioPanelWidgetInterface` | Header: `MetasoundPresetWidgetInterface.h`

Meta Sound Preset Widget Interface

**Methods** (2):
  - `get_supported_meta_sounds()` — The MetaSounds whose presets are supported by this widget. If Support All Presets is true, this widget is supported by a...
  - `on_constructed(builder)` -> `None` — Called when the preset widget is constructed, giving the builder of the associated MetaSound preset

### `unreal.MetaSoundSourceFactory`
Inherits: `MetaSoundBaseFactory` | Header: `MetasoundFactory.h`

Meta Sound Source Factory

### `unreal.MetasoundBoolMemberDefaultWidget`
Inherits: `EnumBase` | Header: `MetasoundEditorSettings.h`

EMetasound Bool Member Default Widget

**Properties** (2):
  - `BUTTON`: `MetasoundBoolMemberDefaultWidget = Ellipsis` — 1
  - `NONE`: `MetasoundBoolMemberDefaultWidget = Ellipsis` — 0

### `unreal.MetasoundMemberDefaultWidget`
Inherits: `EnumBase` | Header: `MetasoundEditorSettings.h`

EMetasound Member Default Widget

**Properties** (3):
  - `NONE`: `MetasoundMemberDefaultWidget = Ellipsis` — 0
  - `RADIAL_SLIDER`: `MetasoundMemberDefaultWidget = Ellipsis` — 2
  - `SLIDER`: `MetasoundMemberDefaultWidget = Ellipsis` — 1

### `unreal.MetasoundMemberDefaultWidgetValueType`
Inherits: `EnumBase` | Header: `MetasoundEditorGraphMemberDefaults.h`

EMetasound Member Default Widget Value Type

**Properties** (3):
  - `FREQUENCY`: `MetasoundMemberDefaultWidgetValueType = Ellipsis` — 1
  - `LINEAR`: `MetasoundMemberDefaultWidgetValueType = Ellipsis` — 0
  - `VOLUME`: `MetasoundMemberDefaultWidgetValueType = Ellipsis` — 2

### `unreal.OnMetaSoundBuilderGraphInterfaceMutate`
Inherits: `MulticastDelegateBase` | Header: `MetasoundEditorBuilderListener.h`

BP Delegates for builder changes

### `unreal.OnMetaSoundBuilderGraphLiteralMutate`
Inherits: `MulticastDelegateBase` | Header: `MetasoundEditorBuilderListener.h`

On Meta Sound Builder Graph Literal Mutate Delegate Signature

### `unreal.OnMetaSoundBuilderGraphVertexRename`
Inherits: `MulticastDelegateBase` | Header: `MetasoundEditorBuilderListener.h`

On Meta Sound Builder Graph Vertex Rename Delegate Signature
