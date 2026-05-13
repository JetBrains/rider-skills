# Camera System and Cinematography

Comprehensive reference for Unreal Engine's camera system as it relates to cinematics, including camera actors, rigs, shake, depth of field, and best practices.

---

## Camera Actors

### ACameraActor

The base camera actor. Contains a `UCameraComponent` that defines the view.

Properties:
- **Field of View**: Horizontal FOV in degrees (default 90)
- **Aspect Ratio**: Width/height ratio
- **Near/Far Clip Planes**: Rendering distance bounds
- **Post Process Settings**: Per-camera post-processing overrides

### ACineCameraActor

A specialized camera actor designed for cinematic production. Extends ACameraActor with film-industry concepts.

Key properties:
- **Filmback**: Sensor size presets (Super 35mm, Full Frame, etc.)
- **Lens Settings**: Focal length, aperture (f-stop), focus distance
- **Focus Settings**: Manual, tracking, or disabled auto-focus
- **Current Aperture**: Controls depth of field bokeh intensity
- **Current Focal Length**: Millimeter focal length (not FOV degrees)
- **Look At Tracking**: Built-in actor tracking for focus and framing

Always prefer `ACineCameraActor` over `ACameraActor` for cinematics. It provides physically accurate lens simulation.

```python
import unreal

# Spawn a CineCamera with specific lens settings
camera = unreal.EditorLevelLibrary.spawn_actor_from_class(
    unreal.CineCameraActor,
    unreal.Vector(0, -500, 200),
    unreal.Rotator(-10, 90, 0)
)

# Configure the cine camera component
cine_comp = camera.get_cine_camera_component()
cine_comp.set_editor_property("current_focal_length", 35.0)
cine_comp.set_editor_property("current_aperture", 2.8)

# Set filmback to Super 35mm
filmback = unreal.CameraFilmbackSettings()
filmback.sensor_width = 24.89
filmback.sensor_height = 18.67
cine_comp.set_editor_property("filmback", filmback)
```

---

## Camera Components

### UCameraComponent

The core component providing a view into the scene.

Key functions:
- `SetFieldOfView(float)`: Set FOV in degrees
- `SetAspectRatio(float)`: Set aspect ratio
- `SetPostProcessBlendWeight(float)`: Blend post-process settings
- `GetCameraView()`: Returns current view parameters

### UCineCameraComponent

Extends UCameraComponent with physical camera simulation:

| Property | Type | Description |
|----------|------|-------------|
| `CurrentFocalLength` | float | Lens focal length in mm |
| `CurrentAperture` | float | F-stop number |
| `FocusSettings` | struct | Focus mode and distance |
| `Filmback` | struct | Sensor dimensions |
| `LensSettings` | struct | Min/max focal length, aperture |
| `CurrentHorizontalFOV` | float | Computed from focal length + sensor |

The horizontal FOV is automatically calculated from focal length and sensor width:
```
FOV = 2 * atan(SensorWidth / (2 * FocalLength))
```

---

## Camera Cuts Track

The Camera Cuts track in Sequencer controls which camera is active during playback.

### Setup

1. Add a Camera Cuts track to your Level Sequence (must be topmost)
2. Add sections for each camera switch
3. Assign a camera binding to each section

### Blending Between Cameras

Camera Cut sections support blend-in and blend-out:
- **Blend Time**: Duration in seconds for the camera transition
- **Blend Function**: Linear, cubic, ease-in, ease-out
- **Lock Previous Camera**: During blend, both cameras must remain valid

```python
import unreal

sequence = unreal.load_asset("/Game/Cinematics/MasterSequence")
camera_cut_track = None

for track in sequence.get_master_tracks():
    if isinstance(track, unreal.MovieSceneCameraCutTrack):
        camera_cut_track = track
        break

# Add camera cut sections
section1 = camera_cut_track.add_section()
section1.set_range(0, 90)  # frames 0-90 use Camera A

section2 = camera_cut_track.add_section()
section2.set_range(90, 180)  # frames 90-180 use Camera B
```

### Runtime Camera Cuts

When playing a sequence at runtime, camera cuts automatically take over the player's camera. Use `bHidePlayer` on the Level Sequence Actor to hide the player pawn during cinematics.

After the sequence ends:
- If `bRestoreState` is true, the camera reverts to the player camera
- If false, the last cinematic camera remains active (must be handled manually)

---

## Camera Rigs

### Camera Rig Rail (ACameraRigRail)

A spline-based camera mount for dolly/tracking shots.

Components:
- **Rail Spline**: A configurable spline the camera follows
- **Position on Rail**: 0.0 to 1.0 float keyframeable in Sequencer
- **Lock Orientation**: Camera faces along the spline tangent
- **Mount Component**: Attach any camera to ride the rail

Setup steps:
1. Place a Camera Rig Rail actor in the level
2. Edit the spline points to define the dolly path
3. Attach a CineCamera as a child of the rail's mount
4. In Sequencer, keyframe "Current Position on Rail" (0.0 to 1.0)

```python
import unreal

# Create a rail rig
rail = unreal.EditorLevelLibrary.spawn_actor_from_class(
    unreal.CameraRigRail,
    unreal.Vector(0, 0, 100),
    unreal.Rotator(0, 0, 0)
)

# Create a camera and attach it
camera = unreal.EditorLevelLibrary.spawn_actor_from_class(
    unreal.CineCameraActor,
    unreal.Vector(0, 0, 100),
    unreal.Rotator(0, 0, 0)
)

# Attachment is typically done in editor or via Blueprint
# Rail position is animated in Sequencer from 0.0 to 1.0
```

### Camera Rig Crane (ACameraRigCrane)

A boom/crane arm mount for vertical sweeping shots.

Properties:
- **Crane Pitch**: Vertical angle of the arm (-90 to 90)
- **Crane Yaw**: Horizontal rotation of the arm
- **Crane Arm Length**: Length of the boom in cm
- **Lock Mount Pitch/Yaw**: Keep camera level as crane moves

Setup steps:
1. Place a Camera Rig Crane actor
2. Attach a CineCamera to the crane's mount point
3. Keyframe Crane Pitch, Yaw, and Arm Length in Sequencer

Crane shots are ideal for:
- Reveal shots (crane up from ground to show environment)
- Overhead establishing shots
- Dramatic downward angles
- Following action vertically

---

## Camera Shake

### Legacy Camera Shake (UCameraShake / UMatineeCameraShake)

The original shake system using oscillation parameters. Still functional but deprecated in UE5.

```cpp
// Legacy: simple trauma-based shake
UCameraShakeBase* ShakeClass = UMyShake::StaticClass();
GetWorld()->GetFirstPlayerController()->ClientStartCameraShake(ShakeClass, Scale);
```

### Camera Shake Base (UCameraShakeBase)

The modern camera shake system in UE5. Two built-in implementations:

#### Perlin Noise Shake (UPerlinNoiseCameraShakePattern)

Smooth, organic shaking using Perlin noise.

Parameters:
- **Location Amplitude**: XYZ shake magnitude in cm
- **Rotation Amplitude**: Pitch/Yaw/Roll shake magnitude in degrees
- **Frequency**: Speed of shake oscillation per axis
- **Duration**: How long the shake lasts (0 = infinite)
- **Blend In/Out Time**: Smooth ramping

#### Wave Oscillator Shake (UWaveOscillatorCameraShakePattern)

Sine-wave-based shaking for rhythmic effects.

Parameters:
- **Location/Rotation Amplitude**: Same as Perlin
- **Frequency**: Wave frequency per axis
- **Initial Offset Type**: Random or zero start phase

### Using Camera Shake in Sequencer

1. Add a Camera Shake Source Component to an actor
2. Or trigger shakes via Event tracks calling `ClientStartCameraShake`
3. Shake applies additively on top of animated camera transforms
4. Use Shake Scale in Sequencer to keyframe shake intensity

### Choosing Between Shake Types

| Type | Best For |
|------|----------|
| Perlin Noise | Handheld feel, breathing, subtle movement |
| Wave Oscillator | Impacts, explosions, rhythmic vibration |
| Custom (C++) | Complex procedural shake with game state input |

---

## Depth of Field

### Overview

Depth of field (DoF) simulates real camera lens blur, keeping the subject sharp while blurring foreground and background.

### Settings on CineCameraComponent

| Setting | Effect |
|---------|--------|
| `CurrentAperture` | F-stop: lower = shallower DoF (more blur) |
| `CurrentFocalLength` | Longer lens = shallower DoF |
| `FocusSettings.ManualFocusDistance` | Distance to the sharp plane |
| `FocusSettings.FocusMethod` | Manual, Tracking, or Disable |

### Focus Methods

- **Manual**: Set focus distance explicitly. Keyframe in Sequencer for rack focus.
- **Tracking**: Focus on a specific actor. Set `FocusSettings.TrackingFocusSettings.ActorToTrack`.
- **Disable**: No DoF computation.

### Rack Focus

Shifting focus from one subject to another during a shot:

1. Set Focus Method to Manual
2. Keyframe `ManualFocusDistance` at frame A = distance to Subject 1
3. Keyframe `ManualFocusDistance` at frame B = distance to Subject 2
4. Use cubic interpolation for smooth focus pull

```python
import unreal

# Set up rack focus on a cine camera in Sequencer
sequence = unreal.load_asset("/Game/Cinematics/Shot01")
binding = sequence.find_binding_by_name("CineCamera")

# Add a float track for focus distance
tracks = binding.get_tracks()
# Find the focus distance property track or add one
# Keyframe: frame 0 = 200cm, frame 60 = 800cm
```

### DoF Quality Settings

For cinematic rendering (via MRQ or console variables):

```
r.DepthOfFieldQuality=4           // Maximum quality
r.DOF.Gather.RingCount=5          // More bokeh samples
r.DOF.Kernel.MaxForegroundRadius=0.025
r.DOF.Kernel.MaxBackgroundRadius=0.025
```

---

## Focal Length and Aperture

### Common Focal Lengths

| Focal Length | Type | Typical Use |
|-------------|------|-------------|
| 12-20mm | Ultra Wide | Environments, establishing shots, distortion effects |
| 24-35mm | Wide | Master shots, walk-and-talk, interiors |
| 50mm | Normal | Close to human eye, dialogue, neutral perspective |
| 85-135mm | Telephoto | Close-ups, portraits, shallow DoF |
| 200mm+ | Super Telephoto | Compression, surveillance look, sports |

### Aperture (F-Stop) Guide

| F-Stop | DoF | Light | Use Case |
|--------|-----|-------|----------|
| f/1.4 - f/2 | Very shallow | Maximum | Dreamy close-ups, night scenes |
| f/2.8 - f/4 | Moderate | Good | Character shots, interviews |
| f/5.6 - f/8 | Deep | Moderate | Group shots, medium views |
| f/11 - f/16 | Very deep | Less | Landscapes, establishing shots |
| f/22 | Maximum | Minimum | Deep focus, everything sharp |

### Sensor Size Impact

Larger sensors produce shallower DoF at the same focal length and aperture:

| Filmback Preset | Sensor Width | Look |
|----------------|-------------|------|
| Super 8mm | 5.79mm | Very deep DoF, small-format look |
| Super 16mm | 12.52mm | Indie film look |
| Super 35mm | 24.89mm | Standard cinema (most common) |
| Full Frame 35mm | 36.0mm | Shallower DoF, common in modern cinema |
| IMAX | 70.41mm | Very shallow DoF, immersive |

---

## Look-At Tracking

### Built-in Look-At on CineCamera

The CineCameraActor has built-in look-at tracking:

```python
import unreal

camera = unreal.EditorLevelLibrary.get_all_level_actors_of_class(unreal.CineCameraActor)[0]
cine_comp = camera.get_cine_camera_component()

# Enable look-at tracking
focus = cine_comp.get_editor_property("focus_settings")
focus.tracking_focus_settings.actor_to_track = target_actor
focus.focus_method = unreal.CameraFocusMethod.TRACKING
cine_comp.set_editor_property("focus_settings", focus)
```

### Sequencer Look-At Section

In Sequencer, you can add a "Look At" track to any camera binding:
1. Select the camera binding in Sequencer
2. Add Track > Transform > Look At
3. Set the target actor
4. The camera will orient toward the target while respecting keyframed position

### Constraint-Based Tracking

For more control, use the Constraint system:
- **Look At Constraint**: Orient toward target with axis locking
- **Attach Constraint**: Follow target's transform
- **Path Constraint**: Follow a spline path while looking at target

---

## Camera Animation Patterns

### Dolly Shot

Camera moves toward or away from the subject on a straight line or rail.
- Use Camera Rig Rail with position keyframed from 0.0 to 1.0
- Or keyframe camera transform directly along a vector

### Truck Shot

Camera moves laterally (side to side) while maintaining facing direction.
- Keyframe camera location X or Y (depending on orientation)
- Keep rotation constant

### Pedestal Shot

Camera moves vertically (up or down) while maintaining horizontal facing.
- Keyframe camera Z location only
- Or use Crane Rig with pitch locked

### Orbit Shot

Camera circles around a subject.
- Parent camera to an empty actor at the subject's position
- Rotate the parent actor, camera orbits automatically
- Or use a circular spline on a Camera Rig Rail

### Steadicam / Handheld

Simulated handheld camera with organic movement.
- Apply Perlin Noise Camera Shake on top of keyframed motion
- Low frequency (0.5-2 Hz), small amplitude
- Add subtle rotation oscillation for realism

### Whip Pan

Fast horizontal rotation to transition between subjects.
- Keyframe rotation with high velocity in the middle
- Use motion blur to sell the speed
- Often paired with a match cut

### Dutch Angle

Tilted camera roll for dramatic or unsettling effect.
- Keyframe camera roll (typically 15-45 degrees)
- Can be animated to tilt in and back during dramatic moments

---

## Virtual Camera (VCam)

### Overview

The Virtual Camera system allows previewing cinematic shots using physical devices (tablets, phones) or game controllers as camera input.

### Setup

1. Enable the Virtual Camera plugin in Project Settings
2. Place a `VirtualCameraActor` in the level
3. Connect via the LiveLink app on a mobile device or use the in-editor VCam

### Features

- **Real-time preview**: See the cinematic composition on a secondary device
- **Physical input**: Move the device to control camera position and rotation
- **Record to Sequencer**: Capture VCam movement as Sequencer keyframes
- **Focus control**: Touch to focus on screen
- **Lens presets**: Switch focal lengths via the VCam UI

### Recording Workflow

1. Set up VCam actor with LiveLink connection
2. Open Sequencer and arm the VCam track for recording
3. Press Record in Sequencer
4. Move the VCam device to perform the camera motion
5. Stop recording -- keyframes are baked into the Sequencer track
6. Clean up curves (smooth, reduce keys) in the Curve Editor

---

## Cinematic Camera Best Practices

### Pre-Production

1. **Storyboard first**: Plan camera angles and movement before implementing
2. **Use reference**: Import real-world camera data (focal lengths, sensor sizes) for realism
3. **Standardize lens kit**: Pick 3-5 focal lengths and stick to them for visual consistency

### Shot Composition

1. **Rule of thirds**: Place subjects at intersection points of a 3x3 grid
2. **Leading lines**: Use environment geometry to guide the eye
3. **Headroom**: Leave appropriate space above characters
4. **Lead space**: Leave space in the direction a character is looking/moving
5. **180-degree rule**: Keep cameras on one side of the action axis for spatial coherence

### Technical

1. **Always use CineCameraActor** for cinematics, not plain CameraActor
2. **Set filmback first** -- it affects all other lens calculations
3. **Match frame rates** -- Sequence display rate should match your target output
4. **Avoid extreme FOV** -- Wide angles distort; use dolly zoom for dramatic effect
5. **Use camera rigs** -- Rails and cranes give cleaner motion than manual keyframing
6. **Preview at target resolution** -- Composition changes at different aspect ratios
7. **Set near clip plane appropriately** -- Too close causes z-fighting; too far clips foreground

### Performance in Editor

1. **Disable real-time for non-active viewports** when previewing cinematics
2. **Use Sequencer's Playback menu** to set evaluation to "Frame Locked" for accurate preview
3. **Lower viewport resolution** during layout, switch to full resolution for final review
4. **Disable expensive post-processing** during layout (enable for final review and render)
