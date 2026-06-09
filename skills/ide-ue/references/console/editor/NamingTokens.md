# UE Python API — NamingTokens Module

**8 types** from the `NamingTokens` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `NamingTokenData`, `NamingTokenFilterArgs`, `NamingTokenResultData`, `NamingTokensEvaluationData`, `NamingTokenValueData`, `GlobalNamingTokens`, `NamingTokens`, `NamingTokensEngineSubsystem`

---

## Classes

### `unreal.NamingTokenData`
Inherits: `StructBase` | Header: `NamingTokenData.h`

Naming Token Data

**Properties** (3):
  - `description`: `Text` — [Read-Write] A description of the token. (Text)
  - `display_name`: `Text` — [Read-Write] The friendly display name of the token. (Text)
  - `token_key`: `str` — [Read-Write] The key of the token to use. This is what the text must match in order to be evaluated....

### `unreal.NamingTokenFilterArgs`
Inherits: `StructBase` | Header: `NamingTokensEngineSubsystem.h`

Naming Token Filter Args

**Properties** (2):
  - `additional_namespaces_to_include`: `None` — [Read-Write] Namespaces to always be included during evaluation. Namespaces added here wonât requi...
  - `include_global`: `bool` — [Read-Write] Include global namespaces. (bool)

### `unreal.NamingTokenResultData`
Inherits: `StructBase` | Header: `NamingTokenData.h`

Evaluated results from a template file string.

**Properties** (3):
  - `evaluated_text`: `Text` [Read-Only] — [Read-Only] The full text with evaluated tokens. (Text)
  - `original_text`: `Text` [Read-Only] — [Read-Only] Original text without any modifications. (Text)
  - `token_values`: `None` [Read-Only] — [Read-Only] The result of individual tokens, in the order they appear in OriginalText. (Array[Naming...

### `unreal.NamingTokensEvaluationData`
Inherits: `StructBase` | Header: `NamingTokensEvaluationData.h`

Shared data across token evaluation.

**Properties** (2):
  - `contexts`: `None` [Read-Only] — [Read-Only] An optional array of context objects for this evaluation. (Array[Object])
  - `current_date_time`: `DateTime` [Read-Only] — [Read-Only] The current date time. (DateTime)

### `unreal.NamingTokenValueData`
Inherits: `StructBase` | Header: `NamingTokenData.h`

Naming Token Value Data

**Properties** (4):
  - `provided_namespace`: `str` [Read-Only] — [Read-Only] The namespace of the token, if it was originally provided during evaluation. (str)
  - `token_key`: `str` [Read-Only] — [Read-Only] The token key. (str)
  - `token_value`: `Text` [Read-Only] — [Read-Only] The evaluated token text. (Text)
  - `was_evaluated`: `bool` [Read-Only] — [Read-Only] If the token was able to be evaluated. (bool)

### `unreal.GlobalNamingTokens`
Inherits: `NamingTokens` | Header: `GlobalNamingTokens.h`

Default global tokens accessed project wide.

### `unreal.NamingTokens`
Inherits: `Object` | Header: `NamingTokens.h`

Subclass to define naming tokens to use for a specific tool or project.

**Methods** (3):
  - `get_current_date_time()` -> `DateTime` — Retrieve the current datetime. By default, this uses shared data so results are consistent across runs.
  - `on_post_evaluate()` -> `None` — Called after evaluation. Used so any cleanup can occur.
  - `on_pre_evaluate(evaluation_data)` -> `None` — Called prior to evaluation. Allows consistent data to be set up for each token evaluation. This is important if the data...

**Properties** (1):
  - `current_evaluation_data`: `NamingTokensEvaluationData` [Read-Only] — [Read-Only] Cached shared data for this evaluation. (NamingTokensEvaluationData)

### `unreal.NamingTokensEngineSubsystem`
Inherits: `EngineSubsystem` | Header: `NamingTokensEngineSubsystem.h`

An editor subsystem for registering global tokens and evaluating strings across the entire project.

**Methods** (10):
  - `clear_cached_naming_tokens()` -> `None` — Clears all currently cached naming tokens. They will be loaded on demand when required. This can avoid an editor restart...
  - `evaluate_token_string(token_string, filter, contexts)` -> `NamingTokenResultData` — Parse and evaluate token string.
  - `evaluate_token_text(token_text, filter, contexts)` -> `NamingTokenResultData` — Parse and evaluate token text.
  - `get_all_namespaces()` -> `Array [ str ]` — Retrieve all discovered namespaces.
  - `get_global_namespaces()` -> `Array [ str ]` — Retrieve the registered global namespaces.
  - `get_multiple_naming_tokens(namespaces)` -> `Array [ NamingTokens ]` — Lookup multiple naming tokens from multiple namespaces.
  - `get_naming_tokens(namespace)` -> `NamingTokens` — Lookup naming tokens given a namespace. This will look first in cached naming tokens, then native classes, then blueprin...
  - `is_global_namespace_registered(namespace)` -> `bool` — Checks if a namespace is registered globally.
  - `register_global_namespace(namespace)` -> `None` — Register tokens as a global namespace. This prevents the need to include the namespace in a token string.
  - `unregister_global_namespace(namespace)` -> `None` — Remove tokens from a global namespace.
