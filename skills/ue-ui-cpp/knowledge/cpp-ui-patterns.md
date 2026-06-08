# C++ UI Patterns — Production-Ready Recipes

## Pattern 1: CommonUI Primary Game Layout

The root widget containing all UI layers. Created once, managed by a subsystem.

### Header (MyPrimaryGameLayout.h)
```cpp
#pragma once
#include "CoreMinimal.h"
#include "CommonActivatableWidget.h"
#include "GameplayTagContainer.h"
#include "MyPrimaryGameLayout.generated.h"

class UCommonActivatableWidgetContainerStack;

UCLASS(Abstract, BlueprintType)
class MYGAME_API UMyPrimaryGameLayout : public UCommonActivatableWidget
{
    GENERATED_BODY()

public:
    UFUNCTION(BlueprintCallable, Category = "UI")
    UCommonActivatableWidget* PushWidgetToLayer(
        FGameplayTag LayerTag,
        TSubclassOf<UCommonActivatableWidget> WidgetClass);

    UCommonActivatableWidgetContainerStack* GetLayerStack(FGameplayTag LayerTag) const;

protected:
    UPROPERTY(meta=(BindWidget))
    UCommonActivatableWidgetContainerStack* GameLayer;

    UPROPERTY(meta=(BindWidget))
    UCommonActivatableWidgetContainerStack* GameMenuLayer;

    UPROPERTY(meta=(BindWidget))
    UCommonActivatableWidgetContainerStack* MenuLayer;

    UPROPERTY(meta=(BindWidget))
    UCommonActivatableWidgetContainerStack* ModalLayer;

    virtual void NativeConstruct() override;

private:
    TMap<FGameplayTag, UCommonActivatableWidgetContainerStack*> LayerMap;
};
```

### Implementation (MyPrimaryGameLayout.cpp)
```cpp
#include "MyPrimaryGameLayout.h"
#include UE_INLINE_GENERATED_CPP_BY_NAME(MyPrimaryGameLayout)
#include "CommonActivatableWidgetContainerBase.h"

void UMyPrimaryGameLayout::NativeConstruct()
{
    Super::NativeConstruct();
    LayerMap.Add(FGameplayTag::RequestGameplayTag(FName("UI.Layer.Game")), GameLayer);
    LayerMap.Add(FGameplayTag::RequestGameplayTag(FName("UI.Layer.GameMenu")), GameMenuLayer);
    LayerMap.Add(FGameplayTag::RequestGameplayTag(FName("UI.Layer.Menu")), MenuLayer);
    LayerMap.Add(FGameplayTag::RequestGameplayTag(FName("UI.Layer.Modal")), ModalLayer);
}

UCommonActivatableWidget* UMyPrimaryGameLayout::PushWidgetToLayer(
    FGameplayTag LayerTag, TSubclassOf<UCommonActivatableWidget> WidgetClass)
{
    if (UCommonActivatableWidgetContainerStack* Stack = GetLayerStack(LayerTag))
    {
        return Stack->AddWidget<UCommonActivatableWidget>(WidgetClass);
    }
    return nullptr;
}

UCommonActivatableWidgetContainerStack* UMyPrimaryGameLayout::GetLayerStack(
    FGameplayTag LayerTag) const
{
    if (const auto* Found = LayerMap.Find(LayerTag))
    {
        return *Found;
    }
    return nullptr;
}
```

---

## Pattern 2: Activatable Widget Base with Input Mode

```cpp
#pragma once
#include "CommonActivatableWidget.h"
#include "MyActivatableWidget.generated.h"

UENUM(BlueprintType)
enum class EMyWidgetInputMode : uint8
{
    Default,
    GameAndMenu,
    Game,
    Menu
};

UCLASS(Abstract, BlueprintType)
class MYGAME_API UMyActivatableWidget : public UCommonActivatableWidget
{
    GENERATED_BODY()

public:
    UPROPERTY(EditDefaultsOnly, Category = "Input")
    EMyWidgetInputMode InputConfig = EMyWidgetInputMode::Default;

    virtual UWidget* NativeGetDesiredFocusTarget() const override
    {
        return nullptr; // Override in subclasses — return first focusable button
    }

    virtual TOptional<FUIInputConfig> GetDesiredInputConfig() const override
    {
        switch (InputConfig)
        {
        case EMyWidgetInputMode::Menu:
            return FUIInputConfig(ECommonInputMode::Menu, EMouseCaptureMode::NoCapture);
        case EMyWidgetInputMode::Game:
            return FUIInputConfig(ECommonInputMode::Game, EMouseCaptureMode::CapturePermanently);
        case EMyWidgetInputMode::GameAndMenu:
            return FUIInputConfig(ECommonInputMode::All, EMouseCaptureMode::NoCapture);
        default:
            return TOptional<FUIInputConfig>();
        }
    }

protected:
    virtual void NativeOnActivated() override
    {
        Super::NativeOnActivated();
    }

    virtual void NativeOnDeactivated() override
    {
        Super::NativeOnDeactivated();
    }

    virtual bool NativeOnHandleBackAction() override
    {
        DeactivateWidget();
        return true;
    }
};
```

---

## Pattern 3: HUD Widget with Event-Driven Binding

```cpp
// Header
#pragma once
#include "Blueprint/UserWidget.h"
#include "MyHealthBar.generated.h"

class UProgressBar;
class UTextBlock;

UCLASS()
class MYGAME_API UMyHealthBar : public UUserWidget
{
    GENERATED_BODY()

protected:
    UPROPERTY(meta=(BindWidget))
    UProgressBar* HealthBar;

    UPROPERTY(meta=(BindWidget))
    UTextBlock* HealthText;

    virtual void NativeConstruct() override;
    virtual void NativeDestruct() override;

private:
    UFUNCTION()
    void HandleHealthChanged(float CurrentHealth, float MaxHealth);
};

// Implementation
#include "MyHealthBar.h"
#include UE_INLINE_GENERATED_CPP_BY_NAME(MyHealthBar)
#include "Components/ProgressBar.h"
#include "Components/TextBlock.h"

void UMyHealthBar::NativeConstruct()
{
    Super::NativeConstruct();
    if (AMyPlayerState* PS = GetOwningPlayerState<AMyPlayerState>())
    {
        PS->OnHealthChanged.AddDynamic(this, &UMyHealthBar::HandleHealthChanged);
        HandleHealthChanged(PS->GetHealth(), PS->GetMaxHealth());
    }
}

void UMyHealthBar::NativeDestruct()
{
    if (AMyPlayerState* PS = GetOwningPlayerState<AMyPlayerState>())
    {
        PS->OnHealthChanged.RemoveDynamic(this, &UMyHealthBar::HandleHealthChanged);
    }
    Super::NativeDestruct();
}

void UMyHealthBar::HandleHealthChanged(float CurrentHealth, float MaxHealth)
{
    if (HealthBar)
    {
        HealthBar->SetPercent(MaxHealth > 0.f ? CurrentHealth / MaxHealth : 0.f);
    }
    if (HealthText)
    {
        HealthText->SetText(FText::FromString(
            FString::Printf(TEXT("%.0f / %.0f"), CurrentHealth, MaxHealth)));
    }
}
```

---

## Pattern 4: MVVM ViewModel (UE 5.1+, Preferred for Data Binding)

The MVVM plugin replaces manual `SetText()`/`SetPercent()` calls with declarative bindings. The ViewModel owns bindable properties; the Widget Blueprint binds to them in the View Bindings panel. UI updates automatically when values change — no `->SetText()` calls in C++.

### Data Flow
```
Model (game logic) → ViewModel (bindable data) → View (Widget Blueprint)
                   writes via protected setters    reads via FieldNotify bindings
                                                   writes via Request properties
```

### Property Types

**Data Property** — Model writes, UI reads:
```cpp
UPROPERTY(BlueprintReadOnly, FieldNotify, Getter, meta=(AllowPrivateAccess=true))
float CurrentHealth = 100.f;
```

**Request Property** — UI writes, Model reads and resets:
```cpp
UPROPERTY(BlueprintReadWrite, FieldNotify, Getter="HasDropRequest",
          Setter="SetDropRequest", meta=(AllowPrivateAccess=true))
bool bDropRequest = false;
```

**Computed Property** — Derived from other properties (UFUNCTION only, no UPROPERTY):
```cpp
UFUNCTION(BlueprintPure, FieldNotify)
float GetHealthPercent() const { return MaxHealth > 0.f ? CurrentHealth / MaxHealth : 0.f; }
```

### Complete ViewModel Example

```cpp
// Header
#pragma once
#include "MVVMViewModelBase.h"
#include "MyHealthViewModel.generated.h"

UCLASS()
class MYGAME_API UMyHealthViewModel : public UMVVMViewModelBase
{
    GENERATED_BODY()
    friend class UMyHealthComponent; // Model has write access

public:
    // --- Getters (public, Blueprint-visible) ---
    UFUNCTION(BlueprintPure)
    float GetCurrentHealth() const { return CurrentHealth; }

    UFUNCTION(BlueprintPure)
    float GetMaxHealth() const { return MaxHealth; }

    // --- Computed properties (FieldNotify on UFUNCTION) ---
    UFUNCTION(BlueprintPure, FieldNotify)
    float GetHealthPercent() const
    {
        return MaxHealth > 0.f ? CurrentHealth / MaxHealth : 0.f;
    }

    UFUNCTION(BlueprintPure, FieldNotify)
    bool IsAlive() const { return CurrentHealth > 0.f; }

    UFUNCTION(BlueprintPure, FieldNotify)
    bool IsLowHealth() const { return GetHealthPercent() < 0.25f; }

protected:
    // --- Setters (protected, only Model can call) ---
    void SetCurrentHealth(float NewValue);
    void SetMaxHealth(float NewValue);

private:
    UPROPERTY(BlueprintReadOnly, FieldNotify, Getter,
              meta=(AllowPrivateAccess=true))
    float CurrentHealth = 100.f;

    UPROPERTY(BlueprintReadOnly, FieldNotify, Getter,
              meta=(AllowPrivateAccess=true))
    float MaxHealth = 100.f;
};

// Implementation
#include "MyHealthViewModel.h"
#include UE_INLINE_GENERATED_CPP_BY_NAME(MyHealthViewModel)

void UMyHealthViewModel::SetCurrentHealth(const float NewValue)
{
    if (UE_MVVM_SET_PROPERTY_VALUE(CurrentHealth, NewValue))
    {
        // Broadcast all computed properties that depend on CurrentHealth
        UE_MVVM_BROADCAST_FIELD_VALUE_CHANGED(GetHealthPercent);
        UE_MVVM_BROADCAST_FIELD_VALUE_CHANGED(IsAlive);
        UE_MVVM_BROADCAST_FIELD_VALUE_CHANGED(IsLowHealth);
    }
}

void UMyHealthViewModel::SetMaxHealth(const float NewValue)
{
    if (UE_MVVM_SET_PROPERTY_VALUE(MaxHealth, NewValue))
    {
        UE_MVVM_BROADCAST_FIELD_VALUE_CHANGED(GetHealthPercent);
        UE_MVVM_BROADCAST_FIELD_VALUE_CHANGED(IsLowHealth);
    }
}
```

### Request Pattern (UI → Model Communication)

UI never calls Model methods directly. Instead, it sets a Request property on the ViewModel; the Model subscribes and handles it.

```cpp
// In ViewModel:
UPROPERTY(BlueprintReadWrite, FieldNotify, Getter="HasUseRequest",
          Setter="SetUseRequest", meta=(AllowPrivateAccess=true))
bool bUseRequest = false;

UFUNCTION(BlueprintCallable, Category="MyGame|Inventory|Request")
void SetUseRequest(bool bNewValue)
{
    UE_MVVM_SET_PROPERTY_VALUE(bUseRequest, bNewValue);
}

UFUNCTION(BlueprintPure)
bool HasUseRequest() const { return bUseRequest; }

// In Model (e.g., UInventoryComponent):
void UInventoryComponent::BindToSlotVM(USlotViewModel* VM)
{
    VM->AddFieldValueChangedDelegate(
        USlotViewModel::FFieldNotificationClassDescriptor::bUseRequest,
        INotifyFieldValueChanged::FFieldValueChangedDelegate::CreateUObject(
            this, &ThisClass::OnUseRequested));
}

void UInventoryComponent::OnUseRequested(UObject* Object, UE::FieldNotification::FFieldId)
{
    auto* VM = Cast<USlotViewModel>(Object);
    if (!VM->HasUseRequest()) return; // Ignore reset to sentinel
    VM->SetUseRequest(false);          // Reset immediately
    // ... handle use logic
}
```

### Widget Blueprint Setup (No C++ Binding Code)

Bindings are configured in the Widget Blueprint editor, NOT in C++:
1. Open Widget Blueprint → View Bindings panel
2. Add ViewModel (creation mode: `Create Instance`, `Global Collection`, or `Property Path`)
3. For each widget property (e.g., Text block's Text), add a binding to a ViewModel property
4. Conversion functions handle type mismatches (float→FText, bool→ESlateVisibility)

### Inventory ViewModel Example

```cpp
UCLASS()
class MYGAME_API UMyInventoryViewModel : public UMVVMViewModelBase
{
    GENERATED_BODY()
    friend class UMyInventoryComponent;

public:
    UFUNCTION(BlueprintPure)
    const TArray<FInventoryItemData>& GetItems() const { return Items; }

    UFUNCTION(BlueprintPure)
    int32 GetSelectedIndex() const { return SelectedIndex; }

    UFUNCTION(BlueprintPure)
    int32 GetGold() const { return Gold; }

    UFUNCTION(BlueprintPure, FieldNotify)
    bool HasItems() const { return Items.Num() > 0; }

    UFUNCTION(BlueprintPure, FieldNotify)
    FText GetGoldDisplayText() const
    {
        return FText::Format(NSLOCTEXT("UI", "GoldFmt", "{0}"),
            FText::AsNumber(Gold));
    }

protected:
    void SetItems(const TArray<FInventoryItemData>& NewItems)
    {
        if (UE_MVVM_SET_PROPERTY_VALUE(Items, NewItems))
        {
            UE_MVVM_BROADCAST_FIELD_VALUE_CHANGED(HasItems);
        }
    }

    void SetSelectedIndex(int32 NewIndex)
    {
        UE_MVVM_SET_PROPERTY_VALUE(SelectedIndex, NewIndex);
    }

    void SetGold(int32 NewGold)
    {
        if (UE_MVVM_SET_PROPERTY_VALUE(Gold, NewGold))
        {
            UE_MVVM_BROADCAST_FIELD_VALUE_CHANGED(GetGoldDisplayText);
        }
    }

private:
    UPROPERTY(BlueprintReadOnly, FieldNotify, Getter,
              meta=(AllowPrivateAccess=true))
    TArray<FInventoryItemData> Items;

    UPROPERTY(BlueprintReadOnly, FieldNotify, Getter,
              meta=(AllowPrivateAccess=true))
    int32 SelectedIndex = -1;

    UPROPERTY(BlueprintReadOnly, FieldNotify, Getter,
              meta=(AllowPrivateAccess=true))
    int32 Gold = 0;
};
```

### Key Rules

- **Never call `->SetText()` or `->SetPercent()` from C++ when using MVVM.** The Widget Blueprint binding handles all UI updates.
- **`UE_MVVM_SET_PROPERTY_VALUE` returns bool** — true if value actually changed. Use this to gate computed property broadcasts.
- **Always broadcast dependent computed properties** when a source property changes.
- **Friend class pattern** enforces unidirectional data flow: only the Model class can call protected setters.
- **Request sentinel values**: `false` for bool, `INDEX_NONE` for int32, `FVector2D(-1,-1)` for vectors. Model checks value ≠ sentinel before handling, then resets immediately.
- **Build.cs**: `PrivateDependencyModuleNames.Add("ModelViewViewModel");`

---

## Pattern 5: ListView with Entry Interface

```cpp
// Entry widget
UCLASS()
class MYGAME_API UMyListEntry : public UUserWidget, public IUserObjectListEntry
{
    GENERATED_BODY()

protected:
    UPROPERTY(meta=(BindWidget))
    UTextBlock* ItemName;

    UPROPERTY(meta=(BindWidget))
    UImage* ItemIcon;

    virtual void NativeOnListItemObjectSet(UObject* ListItemObject) override
    {
        if (UMyItemData* Data = Cast<UMyItemData>(ListItemObject))
        {
            ItemName->SetText(Data->Name);
            ItemIcon->SetBrushFromTexture(Data->Icon);
        }
    }
};

// Parent widget setup
void UMyInventoryPanel::NativeConstruct()
{
    Super::NativeConstruct();
    ItemListView->SetEntryWidgetClass(UMyListEntry::StaticClass());

    for (auto& ItemData : InventoryItems)
    {
        ItemListView->AddItem(ItemData);
    }

    ItemListView->OnItemSelectionChanged().AddUObject(
        this, &UMyInventoryPanel::HandleItemSelected);
}
```

---

## Pattern 6: CommonUI Styled Button

```cpp
UCLASS()
class MYGAME_API UMyStyledButton : public UCommonButtonBase
{
    GENERATED_BODY()

public:
    UFUNCTION(BlueprintCallable, Category = "UI")
    void SetButtonText(const FText& InText);

protected:
    UPROPERTY(meta=(BindWidget))
    UCommonTextBlock* ButtonLabel;

    virtual void NativeOnCurrentTextStyleChanged() override
    {
        Super::NativeOnCurrentTextStyleChanged();
        if (ButtonLabel)
        {
            ButtonLabel->SetStyle(GetCurrentTextStyleClass());
        }
    }
};
```

---

## Pattern 7: UI Manager Subsystem

```cpp
#pragma once
#include "Subsystems/GameInstanceSubsystem.h"
#include "MyUIManagerSubsystem.generated.h"

class UMyPrimaryGameLayout;

UCLASS()
class MYGAME_API UMyUIManagerSubsystem : public UGameInstanceSubsystem
{
    GENERATED_BODY()

public:
    UMyPrimaryGameLayout* GetPrimaryLayout(APlayerController* PC) const;

    UFUNCTION(BlueprintCallable, Category = "UI")
    UCommonActivatableWidget* PushWidget(
        APlayerController* PC,
        FGameplayTag LayerTag,
        TSubclassOf<UCommonActivatableWidget> WidgetClass);

private:
    UPROPERTY()
    TMap<TWeakObjectPtr<APlayerController>, UMyPrimaryGameLayout*> PlayerLayouts;
};
```

---

## Pattern 8: Indicator System (Screen-Space World Indicators)

### Descriptor
```cpp
UCLASS(BlueprintType)
class MYGAME_API UIndicatorDescriptor : public UObject
{
    GENERATED_BODY()

public:
    UPROPERTY(BlueprintReadOnly, Category = "Indicator")
    TWeakObjectPtr<AActor> OwnerActor;

    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Indicator")
    TSubclassOf<UUserWidget> IndicatorWidgetClass;

    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Indicator")
    FVector WorldOffset = FVector(0, 0, 100.f);

    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Indicator")
    bool bClampToScreen = false;

    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Indicator")
    float MaxVisibleDistance = 10000.f;
};
```

### Manager Component
```cpp
UCLASS()
class MYGAME_API UMyIndicatorManagerComponent : public UControllerComponent
{
    GENERATED_BODY()

public:
    DECLARE_DYNAMIC_MULTICAST_DELEGATE_OneParam(FOnIndicatorEvent, UIndicatorDescriptor*, Descriptor);

    UPROPERTY(BlueprintAssignable, Category = "Indicator")
    FOnIndicatorEvent OnIndicatorAdded;

    UPROPERTY(BlueprintAssignable, Category = "Indicator")
    FOnIndicatorEvent OnIndicatorRemoved;

    UFUNCTION(BlueprintCallable, Category = "Indicator")
    void AddIndicator(UIndicatorDescriptor* Descriptor);

    UFUNCTION(BlueprintCallable, Category = "Indicator")
    void RemoveIndicator(UIndicatorDescriptor* Descriptor);

private:
    UPROPERTY()
    TArray<TObjectPtr<UIndicatorDescriptor>> Indicators;
};
```

---

## Pattern 9: Tag-Driven Widget Visibility

```cpp
UCLASS()
class MYGAME_API UMyTaggedWidget : public UCommonUserWidget
{
    GENERATED_BODY()

public:
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "UI")
    FGameplayTagContainer HiddenByTags;

    UPROPERTY(EditAnywhere, Category = "UI")
    ESlateVisibility ShownVisibility = ESlateVisibility::SelfHitTestInvisible;

    UPROPERTY(EditAnywhere, Category = "UI")
    ESlateVisibility HiddenVisibility = ESlateVisibility::Collapsed;

protected:
    virtual void NativeConstruct() override;
    virtual void NativeDestruct() override;

private:
    void OnWatchedTagsChanged(const FGameplayTag Tag, int32 NewCount);
    bool bIsHiddenByTags = false;
};
```

---

## Pattern 10: Widget Factory (Data-Driven Widget Selection)

```cpp
UCLASS(Abstract, Blueprintable, EditInlineNew)
class MYGAME_API UMyWidgetFactory : public UObject
{
    GENERATED_BODY()

public:
    UFUNCTION(BlueprintNativeEvent, Category = "UI")
    TSubclassOf<UUserWidget> FindWidgetClassForData(const UObject* Data) const;
    virtual TSubclassOf<UUserWidget> FindWidgetClassForData_Implementation(const UObject* Data) const
    {
        return nullptr;
    }
};

UCLASS(Blueprintable, EditInlineNew)
class MYGAME_API UMyWidgetFactory_Class : public UMyWidgetFactory
{
    GENERATED_BODY()

public:
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "UI")
    TSoftClassPtr<UObject> DataClass;

    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "UI")
    TSubclassOf<UUserWidget> WidgetClass;

    virtual TSubclassOf<UUserWidget> FindWidgetClassForData_Implementation(const UObject* Data) const override
    {
        if (Data && DataClass.Get() && Data->IsA(DataClass.Get()))
        {
            return WidgetClass;
        }
        return nullptr;
    }
};
```

---

## Pattern 11: Loading Screen Subsystem

```cpp
UCLASS()
class MYGAME_API UMyLoadingScreenSubsystem : public UGameInstanceSubsystem
{
    GENERATED_BODY()

public:
    DECLARE_DYNAMIC_MULTICAST_DELEGATE_OneParam(FOnLoadingScreenWidgetChanged,
        TSubclassOf<UUserWidget>, NewWidgetClass);

    UFUNCTION(BlueprintCallable, Category = "Loading")
    void SetLoadingScreenContentWidget(TSubclassOf<UUserWidget> NewWidgetClass)
    {
        if (LoadingScreenWidgetClass != NewWidgetClass)
        {
            LoadingScreenWidgetClass = NewWidgetClass;
            OnLoadingScreenWidgetChanged.Broadcast(NewWidgetClass);
        }
    }

    UFUNCTION(BlueprintPure, Category = "Loading")
    TSubclassOf<UUserWidget> GetLoadingScreenContentWidget() const
    {
        return LoadingScreenWidgetClass;
    }

    UPROPERTY(BlueprintAssignable, Category = "Loading")
    FOnLoadingScreenWidgetChanged OnLoadingScreenWidgetChanged;

private:
    UPROPERTY()
    TSubclassOf<UUserWidget> LoadingScreenWidgetClass;
};
```

---

## Pattern 12: Frontend State Component

```cpp
UCLASS()
class MYGAME_API UMyFrontendStateComponent : public UGameStateComponent
{
    GENERATED_BODY()

public:
    bool ShouldShowLoadingScreen() const { return bShowLoadingScreen; }

protected:
    UPROPERTY(EditAnywhere, Category = "Frontend")
    TSoftClassPtr<UCommonActivatableWidget> PressStartScreenClass;

    UPROPERTY(EditAnywhere, Category = "Frontend")
    TSoftClassPtr<UCommonActivatableWidget> MainScreenClass;

    virtual void BeginPlay() override;

private:
    void FlowStep_WaitForInput();
    void FlowStep_ShowMainMenu();
    void FlowStep_TryShowMainScreen();

    bool bShowLoadingScreen = true;
};
```

Use `TSoftClassPtr` for async loading. Use `UCommonUIExtensions::PushStreamedContentToLayer_ForPlayer` for async widget push.

---

## Widget Blueprint Creation Script

After writing C++ classes, create the matching Widget Blueprint:

```python
import unreal

def create_widget_blueprint(name, path, parent_class_path):
    """Create Widget Blueprint from C++ parent."""
    full_path = f"{path}/{name}"

    if unreal.EditorAssetLibrary.does_asset_exist(full_path):
        print(f"Already exists: {full_path}")
        return unreal.EditorAssetLibrary.load_asset(full_path)

    factory = unreal.WidgetBlueprintFactory()
    parent = unreal.load_class(None, parent_class_path)
    if parent:
        factory.set_editor_property('parent_class', parent)

    asset = unreal.AssetToolsHelpers.get_asset_tools().create_asset(
        name, path, None, factory)

    if asset:
        unreal.EditorAssetLibrary.save_asset(full_path)
        print(f"Created: {full_path}")
    else:
        print(f"ERROR: Failed to create {full_path}")
    return asset
```
