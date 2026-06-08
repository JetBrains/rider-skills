---
name: ue:coder
description: "Use when user asks to create new C++ classes, actors, components, subsystems, Blueprint assets based on C++ parents, code quality review, naming convention checks, linting, or static analysis on C++ code. DO NOT TRIGGER for one-line property changes in existing files, in-editor automation (use ue:editor), building only (use ue:builder), launching the editor (use ue:console), or asset validation and redirector fixes (use ue:editor)."
allowed-tools: Read, Glob, Grep, Bash, Write, Edit
argument-hint: "[C++ class or Blueprint to create/modify]"
---

See [Reference Image Handling](../_shared/reference-image-handling.md)

## Context7 Version Check

If the query mentions a specific UE version, or involves features known to change across versions, fetch the relevant Context7 section before answering. See `../_shared/context7-protocol.md`.

# UE Coder

End-to-end workflow for creating and modifying Unreal Engine C++ classes and Blueprints. The value of this skill is the **disciplined workflow** — pre-flight checks, pattern matching, and post-flight verification — not just writing code.

## Checklist

Call `TaskCreate` for each item below before starting, then mark each `in_progress` / `completed` as you go:

1. **Clarify** — ask targeted questions if the request is ambiguous (skip if clear)
2. **Pre-flight** — read `.uproject`, `Build.cs`, and 1–2 existing files to match conventions
3. **Write code** — create or modify `.h`/`.cpp` files following project patterns
4. **Build** — compile via `ue:builder`; fix all errors before proceeding
5. **Save and compile BP** — if a Blueprint child was created: compile it, save it, confirm zero errors
6. **Verify** — run PIE; confirm behavior matches intent; check Output Log for warnings
7. **Code review** — dispatch `ue:code-review` subagent (see `../_shared/post-task.md`); fix all Critical and Important issues before proceeding

## Workflow (follow in order)

### 0. Clarify (if the request is ambiguous)

Skip this step if the request is specific enough that answers wouldn't change the class structure or file layout.

Ask **one question at a time**, stopping as soon as you have what you need. Pick the 1–2 most relevant:

- **"Is this for a multiplayer game?"** — affects whether you add `Replicated` properties, `GetLifetimeReplicatedProps`, and authority guards
- **"Should this integrate with GAS (Gameplay Ability System)?"** — affects attribute access patterns, whether to use `UAbilitySystemComponent`, `FGameplayTag` parameters
- **"Is there an existing base class I should extend rather than create from scratch?"** — prevents parallel hierarchies; check after asking

**Threshold:** If you can look at `.uproject` or existing source files to answer the question yourself, do that instead of asking. Only ask when the answer is genuinely unknown and changes the design.

### 1. Pre-flight — Understand the project before writing anything

- **Read `.uproject`** — identify project name, enabled plugins, module list, and **`EngineAssociation`** (e.g., `"5.7"`). Use this to set correct versions in Target.cs files.
- **Read `Build.cs`** for the target module — understand existing dependencies. Add new ones only if needed.
- **Read 1-2 existing files** in the same directory or of the same type — match the project's established patterns (include style, naming, comment style, macro usage).
- **Check for existing base classes** — don't reinvent what the project already provides (e.g., Lyra's Modular base classes, existing trigger/component patterns).
- **If creating new Target.cs files**, set `BuildSettingsVersion` and `IncludeOrderVersion` to match the engine version. UE 5.5 → `V5`/`Unreal5_5`, UE 5.6 → `V5`/`Unreal5_6`, UE 5.7+ → `V6`/`Unreal5_7`. Using stale versions causes build failures.

### 2. Write code

- Create or edit `.h`/`.cpp` files.
- Follow the project's conventions discovered in pre-flight.

### 3. Post-flight — Build and verify

- **ALWAYS build after finishing any coding task.** This is mandatory, not optional. Use `/ue:builder` (the ue:builder skill) to compile. Never skip this step.
- **Check build result** — if it failed, fix errors and rebuild. Do NOT proceed to Blueprint creation or editor launch on failure. Iterate until the build succeeds.
- **Create Blueprint** (if needed) — use `ue:console` to create BP asset from the C++ parent class.
- **Place in level** (if needed) — query level for PlayerStarts/existing actors to determine coordinates. NEVER hardcode spawn positions.
- **Run PIE** after task completion (via `/ue:console --play`) unless user says otherwise. This is the default — always let the user see and interact with the result.

## File Placement

| Type | Header | Source |
|------|--------|--------|
| Actor | `Source/<Module>/Public/<Name>.h` | `Source/<Module>/Private/<Name>.cpp` |
| Component | `Source/<Module>/Public/Components/<Name>.h` | `Source/<Module>/Private/Components/<Name>.cpp` |
| Subsystem | `Source/<Module>/Public/Subsystems/<Name>.h` | `Source/<Module>/Private/Subsystems/<Name>.cpp` |
| Interface | `Source/<Module>/Public/<Name>.h` | `Source/<Module>/Private/<Name>.cpp` |
| Function Library | `Source/<Module>/Public/<Name>.h` | `Source/<Module>/Private/<Name>.cpp` |
| Plugin Module | `Plugins/<Plugin>/Source/<Module>/Public/` | `Plugins/<Plugin>/Source/<Module>/Private/` |

**IMPORTANT:** If the project uses a flat structure (e.g., `Source/Module/Subsystem/*.h` and `*.cpp` together), follow that instead. Always check existing layout first.

## Naming Conventions

- `A` = Actor, `U` = UObject/Component, `F` = struct, `E` = enum, `I` = interface
- Files: match class name without prefix (`AMyActor` → `MyActor.h`)
- Always include `(BlueprintType)` or appropriate specifiers on UCLASS/USTRUCT/UENUM
- UPROPERTY: `EditAnywhere`, `BlueprintReadWrite`, `Category="..."`
- UFUNCTION: `BlueprintCallable`, `BlueprintPure`, `BlueprintImplementableEvent`, `BlueprintNativeEvent`

## Module Dependencies

When including types from other modules, add to `Build.cs`:
```csharp
PublicDependencyModuleNames.AddRange(new string[] { "Core", "CoreUObject", "Engine" });
```
Common: `InputCore`, `EnhancedInput`, `UMG`, `Slate`, `SlateCore`, `GameplayAbilities`, `GameplayTags`, `GameplayTasks`, `AIModule`, `NavigationSystem`, `Niagara`, `PhysicsCore`

## Generated Headers

```cpp
#include "MyActor.generated.h"  // in .h — last include before class declaration
#include "MyActor.h"            // in .cpp — first include
```

## C++ Guidelines

- **Read before writing**: match existing patterns.
- **Prefer C++ base + Blueprint child**: logic in C++, designer config in BP.
- **NEVER add visual setup in C++** — no meshes, materials, particles, `ConstructorHelpers::FObjectFinder`, or `CreateDefaultSubobject<UStaticMeshComponent>` with assigned assets. You MAY declare component pointers (e.g., `UStaticMeshComponent*`) and create subobjects, but do NOT assign any mesh, material, or visual asset in C++. All visual/presentation configuration belongs in Blueprints. C++ is for logic only. The only exception is if the user explicitly requests visuals in C++.
- **API macro**: `<MODULE>_API` on every cross-module class.
- **Include order**: generated header last in `.h`, own header first in `.cpp`.
- **Forward declare** in headers; include in `.cpp`.
- **Use `TObjectPtr<>`** for UPROPERTY object pointers (UE5 convention).
- **Use `#include UE_INLINE_GENERATED_CPP_BY_NAME(<ClassName>)`** in `.cpp` files (UE5 convention for faster compile).

## UE Physics & Velocity Conventions

UE uses **centimeters** as the base unit. All physics values are in cm-based units:

| Parameter | Unit | Notes |
|-----------|------|-------|
| Position | cm | 100 UU = 1 meter |
| Velocity | cm/s | LaunchCharacter, SetVelocity, AddImpulse |
| Acceleration | cm/s² | Default gravity = -980 cm/s² |
| Force | kg·cm/s² | Mass × acceleration |
| Impulse | kg·cm/s | Instant velocity change |

**Critical: Don't confuse distance with velocity.** To launch a character to a specific height:
- `LaunchVelocity.Z = √(2 × Gravity × DesiredHeight)`
- Example: 3m (300cm) height → Z = √(2 × 980 × 300) ≈ **767 cm/s** (NOT 300)
- A velocity of 300 cm/s only reaches ~46cm height

**Common velocity reference values:**
| Effect | Velocity (cm/s) | Height/Distance |
|--------|-----------------|-----------------|
| Small hop | 400 | ~0.8m height |
| Jump pad | 767 | ~3m height |
| Big launch | 1200 | ~7.3m height |
| Walking speed | 600 | (CharacterMovementComponent default) |
| Sprint speed | 1200 | (typical) |

**Always validate physics values by calculation**, not by assuming N cm = N cm/s. When a task says "launch 3 meters", compute the required velocity, don't use 300 as the value.

## UMG / Widget C++ Guidelines

- **For complex widgets (menus, HUDs) built in C++**, override `RebuildWidget()` and use Slate (`SNew`, `SOverlay`, `SVerticalBox`, `SButton`, `STextBlock`, etc.). Do NOT use `WidgetTree->ConstructWidget()` in `NativeConstruct()` — the WidgetTree is sealed at runtime and will fail silently.
- **`SetRootWidget()` does not exist** on UUserWidget. Set the root via `WidgetTree->RootWidget =` at design-time, or return your root from `RebuildWidget()`.
- **Button hover delegates**: `UButton::OnHovered` / `OnUnhovered` are simple multicast delegates — use `AddDynamic()` with UFUNCTION methods. Do NOT use `AddWeakLambda` (not available). For Slate buttons, use `.OnHovered_Lambda()` / `.OnUnhovered_Lambda()`.
- **WorldSettings property**: The GameMode property is `default_game_mode` (NOT `GameModeOverride`).

## Error Recovery

- **Compile errors**: Check include paths, verify `Build.cs` dependencies.
- **Blueprint can't find C++ parent**: Module not compiled yet. Build first, verify success, then create BP.
- **"Unresolved external symbol"**: Missing `<MODULE>_API` export macro or missing module in `Build.cs`.
- **"Cannot find generated.h"**: Run build once to generate, or check file naming matches class name.
- **Build failed with pre-existing errors**: Distinguish your errors from pre-existing ones. Fix yours, report pre-existing to user.

see: knowledge/cpp_patterns.md — Actor with component, delegates, Blueprint events, compile + create BP workflow
see: knowledge/blueprints.md — Create Blueprint, set defaults, add component, DataAsset, Widget BP
