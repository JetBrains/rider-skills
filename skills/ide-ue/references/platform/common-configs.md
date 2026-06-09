# Common Configuration Reference

## DefaultEngine.ini

The primary configuration file for engine-level settings. Lives at `Config/DefaultEngine.ini` in your project.

### Rendering Settings

```ini
[/Script/Engine.RendererSettings]
; Anti-aliasing method: 0=None, 1=FXAA, 2=TAA, 3=MSAA, 4=TSR
r.DefaultFeature.AntiAliasing=2

; Auto-exposure
r.DefaultFeature.AutoExposure=True
r.DefaultFeature.AutoExposure.Method=0
r.DefaultFeature.AutoExposure.Bias=1.0

; Motion blur
r.DefaultFeature.MotionBlur=True

; Ambient occlusion
r.DefaultFeature.AmbientOcclusion=True
r.DefaultFeature.AmbientOcclusionStaticFraction=True

; Bloom
r.DefaultFeature.Bloom=True

; Lens flare
r.DefaultFeature.LensFlare=False

; Global illumination method: 0=None, 1=Lumen, 2=SSGI, 3=Plugin
r.GeneratedMeshAreaLight.Method=1

; Shadow map method: 0=Shadow Maps, 1=Virtual Shadow Maps
r.Shadow.Virtual.Enable=1

; Nanite (UE5 virtualized geometry)
r.Nanite=1
r.Nanite.MaxPixelsPerEdge=1.0

; Lumen global illumination
r.Lumen.DiffuseIndirect.Allow=1
r.Lumen.Reflections.Allow=1
r.Lumen.TraceMeshSDFs.Allow=1
r.Lumen.HardwareRayTracing=0

; Virtual Shadow Maps
r.Shadow.Virtual.Enable=1
r.Shadow.Virtual.Clipmap.FirstCoarseLevel=15

; Hardware ray tracing
r.RayTracing=0
r.RayTracing.Shadows=0
r.RayTracing.Reflections=0
r.RayTracing.GlobalIllumination=0

; Screen-space reflections
r.SSR.Quality=3
r.SSR.HalfResSceneColor=0

; Substrate (UE 5.4+ material system, replaces legacy shading)
r.Substrate=0

; Forward shading (vs deferred)
r.ForwardShading=False

; MSAA sample count (only with forward shading)
r.MSAACount=4

; Texture streaming
r.Streaming.PoolSize=1000
r.Streaming.MaxTempMemoryAllowed=50

; Virtual textures
r.VirtualTextures=True
r.VT.TileSize=128

; Default material quality level
r.MaterialQualityLevel=1
```

### Physics Settings

```ini
[/Script/Engine.PhysicsSettings]
; Physics engine: Chaos is default in UE5
PhysicsPrediction=ProjectSettings
DefaultDegreesOfFreedom=Full3D
bSuppressFaceRemapTable=False
bSupportUVFromHitResults=False
bDisableActiveActors=False
bDisableKinematicStaticPairs=False
bDisableKinematicKinematicPairs=False
bDisableCCD=False
AnimPhysicsMinDeltaTime=0.000000
bSimulateAnimPhysicsAfterReset=False
MaxPhysicsDeltaTime=0.033333
bSubstepping=False
bSubsteppingAsync=False
MaxSubstepDeltaTime=0.016667
MaxSubsteps=6
SyncSceneSmoothingFactor=0.000000
InitialAverageFrameRate=0.016667
PhysXTreeRebuildRate=10
+DefaultBroadphaseSettings=(bUseMBPOnClient=False,bUseMBPOnServer=False,MBPBounds=(Min=(X=0.000000,Y=0.000000,Z=0.000000),Max=(X=0.000000,Y=0.000000,Z=0.000000)),MBPNumSubdivs=2)

; Chaos physics settings (UE5)
[/Script/Engine.ChaosPhysicsSettings]
bIterativeParallelPairSolverEnabled=True
MaximumParticleCount=0
MinimumParticleCount=0
```

### Streaming Settings

```ini
[/Script/Engine.StreamingSettings]
s.MinBulkDataSizeForAsyncLoading=131072
s.AsyncLoadingThreadEnabled=True
s.EventDrivenLoaderEnabled=True
s.WarnIfTimeLimitExceeded=False
s.TimeLimitExceededMultiplier=1.5
s.TimeLimitExceededMinTime=0.005
s.UseBackgroundLevelStreaming=True
s.PriorityAsyncLoadingExtraTime=15.0
s.LevelStreamingActorsUpdateTimeLimit=5.0
s.PriorityLevelStreamingActorsUpdateExtraTime=5.0
s.LevelStreamingComponentsRegistrationGranularity=10
s.LevelStreamingComponentsUnregistrationGranularity=5
s.FlushStreamingOnExit=True
```

### Audio Settings

```ini
[Audio]
; Master audio quality (0=Low, 1=Medium, 2=High, 3=Epic)
AudioQualityLevel=3
MaxChannels=32
CommonAudioPoolSize=0

[/Script/Engine.AudioSettings]
DefaultSoundClassName=/Script/Engine.SoundClass'/Engine/EngineSounds/Master.Master'
DefaultMediaSoundClassName=None
DefaultSoundConcurrencyName=/Script/Engine.SoundConcurrency'/Engine/EngineSounds/DefaultConcurrency.DefaultConcurrency'
DefaultBaseSoundMix=None
VoiPSoundClass=None
MasterSubmix=None
BaseDefaultSubmix=None
EQSubmix=None
ReverbSubmix=None
DefaultReverbSendLevel=0.000000
MaximumConcurrentStreams=32
GlobalMinPitchScale=0.400000
GlobalMaxPitchScale=4.000000
bAllowPlayWhenSilent=True
bDisableMasterEQ=False
bAllowCenterChannel3DPanning=True
NumStoppingSources=8
PanningMethod=Linear
MonoChannelUpmixMethod=Linear
DialogueFilenameFormat={DialogueName}/{DialogueWave}_{ContextHash}_{WaveIndex}
```

### Garbage Collection Settings

```ini
[/Script/Engine.GarbageCollectionSettings]
gc.MaxObjectsNotConsideredByGC=655360
gc.SizeOfPermanentObjectPool=16777216
gc.FlushStreamingOnGC=False
gc.NumRetriesBeforeForcingGC=10
gc.MaxObjectsInGame=2162688
gc.MaxObjectsInEditor=12582912
gc.TimeBetweenPurgingPendingKillObjects=60.000000
gc.IncrementalBeginDestroyEnabled=True
gc.CreateGCClusters=True
gc.MinGCClusterSize=5
gc.ActorClusteringEnabled=True
gc.BlueprintClusteringEnabled=True
gc.MultithreadedDestructionEnabled=True
gc.VerifyGCObjectNames=False
```

### Networking Settings

```ini
[/Script/Engine.NetworkSettings]
n.VerifyPeer=True

[/Script/OnlineSubsystemUtils.IpNetDriver]
NetServerMaxTickRate=30
MaxNetTickRate=120
MaxInternetClientRate=10000
MaxClientRate=15000
LanServerMaxTickRate=35
InitialConnectTimeout=120.0
ConnectionTimeout=80.0

[/Script/Engine.Player]
ConfiguredInternetSpeed=10000
ConfiguredLanSpeed=20000

[URL]
; Default map to load
Map=/Game/Maps/DefaultMap
; Default game mode
GameName=
; Default port
Port=7777
```

### Console Variables Section

```ini
[ConsoleVariables]
; CVars set here apply at engine startup
; Useful for settings that don't have a dedicated section

; Frame rate
t.MaxFPS=0
; 0 = uncapped

; Distance field ambient occlusion
r.AOQuality=2

; Shadow quality
r.ShadowQuality=5

; View distance scale
r.ViewDistanceScale=1.0

; Detail mode (0=Low, 1=Medium, 2=High)
r.DetailMode=2

; Texture quality
r.TextureStreaming=1

; Foliage density scale
foliage.DensityScale=1.0
```

### Startup and Core Settings

```ini
[/Script/Engine.Engine]
bSmoothFrameRate=True
MinDesiredFrameRate=8.000000
SmoothedFrameRateRange=(LowerBound=(Type=Inclusive,Value=22.000000),UpperBound=(Type=Exclusive,Value=120.000000))
MaxSmoothedFrameRate=120
bUseFixedFrameRate=False
FixedFrameRate=60.000000

[/Script/Engine.GameEngine]
MaxDeltaTime=0.3

[Core.System]
Paths=../../../Engine/Content
Paths=%GAMEDIR%Content
+Extensions=.dll
```

---

## DefaultGame.ini

Project-level game settings. Lives at `Config/DefaultGame.ini`.

```ini
[/Script/EngineSettings.GeneralProjectSettings]
ProjectID=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
ProjectName=My Game Project
CompanyName=My Studio
CompanyDistinguishedName=com.mystudio.mygame
CopyrightNotice=Copyright My Studio 2026. All rights reserved.
Description=A description of my game project
Homepage=https://www.mystudio.com
LicensingTerms=
ProjectVersion=1.0.0.0
SupportContact=support@mystudio.com
ProjectDisplayedTitle=NSLOCTEXT("MyGame", "GameTitle", "My Game")
ProjectDebugTitleInfo=NSLOCTEXT("MyGame", "DebugTitle", "My Game [{BUILD_VERSION}]")
bShouldWindowPreserveAspectRatio=True
bUseBorderlessWindow=False
bStartInVR=False
bAllowWindowResize=True
bAllowClose=True
bAllowMaximize=True
bAllowMinimize=True
bStartInAR=False
bSupportAR=False

[/Script/EngineSettings.GameMapsSettings]
; Editor startup map
EditorStartupMap=/Game/Maps/MainMenu
; Default maps
GameDefaultMap=/Game/Maps/MainMenu
ServerDefaultMap=/Game/Maps/Lobby
; Game modes
GlobalDefaultGameMode=/Script/MyGame.MyGameMode
GlobalDefaultServerGameMode=None
; Transition map (shown during seamless travel)
TransitionMap=

[/Script/UnrealEd.ProjectPackagingSettings]
BuildConfiguration=PPBC_Shipping
StagingDirectory=(Path="$(ProjectDir)/Build/Staged")
FullRebuild=False
ForDistribution=False
IncludeDebugFiles=False
BlueprintNativizationMethod=Disabled
bIncludeNativizedAssetsInProjectGeneration=False
bExcludeMonolithicEngineHeadersInNativizedCode=False
bCompressed=True
bForceCompressed=False
PakFileCompressionFormat=Oodle
bEncryptIniFiles=False
bEncryptPakIndex=False
+DirectoriesToAlwaysCook=(Path="/Game/Maps")
+DirectoriesToAlwaysCook=(Path="/Game/Data")
+DirectoriesToAlwaysStageAsUFS=(Path="/Game/Cinematics")
+DirectoriesToNeverCook=(Path="/Game/Test")
+DirectoriesToNeverCook=(Path="/Game/Developer")

[/Script/Engine.AssetManagerSettings]
; Primary asset types for the asset manager to scan
+PrimaryAssetTypesToScan=(PrimaryAssetType="Map",AssetBaseClass=/Script/Engine.World,bHasBlueprintClasses=False,bIsEditorOnly=True,Directories=((Path="/Game/Maps")),SpecificAssets=,Rules=(Priority=-1,ChunkId=-1,bApplyRecursively=True,CookRule=Unknown))
+PrimaryAssetTypesToScan=(PrimaryAssetType="PrimaryAssetLabel",AssetBaseClass=/Script/Engine.PrimaryAssetLabel,bHasBlueprintClasses=False,bIsEditorOnly=True,Directories=((Path="/Game")),SpecificAssets=,Rules=(Priority=-1,ChunkId=-1,bApplyRecursively=True,CookRule=AlwaysCook))
bShouldManagerDetermineTypeAndName=False
bOnlyCookProductionAssets=False
bShouldGuessTypeAndNameInEditor=True
bShouldAcquireMissingChunksOnLoad=False
+MetaDataTagsForAssetRegistry=("PrimaryAssetType")
```

---

## DefaultInput.ini

Input mapping configuration. Lives at `Config/DefaultInput.ini`.

### Legacy Input System (Action/Axis Mappings)

```ini
[/Script/Engine.InputSettings]
-AxisConfig=(AxisKeyName="Gamepad_LeftX",DeadZone=0.25,Sensitivity=1.0,Exponent=1.0,bInvert=False)
+AxisConfig=(AxisKeyName="Gamepad_LeftX",DeadZone=0.20,Sensitivity=1.0,Exponent=1.0,bInvert=False)
+AxisConfig=(AxisKeyName="Gamepad_LeftY",DeadZone=0.20,Sensitivity=1.0,Exponent=1.0,bInvert=False)
+AxisConfig=(AxisKeyName="Gamepad_RightX",DeadZone=0.20,Sensitivity=1.0,Exponent=1.0,bInvert=False)
+AxisConfig=(AxisKeyName="Gamepad_RightY",DeadZone=0.20,Sensitivity=1.0,Exponent=1.0,bInvert=False)
bAltEnterTogglesFullscreen=True
bF11TogglesFullscreen=True
bUseMouseForTouch=False
bEnableMouseSmoothing=True
bEnableFOVScaling=True
bCaptureMouseOnLaunch=True
bEnableLegacyInputScales=True
bEnableMotionControls=True
bFilterInputByPlatformUser=False
bShouldFlushPressedKeysOnViewportFocusLost=True
bAlwaysShowTouchInterface=False
bShowConsoleOnFourFingerTap=True
bEnableGestureRecognizer=False
DefaultViewportMouseCaptureMode=CapturePermanently_IncludingInitialMouseDown
DefaultViewportMouseLockMode=LockOnCapture
DefaultPlayerInputClass=/Script/Engine.PlayerInput
DefaultInputComponentClass=/Script/Engine.InputComponent

; Action mappings (digital on/off inputs)
+ActionMappings=(ActionName="Jump",bShift=False,bCtrl=False,bAlt=False,bCmd=False,Key=SpaceBar)
+ActionMappings=(ActionName="Jump",bShift=False,bCtrl=False,bAlt=False,bCmd=False,Key=Gamepad_FaceButton_Bottom)
+ActionMappings=(ActionName="Fire",bShift=False,bCtrl=False,bAlt=False,bCmd=False,Key=LeftMouseButton)
+ActionMappings=(ActionName="Fire",bShift=False,bCtrl=False,bAlt=False,bCmd=False,Key=Gamepad_RightTrigger)
+ActionMappings=(ActionName="Aim",bShift=False,bCtrl=False,bAlt=False,bCmd=False,Key=RightMouseButton)
+ActionMappings=(ActionName="Crouch",bShift=False,bCtrl=False,bAlt=False,bCmd=False,Key=LeftControl)
+ActionMappings=(ActionName="Sprint",bShift=False,bCtrl=False,bAlt=False,bCmd=False,Key=LeftShift)
+ActionMappings=(ActionName="Interact",bShift=False,bCtrl=False,bAlt=False,bCmd=False,Key=E)

; Axis mappings (analog range inputs)
+AxisMappings=(AxisName="MoveForward",Scale=1.000000,Key=W)
+AxisMappings=(AxisName="MoveForward",Scale=-1.000000,Key=S)
+AxisMappings=(AxisName="MoveRight",Scale=1.000000,Key=D)
+AxisMappings=(AxisName="MoveRight",Scale=-1.000000,Key=A)
+AxisMappings=(AxisName="MoveForward",Scale=1.000000,Key=Gamepad_LeftY)
+AxisMappings=(AxisName="MoveRight",Scale=1.000000,Key=Gamepad_LeftX)
+AxisMappings=(AxisName="Turn",Scale=1.000000,Key=Gamepad_RightX)
+AxisMappings=(AxisName="LookUp",Scale=-1.000000,Key=Gamepad_RightY)
+AxisMappings=(AxisName="Turn",Scale=1.000000,Key=MouseX)
+AxisMappings=(AxisName="LookUp",Scale=-1.000000,Key=MouseY)

; Touch interface setup
DefaultTouchInterface=/Engine/MobileResources/HUD/DefaultVirtualJoysticks.DefaultVirtualJoysticks
```

### Enhanced Input System (UE5)

Enhanced Input is configured primarily through data assets (Input Actions and Input Mapping Contexts) rather than `.ini` files. However, the `.ini` file controls which system is active:

```ini
[/Script/Engine.InputSettings]
; Use Enhanced Input as the default input component class
DefaultPlayerInputClass=/Script/EnhancedInput.EnhancedPlayerInput
DefaultInputComponentClass=/Script/EnhancedInput.EnhancedInputComponent

[/Script/EnhancedInput.EnhancedInputDeveloperSettings]
; Default mapping contexts to load for all players
+DefaultMappingContexts=(InputMappingContext=/Game/Input/IMC_Default.IMC_Default,Priority=0)
; Platform-specific input data
bEnableWorldSubsystem=False
bShouldOnlyTriggerLastActionInChord=True
```

---

## DefaultEditor.ini

Editor-specific preferences. Lives at `Config/DefaultEditor.ini`. These settings only affect the editor, not packaged builds.

```ini
[/Script/UnrealEd.EditorPerformanceSettings]
bThrottleCPUWhenNotForeground=True
bMonitorEditorPerformance=True

[/Script/UnrealEd.EditorExperimentalSettings]
bEnableAsyncTextureCompilation=True

[/Script/UnrealEd.EditorLoadingSavingSettings]
bAutoSaveEnable=True
bAutoSaveMaps=True
bAutoSaveContent=True
AutoSaveTimeMinutes=10
AutoSaveWarningInSeconds=5
bLoadPackagesForDirtyActors=True

[/Script/UnrealEd.LevelEditorPlaySettings]
PlayNumberOfClients=1
PlayNetMode=PIE_Standalone
ServerPort=17777
bAutoConnectToServer=True
ClientWindowWidth=640
ClientWindowHeight=480

[/Script/UnrealEd.EditorStyleSettings]
bUseSmallToolBarIcons=False
bUseGrid=True
RegularColor=(R=0.035,G=0.035,B=0.035,A=1.0)
RuleColor=(R=0.008,G=0.008,B=0.008,A=1.0)
CenterColor=(R=0.0,G=0.0,B=0.0,A=1.0)

[/Script/UnrealEd.PersonaOptions]
bFlattenSkeletonHierarchyWhenFiltering=True
bHideParentsWhenFiltering=False

[ContentBrowser]
; Default asset import settings
ShowEngineContent=False
ShowPluginContent=False
ShowDeveloperContent=False

[/Script/UnrealEd.EditorProjectAppearanceSettings]
bDisplayUnitsOnComponentTransforms=False

[/Script/BlueprintGraph.BlueprintEditorSettings]
bDrawMidpointArrowsInBlueprints=True
bShowActionMenuItemSignatures=False
SaveOnCompile=SoC_Never
bJumpToNodeErrors=True
bShowInheritedVariables=False
bAlwaysShowInterfacesInOverrides=True
bShowParentClassInOverrides=True
bShowAccessSpecifier=False
bSpawnDefaultBlueprintNodes=True
bHideConstructionScriptComponentsInDetailsView=True
bHostFindReferencesInExternalEditor=False
bNavigateToNativeFunctionsFromCallNodes=True
```

---

## DefaultScalability.ini

Quality level definitions. Lives at `Config/DefaultScalability.ini`. Each section maps to a scalability group and quality level (0=Low, 1=Medium, 2=High, 3=Epic, 4=Cinematic).

```ini
[ScalabilitySettings]
; Number of quality levels per group
PerfIndexThresholds_ResolutionQuality=18 40 55 70
PerfIndexThresholds_ViewDistanceQuality=18 40 55 70
PerfIndexThresholds_AntiAliasingQuality=18 40 55 70
PerfIndexThresholds_ShadowQuality=18 40 55 70
PerfIndexThresholds_GlobalIlluminationQuality=18 40 55 70
PerfIndexThresholds_ReflectionQuality=18 40 55 70
PerfIndexThresholds_PostProcessQuality=18 40 55 70
PerfIndexThresholds_TextureQuality=18 40 55 70
PerfIndexThresholds_EffectsQuality=18 40 55 70
PerfIndexThresholds_FoliageQuality=18 40 55 70
PerfIndexThresholds_ShadingQuality=18 40 55 70

[ViewDistanceQuality@0]
r.SkeletalMeshLODBias=2
r.ViewDistanceScale=0.4

[ViewDistanceQuality@1]
r.SkeletalMeshLODBias=1
r.ViewDistanceScale=0.6

[ViewDistanceQuality@2]
r.SkeletalMeshLODBias=0
r.ViewDistanceScale=0.8

[ViewDistanceQuality@3]
r.SkeletalMeshLODBias=0
r.ViewDistanceScale=1.0

[ShadowQuality@0]
r.ShadowQuality=1
r.Shadow.CSM.MaxCascades=1
r.Shadow.MaxResolution=512
r.Shadow.MaxCSMResolution=512
r.Shadow.RadiusThreshold=0.06
r.Shadow.DistanceScale=0.6
r.Shadow.CSM.TransitionScale=0

[ShadowQuality@3]
r.ShadowQuality=5
r.Shadow.CSM.MaxCascades=10
r.Shadow.MaxResolution=2048
r.Shadow.MaxCSMResolution=2048
r.Shadow.RadiusThreshold=0.01
r.Shadow.DistanceScale=1.0
r.Shadow.CSM.TransitionScale=1.0

[AntiAliasingQuality@0]
r.PostProcessAAQuality=0

[AntiAliasingQuality@3]
r.PostProcessAAQuality=6

[TextureQuality@0]
r.Streaming.MipBias=2.5
r.MaxAnisotropy=0
r.Streaming.PoolSize=200

[TextureQuality@3]
r.Streaming.MipBias=0
r.MaxAnisotropy=8
r.Streaming.PoolSize=1000

[EffectsQuality@0]
r.TranslucencyLightingVolumeDim=24
r.RefractionQuality=0
r.SSR.Quality=0
r.SceneColorFormat=3
r.DetailMode=0
r.TranslucencyVolumeBlur=0
r.MaterialQualityLevel=0
r.EmitterSpawnRateScale=0.5

[EffectsQuality@3]
r.TranslucencyLightingVolumeDim=64
r.RefractionQuality=2
r.SSR.Quality=3
r.SceneColorFormat=4
r.DetailMode=2
r.TranslucencyVolumeBlur=1
r.MaterialQualityLevel=1
r.EmitterSpawnRateScale=1.0

[PostProcessQuality@0]
r.MotionBlurQuality=0
r.AmbientOcclusionMipMapLevel=4
r.AmbientOcclusionMaxQuality=0
r.AmbientOcclusionLevels=0
r.AmbientOcclusionRadiusScale=1.2
r.DepthOfFieldQuality=0
r.RenderTargetPoolMin=300
r.LensFlareQuality=0
r.SceneColorFringeQuality=0
r.EyeAdaptationQuality=0
r.BloomQuality=4
r.Tonemapper.Quality=0

[PostProcessQuality@3]
r.MotionBlurQuality=4
r.AmbientOcclusionMipMapLevel=0
r.AmbientOcclusionMaxQuality=100
r.AmbientOcclusionLevels=-1
r.AmbientOcclusionRadiusScale=1.0
r.DepthOfFieldQuality=2
r.RenderTargetPoolMin=400
r.LensFlareQuality=2
r.SceneColorFringeQuality=1
r.EyeAdaptationQuality=2
r.BloomQuality=5
r.Tonemapper.Quality=5

[FoliageQuality@0]
foliage.DensityScale=0.2
grass.DensityScale=0.2
r.Landscape.LOD0DistributionScale=1.25

[FoliageQuality@3]
foliage.DensityScale=1.0
grass.DensityScale=1.0
r.Landscape.LOD0DistributionScale=1.0
```

---

## CommonUI and Input Settings (DefaultGame.ini)

### CommonUI Framework Settings

```ini
[/Script/CommonUI.CommonUISettings]
; Reference to your project's input data asset
InputData=/Game/UI/Common/CUI_InputData.CUI_InputData_C
; Disable if you want full control over input config
bEnableDefaultInputConfig=False
; Set to False if Enhanced Input handles gameplay; CommonUI handles UI only
bEnableEnhancedInputSupport=False
DefaultThrobberMaterial=None

[/Script/CommonUI.CommonUIInputSettings]
; Link cursor position to focused widget (gamepad UX)
bLinkCursorToGamepadFocus=True
; Higher = UI actions processed before gameplay input
UIActionProcessingPriority=10000
; Analog cursor for gamepad-driven menus
AnalogCursorSettings=(MaxSpeed=2200.0,CursorAcceleration=1500.0,StickySlowdown=0.4,DeadZone=0.25,ScrollDeadZone=0.2,ScrollUpdatePeriod=0.05,ScrollMultiplier=(X=1.0,Y=1.0))
```

### Per-Platform Input Settings

```ini
[CommonInputPlatformSettings_Windows CommonInputPlatformSettings]
DefaultInputType=MouseAndKeyboard
bSupportsMouseAndKeyboard=True
bSupportsTouch=False
bSupportsGamepad=True
DefaultGamepadName=Generic
bCanChangeGamepadType=True
+ControllerData=/Game/UI/Common/CUI_BaseControllerData.CUI_BaseControllerData_C
```

### CommonUI Editor Template Styles (DefaultEditor.ini)

```ini
[/Script/CommonUI.CommonUIEditorSettings]
TemplateTextStyle=/Game/UI/Common/CUI_Style_Text.CUI_Style_Text_C
TemplateButtonStyle=/Game/UI/Common/CUI_Style_Button.CUI_Style_Button_C
TemplateBorderStyle=/Game/UI/Common/CUI_Style_Border_Dark.CUI_Style_Border_Dark_C
```

### CommonGameViewportClient (DefaultEngine.ini)

Required for CommonUI input routing to work:

```ini
[/Script/Engine.Engine]
GameViewportClientClassName=/Script/CommonUI.CommonGameViewportClient
```

---

## Packaging Compression Settings

```ini
[/Script/UnrealEd.ProjectPackagingSettings]
UsePakFile=True
bCompressed=True
PackageCompressionFormat=Oodle
PackageCompressionMethod=Kraken
; Per-build-config compression levels (higher = slower but smaller)
PackageCompressionLevel_DebugGame=4
PackageCompressionLevel_Test=5
PackageCompressionLevel_Distribution=7
; Maps to cook (restrict to avoid packaging unused maps)
+MapsToCook=(FilePath="/Game/Maps/MainMenu")
+MapsToCook=(FilePath="/Game/Maps/GameLevel")
; Directories excluded from cooking
+DirectoriesToNeverCook=(Path="/Game/PackIgnore")
+DirectoriesToNeverCook=(Path="/Game/Developer")
; Material shader sharing (reduces shader permutations in packaged build)
bShareMaterialShaderCode=True
; Localization
InternationalizationPreset=English
+CulturesToStage=en
bCookMapsOnly=True
bSkipEditorContent=True
```

---

## Platform-Specific Overrides

Platform overrides are placed in `Config/<PlatformName>/<PlatformName><ConfigName>.ini`.

### Windows — `Config/Windows/WindowsEngine.ini`

```ini
[/Script/WindowsTargetPlatform.WindowsTargetSettings]
DefaultGraphicsRHI=DefaultGraphicsRHI_DX12
; Targeted RHI: DX11, DX12, Vulkan
+TargetedRHIs=PCD3D_SM6
+TargetedRHIs=PCD3D_SM5
MinimumOSVersion=Windows10
Compiler=Default
AudioDevice=XAudio2
```

### Mac — `Config/Mac/MacEngine.ini`

```ini
[/Script/MacTargetPlatform.MacTargetSettings]
+TargetedRHIs=SF_METAL_SM5
MaxShaderLanguageVersion=5
bUseFastIntrinsics=True
bForceFloats=False
EnableMathOptimisations=True

[/Script/Engine.RendererSettings]
; Metal-specific rendering adjustments (runtime-safe only)
r.RayTracing=False
```

### Mac — Modern Xcode Workflow (CRITICAL for Packaging)

**Without this setting, packaged Mac builds crash on launch** due to missing dylibs (libtbb, libmetalirconverter, libogg, libvorbis, etc.) not being staged into the `.app` bundle.

Add to `Config/DefaultEngine.ini`:

```ini
[/Script/MacTargetPlatform.XcodeProjectSettings]
bUseModernXcode=True
; REQUIRED for UE 5.3+ Mac/iOS packaging — enables standard Xcode framework
; handling to properly copy and codesign dylibs into the app bundle.
; Without this, BuildCookRun produces a .app missing its dynamic libraries.

; CRITICAL: CodeSigningTeam is used for ALL Apple platforms (Mac + iOS).
; For iOS, this is the ONLY way to set DEVELOPMENT_TEAM in the xcconfig.
; IOSTeamID in IOSRuntimeSettings does NOT populate DEVELOPMENT_TEAM
; in the Modern Xcode workflow — you MUST use CodeSigningTeam here.
CodeSigningTeam=<YOUR_TEAM_ID>

; Find your team ID (multiple methods):
;   1. Certificate: security find-certificate -c "Apple Development" ~/Library/Keychains/login.keychain-db | openssl x509 -noout -subject → look for OU=XXXXXXXXXX
;   2. Xcode: Settings → Accounts → select Apple ID → Team ID in detail panel
;   3. Apple Developer Portal: https://developer.apple.com/account → Membership Details
;   4. Provisioning profile: security cms -D -i ~/Library/MobileDevice/Provisioning\ Profiles/*.mobileprovision | grep -A1 TeamIdentifier

; Additional settings for distribution/notarization:
; bUseAutomaticCodeSigning=True
; bMacSignToRunLocally=False
; BundleIdentifier=com.yourcompany.yourgame
```

**Note:** The NNERuntimeORT plugin links `libonnxruntime` as a weak dependency. Even with Modern Xcode, this library may not be staged. If not needed, disable it in `.uproject`:
```json
{ "Name": "NNERuntimeORT", "Enabled": false }
```

### Linux — `Config/Linux/LinuxEngine.ini`

```ini
[/Script/LinuxTargetPlatform.LinuxTargetSettings]
+TargetedRHIs=SF_VULKAN_SM6
+TargetedRHIs=SF_VULKAN_SM5
+TargetedRHIs=GLSL_430

[/Script/Engine.RendererSettings]
r.Vulkan.EnableValidation=0
```

### iOS — Runtime Settings (in `Config/DefaultEngine.ini`)

**IMPORTANT:** iOS runtime settings go in `DefaultEngine.ini`, NOT in `Config/IOS/IOSEngine.ini`. The iOS-specific override file is for rendering/engine CVars only.

**CRITICAL:** Code signing team ID MUST be set in `[/Script/MacTargetPlatform.XcodeProjectSettings]` (see Mac — Modern Xcode section above). The `IOSTeamID` field below is used by the legacy signing path for provisioning profile lookup only — it does NOT set `DEVELOPMENT_TEAM` in the Modern Xcode xcconfig.

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
bEnableRemoteNotificationsSupport=False
bEnableCloudKitSupport=False
bGenerateCrashReportSymbols=True
BundleDisplayName=My Game
BundleName=MyGame
BundleIdentifier=com.mystudio.mygame
VersionInfo=1.0.0
bSupportsIPad=True
bSupportsIPhone=True
bAutomaticSigning=True
; IOSTeamID is only used by legacy signing path — set CodeSigningTeam
; in XcodeProjectSettings instead for Modern Xcode workflow
IOSTeamID=YOUR_TEAM_ID
```

### iOS — Rendering Overrides (`Config/IOS/IOSEngine.ini`)

**CRITICAL — Only override runtime-toggleable settings here.** Cook-time settings
(`r.Substrate`, `r.Mobile.ShadingPath`, `r.MobileHDR`, `r.DynamicGlobalIlluminationMethod`,
`r.ReflectionMethod`) determine shader permutations at cook time. Overriding them per-platform
at runtime causes ALL materials to render **black**. If you need different shading models per
platform, set them in `DefaultEngine.ini` BEFORE cooking.

```ini
[/Script/Engine.RendererSettings]
; SAFE to override per-platform (runtime-toggleable only):
r.RayTracing=False
r.RayTracing.RayTracingProxies.ProjectEnabled=False
r.Shadow.Virtual.Enable=0
r.GenerateMeshDistanceFields=False

; These are safe runtime knobs for mobile:
r.Mobile.AllowDitheredLODTransition=True
r.Mobile.AllowSoftwareOcclusion=True
r.Mobile.EnableStaticAndCSMShadowReceivers=True
r.Mobile.AllowMovableDirectionalLights=True

; NEVER put these in platform overrides (cook-time only):
; r.Substrate=...             ← BLACK SCREEN if mismatched
; r.Mobile.ShadingPath=...    ← BLACK SCREEN if mismatched
; r.MobileHDR=...             ← BLACK SCREEN if mismatched
; r.DynamicGlobalIlluminationMethod=...
; r.ReflectionMethod=...
; r.AllowStaticLighting=...
```

### Android — Runtime Settings (in `Config/DefaultEngine.ini`)

```ini
[/Script/AndroidRuntimeSettings.AndroidRuntimeSettings]
PackageName=com.mystudio.mygame
StoreVersion=1
StoreVersionOffsetArm64=0
ApplicationDisplayName=My Game
VersionDisplayName=1.0.0
MinSDKVersion=26
TargetSDKVersion=34
InstallLocation=Auto
bEnableGooglePlaySupport=False
bUseExternalFilesDir=False
bPublicLogFiles=True
Orientation=SensorLandscape
bFullScreen=True
bEnableNewKeyboard=True
DepthBufferPreference=Default
bValidateTextureFormats=True
bForceSmallOBBFiles=False
bAllowIMU=True
bSupportsVulkan=True
bSupportsVulkanSM5=False
bBuildForES31=True
MaxComputeShaderThreadsPerGroup=128
bStreamingEnabled=True
; Audio
AudioSampleRate=44100
AudioCallbackBufferFrameSize=1024
AudioNumBuffersToEnqueue=4
```

### Android — Rendering Overrides (`Config/Android/AndroidEngine.ini`)

**Same cook-time vs runtime rule applies as iOS.** Only override runtime-toggleable settings.

```ini
[/Script/Engine.RendererSettings]
; SAFE runtime overrides:
r.RayTracing=False
r.Shadow.Virtual.Enable=0
r.GenerateMeshDistanceFields=False
r.Mobile.EnableStaticAndCSMShadowReceivers=True
r.Mobile.AllowDistanceFieldShadows=True
r.Mobile.AllowMovableDirectionalLights=True
r.Mobile.AllowDitheredLODTransition=True
r.Mobile.UseHWsRGBEncoding=True
r.Android.DisableVulkanSM5Support=False

; NEVER put these here (cook-time only — causes black screen):
; r.MobileHDR=...
; r.Mobile.ShadingPath=...
; r.Substrate=...
```

### Console (PS5 example) — `Config/PS5/PS5Engine.ini`

```ini
[/Script/PS5PlatformEditor.PS5TargetSettings]
bUseNativeSonyAudio=True
TitleID=PPSA00000
ContentID=
ParamSfxDescription=My Game
AudioSampleRate=48000
bSupportHDRDisplay=True
bSupportResolutionModes=True
DefaultDisplayResolution=TwoK

[/Script/Engine.RendererSettings]
; Console-specific rendering
r.Shadow.Virtual.Enable=1
r.Nanite=1
r.Lumen.DiffuseIndirect.Allow=1
r.Lumen.Reflections.Allow=1
```

---

## Performance-Related Console Variables

### Frame Rate and Timing

```ini
[ConsoleVariables]
t.MaxFPS=60
; 0 = uncapped

t.IdleWhenNotForeground=1
; Throttle when window is not focused

r.VSync=0
; 0 = off, 1 = on

r.OneFrameThreadLag=1
; 1 = allow one frame of render thread lag (default, better perf)
```

### CPU / Threading

```ini
[ConsoleVariables]
r.RHICmdBypass=0
; 0 = use parallel RHI command list (default)

r.RHIThread.Enable=1
; 1 = enable dedicated RHI thread

s.AsyncLoadingThreadEnabled=True
; Enable async loading thread

s.EventDrivenLoaderEnabled=True
; Use event-driven loader for better I/O performance

gc.TimeBetweenPurgingPendingKillObjects=60
; Seconds between GC purge passes

gc.MaxObjectsNotConsideredByGC=655360
; Objects in the permanent pool (never GC'd)
```

### GPU / Draw Call Optimization

```ini
[ConsoleVariables]
r.MeshDrawCommands.UseCachedCommands=1
; Cache mesh draw commands to reduce CPU overhead

r.GPUScene.Enable=1
; GPU scene for instanced rendering

r.ISR.Enable=1
; Instanced stereo rendering (VR)

r.DoLazyStaticMeshUpdate=1
; Defer static mesh updates for better frame pacing

r.EarlyZPass=3
; 0=None, 1=Opaque only, 2=Opaque+Masked, 3=Full (recommended)

r.HZBOcclusion=1
; Hierarchical Z-buffer occlusion culling

r.AllowOcclusionQueries=1
; Hardware occlusion queries
```

---

## Rendering CVars: Nanite, Lumen, Virtual Shadow Maps

### Nanite

```ini
[ConsoleVariables]
r.Nanite=1
; Master enable

r.Nanite.MaxPixelsPerEdge=1.0
; Pixel error threshold. Lower = more triangles, higher quality.
; 1.0 default. 0.5 for high quality. 2.0 for performance.

r.Nanite.StreamingPoolSize=512
; MB for Nanite streaming pool

r.Nanite.VSMInvalidateOnLODDelta=0
; Invalidate virtual shadow maps on Nanite LOD changes

r.Nanite.OccludedInstances=1
; Enable occlusion culling for Nanite instances

r.Nanite.Tessellation=0
; Enable displacement-based tessellation (UE 5.4+)

r.Nanite.MaxCandidateClusters=16384
; Maximum cluster candidates per frame

r.Nanite.MaxVisibleClusters=4194304
; Maximum visible clusters per frame
```

### Lumen

```ini
[ConsoleVariables]
; -- Global Illumination --
r.Lumen.DiffuseIndirect.Allow=1
; Master enable for Lumen GI

r.Lumen.TraceMeshSDFs.Allow=1
; Trace against mesh signed distance fields

r.Lumen.ScreenProbeGather.ScreenSpaceBentNormal=1
; Screen space bent normals for GI

r.Lumen.DiffuseIndirect.SSAO=1
; Mix SSAO with Lumen GI

r.Lumen.ScreenProbeGather.RadianceCache.ProbeResolution=16
; Resolution of radiance cache probes

; -- Reflections --
r.Lumen.Reflections.Allow=1
; Master enable for Lumen reflections

r.Lumen.Reflections.ScreenTraces=1
; Screen-space traces for reflections

r.Lumen.Reflections.MaxRoughnessToTrace=0.4
; Skip tracing for very rough surfaces

; -- Hardware Ray Tracing (optional, improves quality) --
r.Lumen.HardwareRayTracing=0
; 0 = software tracing (default), 1 = hardware RT

r.Lumen.HardwareRayTracing.LightingMode=0
; 0 = surface cache (fast), 1 = hit lighting (accurate, expensive)

r.Lumen.HardwareRayTracing.MaxIterations=8192
; Max traversal iterations for HWRT

; -- Scene Lighting --
r.Lumen.DirectLighting.OffscreenShadowing.TraceMeshSDFs=1
; Offscreen shadowing for direct lights
```

### Virtual Shadow Maps (VSM)

```ini
[ConsoleVariables]
r.Shadow.Virtual.Enable=1
; Master enable

r.Shadow.Virtual.MaxPhysicalPages=4096
; Physical page pool size (memory budget)

r.Shadow.Virtual.ResolutionLodBiasLocal=-0.5
; LOD bias for local lights (negative = higher quality)

r.Shadow.Virtual.ResolutionLodBiasDirectional=0.0
; LOD bias for directional lights

r.Shadow.Virtual.Clipmap.FirstCoarseLevel=15
; First coarse clipmap level for directional lights

r.Shadow.Virtual.SMRT.RayCountDirectional=8
; Shadow map ray tracing ray count (directional)

r.Shadow.Virtual.SMRT.RayCountLocal=4
; Shadow map ray tracing ray count (local lights)

r.Shadow.Virtual.SMRT.SamplesPerRayDirectional=4
; Samples per ray (directional)

r.Shadow.Virtual.SMRT.SamplesPerRayLocal=2
; Samples per ray (local lights)

r.Shadow.Virtual.Cache=1
; Cache shadow map pages across frames

r.Shadow.Virtual.InvalidateEveryFrame=0
; Debug: force invalidation every frame (perf killer)
```

### Temporal Super Resolution (TSR)

```ini
[ConsoleVariables]
r.AntiAliasingMethod=4
; 4 = TSR (UE 5.x default upscaler)

r.TSR.ShadingRejection.Flickering=1.0
; Reduce flickering on thin geometry

r.TSR.History.R11G11B10=1
; Use R11G11B10 for history (saves memory)

r.TSR.History.ScreenPercentage=100
; Internal history resolution (100 = native)

r.ScreenPercentage=66.67
; Render at 2/3 resolution, upscale with TSR
```

---

## Frequently Used CVars by System

### World Partition / Level Streaming

```ini
[ConsoleVariables]
wp.Runtime.BlockOnSlowStreaming=0
wp.Runtime.EnableStreamingLoadingScreen=1
s.LevelStreamingActorsUpdateTimeLimit=5.0
s.PriorityLevelStreamingActorsUpdateExtraTime=5.0
s.LevelStreamingComponentsRegistrationGranularity=10
```

### Niagara (Particle System)

```ini
[ConsoleVariables]
fx.Niagara.QualityLevel=3
; 0=Low, 1=Medium, 2=High, 3=Epic

fx.Niagara.MaxGPUParticlesSpawnPerFrame=1000000
fx.Niagara.SimCountWarningThreshold=100
fx.Niagara.GarbageCollectionTriggerCount=1000
fx.Niagara.UseGPUEmitterScheduling=1
```

### Animation

```ini
[ConsoleVariables]
a.URO.Enable=1
; Update Rate Optimization for skeletal meshes

a.URO.ForceAnimRate=0
; Force specific update rate (0 = auto)

a.URO.ForceInterpolation=0
; Force interpolation between frames

r.SkeletalMeshLODBias=0
; Global LOD bias for skeletal meshes
```

### Chaos Physics (UE5)

```ini
[ConsoleVariables]
p.Chaos.Solver.Iterations=8
; Constraint solver iterations

p.Chaos.Solver.CollisionIterations=1
p.Chaos.Solver.JointIterations=2
p.ClothPhysics=1
; Enable cloth simulation

p.Chaos.ImmPhysics.UseContactGraph=1
```
