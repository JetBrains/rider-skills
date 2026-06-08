# UE Python API — AnalyticsBlueprintLibrary Module

**2 types** from the `AnalyticsBlueprintLibrary` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnalyticsEventAttr`, `AnalyticsLibrary`

---

## Classes

### `unreal.AnalyticsEventAttr`
Inherits: `StructBase` | Header: `AnalyticsBlueprintLibrary.h`

Blueprint accessible version of the analytics event struct

**Properties** (2):
  - `name`: `str` — [Read-Write] (str)
  - `value`: `str` — [Read-Write] (str)

### `unreal.AnalyticsLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AnalyticsBlueprintLibrary.h`

Analytics Blueprint Library

**Methods** (29):
  - `end_session()` -> `None` [classmethod] — Ends an analytics session
  - `flush_events()` -> `None` [classmethod] — Requests that any cached events be sent immediately
  - `get_session_id()` -> `str` [classmethod] — Gets the current session id from the analytics provider
  - `get_user_id()` -> `str` [classmethod] — Gets the current user id from the analytics provider
  - `make_event_attribute(attribute_name, attribute_value)` -> `AnalyticsEventAttr` [classmethod] — Builds a struct from the attribute name and value
  - `record_currency_given(game_currency_type, game_currency_amount)` -> `None` [classmethod] — Records an in-game currency was granted by the game with no real-world money being involved
  - `record_currency_given_with_attributes(game_currency_type, game_currency_amount, attributes)` -> `None` [classmethod] — Records an in-game currency was granted by the game with no real-world money being involved
  - `record_currency_purchase(game_currency_type, game_currency_amount, real_currency_type, real_money_cost, payment_provider)` -> `None` [classmethod] — Records an in-game currency was purchased using real-world money
  - `record_error(error)` -> `None` [classmethod] — Records an error event has happened
  - `record_error_with_attributes(error, attributes)` -> `None` [classmethod] — Records an error event has happened with attributes
  - `record_event(event_name)` -> `None` [classmethod] — Records an event has happened by name without any attributes (an event counter)
  - `record_event_with_attribute(event_name, attribute_name, attribute_value)` -> `None` [classmethod] — Records an event has happened by name with a single attribute
  - `record_event_with_attributes(event_name, attributes)` -> `None` [classmethod] — Records an event has happened by name with a single attribute
  - `record_item_purchase(item_id, currency, per_item_cost, item_quantity)` -> `None` [classmethod] — Records an in-game item was purchased using the specified in-game currency
  - `record_progress(progress_type, progress_name)` -> `None` [classmethod] — Records a user progress event has happened
  - `record_progress_with_attributes(progress_type, progress_name, attributes)` -> `None` [classmethod] — Records a user progress event has happened with attributes
  - `record_progress_with_full_hierarchy_and_attributes(progress_type, progress_names, attributes)` -> `None` [classmethod] — Records a user progress event has happened with a full list of progress hierarchy names and with attributes
  - `record_simple_currency_purchase(game_currency_type, game_currency_amount)` -> `None` [classmethod] — Records an in-game currency was purchased using real-world money
  - `record_simple_currency_purchase_with_attributes(game_currency_type, game_currency_amount, attributes)` -> `None` [classmethod] — Records an in-game currency was purchased using real-world money
  - `record_simple_item_purchase(item_id, item_quantity)` -> `None` [classmethod] — Records an in-game item was purchased
  - `record_simple_item_purchase_with_attributes(item_id, item_quantity, attributes)` -> `None` [classmethod] — Records an in-game item was purchased with attributes
  - `set_age(age)` -> `None` [classmethod] — Sets the userâs age (if supported) on the analytics provider
  - `set_build_info(build_info)` -> `None` [classmethod] — Sets the gameâs build info (if supported) on the analytics provider
  - `set_gender(gender)` -> `None` [classmethod] — Sets the userâs gender (if supported) on the analytics provider
  - `set_location(location)` -> `None` [classmethod] — Sets the userâs location (if supported) on the analytics provider
  - `set_session_id(session_id)` -> `None` [classmethod] — Sets the session id (if supported) on the analytics provider
  - `set_user_id(user_id)` -> `None` [classmethod] — Sets the user id (if supported) on the analytics provider
  - `start_session()` -> `bool` [classmethod] — Starts an analytics session without any custom attributes specified
  - `start_session_with_attributes(attributes)` -> `bool` [classmethod] — Starts an analytics session with custom attributes specified
