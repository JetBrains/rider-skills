# Mobile Platform Configuration — iOS & Android

## CRITICAL — Cook-Time vs Runtime Settings

This is the single most important concept for mobile platform configuration. Getting this wrong causes **all materials to render black** with no error message.

### Cook-time settings (NEVER override in platform config files)

These settings determine which **shader permutations** are compiled during cooking. The cooker bakes them into the shader binaries. Changing them at runtime via platform config (`Config/IOS/IOSEngine.ini` or `Config/Android/AndroidEngine.ini`) makes cooked shaders incompatible with what the renderer expects → **black screen**.

| Setting | What it controls |
|---------|-----------------|
| `r.Substrate` | Substrate vs legacy material system — entirely different shader code paths |
| `r.Mobile.ShadingPath` | Forward (0) vs Deferred (1) — different GBuffer layout and lighting shaders |
| `r.MobileHDR` | HDR vs LDR pipeline — changes tone mapping, post-process, and material output |
| `r.DynamicGlobalIlluminationMethod` | GI method baked into material shaders |
| `r.ReflectionMethod` | Reflection capture method baked into shaders |
| `r.AllowStaticLighting` | Static lighting data baked into lightmaps at cook time |
| `r.ForwardShading` | Forward vs deferred (desktop) — different shader compilation |
| `r.SkinCache.CompileShaders` | Skin cache shader variants compiled at cook time |

**If you need different values per platform**, set them in `DefaultEngine.ini` BEFORE cooking. The cooker will compile the correct shader variants for each target platform based on the global settings.

### Runtime-toggleable settings (SAFE to override per-platform)

These are feature toggles that work at runtime without shader recompilation:

| Setting | Safe in platform config? | Notes |
|---------|------------------------|-------|
| `r.RayTracing` | Yes | Feature gate, not a shader permutation change |
| `r.RayTracing.RayTracingProxies.ProjectEnabled` | Yes | Runtime toggle |
| `r.Shadow.Virtual.Enable` | Yes | Falls back to shadow maps |
| `r.GenerateMeshDistanceFields` | Yes | Runtime mesh processing toggle |
| `r.Mobile.AllowDitheredLODTransition` | Yes | Runtime LOD transition effect |
| `r.Mobile.AllowSoftwareOcclusion` | Yes | Runtime culling toggle |
| `r.Mobile.EnableStaticAndCSMShadowReceivers` | Yes | Runtime shadow toggle |
| `r.Mobile.AllowMovableDirectionalLights` | Yes | Runtime light toggle |
| `r.Mobile.AllowDistanceFieldShadows` | Yes | Runtime shadow toggle |
| `r.Mobile.UseHWsRGBEncoding` | Yes | Runtime encoding toggle |
| `r.Nanite` | Yes | Feature gate (unsupported on mobile anyway) |
| `r.Lumen.*` | Yes | Feature gates |

---

## iOS Configuration

### iOS Runtime Settings (`Config/DefaultEngine.ini`)

```ini
[/Script/IOSRuntimeSettings.IOSRuntimeSettings]
; Orientation
bSupportsPortraitOrientation=False
bSupportsUpsideDownOrientation=False
bSupportsLandscapeLeftOrientation=True
bSupportsLandscapeRightOrientation=True

; Graphics
bSupportsMetal=True
bSupportsMetalMRT=True
PreferredGraphicsAPI=Metal

; Deployment
MinimumiOSVersion=IOS_16
bSupportsIPad=True
bSupportsIPhone=True

; App Identity
BundleDisplayName=My Game
BundleName=MyGame
BundleIdentifier=com.mystudio.mygame
VersionInfo=1.0.0

; Signing (automatic is recommended for Development builds)
bAutomaticSigning=True
; IOSTeamID is legacy — set CodeSigningTeam in XcodeProjectSettings instead
IOSTeamID=YOUR_TEAM_ID

; Capabilities (disable if not used — auto-signing profiles don't support all)
bEnableRemoteNotificationsSupport=False
bEnableCloudKitSupport=False

; Symbols
bGenerateCrashReportSymbols=True
bGeneratedSYMBundle=False
bGeneratedSYMFile=False

; Frame rate (0=device default, 30, 60, 120)
FrameRateLock=PUFRL_None

; Audio
AudioSampleRate=44100
AudioCallbackBufferFrameSize=1024
AudioNumBuffersToEnqueue=4
```

### iOS Signing — Key Points

1. **`CodeSigningTeam`** in `[/Script/MacTargetPlatform.XcodeProjectSettings]` is what actually sets `DEVELOPMENT_TEAM` in the Xcode xcconfig. `IOSTeamID` in `IOSRuntimeSettings` only feeds the legacy provisioning profile lookup.

2. **Auto-detect Team ID** from keychain before asking the user:
   ```bash
   security find-certificate -c "Apple Development" -p 2>/dev/null \
     | openssl x509 -noout -subject 2>/dev/null \
     | grep -oE 'OU=[A-Z0-9]{10}' | cut -d= -f2
   ```

3. **`bAutomaticSigning=True`** — Xcode manages provisioning profiles. Note: Xcode may override `BundleIdentifier` with its own pattern (`com.YourCompany.<ProjectName>`). To use a custom bundle ID, create a matching App ID in the Apple Developer Portal first, or use manual signing.

4. **Remote notifications** — Disable `bEnableRemoteNotificationsSupport` when using automatic signing, as auto-generated provisioning profiles don't include push notification entitlements.

### iOS Rendering Override (`Config/IOS/IOSEngine.ini`)

Only runtime-safe overrides:

```ini
[/Script/Engine.RendererSettings]
; Disable features unsupported on iOS
r.RayTracing=False
r.RayTracing.RayTracingProxies.ProjectEnabled=False
r.Shadow.Virtual.Enable=0
r.GenerateMeshDistanceFields=False

; Mobile rendering knobs (runtime-safe)
r.Mobile.AllowDitheredLODTransition=True
r.Mobile.AllowSoftwareOcclusion=True
r.Mobile.EnableStaticAndCSMShadowReceivers=True
r.Mobile.AllowMovableDirectionalLights=True
```

### iOS Performance Budgets

| Metric | Budget | Notes |
|--------|--------|-------|
| Draw calls | ≤700 per view (ideal ≤200) | Use `stat scenerendering` |
| Triangles | ≤500K per view | At 30fps target; ≤300K for 60fps |
| Texture size | Max 2048x2048 | 1024x1024 preferred; always power-of-two |
| Material texture samplers | ≤5 per material | iOS Metal limit; fewer is better |
| Material instructions | ≤128 pixel shader | Use `stat material` to check |
| Translucent/masked layers | Minimize | iOS shades every layer; opaque is free |

---

## Android Configuration

### Android Runtime Settings (`Config/DefaultEngine.ini`)

```ini
[/Script/AndroidRuntimeSettings.AndroidRuntimeSettings]
; App Identity
PackageName=com.mystudio.mygame
StoreVersion=1
StoreVersionOffsetArm64=0
ApplicationDisplayName=My Game
VersionDisplayName=1.0.0

; SDK Versions
MinSDKVersion=26          ; Android 8.0 — reasonable modern minimum
TargetSDKVersion=34       ; Android 14 — Google Play requires recent target

; Installation
InstallLocation=Auto
bPackageDataInsideApk=False   ; False = use OBB/PAD for large games
bUseExternalFilesDir=False

; Display
Orientation=SensorLandscape   ; or Portrait, Landscape, SensorPortrait
MaxAspectRatio=2.100000
bFullScreen=True

; Graphics API (Vulkan recommended, OpenGL ES 3.2 as fallback)
bSupportsVulkan=True
bSupportsVulkanSM5=False      ; True for desktop-quality on high-end Android
bBuildForES31=True            ; OpenGL ES 3.1 fallback

; Architecture (arm64 only for modern Android)
bBuildForArm64=True

; Input
bEnableNewKeyboard=True
bAllowIMU=True

; Texture Compression (ASTC recommended for modern, ETC2 for broadest compat)
; Texture format priority (higher = preferred):
;   ASTC: best quality/compression ratio, 75%+ device coverage
;   ETC2:  universal OpenGL ES 3.0+, 90%+ device coverage
;   Use -cookflavor=ASTC or ETC2 or Multi when packaging
bValidateTextureFormats=True

; Audio
AudioSampleRate=44100
AudioCallbackBufferFrameSize=1024
AudioNumBuffersToEnqueue=4

; Streaming
bStreamingEnabled=True
MaxComputeShaderThreadsPerGroup=128
```

### Android Graphics API Decision Matrix

| API | Config | Use When | Notes |
|-----|--------|----------|-------|
| Vulkan (mobile) | `bSupportsVulkan=True, bSupportsVulkanSM5=False` | Default for most games | Best performance, 90%+ modern devices |
| Vulkan SM5 (desktop) | `bSupportsVulkan=True, bSupportsVulkanSM5=True` | High-end tablets, Chromebooks | Desktop renderer on mobile; experimental |
| OpenGL ES 3.1 | `bBuildForES31=True` | Fallback for old devices | Auto-fallback when Vulkan unavailable |
| Multi (Vulkan + GLES) | Both enabled | Broadest compatibility | Ships both renderers, device selects |

### Android Texture Compression

| Format | Device Coverage | Quality | Size | Recommended For |
|--------|----------------|---------|------|----------------|
| ASTC | ~77% | Best | Smaller | Modern games (2020+ devices) |
| ETC2 | ~93% | Good | Medium | Broadest compatibility |
| Multi | 100% | Best per-device | Largest | When targeting all devices |

Configure in packaging: `-cookflavor=ASTC` or `ETC2` or `Multi`

ASTC quality (block size) in Project Settings > Cooker > Texture:
- 0 = 12x12 (smallest, lowest quality)
- 1 = 10x10
- 2 = 8x8 (default ISPC max)
- 3 = 6x6 (engine default, good balance)
- 4 = 4x4 (highest quality, largest)

### Android Rendering Override (`Config/Android/AndroidEngine.ini`)

Only runtime-safe overrides:

```ini
[/Script/Engine.RendererSettings]
; Disable features unsupported/expensive on Android
r.RayTracing=False
r.Shadow.Virtual.Enable=0
r.GenerateMeshDistanceFields=False

; Mobile rendering knobs (runtime-safe)
r.Mobile.EnableStaticAndCSMShadowReceivers=True
r.Mobile.AllowDistanceFieldShadows=True
r.Mobile.AllowMovableDirectionalLights=True
r.Mobile.AllowDitheredLODTransition=True
r.Mobile.UseHWsRGBEncoding=True
r.Android.DisableVulkanSM5Support=False
```

### Android Performance Budgets

| Metric | Low-end | Mid-range | High-end |
|--------|---------|-----------|----------|
| Draw calls | ≤100 | ≤300 | ≤700 |
| Triangles | ≤100K | ≤300K | ≤500K |
| Texture size | 512x512 | 1024x1024 | 2048x2048 |
| Material samplers | ≤3 | ≤5 | ≤5 |
| Target FPS | 30 | 30-60 | 60 |

### Android 16 KB Page Size (UE 5.6+)

Android 15 (API 35+) supports 16 KB page sizes. UE 5.6+ handles this automatically. Slightly more memory usage but improved performance. No config changes needed.

---

## Mobile Rendering — Global Settings (DefaultEngine.ini)

These settings go in `DefaultEngine.ini` and affect ALL platforms during cooking. Choose values that work for your target platforms:

### Mobile Shading Path

```ini
[/Script/Engine.RendererSettings]
; 0 = Forward (default), 1 = Deferred
; Deferred: better lighting, more features, slight overhead
; Forward: simpler, better for precomputed lighting, lower GPU cost
; MUST be set before cooking — cannot override per-platform
r.Mobile.ShadingPath=1

; Extended GBuffer for deferred (removes Mali limitations)
; Only relevant when r.Mobile.ShadingPath=1
r.Mobile.UseGPUSceneTexture=True
```

### Mobile HDR

```ini
[/Script/Engine.RendererSettings]
; True = HDR rendering (tone mapping, post-process, bloom)
; False = LDR rendering (faster, simpler, no post-process)
; MUST be set before cooking — cannot override per-platform
r.MobileHDR=True
```

### Shader Permutation Reduction

Reducing permutations cuts compile time, package size, and load time by up to 50%.
Settings in Project Settings > Engine > Rendering > Shader Permutation Reduction:

| Setting | Disable if... | Impact |
|---------|--------------|--------|
| Support Stationary Skylight | No stationary skylight used | Reduces basepass permutations |
| Low-Quality Lightmap Shader Permutations | Not using static lighting | Major reduction |
| Support PointLight WholeSceneShadows | No point light shadows needed | Reduces VS/GS permutations |
| Support Atmospheric Fog | No AtmosphericFog actor | Reduces basepass permutations |
| Support Sky Atmosphere | No SkyAtmosphere component | Reduces sampler/texture bindings on ALL mobile surfaces |
| Support Sky Atmosphere Affecting Height Fog | Not combining sky+fog | Requires sampler bindings on all mobile surfaces |

### Material Quality Levels

Different material quality per platform via Device Profiles:

```ini
; In DefaultDeviceProfiles.ini
[IOS DeviceProfile]
DeviceType=IOS
+CVars=r.MaterialQualityLevel=1    ; 0=Low, 1=Medium, 2=High, 3=Epic

[Android_Low DeviceProfile]
DeviceType=Android
+CVars=r.MaterialQualityLevel=0

[Android_High DeviceProfile]
DeviceType=Android
+CVars=r.MaterialQualityLevel=2
```

---

## Mobile Optimization CVars Reference

### Texture & Memory

```ini
; Texture streaming pool size (MB) — reduce for low-end
r.Streaming.PoolSize=400          ; Desktop default ~1000, mobile 200-600

; Max temporary memory for streaming (MB)
r.Streaming.MaxTempMemoryAllowed=20

; Texture LOD bias (higher = lower quality, less memory)
r.Streaming.MipBias=0            ; 0=default, 1=one mip lower, etc.

; Mobile content scale factor (resolution scaling)
r.MobileContentScaleFactor=1.0   ; 0.5-1.0 range; lower = faster
```

### Shadows

```ini
; Shadow map resolution (lower = faster)
r.Shadow.MaxResolution=1024       ; Desktop: 2048, Mobile: 512-1024

; Cascaded Shadow Map distance
r.Shadow.DistanceScale=0.5        ; Reduce shadow draw distance

; Number of CSM cascades
r.Shadow.CSM.MaxCascades=2        ; Desktop: 4, Mobile: 1-2
```

### Post-Processing

```ini
; Bloom quality (0=off, 1-5 quality levels)
r.BloomQuality=3                  ; Mobile: 1-3

; Depth of field quality
r.DepthOfFieldQuality=1           ; Mobile: 0-1

; Motion blur
r.MotionBlurQuality=0             ; Off on mobile recommended

; Ambient occlusion
r.AmbientOcclusionLevels=0        ; Off on mobile recommended
```

### LOD & Culling

```ini
; Static mesh LOD distance scale (higher = LOD sooner)
r.StaticMeshLODDistanceScale=1.5  ; Mobile: 1.5-2.0

; Skeletal mesh LOD bias
r.SkeletalMeshLODBias=1           ; Mobile: 1-2

; Foliage culling
foliage.MinimumScreenSize=0.001   ; Increase for mobile

; Max objects per draw call for instancing
r.MeshDrawCommands.DynamicInstancing=1
```

---

## Device Profiles for Mobile

### Recommended tier structure

```ini
; Config/DefaultDeviceProfiles.ini

[IOS DeviceProfile]
DeviceType=IOS
+CVars=r.MaterialQualityLevel=1
+CVars=r.MobileContentScaleFactor=1.0
+CVars=r.Streaming.PoolSize=400

[IOS_Low DeviceProfile]
DeviceType=IOS
BaseProfileName=IOS
+CVars=r.MaterialQualityLevel=0
+CVars=r.MobileContentScaleFactor=0.75
+CVars=r.Streaming.PoolSize=200
+CVars=r.Shadow.MaxResolution=512

[IOS_High DeviceProfile]
DeviceType=IOS
BaseProfileName=IOS
+CVars=r.MaterialQualityLevel=2
+CVars=r.MobileContentScaleFactor=1.0
+CVars=r.Streaming.PoolSize=600
+CVars=r.Shadow.MaxResolution=1024

[Android DeviceProfile]
DeviceType=Android
+CVars=r.MaterialQualityLevel=1
+CVars=r.MobileContentScaleFactor=1.0
+CVars=r.Streaming.PoolSize=300

[Android_Low DeviceProfile]
DeviceType=Android
BaseProfileName=Android
+CVars=r.MaterialQualityLevel=0
+CVars=r.MobileContentScaleFactor=0.6
+CVars=r.Streaming.PoolSize=150
+CVars=r.Shadow.MaxResolution=256
+CVars=r.Shadow.CSM.MaxCascades=1
+CVars=r.BloomQuality=1
+CVars=r.StaticMeshLODDistanceScale=2.0

[Android_Mid DeviceProfile]
DeviceType=Android
BaseProfileName=Android
+CVars=r.MaterialQualityLevel=1
+CVars=r.MobileContentScaleFactor=0.8
+CVars=r.Streaming.PoolSize=300
+CVars=r.Shadow.MaxResolution=512
+CVars=r.Shadow.CSM.MaxCascades=2

[Android_High DeviceProfile]
DeviceType=Android
BaseProfileName=Android
+CVars=r.MaterialQualityLevel=2
+CVars=r.MobileContentScaleFactor=1.0
+CVars=r.Streaming.PoolSize=500
+CVars=r.Shadow.MaxResolution=1024
+CVars=r.Shadow.CSM.MaxCascades=2
+CVars=r.BloomQuality=3
```

### GPU-based matching (Android)

```ini
[Android DeviceProfile]
; Adreno 6xx+ → High
+MatchProfile=(Profile="Android_High",Match=((SourceType=SRC_GpuFamily,CompareType=CMP_Regex,MatchString="^Adreno \\(TM\\) [6-9]")))
; Mali G7x+ → High
+MatchProfile=(Profile="Android_High",Match=((SourceType=SRC_GpuFamily,CompareType=CMP_Regex,MatchString="^Mali-G7[1-9]")))
; Adreno 5xx → Mid
+MatchProfile=(Profile="Android_Mid",Match=((SourceType=SRC_GpuFamily,CompareType=CMP_Regex,MatchString="^Adreno \\(TM\\) 5")))
; Everything else → Low
```

---

## Common Mobile Configuration Mistakes

1. **Overriding cook-time settings in platform config → black screen** (see top of this file)
2. **Setting `r.MobileHDR=False` after cooking with `True`** → LDR pipeline expects different shaders
3. **Forgetting `bSupportsMetal=True`** for iOS → no valid rendering API
4. **Using `bSupportsVulkanSM5=True` on low-end Android** → crashes or very poor performance
5. **Not disabling unused shader permutations** → 2x compile time and package size
6. **Texture sizes > 2048 on mobile** → memory exhaustion, streaming stalls
7. **Too many draw calls** → frame time dominated by CPU submission
8. **Enabling ray tracing globally** → iOS/Android fail to load RT shaders
9. **Setting `TargetSDKVersion` too low on Android** → Google Play rejection
10. **Enabling remote notifications with automatic signing on iOS** → provisioning profile mismatch
