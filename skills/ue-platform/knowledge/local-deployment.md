# Local Deployment

Running packaged UE builds on the development machine.

## Quick Start — Launch Locally

After packaging (via `/ue-package`), the build is in the staging or archive directory:

```
<Project>/Saved/StagedBuilds/<Platform>/
```

### Windows

```bash
# Direct launch from staging
./Saved/StagedBuilds/Windows/GameName.exe

# Or via UAT (builds, cooks, stages, and runs)
RunUAT BuildCookRun \
  -project="Game.uproject" \
  -platform=Win64 -clientconfig=Development \
  -build -cook -stage -pak -run

# Launch with extra args
./GameName.exe -windowed -resx=1920 -resy=1080 -log
```

### macOS

```bash
# .app bundle
open ./Saved/StagedBuilds/Mac/GameName.app

# Or direct binary
./Saved/StagedBuilds/Mac/GameName.app/Contents/MacOS/GameName

# Via UAT
RunUAT BuildCookRun \
  -project="Game.uproject" \
  -platform=Mac -clientconfig=Development \
  -build -cook -stage -pak -run
```

### Linux

```bash
# Direct
chmod +x ./Saved/StagedBuilds/Linux/GameName.sh
./Saved/StagedBuilds/Linux/GameName.sh

# Via UAT
RunUAT BuildCookRun \
  -project="Game.uproject" \
  -platform=Linux -clientconfig=Development \
  -build -cook -stage -pak -run
```

## UAT -run Flag

Adding `-run` to BuildCookRun launches the game after packaging:

```bash
RunUAT BuildCookRun \
  -project="Game.uproject" \
  -platform=Win64 -clientconfig=Development \
  -build -cook -stage -pak -run \
  -cmdline="-windowed -resx=1280 -resy=720"
```

Key flags for local run:
| Flag | Description |
|------|-------------|
| `-run` | Launch game after packaging |
| `-nullrhi` | Headless (no rendering) — for testing/automation |
| `-unattended` | No user interaction prompts |
| `-cmdline="..."` | Pass args to the game executable |
| `-addcmdline="..."` | Additional args (appended) |
| `-RunTimeoutSeconds=N` | Auto-terminate after N seconds |
| `-RunAutomationTests` | Run automation tests on launch |

## Cook-on-the-Fly (No Packaging)

For the fastest local iteration without full packaging:

```bash
RunUAT BuildCookRun \
  -project="Game.uproject" \
  -platform=Win64 -clientconfig=Development \
  -build -cookonthefly -stage -run
```

This starts a cook server and streams assets on demand. No pak files, no full cook.

## Standalone Game vs PIE

| Method | Use Case | Speed |
|--------|----------|-------|
| PIE (Play in Editor) | Fastest iteration, editor features available | Instant |
| Standalone Game (editor launch) | Tests standalone behavior without packaging | Fast |
| Packaged Development | Tests real deployment pipeline, finds cook issues | Slow |
| Packaged Shipping | Final validation before release | Slowest |

Launch standalone from editor: `File > Standalone Game` or `-game` flag on the editor binary.

## Common Launch Arguments

| Argument | Description |
|----------|-------------|
| `-windowed` | Windowed mode |
| `-fullscreen` | Fullscreen mode |
| `-resx=N -resy=N` | Resolution |
| `-log` | Show log window |
| `-nosound` | Disable audio |
| `-nosplash` | Skip splash screen |
| `-benchmark` | Run benchmark mode |
| `-fps=N` | Cap frame rate |
| `-ExecCmds="stat fps,stat unit"` | Execute console commands on startup |
| `-messaging` | Enable messaging subsystem |

## Troubleshooting Local Deployment

### Missing prerequisites
Windows builds need DirectX and VC++ redistributables. Package with `-prereqs` to bundle them, or install manually:
- `Engine/Extras/Redist/en-us/UEPrereqSetup_x64.exe`

### Shader compilation stutter
First run after a new build compiles shaders on-the-fly, causing hitches. Mitigations:
- Pre-compile shaders: enable "Share Material Shader Code" in Project Settings
- Use a Shader Pipeline Cache (PSO cache)

### Crash on launch — missing DLLs
Ensure all third-party plugin DLLs are staged. Check `Binaries/<Platform>/` for required `.dll`/`.so` files.

### "No cooked data found"
The executable expects cooked content in `Content/Paks/` or alongside the binary. Verify the staging layout.
