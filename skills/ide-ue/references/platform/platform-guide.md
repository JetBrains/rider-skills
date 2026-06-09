# Platform Packaging Guide

## Platform Matrix

| Platform | Flag | Cross-compile from Windows? | Cross-compile from Mac? | Notes |
|----------|------|---------------------------|------------------------|-------|
| Windows 64-bit | `Win64` | Native | No | Most common |
| Linux x86_64 | `Linux` | Yes (needs toolchain) | Yes | Dedicated servers |
| Linux ARM64 | `LinuxArm64` | Yes (needs ARM toolchain) | Yes (Apple Silicon native) | DGX Spark, ARM servers |
| macOS | `Mac` | No | Native | Apple Silicon & Intel |
| Android | `Android` | Yes (SDK/NDK) | Yes (SDK/NDK) | ARM64, Google Play / Meta Quest |
| iOS | `IOS` | No | Native (Xcode) | App Store |

Multiple platforms in one command: `-targetplatform=Win64+Linux`

## Windows (Win64)

**Prerequisites**: Visual Studio 2022 with C++ workload, Windows SDK 10/11.

```bash
ue-package.sh --platform Win64 --config Shipping \
  --iostore --compressed --distribution --prereqs \
  --nodebuginfo --archive ~/Builds/Win64
```

**Notes**:
- `-prereqs` bundles DirectX and VC++ redistributables
- `.exe` output in `WindowsNoEditor/` or `Windows/` staging subfolder
- Default output: `<Project>/Saved/StagedBuilds/Windows/`

## Linux (x86_64)

**Prerequisites**: Cross-compile toolchain installed via `Setup.sh`/`Setup.bat`, or native Linux build.

```bash
# Cross-compile from Windows
ue-package.sh --platform Linux --config Shipping \
  --server --archive ~/Builds/LinuxServer

# Native Linux build
ue-package.sh --platform Linux --config Development \
  --archive ~/Builds/Linux
```

**Notes**:
- Cross-compile toolchain: Run `Setup.bat` first, provides `clang` targeting Linux
- Common for dedicated servers
- Output in `LinuxNoEditor/` or `Linux/` staging subfolder

## Linux ARM64

**Prerequisites**: ARM64 cross-compile toolchain or native ARM64 host.

```bash
ue-package.sh --platform LinuxArm64 --config Development \
  --archive ~/Builds/LinuxArm64
```

**Notes**:
- Used for DGX Spark, Graviton, other ARM64 servers
- Less common — verify plugin compatibility (some plugins are x86-only)
- Requires `LinuxArm64` platform support enabled in UE

## macOS (Mac)

**Prerequisites**: Xcode (with Metal Toolchain installed via Xcode Settings > Components), macOS SDK. Must build on a Mac.

```bash
ue-package.sh --platform Mac --config Shipping \
  --compressed --distribution --archive ~/Builds/Mac
```

**CRITICAL — Enable Modern Xcode Workflow**:

Without `bUseModernXcode=True`, packaged Mac builds will **crash on launch** with `Library not loaded: @rpath/lib*.dylib` errors because dylibs (libtbb, libmetalirconverter, libogg, libvorbis, etc.) are not staged into the `.app` bundle.

Add to `Config/DefaultEngine.ini`:
```ini
[/Script/MacTargetPlatform.XcodeProjectSettings]
bUseModernXcode=True
```

This enables the Modern Xcode workflow (UE 5.3+) which uses standard Xcode framework handling to properly copy and codesign dynamic libraries into the app bundle during the Stage step.

**IMPORTANT — Use Staged Build, Not Archive**:

The BuildCookRun `-archive` step copies from `Binaries/Mac/` which may NOT contain the properly staged `.app` with bundled dylibs. For Mac, prefer using the staged build directly from `Saved/StagedBuilds/Mac/ArenaFPSDemo.app`, or verify that the archive output includes all dylibs.

**NNERuntimeORT Plugin**:

The NNE/NNERuntimeORT plugin links `libonnxruntime` as a weak dependency. If not needed, disable it in `.uproject` to avoid a missing (but non-fatal) library warning:
```json
{ "Name": "NNERuntimeORT", "Enabled": false }
```

**Notes**:
- Code signing: configure in Project Settings > Platforms > Mac, or use `bMacSignToRunLocally=true` for local testing
- Universal binaries (Intel + Apple Silicon) via `-SpecifiedArchitecture`
- Cannot cross-compile from Windows
- After packaging, all dylibs inside the `.app` must be individually signed before signing the app bundle itself
- For distribution/notarization, manual codesigning with `--options runtime --timestamp` and proper entitlements is required (UBT's built-in signing is insufficient for App Store/notarization)

## Android

**Prerequisites**: Android SDK, NDK (r25b+), Java JDK 11+. Configured via Project Settings > Platforms > Android.

```bash
ue-package.sh --platform Android --config Shipping \
  --distribution --compressed \
  --extra "-cookflavor=Multi" \
  --archive ~/Builds/Android
```

**Notes**:
- Produces `.apk` or `.aab` (Android App Bundle)
- `-cookflavor=Multi` for multiple texture formats, or `ETC2`, `ASTC`
- `-bundlename=com.company.game` for package name
- Google Play requires AAB: add `-extra "-package"` with OBB/AAB settings
- Meta Quest: Use Android platform with Quest-specific project settings

## iOS

**Prerequisites**: Xcode (with iOS SDK + Metal Toolchain), Apple Developer account, macOS only.

```bash
ue-package.sh --platform IOS --config Shipping \
  --distribution --compressed \
  --archive ~/Builds/iOS
```

**CRITICAL — Code Signing Team ID (Auto-Detected)**:

iOS builds WILL FAIL with `Signing for "X" requires a development team` unless you set the team ID. In UE 5.3+, UBT reads the team ID from `[/Script/MacTargetPlatform.XcodeProjectSettings]` — NOT from `IOSTeamID` in `IOSRuntimeSettings`. This section is shared by ALL Apple platforms (Mac + iOS).

**Auto-detect the Team ID** before asking the user — run:
```bash
# Primary: extract from signing certificate OU field
TEAM_ID=$(security find-certificate -c "Apple Development" -p 2>/dev/null | openssl x509 -noout -subject 2>/dev/null | grep -oE 'OU=[A-Z0-9]{10}' | cut -d= -f2)

# Fallback: from provisioning profile
if [ -z "$TEAM_ID" ]; then
  TEAM_ID=$(security cms -D -i ~/Library/MobileDevice/Provisioning\ Profiles/*.mobileprovision 2>/dev/null | grep -A1 TeamIdentifier | grep -oE '[A-Z0-9]{10}' | head -1)
fi

echo "Detected Team ID: $TEAM_ID"
```

Then add to `Config/DefaultEngine.ini`:
```ini
[/Script/MacTargetPlatform.XcodeProjectSettings]
bUseModernXcode=True
CodeSigningTeam=<DETECTED_TEAM_ID>
```

If auto-detection fails (no certificate in keychain), the Team ID can be found manually:
- **Xcode**: Settings > Accounts > select Apple ID > Team ID in detail panel
- **Apple Developer Portal**: developer.apple.com/account > Membership Details
- **Provisioning profile**: `security cms -D -i ~/Library/MobileDevice/Provisioning\ Profiles/*.mobileprovision | grep -A1 TeamIdentifier`

**CRITICAL — iOS Runtime Settings (Auto-Derived)**:

Derive values automatically — do NOT ask the user unless auto-detection fails:
- **BundleIdentifier**: `com.<project_name_lowercase>.<project_name_lowercase>` (e.g., `com.arenafpsdemo.arenafpsdemo`)
- **BundleDisplayName / BundleName**: From project name or game title in CLAUDE.md if available

Add to `Config/DefaultEngine.ini`:
```ini
[/Script/IOSRuntimeSettings.IOSRuntimeSettings]
bSupportsPortraitOrientation=False
bSupportsUpsideDownOrientation=False
bSupportsLandscapeLeftOrientation=True
bSupportsLandscapeRightOrientation=True
bSupportsMetal=True
bSupportsMetalMRT=True
PreferredGraphicsAPI=Metal
MinimumiOSVersion=IOS_16
BundleDisplayName=<FROM_PROJECT_NAME_OR_GAME_TITLE>
BundleName=<FROM_PROJECT_NAME>
BundleIdentifier=<AUTO_DERIVED>
VersionInfo=1.0.0
bSupportsIPad=True
bSupportsIPhone=True
bAutomaticSigning=True
```

**IMPORTANT — `BundleIdentifier` May Be Overridden by Automatic Signing**:

With `bAutomaticSigning=True`, Xcode creates a provisioning profile using its own bundle ID pattern (typically `com.YourCompany.<ProjectName>`), which may NOT match the `BundleIdentifier` set in `IOSRuntimeSettings`. The provisioning profile's bundle ID wins. To use a custom bundle ID, either: (1) create a matching App ID in the Apple Developer Portal first, or (2) use manual signing with a matching provisioning profile. Check the actual bundle ID in the Xcode build log's `CodeSign` step.

**IMPORTANT — `IOSTeamID` Does NOT Set Xcode `DEVELOPMENT_TEAM`**:

The `IOSTeamID` field in `IOSRuntimeSettings` is used by the legacy (non-Modern Xcode) code signing path for provisioning profile lookup. With Modern Xcode (`bUseModernXcode=True`), the `DEVELOPMENT_TEAM` in the generated xcconfig comes from `CodeSigningTeam` in `XcodeProjectSettings`. Setting only `IOSTeamID` will leave `DEVELOPMENT_TEAM` empty and the build will fail.

**Mobile Rendering Config**:

Create `Config/IOS/IOSEngine.ini` to disable features unsupported on iOS:
```ini
[/Script/Engine.RendererSettings]
r.RayTracing=False
r.RayTracing.RayTracingProxies.ProjectEnabled=False
r.Shadow.Virtual.Enable=0
r.GenerateMeshDistanceFields=False
```

**CRITICAL — Do NOT override cook-time settings in platform configs.** Settings like `r.Substrate`, `r.Mobile.ShadingPath`, `r.DynamicGlobalIlluminationMethod`, `r.ReflectionMethod`, and `r.MobileHDR` determine which shader permutations are compiled during cooking. Overriding them at runtime via `Config/IOS/IOSEngine.ini` causes ALL materials to render **black** because the cooked shaders don't match. Only override runtime-toggleable settings (ray tracing, VSM, distance fields). If you need different shading models per platform, set them in `DefaultEngine.ini` BEFORE cooking.

**Notes**:
- Produces `.app` (staged) or `.ipa` (archived)
- First iOS build takes 15-20+ minutes (ARM64 compilation + mobile shader cooking)
- Automatic signing creates a provisioning profile via Xcode (requires Apple Developer account)
- For TestFlight/App Store: use `-distribution` flag and an Apple Distribution certificate
- Cannot cross-compile from Windows
- The NNERuntimeORT plugin should be disabled in `.uproject` — it links `libonnxruntime` which is not available on iOS

## Platform-Specific UAT Flags

| Flag | Platform | Description |
|------|----------|-------------|
| `-cookflavor=ASTC` | Android | Texture compression format |
| `-bundlename=<id>` | Android/iOS | App bundle identifier |
| `-createappbundle` | Mac | Create .app bundle |
| `-SpecifiedArchitecture` | Mac | Universal binary target |
| `-device=<id>` | All | Target device for deploy |
| `-provision=<name>` | iOS | Provisioning profile |
| `-certificate=<name>` | iOS/Mac | Code signing certificate |

## Project Launcher Equivalents

The Project Launcher GUI in UE Editor maps to these CLI flags:

| Launcher Setting | CLI Flag |
|-----------------|----------|
| Cook: By the Book | `-cook` |
| Cook: On the Fly | `-cookonthefly` |
| Cook: Do Not Cook | `-skipcook` |
| Cook All Maps | `-allmaps` |
| Cook Selected Maps | `-map=Map1+Map2` |
| Cooked Cultures | `-CookCultures=en+fr` |
| Build Configuration | `-clientconfig=Shipping` |
| Target Platform | `-platform=Win64` |
| Use Pak File | `-pak` |
| Use IoStore | `-iostore` |
| Stage | `-stage` |
| Package | `-package` |
| Archive | `-archive` |
| Archive Path | `-archivedirectory="..."` |
| Deploy | `-deploy` |
| Launch | `-run` |
| Include Prerequisites | `-prereqs` |
