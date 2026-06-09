# UMG Fundamentals

## Widget Hierarchy and Composition

UMG (Unreal Motion Graphics) is Unreal Engine's runtime UI framework built on top of Slate. The hierarchy:

- **UWidget** -- base class for all UMG widgets. Wraps an underlying Slate widget.
- **UUserWidget** -- the primary class you subclass for custom UI. Contains a widget tree designed in the UMG editor.
- **UPanelWidget** -- base for widgets that contain children (Canvas Panel, Vertical Box, etc.).

Widget composition rules:
- A `UUserWidget` is a self-contained unit. It owns a widget tree defined in its Blueprint.
- Widgets are composed by nesting `UUserWidget` subclasses inside each other via the designer or code.
- Each `UUserWidget` can be thought of as a "component" -- keep them focused and reusable.
- The root of every `UUserWidget` must be a panel widget (Canvas Panel, Overlay, Size Box, etc.).

## UserWidget Lifecycle

Understanding the lifecycle prevents initialization bugs:

1. **Constructor** -- C++ constructor. Do not access widget tree here; it is not yet built.
2. **Initialize()** -- Called after the widget is created by `CreateWidget`. The widget tree exists but is not yet in the viewport. Safe to cache references to sub-widgets.
3. **NativeConstruct()** / `Construct` (BP) -- Called when the widget is added to the viewport or a parent. This is where you set up initial state, bind delegates, and populate data. Called every time the widget is added (not just once).
4. **NativeTick()** / `Tick` (BP) -- Called every frame if ticking is enabled. Avoid using this; prefer event-driven updates.
5. **NativeDestruct()** / `Destruct` (BP) -- Called when the widget is removed from parent or viewport. Unbind delegates and clean up references here.
6. **BeginDestroy()** -- GC phase. Do not rely on this for UI cleanup.

Key ordering: `CreateWidget` -> `Initialize` -> `AddToViewport`/`AddToPlayerScreen` -> `NativeConstruct` -> (active) -> `RemoveFromParent` -> `NativeDestruct`.

## C++ Widget Binding

Bind C++ variables to widgets placed in the UMG designer:

```cpp
// Required binding -- crashes if widget not found in designer
UPROPERTY(meta = (BindWidget))
UTextBlock* HealthText;

// Optional binding -- nullptr if widget not found
UPROPERTY(meta = (BindWidgetOptional))
UImage* AvatarImage;

// Animation binding -- binds to a UMG animation by name
UPROPERTY(meta = (BindWidgetAnim), Transient)
UWidgetAnimation* FadeInAnimation;
```

Rules for BindWidget:
- The variable name must exactly match the widget name in the designer.
- The type must match (e.g., `UTextBlock*` for a Text widget).
- `BindWidget` causes a compile error in the widget Blueprint if the widget is missing.
- `BindWidgetOptional` allows the widget to be absent -- always null-check before use.
- `BindWidgetAnim` binds to animations created in the UMG animation timeline.

## Data Update Strategy (Ranked Best → Worst)

Four approaches to keeping UI in sync with game data. Choose the highest-ranked approach that fits your complexity:

### 1. MVVM FieldNotify (Best — UE 5.1+)
The ViewModel plugin (`ModelViewViewModel`) provides automatic, change-driven binding between C++ properties and UMG widgets. UI updates only when values actually change — no polling, no manual calls.

```cpp
// ViewModel — data layer
UCLASS()
class UMyHealthVM : public UMVVMViewModelBase
{
    GENERATED_BODY()
public:
    UFUNCTION(BlueprintPure, FieldNotify)
    float GetHealthPercent() const
    {
        return MaxHealth > 0.f ? CurrentHealth / MaxHealth : 0.f;
    }

protected:
    void SetCurrentHealth(float NewValue)
    {
        if (UE_MVVM_SET_PROPERTY_VALUE(CurrentHealth, NewValue))
        {
            UE_MVVM_BROADCAST_FIELD_VALUE_CHANGED(GetHealthPercent);
        }
    }

private:
    UPROPERTY(BlueprintReadOnly, FieldNotify, Getter, meta=(AllowPrivateAccess=true))
    float CurrentHealth = 100.f;

    UPROPERTY(BlueprintReadOnly, FieldNotify, Getter, meta=(AllowPrivateAccess=true))
    float MaxHealth = 100.f;
};
```

Widget bindings are configured in the Widget Blueprint editor (View Bindings panel), not in C++. The widget reads from the ViewModel; the Model (game logic) writes to the ViewModel via protected setters.

**When to use:** Any widget that displays game state — HUDs, inventory, stat screens, shop UIs. Especially valuable when multiple widgets observe the same data.

**Requires:** `"ModelViewViewModel"` in Build.cs `PrivateDependencyModuleNames`.

### 2. Event-Driven Delegates (Good)
Bind to delegates from game objects. Widget updates only when notified.
```cpp
void UMyHUD::NativeConstruct()
{
    Super::NativeConstruct();
    if (AMyPlayerState* PS = GetOwningPlayerState<AMyPlayerState>())
    {
        PS->OnHealthChanged.AddDynamic(this, &UMyHUD::HandleHealthChanged);
        HandleHealthChanged(PS->GetHealth(), PS->GetMaxHealth()); // Initial sync
    }
}

void UMyHUD::HandleHealthChanged(float Current, float Max)
{
    HealthBar->SetPercent(Max > 0.f ? Current / Max : 0.f);
    HealthText->SetText(FText::Format(
        LOCTEXT("HealthFmt", "{0} / {1}"),
        FText::AsNumber(FMath::RoundToInt(Current)),
        FText::AsNumber(FMath::RoundToInt(Max))));
}
```

**When to use:** Simple widgets with 1-3 data points, or when MVVM plugin is overkill. Also for replicated properties with `OnRep_`.

**Important:** Always unbind in `NativeDestruct()` to avoid dangling delegate crashes.

### 3. Manual Setter Calls (Acceptable)
Call an explicit update function when data changes. No framework overhead.
```cpp
void UMyHUD::UpdateHealth(float NewHealth)
{
    if (!FMath::IsNearlyEqual(CachedHealth, NewHealth))
    {
        CachedHealth = NewHealth;
        HealthBar->SetPercent(NewHealth / MaxHealth);
    }
}
```
- Efficient: only runs when called.
- Fragile: every code path that changes data must remember to call the update.
- **Always guard with a value comparison** to avoid redundant Slate invalidation.

### 4. Property Binding (Avoid in Production)
Configured in the UMG designer via the "Bind" dropdown. Calls a function **every frame**.
- 50 bindings = 50 function calls per frame doing nothing useful.
- Acceptable only for rapid prototyping. Remove before shipping.
- **Never mix with SetText/SetPercent calls** — SetText wipes any active binding.

### Decision Guide

| Scenario | Approach |
|----------|----------|
| Multiple widgets observing same data | MVVM FieldNotify |
| Complex screen with many data points | MVVM FieldNotify |
| Simple HUD, 1-3 values | Event-Driven Delegates |
| Replicated properties (multiplayer) | Event-Driven via OnRep_ |
| One-shot display (tooltip, dialog) | Manual Setter |
| Quick prototype, will be replaced | Property Binding |

## Widget Animations

`UWidgetAnimation` provides timeline-based animation for widget properties:

```cpp
// Play an animation (forward, from start)
PlayAnimation(FadeInAnimation, 0.0f, 1, EUMGSequencePlayMode::Forward, 1.0f);

// Play in reverse
PlayAnimation(FadeInAnimation, 0.0f, 1, EUMGSequencePlayMode::Reverse, 1.0f);

// Check if playing
bool bPlaying = IsAnimationPlaying(FadeInAnimation);

// Pause / stop
PauseAnimation(FadeInAnimation);
StopAnimation(FadeInAnimation);

// Listen for completion
FWidgetAnimationDynamicEvent Delegate;
Delegate.BindDynamic(this, &UMyWidget::OnFadeInFinished);
BindToAnimationFinished(FadeInAnimation, Delegate);
```

Animation best practices:
- Create animations in the UMG designer's animation timeline (bottom panel).
- Bind them in C++ with `BindWidgetAnim` for type-safe access.
- Use animation events to trigger logic at specific keyframes.
- Layer multiple animations (e.g., fade + slide) for polished transitions.
- Set "Is Design Time" animations for preview in the designer.

## Anchors, Alignment, and Responsive Design

Anchors determine how a widget positions itself relative to its parent:

- **Anchor point** -- a normalized (0-1) position in the parent. (0,0) = top-left, (1,1) = bottom-right.
- **Anchor as region** -- when min and max anchors differ, the widget stretches with the parent.
- **Alignment** -- pivot point of the widget itself (0,0) = top-left of the widget.

Common patterns:
- **Centered element**: Anchor (0.5, 0.5), Alignment (0.5, 0.5), Position (0, 0).
- **Full-screen overlay**: Anchor min (0,0), max (1,1), Offset all zeros.
- **Bottom-right corner HUD**: Anchor (1,1), Alignment (1,1), negative offset to pad from edge.

Resolution independence:
- Use anchored layouts instead of absolute pixel positions.
- Use `USizeBox` to constrain minimum/maximum dimensions.
- Test at target resolutions: 1280x720, 1920x1080, 2560x1440, 3840x2160.
- The DPI scaling curve in Project Settings > User Interface controls automatic scaling.

## Layout Widgets

### Canvas Panel
Free-form layout. Children positioned by anchor + offset. Use for HUD overlays where elements are placed at specific screen positions.

### Overlay
Stacks children on top of each other. All children share the same space. Use for layering (background image + text on top).

### Horizontal Box / Vertical Box
Arranges children in a row/column. Supports fill, auto, and fixed sizing per slot. Use for toolbars, lists, stat rows.

### Uniform Grid Panel
Fixed grid layout. All cells are the same size. Use for inventory grids, skill bars.

### Wrap Box
Flows children left-to-right, wrapping to the next line. Use for tag displays, dynamic icon lists.

### Size Box
Wraps a single child to enforce min/max/override dimensions. Essential for responsive constraints.

### Scale Box
Scales content to fit with configurable stretch rules (Stretch to Fit, Stretch to Fill, etc.).

## DPI Scaling and Viewport Size

UMG applies DPI scaling automatically based on the curve in Project Settings:
- `GetViewportSize()` returns the raw pixel resolution.
- Widget coordinates are in "slate units" (DPI-scaled).
- `GetDesiredSize()` returns the widget's desired size in slate units.
- Use `USlateBlueprintLibrary::ScreenToWidgetLocal()` for coordinate conversion.

To get the actual screen position of a widget at runtime:
```cpp
FGeometry Geom = MyWidget->GetCachedGeometry();
FVector2D AbsolutePos = Geom.GetAbsolutePosition();
FVector2D LocalSize = Geom.GetLocalSize();
```

### DPI Scale Curve Configuration

The DPI scale curve in `DefaultEngine.ini` maps viewport shortest-side pixel count to a UI scale multiplier:

```ini
[/Script/Engine.UserInterfaceSettings]
UIScaleRule=ShortestSide
UIScaleCurve=(EditorCurveData=(Keys=((Time=480.000000,Value=0.444000),(Time=1080.000000,Value=1.000000),(Time=8640.000000,Value=8.000000))))
ApplicationScale=1.000000
bAllowHighDPIInGameMode=False
```

Production curve breakpoints (from Cropout):
- **480px** (small phones) → 0.444 scale
- **1080px** (baseline: 1080p) → 1.0 scale
- **8640px** (8K/future-proof) → 8.0 scale

**Design at 1080p as your baseline.** The curve automatically handles all other resolutions.

### Multi-Device Resolution Testing Checklist

Always test UI at these resolutions:
- **720p** (1280x720) — Low-end mobile, Switch handheld
- **1080p** (1920x1080) — Baseline (scale=1.0)
- **1440p** (2560x1440) — PC monitors
- **4K** (3840x2160) — High-end PC, PS5/XSX
- **Phone portrait** (1080x2400) — Android phones
- **Phone landscape** (2400x1080) — Mobile gaming
- **Tablet** (2048x1536) — iPad
- **Ultrawide** (3440x1440) — PC ultrawide monitors

Use `UIScaleRule=ShortestSide` for most games — it handles both landscape and portrait orientations correctly.

## Production Widget Naming Conventions

From the Cropout sample project:

| Prefix | Purpose | Examples |
|--------|---------|---------|
| `UI_` | Full screen or major screen widget | `UI_MainMenu`, `UI_Pause`, `UI_GameMain` |
| `UI_Layer_` | Layer container (activation stack host) | `UI_Layer_Game`, `UI_Layer_Menu` |
| `UIE_` | Reusable sub-element widget | `UIE_Resource`, `UIE_Cost`, `UIE_Slider` |
| `CUI_` | CommonUI framework component | `CUI_Button`, `CUI_InputData`, `CUI_BuildItem` |
| `CUI_Style_` | CommonUI style data asset | `CUI_Style_Button`, `CUI_Style_Text` |
| `WBP_` | Widget Blueprint (alternative convention) | `WBP_HealthBar`, `WBP_Inventory` |

Keep naming consistent — it makes searching and managing assets much easier at scale.
