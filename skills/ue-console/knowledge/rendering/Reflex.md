# UE Python API — Reflex Module

**2 types** from the `Reflex` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ReflexBlueprintLibrary`, `ReflexMode`

---

## Classes

### `unreal.ReflexBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `ReflexBlueprint.h`

Reflex Blueprint Library

**Methods** (8):
  - `get_flash_indicator_enabled()` -> `bool` [classmethod] — Get Flash Indicator Enabled
  - `get_game_latency_in_ms()` -> `float` [classmethod] — Get Game Latency in Ms
  - `get_game_to_render_latency_in_ms()` -> `float` [classmethod] — Get Game to Render Latency in Ms
  - `get_reflex_available()` -> `bool` [classmethod] — Get Reflex Available
  - `get_reflex_mode()` -> `ReflexMode` [classmethod] — Get Reflex Mode
  - `get_render_latency_in_ms()` -> `float` [classmethod] — Get Render Latency in Ms
  - `set_flash_indicator_enabled(enabled)` -> `None` [classmethod] — Set Flash Indicator Enabled
  - `set_reflex_mode(mode)` -> `None` [classmethod] — Set Reflex Mode

### `unreal.ReflexMode`
Inherits: `EnumBase` | Header: `ReflexBlueprint.h`

EReflex Mode

**Properties** (3):
  - `DISABLED`: `ReflexMode = Ellipsis` — 0
  - `ENABLED`: `ReflexMode = Ellipsis` — 1
  - `ENABLED_PLUS_BOOST`: `ReflexMode = Ellipsis` — 3
