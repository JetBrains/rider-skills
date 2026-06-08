---
name: ue:plugin
description: "Use when user asks to create a new plugin, set up plugin modules, configure .uplugin descriptors, add plugin dependencies, set up content-only plugins, or prepare plugins for Marketplace submission. DO NOT TRIGGER for writing C++ class code within existing plugins (use ue:coder), building plugins (use ue:builder), or editor automation (use ue:editor)."
allowed-tools: Read, Glob, Grep, Bash, Write, Edit
argument-hint: "[plugin name or task]"
---

See [Reference Image Handling](../_shared/reference-image-handling.md)

## Context7 Version Check

If the query mentions a specific UE version, or involves features known to change across versions, fetch the relevant Context7 section before answering. See `../_shared/context7-protocol.md`.

# Unreal Engine Plugin Creation Skill

## Checklist

Call `TaskCreate` for each item below before starting, then mark each `in_progress` / `completed` as you go:

1. **Clarify** — plugin type (content-only vs code), module count, dependency requirements
2. **Create structure** — plugin directory, `Plugins/` location, subdirectory layout
3. **Write files** — `.uplugin` descriptor, module `.h`/`.cpp`, `Build.cs`
4. **Build** — build plugin via `ue:builder`; enable in project; confirm module loads with no errors
5. **Code review** — dispatch `ue:code-review` subagent (see `../_shared/post-task.md`); fix all Critical and Important issues before proceeding

## CRITICAL — Mistakes That Waste Hours

1. **Module type must match usage.** A Runtime module in an Editor-only plugin causes packaging errors. If the plugin only provides Editor functionality (custom asset editors, detail customizations, editor modes), every module must be `Type: Editor` or `Type: EditorNoCommandlet`. Shipping a Runtime module that references Editor-only headers (`UnrealEd`, `DetailCustomizations`, `PropertyEditor`) will fail at cook/package time with missing symbol errors that do not surface until the final packaging step.

2. **Loading phase matters.** `PreLoadingScreen` loads before the engine subsystems are ready; `Default` loads after. Choosing the wrong phase means your dependencies are not yet initialized when your module's `StartupModule()` runs. If your plugin registers Slate styles or custom asset types, it typically needs `PreDefault` or `PostEngineInit`. If it provides low-level allocators or logging backends, use `EarliestPossible` or `PostConfigInit`. A mismatch here produces intermittent crashes that are extremely hard to reproduce.

3. **Plugin dependencies must be bidirectionally consistent.** If plugin A declares a dependency on plugin B, then B must load before A. The engine resolves this automatically only if the dependency is declared in the `.uplugin` descriptor. If you add a `#include` from another plugin's module without declaring the plugin dependency, the build may succeed locally but fail on CI or fresh checkouts because module discovery order is not guaranteed.

4. **Content-only plugins still need a `.uplugin`.** Even if the plugin ships zero C++ modules (only Blueprints, materials, data assets), it must have a valid `.uplugin` descriptor in its root directory. Without it, the engine will not mount the plugin's Content directory, and all asset references will be broken. Set `"Modules": []` and `"CanContainContent": true`.

5. **Plugin name must match directory name exactly.** The `.uplugin` file must be named `<PluginName>.uplugin` and must reside in a directory named `<PluginName>`. Any mismatch (case included on case-sensitive filesystems) means the plugin discovery system will skip it entirely with no warning in the log unless verbose logging is enabled.

6. **Marketplace plugins need explicit whitelisted platforms.** If `SupportedTargetPlatforms` is omitted, the Marketplace review team will reject the submission. You must explicitly list every platform you have tested: `["Win64", "Mac", "Linux", "IOS", "Android"]`. Listing a platform you have not tested is also grounds for rejection.

7. **Primary Asset Types in plugins need AssetManager registration.** If your plugin defines new Primary Asset Types (data assets used for game content), the project's `DefaultGame.ini` or the plugin's own config must register them with the Asset Manager. Otherwise, the assets exist in the editor but are stripped during cooking because the Asset Manager does not know to include them.

8. **Plugin modules with Editor dependencies must be `Type: Editor`.** A module typed as `Runtime` cannot link against Editor-only modules (`UnrealEd`, `Blutility`, `EditorStyle`, etc.). The build system enforces this at link time for packaged builds. The fix is to split Editor functionality into a separate `Editor`-typed module within the same plugin, keeping the Runtime module clean of Editor references.

---

## Plugin Creation Workflow

### Step 1: Determine Plugin Scope

Before creating any files, answer these questions:
- Does the plugin contain C++ code, content only, or both?
- Is it Editor-only (tools, utilities) or does it ship with the game (Runtime)?
- Does it depend on other plugins?
- Will it be distributed via Marketplace?

### Step 2: Create Directory Structure

```
<ProjectRoot>/Plugins/<PluginName>/
    <PluginName>.uplugin
    Resources/
        Icon128.png          # 128x128 plugin icon
    Content/                 # Only if CanContainContent=true
    Config/                  # Optional plugin-specific config
    Source/
        <ModuleName>/
            Public/
                <ModuleName>Module.h
            Private/
                <ModuleName>Module.cpp
            <ModuleName>.Build.cs
```

For plugins with both Runtime and Editor modules:
```
Source/
    <PluginName>/            # Runtime module
        Public/
        Private/
        <PluginName>.Build.cs
    <PluginName>Editor/      # Editor module
        Public/
        Private/
        <PluginName>Editor.Build.cs
```

### Step 3: Write the .uplugin Descriptor

Minimal Runtime plugin:
```json
{
    "FileVersion": 3,
    "Version": 1,
    "VersionName": "1.0.0",
    "FriendlyName": "My Plugin",
    "Description": "A brief description of what this plugin does.",
    "Category": "Gameplay",
    "CreatedBy": "Your Name",
    "CreatedByURL": "https://yoursite.com",
    "DocsURL": "",
    "MarketplaceURL": "",
    "SupportURL": "",
    "CanContainContent": true,
    "IsBetaVersion": false,
    "IsExperimentalVersion": false,
    "Installed": false,
    "Modules": [
        {
            "Name": "MyPlugin",
            "Type": "Runtime",
            "LoadingPhase": "Default"
        }
    ]
}
```

Content-only plugin:
```json
{
    "FileVersion": 3,
    "Version": 1,
    "VersionName": "1.0.0",
    "FriendlyName": "My Content Pack",
    "Description": "Content-only plugin.",
    "Category": "Content",
    "CreatedBy": "Your Name",
    "CanContainContent": true,
    "Modules": []
}
```

### Step 4: Create Module Files

**Build.cs** (`Source/<ModuleName>/<ModuleName>.Build.cs`):
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
            "Slate",
            "SlateCore",
        });
    }
}
```

**Module header** (`Source/<ModuleName>/Public/<ModuleName>Module.h`):
```cpp
#pragma once

#include "Modules/interface/IModuleInterface.h"

class FMyPluginModule : public IModuleInterface
{
public:
    virtual void StartupModule() override;
    virtual void ShutdownModule() override;
};
```

**Module implementation** (`Source/<ModuleName>/Private/<ModuleName>Module.cpp`):
```cpp
#include "<ModuleName>Module.h"

#define LOCTEXT_NAMESPACE "F<ModuleName>Module"

void F<ModuleName>Module::StartupModule()
{
    // Called when the module is loaded into memory
}

void F<ModuleName>Module::ShutdownModule()
{
    // Called when the module is unloaded from memory
}

#undef LOCTEXT_NAMESPACE

IMPLEMENT_MODULE(F<ModuleName>Module, <ModuleName>)
```

### Step 5: Add Plugin Dependencies (if any)

In the `.uplugin`, add a `Plugins` array:
```json
{
    "Plugins": [
        {
            "Name": "OnlineSubsystem",
            "Enabled": true
        }
    ]
}
```

In the `Build.cs`, add the dependency modules:
```csharp
PrivateDependencyModuleNames.Add("OnlineSubsystem");
```

Both declarations are required. The `.uplugin` dependency ensures plugin load order; the `Build.cs` dependency enables C++ linking.

### Step 6: Add Plugin Icon

Place a 128x128 PNG at `Resources/Icon128.png`. This icon appears in the Plugin Browser. For Marketplace submissions, also provide a 256x256 thumbnail.

### Step 7: Verify

1. Regenerate project files (right-click `.uproject` > Generate Project Files, or run `GenerateProjectFiles.bat`).
2. Build the project.
3. Open the editor, go to Edit > Plugins, and confirm the plugin appears and can be enabled.
4. For packaging: do a full package build to verify no Editor references leak into Runtime modules.

---

## .uplugin Descriptor Reference

| Field | Type | Required | Description |
|---|---|---|---|
| `FileVersion` | int | Yes | Always `3` for UE4/UE5 |
| `Version` | int | Yes | Internal version number (integer, incremented) |
| `VersionName` | string | Yes | Human-readable version (e.g., "1.2.3") |
| `FriendlyName` | string | Yes | Display name in Plugin Browser |
| `Description` | string | Yes | Brief description |
| `Category` | string | No | Plugin Browser category |
| `CreatedBy` | string | Yes | Author name |
| `CreatedByURL` | string | No | Author website |
| `DocsURL` | string | No | Documentation link |
| `MarketplaceURL` | string | No | Marketplace listing URL |
| `SupportURL` | string | No | Support/issue tracker URL |
| `EngineVersion` | string | No | Required engine version (e.g., "5.3.0") |
| `EnabledByDefault` | bool | No | Whether plugin is enabled without explicit activation |
| `CanContainContent` | bool | No | Whether plugin has a Content directory |
| `IsBetaVersion` | bool | No | Beta flag shown in Plugin Browser |
| `IsExperimentalVersion` | bool | No | Experimental flag |
| `Installed` | bool | No | Treat as installed (pre-built) plugin |
| `SupportedTargetPlatforms` | string[] | No | Platform whitelist |
| `SupportedPrograms` | string[] | No | Standalone programs that use this plugin |
| `Modules` | array | Yes | Module descriptors (can be empty) |
| `Plugins` | array | No | Plugin dependencies |
| `LocalizationTargets` | array | No | Localization configuration |

## Module Types Table

| Type | Packaged Build | Editor | Commandlet | Use Case |
|---|---|---|---|---|
| `Runtime` | Yes | Yes | Yes | Gameplay code that ships |
| `RuntimeNoCommandlet` | Yes | Yes | No | Runtime code not needed in commandlets |
| `Developer` | No | Yes | Yes | Developer tools (not shipped) |
| `DeveloperTool` | No | Yes | No | Developer tools, no commandlet |
| `Editor` | No | Yes | Yes | Editor extensions |
| `EditorNoCommandlet` | No | Yes | No | Editor extensions, no commandlet |
| `UncookedOnly` | No | Yes | Yes | Uncooked-only content tools |
| `Program` | Varies | No | No | Standalone programs |

## Loading Phases Table

| Phase | Order | Typical Use |
|---|---|---|
| `EarliestPossible` | 1 | Low-level allocators, logging backends |
| `PostConfigInit` | 2 | Config-dependent initialization |
| `PostSplashScreen` | 3 | After splash, before engine init |
| `PreEarlyLoadingScreen` | 4 | Before early loading screen |
| `PreLoadingScreen` | 5 | Custom loading screens, early UI |
| `PreDefault` | 6 | Slate styles, asset type registration |
| `Default` | 7 | Most plugins — engine fully initialized |
| `PostDefault` | 8 | After most plugins loaded |
| `PostEngineInit` | 9 | Full engine available, after all subsystems |
| `None` | -- | Module not auto-loaded; manual load only |

---

## Knowledge References

- [Plugin Structure](knowledge/plugin-structure.md) — directory layout, descriptor format, icons, dependencies
- [Module Types](knowledge/module-types.md) — module types, loading phases, lifecycle, Build.cs
- [Marketplace Submission](knowledge/marketplace.md) — requirements, process, rejection fixes
