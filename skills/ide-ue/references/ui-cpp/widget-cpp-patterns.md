# UE UI C++ — Widget Base Classes, BindWidget, MVVM

## Checklist

1. **Clarify** — widget class type, BindWidget targets, MVVM or non-MVVM
2. **Pre-flight** — read existing widget base classes, Build.cs (UMG/Slate modules), `.uproject` plugins
3. **Write code** — create `UUserWidget` subclass with `NativeConstruct`, BindWidget vars
4. **Build** — compile via **Builder** reference; fix C++ errors before proceeding
5. **Save and compile BP** — compile Widget Blueprint child; save; confirm zero errors
6. **Verify** — test widget in PIE; confirm BindWidget properties resolve and UI renders

## Pre-flight

- **Read `.uproject`** — check for CommonUI, CommonInput, ModelViewViewModel plugins.
- **Read `Build.cs`** — check UMG, Slate, SlateCore, CommonUI, CommonInput, GameplayTags, ModelViewViewModel dependencies.
- **Determine UI framework** — raw UMG, CommonUI, or MVVM? Mixing them causes input routing failures.

## Critical mistakes

1. **Never construct `UUserWidget` with `NewObject`.** Always `CreateWidget<UMyWidget>(GetWorld(), WidgetClass)`.
2. **Widget visibility states matter.** `Collapsed` = zero size removed from layout; `Hidden` = keeps space, not rendered; `HitTestInvisible` = rendered, passes input through; `SelfHitTestInvisible` = rendered, children can receive hits.
3. **Never call `AddToViewport` every frame.** Check `IsInViewport()` first.
4. **`SetInputMode` bypasses CommonUI.** When using CommonUI, override `GetDesiredInputConfig()` on activatable widgets instead.
5. **Focus navigation requires explicit setup.** Set `IsFocusable = true`, configure `Navigation` rules, call `SetFocus()` on initial widget.
6. **`BindWidget` names must match exactly.** The C++ variable name must equal the widget name in UMG Designer. Type must match. `BindWidget` crashes if missing; use `BindWidgetOptional` with null-check for optional elements.
7. **Never use Property Bindings in production.** They evaluate every frame. Use MVVM `FieldNotify` or explicit `UpdateUI()` calls.
8. **MVVM for data that changes during widget lifetime.** Direct `->SetText()` / `->SetPercent()` calls scatter update logic. Define `UMVVMViewModelBase` with `FieldNotify` properties; bind in the Widget Blueprint's View Bindings panel. Exceptions: `NativeOnListItemObjectSet()` in ListView entries, one-shot dialogs, quick prototyping.
9. **Don't tick widgets.** Disable tick; use delegates, `OnRep_`, or explicit update calls.
10. **Use virtualized lists for 20+ items.** `UListView` / `UTileView` with `IUserObjectListEntry`, NOT ScrollBox + manual spawning.
11. **CommonUI widgets MUST implement `NativeGetDesiredFocusTarget()` and `GetDesiredInputConfig()`.** Missing these breaks gamepad nav and causes input soft-locks.
12. **All UObject widget pointers need `UPROPERTY()`.** Raw pointers become dangling after GC.
13. **Button hover delegates use `AddDynamic`, not `AddWeakLambda`.**
14. **Wrap persistent HUD in `SafeZone`.** Test with `r.DebugSafeZone.Mode 1`.

## C++ UI architecture patterns

| Need | Pattern | Key classes |
|------|---------|-------------|
| HUD element | MVVM ViewModel + BindWidget (preferred) | `UMVVMViewModelBase` + `UUserWidget` |
| Menu / dialog | CommonUI activatable widget | `UCommonActivatableWidget` |
| Game UI layer system | Primary Game Layout | `UCommonActivatableWidget` with layer stacks |
| Data-bound list | ListView with entry interface | `UListView` + `IUserObjectListEntry` |
| Data-driven UI updates | MVVM ViewModel | `UMVVMViewModelBase` + FieldNotify |
| World-space indicators | Indicator manager | `UControllerComponent` + descriptor |
| Input-adaptive buttons | Styled CommonUI button | `UCommonButtonBase` + style switching |
| Loading screen | Persistent subsystem | `UGameInstanceSubsystem` |

## Build.cs dependencies for UI

```csharp
PublicDependencyModuleNames.AddRange(new string[] {
    "UMG", "Slate", "SlateCore",
    "CommonUI", "CommonInput",    // if using CommonUI
    "ModelViewViewModel",          // if using MVVM
    "GameplayTags",
});
```

## Knowledge files (in `../ue-ui-cpp/knowledge/`)

| File | Covers |
|------|--------|
| `cpp-ui-patterns.md` | Full C++ UI implementation patterns |
| `cpp-ui-pitfalls.md` | Detailed pitfall explanations and fixes |

---

## MCP tools

| Tool | Purpose | Scenario |
|------|---------|----------|
| `search_symbol` | Find existing widget classes and interfaces | Pre-flight: locate `UCommonActivatableWidget` subclasses, `IUserObjectListEntry` implementors |
| `analyze_calls` | Call graph for a widget method | Understand which layers call `AddToViewport`, `SetInputMode`, or widget lifecycle hooks |
| `get_symbol_info` | Declaration + docs for a symbol at a position | Confirm a `BindWidget` variable name matches exactly the UMG designer widget name |
| `get_file_problems` | IDE diagnostics for a widget file | Catch `BindWidget` name mismatches, missing `UPROPERTY()`, and `UMG` module errors before building |
| `lint_files` | Batch diagnostics across modified widget files | After a multi-widget refactor — covers all changed `.h`/`.cpp` in one call |
| `build_solution_start` | Compile after C++ widget changes | Returns `sessionId`; required before the Widget BP child can pick up the new parent |
| `build_solution_state` | Poll build progress | Loop until `buildIsSuccess == true`; only then open / compile the BP child in the editor |
| `ue_status` | Confirm editor connected; get PIE state | Before launching PIE or running Python widget queries |
| `ue_play` | Start / stop PIE | Verify widget renders correctly in-game, gamepad navigation routes, input mode is correct |
| `ue_execute_python` | Query live widget state at runtime | Read `UCommonActivatableWidget` stack, inspect `IsInViewport`, list active input configs |
| `take_screenshot` | Capture the in-game UI | Visual regression check: capture before/after a layout or style change |
