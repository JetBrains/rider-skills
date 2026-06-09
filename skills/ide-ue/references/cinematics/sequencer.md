# Sequencer Fundamentals

Comprehensive reference for Unreal Engine's Level Sequencer system -- the non-linear editor for real-time cinematics, gameplay sequences, and runtime events.

---

## Level Sequence: Asset and Actor

### The Asset (ULevelSequence)

A Level Sequence is a standalone asset (`.uasset`) stored in the Content Browser. It contains:

- **Tracks**: Ordered list of animation tracks
- **Bindings**: References from tracks to actors (possessable) or spawned templates (spawnable)
- **Sections**: Time ranges within tracks that hold keyframe data
- **Playback settings**: Start/end frame, play rate, loop mode

A sequence can be opened in the Sequencer editor panel for visual editing.

### The Actor (ALevelSequenceActor)

To play a Level Sequence in a level, you place a Level Sequence Actor. This actor:

- References the Level Sequence asset
- Controls playback (auto-play, loop, play rate)
- Manages binding overrides (redirect tracks to different actors)
- Provides a LevelSequencePlayer for runtime control

```cpp
// C++ example: spawning a sequence actor at runtime
ALevelSequenceActor* SeqActor = GetWorld()->SpawnActor<ALevelSequenceActor>();
SeqActor->SetSequence(LoadObject<ULevelSequence>(nullptr, TEXT("/Game/Cinematics/Intro")));
SeqActor->InitializePlayer();
```

---

## Track Types

### Transform Track

Animates an actor's world transform (location, rotation, scale). Each component (X, Y, Z for location; Roll, Pitch, Yaw for rotation; X, Y, Z for scale) gets its own channel with independent keyframes.

- Supports relative and additive modes
- Can be locked to specific axes
- Transform tracks on components animate in component-local space

### Property Track

Animates any exposed UPROPERTY on an actor or component. The property must be marked `BlueprintReadWrite` or `Interp` for Sequencer visibility.

Common animated properties:
- Light intensity and color
- Material scalar/vector parameters (via dynamic material instances)
- Visibility and hidden-in-game flags
- Custom gameplay variables

```python
# Python: add a float property track
import unreal

sequence = unreal.load_asset("/Game/Cinematics/Shot01")
binding = sequence.find_binding_by_name("PointLight1")
track = binding.add_track(unreal.MovieSceneFloatTrack)
track.set_property_name_and_path("Intensity", "Intensity")
section = track.add_section()
section.set_range(0, 150)  # frames
```

### Event Track

Fires Blueprint events or calls functions at specific frames. Events are not interpolated -- they trigger exactly on the frame where the key is placed.

Event types:
- **Blueprint events**: Call a custom event on the bound actor's Blueprint
- **Repeater**: Fires the event every frame within a section range
- **Director Blueprint**: A special Blueprint class associated with the sequence for complex event logic

Use cases: trigger particles, start audio cues, change game state, signal gameplay systems.

### Audio Track

Plays imported audio assets (USoundWave or USoundCue) synchronized with the sequence timeline.

Features:
- Volume and pitch curves over time
- Subtitle support
- Attenuation settings for spatialized audio
- Multiple audio sections on the same track for sequential clips

Important: Audio must be imported into the project first. External file references are not supported.

### Fade Track

Controls a full-screen fade overlay. The fade track animates a float value from 0.0 (no fade) to 1.0 (fully faded). Color is configurable.

Typical usage:
- Fade from black at the start of a cinematic
- Fade to black at the end
- Transition between shots with cross-fades (requires manual setup)

### Camera Cut Track

Switches the active camera during sequence playback. Each section on the Camera Cut track references a camera binding.

Rules:
- Only one Camera Cut track per sequence
- Keep it as the topmost track for correct rendering order
- Each section specifies which camera is active for that time range
- Gaps between sections revert to the default player camera
- Blend time between sections creates smooth camera transitions

### Subsequence Track

Embeds another Level Sequence inside the current one. The embedded sequence plays within the time range of the subsequence section.

Features:
- Time remapping: stretch or compress the child sequence
- Hierarchical organization: master sequence contains shot subsequences
- Override bindings: redirect child sequence tracks to different actors
- Independent editing: open child sequences without affecting the parent

### Skeletal Animation Track

Plays animation assets on skeletal mesh actors. Supports:
- Animation sequences (single clips)
- Animation montages
- Blend weights for layered animation
- Slot-based animation control

### Material Parameter Track

Animates material parameters on actors with dynamic material instances:
- Scalar parameters (float values)
- Vector parameters (colors, directions)
- Texture parameters (swap textures over time)

Requires the material to use parameter nodes, and the actor to have a dynamic material instance.

### Visibility Track

Toggles actor visibility on/off at specific frames. Unlike animating the "Hidden" property, the visibility track is a simple boolean toggle optimized for Sequencer.

### Level Visibility Track

Shows or hides entire sub-levels during sequence playback. Useful for:
- Swapping level geometry between shots
- Loading cinematic-specific levels
- Managing streaming levels during cutscenes

---

## Keyframing

### Key Types (Interpolation Modes)

| Mode | Behavior | Use Case |
|------|----------|----------|
| **Linear** | Straight-line interpolation between keys | Mechanical motion, constant speed |
| **Cubic (Auto)** | Smooth bezier curve with automatic tangents | Natural motion, default choice |
| **Cubic (User)** | Smooth bezier with user-defined tangent handles | Fine-tuned easing |
| **Cubic (Break)** | Independent in/out tangent handles | Sharp direction changes |
| **Constant (Step)** | Holds value until next key, then snaps | Boolean-like switches, hard cuts |

### Tangent Modes

Tangent handles control the shape of the interpolation curve at each keyframe:

- **Auto**: Engine calculates smooth tangents based on neighboring keys. Best for natural motion.
- **User**: Manually adjustable tangent handles. Drag to shape the curve precisely.
- **Break**: In-tangent and out-tangent are independent. Allows sharp changes in curve direction at a keyframe.
- **Flat**: Tangent is horizontal (zero slope). Creates ease-in/ease-out at the key.
- **Weighted**: Tangent handle length affects the curve shape, giving more control over timing.

### Keyframe Operations (Python)

```python
import unreal

# Access a section's channels
sequence = unreal.load_asset("/Game/Cinematics/Shot01")
binding = sequence.find_binding_by_name("CameraActor")
tracks = binding.get_tracks()

for track in tracks:
    sections = track.get_sections()
    for section in sections:
        channels = section.get_channels()
        for channel in channels:
            # Add a key at frame 30 with value 500.0
            channel.add_key(
                unreal.FrameNumber(30),
                500.0,
                interpolation=unreal.MovieSceneKeyInterpolation.LINEAR
            )
```

---

## Possessables vs Spawnables

### Possessables

A possessable binding references an actor that already exists in the level. The sequence "possesses" (takes control of) the actor during playback.

Characteristics:
- Actor must exist in the level before playback
- If the actor is deleted or renamed, the binding breaks
- Actor persists after sequence ends (retains final animated state or reverts)
- Suitable for gameplay actors that have a life outside the cinematic

Creating a possessable:
```python
import unreal

sequence = unreal.load_asset("/Game/Cinematics/Shot01")
world = unreal.EditorLevelLibrary.get_editor_world()
actor = unreal.EditorLevelLibrary.get_all_level_actors()[0]  # pick your actor

binding = sequence.add_possessable(actor)
```

### Spawnables

A spawnable stores an actor template inside the sequence asset. The sequence spawns the actor when playback begins and destroys it when playback ends.

Characteristics:
- Self-contained: no dependency on level actors
- Portable: sequence works in any level
- Actor does not exist outside playback
- Best for cinematic-only cameras, props, VFX

Creating a spawnable:
```python
import unreal

sequence = unreal.load_asset("/Game/Cinematics/Shot01")
# Convert an existing possessable to spawnable, or:
camera_class = unreal.CineCameraActor
# Spawnables are typically created in the Sequencer UI via right-click > "Convert to Spawnable"
```

### Decision Guide

| Scenario | Use |
|----------|-----|
| Camera used only in this cinematic | Spawnable |
| Player character during cutscene | Possessable |
| Cinematic-only prop (drops, breaks) | Spawnable |
| Door that gameplay code also controls | Possessable |
| VFX actor (explosion, debris) | Spawnable |
| NPC that exists in the world | Possessable |

---

## Master Sequence and Shot System

The shot system organizes complex cinematics into manageable pieces.

### Structure

```
MasterSequence (Level Sequence)
  |-- Camera Cuts Track
  |-- Shot01 (Subsequence)
  |     |-- Camera, Actor tracks, Audio
  |-- Shot02 (Subsequence)
  |     |-- Camera, Actor tracks, Audio
  |-- Shot03 (Subsequence)
        |-- Camera, Actor tracks, Audio
```

### Creating a Master Sequence

1. Create a new Level Sequence: "MasterSequence"
2. Add a Subscenes track (or add shots via the Shot track)
3. Create child sequences for each shot
4. Add Camera Cuts at the master level or per shot

### Benefits

- **Non-destructive editing**: Rearrange shots by moving subsequence sections
- **Per-shot cameras**: Each shot has its own camera setup
- **Team collaboration**: Different artists work on different shots
- **Reusability**: Reuse shots across cinematics
- **Independent timing**: Adjust shot duration without re-keyframing

### Shot Naming Convention

Use a consistent naming scheme for production:

```
/Game/Cinematics/
  MasterSequence.uasset
  Shots/
    Shot_0010.uasset
    Shot_0020.uasset
    Shot_0030.uasset
```

Number by tens to allow inserting shots between existing ones.

---

## Sections and Channels

### Sections (UMovieSceneSection)

A section represents a time range on a track. Tracks can have multiple sections (non-overlapping or overlapping with blend weights).

Section properties:
- **Range**: Start and end frame
- **Pre/Post Roll**: Extra frames before/after the section for blending
- **Blend Type**: Absolute, Additive, or Relative
- **Easing**: Ease-in and ease-out curves for section blending

### Channels (FMovieSceneChannel)

Channels are the actual data containers within sections. Each animatable component gets its own channel.

Channel types:
- `FMovieSceneFloatChannel`: Float values (most common)
- `FMovieSceneBoolChannel`: Boolean on/off
- `FMovieSceneIntegerChannel`: Integer values
- `FMovieSceneByteChannel`: Byte/enum values
- `FMovieSceneStringChannel`: String values
- `FMovieSceneObjectPathChannel`: Asset references
- `FMovieSceneEventChannel`: Event keys

---

## Time Management

### Display Rate vs Tick Resolution

- **Display Rate**: The frame rate shown in the Sequencer UI (e.g., 24fps, 30fps). This is for artist convenience.
- **Tick Resolution**: Internal precision (default: 24000 ticks per second). Allows sub-frame accuracy regardless of display rate.

### Play Rate

Controls the speed of sequence playback:

| Play Rate | Effect |
|-----------|--------|
| 1.0 | Normal speed |
| 0.5 | Half speed (slow motion) |
| 2.0 | Double speed |
| -1.0 | Reverse playback |

```python
import unreal

# Set play rate on a LevelSequenceActor
seq_actor = unreal.EditorLevelLibrary.get_all_level_actors_of_class(unreal.LevelSequenceActor)[0]
seq_actor.get_sequence_player().set_play_rate(0.5)
```

### Time Dilation

Applies a time multiplier to the entire sequence or specific sections. Unlike play rate, time dilation can be keyframed over the sequence duration.

Warning: Subsequences inherit parent time dilation. A parent at 0.5x containing a child at 0.5x results in 0.25x effective playback.

### Looping

Sequences support three loop modes:
- **No Loop**: Plays once and stops
- **Loop Indefinitely**: Repeats forever
- **Loop N Times**: Repeats a specified number of times

```python
import unreal

player = seq_actor.get_sequence_player()
# Loop settings are configured via FMovieSceneSequencePlaybackSettings
# Typically set in the Details panel or via Blueprint
```

### Frame Locking

For deterministic playback (important for rendering), enable frame-locked evaluation. This ensures every frame is evaluated even if the system cannot maintain real-time performance.

---

## Sequencer Python API for Automation

### Core Module

```python
import unreal

# Access the Sequencer subsystem
sequence_tools = unreal.LevelSequenceEditorBlueprintLibrary
```

### Creating a Complete Sequence Programmatically

```python
import unreal

def create_cinematic_sequence(name, path, duration_seconds=10.0, fps=30.0):
    """Create a new Level Sequence with basic setup."""

    # Create the asset
    asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
    factory = unreal.LevelSequenceFactoryNew()
    sequence = asset_tools.create_asset(name, path, None, factory)

    if not sequence:
        unreal.log_error(f"Failed to create sequence: {path}/{name}")
        return None

    # Set frame rate
    display_rate = unreal.FrameRate(numerator=int(fps), denominator=1)
    sequence.set_display_rate(display_rate)

    # Set playback range
    total_frames = int(duration_seconds * fps)
    sequence.set_playback_start(0)
    sequence.set_playback_end(total_frames)

    # Add Camera Cut track (always first)
    camera_cut_track = sequence.add_master_track(unreal.MovieSceneCameraCutTrack)

    # Add a Fade track
    fade_track = sequence.add_master_track(unreal.MovieSceneFadeTrack)
    fade_section = fade_track.add_section()
    fade_section.set_range(0, total_frames)

    unreal.log(f"Created sequence: {path}/{name} ({total_frames} frames at {fps}fps)")
    return sequence
```

### Binding Actors to Tracks

```python
import unreal

def bind_actor_to_sequence(sequence, actor, add_transform=True):
    """Bind a level actor to the sequence and optionally add a transform track."""

    binding = sequence.add_possessable(actor)

    if add_transform:
        transform_track = binding.add_track(unreal.MovieScene3DTransformTrack)
        section = transform_track.add_section()
        section.set_range(
            sequence.get_playback_start(),
            sequence.get_playback_end()
        )

    return binding


def add_camera_spawnable(sequence):
    """Add a spawnable CineCamera to the sequence."""

    # Create a template camera
    camera = unreal.EditorLevelLibrary.spawn_actor_from_class(
        unreal.CineCameraActor,
        unreal.Vector(0, 0, 200),
        unreal.Rotator(0, 0, 0)
    )

    binding = sequence.add_spawnable_from_instance(camera)

    # Clean up the template from the level
    camera.destroy_actor()

    return binding
```

### Adding Keyframes Programmatically

```python
import unreal

def add_transform_keys(sequence, binding, key_data):
    """
    Add transform keyframes to a binding.
    key_data: list of (frame, location, rotation) tuples
    """

    tracks = binding.get_tracks()
    transform_track = None
    for t in tracks:
        if isinstance(t, unreal.MovieScene3DTransformTrack):
            transform_track = t
            break

    if not transform_track:
        return

    sections = transform_track.get_sections()
    if not sections:
        return

    section = sections[0]
    channels = section.get_channels()

    # Channels order: Loc.X, Loc.Y, Loc.Z, Rot.X, Rot.Y, Rot.Z, Scale.X, Scale.Y, Scale.Z
    for frame, location, rotation in key_data:
        frame_num = unreal.FrameNumber(frame)

        # Location
        channels[0].add_key(frame_num, location.x, unreal.MovieSceneKeyInterpolation.CUBIC)
        channels[1].add_key(frame_num, location.y, unreal.MovieSceneKeyInterpolation.CUBIC)
        channels[2].add_key(frame_num, location.z, unreal.MovieSceneKeyInterpolation.CUBIC)

        # Rotation
        channels[3].add_key(frame_num, rotation.roll, unreal.MovieSceneKeyInterpolation.CUBIC)
        channels[4].add_key(frame_num, rotation.pitch, unreal.MovieSceneKeyInterpolation.CUBIC)
        channels[5].add_key(frame_num, rotation.yaw, unreal.MovieSceneKeyInterpolation.CUBIC)
```

---

## Playing Sequences at Runtime

### LevelSequencePlayer

The `ULevelSequencePlayer` is the runtime controller for playing sequences in-game.

```cpp
// C++: Create and play a sequence
ULevelSequence* Sequence = LoadObject<ULevelSequence>(nullptr, TEXT("/Game/Cinematics/Intro"));
ALevelSequenceActor* OutActor;
ULevelSequencePlayer* Player = ULevelSequencePlayer::CreateLevelSequencePlayer(
    GetWorld(),
    Sequence,
    FMovieSceneSequencePlaybackSettings(),
    OutActor
);
Player->Play();
```

### Blueprint Usage

1. Place a Level Sequence Actor in the level
2. Set the "Level Sequence" property to your sequence asset
3. Call `Play`, `Pause`, `Stop`, `GoToFrame` on the player

### Runtime Events

The player broadcasts delegates for runtime integration:
- `OnPlay`: Sequence started
- `OnPause`: Sequence paused
- `OnStop`: Sequence stopped
- `OnFinished`: Sequence reached end
- `OnCameraCut`: Camera changed (passes new camera component)

```cpp
Player->OnFinished.AddDynamic(this, &AMyActor::OnCinematicFinished);
```

### Playback Settings

```cpp
FMovieSceneSequencePlaybackSettings Settings;
Settings.bAutoPlay = true;
Settings.bPauseAtEnd = true;
Settings.LoopCount.Value = 0;  // 0 = no loop, -1 = infinite
Settings.PlayRate = 1.0f;
Settings.StartTime = 0.0f;
Settings.bRestoreState = true;  // Revert actor states after playback
```

### Binding Overrides at Runtime

Redirect sequence tracks to different actors at runtime:

```cpp
// Override "HeroCharacter" binding to use the actual player pawn
FMovieSceneObjectBindingID BindingID = /* get from sequence */;
ALevelSequenceActor* SeqActor = /* your sequence actor */;
SeqActor->SetBinding(BindingID, {PlayerPawn}, true);
```

This allows reusable sequences where the "main character" track always targets the current player pawn.

---

## Performance Considerations

- **Evaluate only what is needed**: Disable tracks that are not visible or relevant
- **Use spawn register**: Spawnables with deferred spawn reduce initial cost
- **Pre-warm caches**: Call `PreloadAllAnimSequences()` before playback for skeletal animations
- **LOD considerations**: Cinematic LOD settings may differ from gameplay; use LOD override tracks
- **Avoid per-frame Blueprint events**: Event tracks that fire every frame are expensive; use property tracks for continuous values
- **Subsequence culling**: Master sequences only evaluate active subsequences, saving cost on long timelines

---

## MCP tools

| Tool | Purpose | Scenario |
|------|---------|----------|
| `ue_execute_python` | Create or modify sequences programmatically | Build a full Level Sequence, add tracks, set keyframes without opening the editor UI |
| `search_assets` | Find existing Level Sequence assets | `search_assets(query="MasterSequence", baseClass="LevelSequence")` to locate the correct asset before edits |
| `ue_play` | Preview sequence playback in PIE | `mode="viewport"` — validate timing, transitions, and actor bindings at runtime speed |
| `take_screenshot` | Capture a specific frame for review | Position to a frame via Python, then `take_screenshot(kind="viewport")` for a quick composition check |
| `viewport_camera` | Frame a specific shot | `focus_on_actor` on the CineCamera actor before taking a screenshot |
| `ue_get_logs` | Check for sequencer warnings | `category="LogMovieScene"`, `minVerbosity="Warning"` — catch missing bindings or track evaluation errors |
