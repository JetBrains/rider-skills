# Common UI Patterns and Recipes

## HUD Overlay with Data Binding

A persistent in-game HUD showing health, ammo, and objective info.

### Architecture
```
AMyHUD (AHUD subclass)
  └── UHUDWidget (UUserWidget)
        ├── UHealthBarWidget (nested UUserWidget)
        ├── UAmmoCounterWidget
        ├── UMinimapWidget
        └── UObjectiveTrackerWidget
```

### Preferred: MVVM FieldNotify Approach
The HUD widget binds to a ViewModel in the Widget Blueprint's View Bindings panel. No `->SetText()` or `->SetPercent()` calls in C++.

```cpp
// ViewModel — created and updated by game logic (e.g., PlayerState or HUD component)
UCLASS()
class UHUDViewModel : public UMVVMViewModelBase
{
    GENERATED_BODY()
    friend class AMyPlayerState;

public:
    UFUNCTION(BlueprintPure, FieldNotify)
    float GetHealthPercent() const { return MaxHealth > 0.f ? CurrentHealth / MaxHealth : 0.f; }

    UFUNCTION(BlueprintPure, FieldNotify)
    FText GetAmmoDisplayText() const
    {
        return FText::Format(NSLOCTEXT("HUD", "AmmoFmt", "{0} / {1}"),
            FText::AsNumber(CurrentAmmo), FText::AsNumber(MaxAmmo));
    }

protected:
    void SetCurrentHealth(float NewValue)
    {
        if (UE_MVVM_SET_PROPERTY_VALUE(CurrentHealth, NewValue))
            UE_MVVM_BROADCAST_FIELD_VALUE_CHANGED(GetHealthPercent);
    }
    void SetMaxHealth(float NewValue)
    {
        if (UE_MVVM_SET_PROPERTY_VALUE(MaxHealth, NewValue))
            UE_MVVM_BROADCAST_FIELD_VALUE_CHANGED(GetHealthPercent);
    }
    void SetCurrentAmmo(int32 NewValue)
    {
        if (UE_MVVM_SET_PROPERTY_VALUE(CurrentAmmo, NewValue))
            UE_MVVM_BROADCAST_FIELD_VALUE_CHANGED(GetAmmoDisplayText);
    }
    void SetMaxAmmo(int32 NewValue)
    {
        if (UE_MVVM_SET_PROPERTY_VALUE(MaxAmmo, NewValue))
            UE_MVVM_BROADCAST_FIELD_VALUE_CHANGED(GetAmmoDisplayText);
    }

private:
    UPROPERTY(BlueprintReadOnly, FieldNotify, Getter, meta=(AllowPrivateAccess=true))
    float CurrentHealth = 100.f;
    UPROPERTY(BlueprintReadOnly, FieldNotify, Getter, meta=(AllowPrivateAccess=true))
    float MaxHealth = 100.f;
    UPROPERTY(BlueprintReadOnly, FieldNotify, Getter, meta=(AllowPrivateAccess=true))
    int32 CurrentAmmo = 0;
    UPROPERTY(BlueprintReadOnly, FieldNotify, Getter, meta=(AllowPrivateAccess=true))
    int32 MaxAmmo = 0;
};
```

The Widget Blueprint binds: `HealthBar.Percent → ViewModel.GetHealthPercent()`, `AmmoText.Text → ViewModel.GetAmmoDisplayText()`, etc. No C++ widget pointers needed in the HUD widget class.

### Alternative: Delegate-Driven Approach
For simpler HUDs (1-3 values), delegates are acceptable:

```cpp
UCLASS()
class UHUDWidget : public UUserWidget
{
    GENERATED_BODY()

public:
    void InitializeHUD(AMyPlayerState* InPlayerState);

protected:
    virtual void NativeConstruct() override;
    virtual void NativeDestruct() override;

    UPROPERTY(meta = (BindWidget))
    UTextBlock* HealthText;

    UPROPERTY(meta = (BindWidget))
    UProgressBar* HealthBar;

    UPROPERTY(meta = (BindWidget))
    UTextBlock* AmmoText;

private:
    UFUNCTION()
    void OnHealthChanged(float NewHealth, float MaxHealth);

    UFUNCTION()
    void OnAmmoChanged(int32 CurrentAmmo, int32 MaxAmmo);

    UPROPERTY()
    TWeakObjectPtr<AMyPlayerState> CachedPlayerState;
};
```

### Key Points
- Create once in `BeginPlay`, add to viewport once, never remove during gameplay.
- **Prefer MVVM FieldNotify** for HUDs — eliminates scattered `->SetText()` calls and keeps C++ widget-agnostic.
- For delegate approach: bind in `NativeConstruct`, unbind in `NativeDestruct`. Never poll in Tick.
- Use `SetInputMode_GameAndUI` if HUD has clickable elements; otherwise `SetInputMode_GameOnly`.
- Set root canvas panel to `SelfHitTestInvisible` so clicks pass through to the game world.
- Use `Collapsed` visibility to hide sections (e.g., hide ammo for melee weapons), not `Hidden`.

## Pause Menu with Input Mode Switching

### Implementation Pattern
```cpp
void UPauseMenuWidget::OpenPauseMenu()
{
    if (IsInViewport()) return;

    AddToViewport(100); // High Z-order to be on top

    APlayerController* PC = GetOwningPlayer();
    PC->SetPause(true);
    PC->SetInputMode(FInputModeDataUIOnly());
    PC->bShowMouseCursor = true;

    // Set initial focus for gamepad
    if (ResumeButton)
    {
        ResumeButton->SetFocus();
    }
}

void UPauseMenuWidget::ClosePauseMenu()
{
    APlayerController* PC = GetOwningPlayer();
    PC->SetPause(false);
    PC->SetInputMode(FInputModeDataGameOnly());
    PC->bShowMouseCursor = false;

    RemoveFromParent();
}
```

### With CommonUI
```cpp
// No manual input mode management needed
void UPauseMenuWidget::NativeOnActivated()
{
    Super::NativeOnActivated();
    GetOwningPlayer()->SetPause(true);
    if (ResumeButton) ResumeButton->SetFocus();
}

void UPauseMenuWidget::NativeOnDeactivated()
{
    GetOwningPlayer()->SetPause(false);
    Super::NativeOnDeactivated();
}

TOptional<FUIInputConfig> UPauseMenuWidget::GetDesiredInputConfig() const
{
    return FUIInputConfig(ECommonInputMode::Menu, EMouseCaptureMode::NoCapture);
}
```

### Key Points
- Always handle the Escape/Back action to close the menu.
- With CommonUI, back navigation is automatic when using the activation stack.
- Use a semi-transparent background overlay to dim the game behind the menu.
- Set the background overlay to `Visible` to block clicks from reaching the game world.

## Inventory Grid with Widget Pooling

### Using ListView (Virtualized, Recommended)
```cpp
UCLASS()
class UInventoryWidget : public UUserWidget
{
    GENERATED_BODY()

protected:
    UPROPERTY(meta = (BindWidget))
    UTileView* InventoryGrid;

    virtual void NativeConstruct() override
    {
        Super::NativeConstruct();
        InventoryGrid->SetListItems(InventoryItems);
        // UTileView only creates visible entry widgets and pools/recycles them
    }
};

// Entry widget must implement IUserObjectListEntry
UCLASS()
class UInventorySlotWidget : public UUserWidget, public IUserObjectListEntry
{
    GENERATED_BODY()

protected:
    virtual void NativeOnListItemObjectSet(UObject* ListItemObject) override
    {
        UInventoryItemData* ItemData = Cast<UInventoryItemData>(ListItemObject);
        if (ItemData)
        {
            ItemIcon->SetBrushFromTexture(ItemData->Icon);
            ItemName->SetText(FText::FromString(ItemData->Name));
            QuantityText->SetText(FText::AsNumber(ItemData->Quantity));
        }
    }

    UPROPERTY(meta = (BindWidget))
    UImage* ItemIcon;

    UPROPERTY(meta = (BindWidget))
    UTextBlock* ItemName;

    UPROPERTY(meta = (BindWidget))
    UTextBlock* QuantityText;
};
```

### Key Points
- Never spawn 200 widgets into a ScrollBox. Use `UTileView` or `UListView`.
- `UTileView` arranges items in a grid; `UListView` arranges in a list.
- The data model is a `TArray<UObject*>` -- create lightweight `UObject` wrappers for your item data.
- `NativeOnListItemObjectSet` is called when a pooled widget is recycled with new data.
- Call `RequestRefresh()` or `RegenerateAllEntries()` when the backing data changes.
- For drag-and-drop, implement `NativeOnItemIsHoveredChanged` and use `UDragDropOperation`.

## Health Bar with Material-Based Progress

A health bar that uses a material instance for smooth gradients and effects:

### Setup
1. Create a material with a `Scalar Parameter` named "Progress" (0-1).
2. Use the parameter to lerp between full and empty colors.
3. Add glow, pulse, or gradient effects in the material.

### C++ Integration
```cpp
void UHealthBarWidget::NativeConstruct()
{
    Super::NativeConstruct();
    if (HealthBarImage && HealthBarMaterial)
    {
        DynamicMaterial = UMaterialInstanceDynamic::Create(HealthBarMaterial, this);
        HealthBarImage->SetBrushFromMaterial(DynamicMaterial);
    }
}

void UHealthBarWidget::UpdateHealth(float NormalizedHealth)
{
    if (DynamicMaterial)
    {
        DynamicMaterial->SetScalarParameterValue(TEXT("Progress"), NormalizedHealth);

        // Color shift when low health
        FLinearColor BarColor = FMath::Lerp(LowHealthColor, FullHealthColor, NormalizedHealth);
        DynamicMaterial->SetVectorParameterValue(TEXT("BarColor"), BarColor);
    }
}
```

### Key Points
- Create `UMaterialInstanceDynamic` once, not every update.
- Material-based bars are more flexible than `UProgressBar` (gradients, effects, textures).
- Combine with widget animation for damage flash effects.

## Floating World-Space Widgets (Nameplates)

Widgets attached to actors in 3D space (health bars above enemies, player names).

### Using UWidgetComponent
```cpp
// In your actor's constructor or BeginPlay
UWidgetComponent* NameplateComp = CreateDefaultSubobject<UWidgetComponent>(TEXT("Nameplate"));
NameplateComp->SetupAttachment(RootComponent);
NameplateComp->SetWidgetSpace(EWidgetSpace::Screen); // Always faces camera
NameplateComp->SetDrawAtDesiredSize(true);
NameplateComp->SetWidgetClass(NameplateWidgetClass);
NameplateComp->SetRelativeLocation(FVector(0, 0, 120)); // Above head
NameplateComp->SetCollisionEnabled(ECollisionEnabled::NoCollision);
```

### Screen-Space vs World-Space
- `EWidgetSpace::Screen` -- widget always faces camera, scales with screen distance. Best for nameplates.
- `EWidgetSpace::World` -- widget exists in 3D space, has perspective. Best for in-world displays (computer screens, signs).

### Performance Optimization
```cpp
// Only render when visible to the local player
NameplateComp->SetVisibility(false); // Start hidden

void AMyCharacter::Tick(float DeltaTime)
{
    // Only show nameplates within range
    float DistSq = FVector::DistSquared(GetActorLocation(), LocalPlayerLocation);
    bool bShouldShow = DistSq < FMath::Square(MaxNameplateDistance);
    NameplateComp->SetVisibility(bShouldShow);
}
```

### Key Points
- Widget components are expensive. Limit to visible/nearby actors only.
- Use `SetDrawAtDesiredSize(true)` to prevent the widget from being stretched.
- For large numbers of nameplates (MMO), consider a single screen-space overlay that projects positions.
- Disable collision on widget components to avoid physics overhead.

## Loading Screen Implementation

### Using MoviePlayer (Engine-Level)
```cpp
// In your GameInstance
void UMyGameInstance::Init()
{
    Super::Init();
    FCoreUObjectDelegates::PreLoadMap.AddUObject(this, &UMyGameInstance::BeginLoadingScreen);
    FCoreUObjectDelegates::PostLoadMapWithWorld.AddUObject(this, &UMyGameInstance::EndLoadingScreen);
}

void UMyGameInstance::BeginLoadingScreen(const FString& MapName)
{
    FLoadingScreenAttributes LoadingScreen;
    LoadingScreen.bAutoCompleteWhenLoadingCompletes = true;
    LoadingScreen.bMoviesAreSkippable = false;
    LoadingScreen.bWaitForManualStop = false;
    LoadingScreen.MinimumLoadingScreenDisplayTime = 2.0f;

    // Slate widget for loading screen (must be Slate, not UMG, since UMG may not be ready)
    LoadingScreen.WidgetLoadingScreen = SNew(SLoadingScreenWidget);

    GetMoviePlayer()->SetupLoadingScreen(LoadingScreen);
}
```

### Key Points
- Loading screens during level transitions use `IGameMoviePlayer`, not UMG widgets.
- The loading screen widget must be Slate (not UMG) because UMG depends on a valid world.
- For in-game async loading (streaming), use a regular UMG widget overlay.
- Set `bAutoCompleteWhenLoadingCompletes` to `false` if you need a "press any key" prompt.
- Use `MinimumLoadingScreenDisplayTime` to prevent flash-loading on fast hardware.

## Dialog/Confirmation Popup System

### Reusable Dialog Widget
```cpp
UCLASS()
class UConfirmationDialog : public UCommonActivatableWidget
{
    GENERATED_BODY()

public:
    DECLARE_DYNAMIC_MULTICAST_DELEGATE_OneParam(FOnDialogResult, bool, bConfirmed);

    void SetupDialog(const FText& Title, const FText& Message, const FText& ConfirmText, const FText& CancelText);

    UPROPERTY(BlueprintAssignable)
    FOnDialogResult OnDialogResult;

protected:
    UPROPERTY(meta = (BindWidget))
    UTextBlock* TitleText;

    UPROPERTY(meta = (BindWidget))
    UTextBlock* MessageText;

    UPROPERTY(meta = (BindWidget))
    UCommonButtonBase* ConfirmButton;

    UPROPERTY(meta = (BindWidget))
    UCommonButtonBase* CancelButton;

    virtual void NativeOnActivated() override;

    UFUNCTION()
    void OnConfirmClicked();

    UFUNCTION()
    void OnCancelClicked();
};
```

### Usage Pattern
```cpp
void USettingsMenu::OnResetToDefaults()
{
    UConfirmationDialog* Dialog = ModalStack->AddWidget<UConfirmationDialog>();
    Dialog->SetupDialog(
        LOCTEXT("ResetTitle", "Reset Settings"),
        LOCTEXT("ResetMsg", "Are you sure you want to reset all settings to default?"),
        LOCTEXT("ResetConfirm", "Reset"),
        LOCTEXT("ResetCancel", "Cancel")
    );
    Dialog->OnDialogResult.AddDynamic(this, &USettingsMenu::OnResetConfirmed);
}
```

### Key Points
- Push dialogs onto a modal layer stack so they block input to widgets behind them.
- Always provide keyboard/gamepad focus to the cancel or safest option by default.
- Use delegates for results instead of polling or blocking.
- Support Escape/B-button to dismiss (automatic with CommonUI activation stack).

## Settings Menu with Apply/Revert

### Architecture
```
USettingsMenuWidget
  ├── USettingsTabSwitcher (CommonActivatableWidgetSwitcher)
  │     ├── UVideoSettingsTab
  │     ├── UAudioSettingsTab
  │     ├── UGameplaySettingsTab
  │     └── UControlsSettingsTab
  ├── ApplyButton
  ├── RevertButton
  └── BackButton
```

### Settings Data Pattern
```cpp
UCLASS()
class UGameSettingsManager : public UGameInstanceSubsystem
{
    GENERATED_BODY()

public:
    // Load current settings into a working copy
    FGameSettings GetCurrentSettings() const;

    // Preview a setting change (e.g., resolution change)
    void PreviewSettings(const FGameSettings& PreviewSettings);

    // Apply and save to disk
    void ApplySettings(const FGameSettings& NewSettings);

    // Revert to last-applied settings
    void RevertToApplied();

    // Revert to defaults
    void ResetToDefaults();
};
```

### Video Settings Implementation
```cpp
void UVideoSettingsTab::PopulateResolutionOptions()
{
    TArray<FIntPoint> Resolutions;
    UKismetSystemLibrary::GetSupportedFullscreenResolutions(Resolutions);

    for (const FIntPoint& Res : Resolutions)
    {
        FString Label = FString::Printf(TEXT("%dx%d"), Res.X, Res.Y);
        ResolutionComboBox->AddOption(Label);
    }
}

void UVideoSettingsTab::ApplyVideoSettings()
{
    UGameUserSettings* Settings = UGameUserSettings::GetGameUserSettings();
    Settings->SetScreenResolution(SelectedResolution);
    Settings->SetFullscreenMode(SelectedWindowMode);
    Settings->SetVSyncEnabled(bVSyncEnabled);
    Settings->ApplySettings(true); // bCheckForCommandLineOverrides
    Settings->SaveSettings();
}
```

### Key Points
- Use a "pending changes" pattern: edits modify a working copy, Apply commits them.
- For video settings, show a confirmation dialog with a 15-second timeout that reverts if unconfirmed.
- Store settings in `GameUserSettings` (engine) and a custom `USaveGame` subclass (game-specific).
- Tab navigation works naturally with `UCommonActivatableWidgetSwitcher` and a `UCommonButtonGroupBase`.
- Revert should restore all values in the working copy and refresh all UI widgets.
- Use `UGameUserSettings::GetGameUserSettings()` for engine-level settings (resolution, graphics quality).
- Use a custom subsystem for game-specific settings (FOV, sensitivity, accessibility).

## Cross-Platform Game UI Layer Pattern (from Cropout)

A production-ready pattern for multi-layer UI with CommonUI activation stacks that handles keyboard, gamepad, and touch seamlessly.

### Layer Architecture

```
Game Level:
  BP_GM.BeginPlay → CreateWidget(UI_Layer_Game) → AddToViewport

  UI_Layer_Game (CommonActivatableWidget)
  ├── SafeZone → Resource display (UIE_Resource widgets)
  ├── CommonActivatableWidgetStack "MainStack"
  │   ├── UI_GameMain (default — pushed on activation)
  │   ├── UI_Build (pushed on entering build mode)
  │   ├── UI_Pause (pushed on pause)
  │   └── UI_EndGame (pushed on game over)
  └── CUI_Button "BTN_Pause"

Menu Level:
  BP_MainMenuGM → CreateWidget(UI_Layer_Menu) → AddToViewport

  UI_Layer_Menu (CommonActivatableWidget)
  └── CommonActivatableWidgetStack "MainStack"
      └── UI_MainMenu (pushed on activation)
```

### Key Implementation Details

1. **SafeZone widget** wraps persistent HUD elements (resource counters) to respect device notches and safe areas on mobile/TV.

2. **MainStack** (`CommonActivatableWidgetStack`) manages screen transitions:
   - Only the top widget receives input
   - Pushing UI_Pause on top auto-deactivates UI_GameMain
   - Popping UI_Pause auto-reactivates UI_GameMain
   - Back button/B/Escape automatically pops the stack

3. **Input mode per widget** — each `CommonActivatableWidget` declares its input mode:
   - `UI_GameMain.OnActivated` → `SetInputMode_GameOnly` (gameplay)
   - `UI_Pause.GetDesiredInputConfig` → `Menu` mode (cursor visible, game paused)
   - `UI_Build.GetDesiredInputConfig` → `All` mode (game + UI simultaneously)

4. **Device-adaptive input switching** — `UI_GameMain` binds to a `KeySwitch` delegate:
   - MouseKeyboard → `SetInputMode_GameAndUIEx` (allows hover on UMG buttons)
   - Gamepad → `SetInputMode_GameOnly` + `SetFocusToGameViewport`
   - Touch → `SetInputMode_GameOnly` + hide cursor

5. **CUI_Button with CommonActionWidget** shows the correct input icon automatically based on active device.

6. **Loading screen** — `BP_GI` (GameInstance) creates a `UI_Transition` widget on init, used as a fade overlay during level transitions.

### Platform-Specific Adaptations

- `UI_MainMenu` calls `GetPlatformName()` to show/hide platform-specific buttons (e.g., Donate button for IAP-enabled platforms)
- `CUI_Button.PreConstruct` adjusts `MinDesiredHeight` per platform for touch-friendly sizing
- `bAutoRestoreFocus = true` on menu widgets ensures gamepad users always have a focused button
- `BP_GetDesiredFocusTarget` override directs initial gamepad focus to the correct button
