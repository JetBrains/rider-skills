# UE Python API — AudioCapture Module

**7 types** from the `AudioCapture` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AudioCaptureDeviceInfo`, `AudioInputDeviceInfo`, `AudioCapture`, `AudioCaptureComponent`, `AudioCaptureFunctionLibrary`, `AudioCaptureLibrary`, `OnAudioInputDevicesObtained`

---

## Classes

### `unreal.AudioCaptureDeviceInfo`
Inherits: `StructBase` | Header: `AudioCapture.h`

Struct defining the time synth global quantization settings

**Properties** (3):
  - `device_name`: `Name` [Read-Only] — [Read-Only] The name of the audio capture device (Name)
  - `num_input_channels`: `int` [Read-Only] — [Read-Only] The number of input channels (int32)
  - `sample_rate`: `int` [Read-Only] — [Read-Only] The sample rate of the audio capture device (int32)

### `unreal.AudioInputDeviceInfo`
Inherits: `StructBase` | Header: `AudioCaptureBlueprintLibrary.h`

Platform audio input device info, in a Blueprint-readable format

**Properties** (5):
  - `device_id`: `str` [Read-Only] — [Read-Only] ID of the device. (str)
  - `device_name`: `str` [Read-Only] — [Read-Only] The name of the audio device (str)
  - `input_channels`: `int` [Read-Only] — [Read-Only] The number of channels supported by the audio device (int32)
  - `preferred_sample_rate`: `int` [Read-Only] — [Read-Only] The preferred sample rate of the audio device (int32)
  - `supports_hardware_aec`: `bool` [Read-Only] — [Read-Only] Whether or not the device supports Acoustic Echo Canceling (bool)

### `unreal.AudioCapture`
Inherits: `AudioGenerator` | Header: `AudioCapture.h`

Class which opens up a handle to an audio capture device. Allows other objects to get audio buffers from the capture device.

**Methods** (4):
  - `get_audio_capture_device_info()` -> `AudioCaptureDeviceInfo or None` — Returns the audio capture device info
  - `is_capturing_audio()` -> `bool` — Returns true if capturing audio
  - `start_capturing_audio()` -> `None` — Starts capturing audio
  - `stop_capturing_audio()` -> `None` — Stops capturing audio

### `unreal.AudioCaptureComponent`
Inherits: `SynthComponent` | Header: `AudioCaptureComponent.h`

Audio Capture Component

**Properties** (1):
  - `jitter_latency_frames`: `int` — [Read-Write] Induced latency in audio frames to use to account for jitter between mic capture hardwa...

### `unreal.AudioCaptureFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AudioCapture.h`

Audio Capture Function Library

**Methods** (1):
  - `create_audio_capture()` -> `AudioCapture` [classmethod] — Create Audio Capture

### `unreal.AudioCaptureLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AudioCaptureBlueprintLibrary.h`

Audio Capture Blueprint Library

**Methods** (2):
  - `conv_audio_input_device_info_to_string(info)` -> `str` [classmethod] — Returns the device info in a human readable format
  - `get_available_audio_input_devices(world_context_object, on_obtain_devices_event)` -> `None` [classmethod] — Gets information about all audio output devices available in the system

### `unreal.OnAudioInputDevicesObtained`
Inherits: `DelegateBase` | Header: `AudioCaptureBlueprintLibrary.h`

Called when a list of all available audio devices is retrieved
