# UE Python API — MIDIDevice Module

**16 types** from the `MIDIDevice` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `FoundMIDIDevice`, `MIDIDeviceInfo`, `MIDIDeviceController`, `MIDIDeviceControllerBase`, `MIDIDeviceInputController`, `MIDIDeviceManager`, `MIDIDeviceOutputController`, `MIDIEventType`, `OnMIDIAftertouch`, `OnMIDIChannelAftertouch`, `OnMIDIControlChange`, `OnMIDIEvent`, `OnMIDINoteOff`, `OnMIDINoteOn`, `OnMIDIPitchBend`, `OnMIDIProgramChange`

---

## Classes

### `unreal.FoundMIDIDevice`
Inherits: `StructBase` | Header: `MIDIDeviceManager.h`

Found MIDIDevice

**Properties** (7):
  - `can_receive_from`: `bool` [Read-Only] — [Read-Only] True if the device supports sending events to us (bool)
  - `can_send_to`: `bool` [Read-Only] — [Read-Only] True if the device supports receiving events from us (bool)
  - `device_id`: `int` [Read-Only] — [Read-Only] The unique ID of this MIDI device (int32)
  - `device_name`: `str` [Read-Only] — [Read-Only] The name of this device.  This name comes from the MIDI hardware, and might not be uniqu...
  - `is_already_in_use`: `bool` [Read-Only] — [Read-Only] Whether the device is already in use.  You might not want to create a controller for dev...
  - `is_default_input_device`: `bool` [Read-Only] — [Read-Only] True if this is the default MIDI device for input on this system (bool)
  - `is_default_output_device`: `bool` [Read-Only] — [Read-Only] True if this is the default MIDI device for output on this system (bool)

### `unreal.MIDIDeviceInfo`
Inherits: `StructBase` | Header: `MIDIDeviceManager.h`

MIDIDevice Info

**Properties** (4):
  - `device_id`: `int` [Read-Only] — [Read-Only] The unique ID of this MIDI device (int32)
  - `device_name`: `str` [Read-Only] — [Read-Only] The name of this device.  This name comes from the MIDI hardware, any might not be uniqu...
  - `is_already_in_use`: `bool` [Read-Only] — [Read-Only] Whether the device is already in use.  You might not want to create a controller for dev...
  - `is_default_device`: `bool` [Read-Only] — [Read-Only] True if this is the default MIDI device for input on this system (bool)

### `unreal.MIDIDeviceController`
Inherits: `MIDIDeviceControllerBase` | Header: `MIDIDeviceController.h`

MIDIDevice Controller

**Properties** (3):
  - `device_id`: `int` [Read-Only] — [Read-Only] The unique ID of this device (int32)
  - `device_name`: `str` [Read-Only] — [Read-Only] The name of this device.  This name comes from the MIDI hardware, any might not be uniqu...
  - `on_midi_event`: `OnMIDIEvent` — [Read-Write] Register with this to find out about incoming MIDI events from this device (OnMIDIEvent...

### `unreal.MIDIDeviceControllerBase`
Inherits: `Object` | Header: `MIDIDeviceControllerBase.h`

Common functionality for the different MIDI Device Controllers.

### `unreal.MIDIDeviceInputController`
Inherits: `MIDIDeviceControllerBase` | Header: `MIDIDeviceInputController.h`

MIDIDevice Input Controller

**Properties** (9):
  - `device_id`: `int` [Read-Only] — [Read-Only] The unique ID of this device (int32)
  - `device_name`: `str` [Read-Only] — [Read-Only] The name of this device.  This name comes from the MIDI hardware, any might not be uniqu...
  - `on_midi_aftertouch`: `OnMIDIAftertouch` — [Read-Write] Register with this to receive incoming MIDI Aftertouch events from this device (OnMIDIA...
  - `on_midi_channel_aftertouch`: `OnMIDIChannelAftertouch` — [Read-Write] Register with this to receive incoming MIDI Channel Aftertouch events from this device ...
  - `on_midi_control_change`: `OnMIDIControlChange` — [Read-Write] Register with this to receive incoming MIDI Control Change events from this device (OnM...
  - `on_midi_note_off`: `OnMIDINoteOff` — [Read-Write] Register with this to receive incoming MIDI Note Off events from this device (OnMIDINot...
  - `on_midi_note_on`: `OnMIDINoteOn` — [Read-Write] Register with this to receive incoming MIDI Note On events from this device (OnMIDINote...
  - `on_midi_pitch_bend`: `OnMIDIPitchBend` — [Read-Write] Register with this to receive incoming MIDI Pitch Bend events from this device (OnMIDIP...
  - `on_midi_program_change`: `OnMIDIProgramChange` — [Read-Write] Register with this to receive incoming MIDI Program Change events from this device (OnM...

### `unreal.MIDIDeviceManager`
Inherits: `BlueprintFunctionLibrary` | Header: `MIDIDeviceManager.h`

MIDIDevice Manager

**Methods** (10):
  - `create_midi_device_controller(device_id, midi_buffer_size = 1024)` -> `MIDIDeviceController` [classmethod] — Creates an instance of a MIDI device controller that can be used to interact with a connected MIDI device
  - `create_midi_device_input_controller(device_id, midi_buffer_size = 1024)` -> `MIDIDeviceInputController` [classmethod] — Creates an instance of a MIDI device controller that can be used to interact with a connected MIDI device
  - `create_midi_device_output_controller(device_id)` -> `MIDIDeviceOutputController` [classmethod] — Creates an instance of a MIDI output device controller that can be used to interact with a connected MIDI device
  - `find_all_midi_device_info()` [classmethod] — Enumerates all of the MIDI input and output devices and reports back useful infos such as IDs and names of those devices...
  - `find_midi_devices()` -> `Array [ FoundMIDIDevice ]` [classmethod] — Enumerates all of the connected MIDI devices and reports back with the IDs and names of those devices. This operation is...
  - `get_default_midi_input_device_id()` -> `int32` [classmethod] — Retrieves the default MIDI input device ID. Call âFind All MIDI Device Infoâ beforehand to enumerate the available i...
  - `get_default_midi_output_device_id()` -> `int32` [classmethod] — Retrieves the default MIDI output device ID. Call âFind All MIDI Device Infoâ beforehand to enumerate the available ...
  - `get_midi_input_device_id_by_name(device_name)` -> `int32` [classmethod] — Retrieves the MIDI input device ID by name. Call âFind All MIDI Device Infoâ beforehand to enumerate the available i...
  - `get_midi_output_device_id_by_name(device_name)` -> `int32` [classmethod] — Retrieves the MIDI output device ID by name. Call âFind All MIDI Device Infoâ beforehand to enumerate the available ...
  - `shut_down_all_midi_devices()` -> `None` [classmethod] — Shuts down any existing midi devices to ensure no dangling streams are left, and mark any input or output controller for...

### `unreal.MIDIDeviceOutputController`
Inherits: `MIDIDeviceControllerBase` | Header: `MIDIDeviceOutputController.h`

MIDIDevice Output Controller

**Methods** (8):
  - `send_midi_channel_aftertouch(channel, amount)` -> `None` — Sends MIDI Channel Aftertouch event type
  - `send_midi_control_change(channel, type, value)` -> `None` — Sends MIDI Control Change event type
  - `send_midi_event(event_type, channel, data1, data2)` -> `None` — Sends MIDI event raw data for an event type
  - `send_midi_note_aftertouch(channel, note, amount)` -> `None` — Sends MIDI Note Aftertouch event type
  - `send_midi_note_off(channel, note, velocity)` -> `None` — Sends MIDI Note Off event type
  - `send_midi_note_on(channel, note, velocity)` -> `None` — Sends MIDI Note On event type
  - `send_midi_pitch_bend(channel, pitch)` -> `None` — Sends MIDI Pitch Bend event type
  - `send_midi_program_change(channel, program_number)` -> `None` — Sends MIDI Program Change event type

**Properties** (2):
  - `device_id`: `int` [Read-Only] — [Read-Only] The unique ID of this device (int32)
  - `device_name`: `str` [Read-Only] — [Read-Only] The name of this device.  This name comes from the MIDI hardware, any might not be uniqu...

### `unreal.MIDIEventType`
Inherits: `EnumBase` | Header: `MIDIDeviceController.h`

EMIDIEvent Type

**Properties** (7):
  - `CHANNEL_AFTER_TOUCH`: `MIDIEventType = Ellipsis` — Channel pressure value.  This is sent after a channel button âbottoms outâ for devices that supp...
  - `CONTROL_CHANGE`: `MIDIEventType = Ellipsis` — This is sent for things like pedals when their controller state changes.  Velocity will contain the ...
  - `NOTE_AFTER_TOUCH`: `MIDIEventType = Ellipsis` — Polyphonic key pressure.  This is sent after a key âbottoms outâ for devices that support it.  V...
  - `NOTE_OFF`: `MIDIEventType = Ellipsis` — Note is released.  Velocity will contain the key pressure for devices that support that. 8
  - `NOTE_ON`: `MIDIEventType = Ellipsis` — Note is pressed down.  Velocity will contain the key pressure for devices that support that. 9
  - `PITCH_BEND`: `MIDIEventType = Ellipsis` — For devices with levers or wheels, this indicates a change of state.  The data is interpreted a bit ...
  - `PROGRAM_CHANGE`: `MIDIEventType = Ellipsis` — This is sent for some devices that support changing patches.  Velocity is usually ignored 12

### `unreal.OnMIDIAftertouch`
Inherits: `MulticastDelegateBase` | Header: `MIDIDeviceInputController.h`

Callback function for received MIDI Aftertouch event

### `unreal.OnMIDIChannelAftertouch`
Inherits: `MulticastDelegateBase` | Header: `MIDIDeviceInputController.h`

Callback function for received MIDI Channel Aftertouch event

### `unreal.OnMIDIControlChange`
Inherits: `MulticastDelegateBase` | Header: `MIDIDeviceInputController.h`

Callback function for received MIDI Control Change event

### `unreal.OnMIDIEvent`
Inherits: `MulticastDelegateBase` | Header: `MIDIDeviceController.h`

Callback function for received MIDI events

### `unreal.OnMIDINoteOff`
Inherits: `MulticastDelegateBase` | Header: `MIDIDeviceInputController.h`

Callback function for received MIDI Note Off event

### `unreal.OnMIDINoteOn`
Inherits: `MulticastDelegateBase` | Header: `MIDIDeviceInputController.h`

Callback function for received MIDI Note On event

### `unreal.OnMIDIPitchBend`
Inherits: `MulticastDelegateBase` | Header: `MIDIDeviceInputController.h`

Callback function for received MIDI Pitch Bend event

### `unreal.OnMIDIProgramChange`
Inherits: `MulticastDelegateBase` | Header: `MIDIDeviceInputController.h`

Callback function for received MIDI Program Change event
