# Mobile Deployment — iOS & Android

## Android

### Prerequisites

1. **Android SDK** — Install via Android Studio or standalone SDK
2. **Android NDK** — r25b or later (UE5 requires specific versions, check release notes)
3. **Java JDK** — JDK 11+ (JDK 17 recommended for UE 5.4+)
4. **Environment variables**:
   ```bash
   export ANDROID_HOME=~/Android/Sdk          # or C:\Users\<user>\AppData\Local\Android\Sdk
   export NDKROOT=$ANDROID_HOME/ndk/25.2.9519653
   export JAVA_HOME=/path/to/jdk-17
   ```
5. **UE Setup**: Run `SetupAndroid.sh` (or `.bat`) from `Engine/Extras/Android/`:
   ```bash
   "$UE_ROOT/Engine/Extras/Android/SetupAndroid.sh"
   ```
   This installs the correct SDK/NDK versions and accepts licenses.

### Turnkey SDK Setup (UE 5.1+)

```bash
# Install Android SDK via Turnkey
RunUAT Turnkey -command=InstallSdk -platform=Android

# Verify SDK installation
RunUAT Turnkey -command=VerifySdk -platform=Android
```

### Device Setup

1. **Enable Developer Options**: Settings > About > Tap "Build number" 7 times
2. **Enable USB debugging**: Settings > Developer Options > USB debugging ON
3. **Connect USB** and authorize the computer when prompted
4. **Verify connection**:
   ```bash
   adb devices
   # Should show: <device-id>   device
   ```

### Deploy to Android

```bash
# Full pipeline: build + cook + deploy + run
RunUAT BuildCookRun \
  -project="Game.uproject" \
  -platform=Android -clientconfig=Development \
  -build -cook -stage -pak -deploy -run \
  -cookflavor=Multi \
  -device=<device-id>

# Deploy only (already packaged)
RunUAT BuildCookRun \
  -project="Game.uproject" \
  -platform=Android -clientconfig=Development \
  -skipcook -skipbuild -skipstage -deploy -run \
  -device=<device-id>
```

### Android Texture Formats

| Format | Devices | Notes |
|--------|---------|-------|
| `ETC2` | All modern Android (OpenGL ES 3.0+) | Default, good quality |
| `ASTC` | Modern GPUs (Adreno 4xx+, Mali T7xx+) | Best quality, larger |
| `DXT` | NVIDIA Tegra only | Legacy |
| `Multi` | Ships all formats | Largest size, broadest compatibility |

Use `-cookflavor=ETC2` or `-cookflavor=ASTC` for specific format, `Multi` for broadest compatibility.

### Android App Bundle (AAB) for Google Play

Google Play requires AAB format (not APK) for apps over 150 MB:

```bash
RunUAT BuildCookRun \
  -project="Game.uproject" \
  -platform=Android -clientconfig=Shipping \
  -build -cook -stage -pak -package -distribution \
  -cookflavor=Multi
```

Project Settings > Platforms > Android:
- Enable "Generate Android App Bundle (AAB)"
- Configure "Use OBB in APK" or "Use OBB (for legacy)"

### ADB Useful Commands

```bash
# List devices
adb devices

# Install APK
adb install -r Game.apk

# View game logs
adb logcat -s UE:* | grep -i "error\|warning\|fatal"

# Push files to device
adb push localfile /sdcard/UE5Game/

# Pull crash logs
adb pull /sdcard/Android/data/com.yourcompany.game/files/UE5Game/Saved/Crashes/

# Uninstall
adb uninstall com.yourcompany.game

# Forward port (for cook-on-the-fly)
adb reverse tcp:41899 tcp:41899
```

### Android Common Issues

| Issue | Solution |
|-------|----------|
| `INSTALL_FAILED_UPDATE_INCOMPATIBLE` | Uninstall previous version: `adb uninstall <package>` |
| `INSTALL_FAILED_INSUFFICIENT_STORAGE` | Free device space or reduce build size |
| `INSTALL_FAILED_NO_MATCHING_ABIS` | Build for correct architecture (arm64-v8a) |
| Black screen on launch | Check `adb logcat` for shader/GPU errors |
| Permissions denied | Ensure Android manifest has required permissions |
| Vulkan crash on older devices | Fall back to OpenGL ES: set in Project Settings |
| "License check failed" | Set `ANDROID_HOME` and accept all SDK licenses |

---

## iOS

### Prerequisites

1. **macOS** — iOS deployment requires a Mac (no cross-compile from Windows)
2. **Xcode** — Latest stable version (check UE release notes for minimum)
3. **Apple Developer Account** — $99/year for App Store distribution
4. **Provisioning Profile** — Development or Distribution
5. **Code Signing Certificate** — Development or Distribution certificate in Keychain

### Certificate & Provisioning Setup

1. **Create Certificate**:
   - Keychain Access > Certificate Assistant > Request Certificate from CA
   - Upload to Apple Developer Portal > Certificates
   - Download and install the `.cer` file

2. **Register Device**:
   - Connect iOS device, find UDID: `instruments -s devices` or Xcode > Devices
   - Add UDID in Apple Developer Portal > Devices

3. **Create Provisioning Profile**:
   - Apple Developer Portal > Profiles > New
   - Select type (Development / Distribution)
   - Select App ID, certificates, and devices
   - Download and double-click to install

4. **Configure in UE**:
   - Project Settings > Platforms > iOS
   - Set Bundle Identifier (must match provisioning profile)
   - Set Signing Certificate and Provisioning Profile

### Turnkey SDK Setup (UE 5.1+)

```bash
# Verify iOS SDK
RunUAT Turnkey -command=VerifySdk -platform=IOS
```

### Deploy to iOS

```bash
# Build, cook, deploy, and run on device
RunUAT BuildCookRun \
  -project="Game.uproject" \
  -platform=IOS -clientconfig=Development \
  -build -cook -stage -pak -deploy -run

# With specific provisioning
RunUAT BuildCookRun \
  -project="Game.uproject" \
  -platform=IOS -clientconfig=Shipping \
  -build -cook -stage -pak -package -deploy \
  -provision="YourProfile" -certificate="iPhone Distribution: Your Name"
```

### iOS Distribution Channels

| Channel | Certificate | Profile | Notes |
|---------|-------------|---------|-------|
| Development | iOS Development | Development | Direct to device via USB/Xcode |
| Ad Hoc | iOS Distribution | Ad Hoc | Up to 100 registered devices |
| TestFlight | iOS Distribution | App Store | Beta testing, up to 10K testers |
| App Store | iOS Distribution | App Store | Public release |
| Enterprise | iOS Enterprise | In-House | Internal company apps only |

### Remote Build (from Windows)

UE supports building iOS from Windows via a network-connected Mac:

1. Install **Unreal Remote** on the Mac
2. Configure in Project Settings > Platforms > iOS > Remote Build
3. Set Mac IP, username, SSH key
4. Build from Windows — UE handles SSH + rsync to the Mac

### iOS Simulator — NOT SUPPORTED

Unreal Engine does **not** support building for the iOS Simulator. Packaged iOS builds target physical devices only (arm64, `LC_BUILD_VERSION platform=IPHONEOS`). The simulator requires binaries compiled against the simulator SDK (`platform=IOSSIMULATOR`).

**What happens if you try:**
- `xcrun simctl install` will succeed on Apple Silicon Macs (the bundle is copied) — the app icon appears in the simulator
- `xcrun simctl launch` will fail with: `Bootstrapping failed` → `Launch failed` → `NSPOSIXErrorDomain code: 163` ("Launchd job spawn failed")
- The binary is rejected at process spawn time because it was built against the device SDK, not the simulator SDK

**Alternatives for local testing:**
- **"Designed for iPad" on Mac** — run the iOS build natively on Apple Silicon Mac (see section below)
- Deploy to a physical iOS device via USB (standard UE iOS workflow)
- Package for macOS instead if you just need local desktop testing
- Use "Launch on Device" from the UE editor for USB-connected devices

### "Designed for iPad" on Mac (Apple Silicon)

Run a UE iOS build natively on an Apple Silicon Mac without a physical device. This uses Xcode's "Designed for iPad" destination, which runs the arm64 iOS binary in an iOS compatibility layer on macOS.

**Requirements:**
- Apple Silicon Mac (M1+)
- Xcode with iOS SDK installed
- Apple Developer account with valid development certificate
- UE iOS Xcode workspace generated (typically at `Intermediate/ProjectFiles/<Project>_IOS_<Project>.xcworkspace`)
- A packaged/staged iOS build (cooked content must exist in `Saved/StagedBuilds/IOS/`)

**Why `install` not `build`:** The `xcodebuild install` action runs `RegisterExecutionPolicyException`, which registers the iOS binary with macOS security policy so it's allowed to execute. Without this, macOS rejects the binary with "incorrect executable format." The `build` action alone does not register the exception.

**Why automatic signing:** The standard iOS provisioning profile does not include the Mac as a device. Using `CODE_SIGN_STYLE=Automatic` with `-allowProvisioningUpdates` lets Xcode generate a new profile that covers the Mac.

**Build and run via command line:**

```bash
# Step 1: Build and install (registers execution policy exception)
xcodebuild \
  -workspace "Intermediate/ProjectFiles/<Project>_IOS_<Project>.xcworkspace" \
  -scheme <Project> \
  -destination "platform=macOS,variant=Designed for iPad,arch=arm64" \
  -configuration Development \
  -allowProvisioningUpdates \
  CODE_SIGN_STYLE=Automatic \
  DEVELOPMENT_TEAM=<YOUR_TEAM_ID> \
  CODE_SIGN_IDENTITY="Apple Development" \
  PROVISIONING_PROFILE_SPECIFIER="" \
  DSTROOT=/tmp/<Project>_install \
  install

# Step 2: Launch by bundle ID
open -b <YOUR_BUNDLE_ID>
```

**Find required values:**

```bash
# Find workspace
find Intermediate/ProjectFiles -name "*_IOS_*.xcworkspace"

# Find scheme name
xcodebuild -workspace "<workspace>" -list

# Find "Designed for iPad" destination
xcodebuild -workspace "<workspace>" -scheme <scheme> -showdestinations 2>&1 | grep "Designed for"

# Find team ID from existing provisioning
security cms -D -i Saved/StagedBuilds/IOS/<Project>.app/embedded.mobileprovision 2>/dev/null | grep -A1 TeamIdentifier

# Find bundle ID
defaults read Saved/StagedBuilds/IOS/<Project>.app/Info.plist CFBundleIdentifier
```

**Bundle ID conflict:** If a Mac-native build of the same project exists (same bundle ID), `open -b` may launch the Mac build instead of the iOS one. To resolve:
- Temporarily move/rename the Mac `.app` bundle
- Or unregister it: `lsregister -u /path/to/Mac/Build.app`

**Sandbox:** The app runs in an iOS-style sandbox container at:
- `~/Library/Containers/<bundle-id>/`
- UE logs: `~/Library/Containers/<bundle-id>/Data/Library/Logs/<Project>/`

**Known limitations:**
- Sandbox restrictions may deny file writes outside the container (e.g., `Sandbox: deny file-write-create /private/tmp/...`)
- Touch input is emulated via mouse — multi-touch gestures are not available
- GPS, accelerometer, camera, and other iOS hardware APIs are unavailable
- Performance characteristics differ from actual iOS devices
- Running a development-signed iOS `.app` directly via `open` (without the `xcodebuild install` flow) will fail with "incorrect executable format" or `amfid: No matching profile found`

### iOS Common Issues

| Issue | Solution |
|-------|----------|
| "No matching provisioning profile" | Regenerate profile with correct App ID and device UDID |
| "Code signing failed" | Check certificate is valid and in Keychain |
| Build fails — "Metal validation" | Ensure Metal shader format is enabled in Project Settings |
| App crashes on launch | Check device Console.app for crash logs |
| "Unable to install" | Profile expired or device not registered |
| Large IPA size | Use Asset Manager to exclude unused assets, enable compression |

### iOS Debugging

```bash
# View device logs (requires Xcode)
xcrun devicectl device get-log --device <udid>

# Or via Console.app — filter by your app's process name

# Install .ipa manually
xcrun devicectl device install app --device <udid> path/to/Game.ipa

# List connected devices
xcrun xctrace list devices
```

---

## Mobile Optimization Checklist

Before deploying to mobile:

1. **Texture sizes** — Max 2048x2048 for mobile, prefer 1024x1024
2. **Material complexity** — Reduce instructions per material, use Mobile shading model
3. **Draw calls** — Target < 500 for mobile
4. **Triangle count** — Target < 500K visible triangles per frame
5. **Memory budget** — Stay under 1.5 GB total (varies by device)
6. **Thermal throttling** — Test sustained performance, not just peak
7. **Battery drain** — Lock frame rate to 30 FPS for battery-sensitive apps
8. **Loading times** — Use level streaming, async loading
9. **Touch input** — Configure touch interface in Project Settings
10. **Permissions** — Only request necessary Android permissions
