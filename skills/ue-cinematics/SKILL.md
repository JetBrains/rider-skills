---
name: ue:cinematics
description: "Use when user asks to create level sequences, add camera cuts, keyframe properties, set up cinematics, configure movie render queue, create cutscenes, or automate Sequencer workflows. DO NOT TRIGGER for animation Blueprints (use ue:animation), material effects (use ue:material), placing actors without sequencing (use ue:editor), or C++ code (use ue:coder)."
context: fork
agent: general-purpose
allowed-tools: Read, Glob, Grep, Bash, Write, Edit
argument-hint: "[cinematic/sequencer task description]"
---

See [Reference Image Handling](../_shared/reference-image-handling.md)

## Knowledge Retrieval

Before answering:
1. Resolve the `unrealengine` library in Context7 (see `../_shared/context7-protocol.md`)
2. Fetch the section relevant to this query
3. Merge with local knowledge files — Context7 wins on version-specific details, local knowledge wins on workflow/patterns

# UE Cinematics Skill

Automate Unreal Engine cinematics workflows: Level Sequencer, camera systems, Movie Render Queue, and Python-driven automation.

## Checklist

Call `TaskCreate` for each item below before starting, then mark each `in_progress` / `completed` as you go:

1. **Plan shots** — shot list, duration, camera count, audio needs
2. **Create sequences** — master Level Sequence and shot subsequences
3. **Build and keyframe** — cameras, actor transforms, audio tracks, event tracks
4. **Save** — save master Level Sequence and all shot subsequences to disk
5. **Render** — configure Movie Render Queue, test render, final render
6. **Code review** — dispatch `ue:code-review` subagent (see `../_shared/post-task.md`); fix all Critical and Important issues before proceeding

---

## CRITICAL -- Mistakes That Waste Hours

These are the top pitfalls. Violating any of them leads to silent failures, broken renders, or lost work.

1. **Sequencer bindings are by LABEL not by reference.** If you rename an actor in the World Outliner after binding it to a Sequencer track, the track loses its reference. Always finalize actor names before creating sequences, or rebind after renaming.

2. **Camera cuts track must be ABOVE other tracks.** Rendering order in Sequencer is top-to-bottom. If the Camera Cuts track is below other tracks, the viewport may not switch cameras at the correct frame during playback and rendering. Always keep Camera Cuts as the first (topmost) track.

3. **Subsequences inherit parent's time dilation.** When you nest a subsequence inside a master sequence, the child inherits the parent's play rate and time dilation. A parent at 0.5x with a child at 0.5x results in 0.25x effective speed. Always account for compounding time scaling.

4. **Movie Render Queue is NOT the same as Sequencer Render.** The legacy "Render Movie" button in Sequencer produces lower-quality output. Movie Render Queue (MRQ) is the production-quality pipeline with proper anti-aliasing, high-resolution tiling, and multi-pass support. Always use MRQ for final output.

5. **Spawnable vs Possessable: wrong choice = missing actors.** Spawnables are self-contained within the sequence and are created/destroyed by the sequence itself. Possessables reference existing level actors and require those actors to exist at runtime. Use Spawnables for cinematic-only actors (cameras, props). Use Possessables for gameplay actors that persist outside the cinematic.

6. **Event tracks fire at the FRAME they are placed, not interpolated.** Unlike property tracks that interpolate between keyframes, event tracks fire their bound event exactly on the frame where the key is placed. There is no blending or easing. If your event does not fire, check that playback actually hits that exact frame (especially at non-standard frame rates).

7. **Audio tracks need the audio asset imported first.** You cannot reference external audio files directly from a Sequencer audio track. The audio must be imported into the Content Browser as a USoundWave or USoundCue first. Forgetting this step results in silent tracks with no error.

8. **Master sequence and shot system is required for complex cinematics.** Do not put an entire cutscene into a single Level Sequence. Use the master sequence (shot system) to organize shots as subsequences. This enables per-shot camera work, independent editing, shot reordering, and team collaboration without merge conflicts.

---

## When to Delegate to This Skill

- Creating or editing Level Sequences
- Setting up camera cuts and camera rigs
- Keyframing actor transforms, properties, or material parameters via Sequencer
- Configuring Movie Render Queue jobs and render passes
- Building master sequence / shot pipelines
- Automating Sequencer workflows with Python
- Setting up cinematic lighting sequences
- Creating runtime cinematics with LevelSequencePlayer

## When NOT to Delegate

- **Animation Blueprints, montages, blend spaces** -- use `ue:animation`
- **Material creation and shader graphs** -- use `ue:material`
- **Placing actors in the level without sequencing** -- use `ue:editor`
- **C++ class creation** -- use `ue:coder`
- **Building or packaging** -- use `ue:builder`
- **General AI behavior trees** -- use `ue:ai`

---

## Python Automation via ue:console

All Sequencer operations can be scripted using Unreal's Python API and executed through **/ue:console**. Common patterns:

### Creating a Level Sequence

```python
import unreal

# Create a new Level Sequence asset
asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
factory = unreal.LevelSequenceFactoryNew()
sequence = asset_tools.create_asset("CinematicShot01", "/Game/Cinematics", None, factory)
```

### Adding Tracks and Keyframes

```python
import unreal

# Load sequence
sequence = unreal.load_asset("/Game/Cinematics/CinematicShot01")

# Add a camera cut track
camera_cut_track = sequence.add_master_track(unreal.MovieSceneCameraCutTrack)

# Bind an actor
world = unreal.EditorLevelLibrary.get_editor_world()
actors = unreal.GameplayStatics.get_all_actors_of_class(world, unreal.CameraActor)
if actors:
    binding = sequence.add_possessable(actors[0])
```

### Configuring Movie Render Queue

```python
import unreal

subsystem = unreal.get_editor_subsystem(unreal.MoviePipelineQueueSubsystem)
queue = subsystem.get_queue()
job = queue.allocate_new_job(unreal.MoviePipelineExecutorJob)
job.sequence = unreal.SoftObjectPath("/Game/Cinematics/MasterSequence")
job.map = unreal.SoftObjectPath("/Game/Maps/CinematicLevel")
```

### Running a Render

```python
import unreal

subsystem = unreal.get_editor_subsystem(unreal.MoviePipelineQueueSubsystem)
executor = unreal.MoviePipelinePIEExecutor()
subsystem.render_queue_with_executor(executor)
```

---

## Knowledge Files

| File | Contents |
|------|----------|
| `knowledge/sequencer.md` | Sequencer fundamentals: tracks, keyframing, bindings, time management, Python API, runtime playback |
| `knowledge/camera-system.md` | Camera actors, camera cuts, rigs (rail/crane), shake, DoF, focal length, VCam, best practices |
| `knowledge/rendering.md` | Movie Render Queue config, render passes, output formats, burn-ins, CLI rendering, performance tips |

---

## Workflow Checklist

When creating a cinematic from scratch, follow this order:

1. **Plan shots** -- List camera angles and durations before opening Sequencer
2. **Create master sequence** -- Use the shot system for multi-shot cinematics
3. **Place and name actors** -- Finalize names before binding (Rule 1)
4. **Create shot subsequences** -- One Level Sequence per shot
5. **Add Camera Cuts track first** -- Keep it topmost (Rule 2)
6. **Set up cameras** -- CineCamera actors with proper lens settings
7. **Keyframe transforms and properties** -- Use appropriate interpolation modes
8. **Add audio tracks** -- Import audio assets first (Rule 7)
9. **Add event tracks** -- Place on exact frames needed (Rule 6)
10. **Preview in editor** -- Use Play in Editor with cinematic mode
11. **Configure MRQ** -- Set up render passes and output (Rule 4)
12. **Test render a frame range** -- Validate quality before full render
13. **Full render** -- Execute via MRQ with final settings

---

## Common Sequencer Python API Classes

| Class | Purpose |
|-------|---------|
| `unreal.LevelSequence` | The sequence asset itself |
| `unreal.MovieSceneTrack` | Base class for all tracks |
| `unreal.MovieSceneCameraCutTrack` | Camera switching track |
| `unreal.MovieSceneAudioTrack` | Audio playback track |
| `unreal.MovieSceneEventTrack` | Event dispatch track |
| `unreal.MovieSceneSubTrack` | Subsequence embedding |
| `unreal.MovieSceneFadeTrack` | Screen fade in/out |
| `unreal.LevelSequencePlayer` | Runtime playback controller |
| `unreal.MoviePipelineQueueSubsystem` | MRQ job management |
| `unreal.MoviePipelineExecutorJob` | Single MRQ render job |
| `unreal.MoviePipelinePIEExecutor` | PIE-based render executor |
