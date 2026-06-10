# UE UI Pitfalls — Hard-Won Debugging Knowledge

## Pitfall 1: Property Bindings Kill Performance

**Symptom**: Frame rate drops proportional to number of UI elements. UI-heavy scenes drop to 30fps+ loss.

**Cause**: Property Bindings (set in UMG Designer's Bind dropdown) evaluate **every single frame**, even when the bound value hasn't changed. With 50 text blocks bound to properties, that's 50 function calls per frame doing nothing useful.

**Fix**: Remove all Property Bindings. Use one of (in order of preference):
1. **FieldNotify MVVM (Best)**: Define a ViewModel with `FieldNotify` properties, bind in Widget Blueprint's View Bindings panel. `UE_MVVM_SET_PROPERTY_VALUE(Health, NewValue)` auto-notifies only on change. No `->SetText()` calls needed.
2. **Delegates**: `OnHealthChanged.AddDynamic(this, &HandleHealthChanged)` — fires only when value changes. Widget update logic in handler.
3. **Manual setter with guard**: Compare before setting to avoid redundant invalidation. Fragile — every code path must remember to call it.

**How to detect**: `Stat Slate` console command shows per-widget tick cost. Widget Reflector highlights polling widgets.

---

## Pitfall 2: SetInputMode Breaks CommonUI

**Symptom**: After calling `SetInputMode_UIOnly()`, CommonUI widgets stop responding to input. Or game input bleeds through menus.

**Cause**: `APlayerController::SetInputMode()` bypasses CommonUI's `UCommonUIActionRouter`, which manages input distribution across UI layers. The two systems fight over input state.

**Fix**: Never call `SetInputMode()` when using CommonUI. Instead, override `GetDesiredInputConfig()` on your `UCommonActivatableWidget`:
```cpp
TOptional<FUIInputConfig> GetDesiredInputConfig() const override
{
    return FUIInputConfig(ECommonInputMode::Menu, EMouseCaptureMode::NoCapture);
}
```
CommonUI automatically switches input mode when widgets activate/deactivate.

---

## Pitfall 3: Missing GetDesiredFocusTarget Breaks Gamepad

**Symptom**: Gamepad/keyboard navigation doesn't work in menus. D-pad and Tab key do nothing. No errors in log.

**Cause**: `UCommonActivatableWidget::NativeGetDesiredFocusTarget()` returns nullptr by default. CommonUI needs this to know which widget gets initial focus when the panel is activated.

**Fix**: Override in every activatable widget:
```cpp
UWidget* NativeGetDesiredFocusTarget() const override
{
    // Return the first button or focusable element
    return FirstMenuButton;
}
```

---

## Pitfall 4: Missing GetDesiredInputConfig Soft-Locks

**Symptom**: After closing the last UI panel, player cannot move or interact. Game appears frozen but isn't — just input is stuck.

**Cause**: Without `GetDesiredInputConfig()`, CommonUI cannot restore proper input state when the last widget deactivates. Input remains in UI mode with no UI to receive it.

**Fix**: Every activatable widget must override `GetDesiredInputConfig()` (see Pitfall 2 fix). Additionally, ensure the Game layer's input config returns `ECommonInputMode::Game`.

---

## Pitfall 5: UPROPERTY Missing on Widget Pointers

**Symptom**: Intermittent crashes when accessing widget pointers. Works initially, crashes after 30-120 seconds. Or: `Access violation` in `NativeConstruct`.

**Cause**: UMG widgets are UObjects managed by garbage collector. A raw `UTextBlock*` pointer becomes dangling when GC collects the widget. The `UPROPERTY()` macro prevents GC from collecting referenced objects.

**Fix**:
```cpp
// WRONG — will dangle after GC:
UTextBlock* MyText;

// CORRECT — GC-safe:
UPROPERTY(meta=(BindWidget))
UTextBlock* MyText;

// Also CORRECT for code-created widgets:
UPROPERTY()
UTextBlock* MyText;
```

---

## Pitfall 6: RemoveFromParent Doesn't Destroy Widget

**Symptom**: `GetAllWidgetsOfClass()` returns widgets that were "removed". Callbacks from removed widgets still fire. Memory grows over time.

**Cause**: `RemoveFromParent()` / `RemoveFromViewport()` only removes the widget from the widget tree. The UObject persists until garbage collected. If something still references it (delegate, UPROPERTY, array), it's never GC'd.

**Fix**: After removing, nullify all references:
```cpp
MyWidget->RemoveFromParent();
MyWidget->OnSomeEvent.RemoveAll(this);
MyWidget = nullptr;  // Allow GC
```

For CommonUI, prefer `DeactivateWidget()` which properly handles the lifecycle.

---

## Pitfall 7: BindWidget Name Mismatch

**Symptom**: Editor crashes on widget construction with `check()` failure. Or: widget is always nullptr despite existing in Blueprint.

**Cause**: `meta=(BindWidget)` requires the C++ property name to **exactly match** the widget name in the Blueprint Designer. Case-sensitive. If the Blueprint widget is named `txt_Health` but C++ has `HealthText`, the binding fails.

**Fix**: Ensure names match exactly:
```cpp
// C++ property name must match Blueprint widget name
UPROPERTY(meta=(BindWidget))
UTextBlock* txt_Health;  // Must match exactly in Blueprint
```

Or rename the Blueprint widget to match C++. Using `BindWidgetOptional` avoids the crash but the widget will be nullptr.

---

## Pitfall 8: Widget Animation Not Found

**Symptom**: `PlayAnimation()` crashes or does nothing. Animation pointer is nullptr.

**Cause**: `meta=(BindWidgetAnim)` requires:
1. The animation exists in the Widget Blueprint
2. The C++ property name matches the animation name
3. The UPROPERTY has the `Transient` specifier

**Fix**:
```cpp
UPROPERTY(meta=(BindWidgetAnim), Transient)
UWidgetAnimation* FadeIn;  // Must match animation name in Blueprint
```

---

## Pitfall 9: ListView Entry Not Updating

**Symptom**: ListView shows entries but data is stale or empty. Scrolling shows wrong data.

**Cause**: ListView reuses entry widgets (object pooling). If you set data in `NativeConstruct()`, it runs once. You must use `NativeOnListItemObjectSet()` which fires each time the entry is recycled with new data.

**Fix**: Implement `IUserObjectListEntry`:
```cpp
class UMyEntry : public UUserWidget, public IUserObjectListEntry
{
    virtual void NativeOnListItemObjectSet(UObject* ListItemObject) override
    {
        // THIS is where you set data — NOT NativeConstruct
        if (auto* Data = Cast<UMyData>(ListItemObject))
        {
            NameText->SetText(Data->Name);
        }
    }
};
```

---

## Pitfall 10: Widget Component Memory Explosion

**Symptom**: VRAM usage skyrockets with many actors using Widget Components. GPU memory warning. Frame drops.

**Cause**: Each `UWidgetComponent` renders to its own render target texture. 100 actors with health bars = 100 render targets, each consuming GPU memory.

**Fix**:
- For HUD indicators (health bars, nameplates): use an indicator layer system (single overlay widget that positions 2D elements over 3D world positions)
- For truly in-world interactive UI: use Widget Components but keep count low (<20)
- Set `DrawSize` as small as practical to reduce render target resolution

---

## Pitfall 11: DPI Scaling Breaks Layout

**Symptom**: UI looks different at different screen resolutions. Widgets overlap or have gaps at 4K. Pixel-perfect at 1080p, broken elsewhere.

**Cause**: Hardcoded pixel sizes don't account for DPI scaling. UMG applies DPI scaling based on platform and resolution.

**Fix**:
- Use anchors and relative sizing instead of absolute pixel positions
- Use `SizeBox` with `WidthOverride`/`HeightOverride` for fixed-size elements
- Test at multiple resolutions (1080p, 1440p, 4K)
- Project Settings → User Interface → DPI Scaling Rule: set to "Shortest Side" for most games

---

## Pitfall 12: Slate.InvalidationDebugging Shows Constant Rebuilds

**Symptom**: UI performance is poor despite using invalidation. `Slate.InvalidationDebugging 1` shows widgets constantly rebuilding.

**Cause**: Something is calling `Invalidate()` or `InvalidateLayoutAndVolatility()` every frame. Common sources:
- A Volatile widget in the hierarchy forces children to rebuild
- A binding that changes every frame (even slightly different float values)
- `SetVisibility()` called with same value repeatedly

**Fix**:
- Only call invalidation when the value actually changes (compare before setting)
- Minimize `Volatile` widgets — only use for genuinely per-frame animated elements
- Cache values and skip updates when unchanged:
  ```cpp
  void SetHealthPercent(float NewPercent)
  {
      if (!FMath::IsNearlyEqual(CachedPercent, NewPercent))
      {
          CachedPercent = NewPercent;
          HealthBar->SetPercent(NewPercent);
      }
  }
  ```

---

## Pitfall 13: Focus Navigation Loops or Skips Widgets

**Symptom**: Pressing Tab or D-pad skips certain buttons. Or focus cycles between two widgets, never reaching others.

**Cause**: Navigation rules on widgets conflict. Default navigation follows visual hierarchy but can be overridden per-widget. Invisible or collapsed widgets may still be in the focus chain.

**Fix**:
- Check `Is Focusable` property on all interactive widgets
- Collapsed widgets are removed from navigation; Hidden ones are not
- Use explicit navigation overrides for complex layouts:
  ```cpp
  Button1->SetNavigationRuleExplicit(EUINavigation::Right, Button2);
  ```
- Use Widget Reflector to visualize the focus chain

---

## Pitfall 14: create_asset() Freezes Editor (Widget Blueprints)

**Symptom**: Editor hangs after Python script runs. Must force-kill.

**Cause**: `create_asset()` on an existing asset path opens a modal "Override?" dialog that cannot be dismissed from Python.

**Fix**: Always check existence first:
```python
path = "/Game/UI/WBP_MyWidget"
if unreal.EditorAssetLibrary.does_asset_exist(path):
    widget = unreal.EditorAssetLibrary.load_asset(path)
else:
    widget = unreal.AssetToolsHelpers.get_asset_tools().create_asset(
        "WBP_MyWidget", "/Game/UI",
        unreal.WidgetBlueprint, unreal.WidgetBlueprintFactory()
    )
if widget is None:
    print("ERROR: Failed to create/load widget")
    return
```

---

## Pitfall 15: CommonUI Action Router Not Working

**Symptom**: CommonUI input routing doesn't activate. Widgets don't receive input events. No error messages.

**Cause**: CommonUI requires specific project setup that's easy to miss:
1. CommonUI plugin not enabled
2. `CommonInputSettings` not configured in Project Settings
3. Enhanced Input integration not enabled (`bEnableEnhancedInputSupport`)
4. Game viewport client not set to CommonUI's

**Fix checklist**:
1. Enable "Common UI" plugin
2. Project Settings → Common Input Settings → Enable Enhanced Input Support = true
3. Verify `.uproject` has CommonUI in plugins list
4. Add `"CommonUI"`, `"CommonInput"` to Build.cs
5. Verify `UCommonUIActionRouter` is registered (check with debugger)

---

## Pitfall 16: Text Localization Broken

**Symptom**: Text displays correctly in development but shows raw keys or empty strings in localized builds.

**Cause**: Using `FString` or `FText::FromString()` for player-visible text. These bypass the localization system.

**Fix**: Use localization macros:
```cpp
// In .cpp files:
#define LOCTEXT_NAMESPACE "MyWidget"
FText Label = LOCTEXT("HealthLabel", "Health");
#undef LOCTEXT_NAMESPACE

// In headers:
FText Label = NSLOCTEXT("MyWidget", "HealthLabel", "Health");

// For dynamic formatted text:
FText Formatted = FText::Format(LOCTEXT("HealthFmt", "{0} / {1}"),
    FText::AsNumber(CurrentHealth), FText::AsNumber(MaxHealth));
```

---

## Pitfall 17: Widget Blueprint Hot Reload Corruption

**Symptom**: After hot reload, widget shows stale layout or crashes. Blueprint graph is corrupted.

**Cause**: Hot reloading C++ base classes of Widget Blueprints can corrupt the Blueprint asset, especially if struct layouts or UPROPERTY metadata changed.

**Fix**:
- Close Widget Blueprint editors before hot reload
- If corruption occurs: close editor, delete `Intermediate/` and `DerivedDataCache/`, recompile
- For production: prefer full editor restart over hot reload for UI base class changes
- Use `Live Coding` (Ctrl+Alt+F11) instead of hot reload — more reliable for UMG

---

## Pitfall 18: Controller Disconnect Screen Re-Entrant Activation

**Symptom**: Showing a controller disconnect screen causes crash or assertion failure in CommonUI activation stack. Or: disconnect screen appears multiple times stacked.

**Cause**: `IPlatformInputDeviceMapper` delegates fire synchronously during input processing. Pushing a widget to a CommonUI stack during this callback can cause re-entrant activation, corrupting the widget stack state.

**Fix**: Defer disconnect screen activation to the next tick:
```cpp
// WRONG — direct push in delegate callback:
void HandleDeviceDisconnected(...)
{
    Layout->PushWidgetToLayer(TAG_UI_LAYER_MENU, DisconnectScreenClass); // CRASH
}

// CORRECT — defer to next tick:
void HandleDeviceDisconnected(...)
{
    bNeedsDisconnectScreen = true;
    FTSTicker::GetCoreTicker().AddTicker(
        FTickerDelegate::CreateWeakLambda(this, [this](float) -> bool
        {
            if (bNeedsDisconnectScreen)
            {
                Layout->PushWidgetToLayer(TAG_UI_LAYER_MENU, DisconnectScreenClass);
                bNeedsDisconnectScreen = false;
            }
            return false; // One-shot ticker
        }), 0.0f);
}
```

Also track whether the disconnect screen is already showing to prevent duplicates.

---

## Pitfall 19: Tab Hidden State Not Updating

**Symptom**: Calling `SetTabHiddenState(false)` to show a previously hidden tab doesn't make it appear. Or: tab appears but in wrong order.

**Cause**: Tab registration order determines visual order. Removing then re-adding a tab places it at the end, not its original position. Also, the tab content switcher may still reference the old index.

**Fix**: Either:
1. Register all tabs upfront (even hidden ones) and control visibility on the button widget instead of removing/adding
2. Re-register all tabs in correct order when changing hidden state
3. Use a descriptor array to maintain intended order and rebuild the tab list

---

## Pitfall 20: Simulated Input Widget Key Mapping Stale After Rebind

**Symptom**: Virtual joystick or touch buttons stop working after player rebinds keys in settings.

**Cause**: Simulated input widgets cache the physical key that maps to their Enhanced Input Action. When the player remaps controls, the cached key is stale. The widget sends the old key, which is no longer bound to the expected action.

**Fix**: Listen to `UEnhancedInputLocalPlayerSubsystem::ControlMappingsRebuiltDelegate` and re-query the key mapping:
```cpp
void UMySimulatedInputWidget::NativeConstruct()
{
    Super::NativeConstruct();
    if (auto* EIS = GetEnhancedInputSubsystem())
    {
        EIS->ControlMappingsRebuiltDelegate.AddDynamic(
            this, &UMySimulatedInputWidget::OnControlMappingsRebuilt);
    }
    RefreshKeyMapping();
}

void UMySimulatedInputWidget::OnControlMappingsRebuilt()
{
    RefreshKeyMapping(); // Re-query which key maps to our InputAction
}
```

---

## Pitfall 21: Activatable Widget Missing Editor Validation

**Symptom**: Gamepad navigation doesn't work in shipped build, but nobody noticed during development because mouse/keyboard works fine.

**Cause**: `BP_GetDesiredFocusTarget` and `GetDesiredInputConfig` are easy to forget on new widgets. Without them, gamepad silently fails — no error in log.

**Fix**: Add compile-time validation in your activatable widget base class:
```cpp
#if WITH_EDITOR
virtual void ValidateCompiledWidgetTree(const UWidgetTree& BlueprintWidgetTree,
    class IWidgetCompilerLog& CompileLog) const override
{
    Super::ValidateCompiledWidgetTree(BlueprintWidgetTree, CompileLog);
    if (!GetClass()->IsFunctionImplementedInScript(
        GET_FUNCTION_NAME_CHECKED(UCommonActivatableWidget, BP_GetDesiredFocusTarget)))
    {
        CompileLog.Warning(FText::FromString(
            TEXT("GetDesiredFocusTarget not implemented — gamepad nav will be broken.")));
    }
}
#endif
```

This surfaces the issue as a Blueprint compiler warning visible to all designers.

---

## Pitfall 22: Frontend Flow Race Condition with Async Widget Loading

**Symptom**: Main menu occasionally shows blank screen on startup. Or: press-start screen never appears.

**Cause**: Using `TSoftClassPtr` for frontend widgets (good practice for memory) means the widget class loads asynchronously. If you try to push the widget before the async load completes, the push silently fails.

**Fix**: Use `UCommonUIExtensions::PushStreamedContentToLayer_ForPlayer` which handles async loading internally:
```cpp
// WRONG — may fail if class not yet loaded:
TSoftClassPtr<UCommonActivatableWidget> MainMenuClass;
// ...
Layout->PushWidgetToLayer(TAG_UI_LAYER_MENU, MainMenuClass.Get()); // nullptr if not loaded!

// CORRECT — PushStreamedContent handles async load:
UCommonUIExtensions::PushStreamedContentToLayer_ForPlayer(
    LocalPlayer, TAG_UI_LAYER_MENU, MainMenuClass);
```

---

## Pitfall 23: Widget Factory Returns Wrong Widget on ListView Scroll

**Symptom**: ListView with mixed item types (e.g., headers and regular items) shows wrong widget after scrolling — a header row displays as a regular item.

**Cause**: ListView pools entry widgets by class. If your widget factory returns different widget classes for different data types but the pool recycles a widget of the wrong type, the `NativeOnListItemObjectSet` receives a widget that doesn't match the data.

**Fix**: Ensure widget factory rules are deterministic and cover all data types. Use `OnGenerateEntryWidgetInternal` override to force correct class selection before pool lookup. Test thoroughly with rapid scrolling.
