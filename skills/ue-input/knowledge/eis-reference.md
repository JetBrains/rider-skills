# Enhanced Input System — Complete Reference

## Architecture Overview

The Enhanced Input System is an object-oriented input framework that replaced UE4's legacy Action/Axis Mappings. Introduced experimentally in UE 4.26, fully supported in UE 5.0, and the **default input system since UE 5.1**.

### Processing Pipeline

```
Raw Hardware Input
  → Input Modifiers (per-mapping, then per-action)
    → Input Triggers (per-mapping, then per-action)
      → ETriggerEvent determined from state transitions
        → Bound callback invoked with FInputActionValue
```

### Core Classes

| Class | Role |
|-------|------|
| `UInputAction` | Data Asset representing a conceptual player action (Move, Jump). Independent of physical keys. |
| `UInputMappingContext` (IMC) | Data Asset mapping physical keys to Input Actions, with per-mapping modifiers and triggers. |
| `UEnhancedInputComponent` | Component that binds Input Actions to C++ callbacks. Replaces `UInputComponent`. |
| `UEnhancedInputLocalPlayerSubsystem` | Per-player subsystem managing active mapping contexts at runtime. |
| `UEnhancedPlayerInput` | Processes raw input through modifiers/triggers each tick. Replaces `UPlayerInput`. |
| `UInputModifier` | Base class for value preprocessing (dead zone, scale, negate, etc.). |
| `UInputTrigger` | Base class for activation conditions (press, hold, tap, chord, combo). |
| `FInputActionValue` | Wrapper holding current input value (bool, float, FVector2D, FVector). |
| `FInputActionInstance` | Runtime instance providing value, elapsed time, trigger state. |
| `FEnhancedActionKeyMapping` | Struct binding UInputAction + FKey + modifiers + triggers within an IMC. |
| `UPlayerMappableInputConfig` | Data Asset for runtime key remapping presets (experimental, pre-5.3). |
| `UEnhancedInputUserSettings` | Built-in key remapping/settings manager (UE 5.3+). |

### Module Dependencies (Build.cs)

```cpp
PublicDependencyModuleNames.AddRange(new string[] {
    "Core", "CoreUObject", "Engine", "InputCore", "EnhancedInput"
});
```

### Required Project Settings

| Setting | Value |
|---------|-------|
| Default Player Input Class | `EnhancedPlayerInput` |
| Default Input Component Class | `EnhancedInputComponent` |

### Required Headers

```cpp
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"
#include "InputAction.h"
#include "InputMappingContext.h"
#include "InputModifiers.h"
#include "InputTriggers.h"
#include "InputActionValue.h"
```

---

## Input Actions (UInputAction)

### Value Types (EInputActionValueType)

| Enum | C++ Type | Use Case |
|------|----------|----------|
| `Boolean` | `bool` | Button presses: Jump, Sprint, Interact |
| `Axis1D` | `float` | Single-axis: throttle, scroll wheel |
| `Axis2D` | `FVector2D` | Two-axis: WASD movement, mouse look, gamepad sticks |
| `Axis3D` | `FVector` | Three-axis: VR motion controllers |

### UInputAction Properties

| Property | Type | Description |
|----------|------|-------------|
| `ValueType` | `EInputActionValueType` | Value type this action reports |
| `ActionDescription` | `FText` | Documentation string for team clarity |
| `bConsumeInput` | `bool` | If true, prevents lower-priority contexts from receiving this input |
| `bTriggerWhenPaused` | `bool` | If true, action fires even when game is paused |
| `bReserveAllMappings` | `bool` | If true, prevents higher-priority contexts from overriding |
| `Triggers` | `TArray<UInputTrigger*>` | Action-level triggers (applied AFTER per-mapping triggers) |
| `Modifiers` | `TArray<UInputModifier*>` | Action-level modifiers (applied AFTER per-mapping modifiers) |
| `AccumulationBehavior` | `EInputActionAccumulationBehavior` | How multiple mappings combine |

### EInputActionAccumulationBehavior

| Value | Description |
|-------|-------------|
| `TakeHighestAbsoluteValue` | Highest magnitude wins across mappings (default) |
| `Cumulative` | All mapping values are summed |

### FInputActionValue — Extracting Values

```cpp
bool bPressed = Value.Get<bool>();         // Boolean action
float AxisVal = Value.Get<float>();        // Axis1D action
FVector2D Vec2 = Value.Get<FVector2D>();   // Axis2D action
FVector Vec3 = Value.Get<FVector>();       // Axis3D action

EInputActionValueType Type = Value.GetValueType();
bool bNonZero = Value.IsNonZero();
```

### FInputActionInstance — Extended Info

```cpp
void OnMove(const FInputActionInstance& Instance)
{
    FInputActionValue Value = Instance.GetValue();
    float ElapsedTime = Instance.GetElapsedTime();
    float TriggeredTime = Instance.GetTriggeredTime();
    ETriggerEvent Event = Instance.GetTriggerEvent();
    const UInputAction* Source = Instance.GetSourceAction();
}
```

---

## Trigger Events (ETriggerEvent)

Events bound via `BindAction()`. Represent trigger state transitions each tick.

| Event | When It Fires |
|-------|---------------|
| `None` | No event (no triggers evaluated to meaningful state) |
| `Started` | Once on first tick triggers begin evaluating (None → any active state) |
| `Ongoing` | Each tick while triggers evaluate but haven't fully fired (e.g., during Hold countdown) |
| `Triggered` | When all trigger conditions fully met. For `Down` trigger = every tick while held. For `Pressed` = once. |
| `Completed` | Once when previously triggered action's input released or triggers no longer met |
| `Canceled` | Once when `Ongoing` action (never reached `Triggered`) has input released |

### State Transition Diagram

```
None → Started → Ongoing → Triggered → Completed
                    ↓
                 Canceled (if triggers never fully met)
```

**UE 5.5+ Note:** `Started` fires with zero/empty value. Use `Triggered` with a `Pressed` trigger for single-fire-with-value semantics.

---

## Trigger System

### ETriggerState

| Value | Meaning |
|-------|---------|
| `None` | Conditions not met |
| `Ongoing` | Conditions partially met, in progress |
| `Triggered` | All conditions fully met |

### ETriggerType (Trigger Categories)

| Type | Evaluation Rule |
|------|----------------|
| `Explicit` | Action fires if THIS trigger's condition is met. Multiple explicit → OR logic (any one suffices). |
| `Implicit` | ALL implicit triggers must be `Triggered` for action to fire. AND logic. |
| `Blocker` | Action is BLOCKED if this trigger's condition is met. Veto power. |

### Combined Evaluation Rule

```
Action fires IF:
  ALL Implicit triggers are Triggered
  AND at least one Explicit trigger is Triggered (if any exist)
  AND NO Blocker triggers are Triggered
```

**Default behavior:** An action with NO triggers gets an implicit `UInputTriggerDown`.

### Built-in Triggers

| Class | Type | Description | Key Properties |
|-------|------|-------------|----------------|
| `UInputTriggerDown` | Explicit | Fires every tick while input > ActuationThreshold. DEFAULT implicit trigger. | `ActuationThreshold` |
| `UInputTriggerPressed` | Explicit | Fires ONCE when input first exceeds threshold. | `ActuationThreshold` |
| `UInputTriggerReleased` | Explicit | Fires ONCE when input drops below threshold. Returns `Ongoing` while held. | `ActuationThreshold` |
| `UInputTriggerHold` | Explicit | Fires after held for `HoldTimeThreshold` seconds. | `HoldTimeThreshold`, `bIsOneShot`, `bAffectedByTimeDilation` |
| `UInputTriggerHoldAndRelease` | Explicit | Fires when released after held ≥ `HoldTimeThreshold`. | `HoldTimeThreshold`, `bAffectedByTimeDilation` |
| `UInputTriggerTap` | Explicit | Fires if pressed and released within `TapReleaseTimeThreshold`. | `TapReleaseTimeThreshold`, `bAffectedByTimeDilation` |
| `UInputTriggerPulse` | Explicit | Fires at `Interval` seconds while held. | `bTriggerOnStart`, `Interval`, `TriggerLimit`, `bAffectedByTimeDilation` |
| `UInputTriggerChordAction` | Implicit | Requires another UInputAction to be active simultaneously. | `ChordAction` (UInputAction*) |
| `UInputTriggerChordBlocker` | Blocker | Blocks action when chord action IS active. | `ChordAction` (UInputAction*) |
| `UInputTriggerCombo` | Explicit | Sequential action pattern (UE 5.4+). | `ComboActions` (array), `InputCancelTimeout` |

---

## Modifier System

Modifiers preprocess raw input values BEFORE triggers evaluate. **Order matters** — applied sequentially.

### Built-in Modifiers

| Class | Description | Key Properties |
|-------|-------------|----------------|
| `UInputModifierDeadZone` | Remaps values within threshold range to 0..1 | `LowerThreshold` (0.2), `UpperThreshold` (1.0), `Type` (Axial/Radial) |
| `UInputModifierScalar` | Multiplies input per axis | `Scalar` (FVector) |
| `UInputModifierNegate` | Inverts input per axis (×-1) | `bX`, `bY`, `bZ` |
| `UInputModifierSwizzleAxis` | Reorders axes | `Order` (EInputAxisSwizzle, default YXZ) |
| `UInputModifierFOVScaling` | FOV-dependent scaling | `FOVScale` (float) |
| `UInputModifierSmooth` | Smooths input over frames | (internal) |
| `UInputModifierResponseCurveExponential` | Exponential response curve | `CurveExponent` (FVector, 1.0=linear) |
| `UInputModifierResponseCurveUser` | Custom UCurveFloat response | `ResponseCurve` (UCurveFloat*) per axis |
| `UInputModifierScaleByDeltaTime` | Multiplies by frame delta time | (none) |
| `UInputModifierToWorldSpace` | Converts input to world space relative to control rotation | (none) |

### EDeadZoneType

| Value | Description |
|-------|-------------|
| `Axial` | Dead zone applied per-axis independently |
| `Radial` | Dead zone applied to combined magnitude of all axes |

### EInputAxisSwizzle

| Value | Description |
|-------|-------------|
| `YXZ` | Swap X↔Y (default — maps 1D key to Y axis for forward/back) |
| `ZYX` | Swap X↔Z |
| `XZY` | Swap Y↔Z |
| `YZX` | Rotate X→Y→Z→X |
| `ZXY` | Rotate X→Z→Y→X |

---

## Input Mapping Context (UInputMappingContext)

### Priority System

```cpp
Subsystem->AddMappingContext(IMC_OnFoot, 0);      // lower priority
Subsystem->AddMappingContext(IMC_Vehicle, 1);      // higher priority
Subsystem->AddMappingContext(IMC_UI, 2);           // highest priority
```

**Higher number = higher priority.** Higher-priority contexts process first and can consume inputs.

### FEnhancedActionKeyMapping Properties

| Property | Type | Description |
|----------|------|-------------|
| `Action` | `UInputAction*` | The action this mapping triggers |
| `Key` | `FKey` | Physical input key |
| `Triggers` | `TArray<UInputTrigger*>` | Per-mapping triggers |
| `Modifiers` | `TArray<UInputModifier*>` | Per-mapping modifiers |
| `bIsPlayerMappable` | `bool` | Enables runtime remapping |
| `PlayerMappableOptions` | struct | Name, DisplayName, DisplayCategory, Metadata |

### Runtime Context Management

```cpp
UEnhancedInputLocalPlayerSubsystem* Subsystem =
    ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(
        PC->GetLocalPlayer());

Subsystem->AddMappingContext(Context, Priority);
Subsystem->RemoveMappingContext(Context);
Subsystem->ClearAllMappings();
bool bHas = Subsystem->HasMappingContext(Context);

// Query mapped keys
TArray<FKey> Keys = Subsystem->QueryKeysMappedToAction(Action);

// Inject input programmatically (testing)
Subsystem->InjectInputForAction(Action, FInputActionValue(1.0f));
Subsystem->InjectInputVectorForAction(Action, FVector(1, 0, 0));

// Force rebuild after dynamic changes
Subsystem->RequestRebuildControlMappings(EInputMappingRebuildType::RebuildWithFlush);
```

### FModifyContextOptions

```cpp
struct FModifyContextOptions
{
    bool bIgnoreAllPressedKeysUntilRelease = true;  // avoid phantom inputs
    bool bForceImmediately = false;                  // skip deferred rebuild
};
```

### EInputMappingRebuildType

| Value | Description |
|-------|-------------|
| `Rebuild` | Remaps actions only, no trigger/modifier reset |
| `RebuildWithFlush` | Full reset and rebuild of all trigger/modifier data |
| `None` | No-op |

---

## UEnhancedInputComponent — Binding API

### BindAction Overloads

```cpp
// Value-based callback (most common)
EIC->BindAction(Action, ETriggerEvent::Triggered, Object, &Class::Func);
// Callback: void Func(const FInputActionValue& Value);

// Instance-based callback (elapsed time, trigger info)
EIC->BindAction(Action, ETriggerEvent::Triggered, Object, &Class::Func);
// Callback: void Func(const FInputActionInstance& Instance);

// No-param callback
EIC->BindAction(Action, ETriggerEvent::Started, Object, &Class::Func);
// Callback: void Func();

// UFUNCTION by name
EIC->BindAction(Action, ETriggerEvent::Triggered, Object, FName("FuncName"));
```

**Important:** `BindAction` does NOT hold a hard reference to `UInputAction*`. Store it in `UPROPERTY()` or it may be garbage collected.

### Other Methods

```cpp
EIC->ClearActionEventBindings();
EIC->ClearActionValueBindings();
FInputActionValue Val = EIC->GetBoundActionValue(Action); // poll current value
```

---

## UInputMappingContext — Programmatic API

```cpp
FEnhancedActionKeyMapping& Mapping = IMC->MapKey(Action, EKeys::W);
Mapping.Modifiers.Add(NewObject<UInputModifierSwizzleAxis>());

IMC->UnmapKey(Action, EKeys::W);
IMC->UnmapAllKeysFromAction(Action);
IMC->UnmapAll();
```

---

## Key Remapping

### UE 5.3+ (UEnhancedInputUserSettings)

1. Enable: Project Settings > Enhanced Input > User Settings > `Enable User Settings = true`
2. Mark mappings as player-mappable in IMC
3. Access: `Subsystem->GetUserSettings()`
4. Save: `SaveSettings()` writes `EnhancedInputUserSettings.sav`

### Pre-5.3 (UPlayerMappableInputConfig)

```cpp
UCLASS()
class UPlayerMappableInputConfig : public UPrimaryDataAsset
{
    FText ConfigDisplayName;
    TMap<TObjectPtr<UInputMappingContext>, int32> Contexts; // context → priority
    TArray<FEnhancedActionKeyMapping> GetPlayerMappableKeys() const;
};
```

---

## Project Settings (Enhanced Input Section)

| Setting | Description |
|---------|-------------|
| Default Mapping Contexts | IMCs applied automatically at game start |
| Enable Default Mapping Contexts | Toggle for auto-applying defaults |
| Should Only Trigger Last Action In Chord | Intermediate chord steps don't fire (default: enabled) |
| Dead Zone Lower/Upper Threshold | Global default dead zone values |
| Response Curve Exponent | Global default response curve (1.0 = linear) |
| FOV Scale / FOV Scaling Type | Global FOV scaling defaults |
| Trigger Default Values | Adjustable defaults for all trigger properties |
| Platform Settings | Per-platform IMC redirectors |

---

## Naming Conventions

| Asset Type | Prefix | Example |
|------------|--------|---------|
| Input Action | `IA_` | `IA_Move`, `IA_Look_Mouse` |
| Input Mapping Context | `IMC_` | `IMC_KBM_Default`, `IMC_Gamepad` |
| Player Mappable Config | `PMI_` | `PMI_VR` |
| Force Feedback Effect | `FFE_` | `FFE_Melee_Hit` |
| Custom Input Modifier | `IM_` | `IM_AimSensitivity` |
| Custom Input Trigger | `IT_` | `IT_DoubleTap` |

Recommended folder: `/Content/Framework/Input/[Actions|Contexts|Modifiers|Triggers]`

---

## Debugging

| Console Command | Shows |
|----------------|-------|
| `showdebug enhancedinput` | All active Input Actions with values, trigger states, active IMCs |
| `showdebug devices` | Connected input devices |

### Programmatic Input Injection (Testing)

```cpp
Subsystem->InjectInputForAction(IA_Move, FInputActionValue(FVector2D(1.0f, 0.0f)));
```
