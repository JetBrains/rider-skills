# Deployment Automation — CI/CD, Gauntlet, and Testing Pipelines

## CI/CD Pipeline for UE Deployment

### Typical Pipeline Stages

```
Source → Build → Cook → Package → Deploy → Test → Publish
```

### Jenkins / GitHub Actions / GitLab CI

All CI systems use the same UAT command-line interface:

```bash
# Full pipeline in one command
"$UE_ROOT/Engine/Build/BatchFiles/RunUAT.sh" BuildCookRun \
  -project="$PROJECT_PATH" \
  -platform=Win64 \
  -clientconfig=Shipping \
  -build -cook -stage -pak -package -archive \
  -archivedirectory="$BUILD_OUTPUT" \
  -iostore -compressed -distribution -nodebuginfo \
  -nop4 -utf8output -unattended
```

Key CI flags:
| Flag | Purpose |
|------|---------|
| `-unattended` | No interactive prompts |
| `-nop4` | Disable Perforce integration |
| `-utf8output` | Clean log encoding |
| `-buildmachine` | Optimize for CI (skip optional steps) |
| `-nosplash` | No splash screen |

### Build Farm Setup

1. **Build agents** need full UE source/install + platform SDKs
2. **Shared DDC** reduces shader compilation (biggest time saver):
   ```ini
   ; DefaultEngine.ini
   [DerivedDataBackendGraph]
   Shared=(Type=FileSystem, ReadOnly=false, Clean=false, Flush=false,
           PurgeTransient=true, DeleteUnused=true, UnusedFileAge=10,
           FoldersToClean=-1, Path=//buildserver/SharedDDC)
   ```
3. **Incremental builds** — Use `-iterate` and `-nocleanstage` for faster iterations
4. **Artifact caching** — Cache `Intermediate/`, `DerivedDataCache/` between builds

### GitHub Actions Example

```yaml
name: Package UE Game
on:
  push:
    branches: [main]

jobs:
  package:
    runs-on: [self-hosted, ue-builder]
    steps:
      - uses: actions/checkout@v4

      - name: Build and Package
        run: |
          "$UE_ROOT/Engine/Build/BatchFiles/RunUAT.sh" BuildCookRun \
            -project="${{ github.workspace }}/Game.uproject" \
            -platform=Win64 -clientconfig=Shipping \
            -build -cook -stage -pak -archive \
            -archivedirectory="${{ github.workspace }}/Build" \
            -iostore -compressed -distribution \
            -unattended -nop4 -utf8output

      - name: Upload Artifacts
        uses: actions/upload-artifact@v4
        with:
          name: game-build
          path: Build/
```

---

## Gauntlet Automated Testing

Gauntlet is UE's framework for automated testing across devices and platforms.

### What Gauntlet Does

- Deploys builds to multiple devices/platforms
- Runs automation tests
- Collects results, logs, crash dumps
- Supports parallel execution across device farms

### Running Gauntlet Tests

```bash
# Run a Gauntlet test
RunUAT RunUnreal \
  -project="Game.uproject" \
  -platform=Win64 -configuration=Development \
  -build -cook -stage -pak -deploy -run \
  -test="BootTest" \
  -unattended -nullrhi

# Run specific automation test
RunUAT BuildCookRun \
  -project="Game.uproject" \
  -platform=Win64 -clientconfig=Development \
  -build -cook -stage -pak -run \
  -RunAutomationTests \
  -addcmdline="-ExecCmds=\"Automation RunAll\""
```

### Common Gauntlet Test Types

| Test | Description |
|------|-------------|
| `BootTest` | Verify game boots without crashing |
| `EditorTest` | Run editor automation tests |
| `ScreenshotTest` | Capture and compare screenshots |
| `PIETest` | Run PIE tests headless |
| `ClientServerTest` | Multi-process client/server test |

### Writing Custom Gauntlet Tests

Tests inherit from `UE::Gauntlet::UnrealTestNode`:

```cpp
// MyGameTest.gauntlet.cs
public class MyGameBootTest : UnrealTestNode<UnrealTestConfiguration>
{
    public override UnrealTestConfig GetConfiguration()
    {
        var config = base.GetConfiguration();
        config.MaxDuration = 300; // 5 minutes
        return config;
    }
}
```

---

## Automated Deployment Patterns

### Nightly Builds

```bash
#!/bin/bash
# nightly-build.sh — Run from cron or CI scheduler

PLATFORMS=("Win64" "Linux" "Android")
CONFIG="Development"
DATE=$(date +%Y%m%d)

for PLATFORM in "${PLATFORMS[@]}"; do
  RunUAT BuildCookRun \
    -project="Game.uproject" \
    -platform=$PLATFORM -clientconfig=$CONFIG \
    -build -cook -stage -pak -archive \
    -archivedirectory="/builds/nightly/$DATE/$PLATFORM" \
    -iterate -unattended -nop4 -utf8output
done
```

### Staged Deployment

```
Development → QA → Staging → Production

1. Dev build → auto-deploy to dev devices
2. QA approval → promote to QA build server
3. Staging → deploy to pre-prod devices for soak testing
4. Production → publish to store / distribute to users
```

### Device Farm Integration

For mobile testing at scale:
- **AWS Device Farm** — Cloud-based Android/iOS testing
- **Firebase Test Lab** — Google's device testing
- **Custom farm** — Gauntlet + local device rack

```bash
# Deploy to device farm (conceptual)
RunUAT BuildCookRun \
  -project="Game.uproject" \
  -platform=Android -clientconfig=Development \
  -build -cook -stage -pak -package \
  -unattended

# Upload APK to test service
aws devicefarm create-upload \
  --project-arn $PROJECT_ARN \
  --name Game.apk --type ANDROID_APP
```

---

## Monitoring Deployments

### Build Health Checks

After deployment, verify:

1. **Boot test** — Game launches without crash
2. **Memory** — Stays within budget (check `stat memory`)
3. **Frame rate** — Meets target FPS
4. **Asset loading** — No missing asset warnings
5. **Network** — Server connections work (if multiplayer)

### Log Collection

```bash
# Windows — game log
type "%LOCALAPPDATA%\Game\Saved\Logs\Game.log"

# Android
adb logcat -d -s UE:* > android_log.txt

# iOS (via Xcode)
# Console.app > filter by process

# Linux
cat ~/Game/Saved/Logs/Game.log
```

### Crash Reporting

- **CrashReportClient** — Built into UE, sends minidumps
- Enable: `-CrashReporter` in UAT, configure crash upload URL
- Crash dumps in: `<Project>/Saved/Crashes/`
- Use `-separatedebuginfo` to keep symbols for symbolication
