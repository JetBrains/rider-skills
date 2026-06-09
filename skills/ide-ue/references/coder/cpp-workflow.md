# UE C++ Coder

End-to-end workflow for creating and modifying Unreal Engine C++ classes.

## Checklist

1. **Clarify** — ask if ambiguous (multiplayer? GAS? existing base class?)
2. **Pre-flight** — read `.uproject`, `Build.cs`, 1–2 existing files
3. **Write code** — `.h`/`.cpp` following project patterns
4. **Build** — compile via **Builder** reference; fix all errors before proceeding
5. **Save and compile BP** — if a Blueprint child was created: compile, save, confirm zero errors
6. **Verify** — run PIE; check Output Log for warnings
7. **Code review** — after implementation

## Pre-flight

- **Read `.uproject`** — project name, enabled plugins, module list, `EngineAssociation` (e.g. `"5.7"`).
- **Read `Build.cs`** — existing dependencies; add new ones only if needed.
- **Read 1–2 existing files** in the same directory to match include style, naming, macro usage.
- **Check for existing base classes** — don't reinvent what the project provides (Lyra modular bases, etc.).
- **Target.cs `BuildSettingsVersion` / `IncludeOrderVersion`** must match engine version:
  - UE 5.5 → `V5` / `Unreal5_5`; UE 5.6 → `V5` / `Unreal5_6`; UE 5.7+ → `V6` / `Unreal5_7`.

## File placement

| Type | Header | Source |
|------|--------|--------|
| Actor | `Source/<Module>/Public/<Name>.h` | `Source/<Module>/Private/<Name>.cpp` |
| Component | `Source/<Module>/Public/Components/<Name>.h` | `Source/<Module>/Private/Components/<Name>.cpp` |
| Subsystem | `Source/<Module>/Public/Subsystems/<Name>.h` | `Source/<Module>/Private/Subsystems/<Name>.cpp` |
| Plugin module | `Plugins/<Plugin>/Source/<Module>/Public/` | `Plugins/<Plugin>/Source/<Module>/Private/` |

Always check the existing layout first — some projects use flat structures.

## Naming conventions

- Prefixes: `A` = Actor, `U` = UObject/Component, `F` = struct, `E` = enum, `I` = interface
- Files: class name without prefix (`AMyActor` → `MyActor.h`)
- Always include `(BlueprintType)` or appropriate specifiers on `UCLASS` / `USTRUCT` / `UENUM`
- `UPROPERTY`: `EditAnywhere`, `BlueprintReadWrite`, `Category="..."`
- `UFUNCTION`: `BlueprintCallable`, `BlueprintPure`, `BlueprintImplementableEvent`, `BlueprintNativeEvent`

## Module dependencies

```csharp
PublicDependencyModuleNames.AddRange(new string[] { "Core", "CoreUObject", "Engine" });
```
Common additions: `InputCore`, `EnhancedInput`, `UMG`, `Slate`, `SlateCore`, `GameplayAbilities`, `GameplayTags`, `GameplayTasks`, `AIModule`, `NavigationSystem`, `Niagara`, `PhysicsCore`

## Generated headers

```cpp
#include "MyActor.generated.h"  // .h — last include before class declaration
#include "MyActor.h"            // .cpp — first include
```

## C++ guidelines

- **Read before writing** — match existing patterns.
- **Prefer C++ base + Blueprint child** — logic in C++, designer config in BP.
- **NEVER assign visual assets in C++** — no `ConstructorHelpers::FObjectFinder`, no mesh/material assignment. Declare component pointers but leave asset assignment to Blueprint.
- **API macro**: `<MODULE>_API` on every cross-module class.
- **Include order**: generated header last in `.h`, own header first in `.cpp`; forward declare in headers, include in `.cpp`.
- **Use `TObjectPtr<>`** for UPROPERTY object pointers (UE5 convention).
- **Use `#include UE_INLINE_GENERATED_CPP_BY_NAME(<ClassName>)`** in `.cpp` (UE5 faster-compile convention).

## Physics & velocity conventions (UE uses centimeters)

| Parameter | Unit | Notes |
|-----------|------|-------|
| Position | cm | 100 UU = 1 meter |
| Velocity | cm/s | `LaunchCharacter`, `SetVelocity`, `AddImpulse` |
| Default gravity | -980 cm/s² | — |

**To reach a target height H (cm):** `LaunchVelocity.Z = √(2 × 980 × H)`. Example: 3 m (300 cm) → **767 cm/s** (not 300).

| Effect | Velocity | Height/distance |
|--------|----------|-----------------|
| Small hop | 400 cm/s | ~0.8 m |
| Jump pad | 767 cm/s | ~3 m |
| Big launch | 1200 cm/s | ~7.3 m |
| Walking | 600 cm/s | CharacterMovement default |

## UMG / Widget C++ gotchas

- **Rebuild widget with `RebuildWidget()`** for complex widgets; don't use `WidgetTree->ConstructWidget()` in `NativeConstruct()`.
- **`SetRootWidget()` does not exist** — set via `WidgetTree->RootWidget =` at design-time or return from `RebuildWidget()`.
- **`UButton::OnHovered` / `OnUnhovered`** — use `AddDynamic()`. Do NOT use `AddWeakLambda`.
- **WorldSettings GameMode property** — `default_game_mode` (NOT `GameModeOverride`).

## Error recovery

| Error | Fix |
|-------|-----|
| Compile errors | Check include paths, `Build.cs` dependencies |
| Blueprint can't find C++ parent | Build first, verify success, then create BP |
| "Unresolved external symbol" | Missing `<MODULE>_API` or module in `Build.cs` |
| "Cannot find generated.h" | Run build once to generate, or check filename matches class name |

see: `../ue-coder/knowledge/cpp_patterns.md` — Actor with component, delegates, Blueprint events
see: `../ue-coder/knowledge/blueprints.md` — Create Blueprint, set defaults, add component, DataAsset, Widget BP
see: `../ue-coder/knowledge/ue5-cpp-patterns.md` — UE5-specific patterns

---

## MCP tools

| Tool | Purpose | Scenario |
|------|---------|----------|
| `read_file` | Read any source file | Pre-flight: read `.uproject`, `Build.cs`, existing `.h`/`.cpp` before writing anything |
| `list_directory_tree` | Browse project directory tree | Discover the module layout and file-placement conventions |
| `search_symbol` | Find a class, method, or type by name | Locate a base class or check whether a symbol already exists |
| `analyze_calls` | Build call graph — callers or callees | Understand coupling and blast radius before refactoring a method |
| `get_symbol_info` | Declaration + docs for the symbol at a position | Verify a function signature or UPROPERTY specifier |
| `search_text` | Literal substring search across files | Find all uses of a macro, `UPROPERTY` tag, or module name |
| `search_regex` | Regex content search with coordinates | Find patterns like `UPROPERTY\(.*BlueprintReadWrite` |
| `apply_patch` | Apply a unified diff to source | Precise multi-line edits; preferred over free-form edit for structural changes |
| `create_new_file` | Create a new `.h` / `.cpp` | Create the paired header + source; parent directories are auto-created |
| `get_file_problems` | IDE error list for one file | After writing code and before building; catch type errors and missing includes |
| `lint_files` | Batch errors + warnings across files | After a multi-file change — one call instead of N individual checks |
| `build_solution_start` | Compile the solution | After every code change; returns `sessionId` |
| `build_solution_state` | Poll build progress | Loop until `state != "Running"`; require `buildIsSuccess == true` |
| `rename_refactoring` | IDE-aware rename across the whole solution | Rename a class, method, UPROPERTY, or module — updates all references including Blueprint references |
| `xdebug_start_debugger_session` | Start a debug session against the editor | Attach when a crash or assert fires during PIE |
| `xdebug_set_breakpoint` | Set a line breakpoint | Break on a specific `check()`, `ensure()`, or suspect path |
