# UE Python API — WebAPIEditor Module

**22 types** from the `WebAPIEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `WebAPINameInfo`, `WebAPINameVariant`, `WebAPIProviderSettings`, `WebAPITemplateString`, `WebAPITypeNameVariant`, `WebAPIDefinitionFactory`, `WebAPIEditorSettings`, `WebAPIModel`, `WebAPIModelBase`, `WebAPIOperation`, `WebAPIOperationError`, `WebAPIOperationParameter`, `WebAPIOperationRequest`, `WebAPIOperationResponse`, `WebAPIProperty`, `WebAPISchema`, `WebAPISchemaObjectInterface`, `WebAPIService`, `WebAPITypeInfo`, `WebAPIParameterStorage`, ... (22 total)

---

## Classes

### `unreal.WebAPINameInfo`
Inherits: `StructBase` | Header: `WebAPISchema.h`

Holds information for a name and itâs alternatives.

### `unreal.WebAPINameVariant`
Inherits: `StructBase` | Header: `WebAPISchema.h`

Holds either FWebAPINameInfo or FString.

### `unreal.WebAPIProviderSettings`
Inherits: `StructBase` | Header: `WebAPIProviderSettings.h`

Encapsulates settings for WebAPI providers.

**Properties** (1):
  - `enable_arbitrary_json_payloads`: `bool` — [Read-Write] Enable this option to allow the user to supply arbitrary json data to any request witho...

### `unreal.WebAPITemplateString`
Inherits: `StructBase` | Header: `WebAPICommon.h`

Web APITemplate String

**Properties** (1):
  - `string`: `str` — [Read-Write] (str)

### `unreal.WebAPITypeNameVariant`
Inherits: `StructBase` | Header: `WebAPISchema.h`

Holds either UWebAPITypeInfo or FString.

### `unreal.WebAPIDefinitionFactory`
Inherits: `Factory` | Header: `WebAPIDefinitionFactory.h`

Base Factory for WebAPIDefinition.

### `unreal.WebAPIEditorSettings`
Inherits: `DeveloperSettings` | Header: `WebAPIEditorSettings.h`

Web APIEditor Settings

**Properties** (1):
  - `code_generator_class`: `Class` [Read-Only] — [Read-Only] (Class)

### `unreal.WebAPIModel`
Inherits: `WebAPIModelBase` | Header: `WebAPIModel.h`

Describes a (usually) API-specific struct or class representing a model.

### `unreal.WebAPIModelBase`
Inherits: `Object` | Header: `WebAPISchema.h`

Baseclass with common properties for various Schema classes.

### `unreal.WebAPIOperation`
Inherits: `Object` | Header: `WebAPIOperation.h`

Web APIOperation

### `unreal.WebAPIOperationError`
Inherits: `Object` | Header: `WebAPIOperation.h`

Web APIOperation Error

### `unreal.WebAPIOperationParameter`
Inherits: `WebAPIProperty` | Header: `WebAPIOperation.h`

Web APIOperation Parameter

### `unreal.WebAPIOperationRequest`
Inherits: `WebAPIModel` | Header: `WebAPIOperation.h`

Web APIOperation Request

### `unreal.WebAPIOperationResponse`
Inherits: `WebAPIModel` | Header: `WebAPIOperation.h`

Web APIOperation Response

### `unreal.WebAPIProperty`
Inherits: `WebAPIModelBase` | Header: `WebAPIModel.h`

Describes a single property within a model.

### `unreal.WebAPISchema`
Inherits: `Object` | Header: `WebAPISchema.h`

Describes the intermediate structure from which to generate code.

### `unreal.WebAPISchemaObjectInterface`
Inherits: `Interface` | Header: `WebAPISchema.h`

Web APISchema Object Interface

### `unreal.WebAPIService`
Inherits: `WebAPIModelBase` | Header: `WebAPIService.h`

A service generally contains a sub-section of the API containing operations related to a particular subject.

### `unreal.WebAPITypeInfo`
Inherits: `Object` | Header: `WebAPIType.h`

Holds information for an existing or pending type.

### `unreal.WebAPIParameterStorage`
Inherits: `EnumBase` | Header: `WebAPIOperation.h`

EWeb APIParameter Storage

**Properties** (5):
  - `BODY`: `WebAPIParameterStorage = Ellipsis` — ie. json string 4
  - `COOKIE`: `WebAPIParameterStorage = Ellipsis` — {key}={value} 3
  - `HEADER`: `WebAPIParameterStorage = Ellipsis` — {value} 2 {key}
  - `PATH`: `WebAPIParameterStorage = Ellipsis` — /users/{value} 0
  - `QUERY`: `WebAPIParameterStorage = Ellipsis` — /users?{key}={value}} 1

### `unreal.WebAPIResponseStorage`
Inherits: `EnumBase` | Header: `WebAPIOperation.h`

EWeb APIResponse Storage

**Properties** (2):
  - `BODY`: `WebAPIResponseStorage = Ellipsis` — ie. json string 0
  - `HEADER`: `WebAPIResponseStorage = Ellipsis` — {value} 1 {key}

### `unreal.WebAPISchemaType`
Inherits: `EnumBase` | Header: `WebAPIType.h`

Schema type allows same name but different Schema types, ie. both a service and model with the name âPetâ.

**Properties** (6):
  - `MODEL`: `WebAPISchemaType = Ellipsis` — 0
  - `OPERATION`: `WebAPISchemaType = Ellipsis` — 2
  - `PARAMETER`: `WebAPISchemaType = Ellipsis` — 4
  - `PROPERTY`: `WebAPISchemaType = Ellipsis` — All items before this are considered top-level, all below are sub-items 3
  - `SERVICE`: `WebAPISchemaType = Ellipsis` — 1
  - `UNSPECIFIED`: `WebAPISchemaType = Ellipsis` — 128
