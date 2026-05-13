# Marketplace Submission — Unreal Engine Plugin Distribution

## Marketplace Requirements Checklist

Before submitting a plugin to the Unreal Engine Marketplace, verify every item:

### Mandatory Requirements

- [ ] **Plugin name** matches directory name exactly
- [ ] **`.uplugin` descriptor** has all required fields filled (FriendlyName, Description, CreatedBy, VersionName, Category)
- [ ] **`SupportedTargetPlatforms`** explicitly lists all tested platforms
- [ ] **Icon128.png** present in Resources/ (128x128, PNG)
- [ ] **At least 3 screenshots** (1920x1080 each) showing the plugin in action
- [ ] **Feature image** (1920x1080) for the Marketplace listing header
- [ ] **Description** clearly states what the plugin does, its features, and requirements
- [ ] **Documentation** link provided (DocsURL in .uplugin or separate docs site)
- [ ] **Support channel** available (SupportURL — email, Discord, forum, or issue tracker)
- [ ] **No engine modifications** — plugin must not require modifying engine source
- [ ] **No hardcoded paths** — all paths must be relative or use engine path utilities
- [ ] **No compiler warnings** at default warning level on all supported platforms
- [ ] **No runtime errors** or logged warnings during normal operation
- [ ] **Clean shutdown** — no crashes on editor exit, no leaked resources
- [ ] **Works with a blank project** — plugin must function without project-specific setup (unless documented)

### Content Requirements

- [ ] All assets use correct naming conventions (see below)
- [ ] No placeholder or test content included
- [ ] No copyrighted third-party assets (fonts, textures, audio) without license
- [ ] No references to assets outside the plugin's Content/ directory
- [ ] Materials compile without errors on all target shader platforms
- [ ] Textures use power-of-two dimensions where applicable
- [ ] No absolute file paths embedded in assets

### Code Requirements

- [ ] Compiles without errors on all listed platforms
- [ ] No `#pragma warning(disable:...)` suppressing important warnings
- [ ] No use of `check()` or `ensure()` that would crash in shipping builds (use `if` guards)
- [ ] API macros (`<MODULENAME>_API`) correctly applied to exported symbols
- [ ] Thread safety for any asynchronous operations
- [ ] Memory management follows UE conventions (no raw `new`/`delete` for UObjects)
- [ ] No use of deprecated APIs without `PRAGMA_DISABLE_DEPRECATION_WARNINGS` justification

---

## Plugin Naming Conventions

### Plugin Name

- Use PascalCase: `AdvancedInventory`, `SmartDialogueSystem`
- No spaces, hyphens, or underscores in the plugin directory name
- Keep it concise but descriptive (2-4 words)
- Avoid generic names: "Utils", "Helper", "Tools" — too vague for discovery
- Avoid engine-reserved prefixes: "Unreal", "Epic", "UE"
- Avoid trademarked names

### Module Names

- Runtime module: same as plugin name (`AdvancedInventory`)
- Editor module: plugin name + "Editor" (`AdvancedInventoryEditor`)
- Developer module: plugin name + "Developer" (`AdvancedInventoryDeveloper`)

### Asset Naming (Marketplace Standard)

| Asset Type | Prefix | Example |
|---|---|---|
| Blueprint | `BP_` | `BP_InventoryManager` |
| Widget Blueprint | `WBP_` | `WBP_InventorySlot` |
| Material | `M_` | `M_ItemHighlight` |
| Material Instance | `MI_` | `MI_ItemHighlight_Gold` |
| Texture | `T_` | `T_ItemIcons_Atlas` |
| Static Mesh | `SM_` | `SM_ChestContainer` |
| Skeletal Mesh | `SK_` | `SK_CharacterHands` |
| Animation | `A_` | `A_ChestOpen` |
| Particle System | `PS_` | `PS_ItemPickup` |
| Sound Cue | `SC_` | `SC_InventoryOpen` |
| Sound Wave | `SW_` | `SW_Click` |
| Data Table | `DT_` | `DT_ItemDatabase` |
| Data Asset | `DA_` | `DA_WeaponConfig` |
| Enum | `E_` | `E_ItemRarity` |
| Struct | `F_` (in C++) | `FInventorySlotData` |
| Interface | `I_` (in C++) | `IInventoryInterface` |
| Curve | `Curve_` | `Curve_DamageDropoff` |

### Content Directory Structure

```
Content/
    <PluginName>/
        Blueprints/
        Materials/
        Textures/
        Meshes/
        Audio/
        Data/
        Maps/           # Example/demo maps
        UI/             # Widget Blueprints
```

All content must be under the plugin's own Content subdirectory. Never place assets at the Content root.

---

## Required Metadata and Descriptions

### .uplugin Metadata

```json
{
    "FriendlyName": "Advanced Inventory System",
    "Description": "A modular, multiplayer-ready inventory system with drag-and-drop UI, item stacking, crafting integration, and save/load serialization.",
    "Category": "Gameplay",
    "CreatedBy": "Your Studio Name",
    "CreatedByURL": "https://yourstudio.com",
    "DocsURL": "https://docs.yourstudio.com/advanced-inventory",
    "MarketplaceURL": "",
    "SupportURL": "https://yourstudio.com/support",
    "VersionName": "1.0.0",
    "EngineVersion": "5.4.0"
}
```

### Marketplace Listing Fields

When submitting through the Marketplace portal, you provide:

- **Title:** Plugin name (matches FriendlyName)
- **Short Description:** 1-2 sentences, shown in search results (max 140 characters)
- **Long Description:** Full feature list, use cases, requirements. Supports basic HTML formatting.
- **Technical Details:**
  - Feature list (bulleted)
  - Code modules (list each with type: Runtime, Editor, etc.)
  - Number of Blueprints
  - Number of C++ classes
  - Supported platforms
  - Supported engine versions
  - Network replicated: Yes/No
  - Documentation: link
  - Important notes/limitations
- **Images:** Feature image + screenshots (minimum 3)
- **Video:** Optional but strongly recommended (YouTube/Vimeo link)
- **Price:** Set by seller (Epic takes 12% for engine-version-specific, 25% for non-exclusive)

### Writing Effective Descriptions

Do:
- Lead with the core value proposition
- List specific features with concrete details
- Mention performance characteristics ("handles 10,000+ items")
- State supported engine versions explicitly
- Note multiplayer/replication support
- Include "Getting Started" summary

Do not:
- Use superlatives ("best", "fastest", "ultimate") without evidence
- Claim compatibility with versions you have not tested
- Promise future features
- Reference competing products by name
- Include pricing information in the description

---

## Platform Support Matrix

### Common Platforms

| Platform ID | Display Name | Notes |
|---|---|---|
| `Win64` | Windows 64-bit | Required for most submissions |
| `Mac` | macOS | Apple Silicon (arm64) support expected for UE5.2+ |
| `Linux` | Linux | Server builds often Linux-targeted |
| `IOS` | iOS | Requires Xcode on Mac to build/test |
| `Android` | Android | Test on physical devices, not just emulator |
| `LinuxArm64` | Linux ARM64 | Growing server market |

### Platform-Specific Considerations

**Windows (Win64):**
- Primary development platform; test here first
- Visual Studio 2022 required for UE5
- Both DX11 and DX12 shader models should work

**macOS (Mac):**
- Test on both Intel and Apple Silicon
- Metal rendering backend
- Code signing requirements for distribution

**Linux:**
- Headless (dedicated server) builds must work without display
- Verify no X11/Wayland dependencies in Runtime modules
- Vulkan rendering backend

**iOS:**
- No dynamic code loading (all must be statically linked)
- Metal only
- Memory constraints are strict — test on older devices
- App Store guidelines apply

**Android:**
- Vulkan and OpenGL ES 3.1+
- Verify touch input handling
- APK size considerations
- Test on multiple GPU vendors (Adreno, Mali, PowerVR)

### Declaring Platform Support

In the `.uplugin`:
```json
{
    "SupportedTargetPlatforms": ["Win64", "Mac", "Linux"],
    "Modules": [
        {
            "Name": "MyPlugin",
            "Type": "Runtime",
            "LoadingPhase": "Default",
            "PlatformAllowList": ["Win64", "Mac", "Linux"]
        }
    ]
}
```

For modules that only work on specific platforms (e.g., platform-specific SDKs):
```json
{
    "Name": "MyPluginSteam",
    "Type": "Runtime",
    "LoadingPhase": "Default",
    "PlatformAllowList": ["Win64", "Mac", "Linux"]
},
{
    "Name": "MyPluginConsole",
    "Type": "Runtime",
    "LoadingPhase": "Default",
    "PlatformAllowList": ["XboxOneGDK", "PS5"]
}
```

---

## Testing Requirements

### Minimum Testing Before Submission

1. **Fresh project test:** Create a new blank project, add the plugin, verify it works without any project-specific setup.

2. **Enable/disable cycle:** Enable the plugin, restart the editor, verify functionality. Disable the plugin, restart, verify no errors or crashes.

3. **Package test:** Package the project for each supported platform. Verify:
   - Packaging completes without errors
   - Plugin functionality works in the packaged build
   - No Editor-only code leaks into the package
   - Content is cooked correctly

4. **Migration test:** Migrate plugin from one project to another using the editor's Migrate feature. Verify all content and references are intact.

5. **Version compatibility:** Test on every engine version you claim to support. Do not assume forward or backward compatibility.

### Automated Testing

Marketplace does not require automated tests, but they strengthen your submission:

```cpp
// Example: Automation test for plugin functionality
IMPLEMENT_SIMPLE_AUTOMATION_TEST(FMyPluginBasicTest, "MyPlugin.Basic.Initialization",
    EAutomationTestFlags::EditorContext | EAutomationTestFlags::ProductFilter)

bool FMyPluginBasicTest::RunTest(const FString& Parameters)
{
    // Verify module loaded
    TestTrue("Module is loaded", FModuleManager::Get().IsModuleLoaded("MyPlugin"));

    // Verify subsystem created
    UGameInstance* GI = UGameplayStatics::GetGameInstance(GWorld);
    UMySubsystem* Subsystem = GI->GetSubsystem<UMySubsystem>();
    TestNotNull("Subsystem exists", Subsystem);

    return true;
}
```

### Performance Testing

- Profile with Unreal Insights or `stat` commands
- Verify no per-frame allocations in hot paths
- Ensure tick-heavy systems can be disabled when not needed
- Document performance characteristics (memory usage, CPU cost)

---

## Code Quality Expectations

### Epic's Code Standards

Marketplace reviewers check for:

1. **UE coding conventions:** Follow the Epic coding standard
   - `F` prefix for structs and non-UObject classes
   - `U` prefix for UObject-derived classes
   - `A` prefix for Actor-derived classes
   - `E` prefix for enums
   - `I` prefix for interfaces
   - `b` prefix for boolean variables

2. **Proper UPROPERTY/UFUNCTION usage:**
   ```cpp
   UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Inventory")
   int32 MaxStackSize = 99;

   UFUNCTION(BlueprintCallable, Category = "Inventory")
   bool AddItem(const FItemData& Item);
   ```

3. **Category consistency:** All exposed properties and functions must have `Category` set. Use the plugin name or feature name as the category.

4. **Tooltip documentation:**
   ```cpp
   /** Maximum number of items that can be stacked in a single slot. */
   UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Inventory",
       meta = (ClampMin = "1", ClampMax = "999"))
   int32 MaxStackSize = 99;
   ```

5. **No hardcoded strings** for user-facing text:
   ```cpp
   // Wrong
   FText::FromString("Inventory Full");

   // Right
   NSLOCTEXT("MyPlugin", "InventoryFull", "Inventory Full")
   // Or use LOCTEXT with LOCTEXT_NAMESPACE defined
   ```

6. **Proper error handling:**
   ```cpp
   // Wrong
   check(SomePointer);  // Crashes in shipping

   // Right
   if (!SomePointer)
   {
       UE_LOG(LogMyPlugin, Warning, TEXT("SomePointer was null in %s"), *GetName());
       return;
   }
   ```

### Log Category

Define a custom log category:
```cpp
// In header
DECLARE_LOG_CATEGORY_EXTERN(LogMyPlugin, Log, All);

// In cpp
DEFINE_LOG_CATEGORY(LogMyPlugin);
```

Use it consistently throughout the plugin instead of `LogTemp`.

---

## Content Guidelines

### Blueprint Exposure

For maximum usability, expose key functionality to Blueprints:
- Core API functions: `BlueprintCallable`
- State queries: `BlueprintPure`
- Events: `BlueprintAssignable` delegates
- Key properties: `BlueprintReadWrite` or `BlueprintReadOnly`
- Overridable behavior: `BlueprintNativeEvent`

### Example Content

Include at minimum:
- An example map demonstrating the plugin's core features
- Example Blueprints showing common integration patterns
- A "Getting Started" Blueprint or tutorial level

### Localization

If the plugin has user-facing strings:
- Use `LOCTEXT` / `NSLOCTEXT` macros for all text
- Set up localization targets in the `.uplugin`
- Provide at least English source strings
- Structure text for easy translation (avoid concatenation, use `FText::Format`)

---

## Submission Process

### Step 1: Prepare

1. Complete all items in the requirements checklist
2. Test on all claimed platforms
3. Write documentation
4. Prepare marketing assets (screenshots, video, descriptions)
5. Set the `Installed` field to `false` in the `.uplugin` (Epic's build system sets this)

### Step 2: Package

Package the plugin using UAT:
```bash
RunUAT.bat BuildPlugin \
    -Plugin="<FullPath>/MyPlugin.uplugin" \
    -Package="<OutputPath>/MyPlugin" \
    -TargetPlatforms=Win64+Mac+Linux \
    -Rocket
```

Verify the packaged output:
- `Binaries/` contains compiled modules for each platform
- `Content/` contains all cooked content
- `Source/` contains clean source code
- No `Intermediate/` or `Saved/` directories
- No `.git` or other VCS metadata

### Step 3: Submit

1. Log in to the [Marketplace Publisher Portal](https://publish.unrealengine.com/)
2. Create a new product listing
3. Fill in all metadata fields
4. Upload the packaged plugin as a ZIP
5. Upload images and marketing materials
6. Set pricing and distribution options
7. Submit for review

### Step 4: Review

- Epic reviews submissions within 2-4 weeks (varies)
- Reviewers test on Windows primarily, with spot checks on other platforms
- You receive feedback via the publisher portal
- Address all feedback and resubmit if rejected

### Step 5: Post-Launch

- Monitor support channels for user issues
- Submit updates through the publisher portal
- Update for new engine versions promptly
- Respond to Marketplace reviews

---

## Common Rejection Reasons and Fixes

### 1. Missing Platform Support Declaration

**Rejection:** "Plugin does not declare supported platforms."

**Fix:** Add `SupportedTargetPlatforms` to `.uplugin`:
```json
"SupportedTargetPlatforms": ["Win64", "Mac", "Linux"]
```

### 2. Editor References in Runtime Module

**Rejection:** "Runtime module references Editor-only types. Plugin fails to package."

**Fix:** Split Editor functionality into a separate module:
```json
"Modules": [
    { "Name": "MyPlugin", "Type": "Runtime", "LoadingPhase": "Default" },
    { "Name": "MyPluginEditor", "Type": "Editor", "LoadingPhase": "PostEngineInit" }
]
```

Move all `#include` directives for Editor modules into the Editor module's source.

### 3. Hardcoded Paths

**Rejection:** "Plugin uses hardcoded file paths that break on other machines."

**Fix:** Use engine path utilities:
```cpp
// Wrong
FString Path = "C:/Users/Dev/MyProject/Plugins/MyPlugin/Content/Data.json";

// Right
FString Path = FPaths::Combine(
    IPluginManager::Get().FindPlugin("MyPlugin")->GetBaseDir(),
    TEXT("Content/Data.json"));

// Or for content
FString AssetPath = "/MyPlugin/Data/DT_Items";
```

### 4. No Documentation

**Rejection:** "Plugin lacks documentation. Users cannot understand setup or usage."

**Fix:** Provide documentation at the DocsURL. At minimum:
- Installation instructions
- Quick start guide
- API reference for key classes/functions
- Example use cases
- Troubleshooting / FAQ

### 5. Compiler Warnings

**Rejection:** "Plugin produces compiler warnings on [platform]."

**Fix:** Compile with highest warning level on all platforms and fix every warning:
```csharp
// Build.cs
if (Target.Platform == UnrealTargetPlatform.Win64)
{
    // Treat warnings as errors during development
    bWarningsAsErrors = true;
}
```

Common warnings to fix:
- Unused variables / parameters (remove or cast to `void`)
- Signed/unsigned comparison (use matching types)
- Possible loss of data (use explicit casts)
- Shadow variable declarations (rename)
- Missing `override` keyword

### 6. Crashes on Enable/Disable

**Rejection:** "Enabling then disabling the plugin and restarting causes a crash."

**Fix:** Ensure `ShutdownModule()` properly unregisters everything:
- Unregister all Slate styles
- Remove all menu/toolbar extensions
- Unsubscribe from all delegates
- Clear all registered asset types
- Release all held references

### 7. Missing Icon

**Rejection:** "Plugin has no icon in the Plugin Browser."

**Fix:** Add `Resources/Icon128.png` (128x128 PNG). Use a clear, recognizable icon that represents the plugin's function.

### 8. Content References Outside Plugin

**Rejection:** "Plugin assets reference content outside the plugin directory."

**Fix:** Audit all asset references:
```bash
# In editor: Right-click Content folder > Size Map or Reference Viewer
# Check for any references to /Game/ or other plugin paths
```

All internal references should use `/PluginName/` path prefix. If the plugin integrates with project content, use soft references and handle missing assets gracefully:
```cpp
UPROPERTY(EditAnywhere, Category = "Config")
TSoftObjectPtr<UDataTable> ItemDatabase;

// Usage
if (UDataTable* Table = ItemDatabase.LoadSynchronous())
{
    // Use table
}
```

### 9. No Example Content

**Rejection:** "Plugin provides no examples or demo content for users to understand usage."

**Fix:** Include:
- An example map (e.g., `Content/MyPlugin/Maps/ExampleMap`)
- Example Blueprints demonstrating integration
- A demo widget showing UI features (if applicable)
- Comments in example Blueprints explaining the setup

### 10. Deprecated API Usage

**Rejection:** "Plugin uses deprecated APIs that will be removed in future engine versions."

**Fix:** Replace deprecated calls with their modern equivalents. Common migrations:
```cpp
// Old (deprecated)
FStringAssetReference AssetRef;
// New
FSoftObjectPath AssetPath;

// Old (deprecated)
GetWorld()->SpawnActor(...)
// New (if class is known at compile time)
GetWorld()->SpawnActor<AMyActor>(...)

// Old (deprecated)
UGameplayStatics::GetAllActorsOfClass(...)
// Consider using subsystem queries or spatial queries for better performance
```

Check the engine's deprecation warnings in the header files for migration guidance.

---

## Pricing and Revenue

### Pricing Tiers

- **Free:** Good for building reputation, gaining users, upselling premium plugins
- **$4.99 - $14.99:** Simple utilities, single-feature plugins
- **$14.99 - $49.99:** Full-featured systems, tools with significant functionality
- **$49.99 - $149.99:** Complex frameworks, multi-module systems
- **$149.99+:** Enterprise-grade solutions, complete game templates

### Revenue Split

- **Exclusive to Marketplace:** 88% to seller, 12% to Epic
- **Non-exclusive:** 75% to seller, 25% to Epic
- Royalty-free for buyers — one purchase, unlimited projects

### Update Expectations

- Users expect updates for new engine versions within 1-2 months of engine release
- Bug fixes should be published promptly (within 1-2 weeks of report)
- Feature updates keep the plugin relevant and drive additional sales
- Abandoned plugins with no updates for 6+ months receive lower search ranking

---

## Version Management

### Versioning Strategy

Use semantic versioning in `VersionName`:
- **Major** (1.0.0 -> 2.0.0): Breaking API changes, major feature overhauls
- **Minor** (1.0.0 -> 1.1.0): New features, backward-compatible
- **Patch** (1.0.0 -> 1.0.1): Bug fixes, no API changes

Increment the integer `Version` field with each Marketplace update.

### Engine Version Branches

Maintain branches for each supported engine version:
```
main          → latest engine version
ue5.4         → UE 5.4 compatible
ue5.3         → UE 5.3 compatible
```

### Changelog

Maintain a changelog (shown in the Marketplace listing):
```
## 1.2.0 (2026-03-15)
### Added
- Crafting system integration
- Drag-and-drop between inventory panels

### Fixed
- Stack count not updating in multiplayer
- Crash when removing items during save

### Changed
- Improved tooltip rendering performance
```
