# Module Types and Loading — Unreal Engine Plugin Modules

## Module Types

Every C++ module in a plugin must declare a `Type` in the `.uplugin` descriptor. This type controls when and where the module is compiled and loaded.

### Runtime

```json
{ "Name": "MyModule", "Type": "Runtime", "LoadingPhase": "Default" }
```

- **Compiled for:** Editor, packaged game (client and server), commandlets
- **Included in cooked builds:** Yes
- **Use when:** The module contains gameplay code, game systems, or any logic that must exist in the shipped product. This is the most common type for gameplay plugins.
- **Restrictions:** Cannot depend on Editor-only modules (`UnrealEd`, `DetailCustomizations`, `PropertyEditor`, `EditorStyle`, `Blutility`, `LevelEditor`, etc.). Doing so compiles in Editor but fails at cook/package time.

### RuntimeNoCommandlet

```json
{ "Name": "MyModule", "Type": "RuntimeNoCommandlet", "LoadingPhase": "Default" }
```

- **Compiled for:** Editor, packaged game
- **Included in cooked builds:** Yes
- **Excluded from:** Commandlet execution (e.g., `ResavePackages`, `DerivedDataCache`)
- **Use when:** The module has initialization side-effects (spawning threads, opening sockets) that should not happen during batch commandlet processing.

### Developer

```json
{ "Name": "MyModule", "Type": "Developer", "LoadingPhase": "Default" }
```

- **Compiled for:** Editor, commandlets (in non-shipping configurations)
- **Included in cooked builds:** No
- **Use when:** The module provides developer-facing tools that should never ship but may be needed during automated commandlet operations (e.g., asset validation scripts, batch processors).

### DeveloperTool

```json
{ "Name": "MyModule", "Type": "DeveloperTool", "LoadingPhase": "Default" }
```

- **Compiled for:** Editor only (non-shipping configurations)
- **Included in cooked builds:** No
- **Excluded from:** Commandlets
- **Use when:** Interactive developer tools (debug visualizers, internal dashboards) that are only meaningful in the Editor UI.

### Editor

```json
{ "Name": "MyModule", "Type": "Editor", "LoadingPhase": "Default" }
```

- **Compiled for:** Editor, commandlets
- **Included in cooked builds:** No
- **Use when:** Editor extensions — custom asset editors, detail panel customizations, editor modes, toolbar buttons, content browser extensions. This is the most common type for Editor-only plugins. Can freely depend on `UnrealEd` and other Editor modules.

### EditorNoCommandlet

```json
{ "Name": "MyModule", "Type": "EditorNoCommandlet", "LoadingPhase": "Default" }
```

- **Compiled for:** Editor only
- **Included in cooked builds:** No
- **Excluded from:** Commandlets
- **Use when:** Editor UI extensions that should not run during batch processing. Example: a custom asset thumbnail renderer that opens GPU resources — running this in a headless commandlet would fail.

### UncookedOnly

```json
{ "Name": "MyModule", "Type": "UncookedOnly", "LoadingPhase": "Default" }
```

- **Compiled for:** Editor, commandlets (when cooking is not involved)
- **Included in cooked builds:** No
- **Use when:** Content authoring tools that manipulate uncooked assets. Similar to Editor but the semantic intent is different — these modules are about content pipelines, not editor UI.

### Program

```json
{ "Name": "MyModule", "Type": "Program", "LoadingPhase": "Default" }
```

- **Compiled for:** Standalone program targets only
- **Included in cooked builds:** No
- **Excluded from:** Editor, game
- **Use when:** The module is part of a standalone tool (e.g., `UnrealHeaderTool`, `ShaderCompileWorker`). Rarely used in game plugins.

---

## Module Type Decision Matrix

| Question | Yes → Type | No → Continue |
|---|---|---|
| Does it ship with the game? | Continue below | `Editor` or `Developer` |
| Does it reference Editor modules? | `Editor` (split it out) | Continue |
| Does it need to run in commandlets? | `Runtime` | `RuntimeNoCommandlet` |
| Is it a standalone tool? | `Program` | `Runtime` |

For Editor-only:

| Question | Yes → Type | No → Continue |
|---|---|---|
| Does it run in commandlets? | `Editor` | `EditorNoCommandlet` |
| Is it a developer-only tool? | `Developer` or `DeveloperTool` | `Editor` |

---

## Loading Phases

The loading phase controls when during engine startup the module's `StartupModule()` is called. Modules within the same phase load in dependency order.

### EarliestPossible

- **When:** Before the engine core is initialized
- **Available:** Minimal C++ runtime, logging
- **Not available:** Config system, UObject, Slate, anything else
- **Use for:** Custom memory allocators, low-level logging backends, crash reporters
- **Risk:** Very few engine services exist. Most code will crash here.

### PostConfigInit

- **When:** After config files are parsed
- **Available:** Config system (`GConfig`), logging, basic file I/O
- **Not available:** UObject system, Slate, rendering
- **Use for:** Config-driven initialization, feature flags that affect early startup, platform abstraction layers
- **Example:** A plugin that reads a config file to decide which subsystems to register

### PostSplashScreen

- **When:** After the splash screen is displayed
- **Available:** Config, basic engine init
- **Not available:** Full UObject, rendering pipeline
- **Use for:** Modules that need to show progress during startup but before the engine is fully online

### PreEarlyLoadingScreen

- **When:** Before the early loading screen (before full engine init)
- **Available:** Partial engine systems
- **Use for:** Registering custom loading screen implementations

### PreLoadingScreen

- **When:** Before the loading screen is shown
- **Available:** Slate (partially), basic engine systems
- **Not available:** Full asset loading, gameplay framework
- **Use for:** Custom loading screen modules, early UI registration, Slate style registration
- **Common pattern:** Plugins that provide custom `IGameMoviePlayer` implementations

### PreDefault

- **When:** Before most plugins load, but after core engine initialization
- **Available:** UObject, asset registry, Slate
- **Not available:** Some gameplay subsystems may not be ready
- **Use for:** Registering custom asset types, Slate styles, asset factories — anything that other `Default`-phase plugins might depend on
- **Common pattern:** Foundation plugins that other plugins build upon

### Default

- **When:** Standard loading time. Engine is fully initialized.
- **Available:** Everything
- **Use for:** The vast majority of plugins. If you have no specific timing requirements, use Default.
- **Recommendation:** Start here. Move to another phase only if you encounter initialization ordering issues.

### PostDefault

- **When:** After all Default-phase plugins have loaded
- **Available:** Everything, including all Default-phase plugins
- **Use for:** Plugins that need to discover or modify what other plugins have registered. Example: a plugin that aggregates menu items from other plugins.

### PostEngineInit

- **When:** After the engine is fully initialized, including all subsystems
- **Available:** Everything, including gameplay framework, world subsystems
- **Use for:** Modules that need the full engine stack. Editor extensions that register with specific editor subsystems. Modules that hook into the world or game instance.
- **Common pattern:** Editor tool plugins that extend menus, toolbars, or modes

### None

- **When:** Never (not auto-loaded)
- **Use for:** Modules that are loaded on-demand programmatically via `FModuleManager::LoadModuleChecked<>()`
- **Warning:** If no code loads this module, it will never initialize

---

## Loading Phase Decision Flowchart

```
Does the module need engine subsystems?
├─ No → EarliestPossible or PostConfigInit
└─ Yes
   ├─ Does it register asset types / Slate styles?
   │  └─ Yes → PreDefault
   ├─ Does it need other plugins to be loaded first?
   │  └─ Yes → PostDefault or PostEngineInit
   ├─ Does it provide loading screen functionality?
   │  └─ Yes → PreLoadingScreen
   ├─ Is it loaded on-demand only?
   │  └─ Yes → None
   └─ Otherwise → Default
```

---

## Module Lifecycle Callbacks

### IModuleInterface

Every module implements `IModuleInterface` (or a subclass). The two primary lifecycle methods:

```cpp
class FMyPluginModule : public IModuleInterface
{
public:
    /** Called when the module is loaded into memory. */
    virtual void StartupModule() override;

    /** Called when the module is unloaded from memory. */
    virtual void ShutdownModule() override;

    /** Whether this module supports dynamic reloading (hot reload). */
    virtual bool SupportsDynamicReloading() override { return true; }

    /** Whether this module should be loaded immediately on startup or on demand. */
    virtual bool IsGameModule() const override { return true; }
};
```

### StartupModule()

Called once when the module is loaded. This is where you:
- Register Slate styles and brushes
- Register asset types with the Asset Registry
- Extend menus and toolbars (Editor modules)
- Register console commands
- Subscribe to delegates
- Initialize subsystems

```cpp
void FMyPluginModule::StartupModule()
{
    // Register Slate style
    FMyPluginStyle::Initialize();
    FMyPluginStyle::ReloadTextures();

    // Register commands
    FMyPluginCommands::Register();

    // Extend the Level Editor toolbar
    if (GIsEditor && !IsRunningCommandlet())
    {
        UToolMenus::RegisterStartupCallback(
            FSimpleMulticastDelegate::FDelegate::CreateRaw(
                this, &FMyPluginModule::RegisterMenus));
    }
}
```

### ShutdownModule()

Called when the module is unloaded. This is where you:
- Unregister everything registered in StartupModule
- Clean up allocated resources
- Remove delegates

```cpp
void FMyPluginModule::ShutdownModule()
{
    UToolMenus::UnRegisterStartupCallback(this);
    UToolMenus::UnregisterOwner(this);

    FMyPluginStyle::Shutdown();
    FMyPluginCommands::Unregister();
}
```

**Important:** Always pair registration with unregistration. Failing to unregister in ShutdownModule causes crashes during hot-reload and editor shutdown.

---

## Module Interface Pattern

For plugins that expose functionality to other plugins, define an abstract interface:

### Interface Header (Public/)

```cpp
// IMyPluginInterface.h
#pragma once

#include "Modules/ModuleManager.h"

class IMyPluginInterface : public IModuleInterface
{
public:
    static inline IMyPluginInterface& Get()
    {
        return FModuleManager::LoadModuleChecked<IMyPluginInterface>("MyPlugin");
    }

    static inline bool IsAvailable()
    {
        return FModuleManager::Get().IsModuleLoaded("MyPlugin");
    }

    /** Register a custom item type. */
    virtual void RegisterItemType(FName TypeName, TSubclassOf<UObject> ItemClass) = 0;

    /** Get all registered item types. */
    virtual TArray<FName> GetRegisteredItemTypes() const = 0;
};
```

### Implementation (Private/)

```cpp
// MyPluginModule.cpp
class FMyPluginModule : public IMyPluginInterface
{
    TMap<FName, TSubclassOf<UObject>> RegisteredTypes;

public:
    virtual void RegisterItemType(FName TypeName, TSubclassOf<UObject> ItemClass) override
    {
        RegisteredTypes.Add(TypeName, ItemClass);
    }

    virtual TArray<FName> GetRegisteredItemTypes() const override
    {
        TArray<FName> Keys;
        RegisteredTypes.GetKeys(Keys);
        return Keys;
    }
};

IMPLEMENT_MODULE(FMyPluginModule, MyPlugin)
```

### Consuming the Interface

```cpp
// In another plugin's code
#include "IMyPluginInterface.h"

if (IMyPluginInterface::IsAvailable())
{
    IMyPluginInterface::Get().RegisterItemType("Weapon", AWeaponItem::StaticClass());
}
```

---

## Cross-Module Dependency Best Practices

### Public vs Private Dependencies

In `Build.cs`:

```csharp
// Public: headers from this module's Public/ folder include headers from Core.
// Consumers of this module automatically get Core in their include path.
PublicDependencyModuleNames.AddRange(new string[] { "Core" });

// Private: headers from this module's Private/ folder include headers from these.
// Consumers do NOT get these in their include path.
PrivateDependencyModuleNames.AddRange(new string[]
{
    "CoreUObject",
    "Engine",
    "Slate",
    "SlateCore",
});
```

**Rule of thumb:**
- If a type from module X appears in your `Public/` headers (function parameters, return types, base classes), X must be a **Public** dependency.
- If module X is only used in your `Private/` implementation files, it should be a **Private** dependency.
- Minimize Public dependencies — they propagate transitively and increase compile times.

### Avoiding Circular Dependencies

Circular module dependencies (`A -> B -> A`) cause linker errors. Solutions:

1. **Extract shared code** into a third module C: `A -> C`, `B -> C`
2. **Use interfaces** — module A defines an interface, module B implements it, no direct `A -> B` link
3. **Use delegates** — module A broadcasts an event, module B subscribes without including A's headers
4. **Use the module interface pattern** (see above) with runtime discovery

### DynamicallyLoadedModuleNames

For truly optional, loosely-coupled dependencies:

```csharp
// Build.cs
DynamicallyLoadedModuleNames.AddRange(new string[]
{
    "AssetTools",     // Only load at runtime if available
    "ContentBrowser", // Only load at runtime if available
});
```

These modules are not linked at compile time. You must use `FModuleManager::LoadModuleChecked()` or `FModuleManager::Get().IsModuleLoaded()` to interact with them.

---

## Build.cs Configuration for Plugins

### Minimal Build.cs

```csharp
using UnrealBuildTool;

public class MyPlugin : ModuleRules
{
    public MyPlugin(ReadOnlyTargetRules Target) : base(Target)
    {
        PCHUsage = PCHUsageMode.UseExplicitOrSharedPCHs;

        PublicDependencyModuleNames.AddRange(new string[]
        {
            "Core",
        });

        PrivateDependencyModuleNames.AddRange(new string[]
        {
            "CoreUObject",
            "Engine",
        });
    }
}
```

### Full-Featured Build.cs

```csharp
using UnrealBuildTool;

public class MyPlugin : ModuleRules
{
    public MyPlugin(ReadOnlyTargetRules Target) : base(Target)
    {
        PCHUsage = PCHUsageMode.UseExplicitOrSharedPCHs;

        // Enable IWYU (Include What You Use) for cleaner includes
        bEnforceIWYU = true;

        // API macro for DLL export/import
        PublicDefinitions.Add("MYPLUGIN_API=DLLEXPORT");

        PublicIncludePaths.AddRange(new string[]
        {
            // Additional public include paths (rarely needed)
        });

        PrivateIncludePaths.AddRange(new string[]
        {
            // Additional private include paths
        });

        PublicDependencyModuleNames.AddRange(new string[]
        {
            "Core",
            "CoreUObject",
            "Engine",
        });

        PrivateDependencyModuleNames.AddRange(new string[]
        {
            "Slate",
            "SlateCore",
            "InputCore",
            "UMG",
        });

        // Editor-only dependencies (only link in Editor builds)
        if (Target.bBuildEditor)
        {
            PrivateDependencyModuleNames.AddRange(new string[]
            {
                "UnrealEd",
                "PropertyEditor",
                "DetailCustomizations",
            });
        }

        // Platform-specific dependencies
        if (Target.Platform == UnrealTargetPlatform.Win64)
        {
            PublicAdditionalLibraries.Add(
                Path.Combine(ModuleDirectory, "..", "ThirdParty", "lib", "Win64", "MyLib.lib"));
        }

        // Third-party includes
        PublicIncludePaths.Add(
            Path.Combine(ModuleDirectory, "..", "ThirdParty", "include"));

        // Dynamically loaded modules (not linked, loaded at runtime)
        DynamicallyLoadedModuleNames.AddRange(new string[]
        {
            "AssetTools",
        });
    }
}
```

### Common Build.cs Patterns

#### Conditional Editor Code

Instead of splitting into two modules, you can conditionally compile:

```csharp
if (Target.bBuildEditor)
{
    PrivateDependencyModuleNames.Add("UnrealEd");
    PrivateDefinitions.Add("WITH_EDITOR_CODE=1");
}
else
{
    PrivateDefinitions.Add("WITH_EDITOR_CODE=0");
}
```

Then in C++:
```cpp
#if WITH_EDITOR_CODE
#include "UnrealEdGlobals.h"
// Editor-specific code
#endif
```

**Warning:** This approach works but can become messy. For substantial Editor functionality, prefer a separate Editor module.

#### Third-Party Library Integration

```csharp
string ThirdPartyPath = Path.Combine(ModuleDirectory, "..", "ThirdParty");

PublicIncludePaths.Add(Path.Combine(ThirdPartyPath, "include"));

if (Target.Platform == UnrealTargetPlatform.Win64)
{
    PublicAdditionalLibraries.Add(Path.Combine(ThirdPartyPath, "lib", "Win64", "mylib.lib"));
    RuntimeDependencies.Add("$(BinaryOutputDir)/mylib.dll",
        Path.Combine(ThirdPartyPath, "bin", "Win64", "mylib.dll"));
    PublicDelayLoadDLLs.Add("mylib.dll");
}
else if (Target.Platform == UnrealTargetPlatform.Mac)
{
    PublicAdditionalLibraries.Add(Path.Combine(ThirdPartyPath, "lib", "Mac", "libmylib.dylib"));
    RuntimeDependencies.Add("$(BinaryOutputDir)/libmylib.dylib",
        Path.Combine(ThirdPartyPath, "lib", "Mac", "libmylib.dylib"));
}
else if (Target.Platform == UnrealTargetPlatform.Linux)
{
    PublicAdditionalLibraries.Add(Path.Combine(ThirdPartyPath, "lib", "Linux", "libmylib.so"));
    RuntimeDependencies.Add("$(BinaryOutputDir)/libmylib.so",
        Path.Combine(ThirdPartyPath, "lib", "Linux", "libmylib.so"));
}
```

#### API Macros

For modules that export symbols (required for cross-module C++ access):

```csharp
// Build.cs — no special setup needed; UBT generates the macro
// The API macro is: <MODULENAME>_API (all caps)
```

In headers:
```cpp
// The MYPLUGIN_API macro is auto-generated by UBT based on module name
UCLASS()
class MYPLUGIN_API UMyComponent : public UActorComponent
{
    GENERATED_BODY()
    // ...
};
```

The `<MODULENAME>_API` macro resolves to `__declspec(dllexport)` when building the module and `__declspec(dllimport)` when consuming it. Apply it to any class, struct, function, or global variable that must be accessible from other modules.
