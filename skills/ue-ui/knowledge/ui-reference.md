# UE UI Reference

## UMG (Unreal Motion Graphics)

### Widget Type Hierarchy
UMG wraps Slate widgets with UObject-based memory management (GC) and Blueprint accessibility.

**Leaf Widgets** (no children):
- `UTextBlock` — text display (ALWAYS use FText)
- `UImage` — texture/brush display
- `UProgressBar` — fill-based progress indicator
- `URichTextBlock` — text with inline styling/images
- `UEditableText` / `UEditableTextBox` — text input fields
- `UCheckBox` — toggle checkbox
- `USpinBox` — numeric spinner
- `USlider` — draggable value slider
- `UCircularThrobber` / `UThrobber` — loading indicators

**Compound Widgets** (fixed named slots):
- `UButton` — clickable container (one child slot)
- `UBorder` — single-child container with background brush
- `UNamedSlot` — placeholder slot for dynamic content injection
- `USizeBox` — constrains child to min/max/fixed dimensions
- `UScaleBox` — scales child to fit container
- `UBackgroundBlur` — applies blur behind content
- `UInvalidationBox` — caches child rendering (performance optimization)
- `URetainerBox` — renders children to a render target (for material effects)

**Panel Widgets** (dynamic child collections):
- `UHorizontalBox` — children laid out left-to-right
- `UVerticalBox` — children laid out top-to-bottom
- `UCanvasPanel` — absolute positioning with anchors
- `UOverlay` — children stacked on top of each other
- `UGridPanel` — grid layout with row/column assignment
- `UUniformGridPanel` — equal-sized grid cells
- `UWrapBox` — wraps children to next line when full
- `UScrollBox` — scrollable child container
- `UWidgetSwitcher` — shows one child at a time (tab-like)
- `UListView` / `UTileView` / `UTreeView` — data-driven lists (UE 4.23+)

### Layout System (Two-Pass)

**Pass 1: Cache Desired Size** (bottom-up)
- Each leaf widget reports its desired dimensions
- Parents aggregate children's sizes based on layout rules
- Result: every widget knows its minimum required space

**Pass 2: Arrange Children** (top-down)
- Root widget receives viewport allotment
- Parents distribute space to children based on slots, alignment, padding
- Slot properties control distribution: `FSlot::AutoSize`, `FSlot::FillSize`, `FSlot::SizeRule`

### Anchors and Alignment
- **Anchors**: Define reference points relative to parent (0,0 = top-left, 1,1 = bottom-right)
- **Alignment**: Pivot point for positioning (0,0 = top-left of widget, 0.5,0.5 = center)
- **Offsets**: Distance from anchor in pixels
- **Stretch anchor**: Setting min/max anchor to different values stretches widget with parent

### Key Enums
```
EHorizontalAlignment: HAlign_Fill, HAlign_Left, HAlign_Center, HAlign_Right
EVerticalAlignment: VAlign_Fill, VAlign_Top, VAlign_Center, VAlign_Bottom
ESlateVisibility: Visible, Collapsed, Hidden, HitTestInvisible, SelfHitTestInvisible
```

**Visibility distinctions:**
- `Visible` — rendered + interactive
- `Collapsed` — not rendered, takes no space
- `Hidden` — not rendered, still takes space
- `HitTestInvisible` — rendered but click-through (children too)
- `SelfHitTestInvisible` — rendered, self click-through, children still interactive

---

## CommonUI Framework

### Core Classes

**`UCommonActivatableWidget`** — Base for widgets participating in activation lifecycle
- `NativeOnActivated()` / `NativeOnDeactivated()` — lifecycle callbacks
- `NativeGetDesiredFocusTarget()` — MUST override for gamepad nav
- `GetDesiredInputConfig()` — MUST override for input state
- `NativeOnHandleBackAction()` — handle Escape/B-button
- `ActivateWidget()` / `DeactivateWidget()` — manual activation control

**`UCommonActivatableWidgetContainerStack`** — LIFO stack of activatable widgets
- `AddWidget(TSubclassOf<UCommonActivatableWidget>)` — push and activate
- Top widget is active, previous is deactivated but still in memory
- Pop restores previous widget

**`UCommonActivatableWidgetContainerQueue`** — FIFO queue variant
- First widget is active, subsequent wait in queue
- When active widget deactivates, next in queue activates

**`UCommonButtonBase`** — Feature-rich button (UserWidget, not UWidget child)
- 7 visual states with centralized styling via `UCommonButtonStyle` data asset
- Toggle support (`SetIsToggleable`, `SetIsSelected`)
- Persistent tooltips when disabled
- Override `NativeOnCurrentTextStyleChanged()` for text styling
- Override `NativeOnSelected()` / `NativeOnDeselected()` for custom behavior

**`UCommonTextBlock`** — Platform-adaptive text with style sets

**`UCommonUIActionRouter`** — Centralized input distribution across UI layers

### Button Style Data Asset (UCommonButtonStyle)
Defines appearance for all 7 button states:
| State | When Active |
|-------|------------|
| Normal | Default idle state |
| Normal Hovered | Mouse/focus hover |
| Normal Pressed | Click/press down |
| Selected Base | Toggle selected, idle |
| Selected Hovered | Toggle selected, hover |
| Selected Pressed | Toggle selected, press |
| Disabled | Interaction blocked |

Each state specifies: brush (texture), text style, material.

### Input Configuration
```cpp
// Return from GetDesiredInputConfig():
FUIInputConfig Config;
Config.InputMode = ECommonInputMode::Menu;  // Menu, Game, All
Config.MouseCaptureMode = EMouseCaptureMode::NoCapture;
return Config;
```

### CommonUI Module Dependencies (Build.cs)
```cpp
PublicDependencyModuleNames.AddRange(new string[] {
    "CommonUI",
    "CommonInput"
});
```

---

## Slate Overview (Low-Level)

### When to Use Slate Directly
- Editor plugins and tools (all UE Editor UI is Slate)
- Custom low-level widgets that UMG doesn't provide
- Maximum performance (no UObject overhead)
- `SMeshWidget` for hardware-instanced world-space UI (single draw call)

### Slate Declarative Syntax
```cpp
SNew(SHorizontalBox)
+ SHorizontalBox::Slot()
  .AutoWidth()
  .Padding(5.f)
  [
    SNew(STextBlock)
    .Text(LOCTEXT("Label", "Health:"))
  ]
+ SHorizontalBox::Slot()
  .FillWidth(1.f)
  [
    SNew(SProgressBar)
    .Percent_Lambda([this]() { return Health / MaxHealth; })
  ]
```

### Key Slate Concepts
- **TSharedPtr/TSharedRef/TWeakPtr** — smart pointer memory management (not GC)
- **Attributes**: `TAttribute<T>` for dynamic property binding (supports delegates)
- **Slots**: Named child positions with layout parameters
- **`SNew()` / `SAssignNew()`** — widget construction macros
- **`FSlateApplication`** — singleton managing all Slate state

---

## MVVM (Model-View-ViewModel)

### UE Built-in Plugin (UE 5.1+)
Module: `ModelViewViewModel`

**ViewModel base:**
```cpp
UCLASS()
class UMyViewModel : public UMVVMViewModelBase
{
    GENERATED_BODY()
public:
    UPROPERTY(BlueprintReadWrite, FieldNotify, Setter, Getter)
    int32 Health;

    void SetHealth(int32 NewValue) { UE_MVVM_SET_PROPERTY_VALUE(Health, NewValue); }
    int32 GetHealth() const { return Health; }
};
```

**Key concepts:**
- `FieldNotify` specifier auto-generates change notification events
- `UE_MVVM_SET_PROPERTY_VALUE` macro updates + notifies bound views
- Bindings configured in UMG Widget editor ViewModel panel
- `SetViewModel()` / `CreateViewModel()` at runtime to assign

### MDViewModel Plugin (Community Alternative)
- More mature, available since UE 5.0
- `UMDViewModelBase` with `MDVM_SET_FIELD` macro
- `InitializeViewModel()` / `ShutdownViewModel()` lifecycle
- `GetContextObjectEnsure()` retrieves data source
- Both C++ and Blueprint ViewModel creation

### Module Dependencies
```cpp
PrivateDependencyModuleNames.Add("ModelViewViewModel");
```

---

## UUserWidget Lifecycle

### Key Virtual Methods
```cpp
// Construction — called when added to viewport
virtual void NativeConstruct() override;

// Destruction — called when removed from viewport
virtual void NativeDestruct() override;

// Tick — AVOID if possible; prefer event-driven
virtual void NativeTick(const FGeometry& MyGeometry, float InDeltaTime) override;

// Paint — custom rendering
virtual int32 NativePaint(const FPaintArgs& Args, ...) const override;
```

### BindWidget Pattern
```cpp
UCLASS()
class UMyWidget : public UUserWidget
{
    GENERATED_BODY()
protected:
    // MUST exist in Blueprint child with this exact name
    UPROPERTY(meta=(BindWidget))
    UTextBlock* HealthText;

    // MAY exist in Blueprint child
    UPROPERTY(meta=(BindWidgetOptional))
    UImage* AvatarImage;

    // Anim MUST exist in Blueprint child
    UPROPERTY(meta=(BindWidgetAnim), Transient)
    UWidgetAnimation* FadeInAnimation;
};
```

---

## Widget Animation

### UMG Animations
- Created in UMG Designer: Window → Animations panel
- Track properties: RenderTransform, Opacity, Color, Visibility, Material parameters
- Play from C++:
  ```cpp
  PlayAnimation(FadeInAnim, 0.f, 1, EUMGSequencePlayMode::Forward, 1.f);
  PlayAnimationReverse(FadeInAnim);
  StopAnimation(FadeInAnim);
  IsAnimationPlaying(FadeInAnim);
  ```
- Bind completion: `FadeInAnim->OnAnimationFinished`

### Programmatic Animation
```cpp
// Interpolate widget property over time
FTimerHandle Handle;
GetWorld()->GetTimerManager().SetTimer(Handle, [this]() {
    float Alpha = FMath::InterpEaseInOut(0.f, 1.f, Progress, 2.f);
    MyWidget->SetRenderOpacity(Alpha);
}, 0.016f, true); // ~60fps
```

---

## Accessibility

### Screen Reader Support
- `USlateAccessibleMessageHandler` — routes accessibility events
- `UScreenReaderWidgetExtension` — widget-level screen reader
- Set `bIsReadOnly`, `AccessibleText`, `AccessibleSummaryText` on widgets
- Test with platform screen readers (Narrator, VoiceOver, TalkBack)

### Focus Navigation
- Tab order follows widget hierarchy by default
- Override `GetDesiredFocusTarget()` on activatable widgets
- Use `SetFocus()` / `HasKeyboardFocus()` for manual focus control
- `Navigation` property on widgets: Stop, Wrap, Explicit, Custom

---

## CommonUI Extended Classes

### UCommonGameViewportClient
Viewport client that integrates with CommonUI input routing. **Required** — set in Project Settings → Engine → General → Game Viewport Client Class. Subclass for analog cursor support.

### UCommonMessagingSubsystem
LocalPlayerSubsystem for dialog/confirmation management. Override `ShowConfirmation()` and `ShowError()` to push custom dialog widgets to modal layer.

### UCommonGameDialog
Base class for modal dialogs (confirmation, error, info). Override:
- `SetupDialog(UCommonGameDialogDescriptor*, FCommonMessagingResultDelegate)` — configure title, description, buttons
- `KillDialog()` — clean up

### UCommonGameDialogDescriptor
Descriptor object containing dialog configuration:
- `Header` (FText) — dialog title
- `Body` (FText) — dialog message
- `ButtonDescriptors` (TArray) — button labels and result values
- Factory methods: `CreateConfirmationOk()`, `CreateConfirmationOkCancel()`

### UCommonBoundActionButton
Button that auto-binds to a registered CommonUI action. Displays correct icon for current input method. Combine with `UCommonBoundActionBar` for contextual prompts.

### UCommonTabListWidgetBase
Tab list with shoulder button (LB/RB) switching. Key methods:
- `RegisterTab(FName TabId, TSubclassOf<UCommonButtonBase>, TSubclassOf<UWidget>)` — register tab
- `RemoveTab(FName TabId)` — remove tab at runtime
- `SetLinkedSwitcher(UCommonAnimatedSwitcher*)` — link content switcher
- Shoulder button actions configured via `NextTabInputActionData` / `PreviousTabInputActionData`

### UCommonUserWidget
Base user widget with CommonUI integration (input method awareness, platform detection). Lighter than `UCommonActivatableWidget` — use when activation lifecycle is not needed.

### UGameUIManagerSubsystem
GameInstanceSubsystem managing PrimaryGameLayout lifecycle per local player. Override to:
- Create/destroy layout on player join/leave
- Provide global access to push widgets to layers
- Manage UI policy (which layout class to use)

### UGameSettingScreen
CommonUI-integrated settings screen with:
- Dirty state tracking (unsaved changes)
- Action bindings for Back/Apply/Cancel
- Integration with `UGameSettingRegistry` for data-driven settings

### IPlatformInputDeviceMapper
Platform service for device connection/pairing events:
- `GetOnInputDeviceConnectionChange()` — delegate for connect/disconnect
- `GetOnInputDevicePairingChange()` — delegate for user pairing changes (console)
- Used for controller disconnect screen implementation

---

## Widget Factory Pattern

### When to Use
- ListView/TileView with **mixed item types** (headers, regular items, separators)
- Dynamic content where widget class depends on data
- Plugin/mod systems injecting custom UI elements

### Architecture
```
UMyWidgetFactory (abstract)
    ├── FindWidgetClassForData(UObject* Data) → TSubclassOf<UUserWidget>
    │
    ├── UMyWidgetFactory_Class (concrete)
    │     ├── DataClass: TSoftClassPtr<UObject>  (matches against)
    │     └── WidgetClass: TSubclassOf<UUserWidget> (returns)
    │
    └── UMyWidgetFactory_CustomLogic (concrete)
          └── Custom matching logic (e.g., by interface, tag, or property)

UMyListView
    ├── FactoryRules: TArray<UMyWidgetFactory*>
    └── OnGenerateEntryWidgetInternal: walks rules, first match wins
```

### Key Design Decisions
- Factories are `EditInlineNew` UObjects — configure in Blueprint Details panel
- First-match semantics — order matters in the rules array
- Works with ListView's widget pooling — pool is per-class, so mixed types are handled correctly

---

## Indicator System Architecture

### When to Use
- 20+ world-space UI elements (nameplates, waypoints, damage numbers)
- Performance matters (Widget Components create per-actor render targets)

### Components
```
UIndicatorDescriptor (UObject)
    ├── OwnerActor (TWeakObjectPtr<AActor>)
    ├── IndicatorWidgetClass (TSubclassOf<UUserWidget>)
    ├── WorldOffset (FVector)
    ├── bClampToScreen (bool)
    └── MaxVisibleDistance (float)

UMyIndicatorManagerComponent (UControllerComponent)
    ├── AddIndicator(UIndicatorDescriptor*) → OnIndicatorAdded
    ├── RemoveIndicator(UIndicatorDescriptor*) → OnIndicatorRemoved
    └── GetIndicators() → TArray<UIndicatorDescriptor*>

Overlay Widget (SActorCanvas or custom UUserWidget)
    ├── Listens to manager events
    ├── Creates/pools child widgets per indicator
    ├── Projects world position to screen each frame
    └── Single Slate layer — no render targets
```

### Performance Comparison
| Approach | 100 Indicators | GPU Memory | Draw Calls |
|----------|---------------|------------|------------|
| Widget Components | Heavy (~100 RT) | ~200MB+ | 100+ |
| Indicator System | Lightweight | ~1MB | 1-2 |
