---
name: ue:ui-cpp
description: "Use when user asks to create C++ UI classes, widget base classes, HUD widgets with C++ bindings, CommonUI C++ setup, MVVM ViewModels, UI manager subsystems, or any UI task requiring C++ implementation. DO NOT TRIGGER for Blueprint-only widget creation (use ue:ui), visual layout in UMG Designer (use ue:ui), material-based UI effects (use ue:material), or non-UI C++ code (use ue:coder)."
context: fork
agent: general-purpose
allowed-tools: Read, Glob, Grep, Bash, Write, Edit
argument-hint: "[UI C++ class or system to create]"
---

See [Reference Image Handling](../_shared/reference-image-handling.md)

## Context7 Version Check

If the query mentions a specific UE version, or involves features known to change across versions, fetch the relevant Context7 section before answering. See `../_shared/context7-protocol.md`.

# UE-UI-CPP Skill: C++ UI Implementation Specialist

## Checklist

Call `TaskCreate` for each item below before starting, then mark each `in_progress` / `completed` as you go:

1. **Clarify** — widget class type, BindWidget targets, MVVM or non-MVVM
2. **Pre-flight** — read existing widget base classes, Build.cs (UMG/Slate modules)
3. **Write code** — create C++ UUserWidget subclass with NativeConstruct, BindWidget vars
4. **Build** — compile via `ue:builder`; fix any C++ errors before proceeding
5. **Save and compile BP** — compile the Blueprint child widget; save BP asset; confirm zero errors
6. **Verify** — test widget in PIE; confirm BindWidget properties resolve and UI renders correctly
7. **Code review** — dispatch `ue:code-review` subagent (see `../_shared/post-task.md`); fix all Critical and Important issues before proceeding

## Workflow (follow in order)

### 0. Clarify (if the request is ambiguous)

Skip this step if the request already specifies the UI framework and hierarchy, or if you can determine the answers from the `.uproject` plugin list.

Ask **one question at a time**, stopping as soon as you have what you need:

- **"Is this project using CommonUI or raw UMG?"** — CommonUI requires `UCommonActivatableWidget` as the base, input routing via `UCommonUIInputData`, and focus-managed widget stacks. Raw UMG uses plain `UUserWidget`. Mixing them causes input routing failures. Check `.uproject` for the `CommonUI` plugin; if it's there, assume CommonUI unless told otherwise.

- **"Is there an existing base widget class I should extend?"** — prevents parallel class hierarchies. Grep for `UUserWidget` or `UCommonActivatableWidget` subclasses before asking.

- **"Does this widget need MVVM (ModelViewViewModel plugin)?"** — MVVM requires `UMVVMViewModelBase` and `UMVVMView` bindings. Significantly different pattern from direct BindWidget. Check for `ModelViewViewModel` in plugins.

**Threshold:** If pre-flight (reading `.uproject` + 1-2 existing widget files) would answer the question, do that instead of asking.

### 1. Pre-flight — Understand the project before writing anything

- **Read `.uproject`** — identify project name, enabled plugins (especially CommonUI, CommonInput, ModelViewViewModel), module list, and `EngineAssociation`.
- **Read `Build.cs`** for the target module — check existing UI dependencies (UMG, Slate, SlateCore, CommonUI, CommonInput, GameplayTags, ModelViewViewModel).
- **Read 1-2 existing UI files** — match the project's established patterns for widget classes, naming, include style.
- **Check for existing base classes** — look for project-specific activatable widget bases, styled buttons, UI manager subsystems before creating new ones.
- **Determine UI framework** — Raw UMG, CommonUI, or MVVM? Check plugin list and existing widget parents.

### 2. Write code

- Create or edit `.h`/`.cpp` files following C++ guidelines and UI patterns below.
- Follow the project's conventions discovered in pre-flight.

### 3. Post-flight — Build and verify

- **Build via ue:builder skill** (or via `/ue:console --build --wait` for Live Coding).
- **Check build result** — if it failed, fix errors and rebuild. Do NOT proceed on failure.
- **Create Widget Blueprint** (if needed) — use `/ue:console` to create WBP from the C++ parent class. Widget Blueprints are where visual layout happens; C++ provides the logic backbone.
- **Run PIE** after task completion (via `/ue:console --play`) unless user says otherwise.

## CRITICAL — Mistakes That Waste Hours

1. **Never construct UUserWidget with NewObject.** Always use `CreateWidget<UMyWidget>(GetWorld(), WidgetClass)`. `NewObject` skips essential widget initialization and causes crashes.

2. **Widget visibility states matter.** `Collapsed` = zero size, removed from layout. `Hidden` = keeps layout space, not rendered. `HitTestInvisible` = rendered, passes input through. `SelfHitTestInvisible` = rendered, children can receive hits. Using wrong state causes input blocking or layout bugs.

3. **Never call AddToViewport every frame.** Check `IsInViewport()` first. Repeated adds duplicate the widget, causing rendering artifacts and memory leaks.

4. **SetInputMode bypasses CommonUI.** When using CommonUI, NEVER call `SetInputMode_UIOnly/GameAndUI`. Override `GetDesiredInputConfig()` on activatable widgets instead. The two systems fight over input state.

5. **Focus navigation requires explicit setup.** Set `IsFocusable = true`, configure `Navigation` rules per direction, call `SetFocus()` on initial widget. Without this, gamepad/keyboard navigation is broken.

6. **BindWidget names must match exactly.** The C++ variable name must equal the widget name in UMG Designer. Type must match. `BindWidget` crashes if missing; use `BindWidgetOptional` and null-check for optional elements.

7. **Never use Property Bindings in production.** They evaluate every frame. Use event-driven delegates, MVVM FieldNotify, or explicit `UpdateUI()` calls.

8. **Never use `->SetText()` / `->SetPercent()` / `->SetBrushFromTexture()` for data that changes during widget lifetime.** Direct widget manipulation scatters update logic, couples C++ to widget internals, and breaks MVVM separation. Use MVVM FieldNotify instead: define a `UMVVMViewModelBase` with `FieldNotify` properties and `UE_MVVM_SET_PROPERTY_VALUE` setters, then bind widgets in the Widget Blueprint's View Bindings panel. **Acceptable exceptions:** `NativeOnListItemObjectSet()` in ListView entries (pooled widgets need explicit data push), one-shot dialogs/tooltips with static data, or quick prototyping (replace with MVVM before shipping). When creating C++ widget base classes, expose data via ViewModel properties — NOT via setter methods that call `->SetText()` on BindWidget pointers.

9. **Don't tick widgets.** Disable tick by default. Use delegates, `OnRep_`, or explicit update calls.

10. **Use virtualized lists for 20+ items.** `UListView`/`UTileView` with `IUserObjectListEntry`, NOT manual spawning into ScrollBox.

11. **CommonUI widgets MUST implement activation callbacks.** Override `NativeGetDesiredFocusTarget()` (returns first focusable element) and `GetDesiredInputConfig()` (returns input mode). Missing these = broken gamepad nav and input soft-locks.

12. **All UObject widget pointers need UPROPERTY().** Raw pointers become dangling after GC. Always mark with `UPROPERTY()` or `UPROPERTY(meta=(BindWidget))`.

13. **Button hover delegates use AddDynamic, not AddWeakLambda.** `UButton::OnHovered`/`OnUnhovered` are simple multicast delegates. For Slate buttons, use `.OnHovered_Lambda()`.

14. **Wrap persistent HUD in SafeZone.** Console TVs have overscan, mobile has notches. Test with `r.DebugSafeZone.Mode 1`.

## C++ UI Architecture Patterns

Choose the right pattern based on what the user needs:

| Need | Pattern | Key Classes |
|------|---------|-------------|
| HUD element (health, ammo, minimap) | MVVM ViewModel + BindWidget layout (preferred) or Event-driven widget with BindWidget (fallback) | `UMVVMViewModelBase` + `UUserWidget` or `UUserWidget` + delegates |
| Menu / dialog / settings | CommonUI activatable widget | `UCommonActivatableWidget` |
| Game UI layer system | Primary Game Layout | `UCommonActivatableWidget` with layer stacks |
| Data-bound list (inventory, shop) | ListView with entry interface | `UListView` + `IUserObjectListEntry` |
| Data-driven UI updates | MVVM ViewModel | `UMVVMViewModelBase` + FieldNotify |
| World-space indicators | Indicator manager | `UControllerComponent` + descriptor |
| UI lifecycle management | UI Manager Subsystem | `UGameInstanceSubsystem` |
| Input-adaptive buttons | Styled CommonUI button | `UCommonButtonBase` + style switching |
| Widget factory (mixed lists) | Data-driven factory | `UMyWidgetFactory` |
| Tag-driven visibility | Tagged widget | `UCommonUserWidget` + `FGameplayTagContainer` |
| Loading screen | Persistent subsystem | `UGameInstanceSubsystem` |
| Settings screen | Dirty state tracking | `UGameSettingScreen` |
| Frontend flow | State component | `UGameStateComponent` |
| Touch input simulation | Simulated input widget | `UCommonUserWidget` + Enhanced Input |

## File Placement

| Type | Header | Source |
|------|--------|--------|
| UserWidget subclass | `Source/<Module>/Public/UI/<Name>.h` | `Source/<Module>/Private/UI/<Name>.cpp` |
| ViewModel | `Source/<Module>/Public/UI/<Name>.h` | `Source/<Module>/Private/UI/<Name>.cpp` |
| UI Subsystem | `Source/<Module>/Public/UI/<Name>.h` | `Source/<Module>/Private/UI/<Name>.cpp` |
| Widget Component | `Source/<Module>/Public/UI/<Name>.h` | `Source/<Module>/Private/UI/<Name>.cpp` |
| List Entry | `Source/<Module>/Public/UI/<Name>.h` | `Source/<Module>/Private/UI/<Name>.cpp` |

**IMPORTANT:** If the project uses a different structure (e.g., flat layout, `Widgets/` folder), follow that instead. Always check existing layout first.

## Module Dependencies

### Minimal (UMG only)
```csharp
PublicDependencyModuleNames.AddRange(new string[] {
    "Core", "CoreUObject", "Engine",
    "UMG", "Slate", "SlateCore"
});
```

### CommonUI
```csharp
PublicDependencyModuleNames.AddRange(new string[] {
    "Core", "CoreUObject", "Engine",
    "UMG", "Slate", "SlateCore",
    "CommonUI", "CommonInput"
});
```

### CommonUI + MVVM
```csharp
PublicDependencyModuleNames.AddRange(new string[] {
    "Core", "CoreUObject", "Engine",
    "UMG", "Slate", "SlateCore",
    "CommonUI", "CommonInput",
    "ModelViewViewModel"
});
```

### Full-Featured (CommonUI + MVVM + Tags + Input)
```csharp
PublicDependencyModuleNames.AddRange(new string[] {
    "Core", "CoreUObject", "Engine",
    "UMG", "Slate", "SlateCore",
    "CommonUI", "CommonInput",
    "GameplayTags",
    "ModelViewViewModel",
    "InputCore"
});
```

## C++ Guidelines

- **Read before writing**: match existing patterns.
- **Prefer C++ base + Blueprint child**: logic in C++, visual layout in Widget Blueprint.
- **API macro**: `<MODULE>_API` on every cross-module class.
- **Include order**: generated header last in `.h`, own header first in `.cpp`.
- **Forward declare** in headers; include in `.cpp`.
- **Use `TObjectPtr<>`** for UPROPERTY object pointers.
- **Use `#include UE_INLINE_GENERATED_CPP_BY_NAME(<ClassName>)`** in `.cpp` files.
- **UPROPERTY specifiers**: `meta=(BindWidget)` for required designer widgets, `meta=(BindWidgetOptional)` for optional ones, `meta=(BindWidgetAnim)` for animations.

## Naming Conventions

- Widget classes: `UMyWidget`, `UMyHUD`, `UMyMenu`
- Widget Blueprints: `WBP_MyWidget`, `WBP_MyHUD`, `WBP_MyMenu`
- ViewModels: `UMyViewModel`
- UI Subsystems: `UMyUIManagerSubsystem`
- List entries: `UMyListEntry`
- Indicator descriptors: `UMyIndicatorDescriptor`

## Knowledge Files

The following knowledge files provide detailed C++ UI patterns:

- `knowledge/cpp-ui-patterns.md` — Production-ready C++ recipes: HUD widgets, CommonUI activatables, MVVM ViewModels, ListViews, indicator systems, UI subsystems, tab lists, dialogs, settings screens, frontend flow
- `knowledge/cpp-ui-pitfalls.md` — Hard-won debugging knowledge: property binding perf, input mode conflicts, focus target crashes, GC widget pointers, WidgetTree timing

## Subagent Delegation Template

When delegating a C++ UI task, provide the subagent with:

```
You are a specialized Unreal Engine C++ UI developer.

TASK: [describe the specific UI task]

CONTEXT:
- Engine version: [UE5.x]
- Framework: [Raw UMG / CommonUI / MVVM]
- Project module: [module name from Build.cs]
- Existing base classes: [any project-specific widget bases found in pre-flight]
- Platform targets: [PC / Console / Mobile / Cross-platform]

REFERENCE these knowledge files before writing code:
- @knowledge/cpp-ui-patterns.md — for C++ widget recipes and patterns
- @knowledge/cpp-ui-pitfalls.md — for common mistakes to avoid

RULES (non-negotiable):
1. Use CreateWidget<>(), never NewObject for UUserWidget
2. Use event-driven updates, never tick-based
3. Use virtualized lists for any list > 20 items
4. Override GetDesiredFocusTarget() and GetDesiredInputConfig() on all CommonUI widgets
5. All widget pointers must have UPROPERTY()
6. Use BindWidget/BindWidgetOptional for designer-bound widgets
7. Follow ue:coder pre-flight/post-flight workflow
8. Match existing project patterns and naming conventions
9. Add module dependencies to Build.cs before writing widget code
10. NEVER use ->SetText()/->SetPercent() for data that changes during widget lifetime. Use MVVM FieldNotify ViewModel instead. Only acceptable in ListView NativeOnListItemObjectSet(), one-shot static dialogs, or quick prototyping.

OUTPUT:
- C++ header and source files
- Build.cs modifications (if needed)
- Widget Blueprint creation script (Python for ue:console)
- Notes on what to add in UMG Designer (BindWidget slots)
```

## When to Delegate Here

TRIGGER this skill when the user asks to:

- Create C++ UUserWidget subclasses with BindWidget bindings
- Build CommonUI activatable widget C++ base classes
- Implement MVVM ViewModels for UI data binding
- Create UI manager subsystems (GameInstanceSubsystem for UI lifecycle)
- Build ListView/TileView with C++ list entry classes
- Create indicator/nameplate systems in C++
- Implement C++ HUD classes with event-driven bindings
- Set up CommonUI Primary Game Layout in C++
- Create styled CommonUI buttons with input-method switching
- Build dialog/messaging subsystems in C++
- Implement settings screens with dirty state tracking
- Create frontend flow components (splash → menu state machine)
- Build widget factories for data-driven widget selection
- Create tag-driven visibility widgets
- Implement touch input simulation widgets

## When NOT to Delegate Here

DO NOT trigger this skill for:

- **Blueprint-only widget creation** — use `ue:ui` for AgentBridge/Python widget tree manipulation, UMG design, CommonUI setup in Blueprints, focus navigation, widget animations, and HUD layout
- **Visual layout in UMG Designer** — this skill creates the C++ backbone; layout is done in Widget Blueprints via `ue:ui`
- **Image/texture generation** — when UI needs icons, backgrounds, or placeholder art, use `generate-image` skill to create them first
- **Material/shader work** — even material-based UI effects belong in `ue:material`
- **Non-UI C++ code** — actors, components, gameplay systems belong in `ue:coder`
- **Slate-only editor extensions** — low-level Slate for editor tooling is out of scope
- **Single property changes** — quick tweaks to existing widget classes don't need this workflow
