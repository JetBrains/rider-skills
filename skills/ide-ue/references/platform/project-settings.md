# .uproject and Project Configuration

## .uproject File Format

The `.uproject` file is the root descriptor for an Unreal Engine project. It is a JSON file that defines modules, plugins, target platforms, and engine association.

### Minimal .uproject

```json
{
    "FileVersion": 3,
    "EngineAssociation": "5.4",
    "Category": "",
    "Description": "",
    "Modules": [
        {
            "Name": "MyGame",
            "Type": "Runtime",
            "LoadingPhase": "Default"
        }
    ]
}
```

### Full .uproject Example

```json
{
    "FileVersion": 3,
    "EngineAssociation": "5.4",
    "Category": "Game",
    "Description": "An open-world action RPG with multiplayer support.",
    "Modules": [
        {
            "Name": "MyGame",
            "Type": "Runtime",
            "LoadingPhase": "Default",
            "AdditionalDependencies": [
                "Engine",
                "CoreUObject",
                "AIModule",
                "GameplayAbilities"
            ]
        },
        {
            "Name": "MyGameEditor",
            "Type": "Editor",
            "LoadingPhase": "Default",
            "AdditionalDependencies": [
                "UnrealEd"
            ]
        },
        {
            "Name": "MyGameTests",
            "Type": "DeveloperTool",
            "LoadingPhase": "Default"
        }
    ],
    "Plugins": [
        {
            "Name": "GameplayAbilities",
            "Enabled": true
        },
        {
            "Name": "OnlineSubsystemSteam",
            "Enabled": true,
            "SupportedTargetPlatforms": [
                "Win64",
                "Linux",
                "Mac"
            ]
        },
        {
            "Name": "OnlineSubsystemNull",
            "Enabled": true
        },
        {
            "Name": "EnhancedInput",
            "Enabled": true
        },
        {
            "Name": "Niagara",
            "Enabled": true
        },
        {
            "Name": "CommonUI",
            "Enabled": true
        },
        {
            "Name": "GameplayMessageRouter",
            "Enabled": true
        }
    ],
    "TargetPlatforms": [
        "Win64",
        "Linux",
        "PS5",
        "XSX"
    ]
}
```

---

## Module Descriptors

Each entry in the `Modules` array describes a C++ module in the project.

### Module Fields

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `Name` | string | Yes | Module name (matches the folder name under `Source/`) |
| `Type` | string | Yes | When the module loads (see below) |
| `LoadingPhase` | string | Yes | Loading order within the type |
| `AdditionalDependencies` | string[] | No | Extra modules this module depends on (beyond Build.cs) |

### Module Types

| Type | Loaded In | Use Case |
|------|-----------|----------|
| `Runtime` | Game + Editor | Core gameplay code |
| `RuntimeNoCommandlet` | Game + Editor (not commandlets) | Code that requires a world |
| `RuntimeAndProgram` | Game + Editor + Programs | Shared utilities |
| `CookedOnly` | Packaged game only | Code that should not run in editor |
| `UncookedOnly` | Editor only (not packaged) | Editor-only gameplay code |
| `Developer` | Editor + Debug builds | Debug and testing utilities |
| `DeveloperTool` | Editor + Programs | Developer tools |
| `Editor` | Editor only | Custom editor tools, detail panels |
| `EditorNoCommandlet` | Editor only (not commandlets) | Editor tools requiring UI |
| `Program` | Standalone programs only | Build tools, automation |

### Loading Phases

| Phase | When | Use Case |
|-------|------|----------|
| `EarliestPossible` | Before engine init | Low-level platform code |
| `PostConfigInit` | After config loaded | Settings that depend on config |
| `PostSplashScreen` | After splash shown | Early initialization with UI |
| `PreEarlyLoadingScreen` | Before loading screen | Loading screen setup |
| `PreLoadingScreen` | Before game loading screen | Pre-load setup |
| `PreDefault` | Before default phase | Dependencies of default modules |
| `Default` | Normal loading | Most modules (use this) |
| `PostDefault` | After default phase | Modules depending on default modules |
| `PostEngineInit` | After engine fully initialized | Code needing full engine |
| `None` | Not automatically loaded | Manually loaded modules |

### Multiple Modules Example

A typical project with gameplay, editor extensions, and tests:

```json
{
    "Modules": [
        {
            "Name": "MyGame",
            "Type": "Runtime",
            "LoadingPhase": "Default"
        },
        {
            "Name": "MyGameUI",
            "Type": "Runtime",
            "LoadingPhase": "Default",
            "AdditionalDependencies": [
                "UMG",
                "Slate",
                "SlateCore"
            ]
        },
        {
            "Name": "MyGameEditor",
            "Type": "Editor",
            "LoadingPhase": "Default",
            "AdditionalDependencies": [
                "UnrealEd",
                "PropertyEditor",
                "EditorStyle"
            ]
        },
        {
            "Name": "MyGameServer",
            "Type": "Runtime",
            "LoadingPhase": "Default"
        },
        {
            "Name": "MyGameTests",
            "Type": "DeveloperTool",
            "LoadingPhase": "Default"
        }
    ]
}
```

---

## Plugin References

The `Plugins` array controls which plugins are active for the project.

### Plugin Entry Fields

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `Name` | string | Yes | Plugin name (matches `.uplugin` filename) |
| `Enabled` | bool | Yes | Whether the plugin is active |
| `Optional` | bool | No | If true, project loads even if plugin is missing |
| `Description` | string | No | Human-readable description of why this plugin is included |
| `MarketplaceURL` | string | No | URL for marketplace plugins |
| `SupportedTargetPlatforms` | string[] | No | Restrict plugin to specific platforms |
| `BlacklistPlatforms` | string[] | No | Platforms where the plugin is disabled |
| `BlacklistTargets` | string[] | No | Target types where the plugin is disabled |
| `WhitelistPlatforms` | string[] | No | DEPRECATED: use SupportedTargetPlatforms |

### Platform-Restricted Plugin

```json
{
    "Name": "OnlineSubsystemSteam",
    "Enabled": true,
    "SupportedTargetPlatforms": [
        "Win64",
        "Linux",
        "Mac"
    ]
}
```

### Multi-Platform Online Subsystem Pattern (Real-World)

From production projects targeting Android, iOS, Mac, Windows, Linux, and TVOS simultaneously:

```json
{
    "Plugins": [
        {
            "Name": "OnlineSubsystemGoogle",
            "Enabled": true,
            "SupportedTargetPlatforms": ["Android"]
        },
        {
            "Name": "OnlineSubsystemFacebook",
            "Enabled": true
        },
        {
            "Name": "OnlineSubsystemApple",
            "Enabled": true,
            "SupportedTargetPlatforms": ["Mac", "IOS", "TVOS"]
        }
    ]
}
```

Each online subsystem is only compiled/loaded on its target platforms. The platform-specific `.ini` file sets which service is the default:

```ini
; Config/Android/AndroidEngine.ini
[OnlineSubsystem]
DefaultPlatformService=GooglePlay
```

### Optional Plugin (graceful if missing)

```json
{
    "Name": "MyOptionalPlugin",
    "Enabled": true,
    "Optional": true
}
```

### Disabling a Default Plugin

Plugins that are enabled by default in the engine can be explicitly disabled:

```json
{
    "Name": "PaperZD",
    "Enabled": false
}
```

### Common Plugin Configurations

```json
{
    "Plugins": [
        {
            "Name": "EnhancedInput",
            "Enabled": true
        },
        {
            "Name": "GameplayAbilities",
            "Enabled": true
        },
        {
            "Name": "CommonUI",
            "Enabled": true
        },
        {
            "Name": "Niagara",
            "Enabled": true
        },
        {
            "Name": "OnlineSubsystem",
            "Enabled": true
        },
        {
            "Name": "OnlineSubsystemSteam",
            "Enabled": true,
            "SupportedTargetPlatforms": ["Win64", "Linux", "Mac"]
        },
        {
            "Name": "OnlineSubsystemEOS",
            "Enabled": true
        },
        {
            "Name": "ModelViewViewModel",
            "Enabled": true
        },
        {
            "Name": "GameplayStateTree",
            "Enabled": true
        },
        {
            "Name": "MassEntity",
            "Enabled": true
        },
        {
            "Name": "GeometryScripting",
            "Enabled": true,
            "SupportedTargetPlatforms": ["Win64", "Linux", "Mac"]
        },
        {
            "Name": "WaterPlugin",
            "Enabled": true
        },
        {
            "Name": "PCG",
            "Enabled": true
        },
        {
            "Name": "ChaosVehiclesPlugin",
            "Enabled": true
        }
    ]
}
```

---

## Target Platform Configuration

### TargetPlatforms Array

When present, restricts which platforms can be built:

```json
{
    "TargetPlatforms": [
        "Win64",
        "Linux",
        "Mac",
        "IOS",
        "Android",
        "PS5",
        "XSX",
        "Switch"
    ]
}
```

If `TargetPlatforms` is omitted, all platforms supported by the engine are available.

### Platform Names

| Platform | TargetPlatform Value |
|----------|---------------------|
| Windows 64-bit | `Win64` |
| Linux | `Linux` |
| macOS | `Mac` |
| iOS | `IOS` |
| Android | `Android` |
| PlayStation 5 | `PS5` |
| Xbox Series X/S | `XSX` |
| Nintendo Switch | `Switch` |
| Linux ARM64 | `LinuxArm64` |
| tvOS | `TVOS` |
| VisionOS | `VisionOS` |
| HoloLens | `HoloLens` |

---

## Build Settings

Build configuration is controlled through `.Target.cs` files (not `.uproject`), but project-level build settings in `.ini` affect packaging:

### DefaultGame.ini — Packaging Settings

```ini
[/Script/UnrealEd.ProjectPackagingSettings]
; Build configuration for packaging
; PPBC_Debug, PPBC_DebugGame, PPBC_Development, PPBC_Test, PPBC_Shipping
BuildConfiguration=PPBC_Shipping

; Staging directory for packaged builds
StagingDirectory=(Path="$(ProjectDir)/Build/Staged")

; Full rebuild (clean) before packaging
FullRebuild=False

; Distribution build (disables logging, console, etc.)
ForDistribution=True

; Include debug symbol files in package
IncludeDebugFiles=False

; Use IoStore container format (UE5)
bUseIoStore=True

; Pak file settings
bUsePakFile=True
bCompressed=True
PakFileCompressionFormat=Oodle

; Encrypt pak files
bEncryptIniFiles=False
bEncryptPakIndex=False
GenerateChunks=False

; Additional cooking options
bCookAll=False
bCookMapsOnly=False

; Directories to always include in the cook
+DirectoriesToAlwaysCook=(Path="/Game/Maps")
+DirectoriesToAlwaysCook=(Path="/Game/Data/DataTables")
+DirectoriesToAlwaysCook=(Path="/Game/UI")

; Directories to never cook (saves build time and size)
+DirectoriesToNeverCook=(Path="/Game/Test")
+DirectoriesToNeverCook=(Path="/Game/Developer")
+DirectoriesToNeverCook=(Path="/Game/Prototyping")

; Maps to include in build (if empty, all maps are included)
+MapsToCook=(FilePath="/Game/Maps/MainMenu")
+MapsToCook=(FilePath="/Game/Maps/Level_01")
+MapsToCook=(FilePath="/Game/Maps/Level_02")

; Non-asset directories to stage (copied as-is to build output)
+DirectoriesToAlwaysStageAsNonUFS=(Path="Config")
+DirectoriesToAlwaysStageAsUFS=(Path="/Game/Cinematics")

; Culture/localization to package
+CulturesToStage=en
+CulturesToStage=fr
+CulturesToStage=de
+CulturesToStage=ja

; Prerequisite installer (Windows)
IncludePrerequisites=True
PrerequisiteWinMinOSVersion=Win10April2018Update
```

### DefaultEngine.ini — Cooker Settings

```ini
[/Script/UnrealEd.CookerSettings]
bIterativeCookingForFileCookContent=False
bIterativeCookingForDLCCookContent=False
+DefaultPlatformsToCook=WindowsClient
+DefaultPlatformsToCook=LinuxClient

[/Script/Engine.StreamingSettings]
; Async loading for packaged builds
s.EventDrivenLoaderEnabled=True
s.AsyncLoadingThreadEnabled=True
```

---

## Maps and Modes Settings

### DefaultEngine.ini — Map and Mode Configuration

```ini
[/Script/EngineSettings.GameMapsSettings]
; Map loaded when editor starts
EditorStartupMap=/Game/Maps/DevTestMap

; Map loaded when game starts (no URL specified)
GameDefaultMap=/Game/Maps/MainMenu

; Map loaded for dedicated servers
ServerDefaultMap=/Game/Maps/Lobby

; Map shown during seamless travel
TransitionMap=/Game/Maps/TransitionLevel

; Default game mode for all maps (unless overridden per-map)
GlobalDefaultGameMode=/Script/MyGame.MyGameMode

; Default game mode for dedicated servers
GlobalDefaultServerGameMode=/Script/MyGame.MyServerGameMode
```

### Per-Map Game Mode Override

In `DefaultGame.ini`:

```ini
[/Script/Engine.WorldSettings]
; Per-map game mode overrides are set in the World Settings
; of each map in the editor, not in .ini files.
; They are stored in the map asset itself.
```

Alternatively, use `DefaultEngine.ini` with a URL-based approach:

```ini
[URL]
Map=/Game/Maps/MainMenu
; Override game mode via command line:
; -game=/Script/MyGame.MyLobbyGameMode
```

---

## Asset Manager Settings

### DefaultGame.ini — Asset Manager Configuration

```ini
[/Script/Engine.AssetManagerSettings]
; Primary asset types to scan and manage
+PrimaryAssetTypesToScan=(PrimaryAssetType="Map",AssetBaseClass=/Script/Engine.World,bHasBlueprintClasses=False,bIsEditorOnly=True,Directories=((Path="/Game/Maps")),SpecificAssets=,Rules=(Priority=-1,ChunkId=-1,bApplyRecursively=True,CookRule=Unknown))

+PrimaryAssetTypesToScan=(PrimaryAssetType="PrimaryAssetLabel",AssetBaseClass=/Script/Engine.PrimaryAssetLabel,bHasBlueprintClasses=False,bIsEditorOnly=True,Directories=((Path="/Game")),SpecificAssets=,Rules=(Priority=-1,ChunkId=-1,bApplyRecursively=True,CookRule=AlwaysCook))

; Custom primary asset types
+PrimaryAssetTypesToScan=(PrimaryAssetType="MyItemData",AssetBaseClass=/Script/MyGame.UMyItemDataAsset,bHasBlueprintClasses=True,bIsEditorOnly=False,Directories=((Path="/Game/Data/Items")),SpecificAssets=,Rules=(Priority=-1,ChunkId=-1,bApplyRecursively=True,CookRule=AlwaysCook))

+PrimaryAssetTypesToScan=(PrimaryAssetType="MyQuestData",AssetBaseClass=/Script/MyGame.UMyQuestDataAsset,bHasBlueprintClasses=True,bIsEditorOnly=False,Directories=((Path="/Game/Data/Quests")),SpecificAssets=,Rules=(Priority=-1,ChunkId=-1,bApplyRecursively=True,CookRule=AlwaysCook))

; Whether the asset manager should determine type and name automatically
bShouldManagerDetermineTypeAndName=False

; Only cook production assets (skip editor-only assets in shipping)
bOnlyCookProductionAssets=False

; Guess type and name in editor (for unregistered assets)
bShouldGuessTypeAndNameInEditor=True

; Download missing chunks on load (for chunked installs)
bShouldAcquireMissingChunksOnLoad=False

; Tags exposed to the asset registry for filtering
+MetaDataTagsForAssetRegistry=("PrimaryAssetType")
+MetaDataTagsForAssetRegistry=("ItemRarity")
```

### Chunk Assignment for DLC / Streaming Install

```ini
[/Script/Engine.AssetManagerSettings]
; Assign content to download chunks
; ChunkId 0 = always installed
; ChunkId 1+ = optional / DLC chunks
+PrimaryAssetTypesToScan=(PrimaryAssetType="Map",AssetBaseClass=/Script/Engine.World,bHasBlueprintClasses=False,bIsEditorOnly=True,Directories=((Path="/Game/Maps/DLC01")),SpecificAssets=,Rules=(Priority=1,ChunkId=1,bApplyRecursively=True,CookRule=AlwaysCook))

+PrimaryAssetTypesToScan=(PrimaryAssetType="Map",AssetBaseClass=/Script/Engine.World,bHasBlueprintClasses=False,bIsEditorOnly=True,Directories=((Path="/Game/Maps/DLC02")),SpecificAssets=,Rules=(Priority=1,ChunkId=2,bApplyRecursively=True,CookRule=AlwaysCook))
```

---

## Project Description and Metadata

### .uproject Metadata Fields

```json
{
    "FileVersion": 3,
    "EngineAssociation": "5.4",
    "Category": "Game",
    "Description": "A short description of the project.",
    "EpicSampleNameHash": ""
}
```

| Field | Description |
|-------|-------------|
| `FileVersion` | Schema version. Currently `3` for UE5. Do not change. |
| `EngineAssociation` | Engine version or build ID. See below. |
| `Category` | Freeform category string (e.g., "Game", "Sample", "Tool"). |
| `Description` | Human-readable project description. |
| `EpicSampleNameHash` | Hash for Epic sample projects. Leave empty for custom projects. |

### Engine Version Association

The `EngineAssociation` field links the project to a specific engine version.

**Launcher-installed engine (version number):**
```json
{
    "EngineAssociation": "5.4"
}
```

**Source-built engine (build GUID):**
```json
{
    "EngineAssociation": "{A1B2C3D4-E5F6-7890-ABCD-EF1234567890}"
}
```
The GUID is auto-generated when building from source and stored in `Engine/Build/Build.version`. When you open a project from a source build, the editor writes this GUID into the `.uproject` file.

**No association (portable project):**
```json
{
    "EngineAssociation": ""
}
```
An empty string means the project will prompt for an engine version when opened.

### DefaultGame.ini — Project Identity

```ini
[/Script/EngineSettings.GeneralProjectSettings]
ProjectID=A1B2C3D4-E5F6-7890-ABCD-EF1234567890
ProjectName=My Awesome Game
CompanyName=Awesome Studio
CompanyDistinguishedName=com.awesomestudio.myawesomegame
CopyrightNotice=Copyright 2026 Awesome Studio. All rights reserved.
Description=An open-world RPG set in a fantasy world.
Homepage=https://www.awesomestudio.com
LicensingTerms=All rights reserved.
ProjectVersion=1.2.0.0
SupportContact=support@awesomestudio.com
bShouldWindowPreserveAspectRatio=True
bUseBorderlessWindow=False
bStartInVR=False
bAllowWindowResize=True
bAllowClose=True
bAllowMaximize=True
bAllowMinimize=True

; Localized project title (use NSLOCTEXT for localization)
ProjectDisplayedTitle=NSLOCTEXT("MyGame", "ProjectTitle", "My Awesome Game")
ProjectDebugTitleInfo=NSLOCTEXT("MyGame", "DebugTitle", "My Awesome Game [{BUILD_VERSION}] - {PLATFORM}")
```

---

## Target.cs Build Configuration

While not part of `.uproject`, the `.Target.cs` files define build behavior per target type. They live alongside the `.uproject` file.

### MyGame.Target.cs (Client/Game)

```csharp
using UnrealBuildTool;

public class MyGameTarget : TargetRules
{
    public MyGameTarget(TargetInfo Target) : base(Target)
    {
        Type = TargetType.Game;
        DefaultBuildSettings = BuildSettingsVersion.V5;
        IncludeOrderVersion = EngineIncludeOrderVersion.Latest;

        ExtraModuleNames.Add("MyGame");

        // Disable plugins for shipping
        if (Configuration == UnrealTargetConfiguration.Shipping)
        {
            bBuildDeveloperTools = false;
            bCompileAgainstEngine = true;
            bBuildWithEditorOnlyData = false;
        }
    }
}
```

### MyGameEditor.Target.cs

```csharp
using UnrealBuildTool;

public class MyGameEditorTarget : TargetRules
{
    public MyGameEditorTarget(TargetInfo Target) : base(Target)
    {
        Type = TargetType.Editor;
        DefaultBuildSettings = BuildSettingsVersion.V5;
        IncludeOrderVersion = EngineIncludeOrderVersion.Latest;

        ExtraModuleNames.Add("MyGame");
        ExtraModuleNames.Add("MyGameEditor");
    }
}
```

### MyGameServer.Target.cs (Dedicated Server)

```csharp
using UnrealBuildTool;

public class MyGameServerTarget : TargetRules
{
    public MyGameServerTarget(TargetInfo Target) : base(Target)
    {
        Type = TargetType.Server;
        DefaultBuildSettings = BuildSettingsVersion.V5;
        IncludeOrderVersion = EngineIncludeOrderVersion.Latest;

        ExtraModuleNames.Add("MyGame");
        ExtraModuleNames.Add("MyGameServer");

        // Server-specific settings
        bUseLoggingInShipping = true;
        bWithServerCode = true;
    }
}
```

---

## Complete .uproject Reference

A production-ready `.uproject` combining all concepts:

```json
{
    "FileVersion": 3,
    "EngineAssociation": "5.4",
    "Category": "Game",
    "Description": "Production RPG project with multiplayer, DLC support, and cross-platform targets.",
    "Modules": [
        {
            "Name": "MyGame",
            "Type": "Runtime",
            "LoadingPhase": "Default",
            "AdditionalDependencies": [
                "Engine",
                "CoreUObject",
                "AIModule",
                "GameplayAbilities",
                "EnhancedInput"
            ]
        },
        {
            "Name": "MyGameUI",
            "Type": "Runtime",
            "LoadingPhase": "PostDefault",
            "AdditionalDependencies": [
                "UMG",
                "CommonUI"
            ]
        },
        {
            "Name": "MyGameServer",
            "Type": "Runtime",
            "LoadingPhase": "Default"
        },
        {
            "Name": "MyGameEditor",
            "Type": "Editor",
            "LoadingPhase": "Default",
            "AdditionalDependencies": [
                "UnrealEd"
            ]
        },
        {
            "Name": "MyGameTests",
            "Type": "DeveloperTool",
            "LoadingPhase": "Default"
        }
    ],
    "Plugins": [
        {
            "Name": "EnhancedInput",
            "Enabled": true
        },
        {
            "Name": "GameplayAbilities",
            "Enabled": true
        },
        {
            "Name": "CommonUI",
            "Enabled": true
        },
        {
            "Name": "Niagara",
            "Enabled": true
        },
        {
            "Name": "OnlineSubsystemSteam",
            "Enabled": true,
            "SupportedTargetPlatforms": [
                "Win64",
                "Linux",
                "Mac"
            ]
        },
        {
            "Name": "OnlineSubsystemEOS",
            "Enabled": true,
            "SupportedTargetPlatforms": [
                "Win64",
                "Linux",
                "Mac",
                "PS5",
                "XSX"
            ]
        },
        {
            "Name": "PCG",
            "Enabled": true
        },
        {
            "Name": "WaterPlugin",
            "Enabled": true
        },
        {
            "Name": "ModelViewViewModel",
            "Enabled": true
        }
    ],
    "TargetPlatforms": [
        "Win64",
        "Linux",
        "PS5",
        "XSX"
    ]
}
```
