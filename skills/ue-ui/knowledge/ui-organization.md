# UI Organization & Extension Architecture

## Widget Layer System

All UI is organized into named layers managed by `UPrimaryGameLayout` (from CommonGame plugin). Each layer is a stack of activatable widgets identified by Gameplay Tags.

### Layer Architecture

```
UPrimaryGameLayout (root viewport widget)
  ├── UI.Layer.Game        → HUD, health bars, crosshair (always active during gameplay)
  ├── UI.Layer.GameMenu    → Escape menu, settings (overlays game)
  ├── UI.Layer.Menu        → Full-screen menus, lobbies
  └── UI.Layer.Modal       → Dialogs, confirmations (topmost, blocks below)
```

Each layer is a `UCommonActivatableWidgetContainerBase` — a stack where only the top widget receives input.

### Pushing/Popping Widgets

```cpp
// Push widget to a layer (synchronous)
UCommonUIExtensions::PushContentToLayer_ForPlayer(
    LocalPlayer,
    FGameplayTag("UI.Layer.Menu"),
    UMyMenuWidget::StaticClass());

// Push widget with async loading (soft reference)
UCommonUIExtensions::PushStreamedContentToLayer_ForPlayer(
    LocalPlayer,
    FGameplayTag("UI.Layer.Modal"),
    TSoftClassPtr<UCommonActivatableWidget>(MyDialogClass));

// Pop widget from its layer
UCommonUIExtensions::PopContentFromLayer(WidgetInstance);
```

### Layer Input Priority

- **Top layer wins** — the topmost layer with active widgets receives input first
- **Modal blocks everything below** — a modal layer prevents game input and lower layers from responding
- **Game layer is pass-through** — HUD widgets use `SelfHitTestInvisible` to allow game input through

---

## UI Extension Point System

A pub/sub system for dynamically registering UI content at tagged extension points. Enables GameFeature plugins to add UI without modifying core layouts.

### Core Concepts

```
Extension Point (slot)                     Extension (content)
  Tag: "UI.Extension.HUD.QuickBar"    ←→   Widget: WBP_QuickBar
  AllowedClasses: [UUserWidget]             Priority: 0
  Callback: OnExtensionChanged              Context: LocalPlayer
```

### Subsystem API

```cpp
UUIExtensionSubsystem* ExtSys = GetWorld()->GetSubsystem<UUIExtensionSubsystem>();

// Register a location where widgets can plug in
FUIExtensionPointHandle PointHandle = ExtSys->RegisterExtensionPoint(
    FGameplayTag("UI.Extension.HUD.QuickBar"),
    EUIExtensionPointMatch::ExactMatch,
    {UUserWidget::StaticClass()},
    FExtendExtensionPointDelegate::CreateUObject(this, &ThisClass::OnExtensionChanged));

// Register a widget at that extension point
FUIExtensionHandle ExtHandle = ExtSys->RegisterExtensionAsWidgetForContext(
    FGameplayTag("UI.Extension.HUD.QuickBar"),
    LocalPlayer,
    UMyQuickBarWidget::StaticClass(),
    /*Priority*/ 0);

// Unregister (cleanup)
ExtHandle.Unregister();
PointHandle.Unregister();
```

### Extension Point Widget (Blueprint-Friendly)

`UUIExtensionPointWidget` auto-manages child widgets from extensions:

- Derives from `UDynamicEntryBoxBase` (creates/destroys children dynamically)
- Properties:
  - `ExtensionPointTag` — which tag to listen for
  - `ExtensionPointTagMatch` — ExactMatch or PartialMatch (tag inheritance)
  - `DataClasses` — allowed data types (contract enforcement)
  - `GetWidgetClassForData` — delegate to map extension data → widget class
  - `ConfigureWidgetForData` — delegate for post-creation setup

### Extension Pattern in Practice

1. **Core HUD layout** defines extension points (empty slots with tags)
2. **GameFeature plugins** register widgets at those points when activated
3. **Extension Point Widget** auto-creates child widgets when extensions arrive
4. **On GameFeature deactivation**, extensions unregister and widgets are destroyed

---

## GameFeature Widget Composition

`UGameFeatureAction_AddWidgets` — loads UI dynamically via Experience system or GameFeature plugins.

### Two Registration Types

```cpp
// 1. Layout — pushed directly to a layer (immediate, full-screen)
struct FHUDLayoutRequest
{
    TSoftClassPtr<UCommonActivatableWidget> LayoutClass;  // HUD layout widget
    FGameplayTag LayerID;                                  // e.g., UI.Layer.Game
};

// 2. Element — registered at extension points (modular, slot-based)
struct FHUDElementEntry
{
    TSoftClassPtr<UUserWidget> WidgetClass;               // Widget to add
    FGameplayTag SlotID;                                   // Extension point tag
};
```

### Lifecycle

1. GameFeature activates → action listens for HUD actor creation
2. HUD ready → pushes layout widgets to specified layers
3. Registers widget extensions at specified extension point tags
4. GameFeature deactivates → unregisters all extensions, deactivates layouts

### Example Experience Configuration

```
Experience "ShooterGame":
  GameFeatureAction_AddWidgets:
    Layouts:
      - LayoutClass: WBP_ShooterHUDLayout, LayerID: UI.Layer.Game
    Widgets:
      - WidgetClass: WBP_QuickBar,      SlotID: UI.Extension.HUD.QuickBar
      - WidgetClass: WBP_Reticle,       SlotID: UI.Extension.HUD.Reticle
      - WidgetClass: WBP_AmmoCounter,   SlotID: UI.Extension.HUD.AmmoCounter
      - WidgetClass: WBP_Scoreboard,    SlotID: UI.Extension.HUD.Scoreboard
```

---

## Tag-Based Widget Visibility

Widget that auto-hides based on owning player's Gameplay Tags:

```cpp
UCLASS()
class UTaggedWidget : public UCommonUserWidget
{
    GENERATED_BODY()
public:
    // Widget hides when player has ANY of these tags
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "HUD")
    FGameplayTagContainer HiddenByTags;

    UPROPERTY(EditAnywhere, Category = "HUD")
    ESlateVisibility ShownVisibility = ESlateVisibility::Visible;

    UPROPERTY(EditAnywhere, Category = "HUD")
    ESlateVisibility HiddenVisibility = ESlateVisibility::Collapsed;
};
```

**Use cases**: Hide HUD during cinematics (`Status.Cinematic`), hide crosshair in menus (`Status.InMenu`), hide ammo when unarmed (`Status.Unarmed`).

---

## Indicator System (World-Space UI)

On-screen indicators (health bars, enemy markers, waypoints) projected from 3D to 2D.

### Architecture

```
UIndicatorManagerComponent (on PlayerController)
  ├── FIndicatorDescriptor  → actor ref, priority, distance culling
  ├── FIndicatorDescriptor  → ...
  └── ...

UIndicatorLayer (canvas widget in HUD)
  └── SActorCanvas (Slate) → projects 3D positions to 2D screen space
        ├── IndicatorWidget1 (UMG)
        ├── IndicatorWidget2 (UMG)
        └── ...
```

### Flow

1. Actor (enemy, objective) registers indicator with manager
2. Manager creates `FIndicatorDescriptor` (priority, max distance, widget class)
3. `UIndicatorLayer` canvas renders indicators each frame
4. `SActorCanvas` converts 3D actor position → 2D screen space
5. Off-screen or distant indicators are culled automatically

---

## Settings Framework

Data-driven settings UI from the GameSettings plugin.

### Model-View Separation

```
UGameSettingRegistry (model)        UGameSettingPanel (view)
  ├── UGameSetting "Audio.Master"     ├── UGameSettingListView
  ├── UGameSetting "Video.Quality"    ├── UGameSettingDetailView
  ├── UGameSetting "Input.Sens"       └── Filter by FGameSettingFilterState
  └── ...

UGameSettingVisualData (data asset)
  Maps setting class → list entry widget class
  Maps setting name → custom detail extensions
```

### Key Types

| Class | Role |
|-------|------|
| `UGameSetting` | Abstract per-setting model (name, description, tags, edit conditions) |
| `UGameSettingRegistry` | Container for all settings, handles save/load |
| `UGameSettingPanel` | UI widget displaying filtered settings |
| `UGameSettingVisualData` | Data asset mapping settings → widget classes |
| `UGameSettingValueDiscrete<T>` | Setting with discrete options (resolution, language) |
| `UGameSettingValueScalar` | Setting with continuous range (volume, sensitivity) |

### Organization Pattern

```
Source/MyGame/Settings/
  MyGameSettingRegistry.h/.cpp           # Main registry
  MyGameSettingRegistry_Audio.cpp        # Audio settings definition
  MyGameSettingRegistry_Video.cpp        # Graphics settings definition
  MyGameSettingRegistry_Gamepad.cpp      # Controller settings
  MyGameSettingRegistry_KBM.cpp          # Keyboard/Mouse settings
  MyGameSettingRegistry_Gameplay.cpp     # Gameplay options
  Screens/
    MyBrightnessEditor.h/.cpp            # Custom setting screens
    MySafeZoneEditor.h/.cpp
  Widgets/
    MySettingKeyboardInput.h/.cpp        # Custom setting widgets
```

---

## PocketWorlds (3D in UI)

Isolated sub-worlds for rendering 3D content within UI (character previews, weapon showcases, map dioramas).

```cpp
UPocketLevelSubsystem* PocketSys = GetWorld()->GetSubsystem<UPocketLevelSubsystem>();

// Create isolated world for a player's character preview
UPocketLevelInstance* Instance = PocketSys->GetOrCreatePocketLevelFor(
    LocalPlayer,
    PocketLevelAsset,    // Reference to the pocket level
    DesiredSpawnPoint);  // Where to place the preview actor
```

**Key properties**:
- Independent rendering, physics, and actor lifecycles per pocket world
- No pollution of main game world
- Per-player isolation (each player can have their own preview)

**Use cases**: Character customization screen, weapon skin preview, lobby backgrounds, map selection thumbnails with 3D scenes.

---

## Messaging/Dialog System

Decoupled dialog dispatch via subsystem.

### Architecture

```cpp
// Subsystem (on LocalPlayer)
UCommonMessagingSubsystem* Messaging = LocalPlayer->GetSubsystem<UCommonMessagingSubsystem>();

// Create descriptor
UCommonGameDialogDescriptor* Desc = UCommonGameDialogDescriptor::CreateConfirmationYesNo(
    LOCTEXT("Title", "Quit Game?"),
    LOCTEXT("Body", "Are you sure you want to quit?"));

// Show dialog and handle result
Messaging->ShowConfirmation(Desc, FCommonMessagingResultDelegate::CreateLambda(
    [](ECommonMessagingResult Result) {
        if (Result == ECommonMessagingResult::Confirmed)
            UKismetSystemLibrary::QuitGame(/*...*/);
    }));
```

### Dialog Result Types
- `Confirmed` — user pressed OK/Yes
- `Declined` — user pressed No
- `Cancelled` — user pressed Back/Escape
- `Killed` — dialog was programmatically dismissed

---

## UI Manager Subsystem & Policy

### Strategy Pattern for UI Layout

```cpp
// UGameUIManagerSubsystem (LocalPlayer subsystem)
//   Holds current UGameUIPolicy
//   Notifies policy of player add/remove events

// UGameUIPolicy (strategy implementation)
//   Creates root PrimaryGameLayout per player
//   Manages multiplayer viewport modes
```

### Multiplayer Viewport Modes

```cpp
enum class ELocalMultiplayerInteractionMode : uint8
{
    PrimaryOnly,    // Fullscreen for primary player
    SingleToggle,   // One player fullscreen, can toggle
    Simultaneous    // Split-screen both players
};
```

---

## Widget Factory Pattern

Abstract factory for creating widgets from data objects — enables decoupled widget instantiation.

```cpp
UCLASS(Abstract, BlueprintType, Blueprintable)
class UWidgetFactory : public UObject
{
    GENERATED_BODY()
public:
    virtual TSubclassOf<UUserWidget> FindWidgetClassForData(const UObject* Data) const PURE_VIRTUAL(, return nullptr;);
};

// Concrete: maps data classes to widget classes
UCLASS()
class UWidgetFactory_Class : public UWidgetFactory
{
    GENERATED_BODY()
public:
    virtual TSubclassOf<UUserWidget> FindWidgetClassForData(const UObject* Data) const override;
};
```

**Use case**: Extension point widgets use factories to determine which widget to create for each data type.

---

## Tab Navigation Pattern

Dynamic tab management with lazy content creation:

```cpp
struct FTabDescriptor
{
    FName TabId;                                    // Immutable identifier
    FText TabText;                                  // Display label
    FSlateBrush IconBrush;                          // Tab icon
    TSubclassOf<UCommonButtonBase> TabButtonType;   // Button widget class
    TSubclassOf<UCommonUserWidget> TabContentType;  // Content widget class (lazy-created)

    UPROPERTY(Transient)
    TObjectPtr<UWidget> CreatedTabContentWidget;    // Cached instance
};
```

Features:
- Pre-registered (Blueprint-defined) and dynamic (runtime-registered) tabs
- `SetTabHiddenState()` — toggle visibility before switcher linked
- `OnTabContentCreated` event — post-creation setup hook
- `ITabButtonInterface::SetTabLabelInfo()` — configure button from descriptor

---

## Source Organization Pattern

```
Source/MyGame/UI/
  Basic/                    # Low-level primitives (progress bars, custom widgets)
  Common/                   # Reusable patterns (tabs, lists, buttons, widget factory)
  Foundation/               # Core screens (dialogs, confirmations, action widgets)
  Frontend/                 # Main menu, lobby, loading
  IndicatorSystem/          # World-to-screen indicator projection
  PerformanceStats/         # FPS, ping, latency graphs
  Subsystem/                # UIManagerSubsystem, UIMessaging
  Weapons/                  # Reticles, hit markers, weapon UI
  MyActivatableWidget.h     # Base activatable widget (input mode config)
  MyHUD.h                   # Minimal HUD actor
  MyHUDLayout.h             # Main HUD layout (escape handling, disconnect)
  MyTaggedWidget.h          # Tag-based visibility
  MySimulatedInputWidget.h  # Touch input simulation
```

### Widget Blueprint Naming

| Prefix | Asset Type | Example |
|--------|-----------|---------|
| `W_` | General widget | `W_MainMenu`, `W_HUD_Layout` |
| `WBP_` | Widget Blueprint | `WBP_HealthBar`, `WBP_QuickBar` |

Organize under `Content/UI/` with subdirectories matching C++ organization.

---

## Anti-Patterns

- **Hardcoded widget hierarchy in C++** — use extension points and data-driven composition
- **GameFeature directly referencing core UI classes** — use extension tags for decoupling
- **Pushing widgets without layer tags** — breaks stack-based input routing
- **Flat UI folder** — organize by subsystem/purpose matching C++ structure
- **Tick-based UI updates** — use event-driven patterns (delegates, `OnRep_`)
- **Manual widget lifecycle in GameFeatures** — use `GameFeatureAction_AddWidgets` for automatic cleanup
- **Missing `GetDesiredFocusTarget()`** — gamepad navigation silently broken
- **Using `SetInputMode()` with CommonUI** — breaks activation stack input routing
