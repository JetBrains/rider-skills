# Plugin Structure — Anatomy of an Unreal Engine Plugin

## Directory Layout

A fully-featured plugin follows this directory structure:

```
<PluginName>/
    <PluginName>.uplugin              # Plugin descriptor (required)
    Resources/
        Icon128.png                   # Plugin icon for Plugin Browser (128x128)
    Content/                          # Plugin content (Blueprints, assets, maps)
        ...
    Config/
        Default<PluginName>.ini       # Plugin-specific config defaults
        Filter<PluginName>.ini        # INI filter for packaging
    Shaders/                          # Custom shader files (.usf, .ush)
        Private/
        Public/
    Source/
        <ModuleName>/                 # One directory per module
            Public/                   # Public headers (API surface)
                <ModuleName>Module.h
                ...
            Private/                  # Private implementation
                <ModuleName>Module.cpp
                ...
            <ModuleName>.Build.cs     # Build configuration
        ThirdParty/                   # External libraries
            <LibName>/
                include/
                lib/
                    Win64/
                    Mac/
                    Linux/
    Intermediate/                     # Generated (not checked in)
    Binaries/                         # Compiled output (not checked in, unless pre-built)
        Win64/
        Mac/
        Linux/
```

### Minimal Plugin (content-only)

```
<PluginName>/
    <PluginName>.uplugin
    Content/
        ...
```

### Minimal Plugin (C++ only, no content)

```
<PluginName>/
    <PluginName>.uplugin
    Resources/
        Icon128.png
    Source/
        <PluginName>/
            Public/
                <PluginName>Module.h
            Private/
                <PluginName>Module.cpp
            <PluginName>.Build.cs
```

---

## .uplugin Descriptor Format

The `.uplugin` file is a JSON file that tells the engine everything it needs to know about the plugin. It must be named `<PluginName>.uplugin` and reside in the plugin's root directory.

### Complete Example

```json
{
    "FileVersion": 3,
    "Version": 1,
    "VersionName": "1.0.0",
    "FriendlyName": "Advanced Inventory System",
    "Description": "A modular inventory system with drag-and-drop UI, item stacking, and serialization support.",
    "Category": "Gameplay",
    "CreatedBy": "Studio Name",
    "CreatedByURL": "https://studio.example.com",
    "DocsURL": "https://docs.example.com/inventory",
    "MarketplaceURL": "",
    "SupportURL": "https://support.example.com",
    "EngineVersion": "5.4.0",
    "EnabledByDefault": false,
    "CanContainContent": true,
    "IsBetaVersion": false,
    "IsExperimentalVersion": false,
    "Installed": false,
    "SupportedTargetPlatforms": [
        "Win64",
        "Mac",
        "Linux",
        "IOS",
        "Android"
    ],
    "Modules": [
        {
            "Name": "AdvancedInventory",
            "Type": "Runtime",
            "LoadingPhase": "Default",
            "AdditionalDependencies": [
                "Engine",
                "CoreUObject"
            ],
            "PlatformAllowList": [
                "Win64",
                "Mac",
                "Linux",
                "IOS",
                "Android"
            ]
        },
        {
            "Name": "AdvancedInventoryEditor",
            "Type": "Editor",
            "LoadingPhase": "PostEngineInit"
        }
    ],
    "Plugins": [
        {
            "Name": "CommonUI",
            "Enabled": true
        }
    ],
    "LocalizationTargets": [
        {
            "Name": "AdvancedInventory",
            "LoadingPolicy": "Always"
        }
    ]
}
```

### Descriptor Fields Reference

#### Top-Level Fields

| Field | Type | Default | Description |
|---|---|---|---|
| `FileVersion` | int | -- | Descriptor format version. Always `3` for UE4.27+ and all UE5 versions. |
| `Version` | int | 1 | Internal version number. Increment on each release. Used for version comparison logic. |
| `VersionName` | string | "" | Display version string (e.g., "2.1.0"). Shown in Plugin Browser and Marketplace. |
| `FriendlyName` | string | "" | Human-readable plugin name. Can contain spaces and special characters. |
| `Description` | string | "" | Plugin description. Keep under 200 characters for Marketplace. |
| `Category` | string | "" | Plugin Browser category. Common values: "Gameplay", "Editor", "Rendering", "Audio", "Content", "Scripting", "Networking", "AI", "Animation", "Physics". |
| `CreatedBy` | string | "" | Author or studio name. |
| `CreatedByURL` | string | "" | Author website. Must be a valid URL. |
| `DocsURL` | string | "" | Documentation URL. |
| `MarketplaceURL` | string | "" | Link to Marketplace listing. Populated after submission. |
| `SupportURL` | string | "" | Support or issue tracker URL. |
| `EngineVersion` | string | "" | Minimum required engine version (e.g., "5.3.0"). If set, the plugin will not load on older engine versions. |
| `EnabledByDefault` | bool | false | If true, plugin is enabled in new projects without user action. Use sparingly. |
| `CanContainContent` | bool | false | Whether the plugin has a Content/ directory. Must be true for any Blueprint, asset, or data content. |
| `IsBetaVersion` | bool | false | Displays "Beta" badge in Plugin Browser. |
| `IsExperimentalVersion` | bool | false | Displays "Experimental" badge. Takes precedence over Beta if both are true. |
| `Installed` | bool | false | Marks plugin as pre-built/installed. When true, the build system expects pre-compiled binaries in Binaries/ rather than Source/. |
| `ExplicitlyLoaded` | bool | false | Plugin is not auto-loaded; must be loaded programmatically. |
| `SupportedTargetPlatforms` | string[] | all | Restrict to specific platforms. If omitted, all platforms are assumed. For Marketplace: must be explicit. |
| `SupportedPrograms` | string[] | [] | Standalone programs (outside the editor) that load this plugin. |
| `IsHidden` | bool | false | Hide from Plugin Browser. Used for engine-internal plugins. |
| `IsPluginExtension` | bool | false | This plugin extends another plugin rather than standing alone. |

#### Module Descriptor Fields

Each entry in the `Modules` array describes one C++ module:

| Field | Type | Required | Description |
|---|---|---|---|
| `Name` | string | Yes | Module name. Must match the Source directory name and Build.cs class name. |
| `Type` | string | Yes | Module type: Runtime, RuntimeNoCommandlet, Developer, DeveloperTool, Editor, EditorNoCommandlet, UncookedOnly, Program. |
| `LoadingPhase` | string | No | When to load: EarliestPossible, PostConfigInit, PostSplashScreen, PreEarlyLoadingScreen, PreLoadingScreen, PreDefault, Default, PostDefault, PostEngineInit, None. Default is "Default". |
| `PlatformAllowList` | string[] | No | Platforms where this module is compiled and loaded. |
| `PlatformDenyList` | string[] | No | Platforms to exclude. Cannot be used with PlatformAllowList. |
| `TargetAllowList` | string[] | No | Target types: Game, Server, Client, Editor, Program. |
| `TargetDenyList` | string[] | No | Target types to exclude. |
| `AdditionalDependencies` | string[] | No | Extra modules that must be loaded before this one (beyond what Build.cs declares). Rarely needed. |
| `HasExplicitPlatforms` | bool | No | If true, module only loads on platforms in PlatformAllowList. |

#### Plugin Dependency Fields

Each entry in the `Plugins` array:

| Field | Type | Required | Description |
|---|---|---|---|
| `Name` | string | Yes | Name of the required plugin. |
| `Enabled` | bool | Yes | Must be `true` for the dependency to be active. |
| `Optional` | bool | No | If true, the parent plugin loads even if this dependency is missing. |
| `Description` | string | No | Why this dependency exists (documentation only). |
| `MarketplaceURL` | string | No | Where to get the dependency. |
| `PlatformAllowList` | string[] | No | Only require this dependency on listed platforms. |
| `PlatformDenyList` | string[] | No | Do not require this dependency on listed platforms. |

---

## Platform-Conditional Plugin Enabling Patterns

### Per-Platform Online Subsystems

A common multi-platform pattern enables platform-specific plugins only on their target platforms via the project's `.uproject`:

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
            "Enabled": true,
            "SupportedTargetPlatforms": ["Android", "IOS"]
        },
        {
            "Name": "OnlineSubsystemApple",
            "Enabled": true,
            "SupportedTargetPlatforms": ["Mac", "IOS", "TVOS"]
        },
        {
            "Name": "OnlineSubsystemSteam",
            "Enabled": true,
            "SupportedTargetPlatforms": ["Win64", "Linux", "Mac"]
        }
    ]
}
```

Each plugin is compiled and loaded only on its listed platforms. Pair with platform override `.ini` files to set which service is the default:

```ini
; Config/Android/AndroidEngine.ini
[OnlineSubsystem]
DefaultPlatformService=GooglePlay

[OnlineSubsystemGooglePlay]
bSupportsInAppPurchasing=True
```

### Module-Level Platform Filtering

Within a `.uplugin`, individual modules can be restricted to specific platforms:

```json
{
    "Modules": [
        {
            "Name": "MyPlugin",
            "Type": "Runtime",
            "LoadingPhase": "Default"
        },
        {
            "Name": "MyPluginMobile",
            "Type": "Runtime",
            "LoadingPhase": "Default",
            "PlatformAllowList": ["IOS", "Android"]
        },
        {
            "Name": "MyPluginConsole",
            "Type": "Runtime",
            "LoadingPhase": "Default",
            "PlatformAllowList": ["PS5", "XSX", "Switch"]
        }
    ]
}
```

This allows a single plugin to contain platform-specific modules that only compile and load on the relevant platforms, avoiding #ifdef sprawl in a monolithic module.

### Plugin Dependency with Platform Filtering

Plugin dependencies can also be platform-filtered:

```json
{
    "Plugins": [
        {
            "Name": "OnlineSubsystem",
            "Enabled": true
        },
        {
            "Name": "OnlineSubsystemSteam",
            "Enabled": true,
            "Optional": true,
            "PlatformAllowList": ["Win64", "Linux", "Mac"]
        }
    ]
}
```

---

## Plugin Icons and Thumbnails

### Icon128.png

- **Location:** `Resources/Icon128.png`
- **Size:** 128 x 128 pixels
- **Format:** PNG with transparency
- **Purpose:** Shown in the Plugin Browser (Edit > Plugins)
- **Requirements:** Must be present for the plugin to display a custom icon. Without it, a generic puzzle piece icon is shown.

### Marketplace Icons

For Marketplace submission, you also need:
- **Thumbnail:** 284 x 284 pixels (Marketplace listing)
- **Header:** 1920 x 1080 pixels (feature image)
- **Screenshots:** At least 3, each 1920 x 1080 pixels
- **Technical images:** Show code structure, Blueprint integration, etc.

### Additional Resource Files

The `Resources/` directory can also contain:
- `FilterPlugin.ini` — Packaging filter for editor-only content
- Slate brush images (`.png`) referenced by custom Slate styles
- Custom splash or loading screen assets

---

## Plugin-to-Plugin Dependencies

### Declaring Dependencies

Dependencies are declared in two places and both are required:

1. **`.uplugin` descriptor** — ensures correct load order:
```json
{
    "Plugins": [
        {
            "Name": "OnlineSubsystem",
            "Enabled": true
        },
        {
            "Name": "OnlineSubsystemSteam",
            "Enabled": true,
            "Optional": true
        }
    ]
}
```

2. **`Build.cs`** — enables C++ compilation and linking:
```csharp
PublicDependencyModuleNames.AddRange(new string[]
{
    "OnlineSubsystem",
});

PrivateDependencyModuleNames.AddRange(new string[]
{
    "OnlineSubsystemSteam",  // Only if Optional + runtime check
});
```

### Optional Dependencies

When a dependency is `Optional: true`:
- The plugin loads even if the dependency plugin is not installed or disabled.
- The dependent module's code must check at runtime whether the dependency is available:

```cpp
if (FModuleManager::Get().IsModuleLoaded("OnlineSubsystemSteam"))
{
    IOnlineSubsystem* Subsystem = IOnlineSubsystem::Get(STEAM_SUBSYSTEM);
    // Use it
}
```

- Use `PrivateDependencyModuleNames` (not Public) for optional dependencies to avoid forcing downstream consumers to also link against the optional module.

### Circular Dependencies

Circular plugin dependencies are not allowed. If plugin A depends on plugin B, and plugin B depends on A, the engine will fail to load either. The solution is to extract shared functionality into a third plugin C that both A and B depend on.

### Engine Plugin Dependencies

You can depend on engine plugins (e.g., `OnlineSubsystem`, `Niagara`, `EnhancedInput`). These are always available but may need to be explicitly enabled in the project's `.uproject`:

```json
{
    "Plugins": [
        {
            "Name": "EnhancedInput",
            "Enabled": true
        }
    ]
}
```

---

## Engine Version Compatibility

### EngineVersion Field

Set `EngineVersion` in the descriptor to enforce a minimum engine version:
```json
{
    "EngineVersion": "5.3.0"
}
```

If omitted, the plugin is assumed compatible with any engine version. This can cause hard-to-debug issues if the plugin uses APIs introduced in a specific version.

### Source vs Pre-Built Compatibility

- **Source plugins** (compiled from Source/) are recompiled against whatever engine version the consumer uses. API breakage will manifest as compile errors.
- **Pre-built plugins** (`Installed: true`, with Binaries/) are compiled against a specific engine version. Binary incompatibility between engine versions will cause load failures or crashes.

### Multi-Version Support Strategies

1. **Version preprocessor macros:**
```cpp
#if ENGINE_MAJOR_VERSION == 5 && ENGINE_MINOR_VERSION >= 4
    // UE 5.4+ API
#else
    // Older API path
#endif
```

2. **Separate branches** per engine version (common for Marketplace plugins).

3. **Minimal API surface** — depend only on stable, long-lived APIs to reduce breakage across versions.

---

## Pre-Built vs Source Plugins

### Source Plugins

- Contain `Source/` with `.Build.cs` and C++ code
- Compiled by the consumer's build system
- `Installed: false` (default)
- Consumers must have a C++ toolchain
- Ideal for: open-source plugins, team-internal plugins, plugins under active development

### Pre-Built (Installed) Plugins

- Contain `Binaries/` with pre-compiled `.dll`/`.dylib`/`.so` files
- May optionally include `Source/` for reference (but it is not compiled)
- `Installed: true` in the descriptor
- Consumers do not need a C++ toolchain
- Ideal for: Marketplace distribution, binary SDKs, proprietary code

### Creating a Pre-Built Plugin

1. Build the plugin using the Unreal Automation Tool:
```bash
RunUAT.bat BuildPlugin -Plugin="<Path>/MyPlugin.uplugin" -Package="<OutputPath>" -TargetPlatforms=Win64+Mac+Linux
```

2. The output directory contains the packaged plugin with Binaries/, Content/, and a modified `.uplugin` with `Installed: true`.

3. Distribute the output directory. Consumers place it in their project's `Plugins/` folder or in the engine's `Plugins/Marketplace/` folder.

---

## Plugin Categories

The `Category` field determines where the plugin appears in the Plugin Browser. Standard categories:

| Category | Use For |
|---|---|
| `2D` | 2D game features, Paper2D extensions |
| `AI` | AI controllers, behavior trees, perception |
| `Animation` | Animation tools, retargeting, IK |
| `Audio` | Audio processing, spatial audio, middleware |
| `Blueprints` | Blueprint extensions, function libraries |
| `Code` | Code generation, refactoring tools |
| `Compliance` | GDPR, accessibility, rating compliance |
| `Content` | Asset packs, template content |
| `Editor` | Editor tools, custom viewports, detail panels |
| `Effects` | VFX, Niagara extensions, particle systems |
| `Gameplay` | Gameplay systems (inventory, dialogue, save) |
| `Input` | Input handling, gesture recognition |
| `Importers` | Asset importers, format converters |
| `Maps and Levels` | Level streaming, world partition |
| `Media` | Media playback, video capture |
| `Messaging` | Message bus extensions |
| `Networking` | Replication, transport, matchmaking |
| `Online Platform` | Platform services, achievements, leaderboards |
| `Physics` | Physics extensions, custom solvers |
| `Programming` | Language support, scripting |
| `Rendering` | Rendering features, post-process |
| `Scripting` | Blueprint, Python, Lua integration |
| `Testing` | Automation, testing frameworks |
| `UI` | UMG widgets, CommonUI extensions |
| `Utilities` | General-purpose utilities |
| `VR` | VR/XR features, motion controllers |

Custom categories are allowed but will appear under "Other" in the Plugin Browser unless the engine knows about them.

---

## Plugin Config Files

Plugins can ship default configuration in `Config/`:

### Default Config

`Config/Default<PluginName>.ini`:
```ini
[/Script/MyPlugin.MySettings]
bEnableFeature=true
MaxItems=100
DefaultCategory=Weapons
```

### Base Config (engine-level default)

`Config/Base<PluginName>.ini` — sets engine-level defaults that projects can override.

### Filter Config

`Config/Filter<PluginName>.ini` — controls what gets packaged:
```ini
[FilterPlugin]
; Exclude editor-only content from packaged builds
/MyPlugin/EditorContent/
```

### Accessing Plugin Config in C++

```cpp
// Read from plugin config
GConfig->GetBool(TEXT("/Script/MyPlugin.MySettings"), TEXT("bEnableFeature"), bEnableFeature, GGameIni);

// Or use UDeveloperSettings / UObject config classes
UCLASS(config=Game, defaultconfig)
class MYPLUGIN_API UMyPluginSettings : public UDeveloperSettings
{
    GENERATED_BODY()
public:
    UPROPERTY(Config, EditAnywhere, Category="General")
    bool bEnableFeature = true;

    UPROPERTY(Config, EditAnywhere, Category="General")
    int32 MaxItems = 100;
};
```

---

## Plugin Location Discovery

The engine discovers plugins in these locations (in priority order):

1. **Project plugins:** `<ProjectRoot>/Plugins/`
2. **Engine plugins:** `<EngineRoot>/Engine/Plugins/`
3. **Engine Marketplace:** `<EngineRoot>/Engine/Plugins/Marketplace/`
4. **Platform extensions:** `<EngineRoot>/Engine/Platforms/<Platform>/Plugins/`

Within each location, subdirectories are searched recursively for `.uplugin` files. A plugin at a higher-priority location shadows one with the same name at a lower-priority location.

### Project Plugin Subdirectories

Organizing plugins into subdirectories is supported:
```
Plugins/
    Gameplay/
        InventorySystem/
            InventorySystem.uplugin
        QuestSystem/
            QuestSystem.uplugin
    ThirdParty/
        SomeSDK/
            SomeSDK.uplugin
```

The directory structure does not affect plugin names or loading — only the `.uplugin` filename and the `Name` fields in module descriptors matter.
