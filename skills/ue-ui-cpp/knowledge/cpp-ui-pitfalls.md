# C++ UI Pitfalls — Hard-Won Debugging Knowledge

## Pitfall 1: Property Bindings Kill Performance

**Symptom**: Frame rate drops proportional to number of UI elements.

**Cause**: Property Bindings (UMG Designer's Bind dropdown) evaluate every frame, even when values haven't changed. 50 bindings = 50 function calls per frame doing nothing.

**Fix**: Remove all Property Bindings. Use:
- **Delegates**: `OnHealthChanged.AddDynamic(this, &HandleHealthChanged)`
- **FieldNotify (MVVM)**: `UE_MVVM_SET_PROPERTY_VALUE(Health, NewValue)`
- **Manual invalidation**: Explicit setter that updates widget

**Detection**: `Stat Slate` console command. Widget Reflector highlights polling widgets.

---

## Pitfall 2: SetInputMode Breaks CommonUI

**Symptom**: After `SetInputMode_UIOnly()`, CommonUI widgets stop responding. Or game input bleeds through menus.

**Cause**: `APlayerController::SetInputMode()` bypasses CommonUI's `UCommonUIActionRouter`. The two systems fight.

**Fix**: Never call `SetInputMode()` with CommonUI. Override `GetDesiredInputConfig()`:
```cpp
TOptional<FUIInputConfig> GetDesiredInputConfig() const override
{
    return FUIInputConfig(ECommonInputMode::Menu, EMouseCaptureMode::NoCapture);
}
```

---

## Pitfall 3: Missing GetDesiredFocusTarget Breaks Gamepad

**Symptom**: Gamepad/keyboard navigation doesn't work. D-pad does nothing. No errors in log.

**Cause**: `NativeGetDesiredFocusTarget()` returns nullptr by default. CommonUI needs this to know which widget gets initial focus.

**Fix**: Override in every activatable widget:
```cpp
UWidget* NativeGetDesiredFocusTarget() const override
{
    return FirstMenuButton;
}
```

---

## Pitfall 4: Missing GetDesiredInputConfig Soft-Locks

**Symptom**: After closing last UI panel, player cannot move. Game appears frozen.

**Cause**: Without `GetDesiredInputConfig()`, CommonUI cannot restore input state when last widget deactivates.

**Fix**: Every activatable widget must override `GetDesiredInputConfig()`. Game layer's config should return `ECommonInputMode::Game`.

---

## Pitfall 5: UPROPERTY Missing on Widget Pointers

**Symptom**: Intermittent crashes after 30-120 seconds when accessing widget pointers.

**Cause**: UMG widgets are UObjects. Raw pointer becomes dangling after GC.

**Fix**:
```cpp
// WRONG:
UTextBlock* MyText;

// CORRECT:
UPROPERTY(meta=(BindWidget))
UTextBlock* MyText;

// Also CORRECT for code-created:
UPROPERTY()
UTextBlock* MyText;
```

---

## Pitfall 6: NewObject for UserWidget

**Symptom**: Crash in `AddToViewport()` or `NativeConstruct()`. Or widget appears but doesn't respond to input.

**Cause**: `NewObject<UUserWidget>()` skips widget initialization (`Initialize()`, `SetOwningPlayer()`, widget tree construction).

**Fix**: Always use `CreateWidget<>()`:
```cpp
// WRONG:
UMyWidget* Widget = NewObject<UMyWidget>(this);

// CORRECT:
UMyWidget* Widget = CreateWidget<UMyWidget>(GetOwningPlayer(), UMyWidget::StaticClass());
```

---

## Pitfall 7: AddToViewport Called Repeatedly

**Symptom**: Widget duplicated on screen. Memory usage grows. Rendering artifacts.

**Cause**: `AddToViewport()` doesn't check if already added. Each call adds another entry.

**Fix**:
```cpp
if (!MyWidget->IsInViewport())
{
    MyWidget->AddToViewport();
}
```

---

## Pitfall 8: BindWidget Name Mismatch

**Symptom**: Widget Blueprint fails to compile with "Widget binding not found" error. Or: crash at runtime.

**Cause**: C++ variable name doesn't match widget name in UMG Designer. Must be exact match, case-sensitive.

**Fix**: Ensure exact name match:
```cpp
// C++ variable name "HealthText" must match widget named "HealthText" in designer
UPROPERTY(meta=(BindWidget))
UTextBlock* HealthText;
```

Use `BindWidgetOptional` for widgets that may not exist in all Widget Blueprint variants.

---

## Pitfall 9: Delegate Not Unbound in NativeDestruct

**Symptom**: Crash when source object fires delegate after widget is destroyed. Intermittent, depends on destruction order.

**Cause**: Widget subscribes to delegate in `NativeConstruct` but doesn't unsubscribe in `NativeDestruct`. Source object holds stale reference.

**Fix**: Always unbind in NativeDestruct:
```cpp
void UMyWidget::NativeDestruct()
{
    if (AMyPlayerState* PS = GetOwningPlayerState<AMyPlayerState>())
    {
        PS->OnHealthChanged.RemoveDynamic(this, &UMyWidget::HandleHealthChanged);
    }
    Super::NativeDestruct();
}
```

---

## Pitfall 10: Anchor/Alignment Mismatch at Different Resolutions

**Symptom**: UI looks correct at 1920x1080 but breaks at 1280x720 or ultrawide.

**Cause**: Widget anchored to one corner but positioned with absolute coordinates from a different reference point.

**Fix**: Use anchor presets consistently. Test at multiple resolutions: 1280x720, 1920x1080, 2560x1440, 3440x1440.

---

## Pitfall 11: WidgetTree Is Sealed at Runtime

**Symptom**: `WidgetTree->ConstructWidget()` in `NativeConstruct()` silently fails. Widgets don't appear.

**Cause**: WidgetTree construction only works at design-time (editor widget creation), not runtime.

**Fix**: Design widget hierarchy in UMG Designer (Blueprint), bind from C++ with `BindWidget`. For programmatic construction, use AgentBridge Python APIs at design-time, or `RebuildWidget()` with Slate for custom widget components.

---

## Pitfall 12: CommonUI Widget Not Participating in Stack

**Symptom**: Widget appears but `OnActivated`/`OnDeactivated` are never called. Back navigation doesn't work.

**Cause**: Widget doesn't derive from `UCommonActivatableWidget`, or is added to viewport directly instead of pushed onto a `UCommonActivatableWidgetContainerStack`.

**Fix**: Ensure widget derives from `UCommonActivatableWidget` and is pushed via `Stack->AddWidget<>()` or `PushWidgetToLayer()`, not `AddToViewport()`.

---

## Pitfall 13: ScrollBox with Hundreds of Children

**Symptom**: UI hitches every frame when scrolling. CPU spike in widget layout.

**Cause**: ScrollBox creates and keeps all child widgets alive. 500 children = 500 layout calculations per frame.

**Fix**: Use `UListView` or `UTileView` which virtualize entries (only visible items have widgets). Implement `IUserObjectListEntry` on the entry widget class.

---

## Pitfall 14: Using SetText/SetPercent Instead of Data Binding

**Symptom**: Widget update logic scattered across C++ — every place that changes game data must also call `MyText->SetText()`. Missed call sites cause stale UI. Code is tightly coupled to specific widget pointers.

**Cause**: Directly calling `->SetText()`, `->SetPercent()`, `->SetBrushFromTexture()` etc. from C++ event handlers couples game logic to widget internals. This approach:
- Forces C++ to know about specific widget types and names
- Requires explicit update calls from every code path that modifies data
- Breaks MVVM separation — the View layer leaks into the Model/Controller
- Cannot be rebound to different widgets without code changes
- Causes redundant Slate invalidation when called without value comparison guards

**Fix**: Use the MVVM FieldNotify system instead. Define a ViewModel with `FieldNotify` properties and bind widgets to them in the Widget Blueprint editor (View Bindings panel):

```cpp
// WRONG — direct widget manipulation in C++:
void UMyHUD::HandleHealthChanged(float Current, float Max)
{
    HealthText->SetText(FText::AsNumber(FMath::RoundToInt(Current)));
    HealthBar->SetPercent(Current / Max);
}

// CORRECT — ViewModel with FieldNotify (no widget references in C++):
// ViewModel:
UPROPERTY(BlueprintReadOnly, FieldNotify, Getter, meta=(AllowPrivateAccess=true))
float CurrentHealth = 0.f;

void SetCurrentHealth(float NewValue)
{
    if (UE_MVVM_SET_PROPERTY_VALUE(CurrentHealth, NewValue))
    {
        UE_MVVM_BROADCAST_FIELD_VALUE_CHANGED(GetHealthPercent);
    }
}

// Widget Blueprint binds Text.Text → ViewModel.CurrentHealth (with float→text conversion)
// Widget Blueprint binds ProgressBar.Percent → ViewModel.GetHealthPercent()
// No C++ widget pointer references needed!
```

**When direct SetText is still acceptable:**
- `NativeOnListItemObjectSet()` in ListView entries (pooled widgets need explicit data push)
- One-shot dialogs/tooltips that display static data and are immediately discarded
- Quick prototyping (replace with MVVM before shipping)

**Key rule:** If a widget displays data that can change during its lifetime, use MVVM FieldNotify bindings. Reserve `->SetText()` for one-time initialization of static display widgets.
