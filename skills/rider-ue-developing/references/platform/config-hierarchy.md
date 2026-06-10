# Config File Hierarchy and Loading

## Config Loading Order

Unreal Engine loads configuration files in a strict, layered order. Each subsequent layer can override values from the previous one. Understanding this order is essential to avoid editing the wrong file.

### Full Loading Sequence

```
1. Engine/Config/Base.ini
   - Absolute engine defaults. Ships with the engine. NEVER edit this file.

2. Engine/Config/Base<ConfigName>.ini
   - e.g., BaseEngine.ini, BaseGame.ini, BaseInput.ini
   - Engine-level defaults per config category. NEVER edit.

3. Engine/Config/<Platform>/Base<Platform><ConfigName>.ini
   - Engine-level platform-specific defaults.
   - e.g., Engine/Config/Windows/BaseWindowsEngine.ini

4. Project/Config/Default<ConfigName>.ini
   - e.g., DefaultEngine.ini, DefaultGame.ini
   - PROJECT-LEVEL SETTINGS. This is the primary file you edit.

5. Project/Config/<Platform>/<Platform><ConfigName>.ini
   - Platform-specific project overrides.
   - e.g., Config/Windows/WindowsEngine.ini
   - e.g., Config/Android/AndroidEngine.ini

6. Project/Config/<Platform>/<Platform><ConfigName>.ini (user-level)
   - Some platforms support per-user configuration.

7. Project/Saved/Config/<Platform>/<ConfigName>.ini
   - Runtime and editor-saved overrides.
   - Written when user changes settings in the Editor UI.
   - HIGHEST PRIORITY among file-based configs.
   - Excluded from source control and packaging.

8. Command-line overrides
   - -ini:<Section>:<Key>=<Value>
   - Absolute highest priority. Overrides everything.
```

### Simplified Priority Chain

```
Base (Engine) < Default (Project) < Platform (Project) < Saved < Command-line
```

---

## Per-Platform Config Directories

Platform config directories live under `Project/Config/<PlatformName>/`:

| Platform | Directory Name | Example File |
|----------|---------------|--------------|
| Windows | `Windows/` | `Config/Windows/WindowsEngine.ini` |
| Mac | `Mac/` | `Config/Mac/MacEngine.ini` |
| Linux | `Linux/` | `Config/Linux/LinuxEngine.ini` |
| iOS | `IOS/` | `Config/IOS/IOSEngine.ini` |
| Android | `Android/` | `Config/Android/AndroidEngine.ini` |
| PlayStation 5 | `PS5/` | `Config/PS5/PS5Engine.ini` |
| Xbox Series X | `XSX/` | `Config/XSX/XSXEngine.ini` |
| Nintendo Switch | `Switch/` | `Config/Switch/SwitchEngine.ini` |

**Common mistake:** Using `Win64` or `Linux_x64` instead of `Windows` or `Linux`. The directory names are platform names, not build target names.

### Platform Config File Naming

The naming convention is `<PlatformName><ConfigName>.ini`:
- `WindowsEngine.ini` (not `Win64Engine.ini`)
- `AndroidGame.ini` (not `Android_ARMv7Game.ini`)
- `IOSEngine.ini` (not `iOSEngine.ini` — capitalization matters)

---

## Config Cache (GConfig)

At runtime, all config files are merged into a single in-memory cache called `GConfig` (of type `FConfigCacheIni`). This is the central access point for all configuration values.

### How GConfig Works

1. On startup, the engine reads all `.ini` files in loading order.
2. Each key-value pair is merged into the cache, with later files overriding earlier ones.
3. All runtime reads go through `GConfig`, never directly from disk.
4. Runtime writes via `GConfig->Set*()` methods update the cache and optionally flush to `Saved/Config/`.

### Config File Names in GConfig

When accessing config via GConfig, you reference the config category, not the filename:

| GConfig Name | Maps To |
|-------------|---------|
| `GEngineIni` | `Engine.ini` (merged from Base + Default + Platform + Saved) |
| `GGameIni` | `Game.ini` |
| `GInputIni` | `Input.ini` |
| `GEditorIni` | `Editor.ini` |
| `GScalabilityIni` | `Scalability.ini` |
| `GGameUserSettingsIni` | `GameUserSettings.ini` |
| `GHardwareBenchmarkIni` | `HardwareBenchmark.ini` |

---

## Config Sections and Key Naming Conventions

### Section Headers

Section headers follow the pattern `[/Script/<ModuleName>.<ClassName>]`:

```ini
[/Script/Engine.RendererSettings]
[/Script/Engine.PhysicsSettings]
[/Script/Engine.GarbageCollectionSettings]
[/Script/Engine.StreamingSettings]
[/Script/Engine.NetworkSettings]
[/Script/UnrealEd.EditorPerformanceSettings]
[/Script/EngineSettings.GameMapsSettings]
```

**Rules:**
- Section headers are CASE-SENSITIVE. `[/Script/Engine.RendererSettings]` works; `[/script/engine.renderersettings]` does not.
- The path is the UObject class path: `/Script/<ModuleName>.<ClassName>`.
- Custom classes use their own module name: `[/Script/MyGame.MySettings]`.
- Some legacy sections use short names: `[Core.System]`, `[URL]`, `[ConsoleVariables]`.

### Key Naming

Keys are the UPROPERTY names from the C++ class:

```ini
[/Script/Engine.RendererSettings]
r.DefaultFeature.AntiAliasing=2
r.DefaultFeature.AutoExposure=True
r.DefaultFeature.MotionBlur=True
```

Console variable keys start with their CVar prefix (e.g., `r.`, `sg.`, `fx.`, `a.`, `p.`, `net.`, `gc.`).

---

## Array Syntax: +, -, ., ! Prefixes

Unreal's config system supports special prefixes for array operations:

### `+Key=Value` — Append

Adds the value to the array if it does not already exist:

```ini
[/Script/Engine.DirectoryPath]
+DirectoriesToAlwaysCook=(Path="/Game/Maps")
+DirectoriesToAlwaysCook=(Path="/Game/Data")
```

### `-Key=Value` — Remove

Removes the specific value from the array:

```ini
-DirectoriesToAlwaysCook=(Path="/Game/OldMaps")
```

### `.Key=ClearArray` — Clear and Add

Empties the array from all inherited values, then adds:

```ini
.DirectoriesToAlwaysCook=ClearArray
+DirectoriesToAlwaysCook=(Path="/Game/Maps")
```

### `!Key=ClearArray` — Force Clear

Clears the array completely, ignoring inheritance:

```ini
!DirectoriesToAlwaysCook=ClearArray
```

### `Key=Value` — Scalar Assignment

For non-array properties, simple assignment:

```ini
r.DefaultFeature.AntiAliasing=2
bUsePakFile=True
```

**CRITICAL:** Using `Key=Value` on an array property REPLACES the entire array with a single element. Always use `+Key=Value` to append to arrays.

---

## Reading Config in C++

### GConfig Direct Access

```cpp
// Read a string
FString Value;
GConfig->GetString(
    TEXT("/Script/Engine.RendererSettings"),  // Section
    TEXT("r.DefaultFeature.AntiAliasing"),     // Key
    Value,                                     // Out value
    GEngineIni                                 // Config file
);

// Read an int
int32 IntValue;
GConfig->GetInt(
    TEXT("/Script/Engine.RendererSettings"),
    TEXT("r.DefaultFeature.AntiAliasing"),
    IntValue,
    GEngineIni
);

// Read a bool
bool bValue;
GConfig->GetBool(
    TEXT("/Script/Engine.PhysicsSettings"),
    TEXT("bEnableAsyncScene"),
    bValue,
    GEngineIni
);

// Read a float
float FloatValue;
GConfig->GetFloat(
    TEXT("SectionName"),
    TEXT("KeyName"),
    FloatValue,
    GEngineIni
);

// Read an array
TArray<FString> ArrayValues;
GConfig->GetArray(
    TEXT("SectionName"),
    TEXT("KeyName"),
    ArrayValues,
    GEngineIni
);

// Read a section
TArray<FString> SectionPairs;
GConfig->GetSection(
    TEXT("/Script/Engine.RendererSettings"),
    SectionPairs,
    GEngineIni
);
```

### FConfigCacheIni Helpers

```cpp
// Check if a key exists
bool bExists = GConfig->DoesSectionExist(
    TEXT("/Script/Engine.RendererSettings"),
    GEngineIni
);

// Get all section names
TArray<FString> Sections;
GConfig->GetSectionNames(GEngineIni, Sections);

// Parse a config file directly
FConfigFile ConfigFile;
FConfigCacheIni::LoadLocalIniFile(ConfigFile, TEXT("Engine"), true, *FPlatformProperties::IniPlatformName());
```

### UObject Config Properties (UCLASS/UPROPERTY)

The preferred approach for game-specific settings:

```cpp
UCLASS(config=Game, defaultconfig)
class MYGAME_API UMySettings : public UDeveloperSettings
{
    GENERATED_BODY()
public:
    UPROPERTY(Config, EditAnywhere, Category="General")
    int32 MaxPlayerCount = 16;

    UPROPERTY(Config, EditAnywhere, Category="General")
    FString ServerName = TEXT("Default Server");
};

// Access:
const UMySettings* Settings = GetDefault<UMySettings>();
int32 MaxPlayers = Settings->MaxPlayerCount;
```

This automatically reads from `DefaultGame.ini` under `[/Script/MyGame.MySettings]`.

---

## Writing Config at Runtime

### Via GConfig

```cpp
// Write a string
GConfig->SetString(
    TEXT("/Script/MyGame.MySettings"),
    TEXT("ServerName"),
    TEXT("NewServerName"),
    GGameIni
);

// Write an int
GConfig->SetInt(
    TEXT("/Script/MyGame.MySettings"),
    TEXT("MaxPlayerCount"),
    32,
    GGameIni
);

// Flush changes to disk
GConfig->Flush(false, GGameIni);
```

**Important:** Runtime writes via GConfig go to `Saved/Config/<Platform>/Game.ini`, not `Config/DefaultGame.ini`. This is by design — `Default*.ini` files are read-only at runtime.

### Via UObject SaveConfig

```cpp
UMySettings* Settings = GetMutableDefault<UMySettings>();
Settings->MaxPlayerCount = 32;
Settings->SaveConfig();
// Writes to Saved/Config/<Platform>/Game.ini
```

### Via GameUserSettings

For player-facing settings (resolution, quality, etc.):

```cpp
UGameUserSettings* UserSettings = GEngine->GetGameUserSettings();
UserSettings->SetScreenResolution(FIntPoint(1920, 1080));
UserSettings->SetFullscreenMode(EWindowMode::Fullscreen);
UserSettings->SetFrameRateLimit(60.0f);
UserSettings->ApplySettings(true);
// Writes to Saved/Config/<Platform>/GameUserSettings.ini
```

---

## Config File Locations on Each Platform

### Development (Editor)

| Path | Purpose |
|------|---------|
| `<EngineDir>/Config/` | Engine base configs |
| `<ProjectDir>/Config/` | Project configs |
| `<ProjectDir>/Saved/Config/<Platform>/` | Editor-saved overrides |

### Packaged Builds

| Platform | Config Path | User Config Path |
|----------|------------|-----------------|
| Windows | `<InstallDir>/<GameName>/Config/` | `%LOCALAPPDATA%/<GameName>/Saved/Config/Windows/` |
| Mac | `<AppBundle>/Contents/UE/<GameName>/Config/` | `~/Library/Preferences/<GameName>/Saved/Config/Mac/` |
| Linux | `<InstallDir>/<GameName>/Config/` | `~/.config/<GameName>/Saved/Config/Linux/` |
| iOS | `<AppBundle>/Config/` | `Documents/Config/` |
| Android | `<APK>/Config/` | Internal storage `UE4Game/<GameName>/Saved/Config/Android/` |
| PS5 | Read from mounted game data | Save data mount |
| Xbox | Read from package | User storage |

### FPaths Helpers

```cpp
FPaths::ProjectConfigDir()      // <ProjectDir>/Config/
FPaths::GeneratedConfigDir()    // <ProjectDir>/Saved/Config/<Platform>/  (or platform equivalent)
FPaths::EngineConfigDir()       // <EngineDir>/Config/
FPaths::SourceConfigDir()       // Config/ relative to source
```

---

## UserSettings vs ProjectSettings

### GameUserSettings.ini

- Written per-user, per-machine.
- Contains display, audio, input, quality settings.
- Managed via `UGameUserSettings` class.
- Location: `Saved/Config/<Platform>/GameUserSettings.ini`.
- Survives game updates; belongs to the player.

### Default*.ini (Project Settings)

- Written per-project, checked into source control.
- Contains game design parameters, physics settings, rendering defaults.
- Managed via `UDeveloperSettings` or direct GConfig access.
- Location: `Config/Default*.ini`.
- Shared across all users; belongs to the project.

### When to Use Which

| Setting Type | File | Class |
|-------------|------|-------|
| Screen resolution | GameUserSettings.ini | UGameUserSettings |
| Audio volume | GameUserSettings.ini | UGameUserSettings |
| Quality level | GameUserSettings.ini | UGameUserSettings |
| Key bindings | Input.ini | UInputSettings |
| Physics gravity | DefaultEngine.ini | Project setting |
| Default map | DefaultGame.ini | UGameMapsSettings |
| Max FPS | GameUserSettings.ini | UGameUserSettings |
| Server name | DefaultGame.ini | Custom UDeveloperSettings |

---

## Config Versioning and Migration

### Config Version Stamps

UE tracks config versions to know when to regenerate or update settings:

```ini
[/Script/Engine.RendererSettings]
; Version stamp prevents re-applying defaults after user changes
r.DefaultFeature.AntiAliasing=2
```

### Handling Config Migration

When you change default values in a new build:

1. **Use `FConfigManifest`** to declare config version bumps.
2. **Check `GConfig->GetInt(Section, "ConfigVersion", ...)`** before applying new defaults.
3. **Use `UPROPERTY(Config)` with `PostInitProperties()`** to migrate old values.

```cpp
void UMySettings::PostInitProperties()
{
    Super::PostInitProperties();

    // Migrate old setting name to new one
    if (OldSettingName_DEPRECATED != 0)
    {
        NewSettingName = OldSettingName_DEPRECATED;
        OldSettingName_DEPRECATED = 0;
        SaveConfig();
    }
}
```

### Force-Resetting User Config

To force users to get new defaults after a major change:

```cpp
// In your game instance or startup code
FString ConfigVersion;
GConfig->GetString(TEXT("ConfigVersion"), TEXT("Version"), ConfigVersion, GGameUserSettingsIni);
if (ConfigVersion != TEXT("2.0"))
{
    // Delete the saved config to force regeneration
    IFileManager::Get().Delete(*FPaths::GeneratedConfigDir() / TEXT("GameUserSettings.ini"));
    // Re-read defaults
    GEngine->GetGameUserSettings()->LoadSettings();
    GConfig->SetString(TEXT("ConfigVersion"), TEXT("Version"), TEXT("2.0"), GGameUserSettingsIni);
    GConfig->Flush(false, GGameUserSettingsIni);
}
```
