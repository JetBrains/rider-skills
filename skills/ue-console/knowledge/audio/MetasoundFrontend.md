# UE Python API — MetasoundFrontend Module

**34 types** from the `MetasoundFrontend` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MetaSoundClassInterfaceInfo`, `MetaSoundClassSearchInfo`, `MetaSoundClassVertexCollectionInfo`, `MetaSoundClassVertexInfo`, `MetaSoundDocumentInfo`, `MetasoundFrontendClass`, `MetasoundFrontendClassEnvironmentVariable`, `MetasoundFrontendClassInput`, `MetasoundFrontendClassInputDefault`, `MetasoundFrontendClassInterface`, `MetasoundFrontendClassMetadata`, `MetasoundFrontendClassName`, `MetasoundFrontendClassOutput`, `MetasoundFrontendClassVertex`, `MetasoundFrontendDocument`, `MetasoundFrontendDocumentMetadata`, `MetasoundFrontendGraph`, `MetasoundFrontendGraphClass`, `MetasoundFrontendInterfaceMetadata`, `MetasoundFrontendInterfaceUClassOptions`, ... (34 total)

---

## Classes

### `unreal.MetaSoundClassInterfaceInfo`
Inherits: `StructBase` | Header: `MetasoundFrontendQuery.h`

Condensed set of class data that is serialized to editor-only asset tag data, allowing editor scripts and code to query MetaSounds without loading them in entirety.

**Properties** (5):
  - `defined_interfaces`: `None` [Read-Only] — [Read-Only] Interfaces metadata associated with interfaces defined by this class. (Array[MetasoundFr...
  - `inherited_interfaces`: `None` [Read-Only] — [Read-Only] Interfaces metadata associated with a given class definition. (Array[MetasoundFrontendVe...
  - `inputs`: `None` [Read-Only] — [Read-Only] Collection of identifiable input vertex data cached in query for fast access & serializa...
  - `outputs`: `None` [Read-Only] — [Read-Only] Collection of identifiable output vertex data cached in query for fast access & serializ...
  - `search_info`: `MetaSoundClassSearchInfo` [Read-Only] — [Read-Only] Editor-only search info (MetaSoundClassSearchInfo)

### `unreal.MetaSoundClassSearchInfo`
Inherits: `StructBase` | Header: `MetasoundFrontendQuery.h`

Condensed set of class metadata that is serialized to editor-only asset tag data, allowing editor scripts and code to search and display MetaSounds without loading in asset selection contexts without ...

**Properties** (4):
  - `class_description`: `Text` [Read-Only] — [Read-Only] (Text)
  - `class_display_name`: `Text` [Read-Only] — [Read-Only] Human readable DisplayName of Class (optional, overrides the
package name in the editor ...
  - `hierarchy`: `None` [Read-Only] — [Read-Only] (Array[Text])
  - `keywords`: `None` [Read-Only] — [Read-Only] (Array[Text])

### `unreal.MetaSoundClassVertexCollectionInfo`
Inherits: `StructBase` | Header: `MetasoundFrontendQuery.h`

Condensed set of vertex data that is serialized to editor-only asset tag data, allowing editor scripts and code to query MetaSounds without loading them in entirety.

**Properties** (1):
  - `class_vertex_info`: `None` [Read-Only] — [Read-Only] (Array[MetaSoundClassVertexInfo])

### `unreal.MetaSoundClassVertexInfo`
Inherits: `StructBase` | Header: `MetasoundFrontendQuery.h`

Condensed set of class vertex data that is serialized to editor-only asset tag data, allowing editor scripts and code to query MetaSounds without loading them in entirety.

**Properties** (3):
  - `access_type`: `MetasoundFrontendVertexAccessType` [Read-Only] — [Read-Only] (MetasoundFrontendVertexAccessType)
  - `name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `type_name`: `Name` [Read-Only] — [Read-Only] (Name)

### `unreal.MetaSoundDocumentInfo`
Inherits: `StructBase` | Header: `MetasoundAssetManager.h`

Meta Sound Document Info

**Properties** (2):
  - `document_version`: `MetasoundFrontendVersionNumber` [Read-Only] — [Read-Only] Version of document (MetasoundFrontendVersionNumber)
  - `is_preset`: `bool` [Read-Only] — [Read-Only] Whether asset is a preset or not. (bool)

### `unreal.MetasoundFrontendClass`
Inherits: `StructBase` | Header: `MetasoundFrontendDocument.h`

Metasound Frontend Class

### `unreal.MetasoundFrontendClassEnvironmentVariable`
Inherits: `StructBase` | Header: `MetasoundFrontendDocument.h`

Metasound Frontend Class Environment Variable

### `unreal.MetasoundFrontendClassInput`
Inherits: `MetasoundFrontendClassVertex` | Header: `MetasoundFrontendDocument.h`

Contains info for input vertex of a Metasound class.

### `unreal.MetasoundFrontendClassInputDefault`
Inherits: `StructBase` | Header: `MetasoundFrontendDocument.h`

Metasound Frontend Class Input Default

### `unreal.MetasoundFrontendClassInterface`
Inherits: `StructBase` | Header: `MetasoundFrontendDocument.h`

Metasound Frontend Class Interface

### `unreal.MetasoundFrontendClassMetadata`
Inherits: `StructBase` | Header: `MetasoundFrontendDocument.h`

Metasound Frontend Class Metadata

### `unreal.MetasoundFrontendClassName`
Inherits: `StructBase` | Header: `MetasoundFrontendDocument.h`

Name of a Metasound class

**Properties** (3):
  - `name`: `Name` — [Read-Write] Name of class. (Name)
  - `namespace`: `Name` — [Read-Write] Namespace of class. (Name)
  - `variant`: `Name` — [Read-Write] Variant of class. The Variant is used to describe an equivalent class which performs th...

### `unreal.MetasoundFrontendClassOutput`
Inherits: `MetasoundFrontendClassVertex` | Header: `MetasoundFrontendDocument.h`

Contains info for output vertex of a Metasound class.

### `unreal.MetasoundFrontendClassVertex`
Inherits: `MetasoundFrontendVertex` | Header: `MetasoundFrontendDocument.h`

Metasound Frontend Class Vertex

### `unreal.MetasoundFrontendDocument`
Inherits: `StructBase` | Header: `MetasoundFrontendDocument.h`

Metasound Frontend Document

**Properties** (2):
  - `archetype_version`: `MetasoundFrontendVersion` — [Read-Write]
deprecated: 5.0 - ArchetypeVersion has been migrated to InterfaceVersions array. (Metas...
  - `interface_versions`: `None` — [Read-Write]
deprecated: 5.0 - InterfaceVersions has been migrated to Interfaces set. (Array[Metasou...

### `unreal.MetasoundFrontendDocumentMetadata`
Inherits: `StructBase` | Header: `MetasoundFrontendDocument.h`

Metasound Frontend Document Metadata

### `unreal.MetasoundFrontendGraph`
Inherits: `StructBase` | Header: `MetasoundFrontendDocument.h`

Metasound Frontend Graph

### `unreal.MetasoundFrontendGraphClass`
Inherits: `MetasoundFrontendClass` | Header: `MetasoundFrontendDocument.h`

Metasound Frontend Graph Class

### `unreal.MetasoundFrontendInterfaceMetadata`
Inherits: `StructBase` | Header: `MetasoundFrontendDocument.h`

Metasound Frontend Interface Metadata

**Properties** (2):
  - `u_class_options`: `None` [Read-Only] — [Read-Only] If specified, options used to restrict a corresponding UClass that interface may be
appl...
  - `version`: `MetasoundFrontendVersion` [Read-Only] — [Read-Only] Name and version number of the interface (MetasoundFrontendVersion)

### `unreal.MetasoundFrontendInterfaceUClassOptions`
Inherits: `StructBase` | Header: `MetasoundFrontendDocument.h`

Options used to restrict a corresponding UClass that interface may be applied to. If unspecified, interface is assumed to be applicable to any arbitrary UClass.

**Properties** (1):
  - `class_path`: `TopLevelAssetPath` [Read-Only] — [Read-Only] Path to MetaSound class interface can be added to (ex. UMetaSoundSource or UMetaSound) (...

### `unreal.MetasoundFrontendLiteral`
Inherits: `StructBase` | Header: `MetasoundFrontendLiteral.h`

Represents the serialized version of variant literal types.

### `unreal.MetasoundFrontendNode`
Inherits: `StructBase` | Header: `MetasoundFrontendDocument.h`

An FMetasoundFrontendNode represents a single instance of a FMetasoundFrontendClass

### `unreal.MetasoundFrontendVersion`
Inherits: `StructBase` | Header: `MetasoundFrontendDocument.h`

General purpose version info for Metasound Frontend objects.

**Properties** (2):
  - `name`: `Name` [Read-Only] — [Read-Only] Name of version. (Name)
  - `number`: `MetasoundFrontendVersionNumber` [Read-Only] — [Read-Only] Version number. (MetasoundFrontendVersionNumber)

### `unreal.MetasoundFrontendVersionNumber`
Inherits: `StructBase` | Header: `MetasoundFrontendDocument.h`

General purpose version number for Metasound Frontend objects.

**Properties** (2):
  - `major`: `int` [Read-Only] — [Read-Only] Major version number. (int32)
  - `minor`: `int` [Read-Only] — [Read-Only] Minor version number. (int32)

### `unreal.MetasoundFrontendVertex`
Inherits: `StructBase` | Header: `MetasoundFrontendDocument.h`

An FMetasoundFrontendVertex provides a named connection point of a node.

### `unreal.MetasoundFrontendVertexHandle`
Inherits: `StructBase` | Header: `MetasoundFrontendDocument.h`

Pair of guids used to address location of vertex within a FrontendDocument graph

### `unreal.MetasoundFrontendVertexMetadata`
Inherits: `StructBase` | Header: `MetasoundFrontendDocument.h`

Metadata associated with a vertex.

### `unreal.MetaSoundDocumentInterface`
Inherits: `Interface` | Header: `MetasoundDocumentInterface.h`

Meta Sound Document Interface

### `unreal.MetaSoundFrontendMemberMetadata`
Inherits: `Object` | Header: `MetasoundFrontendDocument.h`

Meta Sound Frontend Member Metadata

### `unreal.MetasoundParameterPack`
Inherits: `Object` | Header: `MetasoundParameterPack.h`

Here is the UObject BlueprintType that can be used in c++ and blueprint code. It holds a FMetasoundParamStorage instance and can pass it along to the audio systemâs SetObjectParameter function via a...

**Methods** (16):
  - `get_bool(parameter_name)` -> `SetParamResult or None` — Get Bool
  - `get_float(result=SetParamResult)` — Get Float
  - `get_int(result=SetParamResult)` — Get Int
  - `get_string(result=SetParamResult)` — Get String
  - `get_trigger(parameter_name)` -> `SetParamResult or None` — Get Trigger
  - `has_bool(parameter_name)` -> `bool` — Has Bool
  - `has_float(parameter_name)` -> `bool` — Has Float
  - `has_int(parameter_name)` -> `bool` — Has Int
  - `has_string(parameter_name)` -> `bool` — Has String
  - `has_trigger(parameter_name)` -> `bool` — Has Trigger
  - `make_metasound_parameter_pack()` -> `MetasoundParameterPack` [classmethod] — Make Metasound Parameter Pack
  - `set_bool(parameter_name, value, only_if_exists = True)` -> `SetParamResult` — Set Bool
  - `set_float(parameter_name, value, only_if_exists = True)` -> `SetParamResult` — Set Float
  - `set_int(parameter_name, value, only_if_exists = True)` -> `SetParamResult` — Set Int
  - `set_string(parameter_name, value, only_if_exists = True)` -> `SetParamResult` — Set String
  - `set_trigger(parameter_name, only_if_exists = True)` -> `SetParamResult` — Set Trigger

### `unreal.MetasoundFrontendClassType`
Inherits: `EnumBase` | Header: `MetasoundFrontendDocument.h`

EMetasound Frontend Class Type

**Properties** (10):
  - `EXTERNAL`: `MetasoundFrontendClassType = Ellipsis` — The MetaSound class is defined externally, in compiled code or in another document. 0
  - `GRAPH`: `MetasoundFrontendClassType = Ellipsis` — The MetaSound class is a graph within the containing document. 1
  - `INPUT`: `MetasoundFrontendClassType = Ellipsis` — The MetaSound class is an input into a graph in the containing document. 2
  - `LITERAL`: `MetasoundFrontendClassType = Ellipsis` — The MetaSound class is an literal requiring a literal value to construct. 4
  - `OUTPUT`: `MetasoundFrontendClassType = Ellipsis` — The MetaSound class is an output from a graph in the containing document. 3
  - `TEMPLATE`: `MetasoundFrontendClassType = Ellipsis` — The MetaSound class is defined only by the Frontend, and associatively
performs a functional operati...
  - `VARIABLE`: `MetasoundFrontendClassType = Ellipsis` — The MetaSound class is an variable requiring a literal value to construct. 5
  - `VARIABLE_ACCESSOR`: `MetasoundFrontendClassType = Ellipsis` — The MetaSound class accesses variables. 7
  - `VARIABLE_DEFERRED_ACCESSOR`: `MetasoundFrontendClassType = Ellipsis` — The MetaSound class accesses variables. 6
  - `VARIABLE_MUTATOR`: `MetasoundFrontendClassType = Ellipsis` — The MetaSound class mutates variables. 8

### `unreal.MetasoundFrontendLiteralType`
Inherits: `EnumBase` | Header: `MetasoundFrontendLiteral.h`

The type of a given literal for an input value.

**Properties** (12):
  - `BOOLEAN`: `MetasoundFrontendLiteralType = Ellipsis` — < A value of None expresses that an object being constructed with a literal should be default constr...
  - `BOOLEAN_ARRAY`: `MetasoundFrontendLiteralType = Ellipsis` — < A NoneArray expresses the number of objects to be default constructed. 7
  - `FLOAT`: `MetasoundFrontendLiteralType = Ellipsis` — 3
  - `FLOAT_ARRAY`: `MetasoundFrontendLiteralType = Ellipsis` — 9
  - `INTEGER`: `MetasoundFrontendLiteralType = Ellipsis` — 2
  - `INTEGER_ARRAY`: `MetasoundFrontendLiteralType = Ellipsis` — 8
  - `NONE`: `MetasoundFrontendLiteralType = Ellipsis` — 0
  - `NONE_ARRAY`: `MetasoundFrontendLiteralType = Ellipsis` — 6
  - `STRING`: `MetasoundFrontendLiteralType = Ellipsis` — 4
  - `STRING_ARRAY`: `MetasoundFrontendLiteralType = Ellipsis` — 10
  - `U_OBJECT`: `MetasoundFrontendLiteralType = Ellipsis` — 5
  - `U_OBJECT_ARRAY`: `MetasoundFrontendLiteralType = Ellipsis` — 11

### `unreal.MetasoundFrontendVertexAccessType`
Inherits: `EnumBase` | Header: `MetasoundFrontendDocument.h`

Describes how a vertex accesses the data connected to it.

**Properties** (3):
  - `REFERENCE`: `MetasoundFrontendVertexAccessType = Ellipsis` — 0
  - `UNSET`: `MetasoundFrontendVertexAccessType = Ellipsis` — < The vertex accesses data by value. 2
  - `VALUE`: `MetasoundFrontendVertexAccessType = Ellipsis` — < The vertex accesses data by reference. 1

### `unreal.SetParamResult`
Inherits: `EnumBase` | Header: `MetasoundParameterPack.h`

ESet Param Result

**Properties** (2):
  - `FAILED`: `SetParamResult = Ellipsis` — 1
  - `SUCCEEDED`: `SetParamResult = Ellipsis` — 0
