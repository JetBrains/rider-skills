# Turnkey System & SDK Management

## What is Turnkey?

Turnkey (UE 5.1+) is Unreal Engine's platform SDK management system. It automates SDK installation, verification, and device management across all supported platforms.

**Location**: `Engine/Platforms/<Platform>/Source/Programs/AutomationTool/Turnkey/`

## Turnkey Commands

```bash
# List available SDKs
RunUAT Turnkey -command=ListSdks -platform=<Platform>

# Install SDK for a platform
RunUAT Turnkey -command=InstallSdk -platform=<Platform>

# Verify installed SDK
RunUAT Turnkey -command=VerifySdk -platform=<Platform>

# List connected devices
RunUAT Turnkey -command=ListDevices -platform=<Platform>

# Get device info
RunUAT Turnkey -command=GetDeviceInfo -platform=<Platform> -device=<Id>

# Full SDK setup (interactive)
RunUAT Turnkey -command=SetupSdk -platform=<Platform>

# Update device firmware (console devkits)
RunUAT Turnkey -command=UpdateDevice -platform=<Platform> -device=<Id>
```

## Platform SDK Locations

### Windows

| Component | Default Location |
|-----------|-----------------|
| Visual Studio 2022 | `C:\Program Files\Microsoft Visual Studio\2022\` |
| Windows SDK | `C:\Program Files (x86)\Windows Kits\10\` |
| DirectX | Bundled with Windows SDK |

**Minimum**: Visual Studio 2022 with "Desktop development with C++" workload + Windows 10/11 SDK.

### Android

| Component | Default Location | Env Variable |
|-----------|-----------------|--------------|
| Android SDK | `~/Android/Sdk` | `ANDROID_HOME` |
| Android NDK | `$ANDROID_HOME/ndk/<version>` | `NDKROOT` |
| Java JDK | `/usr/lib/jvm/java-17` (Linux) | `JAVA_HOME` |
| Build Tools | `$ANDROID_HOME/build-tools/<ver>` | — |
| Platform Tools | `$ANDROID_HOME/platform-tools` | — |

**UE Setup Script** (installs correct versions):
```bash
# Windows
"%UE_ROOT%\Engine\Extras\Android\SetupAndroid.bat"

# macOS/Linux
"$UE_ROOT/Engine/Extras/Android/SetupAndroid.sh"
```

**SDK Manager** (manual install):
```bash
sdkmanager "platforms;android-33" "ndk;25.2.9519653" "build-tools;33.0.2"
sdkmanager --licenses  # accept all
```

### iOS / macOS

| Component | Location |
|-----------|----------|
| Xcode | `/Applications/Xcode.app` |
| Command Line Tools | `/Library/Developer/CommandLineTools` |
| iOS SDK | Inside Xcode bundle |
| Provisioning Profiles | `~/Library/MobileDevice/Provisioning Profiles/` |
| Certificates | Keychain Access |

**Verify**:
```bash
xcode-select -p           # Xcode path
xcrun --show-sdk-path      # Current SDK
xcrun xctrace list devices # Connected devices
```

### Linux Cross-Compilation

```bash
# Install cross-compile toolchain (from Windows or another Linux host)
"$UE_ROOT/Engine/Build/BatchFiles/Linux/Setup.sh"

# This installs a clang-based toolchain targeting Linux
# Toolchain location: Engine/Extras/ThirdPartyNotUE/SDKs/HostLinux/
```

## Platform Configuration in .uproject

Enable platforms in the `.uproject` file:

```json
{
  "TargetPlatforms": [
    "Win64",
    "Linux",
    "Android",
    "IOS"
  ]
}
```

Or in Project Settings > Platforms > Supported Platforms.

## SDK Version Compatibility

UE enforces specific SDK version ranges. Check:
- `Engine/Config/BaseEngine.ini` — `[/Script/AndroidRuntimeSettings]`
- `Engine/Platforms/<Platform>/Config/` — Platform-specific config
- Release notes for your UE version — lists supported SDK ranges

### Checking Current SDK Versions

```bash
# Android
adb version
$ANDROID_HOME/ndk/<version>/ndk-build --version
java -version

# iOS
xcodebuild -version
xcrun --sdk iphoneos --show-sdk-version

# Windows
# Check Visual Studio Installer for installed components
```

## Troubleshooting SDK Issues

| Issue | Solution |
|-------|----------|
| "SDK not found" | Run `Turnkey -command=InstallSdk -platform=<P>` |
| "NDK version mismatch" | Check UE release notes for required NDK version |
| "License not accepted" (Android) | `sdkmanager --licenses` |
| "Xcode not found" | `xcode-select --install` or set `xcode-select -s /Applications/Xcode.app` |
| "Missing platform support" | Install platform support in Epic Games Launcher or from source |
| Multiple SDK versions conflict | Set `ANDROID_HOME`/`NDKROOT` to the correct version |
| "Unable to find platform" | Ensure platform is enabled in `.uproject` and SDK is installed |

## Turnkey AutoSDK

For teams, Turnkey supports AutoSDK — a shared network location with pre-downloaded SDKs:

1. Set environment variable: `UE_SDKS_ROOT=//server/share/AutoSDK`
2. Turnkey auto-downloads SDKs from this share instead of the internet
3. Ensures consistent SDK versions across the team

Structure:
```
AutoSDK/
├── HostWin64/
│   ├── Android/
│   │   └── android-ndk-r25b/
│   ├── Linux_x64/
│   │   └── v22_clang-16.0.6/
│   └── ...
├── HostMac/
│   └── ...
└── HostLinux/
    └── ...
```
