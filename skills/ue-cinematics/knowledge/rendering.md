# Movie Render Queue and Rendering Output

Comprehensive reference for rendering cinematics from Unreal Engine, covering Movie Render Queue configuration, render passes, output formats, command-line rendering, and performance optimization.

---

## Movie Render Queue vs Legacy Render

### Legacy Sequencer Render (Deprecated for Production)

The "Render Movie" button inside Sequencer provides a quick preview render. Limitations:

- No multi-pass support (beauty only)
- Limited anti-aliasing options
- No high-resolution tiling
- No burn-in overlays
- No console variable overrides
- No EXR output with AOV layers
- Adequate for quick previews, not for final output

### Movie Render Queue (MRQ)

The production-quality rendering pipeline introduced in UE4.25+. MRQ is the standard for all final cinematic output.

Advantages over legacy:
- Multi-pass rendering (beauty, depth, motion vectors, object ID, custom stencils)
- Temporal and spatial anti-aliasing accumulation
- High-resolution tiling for output beyond GPU limits
- Burn-in overlays with metadata
- Per-shot console variable overrides
- Deferred rendering pipeline integration
- Warm-up frames for temporal effects
- Command-line batch rendering support

### Enabling MRQ

1. Edit > Plugins > "Movie Render Queue" (enable if not already)
2. Also enable "Movie Render Queue Additional Render Passes" for depth, motion vectors, etc.
3. Restart editor if prompted

---

## MRQ Configuration

### Creating a Render Job

```python
import unreal

subsystem = unreal.get_editor_subsystem(unreal.MoviePipelineQueueSubsystem)
queue = subsystem.get_queue()

# Create a new job
job = queue.allocate_new_job(unreal.MoviePipelineExecutorJob)
job.sequence = unreal.SoftObjectPath("/Game/Cinematics/MasterSequence")
job.map = unreal.SoftObjectPath("/Game/Maps/CinematicLevel")
job.job_name = "FinalRender_v01"
```

### Preset Configuration

MRQ uses presets (UMoviePipelineMasterConfig) to define render settings. Create presets in the Content Browser or configure per-job.

Key setting categories:
- **Output**: Resolution, format, file naming
- **Anti-Aliasing**: Spatial and temporal sample counts
- **Console Variables**: Per-render engine overrides
- **Warm Up**: Frames to simulate before capturing
- **High Resolution**: Tile count for super-resolution output

### Resolution Settings

```python
import unreal

# Access the output setting on a job's config
config = job.get_configuration()
output_setting = config.find_or_add_setting_by_class(unreal.MoviePipelineOutputSetting)
output_setting.output_resolution = unreal.IntPoint(3840, 2160)  # 4K
output_setting.use_custom_frame_rate = True
output_setting.output_frame_rate = unreal.FrameRate(24, 1)
```

### Common Resolution Presets

| Name | Resolution | Aspect Ratio | Use Case |
|------|-----------|--------------|----------|
| HD (1080p) | 1920 x 1080 | 16:9 | Standard delivery |
| 2K (QHD) | 2560 x 1440 | 16:9 | High-quality preview |
| UHD (4K) | 3840 x 2160 | 16:9 | Production delivery |
| DCI 4K | 4096 x 2160 | ~1.9:1 | Cinema standard |
| 8K | 7680 x 4320 | 16:9 | Future-proofing, VR |
| Cinematic 2.39:1 | 3840 x 1607 | 2.39:1 | Widescreen cinema |

---

## Render Passes

### Beauty Pass (Final Color)

The default rendered image with all lighting, materials, and post-processing applied.

Settings:
- Render pass: `FinalImage`
- Includes all post-processing (bloom, DoF, color grading)
- Output as PNG, EXR, or JPEG

### Depth Pass

Per-pixel depth information (distance from camera).

- Pass type: `SceneDepth` or `WorldDepth`
- Output as 32-bit EXR for compositing
- Useful for: fog in comp, relighting, z-depth compositing

### Motion Vectors

Per-pixel velocity information for motion blur in compositing.

- Pass type: `MotionVectors`
- Output as 16-bit or 32-bit EXR
- Useful for: post-process motion blur, retiming, optical flow

### Object ID / Cryptomatte

Per-object identification masks for compositing isolation.

- Pass type: `ObjectID` or Cryptomatte
- Each object or material gets a unique color/hash
- Useful for: isolating objects in comp for color correction, replacement

### Custom Stencil

User-defined stencil layers for selective masking.

Setup:
1. Set Custom Stencil Value on actors (0-255)
2. Enable Custom Depth pass in project settings
3. Render the Stencil pass from MRQ
4. Use as a matte in compositing

### World Normal

Per-pixel surface normal directions in world space.

- Output as 16-bit or 32-bit EXR
- Useful for: relighting in comp, surface-aware effects

### Base Color (Unlit Albedo)

Material base color without any lighting applied.

- Shows raw material colors
- Useful for: texture QA, relighting workflows

### Ambient Occlusion

Screen-space or ray-traced ambient occlusion as an isolated pass.

- Useful for: enhancing contact shadows in compositing

### Configuring Multiple Passes

```python
import unreal

config = job.get_configuration()

# Add deferred rendering pass for additional AOVs
deferred = config.find_or_add_setting_by_class(unreal.MoviePipelineDeferredPassBase)

# Add individual passes
# Each pass type is a separate setting class
# Beauty is always included by default
```

---

## Anti-Aliasing Settings for Rendering

### Spatial Anti-Aliasing

Renders multiple sub-pixel samples per frame and accumulates them. Higher counts reduce aliasing but increase render time linearly.

| Spatial Samples | Quality | Render Time Multiplier |
|----------------|---------|----------------------|
| 1 | Baseline (game quality) | 1x |
| 4 | Good (removes most jaggies) | 4x |
| 8 | High (near-perfect edges) | 8x |
| 16 | Maximum (diminishing returns) | 16x |

### Temporal Anti-Aliasing

Accumulates multiple frames with sub-frame time offsets. Reduces temporal artifacts like flickering specular and thin geometry shimmer.

| Temporal Samples | Quality | Render Time Multiplier |
|-----------------|---------|----------------------|
| 1 | Baseline | 1x |
| 4 | Good temporal stability | 4x |
| 8 | Excellent (recommended for production) | 8x |
| 16 | Maximum | 16x |

### Combined Samples

Total samples per output frame = Spatial x Temporal.

Example: 4 spatial x 8 temporal = 32 accumulated samples per frame. Render time is 32x baseline.

Production recommendation: Start with spatial=1, temporal=8. Increase spatial only if edge aliasing is visible.

### Override Anti-Aliasing Method

```python
import unreal

config = job.get_configuration()
aa_setting = config.find_or_add_setting_by_class(unreal.MoviePipelineAntiAliasingSetting)
aa_setting.spatial_sample_count = 4
aa_setting.temporal_sample_count = 8
aa_setting.override_anti_aliasing = True
aa_setting.anti_aliasing_method = unreal.AntiAliasingMethod.AAM_NONE  # Disable engine AA, use accumulation
aa_setting.render_warm_up_count = 32  # Warm-up frames for temporal effects
```

---

## Console Variables for Cinematic Quality

MRQ allows per-render console variable overrides. These do not affect your project settings permanently.

### Essential Cinematic CVars

```
# Shadow quality
r.Shadow.MaxResolution=4096
r.Shadow.MaxCSMResolution=4096
r.Shadow.RadiusThreshold=0.01

# Lighting
r.LightMaxDrawDistanceScale=10.0

# Reflections
r.SSR.Quality=4
r.SSR.MaxRoughness=1.0

# Global Illumination
r.Lumen.TraceMeshSDFs=1

# Screen percentage (supersampling)
r.ScreenPercentage=200

# Depth of field
r.DepthOfFieldQuality=4
r.DOF.Gather.RingCount=5

# Motion blur
r.MotionBlurQuality=4
r.MotionBlur.Amount=0.5

# Volumetrics
r.VolumetricFog.GridSizeZ=128
r.VolumetricFog.GridPixelSize=4

# Disable game-specific optimizations
r.Streaming.PoolSize=0
r.Streaming.LimitPoolSizeToVRAM=0
r.Streaming.MipBias=0
```

### Setting CVars in MRQ Config

```python
import unreal

config = job.get_configuration()
cvar_setting = config.find_or_add_setting_by_class(unreal.MoviePipelineConsoleVariableSetting)

# Add console variables
cvar_setting.console_variables = {
    "r.Shadow.MaxResolution": 4096,
    "r.ScreenPercentage": 200,
    "r.DepthOfFieldQuality": 4,
}
```

---

## Output Formats

### EXR (OpenEXR)

The standard for production rendering.

Properties:
- 16-bit or 32-bit float per channel
- Lossless or lossy compression (ZIP, PIZ, DWAA)
- Supports multi-layer (all passes in one file)
- Linear color space (no gamma baked in)
- Metadata embedding

Best for: Compositing, color grading, VFX pipelines.

Compression options:
| Method | Size | Speed | Quality |
|--------|------|-------|---------|
| None | Largest | Fastest | Lossless |
| ZIP | Small | Slow | Lossless |
| PIZ | Small | Medium | Lossless |
| DWAA | Smallest | Fast | Lossy (high quality) |

### PNG

Lossless 8-bit or 16-bit per channel.

Properties:
- Lossless compression
- Alpha channel support
- sRGB color space (gamma baked in)
- Widely compatible

Best for: Frame sequences for video encoding, UI overlays, quick reviews.

### JPEG

Lossy 8-bit per channel.

Properties:
- Small file size
- No alpha channel
- Quality parameter (1-100)
- sRGB color space

Best for: Dailies, quick previews, web delivery. Never for production masters.

### AVI (Video Container)

Direct video output from MRQ.

Properties:
- Uncompressed or codec-compressed
- Single file output (not frame sequence)
- Audio embedding supported
- Platform-dependent codecs

Best for: Quick review videos. For production, render frame sequences (EXR/PNG) and encode separately.

### Apple ProRes (macOS)

High-quality video codec available on macOS builds.

- ProRes 422 HQ for delivery
- ProRes 4444 for compositing with alpha
- Widely used in film/TV post-production

### Choosing Output Format

| Workflow Stage | Format | Bit Depth | Reason |
|---------------|--------|-----------|--------|
| Production master | EXR (32-bit) | 32-bit float | Maximum flexibility |
| Compositing delivery | EXR (16-bit) | 16-bit half | Good quality, smaller |
| Editorial review | PNG sequence | 16-bit | Lossless, compatible |
| Client dailies | JPEG or AVI | 8-bit | Small, fast |
| Final delivery | ProRes / H.264 | Varies | Client requirement |

---

## Burn-In Overlays

Burn-ins are text/image overlays rendered directly onto the output frames.

### Built-in Burn-In Fields

| Field | Content |
|-------|---------|
| `{sequence_name}` | Name of the Level Sequence |
| `{shot_name}` | Current shot name |
| `{frame_number}` | Current frame number |
| `{timecode}` | SMPTE timecode |
| `{date}` | Render date |
| `{render_pass}` | Current render pass name |
| `{camera_name}` | Active camera name |
| `{focal_length}` | Camera focal length in mm |
| `{lens}` | Full lens info string |

### Configuring Burn-Ins

1. Create a Widget Blueprint extending `MoviePipelineBurnInWidget`
2. Add Text widgets bound to the built-in fields
3. Assign the burn-in widget class in MRQ settings

```python
import unreal

config = job.get_configuration()
burnin = config.find_or_add_setting_by_class(unreal.MoviePipelineBurnInSetting)
burnin.burn_in_class = unreal.SoftClassPath("/Game/Cinematics/UI/CinematicBurnIn.CinematicBurnIn_C")
```

### Production Burn-In Best Practices

- Always include timecode and frame number for editorial reference
- Include shot name for multi-shot sequences
- Add date/version for tracking iterations
- Use semi-transparent background behind text for readability
- Keep burn-ins outside the safe action area
- Render burn-ins on a separate pass if clean plates are also needed

---

## Distributed Rendering

### Multi-Machine Rendering

For large-scale renders, MRQ supports distributing shots across multiple machines.

Architecture:
- **Coordinator**: Machine that manages the queue and assigns jobs
- **Workers**: Machines that receive and execute render jobs
- Uses `UMoviePipelineLinearExecutor` for sequential execution per worker

### Setup

1. Each worker machine needs the project synced (Perforce, Git, or shared drive)
2. Workers run Unreal in `-game` mode with MRQ executor arguments
3. Coordinator distributes shots from the queue

### Render Farm Integration

For studio render farms:
- Deadline (Thinkbox): Native MRQ integration via plugin
- Tractor (Pixar): Custom job submission scripts
- Custom: Use command-line rendering (see below)

---

## Command-Line Rendering for CI/Batch

### Basic Command-Line Render

```bash
UnrealEditor-Cmd.exe "ProjectPath/MyProject.uproject" \
  MapPath \
  -game \
  -MoviePipelineLocalExecutorClass=/Script/MovieRenderPipelineCore.MoviePipelineLinearExecutorRuntime \
  -MoviePipelineConfig="/Game/Cinematics/RenderPresets/ProductionPreset" \
  -LevelSequence="/Game/Cinematics/MasterSequence" \
  -MoviePipelineLocalExecutorClass=MoviePipelineNewProcessExecutor \
  -windowed \
  -ResX=1920 -ResY=1080 \
  -NoLoadingScreen \
  -NoSplash
```

### Headless Rendering (No GUI)

```bash
UnrealEditor-Cmd.exe "ProjectPath/MyProject.uproject" \
  /Game/Maps/CinematicLevel \
  -game \
  -RenderOffscreen \
  -MovieSceneCaptureType="/Script/MovieRenderPipelineCore.MoviePipelineLinearExecutorRuntime" \
  -NoTextureStreaming \
  -NoSound \
  -NOSPLASH \
  -UNATTENDED
```

### CI Pipeline Integration

For automated rendering in CI systems (Jenkins, GitHub Actions, etc.):

```bash
#!/bin/bash
# render_cinematic.sh - CI render script

UE_PATH="/opt/UnrealEngine/Engine/Binaries/Linux/UnrealEditor-Cmd"
PROJECT="/workspace/MyProject/MyProject.uproject"
MAP="/Game/Maps/CinematicLevel"
SEQUENCE="/Game/Cinematics/MasterSequence"
CONFIG="/Game/Cinematics/RenderPresets/CI_Preview"
OUTPUT="/workspace/renders/$(date +%Y%m%d_%H%M%S)"

$UE_PATH "$PROJECT" "$MAP" \
  -game \
  -RenderOffscreen \
  -LevelSequence="$SEQUENCE" \
  -MoviePipelineConfig="$CONFIG" \
  -MoviePipelineOutputDir="$OUTPUT" \
  -NoTextureStreaming \
  -NOSPLASH \
  -UNATTENDED \
  -log="$OUTPUT/render.log" \
  2>&1

EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
  echo "Render failed with exit code $EXIT_CODE"
  exit 1
fi

echo "Render complete: $OUTPUT"
```

### Useful Command-Line Arguments

| Argument | Effect |
|----------|--------|
| `-RenderOffscreen` | No viewport window (headless) |
| `-NoTextureStreaming` | Load all textures at full resolution |
| `-NoSound` | Disable audio (faster startup) |
| `-NOSPLASH` | Skip splash screen |
| `-UNATTENDED` | Suppress dialogs and prompts |
| `-deterministic` | Deterministic rendering (frame-locked) |
| `-usefixedtimestep` | Fixed time step for consistent results |
| `-fps=24` | Target frame rate |
| `-ForceRes` | Force custom resolution |
| `-windowed` | Run in windowed mode |

---

## Performance Tips for Faster Renders

### 1. Reduce Unnecessary Quality

For preview renders, lower these settings:
- Spatial samples: 1 (production: 4+)
- Temporal samples: 1 (production: 8+)
- Screen percentage: 100 (production: 200+)
- Shadow resolution: 1024 (production: 4096)

### 2. Optimize the Scene

- **Nanite**: Use Nanite meshes to reduce triangle bottleneck
- **Lumen**: Pre-compute what you can; Lumen is expensive per frame
- **Virtual Shadow Maps**: More consistent than traditional cascaded shadows
- **Texture streaming**: Disable during final render (`-NoTextureStreaming`) to avoid pop-in
- **Level streaming**: Pre-load all required levels before rendering starts

### 3. GPU Optimization

- Close all other GPU applications during rendering
- Use dedicated render GPUs (not display GPUs) if available
- Monitor GPU memory: MRQ with high-res tiling can exceed VRAM
- NVIDIA GPUs: Disable G-Sync during rendering

### 4. Disk I/O

- Render to SSD, not HDD (especially for EXR sequences)
- Use fast compression (DWAA for EXR) to reduce write time
- If rendering to network storage, use a local SSD cache and sync after

### 5. Warm-Up Frames

Temporal effects (TAA, SSGI, volumetric fog) need frames to converge. Set warm-up count based on:

| Effect | Minimum Warm-Up |
|--------|----------------|
| TAA only | 8 frames |
| SSGI / Lumen GI | 16-32 frames |
| Volumetric fog | 16 frames |
| Screen-space reflections | 8 frames |
| All combined | 32 frames (safe default) |

### 6. Use MRQ Presets

Create separate presets for different stages:

| Preset | Spatial | Temporal | Resolution | Format | Use |
|--------|---------|----------|------------|--------|-----|
| Preview | 1 | 1 | 1080p | JPEG | Fast dailies |
| Review | 1 | 4 | 1080p | PNG | Client review |
| Production | 4 | 8 | 4K | EXR 16-bit | Final output |
| Master | 8 | 16 | 4K+ | EXR 32-bit | Archival |

### 7. Shot-Based Rendering

Render individual shots instead of the full master sequence:
- Allows re-rendering failed or updated shots without redoing everything
- Enables parallel rendering of different shots on different machines
- Reduces memory pressure per render job

### 8. Frame Range Control

Render only the frames you need:
- Use custom frame ranges for iterating on specific sections
- Render every Nth frame for a quick motion check
- Use frame handles (extra frames at start/end) for editorial flexibility

```python
import unreal

config = job.get_configuration()
output = config.find_or_add_setting_by_class(unreal.MoviePipelineOutputSetting)
output.use_custom_playback_range = True
output.custom_start_frame = 100
output.custom_end_frame = 200
output.handle_frame_count = 10  # 10 extra frames on each end
```

### 9. Monitor and Profile

- Use `stat gpu` and `stat scenerendering` to identify bottlenecks
- Check MRQ log output for per-frame render times
- Profile with Unreal Insights for detailed GPU/CPU breakdown
- Watch for texture streaming warnings in the output log

### 10. Post-Render Workflow

After rendering frame sequences:
1. **Validate frame count**: Ensure no dropped frames
2. **Check first/last frames**: Verify warm-up was sufficient
3. **Spot-check mid-sequence**: Look for temporal artifacts
4. **Encode to video**: Use FFmpeg or DaVinci Resolve for final encoding

```bash
# FFmpeg: encode EXR sequence to ProRes 422 HQ
ffmpeg -framerate 24 -i "frame_%04d.exr" \
  -c:v prores_ks -profile:v 3 \
  -pix_fmt yuv422p10le \
  -colorspace bt709 \
  output.mov

# FFmpeg: encode PNG sequence to H.264
ffmpeg -framerate 24 -i "frame_%04d.png" \
  -c:v libx264 -crf 18 -preset slow \
  -pix_fmt yuv420p \
  output.mp4
```
