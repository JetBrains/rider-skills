# UE Python API — Overlay Module

**4 types** from the `Overlay` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `OverlayItem`, `BasicOverlays`, `LocalizedOverlays`, `Overlays`

---

## Classes

### `unreal.OverlayItem`
Inherits: `StructBase` | Header: `Overlays.h`

Overlay Item

**Properties** (4):
  - `end_time`: `Timespan` — [Read-Write] When the overlay should be cleared (Timespan)
  - `position`: `Vector2D` — [Read-Write] The position of the text on screen (Between 0.0 and 1.0) (Vector2D)
  - `start_time`: `Timespan` — [Read-Write] When the overlay should be displayed (Timespan)
  - `text`: `str` — [Read-Write] Text that appears onscreen when the overlay is shown (str)

### `unreal.BasicOverlays`
Inherits: `Overlays` | Header: `BasicOverlays.h`

Implements an asset that contains a set of overlay data (which includes timing, text, and position) to be displayed for any given source (including, but not limited to, audio, dialog, and movies)

### `unreal.LocalizedOverlays`
Inherits: `Overlays` | Header: `LocalizedOverlays.h`

Implements an asset that contains a set of Basic Overlays that will be displayed in accordance with the current locale, or a default set if an appropriate locale is not found

### `unreal.Overlays`
Inherits: `Object` | Header: `Overlays.h`

An interface class for creating overlay data assets
