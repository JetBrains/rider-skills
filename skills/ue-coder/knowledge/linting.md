# UE Linting & Checks Reference

## How UE Validation Works

Unreal Engine has several built-in validation and checking mechanisms that operate at different stages of the asset lifecycle.

### 1. DataValidation Framework (Editor-Time)

The primary validation system in UE. Lives in the `DataValidation` module.

**Architecture:**
- `EditorValidatorSubsystem` — singleton that manages all validators, accessible via `unreal.get_editor_subsystem()`
- `EditorValidatorBase` — base class for custom validators
- Validators register automatically when their class is loaded
- Can trigger on save (`validate_on_save`), on submit (changelist validation), or on-demand

**Built-in Validators:**
| Validator | What It Checks |
|-----------|---------------|
| `EditorValidator_Material` | Materials compile on all validation shader platforms |
| `EditorValidator_Localization` | Localized assets (L10N/) match source asset types |
| `PackageFileValidator` | Package file format integrity on disk (corruption detection) |
| `DirtyFilesChangelistValidator` | No unsaved files in changelists being submitted |
| `WorldPartitionChangelistValidator` | World Partition data consistency |

**Validation Results:**
- `num_valid` — passed all checks
- `num_invalid` — has errors (blocks submission if used with changelists)
- `num_warnings` — has warnings but not errors
- `num_skipped` — validator couldn't handle this asset type
- `num_unable_to_validate` — asset couldn't be loaded or processed

**Settings that matter:**
- `load_assets_for_validation` — if False, unloaded assets get skipped (faster but incomplete)
- `capture_asset_load_logs` — captures load warnings as validation results
- `capture_logs_during_validation` — captures log output during validation
- `max_assets_to_validate` — safety cap to prevent editor hangs on large projects

### 2. Asset Registry Checks

The Asset Registry (`unreal.AssetRegistryHelpers.get_asset_registry()`) provides dependency and reference analysis without loading assets.

**Key operations:**
- **Redirector detection**: Filter by class `ObjectRedirector` to find stale redirectors
- **Dependency analysis**: `get_dependencies()` with `AssetRegistryDependencyOptions` to find hard/soft references
- **Referencer analysis**: `get_referencers()` to find what depends on a given asset
- **Asset filtering**: `get_assets()` with `ARFilter` for path/class/tag filtering

**Why redirectors matter:**
- Created automatically when assets are renamed or moved
- Should be fixed up (resolved) after refactoring
- Stale redirectors waste memory, slow down cooking, and can cause packaging failures
- Fix: Content Browser → right-click → Fix Up Redirectors, or `ResavePackages -fixupredirects` commandlet

### 3. Build-Time Checks

UnrealBuildTool (UBT) and UnrealHeaderTool (UHT) perform checks during compilation:

**UHT Checks:**
- UPROPERTY/UFUNCTION macro correctness
- Specifier validation (e.g., `BlueprintReadWrite` on private members)
- Delegate signature matching
- Metadata correctness

**UBT Checks:**
- Module dependency cycles
- Missing module dependencies
- Include-What-You-Use (IWYU) compliance (UE5+)
- Deprecated API usage warnings

**Compiler Warnings (relevant categories):**
- `-Wall -Wextra` equivalent warnings from MSVC/Clang
- Shadow variable warnings
- Unused variable/parameter warnings
- Sign conversion warnings
- Implicit conversion warnings

### 4. Cooking Checks

The cooking pipeline validates assets for target platform compatibility:

- Shader compilation for target platforms (different from editor shaders)
- Texture format compatibility
- Audio format support
- Missing asset references (hard references to deleted assets)
- Platform-specific validation

### 5. Static Analysis Tools (External)

UE supports external static analyzers, though they require project-level configuration:

**PVS-Studio:**
- Commercial tool with specific UE integration
- Finds subtle bugs, security issues, copy-paste errors
- Configured via Build.cs: `PublicDefinitions.Add("USING_CODE_ANALYSIS");`

**Clang-Tidy:**
- Open-source, many UE-relevant checks
- `.clang-tidy` config at project root
- Useful checks: `bugprone-*`, `performance-*`, `modernize-*`

**UE's -StaticAnalyzer flag:**
- `UBT ... -StaticAnalyzer=PVS-Studio` or `-StaticAnalyzer=Default`
- Runs analysis as part of the build

### 6. Blueprint Checks

Blueprint-specific quality issues detectable at runtime:

**Graph complexity:**
- Functions with >50 nodes (unreadable, unmaintainable)
- Deep inheritance chains (>3 levels of Blueprint inheritance)
- Circular references between Blueprints

**Common anti-patterns:**
- Blueprint-to-Blueprint casting (creates hard references)
- GetAllActorsOfClass in Tick (iterates all world actors per frame)
- Pure functions in loops (executed N*2+1 times per iteration)
- All logic in Event Graph instead of functions

**Reference chain bombs:**
- A single Blueprint cast can transitively load thousands of assets
- Cast to C++ base classes (no hard reference) instead of Blueprints
- Use interfaces (`UINTERFACE`) for cross-system queries
- Use `TSoftObjectPtr` / `TSoftClassPtr` for optional references

### 7. Common Log Categories for Diagnostics

| Category | What It Indicates |
|----------|------------------|
| `LogCompile` | Shader/material compilation issues |
| `LogShaderCompilers` | Shader compiler warnings/errors |
| `LogBlueprint` | Blueprint compilation problems |
| `LogLinker` | Asset loading/linking issues |
| `LogPackageName` | Package resolution problems |
| `LogNet` | Networking warnings |
| `LogPython` | Python script execution errors |
| `LogUObjectGlobals` | Object system warnings (GC, allocation) |
| `LogStreaming` | Asset streaming issues |
| `LogContentValidation` | Content validation results |
| `LogDataValidation` | DataValidation framework output |

## Commandlet-Based Validation

For CI/headless checking, UE provides commandlets:

```bash
# Asset validation commandlet
UnrealEditor <project> -run=DataValidation -TurnOffPakLogging

# Resave and fix redirectors
UnrealEditor <project> -run=ResavePackages -fixupredirects

# Check for corrupted packages
UnrealEditor <project> -run=DiffPackages

# Audit asset sizes
UnrealEditor <project> -run=AssetAuditCommandlet
```

## Performance Budgets (Reference Thresholds)

These are suggested thresholds for flagging issues:

| Metric | Green | Yellow | Red |
|--------|-------|--------|-----|
| Hard dependencies per Blueprint | <10 | 10-20 | >20 |
| Redirectors in /Game | 0 | 1-10 | >10 |
| Validation errors | 0 | — | >0 |
| Validation warnings | <5 | 5-20 | >20 |
| Blueprint inheritance depth | ≤2 | 3 | >3 |
| Shader compiler warnings | 0 | 1-5 | >5 |
