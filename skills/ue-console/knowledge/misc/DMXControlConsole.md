# UE Python API — DMXControlConsole Module

**7 types** from the `DMXControlConsole` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DMXControlConsole`, `DMXControlConsoleActor`, `DMXControlConsoleData`, `DMXControlConsoleFloatOscillator`, `DMXControlConsoleFloatOscillator_Sine`, `DMXControlConsoleFloatOscillator_Square`, `DMXControlConsoleStopDMXMode`

---

## Classes

### `unreal.DMXControlConsole`
Inherits: `Object` | Header: `DMXControlConsole.h`

DMX Control Console.

### `unreal.DMXControlConsoleActor`
Inherits: `Actor` | Header: `DMXControlConsoleActor.h`

Actor class for DMX Control Console

**Methods** (5):
  - `pause_sending_dmx()` -> `None` — Sets the current DMX Control Console to pause sending DMX data
  - `reset_to_default()` -> `None` — Resets all the faders in this Control Console to their default values
  - `reset_to_zero()` -> `None` — Resets all the faders in this Control Console to zero
  - `start_sending_dmx()` -> `None` — Sets the current DMX Control Console to start sending DMX data
  - `stop_sending_dmx()` -> `None` — Sets the current DMX Control Console to stop sending DMX data

### `unreal.DMXControlConsoleData`
Inherits: `Object` | Header: `DMXControlConsoleData.h`

This class is responsible to hold all the data of a DMX Control Console

### `unreal.DMXControlConsoleFloatOscillator`
Inherits: `Object` | Header: `DMXControlConsoleFloatOscillator.h`

A value Oscillator that can be used in the DMX Control Console. Outputs float (normalized values)

**Methods** (1):
  - `get_normalized_value(delta_time)` -> `float` — Gets a normalized value that is sent as DMX

### `unreal.DMXControlConsoleFloatOscillator_Sine`
Inherits: `DMXControlConsoleFloatOscillator` | Header: `DMXControlConsoleFloatOscillator_Sine.h`

Generates DMX Signals in a Sine Pattern

**Properties** (3):
  - `amplitude`: `float` — [Read-Write] The amplitude of the sine wave, in the range [0, 1] (float)
  - `frequency_hz`: `float` — [Read-Write] The frequency of the sine wave, in Hz (float)
  - `offset`: `float` — [Read-Write] The offset of the sine wave, in the range [0, 1] (float)

### `unreal.DMXControlConsoleFloatOscillator_Square`
Inherits: `DMXControlConsoleFloatOscillator` | Header: `DMXControlConsoleFloatOscillator_Square.h`

Generates DMX Signals in a Square Wave Pattern

**Properties** (3):
  - `amplitude`: `float` — [Read-Write] The amplitude of the square wave, in the range [0, 1] (float)
  - `frequency_hz`: `float` — [Read-Write] The frequency of the square wave, in Hz (float)
  - `offset`: `float` — [Read-Write] The offset of the square wave, in the range [0, 1] (float)

### `unreal.DMXControlConsoleStopDMXMode`
Inherits: `EnumBase` | Header: `DMXControlConsoleData.h`

EDMXControl Console Stop DMXMode

**Properties** (3):
  - `DO_NOT_SEND_VALUES`: `DMXControlConsoleStopDMXMode = Ellipsis` — 2
  - `SEND_DEFAULT_VALUES`: `DMXControlConsoleStopDMXMode = Ellipsis` — 0
  - `SEND_ZERO_VALUES`: `DMXControlConsoleStopDMXMode = Ellipsis` — 1
