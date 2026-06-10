# UE Python API — RivermaxMedia Module

**13 types** from the `RivermaxMedia` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `RivermaxAncStream`, `RivermaxStream`, `RivermaxVideoStream`, `RivermaxCustomTimeStep`, `RivermaxMediaCapture`, `RivermaxMediaOutput`, `RivermaxMediaSource`, `RivermaxTimecodeProvider`, `RivermaxFrameLockingMode`, `RivermaxMediaAlignmentMode`, `RivermaxMediaOutputPixelFormat`, `RivermaxMediaSourcePixelFormat`, `RivermaxPlayerMode_DEPRECATED`

---

## Classes

### `unreal.RivermaxAncStream`
Inherits: `RivermaxStream` | Header: `RivermaxMediaOutput.h`

All settings required to initialize ANC (2110-40) stream.

### `unreal.RivermaxStream`
Inherits: `StructBase` | Header: `RivermaxMediaOutput.h`

Basic settings for all 2110 stream types .

**Properties** (3):
  - `interface_address`: `str` — [Read-Write] Network card interface to use to send data
Wildcards are supported to match against an ...
  - `port`: `int` — [Read-Write] Port to use for this output (int32)
  - `stream_address`: `str` — [Read-Write] Address of the stream. Can be multicast, i.e. 228.1.1.1) (str)

### `unreal.RivermaxVideoStream`
Inherits: `RivermaxStream` | Header: `RivermaxMediaOutput.h`

All settings required to initialize Video (2110-20) stream.

**Properties** (4):
  - `frame_rate`: `FrameRate` — [Read-Write] Frame rate of this output stream (FrameRate)
  - `override_resolution`: `bool` — [Read-Write] If false, use the size provided by the source. If true, a specific resolution will be u...
  - `pixel_format`: `RivermaxMediaOutputPixelFormat` — [Read-Write] Pixel format for this output stream (RivermaxMediaOutputPixelFormat)
  - `resolution`: `IntPoint` — [Read-Write] Resolution of this output stream (IntPoint)

### `unreal.RivermaxCustomTimeStep`
Inherits: `GenlockedCustomTimeStep` | Header: `RivermaxCustomTimeStep.h`

Genlock using PTP time from a rivermax card

### `unreal.RivermaxMediaCapture`
Inherits: `MediaCapture` | Header: `RivermaxMediaCapture.h`

Output Media for Rivermax streams.

### `unreal.RivermaxMediaOutput`
Inherits: `MediaOutput` | Header: `RivermaxMediaOutput.h`

Output information for a Rivermax media capture.

**Properties** (11):
  - `alignment_mode`: `RivermaxMediaAlignmentMode` — [Read-Write] Used by frame scheduler to know how to align the output (RivermaxMediaAlignmentMode)
  - `do_continuous_output`: `bool` — [Read-Write] Whether to produce a continuous output stream repeating last frame if no new frames pro...
  - `frame_locking_mode`: `RivermaxFrameLockingMode` — [Read-Write] For alignment point mode, controls whether we stall engine before capturing if there ar...
  - `frame_rate`: `FrameRate` — [Read-Write] Frame rate of this output stream (FrameRate)
  - `interface_address`: `str` — [Read-Write] Network card interface to use to send data
Wildcards are supported to match against an ...
  - `override_resolution`: `bool` — [Read-Write] If false, use the default source buffer size. If true, a specific resolution will be us...
  - `pixel_format`: `RivermaxMediaOutputPixelFormat` — [Read-Write] Pixel format for this output stream (RivermaxMediaOutputPixelFormat)
  - `port`: `int` — [Read-Write] Port to use for this output (int32)
  - `presentation_queue_size`: `int` — [Read-Write] Number of frames that can be queued / used in output queue. Frame being sent counts for...
  - `resolution`: `IntPoint` — [Read-Write] Resolution of this output stream (IntPoint)
  - `stream_address`: `str` — [Read-Write] Address of the stream. Can be multicast, i.e. 228.1.1.1) (str)

### `unreal.RivermaxMediaSource`
Inherits: `CaptureCardMediaSource` | Header: `RivermaxMediaSource.h`

Media source for Rivermax streams.

**Properties** (11):
  - `frame_rate`: `FrameRate` — [Read-Write] Incoming stream video frame rate (FrameRate)
  - `interface_address`: `str` — [Read-Write] Network card interface to use to receive data
Wildcards are supported to match against ...
  - `is_srgb_input`: `bool` — [Read-Write]
deprecated: Use Override Source Encoding instead (bool)
  - `override_resolution`: `bool` — [Read-Write] If false, use the default source buffer size. If true, a specific resolution will be us...
  - `pixel_format`: `RivermaxMediaSourcePixelFormat` — [Read-Write] Incoming stream pixel format (RivermaxMediaSourcePixelFormat)
  - `player_mode`: `RivermaxPlayerMode_DEPRECATED` — [Read-Write]
deprecated: Use Sample Evaluation Type and Framelock instead (RivermaxPlayerMode_DEPREC...
  - `port`: `int` — [Read-Write] Port used by the sender to send its stream (int32)
  - `resolution`: `IntPoint` — [Read-Write] Incoming stream video resolution (IntPoint)
  - `stream_address`: `str` — [Read-Write] IP address where incoming stream is coming from (str)
  - `use_gpu_direct`: `bool` — [Read-Write] Whether to use GPUDirect if available (Memcopy from NIC to GPU directly bypassing syste...
  - `use_zero_latency`: `bool` — [Read-Write]
deprecated: Use Frame Delay under Synchronization category (bool)

### `unreal.RivermaxTimecodeProvider`
Inherits: `GenlockedTimecodeProvider` | Header: `RivermaxTimecodeProvider.h`

Timecode provider based on time returned by Rivermax GetTime API Rivermax clock is configured using Project Setting. If using multiple interfaces, make sure to configure the interface address you wish...

### `unreal.RivermaxFrameLockingMode`
Inherits: `EnumBase` | Header: `RivermaxMediaOutput.h`

Controls how rivermax capture behaves when there are no buffers available to capture into

**Properties** (2):
  - `BLOCK_ON_RESERVATION`: `RivermaxFrameLockingMode = Ellipsis` — Blocks RHI thread prior to capture the current frame if no space is available. 1
  - `FREE_RUN`: `RivermaxFrameLockingMode = Ellipsis` — If no frame available, continue 0

### `unreal.RivermaxMediaAlignmentMode`
Inherits: `EnumBase` | Header: `RivermaxMediaOutput.h`

ERivermax Media Alignment Mode

**Properties** (2):
  - `ALIGNMENT_POINT`: `RivermaxMediaAlignmentMode = Ellipsis` — Uses NVIDIA Rivermax clock to calculate alignment points based on ST2059 0
  - `FRAME_CREATION`: `RivermaxMediaAlignmentMode = Ellipsis` — Aligns frame scheduling with frame creation not going faster than frame interval
In its current shap...

### `unreal.RivermaxMediaOutputPixelFormat`
Inherits: `EnumBase` | Header: `RivermaxMediaOutput.h`

ERivermax Media Output Pixel Format

**Properties** (6):
  - `PF_10BIT_RGB`: `RivermaxMediaOutputPixelFormat = Ellipsis` — 3
  - `PF_10BIT_YUV422`: `RivermaxMediaOutputPixelFormat = Ellipsis` — 1
  - `PF_12BIT_RGB`: `RivermaxMediaOutputPixelFormat = Ellipsis` — 4
  - `PF_8BIT_RGB`: `RivermaxMediaOutputPixelFormat = Ellipsis` — 2
  - `PF_8BIT_YUV422`: `RivermaxMediaOutputPixelFormat = Ellipsis` — 0
  - `PF_FLOAT16_RGB`: `RivermaxMediaOutputPixelFormat = Ellipsis` — 5

### `unreal.RivermaxMediaSourcePixelFormat`
Inherits: `EnumBase` | Header: `RivermaxMediaSource.h`

Native data format.

**Properties** (6):
  - `RGB_10BIT`: `RivermaxMediaSourcePixelFormat = Ellipsis` — 3
  - `RGB_12BIT`: `RivermaxMediaSourcePixelFormat = Ellipsis` — 4
  - `RGB_16BIT_FLOAT`: `RivermaxMediaSourcePixelFormat = Ellipsis` — 5
  - `RGB_8BIT`: `RivermaxMediaSourcePixelFormat = Ellipsis` — 2
  - `YUV422_10BIT`: `RivermaxMediaSourcePixelFormat = Ellipsis` — 1
  - `YUV422_8BIT`: `RivermaxMediaSourcePixelFormat = Ellipsis` — 0

### `unreal.RivermaxPlayerMode_DEPRECATED`
Inherits: `EnumBase` | Header: `RivermaxMediaSource.h`

Player mode to be used. Deprecated in UE5.5

**Properties** (2):
  - `FRAMELOCK`: `RivermaxPlayerMode_DEPRECATED = Ellipsis` — Uses latest sample available 1
  - `LATEST`: `RivermaxPlayerMode_DEPRECATED = Ellipsis` — 0
