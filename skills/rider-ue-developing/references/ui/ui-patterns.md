# UE UI Patterns — Copy-Paste C++ Recipes

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
    // Push widget onto named layer stack
    UFUNCTION(BlueprintCallable, Category = "UI")
    UCommonActivatableWidget* PushWidgetToLayer(
        FGameplayTag LayerTag,
        TSubclassOf<UCommonActivatableWidget> WidgetClass);

    // Find stack by layer tag
    UCommonActivatableWidgetContainerStack* GetLayerStack(FGameplayTag LayerTag) const;

protected:
    // Layer stacks bound from Blueprint
    UPROPERTY(meta=(BindWidget))
    UCommonActivatableWidgetContainerStack* GameLayer;

    UPROPERTY(meta=(BindWidget))
    UCommonActivatableWidgetContainerStack* GameMenuLayer;

    UPROPERTY(meta=(BindWidget))
    UCommonActivatableWidgetContainerStack* MenuLayer;

    UPROPERTY(meta=(BindWidget))
    UCommonActivatableWidgetContainerStack* ModalLayer;

private:
    // Tag-to-stack mapping (populated in NativeConstruct)
    TMap<FGameplayTag, UCommonActivatableWidgetContainerStack*> LayerMap;
};
```

### Implementation (MyPrimaryGameLayout.cpp)
```cpp
#include "MyPrimaryGameLayout.h"
#include "CommonActivatableWidgetContainerBase.h"

void UMyPrimaryGameLayout::NativeConstruct()
{
    Super::NativeConstruct();

    // Register layer stacks by gameplay tag
    LayerMap.Add(FGameplayTag::RequestGameplayTag(FName("UI.Layer.Game")), GameLayer);
    LayerMap.Add(FGameplayTag::RequestGameplayTag(FName("UI.Layer.GameMenu")), GameMenuLayer);
    LayerMap.Add(FGameplayTag::RequestGameplayTag(FName("UI.Layer.Menu")), MenuLayer);
    LayerMap.Add(FGameplayTag::RequestGameplayTag(FName("UI.Layer.Modal")), ModalLayer);
}

UCommonActivatableWidget* UMyPrimaryGameLayout::PushWidgetToLayer(
    FGameplayTag LayerTag,
    TSubclassOf<UCommonActivatableWidget> WidgetClass)
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

## Pattern 2: Activatable Widget Base

Base class for any menu, panel, or dialog that participates in CommonUI's lifecycle.

```cpp
#pragma once
#include "CommonActivatableWidget.h"
#include "MyActivatableWidget.generated.h"

UCLASS(Abstract, BlueprintType)
class MYGAME_API UMyActivatableWidget : public UCommonActivatableWidget
{
    GENERATED_BODY()

public:
    // CRITICAL: Must implement for gamepad/keyboard navigation
    virtual UWidget* NativeGetDesiredFocusTarget() const override
    {
        // Override in subclasses to return the first focusable button/element
        // Returning nullptr = gamepad navigation broken for this widget
        return nullptr;
    }

    // CRITICAL: Must implement for input routing
    virtual TOptional<FUIInputConfig> GetDesiredInputConfig() const override
    {
        // Menu mode: blocks game input, frees mouse cursor
        return FUIInputConfig(ECommonInputMode::Menu, EMouseCaptureMode::NoCapture);
    }

protected:
    virtual void NativeOnActivated() override
    {
        Super::NativeOnActivated();
        // Reset transient state here (NOT expensive init — that goes in NativeConstruct)
    }

    virtual void NativeOnDeactivated() override
    {
        Super::NativeOnDeactivated();
        // Cleanup transient state, cancel pending actions
    }

    // Handle back action (Escape, B button, etc.)
    virtual bool NativeOnHandleBackAction() override
    {
        // Default: deactivate this widget (pops from stack)
        DeactivateWidget();
        return true;
    }
};
```

---

## Pattern 3: HUD Widget with Event-Driven Binding

A HUD element that updates reactively via delegates, not polling.

### Header
```cpp
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
    // Bound from Blueprint layout
    UPROPERTY(meta=(BindWidget))
    UProgressBar* HealthBar;

    UPROPERTY(meta=(BindWidget))
    UTextBlock* HealthText;

    virtual void NativeConstruct() override;
    virtual void NativeDestruct() override;

private:
    UFUNCTION()
    void HandleHealthChanged(float CurrentHealth, float MaxHealth);

    FDelegateHandle HealthDelegateHandle;
};
```

### Implementation
```cpp
#include "MyHealthBar.h"
#include "Components/ProgressBar.h"
#include "Components/TextBlock.h"
#include "MyPlayerState.h"

void UMyHealthBar::NativeConstruct()
{
    Super::NativeConstruct();

    // Bind to game state delegate — event-driven, NOT Tick
    if (AMyPlayerState* PS = GetOwningPlayerState<AMyPlayerState>())
    {
        PS->OnHealthChanged.AddDynamic(this, &UMyHealthBar::HandleHealthChanged);

        // Initialize with current values
        HandleHealthChanged(PS->GetHealth(), PS->GetMaxHealth());
    }
}

void UMyHealthBar::NativeDestruct()
{
    // CRITICAL: Always unbind to prevent dangling delegate
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

## Pattern 4: MVVM ViewModel (UE 5.1+ Built-in)

### ViewModel Header
```cpp
#pragma once
#include "MVVMViewModelBase.h"
#include "MyInventoryViewModel.generated.h"

USTRUCT(BlueprintType)
struct FInventoryItemData
{
    GENERATED_BODY()

    UPROPERTY(BlueprintReadOnly)
    FText Name;

    UPROPERTY(BlueprintReadOnly)
    int32 Quantity = 0;

    UPROPERTY(BlueprintReadOnly)
    TSoftObjectPtr<UTexture2D> Icon;
};

UCLASS()
class MYGAME_API UMyInventoryViewModel : public UMVVMViewModelBase
{
    GENERATED_BODY()

public:
    // FieldNotify properties auto-notify bound views
    UPROPERTY(BlueprintReadWrite, FieldNotify, Setter, Getter)
    TArray<FInventoryItemData> Items;

    UPROPERTY(BlueprintReadWrite, FieldNotify, Setter, Getter)
    int32 SelectedIndex = -1;

    UPROPERTY(BlueprintReadWrite, FieldNotify, Setter, Getter)
    int32 Gold = 0;

    // Setters use the macro for auto-notification
    void SetItems(const TArray<FInventoryItemData>& NewItems)
    {
        UE_MVVM_SET_PROPERTY_VALUE(Items, NewItems);
    }
    const TArray<FInventoryItemData>& GetItems() const { return Items; }

    void SetSelectedIndex(int32 NewIndex)
    {
        UE_MVVM_SET_PROPERTY_VALUE(SelectedIndex, NewIndex);
    }
    int32 GetSelectedIndex() const { return SelectedIndex; }

    void SetGold(int32 NewGold)
    {
        UE_MVVM_SET_PROPERTY_VALUE(Gold, NewGold);
    }
    int32 GetGold() const { return Gold; }
};
```

### Build.cs Addition
```cpp
PrivateDependencyModuleNames.Add("ModelViewViewModel");
```

---

## Pattern 5: UIExtension Point (Lyra-Style HUD Injection)

### Extension Point Widget (receptive slot)
```cpp
#pragma once
#include "Blueprint/UserWidget.h"
#include "GameplayTagContainer.h"
#include "MyUIExtensionPoint.generated.h"

UCLASS()
class MYGAME_API UMyUIExtensionPoint : public UUserWidget
{
    GENERATED_BODY()

public:
    // Tag identifying this extension point (e.g., "UI.HUD.TopRight")
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "UI")
    FGameplayTag ExtensionPointTag;

    // Allowed widget classes that can be injected here
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "UI")
    TArray<TSubclassOf<UUserWidget>> AllowedWidgetClasses;

    // Called by extension system to add widget
    UFUNCTION(BlueprintCallable, Category = "UI")
    void AddExtensionWidget(TSubclassOf<UUserWidget> WidgetClass);

protected:
    UPROPERTY(meta=(BindWidget))
    UPanelWidget* ContentPanel;  // Container for injected widgets
};
```

### Extension Registration (GameFeature Action)
```cpp
// In GameFeature activation:
void UMyGameFeatureAction_AddWidgets::OnGameFeatureActivating()
{
    UMyUIExtensionSubsystem* ExtSys = GetWorld()->GetGameInstance()
        ->GetSubsystem<UMyUIExtensionSubsystem>();

    // Register HUD element at extension point
    ExtSys->RegisterExtension(
        FGameplayTag::RequestGameplayTag("UI.HUD.TopRight"),
        UMyMinimapWidget::StaticClass(),
        /*Priority=*/ 100
    );
}
```

---

## Pattern 6: CommonUI Button with Style

```cpp
#pragma once
#include "CommonButtonBase.h"
#include "MyStyledButton.generated.h"

UCLASS()
class MYGAME_API UMyStyledButton : public UCommonButtonBase
{
    GENERATED_BODY()

public:
    // Set button label text
    UFUNCTION(BlueprintCallable, Category = "UI")
    void SetButtonText(const FText& InText);

protected:
    UPROPERTY(meta=(BindWidget))
    UCommonTextBlock* ButtonLabel;

    // Called when CommonUI updates text style (hover, press, etc.)
    virtual void NativeOnCurrentTextStyleChanged() override
    {
        Super::NativeOnCurrentTextStyleChanged();
        if (ButtonLabel)
        {
            // Apply the current style's text class to our label
            ButtonLabel->SetStyle(GetCurrentTextStyleClass());
        }
    }
};

void UMyStyledButton::SetButtonText(const FText& InText)
{
    if (ButtonLabel)
    {
        ButtonLabel->SetText(InText);
    }
}
```

---

## Pattern 7: ListView Data-Driven List

### Entry Interface
```cpp
// Implement IUserObjectListEntry for custom list items
UCLASS()
class MYGAME_API UMyListEntry : public UUserWidget, public IUserObjectListEntry
{
    GENERATED_BODY()

protected:
    UPROPERTY(meta=(BindWidget))
    UTextBlock* ItemName;

    UPROPERTY(meta=(BindWidget))
    UImage* ItemIcon;

    // Called when ListView assigns data to this entry
    virtual void NativeOnListItemObjectSet(UObject* ListItemObject) override
    {
        if (UMyItemData* Data = Cast<UMyItemData>(ListItemObject))
        {
            ItemName->SetText(Data->Name);
            ItemIcon->SetBrushFromTexture(Data->Icon);
        }
    }
};
```

### ListView Setup (in parent widget)
```cpp
void UMyInventoryPanel::NativeConstruct()
{
    Super::NativeConstruct();

    // Set entry widget class
    ItemListView->SetEntryWidgetClass(UMyListEntry::StaticClass());

    // Populate with data
    for (auto& ItemData : InventoryItems)
    {
        ItemListView->AddItem(ItemData);
    }

    // Handle selection
    ItemListView->OnItemSelectionChanged().AddUObject(
        this, &UMyInventoryPanel::HandleItemSelected);
}
```

---

## Pattern 8: World-Space UI (Efficient Approach)

### Option A: Widget Component (Simple, Memory-Heavy)
```cpp
// In actor constructor:
HealthWidgetComp = CreateDefaultSubobject<UWidgetComponent>("HealthWidget");
HealthWidgetComp->SetupAttachment(RootComponent);
HealthWidgetComp->SetWidgetClass(UMyNameplate::StaticClass());
HealthWidgetComp->SetDrawSize(FVector2D(200.f, 50.f));
HealthWidgetComp->SetSpace(EWidgetSpace::Screen);  // Always faces camera
HealthWidgetComp->SetCollisionEnabled(ECollisionEnabled::NoCollision);
```

### Option B: Indicator Layer (Lyra-Style, Performant)
```cpp
// Register indicator instead of creating per-actor Widget Components
// The indicator system batches all indicators into a single widget layer
UMyIndicatorSubsystem* IndicatorSys = GetWorld()->GetSubsystem<UMyIndicatorSubsystem>();
IndicatorSys->RegisterIndicator(
    this,                           // Owner actor
    UMyNameplateIndicator::StaticClass(), // Indicator widget class
    GetMesh()->GetSocketLocation("HeadSocket")  // World position
);
```

The indicator layer approach renders all indicators in a single Slate overlay, avoiding per-actor render targets.

---

## Pattern 9: Game UI Manager Subsystem

Manages the Primary Game Layout lifecycle and provides global UI access.

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
    // Get the primary layout (creates if needed)
    UMyPrimaryGameLayout* GetPrimaryLayout(APlayerController* PC) const;

    // Push widget to a layer by tag
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

## Pattern 10: Safe Widget Creation via Python

```python
import unreal

def create_widget_blueprint(name, path, parent_class_path=None):
    """Create a Widget Blueprint asset safely."""
    full_path = f"{path}/{name}"

    # CRITICAL: Never create_asset on existing path — modal dialog freezes editor
    if unreal.EditorAssetLibrary.does_asset_exist(full_path):
        print(f"Widget already exists: {full_path}")
        return unreal.EditorAssetLibrary.load_asset(full_path)

    factory = unreal.WidgetBlueprintFactory()
    if parent_class_path:
        parent = unreal.load_class(None, parent_class_path)
        if parent:
            factory.set_editor_property('parent_class', parent)

    asset = unreal.AssetToolsHelpers.get_asset_tools().create_asset(
        name, path, unreal.WidgetBlueprint, factory
    )

    if asset is None:
        print(f"ERROR: Failed to create widget: {full_path}")
        return None

    unreal.EditorAssetLibrary.save_asset(full_path)
    print(f"Created widget: {full_path}")
    return asset
```

---

## Build.cs Module Dependencies

### Minimal (UMG only)
```cpp
PublicDependencyModuleNames.AddRange(new string[] {
    "Core", "CoreUObject", "Engine",
    "UMG", "Slate", "SlateCore"
});
```

### CommonUI
```cpp
PublicDependencyModuleNames.AddRange(new string[] {
    "Core", "CoreUObject", "Engine",
    "UMG", "Slate", "SlateCore",
    "CommonUI", "CommonInput"
});
```

### CommonUI + MVVM
```cpp
PublicDependencyModuleNames.AddRange(new string[] {
    "Core", "CoreUObject", "Engine",
    "UMG", "Slate", "SlateCore",
    "CommonUI", "CommonInput",
    "ModelViewViewModel"
});
```

### With GameplayTags (for UIExtension)
```cpp
PublicDependencyModuleNames.AddRange(new string[] {
    "Core", "CoreUObject", "Engine",
    "UMG", "Slate", "SlateCore",
    "CommonUI", "CommonInput",
    "GameplayTags"
});
```

### Full-Featured (CommonUI + MVVM + Tags + InputDevice)
```cpp
PublicDependencyModuleNames.AddRange(new string[] {
    "Core", "CoreUObject", "Engine",
    "UMG", "Slate", "SlateCore",
    "CommonUI", "CommonInput",
    "GameplayTags",
    "ModelViewViewModel",
    "InputCore"
});
```

---

## Pattern 11: Widget Factory (Data-Driven Widget Selection)

Maps data types to widget classes at runtime. Useful for lists where different items need different visuals.

### Header (MyWidgetFactory.h)
```cpp
#pragma once
#include "CoreMinimal.h"
#include "Blueprint/UserWidget.h"
#include "MyWidgetFactory.generated.h"

/**
 * Abstract factory that selects a widget class based on data object type.
 * Subclass to create custom data→widget mappings.
 */
UCLASS(Abstract, Blueprintable, EditInlineNew)
class MYGAME_API UMyWidgetFactory : public UObject
{
    GENERATED_BODY()

public:
    /** Return the widget class appropriate for this data, or nullptr if unsupported. */
    UFUNCTION(BlueprintNativeEvent, Category = "UI")
    TSubclassOf<UUserWidget> FindWidgetClassForData(const UObject* Data) const;
    virtual TSubclassOf<UUserWidget> FindWidgetClassForData_Implementation(const UObject* Data) const
    {
        return nullptr;
    }
};

/**
 * Concrete factory: maps a UObject class to a UUserWidget class.
 * Configure DataClass and WidgetClass in editor. Array of these on a ListView
 * lets each item type display differently.
 */
UCLASS(Blueprintable, EditInlineNew)
class MYGAME_API UMyWidgetFactory_Class : public UMyWidgetFactory
{
    GENERATED_BODY()

public:
    /** The data class this factory handles */
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "UI")
    TSoftClassPtr<UObject> DataClass;

    /** The widget class to create for that data */
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

### Usage in a Custom ListView
```cpp
UCLASS()
class MYGAME_API UMyListView : public UCommonListView
{
    GENERATED_BODY()

public:
    /** Factory rules — first match wins. Configure in Blueprint details. */
    UPROPERTY(EditAnywhere, Instanced, Category = "UI")
    TArray<TObjectPtr<UMyWidgetFactory>> FactoryRules;

protected:
    virtual UUserWidget& OnGenerateEntryWidgetInternal(
        UObject* Item,
        TSubclassOf<UUserWidget> DesiredEntryClass,
        const TSharedRef<STableViewBase>& OwnerTable) override
    {
        // Walk factory rules, use first matching widget class
        for (const UMyWidgetFactory* Factory : FactoryRules)
        {
            if (Factory)
            {
                if (TSubclassOf<UUserWidget> FoundClass = Factory->FindWidgetClassForData(Item))
                {
                    DesiredEntryClass = FoundClass;
                    break;
                }
            }
        }
        return Super::OnGenerateEntryWidgetInternal(Item, DesiredEntryClass, OwnerTable);
    }
};
```

---

## Pattern 12: Tag-Driven Widget Visibility

Widgets that show/hide based on gameplay tags on the owning player. Useful for context-sensitive HUD elements (hide crosshair in vehicle, show stamina bar only when sprinting).

```cpp
#pragma once
#include "CommonUserWidget.h"
#include "GameplayTagContainer.h"
#include "MyTaggedWidget.generated.h"

/**
 * A widget that hides itself when the owning player has any of the specified tags.
 * Tag source: AbilitySystemComponent or custom tag container on PlayerState.
 */
UCLASS()
class MYGAME_API UMyTaggedWidget : public UCommonUserWidget
{
    GENERATED_BODY()

public:
    /** If player has ANY of these tags, widget is hidden */
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "UI")
    FGameplayTagContainer HiddenByTags;

    /** Visibility to use when NOT hidden by tags */
    UPROPERTY(EditAnywhere, Category = "UI")
    ESlateVisibility ShownVisibility = ESlateVisibility::SelfHitTestInvisible;

    /** Visibility to use when hidden by tags */
    UPROPERTY(EditAnywhere, Category = "UI")
    ESlateVisibility HiddenVisibility = ESlateVisibility::Collapsed;

    virtual void SetVisibility(ESlateVisibility InVisibility) override
    {
        // If tags say hidden, force hidden regardless
        if (bIsHiddenByTags && InVisibility != HiddenVisibility)
        {
            Super::SetVisibility(HiddenVisibility);
            return;
        }
        Super::SetVisibility(InVisibility);
    }

protected:
    virtual void NativeConstruct() override
    {
        Super::NativeConstruct();
        // TODO: Bind to ASC tag change delegate or custom event:
        // ASC->RegisterGameplayTagEvent(Tag).AddUObject(this, &OnWatchedTagsChanged);
    }

    virtual void NativeDestruct() override
    {
        // Unbind tag listeners here
        Super::NativeDestruct();
    }

private:
    void OnWatchedTagsChanged(const FGameplayTag Tag, int32 NewCount)
    {
        bIsHiddenByTags = /* check if player has any HiddenByTags */;
        SetVisibility(bIsHiddenByTags ? HiddenVisibility : ShownVisibility);
    }

    bool bIsHiddenByTags = false;
};
```

---

## Pattern 13: Tab List with Descriptors

Extended tab system supporting pre-registered tabs, dynamic registration, and hidden tabs.

### Header (MyTabListWidget.h)
```cpp
#pragma once
#include "CommonTabListWidgetBase.h"
#include "MyTabListWidget.generated.h"

class IMyTabButtonInterface;

USTRUCT(BlueprintType)
struct FMyTabDescriptor
{
    GENERATED_BODY()

    /** Unique identifier for this tab */
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Tab")
    FName TabId;

    /** Display text on tab button */
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Tab")
    FText TabText;

    /** Optional icon for tab button */
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Tab")
    FSlateBrush TabIconBrush;

    /** If true, tab is registered but not visible */
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Tab")
    bool bHidden = false;

    /** Widget class for the tab button itself */
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Tab")
    TSubclassOf<UCommonButtonBase> TabButtonType;

    /** Widget class for the tab content panel */
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Tab")
    TSubclassOf<UCommonActivatableWidget> TabContentType;
};

UCLASS()
class MYGAME_API UMyTabListWidget : public UCommonTabListWidgetBase
{
    GENERATED_BODY()

public:
    /** Pre-register tabs from editor. Called in NativeOnInitialized. */
    UFUNCTION(BlueprintCallable, Category = "Tab")
    bool RegisterDynamicTab(const FMyTabDescriptor& TabInfo);

    /** Show or hide a pre-registered tab at runtime */
    UFUNCTION(BlueprintCallable, Category = "Tab")
    void SetTabHiddenState(FName TabId, bool bHidden);

    /** Delegate fired after content widget is created for a tab */
    DECLARE_DYNAMIC_MULTICAST_DELEGATE_TwoParams(FOnTabContentCreated, FName, TabId, UCommonActivatableWidget*, TabWidget);

    UPROPERTY(BlueprintAssignable, Category = "Tab")
    FOnTabContentCreated OnTabContentCreated;

protected:
    /** Tabs defined in editor */
    UPROPERTY(EditAnywhere, Category = "Tab")
    TArray<FMyTabDescriptor> PreregisteredTabs;

    virtual void NativeOnInitialized() override;

private:
    /** Track tab descriptors by ID */
    TMap<FName, FMyTabDescriptor> TabDescriptors;
};
```

### Implementation (MyTabListWidget.cpp)
```cpp
void UMyTabListWidget::NativeOnInitialized()
{
    Super::NativeOnInitialized();

    for (const FMyTabDescriptor& Tab : PreregisteredTabs)
    {
        if (!Tab.bHidden)
        {
            RegisterDynamicTab(Tab);
        }
        TabDescriptors.Add(Tab.TabId, Tab);
    }
}

bool UMyTabListWidget::RegisterDynamicTab(const FMyTabDescriptor& TabInfo)
{
    return RegisterTab(TabInfo.TabId, TabInfo.TabButtonType, TabInfo.TabContentType,
        [this, TabInfo](UCommonButtonBase& Button)
        {
            // Apply label info to tab button via interface
            if (auto* TabButton = Cast<IMyTabButtonInterface>(&Button))
            {
                TabButton->SetTabLabelInfo(TabInfo);
            }
        });
}

void UMyTabListWidget::SetTabHiddenState(FName TabId, bool bHidden)
{
    if (FMyTabDescriptor* Desc = TabDescriptors.Find(TabId))
    {
        if (Desc->bHidden != bHidden)
        {
            Desc->bHidden = bHidden;
            if (bHidden)
            {
                RemoveTab(TabId);
            }
            else
            {
                RegisterDynamicTab(*Desc);
            }
        }
    }
}
```

---

## Pattern 14: Controller Disconnection Screen

Handles controller disconnect/reconnect with platform-aware user change support.

```cpp
#pragma once
#include "CommonActivatableWidget.h"
#include "GameplayTagContainer.h"
#include "MyControllerDisconnectedScreen.generated.h"

/**
 * Shown when all gamepads are disconnected. On platforms with user pairing
 * (console), offers a "Change User" button.
 */
UCLASS()
class MYGAME_API UMyControllerDisconnectedScreen : public UCommonActivatableWidget
{
    GENERATED_BODY()

public:
    virtual UWidget* NativeGetDesiredFocusTarget() const override;
    virtual TOptional<FUIInputConfig> GetDesiredInputConfig() const override
    {
        return FUIInputConfig(ECommonInputMode::Menu, EMouseCaptureMode::NoCapture);
    }

protected:
    UPROPERTY(meta=(BindWidget))
    UCommonButtonBase* ReconnectButton;

    /** Only visible on platforms where user pairing exists (consoles) */
    UPROPERTY(meta=(BindWidgetOptional))
    UCommonButtonBase* ChangeUserButton;

    /** Tags for platforms that support user change (e.g., "Platform.Xbox", "Platform.PS5") */
    UPROPERTY(EditAnywhere, Category = "Platform")
    FGameplayTagContainer PlatformSupportsUserChangeTags;

    virtual void NativeOnActivated() override;
    virtual void NativeOnDeactivated() override;

private:
    void HandleInputDeviceConnectionChanged(EInputDeviceConnectionState NewState,
        FPlatformUserId UserId, FInputDeviceId InputDeviceId);

    UFUNCTION()
    void HandleChangeUserClicked();
};
```

### Integration in HUD Layout
```cpp
// In your HUD layout widget — deferred processing avoids re-entrant issues:
void UMyHUDLayout::ProcessControllerDisconnect()
{
    // IMPORTANT: Defer to next tick to avoid re-entrant activation issues
    FTSTicker::GetCoreTicker().AddTicker(
        FTickerDelegate::CreateWeakLambda(this, [this](float DeltaTime) -> bool
        {
            if (bNeedsDisconnectScreen && !DisconnectScreenActive)
            {
                // Push disconnect screen to Menu layer
                if (UMyPrimaryGameLayout* Layout = GetPrimaryLayout())
                {
                    Layout->PushWidgetToLayer(
                        TAG_UI_LAYER_MENU,
                        ControllerDisconnectedScreenClass);
                    DisconnectScreenActive = true;
                }
            }
            return false; // One-shot
        }),
        0.0f);
}
```

---

## Pattern 15: Loading Screen Subsystem

Persists loading screen widget class across map transitions using a GameInstanceSubsystem.

```cpp
#pragma once
#include "Subsystems/GameInstanceSubsystem.h"
#include "MyLoadingScreenSubsystem.generated.h"

DECLARE_DYNAMIC_MULTICAST_DELEGATE_OneParam(FOnLoadingScreenWidgetChanged,
    TSubclassOf<UUserWidget>, NewWidgetClass);

/**
 * Stores and broadcasts the loading screen widget class.
 * GameInstanceSubsystem lifetime = entire game session (survives map loads).
 */
UCLASS()
class MYGAME_API UMyLoadingScreenSubsystem : public UGameInstanceSubsystem
{
    GENERATED_BODY()

public:
    /** Set the widget class to show during loading. Call before map transitions. */
    UFUNCTION(BlueprintCallable, Category = "Loading")
    void SetLoadingScreenContentWidget(TSubclassOf<UUserWidget> NewWidgetClass)
    {
        if (LoadingScreenWidgetClass != NewWidgetClass)
        {
            LoadingScreenWidgetClass = NewWidgetClass;
            OnLoadingScreenWidgetChanged.Broadcast(NewWidgetClass);
        }
    }

    /** Get current loading screen widget class */
    UFUNCTION(BlueprintPure, Category = "Loading")
    TSubclassOf<UUserWidget> GetLoadingScreenContentWidget() const
    {
        return LoadingScreenWidgetClass;
    }

    /** Fired when loading screen widget changes (e.g., different experience needs different loading art) */
    UPROPERTY(BlueprintAssignable, Category = "Loading")
    FOnLoadingScreenWidgetChanged OnLoadingScreenWidgetChanged;

private:
    UPROPERTY()
    TSubclassOf<UUserWidget> LoadingScreenWidgetClass;
};
```

---

## Pattern 16: Activatable Widget with Input Mode Enum

Extends the base activatable widget with a data-driven input mode selector.

```cpp
#pragma once
#include "CommonActivatableWidget.h"
#include "MyActivatableWidget.generated.h"

/** Simplified input mode selector for widget configuration in editor */
UENUM(BlueprintType)
enum class EMyWidgetInputMode : uint8
{
    /** Use default CommonUI behavior */
    Default,
    /** Widget receives both game and menu input (e.g., HUD with interactive elements) */
    GameAndMenu,
    /** Widget blocks game input, captures mouse (e.g., painting, placement) */
    Game,
    /** Widget blocks game input, frees mouse (e.g., menus, dialogs) */
    Menu
};

UCLASS(Abstract, BlueprintType)
class MYGAME_API UMyActivatableWidget : public UCommonActivatableWidget
{
    GENERATED_BODY()

public:
    /** Configure in editor per widget class. No need to override GetDesiredInputConfig in every subclass. */
    UPROPERTY(EditDefaultsOnly, Category = "Input")
    EMyWidgetInputMode InputConfig = EMyWidgetInputMode::Default;

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

#if WITH_EDITOR
    virtual void ValidateCompiledWidgetTree(const UWidgetTree& BlueprintWidgetTree,
        class IWidgetCompilerLog& CompileLog) const override
    {
        Super::ValidateCompiledWidgetTree(BlueprintWidgetTree, CompileLog);
        // Warn if BP_GetDesiredFocusTarget is not implemented — catches gamepad nav bugs at compile time
        if (!GetClass()->IsFunctionImplementedInScript(GET_FUNCTION_NAME_CHECKED(
            UCommonActivatableWidget, BP_GetDesiredFocusTarget)))
        {
            CompileLog.Warning(FText::FromString(
                TEXT("GetDesiredFocusTarget is not implemented — gamepad navigation will not work.")));
        }
    }
#endif
};
```

---

## Pattern 17: Simulated Input Widget (Touch → Enhanced Input)

Injects touch input into the Enhanced Input subsystem. Base for virtual joysticks and touch regions.

### Header (MySimulatedInputWidget.h)
```cpp
#pragma once
#include "CommonUserWidget.h"
#include "InputAction.h"
#include "MySimulatedInputWidget.generated.h"

/**
 * Widget that simulates Enhanced Input actions from touch/UI interaction.
 * Subclass for virtual joysticks, touch regions, on-screen buttons.
 */
UCLASS(Abstract)
class MYGAME_API UMySimulatedInputWidget : public UCommonUserWidget
{
    GENERATED_BODY()

public:
    /** The input action to simulate (e.g., IA_Move, IA_Look) */
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Input")
    TObjectPtr<UInputAction> AssociatedInputAction;

protected:
    virtual void NativeConstruct() override;
    virtual void NativeDestruct() override;

    /** Inject a float value into the Enhanced Input system */
    void InputKeyValue(const FVector& Value);

    /** Inject a 2D value */
    void InputKeyValue2D(const FVector2D& Value);

    /** Stop all injected input */
    void FlushSimulatedInput();

    /** Query which physical key maps to the associated action (for icon display) */
    FKey QueryKeyToSimulate() const;

private:
    /** Rebuild key mapping when input contexts change */
    void OnControlMappingsRebuilt();

    FKey CachedSimulatedKey;
};
```

### Virtual Joystick Widget
```cpp
#pragma once
#include "MySimulatedInputWidget.h"
#include "MyJoystickWidget.generated.h"

/**
 * On-screen virtual analog stick. Inject 2D movement into Enhanced Input.
 * Background stays at initial touch position; foreground follows thumb.
 */
UCLASS()
class MYGAME_API UMyJoystickWidget : public UMySimulatedInputWidget
{
    GENERATED_BODY()

public:
    /** The joystick background image */
    UPROPERTY(meta=(BindWidget))
    UImage* JoystickBackground;

    /** The joystick foreground/thumb image */
    UPROPERTY(meta=(BindWidget))
    UImage* JoystickForeground;

    /** Maximum pixel distance the thumb can travel from center */
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Joystick")
    float StickRange = 100.f;

    /** Negate Y axis (common for camera look) */
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Joystick")
    bool bNegateYAxis = false;

protected:
    virtual FReply NativeOnTouchStarted(const FGeometry& Geometry, const FPointerEvent& Event) override;
    virtual FReply NativeOnTouchMoved(const FGeometry& Geometry, const FPointerEvent& Event) override;
    virtual FReply NativeOnTouchEnded(const FGeometry& Geometry, const FPointerEvent& Event) override;
    virtual void NativeTick(const FGeometry& Geometry, float DeltaTime) override;

private:
    /** Where the player first touched — joystick centers here */
    FVector2D TouchOrigin = FVector2D::ZeroVector;

    /** Current stick deflection [-1, 1] per axis */
    FVector2D StickVector = FVector2D::ZeroVector;

    bool bIsActive = false;
};
```

---

## Pattern 18: Messaging / Dialog Subsystem

Centralized dialog/confirmation system using CommonUI's messaging infrastructure.

```cpp
#pragma once
#include "CommonMessagingSubsystem.h"
#include "MyUIMessaging.generated.h"

/**
 * Game-level messaging subsystem. Configured via DefaultGame.ini:
 *
 * [/Script/MyGame.UMyUIMessaging]
 * ConfirmationDialogClass=/Game/UI/Dialogs/WBP_Confirmation.WBP_Confirmation_C
 * ErrorDialogClass=/Game/UI/Dialogs/WBP_Error.WBP_Error_C
 */
UCLASS()
class MYGAME_API UMyUIMessaging : public UCommonMessagingSubsystem
{
    GENERATED_BODY()

public:
    virtual void Initialize(FSubsystemCollectionBase& Collection) override;

    /** Show confirmation dialog (Yes/No, OK/Cancel, etc.) */
    virtual void ShowConfirmation(
        UCommonGameDialogDescriptor* DialogDescriptor,
        FCommonMessagingResultDelegate ResultCallback = FCommonMessagingResultDelegate()) override;

    /** Show error dialog (OK only) */
    virtual void ShowError(
        UCommonGameDialogDescriptor* DialogDescriptor,
        FCommonMessagingResultDelegate ResultCallback = FCommonMessagingResultDelegate()) override;

private:
    UPROPERTY()
    TSubclassOf<UCommonGameDialog> ConfirmationDialogClass;

    UPROPERTY()
    TSubclassOf<UCommonGameDialog> ErrorDialogClass;
};
```

### Confirmation Screen Widget
```cpp
UCLASS()
class MYGAME_API UMyConfirmationScreen : public UCommonGameDialog
{
    GENERATED_BODY()

public:
    virtual void SetupDialog(UCommonGameDialogDescriptor* Descriptor,
        FCommonMessagingResultDelegate ResultCallback) override;
    virtual void KillDialog() override;

protected:
    UPROPERTY(meta=(BindWidget))
    UCommonTextBlock* Text_Title;

    UPROPERTY(meta=(BindWidget))
    URichTextBlock* RichText_Description;

    UPROPERTY(meta=(BindWidget))
    UDynamicEntryBox* EntryBox_Buttons;

    /** Tap outside dialog to close (mobile-friendly) */
    UPROPERTY(meta=(BindWidgetOptional))
    UBorder* Border_TapToCloseZone;

private:
    FCommonMessagingResultDelegate OnResultCallback;
};
```

### Pushing Dialogs
```cpp
// From any game code:
void ShowQuitConfirmation(APlayerController* PC)
{
    UCommonGameDialogDescriptor* Desc = UCommonGameDialogDescriptor::CreateConfirmationOk(
        LOCTEXT("QuitTitle", "Quit Game?"),
        LOCTEXT("QuitBody", "Are you sure you want to quit?"));

    UMyUIMessaging* Messaging = PC->GetGameInstance()->GetSubsystem<UMyUIMessaging>();
    Messaging->ShowConfirmation(Desc,
        FCommonMessagingResultDelegate::CreateLambda([](ECommonMessagingResult Result)
        {
            if (Result == ECommonMessagingResult::Confirmed)
            {
                UKismetSystemLibrary::QuitGame(GetWorld(), nullptr,
                    EQuitPreference::Quit, false);
            }
        }));
}
```

---

## Pattern 19: Settings Screen with Dirty State

Settings screen that dynamically shows/hides Apply/Cancel actions based on pending changes.

```cpp
#pragma once
#include "GameSettingScreen.h"
#include "MySettingScreen.generated.h"

class UMyTabListWidget;

UCLASS(Abstract)
class MYGAME_API UMySettingScreen : public UGameSettingScreen
{
    GENERATED_BODY()

protected:
    /** Optional tab list for multi-section settings */
    UPROPERTY(meta=(BindWidgetOptional))
    UMyTabListWidget* TopSettingsTabs;

    virtual void NativeOnInitialized() override;

    /** Called when settings have unsaved changes */
    virtual void OnSettingsDirtyStateChanged_Implementation(bool bSettingsDirty) override
    {
        if (bSettingsDirty)
        {
            // Show Apply and Cancel actions — only when there are changes to save
            if (ApplyAction.IsValid()) { AddActionBinding(ApplyAction); }
            if (CancelChangesAction.IsValid()) { AddActionBinding(CancelChangesAction); }
        }
        else
        {
            // Hide Apply/Cancel — no pending changes
            RemoveActionBinding(ApplyAction);
            RemoveActionBinding(CancelChangesAction);
        }
    }

private:
    FUIActionBindingHandle BackAction;
    FUIActionBindingHandle ApplyAction;
    FUIActionBindingHandle CancelChangesAction;
};
```

### Configuration (DefaultGame.ini)
```ini
[/Script/MyGame.MySettingScreen]
; Configured via GameSettingRegistry — see GameSettings plugin documentation
```

---

## Pattern 20: Bound Action Button with Input-Method Styles

Button that automatically switches visual style based on current input device.

```cpp
#pragma once
#include "CommonBoundActionButton.h"
#include "MyBoundActionButton.generated.h"

/**
 * Action-bound button that visually adapts to keyboard/gamepad/touch.
 * Each input method can have a completely different button style.
 */
UCLASS()
class MYGAME_API UMyBoundActionButton : public UCommonBoundActionButton
{
    GENERATED_BODY()

public:
    /** Style for keyboard/mouse users */
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Styles")
    TSubclassOf<UCommonButtonStyle> KeyboardStyle;

    /** Style for gamepad users */
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Styles")
    TSubclassOf<UCommonButtonStyle> GamepadStyle;

    /** Style for touch users */
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Styles")
    TSubclassOf<UCommonButtonStyle> TouchStyle;

protected:
    virtual void NativeConstruct() override
    {
        Super::NativeConstruct();
        UpdateButtonStyle(GetCurrentInputType());
    }

    /** Called by CommonUI when input method changes */
    void OnInputMethodChanged(ECommonInputType NewInputType)
    {
        UpdateButtonStyle(NewInputType);
    }

private:
    void UpdateButtonStyle(ECommonInputType InputType)
    {
        TSubclassOf<UCommonButtonStyle> DesiredStyle;
        switch (InputType)
        {
        case ECommonInputType::MouseAndKeyboard: DesiredStyle = KeyboardStyle; break;
        case ECommonInputType::Gamepad: DesiredStyle = GamepadStyle; break;
        case ECommonInputType::Touch: DesiredStyle = TouchStyle; break;
        }
        if (DesiredStyle)
        {
            SetStyle(DesiredStyle);
        }
    }
};
```

---

## Pattern 21: Frontend State Component (Main Menu Flow)

Manages frontend flow (splash → press start → main menu) using a state machine pattern.

```cpp
#pragma once
#include "Components/GameStateComponent.h"
#include "MyFrontendStateComponent.generated.h"

/**
 * GameStateComponent that drives the frontend UI flow.
 * Attached to the frontend GameState. Manages loading screen → press start → main menu.
 */
UCLASS()
class MYGAME_API UMyFrontendStateComponent : public UGameStateComponent
{
    GENERATED_BODY()

public:
    /** Should we show loading screen during this state? */
    bool ShouldShowLoadingScreen() const { return bShowLoadingScreen; }

protected:
    /** Press start screen widget (first screen shown) */
    UPROPERTY(EditAnywhere, Category = "Frontend")
    TSoftClassPtr<UCommonActivatableWidget> PressStartScreenClass;

    /** Main menu screen widget (shown after press start) */
    UPROPERTY(EditAnywhere, Category = "Frontend")
    TSoftClassPtr<UCommonActivatableWidget> MainScreenClass;

    virtual void BeginPlay() override;

private:
    /** Flow steps (each loads async, pushes to menu layer, transitions to next) */
    void FlowStep_WaitForInput();
    void FlowStep_ShowMainMenu();
    void FlowStep_TryShowMainScreen();

    bool bShowLoadingScreen = true;
};
```

### Key Design Decisions
- Use **TSoftClassPtr** for async loading — frontend widgets may be large Blueprints
- Use **UCommonUIExtensions::PushStreamedContentToLayer_ForPlayer** for async push
- **GameStateComponent** ties lifecycle to the map's GameState — auto-cleanup on map change
- Show loading screen until async loads complete, then hide

---

## Pattern 22: Indicator System (Screen-Space World Indicators)

High-performance system for rendering screen-space indicators (nameplates, waypoints, objective markers) without per-actor Widget Components.

### Indicator Descriptor
```cpp
UCLASS(BlueprintType)
class MYGAME_API UIndicatorDescriptor : public UObject
{
    GENERATED_BODY()

public:
    /** The actor this indicator tracks */
    UPROPERTY(BlueprintReadOnly, Category = "Indicator")
    TWeakObjectPtr<AActor> OwnerActor;

    /** Widget class to display for this indicator */
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Indicator")
    TSubclassOf<UUserWidget> IndicatorWidgetClass;

    /** World-space offset from actor origin */
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Indicator")
    FVector WorldOffset = FVector(0, 0, 100.f);

    /** Clamp to screen edges when off-screen? */
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Indicator")
    bool bClampToScreen = false;

    /** Max distance before indicator hides */
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Indicator")
    float MaxVisibleDistance = 10000.f;
};
```

### Manager Component (on PlayerController)
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

    UFUNCTION(BlueprintPure, Category = "Indicator")
    const TArray<UIndicatorDescriptor*>& GetIndicators() const { return Indicators; }

private:
    UPROPERTY()
    TArray<TObjectPtr<UIndicatorDescriptor>> Indicators;
};
```

### Key Architecture
- **Single overlay widget** (SActorCanvas or custom UUserWidget) renders ALL indicators
- Each indicator is a pooled child widget, positioned via screen projection
- **Much cheaper** than Widget Components (no per-actor render targets)
- Manager component fires events; overlay widget listens and creates/removes child widgets
- Supports 100+ simultaneous indicators with minimal GPU overhead
