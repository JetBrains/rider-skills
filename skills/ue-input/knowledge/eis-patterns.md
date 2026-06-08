# Enhanced Input System — Patterns & Recipes

Copy-paste C++ recipes for common Enhanced Input tasks. Each recipe is self-contained.

---

## Recipe 1: Basic Character Setup (Complete)

### Header (MyCharacter.h)
```cpp
#pragma once
#include "CoreMinimal.h"
#include "GameFramework/Character.h"
#include "InputActionValue.h"
#include "MyCharacter.generated.h"

class UInputMappingContext;
class UInputAction;

UCLASS()
class AMyCharacter : public ACharacter
{
    GENERATED_BODY()
public:
    UPROPERTY(EditDefaultsOnly, BlueprintReadOnly, Category = "Input")
    TObjectPtr<UInputMappingContext> DefaultMappingContext;

    UPROPERTY(EditDefaultsOnly, BlueprintReadOnly, Category = "Input")
    TObjectPtr<UInputAction> MoveAction;

    UPROPERTY(EditDefaultsOnly, BlueprintReadOnly, Category = "Input")
    TObjectPtr<UInputAction> LookAction;

    UPROPERTY(EditDefaultsOnly, BlueprintReadOnly, Category = "Input")
    TObjectPtr<UInputAction> JumpAction;

    UPROPERTY(EditDefaultsOnly, BlueprintReadOnly, Category = "Input")
    TObjectPtr<UInputAction> InteractAction;

protected:
    virtual void BeginPlay() override;
    virtual void SetupPlayerInputComponent(UInputComponent* PlayerInputComponent) override;

private:
    void Move(const FInputActionValue& Value);
    void Look(const FInputActionValue& Value);
    void StartInteract();
    void StopInteract();
};
```

### Implementation (MyCharacter.cpp)
```cpp
#include "MyCharacter.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"

void AMyCharacter::BeginPlay()
{
    Super::BeginPlay();

    // Safe in BeginPlay because we access via Controller (already possessed)
    if (APlayerController* PC = Cast<APlayerController>(Controller))
    {
        if (UEnhancedInputLocalPlayerSubsystem* Subsystem =
            ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(
                PC->GetLocalPlayer()))
        {
            Subsystem->AddMappingContext(DefaultMappingContext, 0);
        }
    }
}

void AMyCharacter::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
    Super::SetupPlayerInputComponent(PlayerInputComponent);

    UEnhancedInputComponent* EIC = CastChecked<UEnhancedInputComponent>(PlayerInputComponent);

    EIC->BindAction(MoveAction, ETriggerEvent::Triggered, this, &AMyCharacter::Move);
    EIC->BindAction(LookAction, ETriggerEvent::Triggered, this, &AMyCharacter::Look);
    EIC->BindAction(JumpAction, ETriggerEvent::Started, this, &ACharacter::Jump);
    EIC->BindAction(JumpAction, ETriggerEvent::Completed, this, &ACharacter::StopJumping);
    EIC->BindAction(InteractAction, ETriggerEvent::Started, this, &AMyCharacter::StartInteract);
    EIC->BindAction(InteractAction, ETriggerEvent::Completed, this, &AMyCharacter::StopInteract);
}

void AMyCharacter::Move(const FInputActionValue& Value)
{
    FVector2D MoveVector = Value.Get<FVector2D>();
    const FRotator Rotation = Controller->GetControlRotation();
    const FRotator YawRotation(0, Rotation.Yaw, 0);

    const FVector ForwardDir = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
    const FVector RightDir = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);

    AddMovementInput(ForwardDir, MoveVector.Y);
    AddMovementInput(RightDir, MoveVector.X);
}

void AMyCharacter::Look(const FInputActionValue& Value)
{
    FVector2D LookVector = Value.Get<FVector2D>();
    AddControllerYawInput(LookVector.X);
    AddControllerPitchInput(LookVector.Y);
}

void AMyCharacter::StartInteract() { /* begin interaction */ }
void AMyCharacter::StopInteract() { /* end interaction */ }
```

---

## Recipe 2: WASD + Gamepad Mapping (IMC Configuration)

### Modifier Pattern for Axis2D Move Action

| Key | Modifiers | Result |
|-----|-----------|--------|
| W | Swizzle (YXZ) | (0, +1) → forward |
| S | Negate(Y only) + Swizzle (YXZ) | (0, -1) → backward |
| A | Negate(X only) | (-1, 0) → left |
| D | (none) | (+1, 0) → right |
| Gamepad Left Stick | (none) | Native 2D |

### Pure C++ IMC Setup (No Data Assets)

```cpp
UInputAction* MoveAction = NewObject<UInputAction>();
MoveAction->ValueType = EInputActionValueType::Axis2D;

UInputMappingContext* IMC = NewObject<UInputMappingContext>();

// W = forward (+Y)
UInputModifierSwizzleAxis* SwizzleYXZ = NewObject<UInputModifierSwizzleAxis>();
SwizzleYXZ->Order = EInputAxisSwizzle::YXZ;

FEnhancedActionKeyMapping& WMapping = IMC->MapKey(MoveAction, EKeys::W);
WMapping.Modifiers.Add(SwizzleYXZ);

// S = backward (-Y)
UInputModifierNegate* NegateAll = NewObject<UInputModifierNegate>();
UInputModifierSwizzleAxis* SwizzleYXZ2 = NewObject<UInputModifierSwizzleAxis>();
SwizzleYXZ2->Order = EInputAxisSwizzle::YXZ;

FEnhancedActionKeyMapping& SMapping = IMC->MapKey(MoveAction, EKeys::S);
SMapping.Modifiers.Add(NegateAll);
SMapping.Modifiers.Add(SwizzleYXZ2);

// A = left (-X)
UInputModifierNegate* NegateX = NewObject<UInputModifierNegate>();

FEnhancedActionKeyMapping& AMapping = IMC->MapKey(MoveAction, EKeys::A);
AMapping.Modifiers.Add(NegateX);

// D = right (+X) — no modifiers needed
IMC->MapKey(MoveAction, EKeys::D);

// Gamepad left stick — native 2D, no modifiers
IMC->MapKey(MoveAction, EKeys::Gamepad_Left2D);
```

---

## Recipe 3: Context Switching (Vehicle Enter/Exit)

```cpp
UCLASS()
class AMyCharacter : public ACharacter
{
    UPROPERTY(EditDefaultsOnly, Category = "Input")
    TObjectPtr<UInputMappingContext> IMC_OnFoot;

    UPROPERTY(EditDefaultsOnly, Category = "Input")
    TObjectPtr<UInputMappingContext> IMC_Vehicle;

    UPROPERTY(EditDefaultsOnly, Category = "Input")
    TObjectPtr<UInputMappingContext> IMC_VehicleOverlay; // shared actions (exit, pause)

    void EnterVehicle();
    void ExitVehicle();

private:
    UEnhancedInputLocalPlayerSubsystem* GetInputSubsystem() const;
};

UEnhancedInputLocalPlayerSubsystem* AMyCharacter::GetInputSubsystem() const
{
    if (APlayerController* PC = Cast<APlayerController>(Controller))
    {
        return ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(
            PC->GetLocalPlayer());
    }
    return nullptr;
}

void AMyCharacter::EnterVehicle()
{
    if (UEnhancedInputLocalPlayerSubsystem* Subsystem = GetInputSubsystem())
    {
        // Flush to prevent stuck keys
        if (APlayerController* PC = Cast<APlayerController>(Controller))
        {
            PC->FlushPressedKeys();
        }

        Subsystem->RemoveMappingContext(IMC_OnFoot);
        Subsystem->AddMappingContext(IMC_Vehicle, 0);
        Subsystem->AddMappingContext(IMC_VehicleOverlay, 1); // higher priority overlay
    }
}

void AMyCharacter::ExitVehicle()
{
    if (UEnhancedInputLocalPlayerSubsystem* Subsystem = GetInputSubsystem())
    {
        if (APlayerController* PC = Cast<APlayerController>(Controller))
        {
            PC->FlushPressedKeys();
        }

        Subsystem->RemoveMappingContext(IMC_Vehicle);
        Subsystem->RemoveMappingContext(IMC_VehicleOverlay);
        Subsystem->AddMappingContext(IMC_OnFoot, 0);
    }
}
```

---

## Recipe 4: Chord Action (Shift+Attack = Sprint Attack)

### Setup

```
IA_Sprint      — Boolean, bound to Left Shift
IA_LightAttack — Boolean, bound to Left Mouse
IA_SprintAttack — Boolean, bound to Left Mouse + ChordAction(IA_Sprint)
```

### In IMC Configuration

1. **IA_Sprint** → Left Shift (no special triggers)
2. **IA_SprintAttack** → Left Mouse + add `UInputTriggerChordAction` with `ChordAction = IA_Sprint`
3. **IA_LightAttack** → Left Mouse + add `UInputTriggerChordBlocker` with `ChordAction = IA_Sprint`

The ChordBlocker on IA_LightAttack prevents it from firing when Shift is held. The ChordAction on IA_SprintAttack ensures it only fires when IA_Sprint is active.

### C++ Binding

```cpp
// Both bound to Started — chord system handles which fires
EIC->BindAction(SprintAction, ETriggerEvent::Started, this, &AMyChar::StartSprint);
EIC->BindAction(SprintAction, ETriggerEvent::Completed, this, &AMyChar::StopSprint);
EIC->BindAction(LightAttackAction, ETriggerEvent::Started, this, &AMyChar::LightAttack);
EIC->BindAction(SprintAttackAction, ETriggerEvent::Started, this, &AMyChar::SprintAttack);
```

---

## Recipe 5: Hold Action (Interact vs. Hold-to-Pick-Up)

### Tap = Interact, Hold = Pick Up (Same Key)

```
IA_Interact — Boolean, bound to E, Trigger: Tap (TapReleaseTimeThreshold = 0.3s)
IA_PickUp   — Boolean, bound to E, Trigger: Hold (HoldTimeThreshold = 0.8s, bIsOneShot = true)
```

### C++ Binding

```cpp
EIC->BindAction(InteractAction, ETriggerEvent::Triggered, this, &AMyChar::Interact);
EIC->BindAction(PickUpAction, ETriggerEvent::Triggered, this, &AMyChar::PickUp);

// Optional: show progress during hold
EIC->BindAction(PickUpAction, ETriggerEvent::Ongoing, this, &AMyChar::ShowHoldProgress);
EIC->BindAction(PickUpAction, ETriggerEvent::Canceled, this, &AMyChar::HideHoldProgress);
```

---

## Recipe 6: Sequential Combo (UE 5.4+)

### Using UInputTriggerCombo

```
IA_LightAttack — Boolean, bound to Left Mouse
IA_HeavyAttack — Boolean, bound to Right Mouse
IA_SpecialCombo — Boolean, Trigger: Combo
  Step 0: IA_LightAttack (Triggered)
  Step 1: IA_LightAttack (Triggered)
  Step 2: IA_HeavyAttack (Triggered)
  InputCancelTimeout: 0.5s
```

### C++ Setup

```cpp
// Create combo trigger programmatically
UInputTriggerCombo* ComboTrigger = NewObject<UInputTriggerCombo>();

FInputComboStepData Step0;
Step0.ComboStepAction = LightAttackAction;
Step0.ComboStepCompletionEvent = ETriggerEvent::Triggered;

FInputComboStepData Step1;
Step1.ComboStepAction = LightAttackAction;
Step1.ComboStepCompletionEvent = ETriggerEvent::Triggered;

FInputComboStepData Step2;
Step2.ComboStepAction = HeavyAttackAction;
Step2.ComboStepCompletionEvent = ETriggerEvent::Triggered;

ComboTrigger->ComboActions = { Step0, Step1, Step2 };
ComboTrigger->InputCancelTimeout = 0.5f;

SpecialComboAction->Triggers.Add(ComboTrigger);
```

---

## Recipe 7: Custom Modifier (Aim Sensitivity)

```cpp
UCLASS(EditInlineNew, meta = (DisplayName = "Aim Sensitivity"))
class UIM_AimSensitivity : public UInputModifier
{
    GENERATED_BODY()
public:
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Settings")
    float HipFireSensitivity = 1.0f;

    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Settings")
    float AimDownSightsSensitivity = 0.5f;

protected:
    virtual FInputActionValue ModifyRaw_Implementation(
        const UEnhancedPlayerInput* PlayerInput,
        FInputActionValue CurrentValue,
        float DeltaTime) override
    {
        // Determine if ADS is active (check via gameplay tag, bool, etc.)
        float Sensitivity = bIsAiming ? AimDownSightsSensitivity : HipFireSensitivity;

        FVector Value = CurrentValue.Get<FVector>();
        Value *= Sensitivity;
        return FInputActionValue(CurrentValue.GetValueType(), Value);
    }
};
```

---

## Recipe 8: Custom Trigger (Double Tap)

```cpp
UCLASS(EditInlineNew, meta = (DisplayName = "Double Tap"))
class UIT_DoubleTap : public UInputTrigger
{
    GENERATED_BODY()
public:
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Trigger Settings")
    float MaxTimeBetweenTaps = 0.3f;

private:
    float LastTapTime = -1.0f;
    bool bFirstTapDone = false;

protected:
    virtual ETriggerType GetTriggerType_Implementation() const override
    {
        return ETriggerType::Explicit;
    }

    virtual ETriggerState UpdateState_Implementation(
        const UEnhancedPlayerInput* PlayerInput,
        FInputActionValue ModifiedValue,
        float DeltaTime) override
    {
        bool bActuated = IsActuated(ModifiedValue);

        if (bActuated && !bWasActuated)
        {
            // Rising edge (press)
            float CurrentTime = GetWorld()->GetTimeSeconds();
            if (bFirstTapDone && (CurrentTime - LastTapTime) <= MaxTimeBetweenTaps)
            {
                bFirstTapDone = false;
                bWasActuated = bActuated;
                return ETriggerState::Triggered; // Double tap!
            }
            else
            {
                bFirstTapDone = true;
                LastTapTime = CurrentTime;
            }
        }
        else if (!bActuated && bFirstTapDone)
        {
            // Check timeout
            float CurrentTime = GetWorld()->GetTimeSeconds();
            if ((CurrentTime - LastTapTime) > MaxTimeBetweenTaps)
            {
                bFirstTapDone = false;
            }
        }

        bWasActuated = bActuated;
        return bFirstTapDone ? ETriggerState::Ongoing : ETriggerState::None;
    }

    bool bWasActuated = false;
};
```

---

## Recipe 9: CommonUI Integration

### Widget with Input Config

```cpp
UCLASS()
class UMyMenuWidget : public UCommonActivatableWidget
{
    GENERATED_BODY()
public:
    virtual FUIInputConfig GetDesiredInputConfig() const override
    {
        // Menu mode: UI receives input, mouse visible, no capture
        return FUIInputConfig(ECommonInputMode::Menu, EMouseCaptureMode::NoCapture);
    }
};
```

### Game+UI Mode (e.g., inventory overlay)

```cpp
virtual FUIInputConfig GetDesiredInputConfig() const override
{
    // Both game and UI receive input
    return FUIInputConfig(ECommonInputMode::All, EMouseCaptureMode::CaptureDuringMouseDown);
}
```

### Input Device Detection

```cpp
void AMyPlayerController::DetectInputDevice()
{
    if (ULocalPlayer* LP = GetLocalPlayer())
    {
        if (UCommonInputSubsystem* CIS = LP->GetSubsystem<UCommonInputSubsystem>())
        {
            ECommonInputType InputType = CIS->GetCurrentInputType();
            // ECommonInputType::MouseAndKeyboard, Gamepad, Touch

            CIS->OnInputMethodChangedNative.AddUObject(
                this, &AMyPlayerController::OnInputMethodChanged);
        }
    }
}

void AMyPlayerController::OnInputMethodChanged(ECommonInputType NewInputType)
{
    // Swap UI button prompts, show/hide cursor, etc.
}
```

---

## Recipe 10: GAS + Enhanced Input Binding

### Ability Input Data Asset

```cpp
USTRUCT(BlueprintType)
struct FAbilityInputBinding
{
    GENERATED_BODY()

    UPROPERTY(EditDefaultsOnly)
    TSoftClassPtr<UGameplayAbility> AbilityClass;

    UPROPERTY(EditDefaultsOnly)
    TObjectPtr<UInputAction> InputAction;
};

UCLASS()
class UAbilityInputConfig : public UDataAsset
{
    GENERATED_BODY()
public:
    UPROPERTY(EditDefaultsOnly)
    TArray<FAbilityInputBinding> Abilities;
};
```

### Binding Abilities to Input

```cpp
void AMyCharacter::BindAbilityInput(UEnhancedInputComponent* EIC)
{
    if (!AbilityInputConfig || !AbilitySystemComponent) return;

    for (int32 i = 0; i < AbilityInputConfig->Abilities.Num(); ++i)
    {
        const FAbilityInputBinding& Binding = AbilityInputConfig->Abilities[i];
        if (!Binding.InputAction) continue;

        int32 InputID = i + 1; // 0 is reserved

        EIC->BindAction(Binding.InputAction, ETriggerEvent::Started, this,
            &AMyCharacter::OnAbilityInputPressed, InputID);
        EIC->BindAction(Binding.InputAction, ETriggerEvent::Completed, this,
            &AMyCharacter::OnAbilityInputReleased, InputID);
    }
}

void AMyCharacter::OnAbilityInputPressed(int32 InputID)
{
    AbilitySystemComponent->AbilityLocalInputPressed(InputID);
}

void AMyCharacter::OnAbilityInputReleased(int32 InputID)
{
    AbilitySystemComponent->AbilityLocalInputReleased(InputID);
}
```

---

## Recipe 11: Input Data Asset (Scalable Pattern)

### For projects with many actions, centralize references:

```cpp
UCLASS()
class UInputDataConfig : public UDataAsset
{
    GENERATED_BODY()
public:
    UPROPERTY(EditDefaultsOnly, BlueprintReadOnly, Category = "Movement")
    TObjectPtr<UInputAction> Move;

    UPROPERTY(EditDefaultsOnly, BlueprintReadOnly, Category = "Movement")
    TObjectPtr<UInputAction> Look;

    UPROPERTY(EditDefaultsOnly, BlueprintReadOnly, Category = "Movement")
    TObjectPtr<UInputAction> Jump;

    UPROPERTY(EditDefaultsOnly, BlueprintReadOnly, Category = "Combat")
    TObjectPtr<UInputAction> LightAttack;

    UPROPERTY(EditDefaultsOnly, BlueprintReadOnly, Category = "Combat")
    TObjectPtr<UInputAction> HeavyAttack;

    UPROPERTY(EditDefaultsOnly, BlueprintReadOnly, Category = "Combat")
    TObjectPtr<UInputAction> Block;

    UPROPERTY(EditDefaultsOnly, BlueprintReadOnly, Category = "Interaction")
    TObjectPtr<UInputAction> Interact;

    UPROPERTY(EditDefaultsOnly, BlueprintReadOnly, Category = "Interaction")
    TObjectPtr<UInputAction> ToggleInventory;
};
```

### Usage:

```cpp
UPROPERTY(EditDefaultsOnly, Category = "Input")
TObjectPtr<UInputDataConfig> InputActions;

void AMyCharacter::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
    if (!InputActions) return;
    UEnhancedInputComponent* EIC = CastChecked<UEnhancedInputComponent>(PlayerInputComponent);
    EIC->BindAction(InputActions->Move, ETriggerEvent::Triggered, this, &AMyCharacter::Move);
    EIC->BindAction(InputActions->Jump, ETriggerEvent::Started, this, &ACharacter::Jump);
    // ...
}
```

---

## Recipe 12: PlayerController Setup (Alternative to Character)

```cpp
void AMyPlayerController::SetupInputComponent()
{
    Super::SetupInputComponent();

    // Safe in PlayerController — exists before possession
    if (ULocalPlayer* LP = GetLocalPlayer())
    {
        if (UEnhancedInputLocalPlayerSubsystem* Subsystem =
            LP->GetSubsystem<UEnhancedInputLocalPlayerSubsystem>())
        {
            Subsystem->AddMappingContext(DefaultIMC, 0);
        }
    }

    UEnhancedInputComponent* EIC = Cast<UEnhancedInputComponent>(InputComponent);
    if (EIC)
    {
        EIC->BindAction(MoveAction, ETriggerEvent::Triggered, this, &AMyPC::OnMove);
    }
}

void AMyPC::OnMove(const FInputActionInstance& Instance)
{
    FVector2D Value = Instance.GetValue().Get<FVector2D>();
    float Elapsed = Instance.GetElapsedTime();
    // Route to possessed pawn...
}
```

---

## Recipe 13: Gamepad Detection and UI Prompt Switching

### Using OnInputHardwareDeviceChanged

```cpp
void AMyPlayerController::BeginPlay()
{
    Super::BeginPlay();
    OnInputHardwareDeviceChanged.AddDynamic(this, &AMyPC::HandleDeviceSwitch);
}

void AMyPC::HandleDeviceSwitch(const FInputDeviceId InDeviceId,
                                const FHardwareDeviceIdentifier& InDevice)
{
    bool bIsGamepad = InDevice.PrimaryDeviceType == EHardwareDevicePrimaryType::Gamepad;
    OnInputDeviceChanged.Broadcast(bIsGamepad); // notify UI
}
```

### Using CommonInputSubsystem

```cpp
UCommonInputSubsystem* CIS = LP->GetSubsystem<UCommonInputSubsystem>();
ECommonInputType Type = CIS->GetCurrentInputType();
bool bGamepad = (Type == ECommonInputType::Gamepad);
```

---

## Recipe 14: Frame-Rate Independent Continuous Input

For movement or camera that should be consistent regardless of frame rate:

### Option A: ScaleByDeltaTime Modifier

Add `UInputModifierScaleByDeltaTime` to the mapping. Input value is multiplied by DeltaTime automatically.

### Option B: Manual in Callback

```cpp
void AMyCharacter::Move(const FInputActionValue& Value)
{
    FVector2D MoveVector = Value.Get<FVector2D>();
    float DeltaTime = GetWorld()->GetDeltaSeconds();
    AddMovementInput(ForwardDir, MoveVector.Y * MoveSpeed * DeltaTime);
}
```

**Note:** `AddMovementInput` already handles DeltaTime internally via CharacterMovementComponent, so Option A is usually NOT needed for movement. It IS needed for direct camera rotation or custom movement.

---

## Recipe 15: Platform-Specific Contexts

```cpp
void AMyCharacter::SetupPlatformInput()
{
    UEnhancedInputLocalPlayerSubsystem* Subsystem = GetInputSubsystem();
    if (!Subsystem) return;

#if PLATFORM_IOS || PLATFORM_ANDROID
    Subsystem->AddMappingContext(IMC_Mobile, 0);
#else
    Subsystem->AddMappingContext(IMC_Desktop, 0);
    // Optionally detect gamepad and add overlay
    Subsystem->AddMappingContext(IMC_GamepadOverlay, 1);
#endif
}
```

---

## Context Organization Cheat Sheet

| Context | Priority | Use Case |
|---------|----------|----------|
| `IMC_Default` / `IMC_OnFoot` | 0 | Base movement, camera, interaction |
| `IMC_Combat` | 0 | Weapon controls (swap with OnFoot) |
| `IMC_Vehicle` | 0 | Vehicle controls (swap with OnFoot) |
| `IMC_SharedActions` | 1 | Pause, exit vehicle (overlay, always active) |
| `IMC_AbilityOverlay` | 1 | Ability-specific inputs (stacked on base) |
| `IMC_UI` | 2 | Menu/widget navigation (highest priority) |
| `IMC_Spectator` | 0 | Fly camera (swap with OnFoot) |
| `IMC_Mobile` | 0 | Touch-specific (platform swap) |
