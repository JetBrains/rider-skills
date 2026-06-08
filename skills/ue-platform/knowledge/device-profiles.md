# Device Profiles and Multi-Target Configuration

## Overview

Device profiles (`DefaultDeviceProfiles.ini`) are UE's primary mechanism for adapting rendering quality, memory usage, and feature sets across different hardware. They allow a single project to target everything from low-end mobile GPUs to high-end desktop cards without code changes.

## File Location

```
Config/DefaultDeviceProfiles.ini          # Main device profiles (all platforms)
Config/<Platform>/<Platform>DeviceProfiles.ini  # Platform-specific overrides
```

Platform-specific files (e.g., `Config/Android/AndroidDeviceProfiles.ini`) override or extend the main file for that platform.

## Profile Structure

Each device profile is a section with a specific format:

```ini
[ProfileName DeviceProfile]
DeviceType=Android           ; Platform type
BaseProfileName=Android_Mid  ; Parent profile to inherit from
+CVars=r.MobileContentScaleFactor=1.0
+CVars=sg.ShadowQuality=2
+CVars=sg.PostProcessQuality=2
```

### Profile Hierarchy (Inheritance)

Profiles form a tree. Child profiles inherit all CVars from their parent and can override individual values:

```
Android (base)
├── Android_Low        (low-end devices)
│   └── Android_Adreno4xx  (specific GPU family)
├── Android_Mid        (mid-range devices)
│   └── Android_Mali_G71  (specific GPU)
├── Android_High       (high-end devices)
│   └── Android_Adreno6xx
└── Android_Default    (fallback)
```

## GPU-Based Device Matching (Android)

Android profiles use matching rules to automatically select the right profile based on GPU hardware:

```ini
[Android DeviceProfile]
+MatchProfile=(Profile="Android_Adreno6xx",Match=((SourceType=SRC_GpuFamily,CompareType=CMP_Regex,MatchString="^Adreno \\(TM\\) 6")))
+MatchProfile=(Profile="Android_Adreno5xx",Match=((SourceType=SRC_GpuFamily,CompareType=CMP_Regex,MatchString="^Adreno \\(TM\\) 5")))
+MatchProfile=(Profile="Android_Adreno4xx",Match=((SourceType=SRC_GpuFamily,CompareType=CMP_Regex,MatchString="^Adreno \\(TM\\) 4")))
+MatchProfile=(Profile="Android_Mali_G710",Match=((SourceType=SRC_GpuFamily,CompareType=CMP_Regex,MatchString="^Mali-G710")))
+MatchProfile=(Profile="Android_Mali_G78",Match=((SourceType=SRC_GpuFamily,CompareType=CMP_Regex,MatchString="^Mali-G78")))
+MatchProfile=(Profile="Android_Mali_G71",Match=((SourceType=SRC_GpuFamily,CompareType=CMP_Regex,MatchString="^Mali-G71")))
+MatchProfile=(Profile="Android_PowerVR_GE8xxx",Match=((SourceType=SRC_GpuFamily,CompareType=CMP_Regex,MatchString="^PowerVR GE8")))
```

### Match Source Types

| SourceType | Matches Against |
|------------|----------------|
| `SRC_GpuFamily` | GPU family string (e.g., "Adreno (TM) 630") |
| `SRC_GpuDriver` | GPU driver version |
| `SRC_PrimaryScreenSize` | Screen resolution |
| `SRC_Hardware` | Hardware model string |
| `SRC_OSVersion` | OS version string |

### Match Compare Types

| CompareType | Description |
|------------|-------------|
| `CMP_Regex` | Regular expression match |
| `CMP_Equal` | Exact string match |
| `CMP_Less` | Numeric less than |
| `CMP_Greater` | Numeric greater than |
| `CMP_LessEqual` | Numeric less or equal |
| `CMP_GreaterEqual` | Numeric greater or equal |
| `CMP_NotEqual` | Not equal |

## Vulkan Variant Profiles

For Android GPUs that support Vulkan, create separate profiles with Vulkan-specific settings:

```ini
[Android_Adreno6xx DeviceProfile]
DeviceType=Android
BaseProfileName=Android_High
+CVars=r.MobileContentScaleFactor=1.0

[Android_Adreno6xx_Vulkan DeviceProfile]
DeviceType=Android
BaseProfileName=Android_Adreno6xx
+CVars=r.Android.DisableVulkanSM5Support=0
+CVars=r.Vulkan.RobustBufferAccess=0
```

Then add a match rule that detects Vulkan support:

```ini
+MatchProfile=(Profile="Android_Adreno6xx_Vulkan",Match=((SourceType=SRC_GpuFamily,CompareType=CMP_Regex,MatchString="^Adreno \\(TM\\) 6"),(SourceType=SRC_GpuDriver,CompareType=CMP_Regex,MatchString="Vulkan")))
```

## iOS Device Profiles

iOS profiles map specific device models to quality settings:

```ini
[IOS DeviceProfile]
DeviceType=IOS
+CVars=r.MobileContentScaleFactor=2
+CVars=sg.ShadowQuality=1
+CVars=sg.GlobalIlluminationQuality=1

[iPhone12 DeviceProfile]
DeviceType=IOS
BaseProfileName=IOS
+CVars=r.iOS.PhysicalScreenDensity=460
+CVars=sg.ShadowQuality=2
+CVars=sg.PostProcessQuality=2
+CVars=r.Mobile.AmbientOcclusionQuality=1

[iPhone14Pro DeviceProfile]
DeviceType=IOS
BaseProfileName=IOS
+CVars=r.iOS.PhysicalScreenDensity=460
+CVars=sg.ShadowQuality=3
+CVars=sg.PostProcessQuality=3
+CVars=r.Mobile.AmbientOcclusionQuality=2
+CVars=r.Mobile.PixelProjectedReflectionQuality=2
```

### iPad Aspect Ratio Variants

iPads with different screen sizes need separate DPI settings:

```ini
[IPad_97 DeviceProfile]
DeviceType=IOS
BaseProfileName=IOS
+CVars=r.iOS.PhysicalScreenDensity=264

[IPad_105 DeviceProfile]
DeviceType=IOS
BaseProfileName=IOS
+CVars=r.iOS.PhysicalScreenDensity=264

[IPad_129 DeviceProfile]
DeviceType=IOS
BaseProfileName=IOS
+CVars=r.iOS.PhysicalScreenDensity=264
```

## Quality Tier CVars

### Scalability Groups (sg.*)

Used to set quality tiers that map to DefaultScalability.ini levels:

```ini
+CVars=sg.ViewDistanceQuality=1       ; 0=Low, 1=Med, 2=High, 3=Epic, 4=Cinematic
+CVars=sg.AntiAliasingQuality=1
+CVars=sg.ShadowQuality=1
+CVars=sg.GlobalIlluminationQuality=1
+CVars=sg.ReflectionQuality=1
+CVars=sg.PostProcessQuality=1
+CVars=sg.TextureQuality=1
+CVars=sg.EffectsQuality=1
+CVars=sg.FoliageQuality=1
+CVars=sg.ShadingQuality=1
```

### Mobile-Specific CVars

```ini
; Resolution scaling
+CVars=r.MobileContentScaleFactor=0.8   ; 0.0-1.0, reduces render resolution

; Shadow configuration
+CVars=r.Shadow.CSM.MaxCascades=1        ; Single cascade for mobile
+CVars=r.Shadow.DistanceScale=0.4        ; Reduce shadow draw distance
+CVars=r.Shadow.EnableDistanceFieldShadowing=1

; Dynamic resolution (adapts to GPU load)
+CVars=r.DynamicRes.OperationMode=2      ; Based on GPU time
+CVars=r.SecondaryScreenPercentage.GameViewport=83.33  ; Max 83% of native

; Memory optimization
+CVars=r.Streaming.PoolSize=490          ; Texture streaming pool in MB
+CVars=r.RenderTargetPoolMin=140         ; Render target pool minimum
+CVars=fx.GPUSimulationTextureSizeX=512  ; Particle simulation texture size
+CVars=fx.GPUSimulationTextureSizeY=256

; Material quality
+CVars=r.MaterialQualityLevel=2          ; 0=Low, 1=High, 2=Medium
+CVars=r.DetailMode=1                    ; 0=Low, 1=Med, 2=High (for cook)

; Physics
+CVars=p.RigidBodyNode.ISPC=0           ; Disable ISPC rigid body on low-end

; Skeletal mesh cleanup
+CVars=r.FreeSkeletalMeshBuffers=1      ; Free CPU-side mesh data after upload
```

## Texture LOD Groups per Device Tier

Control maximum texture resolution per category:

```ini
; Desktop/High-End (default)
+TextureLODGroups=(Group=TEXTUREGROUP_World,MinLODSize=1,MaxLODSize=4096,LODBias=0)
+TextureLODGroups=(Group=TEXTUREGROUP_Character,MinLODSize=1,MaxLODSize=4096,LODBias=0)
+TextureLODGroups=(Group=TEXTUREGROUP_UI,MinLODSize=1,MaxLODSize=4096,LODBias=0)

; Mobile Low Tier
+TextureLODGroups=(Group=TEXTUREGROUP_World,MinLODSize=1,MaxLODSize=1024,LODBias=1)
+TextureLODGroups=(Group=TEXTUREGROUP_Character,MinLODSize=1,MaxLODSize=1024,LODBias=0)
+TextureLODGroups=(Group=TEXTUREGROUP_UI,MinLODSize=1,MaxLODSize=512,LODBias=0)

; Mobile Mid Tier
+TextureLODGroups=(Group=TEXTUREGROUP_World,MinLODSize=1,MaxLODSize=2048,LODBias=0)
+TextureLODGroups=(Group=TEXTUREGROUP_Character,MinLODSize=1,MaxLODSize=2048,LODBias=0)
```

## Platform Online Subsystem Configuration

Platform-specific online services are configured via platform override ini files:

```ini
; Config/Android/AndroidEngine.ini
[OnlineSubsystem]
DefaultPlatformService=GooglePlay

[OnlineSubsystemGooglePlay]
bSupportsInAppPurchasing=True

; Config/IOS/IOSEngine.ini (typically)
[OnlineSubsystem]
DefaultPlatformService=Apple
```

Combined with platform-conditional plugins in .uproject:

```json
{
    "Name": "OnlineSubsystemGoogle",
    "Enabled": true,
    "SupportedTargetPlatforms": ["Android"]
},
{
    "Name": "OnlineSubsystemApple",
    "Enabled": true,
    "SupportedTargetPlatforms": ["Mac", "IOS", "TVOS"]
}
```

## Texture Format Priority (Android)

Android supports multiple texture compression formats. Configure priority per format:

```ini
[/Script/AndroidRuntimeSettings.AndroidRuntimeSettings]
+TextureFormatPriority_ETC2=0.2
+TextureFormatPriority_DXT=0.6
+TextureFormatPriority_ASTC=0.9
```

Higher priority = preferred when the device supports it. ASTC is the best quality/size ratio on modern Android GPUs.

## Audio Platform Configuration

Different platforms have different audio capabilities:

```ini
; Windows - high quality
[/Script/WindowsTargetPlatform.WindowsTargetSettings]
AudioSampleRate=48000
AudioCallbackBufferFrameSize=1024
NumBuffersToEnqueue=1
AudioNumSourceWorkers=4

; Android - battery-conscious
[/Script/AndroidRuntimeSettings.AndroidRuntimeSettings]
AudioSampleRate=44100
AudioCallbackBufferFrameSize=1024
AudioNumBuffersToEnqueue=4
```

## Build Resources per Platform

Platform-specific build assets (icons, splash screens) go under `Build/<Platform>/`:

```
Build/
├── Android/
│   ├── res/
│   │   ├── drawable/           # Default DPI icons
│   │   ├── drawable-hdpi/      # High DPI
│   │   ├── drawable-ldpi/      # Low DPI
│   │   ├── drawable-mdpi/      # Medium DPI
│   │   └── drawable-xhdpi/     # Extra high DPI
│   ├── project.properties      # Android project target
│   └── res/values/             # Google Play config XML
├── IOS/
│   └── ...
└── Windows/
    └── ...
```

## Complete Multi-Target Device Profile Example

A production-ready 3-tier Android quality system:

```ini
; === Base Android Profile ===
[Android DeviceProfile]
DeviceType=Android
+TextureLODGroups=(Group=TEXTUREGROUP_World,MinLODSize=1,MaxLODSize=2048,LODBias=0)
+TextureLODGroups=(Group=TEXTUREGROUP_Character,MinLODSize=1,MaxLODSize=2048,LODBias=0)

; Matching rules (ordered by specificity)
+MatchProfile=(Profile="Android_Adreno7xx",Match=((SourceType=SRC_GpuFamily,CompareType=CMP_Regex,MatchString="^Adreno \\(TM\\) 7")))
+MatchProfile=(Profile="Android_Adreno6xx",Match=((SourceType=SRC_GpuFamily,CompareType=CMP_Regex,MatchString="^Adreno \\(TM\\) 6")))
+MatchProfile=(Profile="Android_Adreno5xx",Match=((SourceType=SRC_GpuFamily,CompareType=CMP_Regex,MatchString="^Adreno \\(TM\\) 5")))
+MatchProfile=(Profile="Android_Mali_G710",Match=((SourceType=SRC_GpuFamily,CompareType=CMP_Regex,MatchString="^Mali-G710")))
+MatchProfile=(Profile="Android_Mali_G78",Match=((SourceType=SRC_GpuFamily,CompareType=CMP_Regex,MatchString="^Mali-G78")))
+MatchProfile=(Profile="Android_Mali_G71",Match=((SourceType=SRC_GpuFamily,CompareType=CMP_Regex,MatchString="^Mali-G71")))

; === Quality Tiers ===
[Android_Low DeviceProfile]
DeviceType=Android
BaseProfileName=Android
+CVars=sg.ViewDistanceQuality=0
+CVars=sg.ShadowQuality=0
+CVars=sg.PostProcessQuality=0
+CVars=sg.EffectsQuality=0
+CVars=r.MobileContentScaleFactor=0.8
+CVars=r.Streaming.PoolSize=256

[Android_Mid DeviceProfile]
DeviceType=Android
BaseProfileName=Android
+CVars=sg.ViewDistanceQuality=1
+CVars=sg.ShadowQuality=1
+CVars=sg.PostProcessQuality=1
+CVars=sg.EffectsQuality=1
+CVars=r.MobileContentScaleFactor=0.9
+CVars=r.Streaming.PoolSize=490
+CVars=r.DynamicRes.OperationMode=2

[Android_High DeviceProfile]
DeviceType=Android
BaseProfileName=Android
+CVars=sg.ViewDistanceQuality=2
+CVars=sg.ShadowQuality=2
+CVars=sg.PostProcessQuality=2
+CVars=sg.EffectsQuality=2
+CVars=r.MobileContentScaleFactor=1.0
+CVars=r.Streaming.PoolSize=768

; === GPU Family → Tier Mapping ===
[Android_Adreno7xx DeviceProfile]
DeviceType=Android
BaseProfileName=Android_High

[Android_Adreno6xx DeviceProfile]
DeviceType=Android
BaseProfileName=Android_High

[Android_Adreno5xx DeviceProfile]
DeviceType=Android
BaseProfileName=Android_Mid

[Android_Mali_G710 DeviceProfile]
DeviceType=Android
BaseProfileName=Android_High

[Android_Mali_G78 DeviceProfile]
DeviceType=Android
BaseProfileName=Android_Mid

[Android_Mali_G71 DeviceProfile]
DeviceType=Android
BaseProfileName=Android_Low

; === Fallback ===
[Android_Default DeviceProfile]
DeviceType=Android
BaseProfileName=Android_Mid
```

## Querying Device Profile at Runtime (C++)

```cpp
// Get the active device profile
UDeviceProfile* Profile = UDeviceProfileManager::Get().GetActiveProfile();
FString ProfileName = Profile->GetName();

// Read a CVar from the active profile
int32 ShadowQuality;
Profile->GetConsolidatedCVarValue(TEXT("sg.ShadowQuality"), ShadowQuality);

// Check the device profile hierarchy
UDeviceProfile* Parent = Profile->Parent;
```

## Querying Device Profile at Runtime (Python/AgentBridge)

```python
import unreal

# Get the device profile manager
dpm = unreal.DeviceProfileManager.get()
profiles = dpm.profiles
for p in profiles:
    print(f"{p.get_name()} -> base: {p.base_profile_name}")
```
