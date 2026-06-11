# Enhanced Input System — C++ Reference & Cheat-Sheet

The default input system since UE 5.1 (object-oriented, replaced legacy Action/Axis mappings). This is the **knowledge** file for writing input code. To **drive/test** input in a running PIE, use the `simulate_input` MCP tool → `simulate-input.md`.

Processing pipeline: `raw key → modifiers (per-mapping, then per-action) → triggers (per-mapping, then per-action) → ETriggerEvent → bound callback(FInputActionValue)`.

## Setup (do this first — most "input never fires" bugs are here)

| Requirement | Value |
|---|---|
| Plugin | Enhanced Input enabled |
| Build.cs | `"EnhancedInput"` **and** `"InputCore"` in dependencies |
| Project Settings → Input | Default Player Input Class = `EnhancedPlayerInput`; Default Input Component Class = `EnhancedInputComponent` |
| Headers | `EnhancedInputComponent.h`, `EnhancedInputSubsystems.h`, `InputAction.h`, `InputMappingContext.h`, `InputModifiers.h`, `InputTriggers.h`, `InputActionValue.h` |

## Core classes

| Class | Role |
|---|---|
| `UInputAction` | Data Asset = a conceptual action (Move, Jump), key-independent. Has `ValueType`, `bConsumeInput`, `bTriggerWhenPaused`, action-level `Triggers`/`Modifiers`, `AccumulationBehavior` (`TakeHighestAbsoluteValue` default \| `Cumulative`). |
| `UInputMappingContext` (IMC) | Data Asset mapping `FKey`→`UInputAction` with per-mapping modifiers/triggers. |
| `UEnhancedInputComponent` | Binds actions to callbacks (replaces `UInputComponent`). |
| `UEnhancedInputLocalPlayerSubsystem` | Per-player; manages active IMCs at runtime. |
| `FInputActionValue` | Current value wrapper: `bool`/`float`/`FVector2D`/`FVector`. |
| `FInputActionInstance` | Runtime: `GetValue()`, `GetElapsedTime()`, `GetTriggeredTime()`, `GetTriggerEvent()`, `GetSourceAction()`. |
| `UInputModifier` / `UInputTrigger` | Base classes for value preprocessing / activation conditions. |

**Value types (`EInputActionValueType`):** `Boolean`(bool) · `Axis1D`(float) · `Axis2D`(FVector2D, WASD/look/stick) · `Axis3D`(FVector, VR). Extract: `Value.Get<bool>()` / `Get<float>()` / `Get<FVector2D>()` / `Get<FVector>()`; also `GetValueType()`, `IsNonZero()`.

## Trigger events (bound via `BindAction`)

| `ETriggerEvent` | Fires |
|---|---|
| `Started` | Once on first actuation (None→active). **UE 5.5+: empty value** — use `Triggered`+`Pressed` for fire-with-value. |
| `Ongoing` | Each tick while evaluating but not fully fired (e.g. Hold countdown). |
| `Triggered` | When all conditions met. With `Down` = every tick held; with `Pressed` = once. |
| `Completed` | Once when a triggered action's input releases / conditions no longer met. |
| `Canceled` | Once when an `Ongoing` action releases before reaching `Triggered`. |

## Built-in triggers

Eval rule: fires if **all** Implicit are Triggered **and** ≥1 Explicit is Triggered (if any exist) **and** no Blocker is Triggered. **No triggers = implicit `Down` (continuous fire).**

| Class | Type | Behavior / key props |
|---|---|---|
| `UInputTriggerDown` | Explicit | Every tick while > `ActuationThreshold` (default). |
| `UInputTriggerPressed` | Explicit | Once on cross above threshold. |
| `UInputTriggerReleased` | Explicit | Once on drop below threshold. |
| `UInputTriggerHold` | Explicit | After `HoldTimeThreshold` s; `bIsOneShot`. |
| `UInputTriggerHoldAndRelease` | Explicit | On release after held ≥ threshold. |
| `UInputTriggerTap` | Explicit | Press+release within `TapReleaseTimeThreshold`. |
| `UInputTriggerPulse` | Explicit | Every `Interval` s while held; `TriggerLimit`. |
| `UInputTriggerChordAction` | Implicit | Requires another `ChordAction` active. |
| `UInputTriggerChordBlocker` | Blocker | Blocks while `ChordAction` active. |
| `UInputTriggerCombo` | Explicit | Sequential action pattern (5.4+): `ComboActions[]`, `InputCancelTimeout`. |

## Built-in modifiers (applied in array order — order matters)

| Class | Effect / props |
|---|---|
| `UInputModifierDeadZone` | `LowerThreshold`(0.2), `UpperThreshold`(1.0), `Type` (`Axial`=per-axis \| `Radial`=magnitude). |
| `UInputModifierScalar` | `Scalar` (FVector) multiply. |
| `UInputModifierNegate` | `bX`/`bY`/`bZ` invert. |
| `UInputModifierSwizzleAxis` | Reorder axes; `Order` (default `YXZ` = maps 1D key to Y). |
| `UInputModifierScaleByDeltaTime` | × frame delta. |
| `UInputModifierSmooth` | Smooth over frames. |
| `UInputModifierResponseCurveExponential` / `...User` | `CurveExponent` / `ResponseCurve`. |
| `UInputModifierFOVScaling` / `...ToWorldSpace` | FOV scale / world-space convert. |

## IMC management & binding API

```cpp
// Higher number = HIGHER priority. Higher-priority contexts process first / can consume.
auto* Sub = ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(PC->GetLocalPlayer());
Sub->AddMappingContext(IMC, Priority);   Sub->RemoveMappingContext(IMC);   Sub->ClearAllMappings();
Sub->HasMappingContext(IMC);
TArray<FKey> Keys = Sub->QueryKeysMappedToAction(Action);
Sub->InjectInputForAction(Action, FInputActionValue(...));            // programmatic / test injection
Sub->RequestRebuildControlMappings(EInputMappingRebuildType::RebuildWithFlush);  // only between game states

// Bind (callback signatures: void(const FInputActionValue&) | void(const FInputActionInstance&) | void() | FName)
UEnhancedInputComponent* EIC = CastChecked<UEnhancedInputComponent>(PlayerInputComponent);
EIC->BindAction(Action, ETriggerEvent::Triggered, this, &AClass::Func);
```
`BindAction` does **not** hold a hard ref to the `UInputAction*` — store it in a `UPROPERTY()` or it may be GC'd. IMC programmatic edits: `IMC->MapKey(Action, EKeys::W)` (returns `FEnhancedActionKeyMapping&`), `UnmapKey`, `UnmapAllKeysFromAction`, `UnmapAll`.

`EInputMappingRebuildType`: `Rebuild` (remap only) · `RebuildWithFlush` (full reset) · `None`. `FModifyContextOptions{ bIgnoreAllPressedKeysUntilRelease=true, bForceImmediately=false }`.

## Canonical character setup

```cpp
// MyCharacter.h — UPROPERTY(EditDefaultsOnly, BlueprintReadOnly, Category="Input"):
//   TObjectPtr<UInputMappingContext> DefaultMappingContext;
//   TObjectPtr<UInputAction> MoveAction, LookAction, JumpAction;

void AMyCharacter::PossessedBy(AController* NewController)   // Pawn: add IMC here, NOT BeginPlay
{
    Super::PossessedBy(NewController);
    if (auto* PC = Cast<APlayerController>(NewController))
        if (auto* Sub = ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(PC->GetLocalPlayer()))
            Sub->AddMappingContext(DefaultMappingContext, 0);
}

void AMyCharacter::SetupPlayerInputComponent(UInputComponent* PIC)
{
    Super::SetupPlayerInputComponent(PIC);
    auto* EIC = CastChecked<UEnhancedInputComponent>(PIC);
    EIC->BindAction(MoveAction, ETriggerEvent::Triggered, this, &AMyCharacter::Move);
    EIC->BindAction(LookAction, ETriggerEvent::Triggered, this, &AMyCharacter::Look);
    EIC->BindAction(JumpAction, ETriggerEvent::Started,   this, &ACharacter::Jump);
    EIC->BindAction(JumpAction, ETriggerEvent::Completed, this, &ACharacter::StopJumping);
}

void AMyCharacter::Move(const FInputActionValue& V)         // Axis2D
{
    const FVector2D In = V.Get<FVector2D>();
    const FRotator Yaw(0, Controller->GetControlRotation().Yaw, 0);
    AddMovementInput(FRotationMatrix(Yaw).GetUnitAxis(EAxis::X), In.Y);   // forward
    AddMovementInput(FRotationMatrix(Yaw).GetUnitAxis(EAxis::Y), In.X);   // right
}
void AMyCharacter::Look(const FInputActionValue& V)         // Axis2D
{ const FVector2D In = V.Get<FVector2D>(); AddControllerYawInput(In.X); AddControllerPitchInput(In.Y); }
```
**PlayerController alternative:** add IMC in `SetupInputComponent()`/`BeginPlay()` (PC exists before possession, so `BeginPlay` is safe there — unlike a Pawn).

**WASD on an Axis2D Move action:** D = none(+X); A = Negate(X)(−X); W = Swizzle YXZ(+Y); S = Negate **then** Swizzle YXZ(−Y); gamepad `Gamepad_Left2D` = native, no modifiers.

## Recipe index (concept → how)

| Goal | How |
|---|---|
| One-shot button | `Pressed` trigger (or bind `Started`), not bare `Triggered` (= continuous). |
| Tap vs Hold, same key | `IA_Tap`: `Tap` trigger; `IA_Hold`: `Hold`(`bIsOneShot`) trigger — both on same key. |
| Chord (Shift+Click) | Attack: `ChordBlocker(IA_Sprint)`; SprintAttack: `ChordAction(IA_Sprint)`. |
| Sequential combo (5.4+) | `UInputTriggerCombo` with `ComboActions[]` + `InputCancelTimeout`. |
| Context switch (vehicle/UI) | `FlushPressedKeys()` → `RemoveMappingContext(old)` → `AddMappingContext(new)`. Overlay shared actions at higher priority. |
| Custom modifier | subclass `UInputModifier`, override `ModifyRaw_Implementation(PlayerInput, CurrentValue, DeltaTime) -> FInputActionValue`. |
| Custom trigger | subclass `UInputTrigger`, override `GetTriggerType_Implementation()` + `UpdateState_Implementation(...) -> ETriggerState`. |
| GAS ability bind | bind `Started/Completed` → `ASC->AbilityLocalInputPressed/Released(InputID)`, or tag-based (below). |
| Many actions | centralize `UInputAction*` refs in a `UDataAsset` (`UInputDataConfig`) and bind via it. |
| Frame-rate-independent | `AddMovementInput` already handles DeltaTime; only add `ScaleByDeltaTime` for direct camera/custom movement. |

## Cross-platform essentials

- **Tag-based ability input** (decouples input from abilities): `UInputConfig : UDataAsset` holds `TArray<FTaggedInputAction>{ const UInputAction*, FGameplayTag InputTag }`. Bind ability actions `Triggered→OnAbilityInputPressed(Tag)` / `Completed→OnAbilityInputReleased(Tag)`; pass the tag to the ASC, which activates abilities whose `ActivationTag` matches. GameFeatures can add their own InputConfig assets.
- **Separate look actions per device**: `IA_Look_Mouse` (sensitivity scalar only — mouse is delta/pixels) vs `IA_Look_Stick` (DeadZone→Sensitivity→Inversion→Response curve — stick is continuous). Combining forces modifier compromises.
- **Touch (mobile)**: a `USimulatedInputWidget : UCommonUserWidget` with an `AssociatedInputAction` that calls `InputKeyValue(FVector2D)` on touch; `UTouchRegion` subclass overrides `NativeOnTouch{Started,Moved,Ended}` for virtual joysticks. `Config/Android/AndroidInput.ini`: `input.DeviceMappingPolicy=1`.
- **GameFeature input** (two actions): `GameFeatureAction_AddInputContextMapping` (registers IMCs + priority, `bRegisterWithSettings` for remap UI) and `GameFeatureAction_AddInputBinding` (adds InputConfig to pawns). Lifecycle: Registering→register contexts; Activating→hook PC extensions; player-ready→`AddMappingContext`; Deactivating→remove; Unregistering→unregister. Gate ability binds on `bReadyToBindInputs`.
- **Player remapping (UE 5.3+)**: enable `bEnableUserSettings=True` + `UserSettingsClass`/`DefaultPlayerMappableKeyProfileClass` in `[/Script/EnhancedInput.EnhancedInputDeveloperSettings]`; mark mappings player-mappable; `Sub->GetUserSettings()` → `SaveSettings()` writes `EnhancedInputUserSettings.sav`. Pre-5.3 used `UPlayerMappableInputConfig`.
- **Device detection**: `UCommonInputSubsystem::GetCurrentInputType()` → `ECommonInputType::{MouseAndKeyboard,Gamepad,Touch}`; subscribe `OnInputMethodChangedNative`. Or `APlayerController::OnInputHardwareDeviceChanged`.
- **CommonUI**: never `SetInputMode()` — override `UCommonActivatableWidget::GetDesiredInputConfig() → FUIInputConfig(ECommonInputMode::Menu|Game|All, EMouseCaptureMode::...)`. Use `PushWidget()` (not `ActivateWidget()`).
- **Gamepad deadzone defaults** (`DefaultInput.ini`): `+AxisConfig=(AxisKeyName="Gamepad_LeftX", AxisProperties=(DeadZone=0.25))` (and LeftY/RightX/RightY); `MouseX/Y` DeadZone=0.0, Sensitivity≈0.07.

## Naming & organization

`IA_` Input Action · `IMC_` Mapping Context · `InputData_`/`PMI_` config · `IM_` custom modifier · `IT_` custom trigger · `FFE_` force feedback. Folder: `Content/Input/{Actions,Mappings,Settings}` (GameFeatures carry their own under their plugin).

## Pitfalls (symptom → cause → fix)

| Symptom | Cause | Fix |
|---|---|---|
| Input never fires, no errors | IMC added in **Pawn** `BeginPlay` (not yet possessed) | Add in `PossessedBy()`/`OnPossessed`. PC `BeginPlay` is fine. |
| Callbacks never fire, IMC active | `UInputAction*` UPROPERTY unset in the Blueprint → `BindAction(nullptr,...)` no-ops | Assign all IA assets in BP Details (C++-parent UPROPERTYs can't be set programmatically). |
| `CastChecked<UEnhancedInputComponent>` crash | Default Input Component Class still `UInputComponent` | Set both Project Settings input class defaults. |
| Linker errors on `UEnhancedInput*`/`UInputAction` | `"EnhancedInput"`/`"InputCore"` missing from Build.cs | Add both. |
| Character keeps moving after opening menu | Mode switch swallowed the key release | `FlushPressedKeys()` **before** the mode switch. |
| Boolean (jump) fires every frame | No trigger = implicit `Down` | Add `Pressed`, or bind `Started`. |
| `Started` value is (0,0) (UE 5.5+) | `Started` fires with empty value | Use `Triggered` + `Pressed` trigger. |
| WASD wrong directions | Modifier order | Negate **before** Swizzle (value transforms before axis reorder). |
| Higher-priority IMC doesn't win | Priority direction confusion | Higher number = higher priority. |
| Two IMCs both fire for a key | No consumption | Enable consume at action/mapping, or swap contexts (remove old before add). |
| `Completed`/`Canceled` stop firing | `RequestRebuildControlMappings` mid-callback resets trigger state | Rebuild only between game states (deferred). |
| Server gets zero/wrong input | `FInputActionValue` is **not** replicated; EI runs on owning client only | Send needed values via Server RPC. |
| FPS drops on mouse move | Expensive work in `Triggered` (Down, every frame) | Use `Started`/`Completed`, throttle, or move to Tick+dirty flag. |
| Split-screen P2 no gamepad | Known 5.1+ assignment bug | Maps&Modes → `Skip Assigning Gamepad to Player 1`. |
| `bConsumeInput` doesn't block other actor | Only works within one actor's hierarchy | Use IMC priority for cross-actor blocking. |

**Debug:** `showdebug enhancedinput` (active actions/values/trigger states/IMCs), `showdebug devices`. Programmatic: `Sub->InjectInputForAction(IA, FInputActionValue(...))`, `Sub->HasMappingContext(IMC)`, `Sub->QueryKeysMappedToAction(IA)`.

**Debug checklist (in order):** plugin enabled → default input classes set → Build.cs modules → IMC registered at right time → action refs assigned in BP → correct `ETriggerEvent` → correct triggers (Pressed for one-shot) → modifier order → priority → `showdebug enhancedinput`.
