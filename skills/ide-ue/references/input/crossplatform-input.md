# Cross-Platform Input Patterns

## Input Config Data Asset (Tag-Based Binding)

A data asset that maps Input Actions to Gameplay Tags, enabling data-driven ability binding without hardcoded action references.

### Structure

```cpp
USTRUCT(BlueprintType)
struct FTaggedInputAction
{
    GENERATED_BODY()

    UPROPERTY(EditDefaultsOnly, BlueprintReadOnly)
    TObjectPtr<const UInputAction> InputAction = nullptr;

    UPROPERTY(EditDefaultsOnly, BlueprintReadOnly, Meta = (Categories = "InputTag"))
    FGameplayTag InputTag;
};

UCLASS(BlueprintType, Const)
class UMyInputConfig : public UDataAsset
{
    GENERATED_BODY()
public:
    // Actions bound manually in C++ (Move, Look)
    UPROPERTY(EditDefaultsOnly, BlueprintReadOnly)
    TArray<FTaggedInputAction> NativeInputActions;

    // Actions auto-bound to GAS abilities via tag matching
    UPROPERTY(EditDefaultsOnly, BlueprintReadOnly)
    TArray<FTaggedInputAction> AbilityInputActions;

    const UInputAction* FindNativeActionForTag(const FGameplayTag& Tag) const;
    const UInputAction* FindAbilityActionForTag(const FGameplayTag& Tag) const;
};
```

### Benefits
- **Data-driven**: Add new ability bindings without C++ changes
- **Composable**: GameFeature plugins add their own InputConfig assets
- **Tag-based ability activation**: ASC activates abilities matching the input tag
- **Separation of concerns**: Input system knows nothing about abilities, only tags

### Binding Flow
1. InputConfig maps `IA_Weapon_Fire` → `InputTag.Weapon.Fire`
2. Hero component binds ability actions: Triggered → `OnAbilityInputPressed(Tag)`, Completed → `OnAbilityInputReleased(Tag)`
3. Pressed callback passes tag to `AbilitySystemComponent`
4. ASC activates abilities with matching `ActivationTag`

---

## Separate Look Actions per Device

Split mouse and gamepad look into separate Input Actions to allow different modifier chains:

| Action | Device | Modifiers |
|--------|--------|-----------|
| `IA_Look_Mouse` | Mouse XY | Sensitivity scalar only |
| `IA_Look_Stick` | Right stick | DeadZone → Sensitivity → AimInversion → Response curve |

**Why**: Mouse and stick have fundamentally different input characteristics. Mouse provides delta values (pixels moved), stick provides continuous direction values. Combining them in one action forces compromises in the modifier chain.

### IMC Organization
```
IMC_Default (Priority 0)
  IA_Move         → WASD (Negate/Swizzle), Left Stick
  IA_Look_Mouse   → Mouse XY (sensitivity scalar)
  IA_Look_Stick   → Right Stick (deadzone, sensitivity, inversion)
  IA_Jump         → Space, Gamepad FaceButton_Bottom

IMC_ShooterGame (Priority 0, added by GameFeature)
  IA_Weapon_Fire  → Left Mouse, Right Trigger
  IA_ADS          → Right Mouse, Left Trigger
  IA_Reload       → R, Gamepad FaceButton_Left

IMC_ShooterGame_KBM (Priority 1, KBM-specific overrides)
  IA_QuickSlot1   → 1
  IA_QuickSlot2   → 2
  IA_QuickSlot3   → 3
```

---

## Custom Input Modifiers for Cross-Platform

### Settings-Driven Dead Zone

```cpp
UCLASS()
class UMyDeadZoneModifier : public UInputModifier
{
    GENERATED_BODY()
public:
    UPROPERTY(EditAnywhere)
    EDeadzoneStick StickType = EDeadzoneStick::MoveStick;

protected:
    virtual FInputActionValue ModifyRaw_Implementation(
        const UEnhancedPlayerInput* Input,
        FInputActionValue CurrentValue,
        float DeltaTime) override
    {
        // Read dead zone from user settings
        auto* Settings = GetPlayerSettings(Input);
        float DeadZone = (StickType == EDeadzoneStick::MoveStick)
            ? Settings->GetMoveDeadZone()
            : Settings->GetLookDeadZone();

        // Apply radial dead zone
        FVector2D Value = CurrentValue.Get<FVector2D>();
        float Magnitude = Value.Size();
        if (Magnitude < DeadZone) return FInputActionValue(FVector2D::ZeroVector);

        // Remap [DeadZone, 1.0] → [0.0, 1.0]
        float Remapped = (Magnitude - DeadZone) / (1.0f - DeadZone);
        return FInputActionValue(Value.GetSafeNormal() * Remapped);
    }
};
```

### Gamepad Sensitivity by Targeting State

```cpp
UCLASS()
class UGamepadSensitivityModifier : public UInputModifier
{
    GENERATED_BODY()
public:
    UPROPERTY(EditAnywhere)
    ETargetingType TargetingType = ETargetingType::Normal;

    // Data asset mapping sensitivity enum → float scalar
    UPROPERTY(EditAnywhere)
    TObjectPtr<UAimSensitivityData> SensitivityData;

protected:
    virtual FInputActionValue ModifyRaw_Implementation(...) override
    {
        auto* Settings = GetPlayerSettings(Input);
        EGamepadSensitivity Level = (TargetingType == ETargetingType::Normal)
            ? Settings->GetGamepadLookSensitivity()
            : Settings->GetGamepadTargetingSensitivity();

        float Scalar = SensitivityData->SensitivityForLevel(Level);
        return CurrentValue * Scalar;
    }
};
```

### Aim Inversion

```cpp
UCLASS()
class UAimInversionModifier : public UInputModifier
{
    GENERATED_BODY()
protected:
    virtual FInputActionValue ModifyRaw_Implementation(...) override
    {
        auto* Settings = GetPlayerSettings(Input);
        FVector2D Value = CurrentValue.Get<FVector2D>();

        if (Settings->GetInvertVerticalAxis())
            Value.Y *= -1.0f;
        if (Settings->GetInvertHorizontalAxis())
            Value.X *= -1.0f;

        return FInputActionValue(Value);
    }
};
```

---

## Context Switching with ADS Example

ADS (Aim Down Sights) temporarily modifies look sensitivity by stacking a higher-priority IMC:

```
Normal gameplay:
  IMC_Default (Priority 0) → IA_Look_Stick with Normal sensitivity modifier

ADS active:
  IMC_Default (Priority 0) → IA_Look_Stick with Normal sensitivity modifier
  IMC_ADS_Speed (Priority 1) → IA_Look_Stick with ADS sensitivity modifier (OVERRIDES)
```

```cpp
// In ADS ability
void UAbility_ADS::OnActivate()
{
    auto* Subsystem = GetEnhancedInputSubsystem();
    Subsystem->AddMappingContext(IMC_ADS_Speed, /*Priority*/ 1);
}

void UAbility_ADS::OnDeactivate()
{
    auto* Subsystem = GetEnhancedInputSubsystem();
    Subsystem->RemoveMappingContext(IMC_ADS_Speed);
}
```

---

## Touch Input (Mobile)

### Simulated Input Widget Pattern

A UMG widget that injects input actions when touched, enabling virtual joystick and button overlays:

```cpp
UCLASS()
class USimulatedInputWidget : public UCommonUserWidget
{
    GENERATED_BODY()
public:
    // The input action to simulate when this widget receives touch
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Input")
    TObjectPtr<UInputAction> AssociatedInputAction;

    // Fallback key if no binding found
    UPROPERTY(EditAnywhere, Category = "Input")
    FKey FallbackBindingKey = EKeys::Gamepad_Right2D;

    // Inject input value
    UFUNCTION(BlueprintCallable)
    void InputKeyValue(FVector2D Value);

    UFUNCTION(BlueprintCallable)
    void FlushSimulatedInput();
};
```

### Touch Region Widget

Tracks touch start/move/end and simulates continuous key input:

```cpp
UCLASS()
class UTouchRegion : public USimulatedInputWidget
{
    GENERATED_BODY()
protected:
    virtual FReply NativeOnTouchStarted(const FGeometry& Geometry,
        const FPointerEvent& Event) override;
    virtual FReply NativeOnTouchMoved(const FGeometry& Geometry,
        const FPointerEvent& Event) override;
    virtual FReply NativeOnTouchEnded(const FGeometry& Geometry,
        const FPointerEvent& Event) override;
};
```

### Android-Specific Config

`Config/Android/AndroidInput.ini`:
```ini
[InputPlatformSettings_Android InputPlatformSettings]
input.DeviceMappingPolicy=1
```

---

## Platform-Specific Dead Zone Defaults

`DefaultInput.ini`:
```ini
[/Script/Engine.InputSettings]
+AxisConfig=(AxisKeyName="Gamepad_LeftX",  AxisProperties=(DeadZone=0.25, Sensitivity=1.0))
+AxisConfig=(AxisKeyName="Gamepad_LeftY",  AxisProperties=(DeadZone=0.25, Sensitivity=1.0))
+AxisConfig=(AxisKeyName="Gamepad_RightX", AxisProperties=(DeadZone=0.25, Sensitivity=1.0))
+AxisConfig=(AxisKeyName="Gamepad_RightY", AxisProperties=(DeadZone=0.25, Sensitivity=1.0))
+AxisConfig=(AxisKeyName="MouseX",         AxisProperties=(DeadZone=0.0, Sensitivity=0.07))
+AxisConfig=(AxisKeyName="MouseY",         AxisProperties=(DeadZone=0.0, Sensitivity=0.07))
```

---

## GameFeature Input Registration

GameFeature plugins add input dynamically via two actions:

### GameFeatureAction_AddInputContextMapping

Adds IMCs when the GameFeature activates:

```cpp
struct FInputMappingContextAndPriority
{
    UPROPERTY(EditAnywhere)
    TSoftObjectPtr<UInputMappingContext> InputMapping;

    UPROPERTY(EditAnywhere)
    int32 Priority = 0;

    // Register with settings for player remapping UI
    UPROPERTY(EditAnywhere)
    bool bRegisterWithSettings = true;
};
```

**Lifecycle**:
1. `OnGameFeatureRegistering()` → register contexts with settings system (for remapping)
2. `OnGameFeatureActivating()` → hook into player controller extensions
3. On player ready → `Subsystem->AddMappingContext(IMC, Priority)`
4. `OnGameFeatureDeactivating()` → remove contexts from all active players
5. `OnGameFeatureUnregistering()` → unregister from settings

### GameFeatureAction_AddInputBinding

Adds InputConfig data assets to pawns for ability-triggered inputs:

1. Listens for pawn extension events
2. On hero component ready → `HeroComponent->AddAdditionalInputConfig(InputConfig)`
3. Hero component binds pressed/released callbacks for ability activation

---

## CommonUI Input Integration

### Config in DefaultInput.ini

```ini
[/Script/CommonUI.CommonUIInputSettings]
bLinkCursorToGamepadFocus=True
UIActionProcessingPriority=10000
+InputActions=(ActionTag=UI.Action.Escape,
              KeyMappings=((Key=Escape),(Key=Gamepad_Special_Right)))

[/Script/EnhancedInput.EnhancedInputDeveloperSettings]
bEnableUserSettings=True
UserSettingsClass=/Script/MyGame.MyInputUserSettings
DefaultPlayerMappableKeyProfileClass=/Script/MyGame.MyPlayerMappableKeyProfile
```

### Action Widget (Dynamic Key Icons)

Bridges CommonUI with Enhanced Input to display correct key icons:

```cpp
UCLASS()
class UMyActionWidget : public UCommonActionWidget
{
    GENERATED_BODY()
public:
    UPROPERTY(EditAnywhere, BlueprintReadOnly)
    TObjectPtr<UInputAction> AssociatedInputAction;

    virtual FSlateBrush GetIcon() const override
    {
        // Query EnhancedInputLocalPlayerSubsystem for current key bound to this action
        // Return platform-appropriate icon
    }
};
```

### Input Type Detection

```cpp
// Query current input device type
bool bIsGamepad = CommonInputSubsystem->GetCurrentInputType() == ECommonInputType::Gamepad;

// CommonUIExtensions helpers (from widget context)
ECommonInputType Type = UCommonUIExtensions::GetOwningPlayerInputType(Widget);
bool bTouch = UCommonUIExtensions::IsOwningPlayerUsingTouch(Widget);
bool bGamepad = UCommonUIExtensions::IsOwningPlayerUsingGamepad(Widget);
```

---

## Player Key Remapping (UE 5.3+)

### Setup

```ini
[/Script/EnhancedInput.EnhancedInputDeveloperSettings]
bEnableUserSettings=True
UserSettingsClass=/Script/MyGame.MyInputUserSettings
DefaultPlayerMappableKeyProfileClass=/Script/MyGame.MyKeyProfile
```

### Custom Profile

```cpp
UCLASS()
class UMyKeyProfile : public UEnhancedPlayerMappableKeyProfile
{
    GENERATED_BODY()
    // Handles equip/unequip of custom key bindings
    // Cloud-saveable profile system
};

UCLASS()
class UMyInputUserSettings : public UEnhancedInputUserSettings
{
    GENERATED_BODY()
    // Custom input settings that serialize with cloud saves
};
```

### Per-Action Settings

```cpp
UCLASS()
class UMyMappableKeySettings : public UPlayerMappableKeySettings
{
    GENERATED_BODY()

    UPROPERTY(EditAnywhere)
    FText TooltipText;  // Displayed in settings UI
};
```

---

## Asset Organization Pattern

```
Content/Input/
  Actions/
    IA_Move.uasset
    IA_Look_Mouse.uasset
    IA_Look_Stick.uasset
    IA_Jump.uasset
    IA_Crouch.uasset
    IA_AutoRun.uasset
  Mappings/
    IMC_Default.uasset
    InputData_Hero.uasset        # InputConfig data asset
    InputData_SimplePawn.uasset
  Settings/
    AimSensitivity_Normal.uasset # Sensitivity data asset

Plugins/GameFeatures/MyFeature/Content/Input/
  Actions/
    IA_Weapon_Fire.uasset
    IA_ADS.uasset
    IA_Reload.uasset
  Mappings/
    IMC_MyFeature.uasset
    IMC_MyFeature_KBM.uasset     # KBM-specific overrides
    IMC_ADS_Speed.uasset         # ADS sensitivity override
    InputData_MyFeature.uasset   # Feature-specific InputConfig
  Settings/
    AimSensitivity_ADS.uasset
```

### Naming Conventions

| Prefix | Asset Type | Example |
|--------|-----------|---------|
| `IA_` | Input Action | `IA_Move`, `IA_Weapon_Fire` |
| `IMC_` | Input Mapping Context | `IMC_Default`, `IMC_Vehicle` |
| `InputData_` | Input Config (tag mapping) | `InputData_Hero` |

---

## Input Initialization Order

Deferred binding ensures all systems are ready before input hooks up:

1. **PlayerController::BeginPlay** — safe to register base IMC here
2. **Pawn::OnPossessed** — safe to add pawn-specific IMC (NOT BeginPlay)
3. **Hero Component Init** — coordinates with PawnExtension, ASC setup
4. **BindInputsNow event** — fires when all dependencies ready, binds ability actions
5. **GameFeature activation** — adds additional IMCs and InputConfigs dynamically

**Key rule**: `bReadyToBindInputs` flag gates additional input configs. Only add configs after this flag is true.
