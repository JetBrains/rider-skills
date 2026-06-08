# UE Python API — WebAPI Module

**6 types** from the `WebAPI` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `WebAPIMessageResponse`, `WebAPIAuthenticationSettings`, `WebAPIDeveloperSettings`, `WebAPIOAuthSettings`, `WebAPIOperationObject`, `WebAPIUtilities`

---

## Classes

### `unreal.WebAPIMessageResponse`
Inherits: `StructBase` | Header: `WebAPIMessageResponse.h`

Web APIMessage Response

### `unreal.WebAPIAuthenticationSettings`
Inherits: `DeveloperSettings` | Header: `WebAPIAuthentication.h`

Web APIAuthentication Settings

**Properties** (1):
  - `scheme_name`: `Name` [Read-Only] — [Read-Only] Public client identifier. (Name)

### `unreal.WebAPIDeveloperSettings`
Inherits: `DeveloperSettings` | Header: `WebAPIDeveloperSettings.h`

The base class of any auto generated WebAPI settings object.

**Properties** (9):
  - `authentication_settings`: `None` — [Read-Write] Authentication settings per security scheme. (Array[WebAPIAuthenticationSettings])
  - `base_url`: `str` — [Read-Write] The Url path relative to the host address, ie. â/V1â. (str)
  - `date_time_format`: `str` — [Read-Write] The date-time format this API uses to encode/decode from string. (str)
  - `host`: `str` — [Read-Write] The default host address to access this API. (str)
  - `log_requests`: `bool` — [Read-Write] Whether to print requests to the output log, useful for debugging. (bool)
  - `override_scheme`: `bool` — [Read-Write] Whether to override the URI scheme. (bool)
  - `uri_scheme_override`: `str` — [Read-Write] User specified Uniform Resource Identifier scheme. (str)
  - `uri_schemes`: `None` [Read-Only] — [Read-Only] Uniform Resource Identifier schemes (ie. https, http). (Array[str])
  - `user_agent`: `str` — [Read-Write] The UserAgent to encode in Http request headers. (str)

### `unreal.WebAPIOAuthSettings`
Inherits: `WebAPIAuthenticationSettings` | Header: `WebAPIAuthentication.h`

Web APIOAuth Settings

**Properties** (8):
  - `access_token`: `str` [Read-Only] — [Read-Only] Private token returned by the server. (str)
  - `additional_request_body_parameters`: `None` — [Read-Write] Additional content key/value pairs to add to auth request. (Map[str,str])
  - `additional_request_query_parameters`: `None` — [Read-Write] Additional query parameters to add to auth request. Each key should be present in the U...
  - `authentication_server`: `str` — [Read-Write] Authentication endpoint. (str)
  - `client_id`: `str` — [Read-Write] Public client identifier. (str)
  - `client_secret`: `str` — [Read-Write] Private client secret. (str)
  - `expires_on`: `DateTime` [Read-Only] — [Read-Only] Private token expiration returned by the server. (DateTime)
  - `token_type`: `str` — [Read-Write] Token type, ie. Bearer (str)

### `unreal.WebAPIOperationObject`
Inherits: `Object` | Header: `WebAPIOperationObject.h`

Baseclass for an asynchronous Http request/response operation.

**Properties** (1):
  - `message`: `Text` [Read-Only] — [Read-Only] Can contain a response or status message. (Text)

### `unreal.WebAPIUtilities`
Inherits: `BlueprintFunctionLibrary` | Header: `WebAPIUtilities.h`

Web APIUtilities

**Methods** (2):
  - `get_host_from_url(url)` -> `str` [classmethod] — Return the host (only) from the provided Url.
  - `get_response_message(message_response)` -> `Text` [classmethod] — Return the message from the provided response.
