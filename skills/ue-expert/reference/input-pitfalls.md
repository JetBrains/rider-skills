# Enhanced Input System — Pitfalls & Debugging

Hard-won debugging knowledge. Each entry includes the symptom, cause, and fix.

---

## Pitfall 1: IMC Added in Pawn BeginPlay — Input Never Fires

**Symptom:** Input bindings exist, no errors, no crashes, but callbacks never fire.

**Cause:** `AddMappingContext()` in a Pawn's `BeginPlay()` fails silently because `GetEnhancedInputLocalPlayerSubsystem()` requires the Pawn to be possessed by a PlayerController. During `BeginPlay()`, the Pawn may not yet be possessed.

**Fix:** Add IMC in `PossessedBy()` (C++) or `OnPossessed` event (Blueprint). PlayerControllers CAN safely use `BeginPlay()` since they exist before possession.

```cpp
// WRONG — fails silently in Pawn
void AMyPawn::BeginPlay()
{
    Super::BeginPlay();
    // Subsystem may be nullptr here!
    Subsystem->AddMappingContext(IMC, 0);
}

// CORRECT — Pawn
void AMyPawn::PossessedBy(AController* NewController)
{
    Super::PossessedBy(NewController);
    if (APlayerController* PC = Cast<APlayerController>(NewController))
    {
        auto* Subsystem = ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(
            PC->GetLocalPlayer());
        Subsystem->AddMappingContext(IMC, 0);
    }
}

// CORRECT — PlayerController (BeginPlay is safe here)
void AMyPC::BeginPlay()
{
    Super::BeginPlay();
    auto* Subsystem = ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(
        GetLocalPlayer());
    Subsystem->AddMappingContext(IMC, 0);
}
```

---

## Pitfall 2: Stuck Input After UI Mode Switch

**Symptom:** Character keeps moving/looking after opening a pause menu or widget. Closing the menu doesn't fix it — movement persists until the same key is pressed again.

**Cause:** Switching from `GameOnly` to `UIOnly` input mode while the player holds movement keys (e.g., W key). The Release event is swallowed by the mode switch, so the Enhanced Input system thinks the key is still held.

**Fix:** Call `FlushPressedKeys()` BEFORE transitioning input modes.

```cpp
void AMyPC::OpenMenu()
{
    FlushPressedKeys(); // MUST be before mode switch
    SetInputMode(FInputModeUIOnly().SetLockMouseToViewportBehavior(EMouseLockMode::DoNotLock));
    // Or with CommonUI: PushWidget(MenuWidget);
}
```

---

## Pitfall 3: bConsumeInput Doesn't Block Other Actors

**Symptom:** Two actors both receive the same input despite `bConsumeInput = true` on the action.

**Cause:** The `bConsumeInput` flag only works within the same actor's input hierarchy and at the IMC priority level. It does NOT prevent other actors from receiving the same physical input.

**Fix:** Use IMC priority levels for cross-actor input blocking. Higher-priority contexts consume inputs from lower-priority ones when both are on the same actor.

---

## Pitfall 4: Multiple IMCs Both Fire for Same Key

**Symptom:** A key bound in two IMCs at different priorities fires callbacks from both contexts.

**Cause:** By default, input flows through all priority levels. The action's `Consume Lower Priority Enhanced Input Mapping` property may not be set.

**Fix:** Enable consumption at the action or mapping level, or use explicit context swapping (remove old context before adding new one) instead of stacking.

---

## Pitfall 5: RequestRebuildControlMappings Kills Events

**Symptom:** `Completed` and `Canceled` events stop firing after adding/removing mapping contexts.

**Cause:** `RequestRebuildControlMappings()` mid-frame resets trigger states, preventing state transition events from firing.

**Fix:** Only rebuild mappings at safe points — between game states, not during active input callbacks. Use `FModifyContextOptions` with `bForceImmediately = false` (default) to defer the rebuild.

---

## Pitfall 6: CastChecked Crash on Input Component

**Symptom:** `CastChecked<UEnhancedInputComponent>(PlayerInputComponent)` crashes with assertion failure at runtime.

**Cause:** Project Settings > Input > Default Input Component Class is still set to `UInputComponent` instead of `UEnhancedInputComponent`.

**Fix:** Set both defaults in Project Settings:
- Default Player Input Class = `EnhancedPlayerInput`
- Default Input Component Class = `EnhancedInputComponent`

---

## Pitfall 7: Action References Not Assigned in Blueprint

**Symptom:** Code compiles, no crashes, but input callbacks never fire despite IMC being active.

**Cause:** The Character/Controller class has `UPROPERTY() UInputAction* MoveAction;` but the Blueprint derived from it was never configured — the action pointer is nullptr.

**Fix:** Open the Blueprint, find the Input category in Details panel, assign all Input Action data assets. Without this, `BindAction(nullptr, ...)` silently does nothing.

---

## Pitfall 8: Started Event Has Zero Value (UE 5.5+)

**Symptom:** Callback bound to `ETriggerEvent::Started` receives `Value.Get<FVector2D>()` as (0,0) even though a key was pressed.

**Cause:** In UE 5.5+, `Started` fires on the state transition tick with an empty value. The actual value is only available on `Triggered` events.

**Fix:** For single-fire-with-value semantics, use `ETriggerEvent::Triggered` combined with a `Pressed` trigger type on the action.

```cpp
// Before (works in 5.4, breaks in 5.5):
EIC->BindAction(Action, ETriggerEvent::Started, this, &MyClass::OnAction);

// After (works in all versions):
// Add UInputTriggerPressed to the action/mapping
EIC->BindAction(Action, ETriggerEvent::Triggered, this, &MyClass::OnAction);
```

---

## Pitfall 9: Default Trigger is Down (Continuous Fire)

**Symptom:** A Boolean action (intended as one-shot jump) fires its callback every frame while the key is held.

**Cause:** An action with NO triggers gets an implicit `UInputTriggerDown`, which fires every tick while actuated. Binding to `ETriggerEvent::Triggered` with no trigger = continuous fire.

**Fix:** Either:
1. Add a `Pressed` trigger to the action for one-shot behavior, OR
2. Bind to `ETriggerEvent::Started` instead (fires once on first tick)

---

## Pitfall 10: Modifier Order Produces Wrong Values

**Symptom:** WASD input produces wrong direction vectors (e.g., S key goes right instead of backward).

**Cause:** Modifiers are applied in array order. `Swizzle → Negate` produces different results than `Negate → Swizzle`.

**Fix:** For S key (backward on Y axis): `Negate` first, then `Swizzle(YXZ)`.
- Input: (1, 0) → Negate → (-1, 0) → Swizzle(YXZ) → (0, -1) ✓
- Wrong order: (1, 0) → Swizzle(YXZ) → (0, 1) → Negate → (0, -1)... actually same result in this case
- But for other combinations, order matters significantly

**General rule:** Apply value transformations (Negate, Scalar) before axis reordering (Swizzle).

---

## Pitfall 11: SetInputMode Breaks CommonUI

**Symptom:** After calling `SetInputMode()`, CommonUI widgets stop responding to input, or game input bleeds through menus.

**Cause:** `SetInputMode()` bypasses CommonUI's input routing stack entirely. CommonUI manages its own input modes through `UCommonActivatableWidget::GetDesiredInputConfig()`.

**Fix:** NEVER use `SetInputMode()` with CommonUI. Override `GetDesiredInputConfig()` on your widgets:

```cpp
FUIInputConfig GetDesiredInputConfig() const override
{
    return FUIInputConfig(ECommonInputMode::Menu, EMouseCaptureMode::NoCapture);
}
```

---

## Pitfall 12: Missing Build.cs Module — Cryptic Linker Errors

**Symptom:** Linker errors mentioning `UEnhancedInputComponent`, `UInputAction`, or `EnhancedInput` symbols.

**Cause:** `"EnhancedInput"` module not added to Build.cs dependencies.

**Fix:**
```cpp
PublicDependencyModuleNames.AddRange(new string[] {
    "Core", "CoreUObject", "Engine", "InputCore", "EnhancedInput"
});
```

Also need `"InputCore"` for `FKey`, `EKeys`, and related types.

---

## Pitfall 13: Split-Screen Player 2 Gets No Gamepad Input

**Symptom:** In local multiplayer, connected gamepad doesn't control Player 2. Only Player 1 receives gamepad input.

**Cause:** Known UE 5.1+ bug. `GetEnhancedInputLocalPlayerSubsystem` only works reliably on Player 0. Gamepad auto-assignment defaults Player 1 to gamepad.

**Fix:** Project Settings > Maps & Modes > Local Multiplayer > enable `Skip Assigning Gamepad to Player 1`. Player 1 gets KB+M, Player 2 gets gamepad.

---

## Pitfall 14: FInputActionValue Not Replicated

**Symptom:** Server receives zero/wrong values from input callbacks in multiplayer.

**Cause:** `FInputActionValue` passed through `BindAction` is NOT replicated. Enhanced Input runs locally on the owning client only. The server never processes raw input.

**Fix:** Send input values explicitly via RPCs if the server needs them:

```cpp
void AMyCharacter::Move(const FInputActionValue& Value)
{
    FVector2D MoveVector = Value.Get<FVector2D>();
    // Client processes locally...
    if (!HasAuthority())
    {
        ServerMove(MoveVector); // Send to server via RPC
    }
}
```

---

## Pitfall 15: Expensive Logic in Mouse Look Callback

**Symptom:** Frame rate drops when moving the mouse. Profile shows input callback taking significant time.

**Cause:** Mouse look actions with `ETriggerEvent::Triggered` (default Down trigger) fire every single frame. Binding expensive operations (traces, spawns, queries) to this event runs them 60+ times per second.

**Fix:**
- Use `Started`/`Completed` for discrete actions
- Throttle expensive operations in continuous callbacks
- Move expensive work to Tick with a dirty flag

---

## Pitfall 16: Priority Number Confusion

**Symptom:** Higher-priority context doesn't override lower-priority one.

**Cause:** Confusion about priority direction. **Higher number = higher priority** (priority 2 beats priority 0).

**Fix:** Remember: `AddMappingContext(IMC, 0)` is LOW priority, `AddMappingContext(IMC, 2)` is HIGH priority.

---

## Pitfall 17: Alt+Tab Breaks Gamepad in Split-Screen (UE 5.4.4)

**Symptom:** After Alt+Tab, gamepad input assignment breaks in split-screen with CommonInput + CommonUI.

**Cause:** Engine bug UE-173306. Input device assignment state becomes corrupted after window focus change.

**Fix:** No official fix. Workaround: re-assign gamepad mappings on window focus regain via `FSlateApplication::Get().OnApplicationActivationStateChanged()`.

---

## Pitfall 18: ShowDebug EnhancedInput Not Showing

**Symptom:** `showdebug enhancedinput` console command shows nothing or is not recognized.

**Cause:** In some UE 5.3+ builds, the debug display requires explicit enabling in Project Settings, or the command must be entered without spaces in the argument.

**Fix:** Try `showdebug EnhancedInput` (case-sensitive). Verify Enhanced Input plugin is enabled. Check that the player controller is using `EnhancedPlayerInput`.

---

## Pitfall 19: ActivateWidget() Causes Double Activation

**Symptom:** CommonUI widget receives input events twice, or widget stack becomes corrupted.

**Cause:** Calling `ActivateWidget()` manually when `PushWidget()` already handles activation internally.

**Fix:** NEVER call `ActivateWidget()` directly. Use `PushWidget()` to add widgets to the stack — it manages activation automatically.

---

## Pitfall 20: Scalar Modifier Fails with Analog Input

**Symptom:** Using Scalar modifiers to differentiate number keys (1-9) on a single Input Action works for discrete buttons but produces unexpected values with analog gamepad triggers.

**Cause:** Scalar multiplies the entire input value. Digital inputs are always 0 or 1, so Scalar(2.0) reliably produces 2.0. Analog inputs vary from 0..1, so Scalar(2.0) produces 0..2 — ambiguous with other keys.

**Fix:** For mixed digital/analog bindings that need distinct identification, use separate Input Actions.

---

## Debugging Checklist

When input doesn't work, check in this order:

1. **Plugin enabled?** — Enhanced Input plugin active in Project Settings
2. **Default classes set?** — EnhancedPlayerInput + EnhancedInputComponent in Project Settings > Input
3. **Build.cs?** — `"EnhancedInput"` and `"InputCore"` in dependencies
4. **IMC registered?** — `AddMappingContext()` called at the right time (not too early)
5. **Actions assigned?** — UPROPERTY action references set in Blueprint (not nullptr)
6. **Binding correct?** — Right ETriggerEvent for the use case (Started vs Triggered)
7. **Triggers correct?** — No triggers = Down (continuous). Need Pressed for one-shot.
8. **Modifier order?** — Negate before Swizzle for WASD
9. **Priority correct?** — Higher number = higher priority
10. **showdebug enhancedinput** — Visual verification of active actions and states

### Quick Debug Commands

```
showdebug enhancedinput    — all active actions, values, trigger states
showdebug devices          — connected input devices
```

### Programmatic Debug

```cpp
// Inject input without physical device (automated testing)
Subsystem->InjectInputForAction(IA_Move, FInputActionValue(FVector2D(1, 0)));

// Check if context is active
bool bActive = Subsystem->HasMappingContext(MyIMC);

// Query what keys are mapped
TArray<FKey> Keys = Subsystem->QueryKeysMappedToAction(MyAction);
```
