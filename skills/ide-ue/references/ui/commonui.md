# CommonUI Framework

## CommonUI vs Raw UMG

CommonUI is Epic's framework layered on top of UMG for building platform-agnostic, input-aware UI. It ships as an engine plugin.

| Feature | Raw UMG | CommonUI |
|---------|---------|----------|
| Input routing | Manual per-widget | Automatic via activation stack |
| Gamepad navigation | Manual focus management | Built-in with configurable rules |
| Platform input icons | Manual asset swapping | Automatic per-platform icons |
| Back/cancel handling | Manual per-screen | Automatic via activation stack |
| Widget lifecycle | AddToViewport/RemoveFromParent | Push/Pop activation stack |

When to use CommonUI:
- Multi-platform games (PC + Console + Mobile).
- Games with complex menu hierarchies (RPGs, looter-shooters).
- Any game shipping on consoles (gamepad navigation is essential).
- Games following Lyra or Fortnite UI architecture patterns.

When raw UMG is sufficient:
- Simple HUD-only UI (health bar, crosshair, minimap) with no menus.
- Prototypes and game jams.
- PC-only games with minimal UI interaction.

## Activatable Widgets and Activation Stack

The core concept of CommonUI. An **activatable widget** participates in a managed stack that controls which widget receives input.

### UCommonActivatableWidget

Base class for all widgets that participate in the activation stack:

```cpp
UCLASS()
class UMyMenuScreen : public UCommonActivatableWidget
{
    GENERATED_BODY()

protected:
    // Called when this widget becomes the active (top) widget
    virtual void NativeOnActivated() override;

    // Called when this widget is deactivated (another pushed on top, or this is popped)
    virtual void NativeOnDeactivated() override;

    // Return the desired input config for this widget
    virtual TOptional<FUIInputConfig> GetDesiredInputConfig() const override
    {
        return FUIInputConfig(ECommonInputMode::Menu, EMouseCaptureMode::NoCapture);
    }
};
```

Activation lifecycle:
1. Widget is created and pushed onto a `UCommonActivatableWidgetContainerBase` (typically a `UCommonActivatableWidgetStack`).
2. `NativeOnActivated()` fires. Widget receives input.
3. Another widget is pushed -- `NativeOnDeactivated()` fires on the current widget.
4. Top widget is popped -- `NativeOnActivated()` fires again on the newly-exposed widget.
5. Widget is popped from the stack -- `NativeOnDeactivated()` fires, widget is destroyed or returned to pool.

### Widget Containers

```cpp
// Stack: only the top widget is active. Back button pops the stack.
UPROPERTY(meta = (BindWidget))
UCommonActivatableWidgetStack* MenuStack;

// Switcher: one widget active at a time, but all remain alive (like tabs).
UPROPERTY(meta = (BindWidget))
UCommonActivatableWidgetSwitcher* TabSwitcher;
```

Pushing a widget onto the stack:
```cpp
UMyMenuScreen* Screen = MenuStack->AddWidget<UMyMenuScreen>();
// Or with a class reference:
MenuStack->AddWidget(*ScreenClass);
```

## Input Routing and Action Handling

CommonUI routes input through the activation stack automatically. The active widget and its children receive input; inactive widgets do not.

### Input Config

Each activatable widget declares its desired input mode:

```cpp
TOptional<FUIInputConfig> GetDesiredInputConfig() const override
{
    // Menu mode: mouse visible, game input blocked
    return FUIInputConfig(ECommonInputMode::Menu, EMouseCaptureMode::NoCapture);

    // Game mode: mouse captured, UI does not consume input
    // return FUIInputConfig(ECommonInputMode::Game, EMouseCaptureMode::CapturePermanently);

    // All mode: both game and UI receive input
    // return FUIInputConfig(ECommonInputMode::All, EMouseCaptureMode::NoCapture);
}
```

When a widget is activated, CommonUI automatically applies its input config. When deactivated, the config reverts to the previous widget's config. No manual `SetInputMode` calls needed.

### Common Bound Actions

`UCommonBoundActionButton` and `UCommonBoundActionBar` display context-sensitive input prompts:

```cpp
// In your widget, register actions
void UMyMenu::NativeOnActivated()
{
    Super::NativeOnActivated();

    // Registers an action that shows the correct button prompt per platform
    RegisterUIActionBinding(FBindUIActionArgs(
        FUIActionTag::FindTag("UI.Action.Confirm"),
        false, // bDisplayInActionBar
        FSimpleDelegate::CreateUObject(this, &UMyMenu::OnConfirm)
    ));
}
```

## CommonUIActionRouter

The `UCommonUIActionRouter` subsystem manages all input routing:

```cpp
UCommonUIActionRouter* ActionRouter = ULocalPlayer::GetSubsystem<UCommonUIActionRouter>(GetOwningLocalPlayer());

// Check current input type
ECommonInputType InputType = ActionRouter->GetActiveInputType();

// Listen for input type changes (keyboard -> gamepad -> touch)
ActionRouter->OnActiveInputTypeChanged.AddDynamic(this, &UMyWidget::OnInputTypeChanged);
```

The action router automatically:
- Tracks whether the player is using keyboard/mouse, gamepad, or touch.
- Fires delegates when input type changes (for icon swapping).
- Routes input only to the active widget in the activation stack.

## Platform-Specific Input Icons

CommonUI maps input actions to platform-appropriate icons via `UCommonInputSubsystem`:

```cpp
// Get the icon for an action on the current platform
UCommonInputSubsystem* InputSubsystem = ULocalPlayer::GetSubsystem<UCommonInputSubsystem>(GetOwningLocalPlayer());
FSlateBrush IconBrush = InputSubsystem->GetInputActionDataForTag(ActionTag).GetInputActionIcon();
```

Setup requires:
1. Create `UCommonInputActionDataTable` assets mapping actions to keys per platform.
2. Configure `UCommonInputBaseControllerData` for each controller type (Xbox, PS5, Switch).
3. Set the data table in Project Settings > Common Input Settings.

Icon switching is automatic when the player switches between input devices.

## Focus and Navigation with CommonUI

CommonUI extends UMG's focus system:

### CommonUI Buttons
Use `UCommonButtonBase` instead of raw `UButton`:

```cpp
UCLASS()
class UMyButton : public UCommonButtonBase
{
    GENERATED_BODY()

protected:
    // Fires on click, enter, or gamepad confirm
    virtual void NativeOnClicked() override;

    // Fires when button gains focus (gamepad highlight)
    virtual void NativeOnCurrentTextStyleChanged() override;
};
```

`UCommonButtonBase` provides:
- Automatic focus visuals (selected, hovered, pressed, disabled states).
- Sound effects per interaction state.
- Click throttling to prevent double-submits.
- Holds (long press) with configurable duration.
- Gamepad-aware interaction without extra code.

### Navigation Configuration
```cpp
// Set explicit navigation targets
MyButton->SetNavigationRuleExplicit(EUINavigation::Down, NextButton);
MyButton->SetNavigationRuleExplicit(EUINavigation::Up, PrevButton);

// Or use wrap/stop rules
MyButton->SetNavigationRule(EUINavigation::Left, EUINavigationRule::Wrap);
```

## CommonUI Patterns from Lyra

Lyra (Epic's sample project) demonstrates production CommonUI architecture:

### Layer System
Lyra uses a `UGameUIManagerSubsystem` that manages UI layers:
- **Game Layer** -- HUD elements, always visible during gameplay.
- **Menu Layer** -- Pause menu, settings, overlays.
- **Modal Layer** -- Confirmation dialogs, popups.

Each layer is a `UCommonActivatableWidgetStack`. Layers are ordered by Z-order, and the topmost active layer captures input.

### Primary Game Layout
A single root widget (`UPrimaryGameLayout`) holds all layer stacks:

```cpp
UCLASS()
class UPrimaryGameLayout : public UCommonUserWidget
{
    GENERATED_BODY()

public:
    // Push a widget onto the specified layer
    void PushWidgetToLayer(FGameplayTag LayerTag, TSubclassOf<UCommonActivatableWidget> WidgetClass);

protected:
    UPROPERTY(meta = (BindWidget))
    UCommonActivatableWidgetStack* GameLayer;

    UPROPERTY(meta = (BindWidget))
    UCommonActivatableWidgetStack* MenuLayer;

    UPROPERTY(meta = (BindWidget))
    UCommonActivatableWidgetStack* ModalLayer;
};
```

### Lyra Conventions
- Every screen is a `UCommonActivatableWidget`.
- Navigation uses `UCommonBoundActionBar` at screen bottom.
- Tab navigation uses `UCommonActivatableWidgetSwitcher` with `UCommonButtonGroupBase`.
- Settings use a `UGameSettingCollection` registry pattern.
- Back action is handled automatically by the activation stack (B button / Escape).

## Setting Up CommonUI in a Project

### Step 1: Enable the Plugin
In your `.uproject` file:
```json
{
    "Plugins": [
        { "Name": "CommonUI", "Enabled": true },
        { "Name": "CommonInput", "Enabled": true }
    ]
}
```

### Step 2: Module Dependencies
In your `Build.cs`:
```csharp
PublicDependencyModuleNames.AddRange(new string[] {
    "CommonUI",
    "CommonInput"
});
```

### Step 3: Game Viewport Client
Override the viewport client to use CommonUI's action router:

In `DefaultEngine.ini`:
```ini
[/Script/Engine.Engine]
GameViewportClientClassName=/Script/CommonUI.CommonGameViewportClient
```

Or create a custom subclass if you need additional viewport customization.

### Step 4: Input Data
1. Create a `UCommonInputActionDataTable` with your game's input actions.
2. Create `UCommonInputBaseControllerData` assets for each platform.
3. Set these in Project Settings > Plugins > Common Input.

### Step 5: Root Layout
Create your `UPrimaryGameLayout` widget with layer stacks and add it to the viewport in your HUD class or game instance.

## Multi-Platform Input Configuration (DefaultGame.ini)

CommonInput requires per-platform input settings in `DefaultGame.ini` to correctly detect and handle input devices:

### Platform Input Settings

```ini
[/Script/CommonInput.CommonInputSettings]
InputData=/Game/UI/Common/CUI_InputData.CUI_InputData_C

[CommonInputPlatformSettings_Windows]
DefaultInputType=MouseAndKeyboard
bSupportsMouseAndKeyboard=True
bSupportsTouch=False
bSupportsGamepad=True
DefaultGamepadName=Generic
bCanChangeGamepadType=True
+ControllerData=/Game/UI/Common/CUI_BaseControllerData.CUI_BaseControllerData_C
```

For mobile platforms, add:

```ini
[CommonInputPlatformSettings_Android]
DefaultInputType=Touch
bSupportsMouseAndKeyboard=False
bSupportsTouch=True
bSupportsGamepad=True
DefaultGamepadName=Generic
bCanChangeGamepadType=False

[CommonInputPlatformSettings_IOS]
DefaultInputType=Touch
bSupportsMouseAndKeyboard=False
bSupportsTouch=True
bSupportsGamepad=True
DefaultGamepadName=Generic
bCanChangeGamepadType=False
```

For console platforms:

```ini
[CommonInputPlatformSettings_PS5]
DefaultInputType=Gamepad
bSupportsMouseAndKeyboard=False
bSupportsTouch=False
bSupportsGamepad=True
DefaultGamepadName=DualSense
bCanChangeGamepadType=False

[CommonInputPlatformSettings_XSX]
DefaultInputType=Gamepad
bSupportsMouseAndKeyboard=True
bSupportsTouch=False
bSupportsGamepad=True
DefaultGamepadName=XboxSeriesX
bCanChangeGamepadType=False
```

### Controller Data Assets

Create `UCommonInputBaseControllerData` Blueprint assets that define button icons and input action mappings per controller type:
- `/Game/UI/Common/CUI_BaseControllerData` -- Generic/fallback
- Create additional assets for Xbox, PlayStation, Switch Pro controllers

Reference the base controller data in your platform settings (the `+ControllerData=` line above).

### Input Data Asset

Create a `UCommonUIInputData` Blueprint that maps gameplay tags to input actions:
- `UI.Action.Confirm` -- Accept/Confirm (Enter, Gamepad A/Cross)
- `UI.Action.Back` -- Back/Cancel (Escape, Gamepad B/Circle)
- `UI.Action.TabLeft` -- Tab previous (Q, LB)
- `UI.Action.TabRight` -- Tab next (E, RB)

## Responsive UI Scaling for Multi-Device

### DPI Scaling Configuration (DefaultEngine.ini)

Configure automatic UI scaling based on viewport size:

```ini
[/Script/Engine.UserInterfaceSettings]
RenderFocusRule=NavigationOnly
HardwareCursors=True
SoftwareCursorWidgets=()
DefaultCursor=None
TextEditBeamCursor=None
CrosshairsCursor=None
HandCursor=None
GrabHandCursor=None
GrabHandClosedCursor=None
SlashedCircleCursor=None
ApplicationScale=1
UIScaleRule=ShortestSide
CustomScalingRuleClass=None
UIScaleCurve=(EditorCurveData=(PreInfinityExtrap=RCCE_Constant,PostInfinityExtrap=RCCE_Constant,Keys=((Time=480.000000,Value=0.444000),(Time=1080.000000,Value=1.000000),(Time=8640.000000,Value=8.000000))),ExternalCurve=None)
bAllowHighDPIInGameMode=False
```

### UI Scale Rules

| Rule | Scales Based On | Best For |
|------|----------------|----------|
| `ShortestSide` | Shortest viewport dimension | Most games -- handles both landscape and portrait |
| `LongestSide` | Longest viewport dimension | Fixed-orientation games |
| `Horizontal` | Viewport width only | Horizontal scrolling games |
| `Vertical` | Viewport height only | Vertical-focused UI |
| `Custom` | Custom class | Complex multi-factor scaling |

### Scale Curve Breakpoints

The `UIScaleCurve` maps viewport size (in pixels) to a UI scale multiplier:

```
480px  → 0.444 scale  (small phones)
720px  → 0.667 scale  (tablets, low-res)
1080px → 1.000 scale  (baseline: 1080p)
1440px → 1.333 scale  (1440p monitors)
2160px → 2.000 scale  (4K displays)
8640px → 8.000 scale  (extreme/future-proofing)
```

Design your UI at 1080p as the baseline, then the curve handles all other resolutions.

### Disabling Enhanced Input When Using CommonUI

When CommonUI manages input routing, you may want to disable EnhancedInput's default behavior to avoid conflicts:

```ini
[/Script/EnhancedInput.EnhancedInputDeveloperSettings]
bEnableDefaultMappingContexts=False
```

This prevents EnhancedInput from auto-binding default contexts that might conflict with CommonUI's input stack.

### CommonUI + EnhancedInput Coexistence Pattern

A production pattern (from Cropout Sample) uses CommonUI for UI input routing while Enhanced Input handles gameplay:

```ini
; DefaultGame.ini
[/Script/CommonUI.CommonUISettings]
InputData=/Game/UI/Common/CUI_InputData.CUI_InputData_C
bEnableDefaultInputConfig=False       ; Don't use CommonUI's default input config
bEnableEnhancedInputSupport=False     ; Let Enhanced Input handle gameplay directly
```

This means:
- CommonUI handles **UI input** (menu navigation, button prompts, activation stack)
- Enhanced Input handles **gameplay input** via Input Mapping Contexts (move, zoom, build, etc.)
- The two systems coexist without conflicts

### Analog Cursor Configuration for Gamepad

CommonUI provides built-in analog cursor support for gamepad-driven UI interaction:

```ini
[/Script/CommonUI.CommonUIInputSettings]
bLinkCursorToGamepadFocus=True        ; Cursor follows focused widget
UIActionProcessingPriority=10000      ; High priority for UI input processing
AnalogCursorSettings=(MaxSpeed=2200.0,CursorAcceleration=1500.0,StickySlowdown=0.4,DeadZone=0.25,ScrollDeadZone=0.2,ScrollUpdatePeriod=0.05,ScrollMultiplier=(X=1.0,Y=1.0))
```

Key analog cursor settings:
- **MaxSpeed**: Maximum cursor movement speed (pixels/sec)
- **CursorAcceleration**: How fast cursor reaches max speed
- **StickySlowdown**: Slowdown factor when hovering over interactive widgets (0.4 = 40% speed)
- **DeadZone**: Stick deadzone before cursor starts moving

### CommonUI Editor Template Styles

Configure default styles for CommonUI widgets created in the editor:

```ini
; DefaultEditor.ini
[/Script/CommonUI.CommonUIEditorSettings]
TemplateTextStyle=/Game/UI/Common/CUI_Style_Text.CUI_Style_Text_C
TemplateButtonStyle=/Game/UI/Common/CUI_Style_Button.CUI_Style_Button_C
TemplateBorderStyle=/Game/UI/Common/CUI_Style_Border_Dark.CUI_Style_Border_Dark_C
```

This ensures all new CommonUI widgets created in the editor automatically use your project's style assets rather than engine defaults.

## Production UI Organization Pattern (from Cropout)

### Directory Structure

```
Content/UI/
├── Common/                          # CommonUI framework assets
│   ├── CUI_InputData                # Input data config (maps actions to keys)
│   ├── CUI_Button                   # Reusable button widget
│   ├── CUI_BuildItem                # Complex reusable component
│   ├── CUI_Style_Button             # Button style data asset
│   ├── CUI_Style_Text               # Text style data asset
│   ├── CUI_Style_Text2              # Alternative text style
│   ├── CUI_Style_Border_Dark        # Dark border style
│   ├── CUI_Style_Border_Light       # Light border style
│   ├── CUI_Style_Build              # Context-specific style
│   └── CUI_Style_Small              # Small element style
├── Game/                            # In-game UI
│   ├── UI_GameMain                  # Main game HUD
│   └── UI_Layer_Game                # Game UI layer container
├── MainMenu/                        # Menu system
│   ├── UI_MainMenu                  # Main menu screen
│   └── UI_Layer_Menu                # Menu layer container
├── UI_Elements/                     # Reusable screen-level widgets
│   ├── UI_Build                     # Building placement UI
│   ├── UI_BuildConfirm              # Build confirmation dialog
│   ├── UI_EndGame                   # End game results
│   ├── UI_Pause                     # Pause menu
│   ├── UI_Prompt                    # Generic prompt/dialog
│   ├── UIE_Cost                     # Cost display element
│   ├── UIE_Resource                 # Resource counter element
│   └── UIE_Slider                   # Slider control element
├── Materials/                       # UI materials
│   ├── M_MasterButton               # Base button material
│   ├── MI_Button_Hover              # Hover state instance
│   ├── MI_Button_Pressed            # Pressed state instance
│   ├── MI_Border                    # Border material
│   ├── MI_Border_Light              # Light border variant
│   ├── M_RadialCut                  # Radial progress material
│   └── M_Guide                      # Guide overlay material
└── UI_Transition                    # Screen transition widget
```

### Naming Conventions

| Prefix | Meaning | Example |
|--------|---------|---------|
| `UI_` | Full screen or major widget | `UI_MainMenu`, `UI_Pause`, `UI_GameMain` |
| `UI_Layer_` | Layer container (holds a stack of screens) | `UI_Layer_Game`, `UI_Layer_Menu` |
| `UIE_` | Reusable UI element (sub-widget) | `UIE_Resource`, `UIE_Cost`, `UIE_Slider` |
| `CUI_` | CommonUI framework asset | `CUI_Button`, `CUI_InputData` |
| `CUI_Style_` | CommonUI style data asset | `CUI_Style_Button`, `CUI_Style_Text` |
| `M_` / `MI_` | UI material / material instance | `M_MasterButton`, `MI_Button_Hover` |

### Layered Architecture

The project uses a two-layer system:
1. **UI_Layer_Game** — Contains the in-game HUD (`UI_GameMain`). Active during gameplay.
2. **UI_Layer_Menu** — Contains menu screens (`UI_MainMenu`). Active in menus.

Each layer is a container widget (likely `UCommonActivatableWidgetStack`) that manages which screen is visible. Screens from `UI_Elements/` (pause, build, end game) are pushed onto the appropriate layer.

### Material-Based Button States

Instead of texture swaps, the project uses a **master material with instances** for button visual states:
- `M_MasterButton` — Parameterized material with color, opacity, and effect parameters
- `MI_Button_Hover` — Instance with hover-state parameter values
- `MI_Button_Pressed` — Instance with pressed-state parameter values
- `MI_Border` / `MI_Border_Light` — Border materials for different contexts

This approach is more flexible than texture-based buttons — a single material can handle any button shape, with smooth animated transitions between states via material parameter interpolation.

## CommonUI Input Data and Action Tables

### CUI_InputData (CommonUIInputData)

The `CUI_InputData` asset (parent: `UCommonUIInputData`) is registered globally and defines the default confirm/back actions for the entire project:

```
DefaultClickAction → "Confirm" row in NewCompositeDataTable
DefaultBackAction  → "Back" row in NewCompositeDataTable
```

Registered in `DefaultGame.ini`:
```ini
[/Script/CommonUI.CommonUISettings]
InputData=/Game/UI/Common/CUI_InputData.CUI_InputData_C
```

### CompositeDataTable Pattern

A `CompositeDataTable` merges multiple data tables into one lookup:

```
NewCompositeDataTable (CompositeDataTable)
├── CUI_InputTable (project-specific rows)
│   ├── "Back"    → BackSpace / Gamepad_FaceButton_Right
│   ├── "Build"   → key icons for build action
│   ├── "Confirm" → SpaceBar / Gamepad_FaceButton_Bottom
│   ├── "Pause"   → key icons for pause
│   └── "Place"   → key icons for place action
└── /CommonUI/GenericInputActionDataTable (engine defaults)
    ├── "GenericAccept"
    ├── "GenericBack"
    ├── "GenericFaceButton_*"
    ├── "GenericMove_*"
    └── "GenericLeftShoulder" / "GenericRightShoulder"
```

Each row in `CUI_InputTable` (type: `CommonGenericInputActionDataTable`) contains:
- `DisplayName` — text shown alongside the icon
- `HoldDisplayName` — text for hold actions
- `HoldTime` — duration required for hold
- Per-platform icon brushes (keyboard, gamepad, touch)
- `NavBarPriority` — ordering in the action bar

`CUI_Button` references this table via its `TriggeringInputAction` property (a `DataTableRowHandle`), and its embedded `CommonActionWidget` automatically displays the correct icon for the active input device.

### Manual vs Automatic Device Detection

Two approaches exist:

**Automatic (CommonInput built-in):**
- Set `bEnableDefaultInputConfig=True` in CommonUI settings
- CommonInput auto-detects device changes via `UCommonInputSubsystem`
- Fires `OnActiveInputTypeChanged` delegate automatically
- Simpler but less control

**Manual (Cropout pattern):**
- Set `bEnableDefaultInputConfig=False`
- Player Controller uses legacy AnyKey/Touch1/Mouse2D mappings to detect device
- Broadcasts a custom `KeySwitch` multicast delegate
- Both gameplay (BP_Player) and UI (UI_GameMain) bind to this delegate
- More control — allows custom per-device logic (cursor behavior, input mode, focus management)

The manual approach is better for games that need precise control over when input modes switch (e.g., RTS where mouse hover on UI should not block camera panning).

## Blueprint-Only Projects

Many production projects (including Epic's Cropout sample) are pure Blueprint with no C++ source code. This affects how UI work is approached — not which framework is used (CommonUI works in both C++ and Blueprint-only projects).

### Detection
Check for Blueprint-only projects by looking for:
- `.uproject` file exists but no `Source/` directory
- All gameplay logic in `Content/Blueprint/` folders

### Implications for UI Work
1. **No C++ base classes** — Widgets subclass engine classes (UUserWidget, CommonActivatableWidget, CommonButtonBase, etc.) directly in Blueprint
2. **All automation via AgentBridge** — Widget creation, property setting, and hierarchy manipulation must use AgentBridge Python APIs
3. **Configuration over code** — Input routing, styles, and platform settings are entirely in `.ini` files and data assets
4. **Blueprint event graphs** — Input mode switching, device detection, and UI transitions are implemented in Blueprint event graphs rather than C++ overrides

### Creating Widget Blueprints in Blueprint-Only Projects via AgentBridge

```python
ab = unreal.AgentBridgeLibrary

# Step 1: Create widget Blueprint
wbp = ab.ensure_asset("/Game/UI/UI_Elements", "UI_MyScreen", "WidgetBlueprint", "WidgetBlueprintFactory")

# Step 2: Reparent to desired parent (CommonActivatableWidget, UserWidget, etc.)
parent_class = unreal.load_object(None, "/Script/CommonUI.CommonActivatableWidget")
unreal.BlueprintEditorLibrary.reparent_blueprint(wbp, parent_class)

# Step 3: Open in editor to initialize WidgetTree
subsys = unreal.get_editor_subsystem(unreal.AssetEditorSubsystem)
subsys.open_editor_for_assets([wbp])

# Step 4: Build widget tree
bp_path = "/Game/UI/UI_Elements/UI_MyScreen"
ab.add_widget_to_tree(bp_path, "", "Overlay", "RootOverlay")
ab.add_widget_to_tree(bp_path, "RootOverlay", "CanvasPanel", "ContentPanel")
```

## Material-Driven Button States (Cropout Pattern)

Instead of texture swaps for button states, use a **master material with instances** for maximum flexibility:

### Architecture
```
M_MasterButton (Material)
    Parameters: Color, Opacity, Glow, EdgeSoftness, CornerRadius
    ├── MI_Button_Hover (Material Instance) — brighter color, subtle glow
    ├── MI_Button_Pressed (Material Instance) — darker color, inset effect
    └── MI_Border / MI_Border_Light — border variants for different contexts
```

### Advantages Over Texture Swaps
- **Shape-independent** — same material works for any button shape/size
- **Smooth transitions** — animate material parameters for polished state changes
- **Memory efficient** — one material vs multiple textures per button state
- **Designer-friendly** — artists tweak material instances without touching code
- **Resolution-independent** — procedural, not pixel-based

### Setup in Widget Blueprint
1. Use an `Image` widget for the button background
2. Set the brush material to `MI_Button_Normal` (default state)
3. On hover: swap to `MI_Button_Hover` or lerp material parameters
4. On press: swap to `MI_Button_Pressed`
5. Material parameters can be animated via Widget Animations or Blueprint timeline

### Related Material Work
The button material itself should be created by `ue-material`. This skill handles the **widget integration** — placing Image widgets, swapping materials on state changes, and configuring the button hierarchy.
