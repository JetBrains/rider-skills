# UE Cinematics — Sequencer, Camera, Movie Render Queue

## Checklist

1. **Plan shots** — shot list, duration, camera count, audio needs
2. **Create sequences** — master Level Sequence and shot subsequences
3. **Build and keyframe** — cameras, actor transforms, audio tracks, event tracks
4. **Save** — save master Level Sequence and all shot subsequences
5. **Render** — configure Movie Render Queue, test render, final render
6. **Code review** — after implementation

## Critical mistakes

1. **Sequencer bindings are by LABEL, not by reference.** Renaming an actor after binding loses the reference. Finalize names before creating sequences.
2. **Camera Cuts track must be ABOVE all other tracks.** Keep it topmost — rendering order is top-to-bottom.
3. **Subsequences inherit parent's time dilation.** Parent 0.5× + child 0.5× = 0.25× effective. Account for compounding.
4. **Movie Render Queue ≠ Sequencer's "Render Movie".** Always use MRQ for production output.
5. **Spawnables vs Possessables.** Spawnables: created/destroyed by the sequence (cinematic-only actors). Possessables: reference existing level actors (gameplay actors).
6. **Event tracks fire on the exact frame placed** — no interpolation or easing.
7. **Audio tracks require imported assets.** External files cannot be referenced directly — import as `USoundWave`/`USoundCue` first.
8. **Use the master sequence + shot system** for complex cinematics. One Level Sequence per shot.

## Python automation via editor Python

All operations are scriptable via `ue_execute_python`.

```python
import unreal

# Create a Level Sequence
asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
sequence = asset_tools.create_asset("CinematicShot01", "/Game/Cinematics", None,
                                     unreal.LevelSequenceFactoryNew())

# Add a Camera Cuts track
camera_cut_track = sequence.add_master_track(unreal.MovieSceneCameraCutTrack)

# Configure Movie Render Queue
subsystem = unreal.get_editor_subsystem(unreal.MoviePipelineQueueSubsystem)
queue = subsystem.get_queue()
job = queue.allocate_new_job(unreal.MoviePipelineExecutorJob)
job.sequence = unreal.SoftObjectPath("/Game/Cinematics/MasterSequence")
job.map = unreal.SoftObjectPath("/Game/Maps/CinematicLevel")

# Render
executor = unreal.MoviePipelinePIEExecutor()
subsystem.render_queue_with_executor(executor)
```

## Key Sequencer Python API classes

| Class | Purpose |
|-------|---------|
| `unreal.LevelSequence` | Sequence asset |
| `unreal.MovieSceneCameraCutTrack` | Camera switching |
| `unreal.MovieSceneAudioTrack` | Audio playback |
| `unreal.MovieSceneSubTrack` | Subsequence embedding |
| `unreal.LevelSequencePlayer` | Runtime playback controller |
| `unreal.MoviePipelineQueueSubsystem` | MRQ job management |
| `unreal.MoviePipelinePIEExecutor` | PIE-based render executor |

## Knowledge files (in `../ue-cinematics/knowledge/`)

| File | Covers |
|------|--------|
| `sequencer.md` | Sequencer fundamentals, tracks, keyframing, Python API, runtime playback |
| `camera-system.md` | Camera actors, rigs, shake, DoF, focal length, VCam |
| `rendering.md` | MRQ config, render passes, output formats, CLI rendering |

---

## MCP tools

| Tool | Purpose | Scenario |
|------|---------|----------|
| `ue_status` | Confirm editor connected; get PIE state | Before any Python execution or PIE-based render; must be `connected = true` |
| `ue_execute_python` | Create / modify sequences and MRQ jobs | All Sequencer automation: add tracks, keyframe transforms, configure MRQ job, trigger render |
| `ue_play` | Start / stop PIE | Trigger a `MoviePipelinePIEExecutor`-based render; required for PIE render mode |
| `ue_get_logs` | Stream render and sequencer log output | `category="LogMovieRenderPipeline"` for MRQ progress; `minVerbosity="Warning"` to catch failures |
| `search_assets` | Find Level Sequence or cinematic map assets | Resolve `/Game/...` package path before scripting a sequence |
| `get_asset_properties` | Read sequence CDO defaults | Inspect duration, frame rate, output resolution without opening the editor |
| `take_screenshot` | Capture a still frame from the viewport | Quick visual check of camera framing before committing a full MRQ render |
| `viewport_camera` | Position the editor camera for a shot | Frame a subject — `focus_on_actor` on an actor, then `take_screenshot { kind:"viewport" }` |
