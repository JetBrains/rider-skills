# Input Routing and Focus Navigation

## Input Modes

Unreal provides three input modes that control how input is distributed between the game and UI:

### SetInputMode_GameOnly
```cpp
FInputModeDataGameOnly InputMode;
InputMode.SetConsumeCaptureMouseDown(true);
PlayerController->SetInputMode(InputMode);
PlayerController->bShowMouseCursor = false;
```
- All input goes to the game (player controller, pawns, actors).
- UI widgets do not receive any input events.
- Mouse cursor is typically hidden.
- Use for: gameplay with no interactive UI (FPS combat, driving).

### SetInputMode_UIOnly
```cpp
FInputModeDataUIOnly InputMode;
InputMode.SetWidgetToFocus(MenuWidget->TakeWidget());
InputMode.SetLockMouseToViewportBehavior(EMouseLockMode::DoNotLock);
PlayerController->SetInputMode(InputMode);
PlayerController->bShowMouseCursor = true;
```
- All input goes to UI. Game input is completely blocked.
- Player cannot move, look, or interact with the game world.
- Use for: main menus, full-screen pause menus, character creation screens.
- Always set `WidgetToFocus` to ensure keyboard/gamepad input reaches the correct widget.

### SetInputMode_GameAndUI
```cpp
FInputModeDataGameAndUI InputMode;
InputMode.SetWidgetToFocus(HUDWidget->TakeWidget());
InputMode.SetLockMouseToViewportBehavior(EMouseLockMode::LockAlways);
InputMode.SetHideCursorDuringCapture(false);
PlayerController->SetInputMode(InputMode);
PlayerController->bShowMouseCursor = true;
```
- Both game and UI receive input simultaneously.
- UI gets first pass; if a widget consumes the input, it does not reach the game.
- Use for: in-game HUD with clickable elements, inventory overlays during gameplay, RTS-style interfaces.
- Most common mode for games with interactive HUD.

### Input Mode Best Practices
- Always restore the previous input mode when closing a menu.
- Store the previous mode before switching:
```cpp
void UMyMenu::OpenMenu()
{
    bWasShowingCursor = PC->bShowMouseCursor;
    PC->SetInputMode(FInputModeDataUIOnly());
    PC->bShowMouseCursor = true;
}

void UMyMenu::CloseMenu()
{
    PC->SetInputMode(FInputModeDataGameOnly());
    PC->bShowMouseCursor = bWasShowingCursor;
}
```
- With CommonUI, input mode is managed automatically per activatable widget via `GetDesiredInputConfig()`.

## Focus Model and Navigation

UMG uses a focus-based navigation model for keyboard and gamepad:

### Focus Basics
- Only one widget can have focus at a time (per player).
- Focus determines which widget receives keyboard/gamepad input.
- `IsFocusable` must be `true` on a widget for it to receive focus.
- Call `SetFocus()` or `SetKeyboardFocus()` to programmatically set focus.

### Setting Initial Focus
```cpp
void UMyMenu::NativeConstruct()
{
    Super::NativeConstruct();
    // Delay to next frame to ensure layout is complete
    GetWorld()->GetTimerManager().SetTimerForNextTick([this]()
    {
        if (StartButton)
        {
            StartButton->SetFocus();
        }
    });
}
```

Why delay? Widget layout may not be complete in `NativeConstruct`. Setting focus before layout causes the focus to silently fail. Using `SetTimerForNextTick` ensures layout has run.

### Focus Events
```cpp
// On the widget itself
virtual void NativeOnAddedToFocusPath(const FFocusEvent& InFocusEvent) override;
virtual void NativeOnRemovedFromFocusPath(const FFocusEvent& InFocusEvent) override;

// On the player controller
FOnFocusReceivedDelegate& OnFocusReceived();
```

## Gamepad Navigation Setup

Gamepad navigation uses the same focus system but navigates via D-pad or left stick:

### Navigation Rules (per widget, per direction)

```cpp
// In C++
MyButton->SetNavigationRuleExplicit(EUINavigation::Down, OtherButton);
MyButton->SetNavigationRuleExplicit(EUINavigation::Up, AnotherButton);

// Navigation rule types:
// Escape - leave the widget boundary (default)
// Explicit - go to a specific widget
// Wrap - wrap around within the container
// Stop - prevent navigation in this direction
// Custom - call a delegate to decide
// CustomBoundary - delegate only at the boundary
```

In the UMG designer, navigation rules are configured in the widget's Details panel under "Navigation."

### Automatic Navigation
Panel widgets (Vertical Box, Horizontal Box, Uniform Grid) provide automatic navigation among their children. For most cases:
1. Put buttons in a Vertical Box.
2. Set each button's `IsFocusable = true`.
3. Navigation up/down works automatically.

Override only when automatic navigation fails (complex layouts, multiple columns, tab-like structures).

### Navigation Debugging
Enable navigation visualization:
```
SlateDebugger.Start
SlateDebugger.SetFocusDebugging true
```
This draws focus borders and navigation paths in the viewport.

## Key/Button Event Routing Through Widget Hierarchy

Input events flow through the widget tree in a specific order:

1. **Focused widget** receives the event first via `NativeOnKeyDown` / `NativeOnKeyUp`.
2. If not handled, the event bubbles **up** to parent widgets.
3. If still not handled, it reaches the player controller.
4. Finally, it reaches input components and the pawn.

### Handling Key Events in Widgets
```cpp
virtual FReply NativeOnKeyDown(const FGeometry& InGeometry, const FKeyEvent& InKeyEvent) override
{
    if (InKeyEvent.GetKey() == EKeys::Escape)
    {
        CloseMenu();
        return FReply::Handled();
    }
    return Super::NativeOnKeyDown(InGeometry, InKeyEvent);
}
```

- Return `FReply::Handled()` to consume the event (stops bubbling).
- Return `FReply::Unhandled()` or call `Super` to let it propagate.

### Mouse Event Routing
Mouse events use hit testing rather than focus:
1. The topmost widget under the cursor (based on visibility and hit test settings) receives the event.
2. Events bubble up from the hit widget through parents.
3. Widget visibility controls hit testing:
   - `Visible` -- renders and receives hits.
   - `SelfHitTestInvisible` -- renders, does not receive own hits, children can.
   - `HitTestInvisible` -- renders, no hits for self or children.

## Capturing and Consuming Input

### Mouse Capture
```cpp
// Capture all mouse input to this widget (e.g., during drag)
FReply::Handled().CaptureMouse(SharedThis(this));

// Release capture
FReply::Handled().ReleaseMouseCapture();

// Check capture
bool bCaptured = HasMouseCapture();
```

### Input Consumption in Containers
A common pattern for modal dialogs -- block all input behind the dialog:
```cpp
// In the background overlay widget:
virtual FReply NativeOnMouseButtonDown(const FGeometry& Geometry, const FPointerEvent& MouseEvent) override
{
    // Consume the click so it doesn't reach widgets behind
    return FReply::Handled();
}
```

Or set the background panel to `Visible` (rather than `SelfHitTestInvisible`) so it naturally blocks input.

## Virtual Cursor for Gamepad

For games that need a free-moving cursor controlled by gamepad (instead of focus-based navigation):

### Analog Cursor (Engine Built-in)
Enable in Project Settings > User Interface > Software Cursor Widgets or implement via `UGameViewportClient`:

```cpp
// In your GameViewportClient subclass
void UMyViewportClient::Init(struct FWorldContext& WorldContext, UGameInstance* OwningGameInstance, bool bCreateNewAudioDevice)
{
    Super::Init(WorldContext, OwningGameInstance, bCreateNewAudioDevice);
    // Set up analog cursor settings
    GetGameLayerManager()->SetUseAnalogCursor(true);
}
```

CommonUI provides `UCommonAnalogCursor` which handles:
- Stick-to-cursor mapping with acceleration curves.
- Automatic click simulation on confirm button.
- Cursor speed configuration.
- Dead zone handling.

### When to Use Virtual Cursor vs Focus Navigation
- **Focus navigation** (recommended): menus, settings, simple inventories. Works naturally with D-pad.
- **Virtual cursor**: complex drag-and-drop UIs, world map interactions, RTS-style gameplay. More complex to implement correctly.

## Touch Input Handling

### Touch Events in Widgets
```cpp
virtual FReply NativeOnTouchStarted(const FGeometry& InGeometry, const FPointerEvent& InGestureEvent) override;
virtual FReply NativeOnTouchMoved(const FGeometry& InGeometry, const FPointerEvent& InGestureEvent) override;
virtual FReply NativeOnTouchEnded(const FGeometry& InGeometry, const FPointerEvent& InGestureEvent) override;
virtual FReply NativeOnTouchForceChanged(const FGeometry& InGeometry, const FPointerEvent& InGestureEvent) override;
```

### Touch-Specific Considerations
- Touch widgets need larger hit targets (minimum 44x44 dp per Apple HIG, 48x48 dp per Material Design).
- Avoid hover-dependent UI on touch platforms (no hover state exists).
- Use `UInputSettings::bUseMouseForTouch` for testing touch on PC.
- Swipe gestures require custom implementation -- track touch start/end positions and velocity.

### Multi-Touch
UMG supports multi-touch via finger index:
```cpp
virtual FReply NativeOnTouchStarted(const FGeometry& InGeometry, const FPointerEvent& InGestureEvent) override
{
    int32 FingerIndex = InGestureEvent.GetPointerIndex();
    FVector2D TouchPosition = InGestureEvent.GetScreenSpacePosition();
    // Track per-finger for pinch, rotate, etc.
    return FReply::Handled();
}
```

For pinch-to-zoom, track two finger positions and compute the distance delta each frame.

## Enhanced Input Context Switching for Multi-Mode Games

Production games use multiple Input Mapping Contexts (IMCs) to handle different gameplay states. This pattern from the Cropout sample shows how to structure input across modes:

### Context Organization

```
Content/Blueprint/Core/Player/Input/
├── IMC_BaseInput          # Always-active base context (camera move, zoom, spin)
├── IMC_BuildMode          # Active during building placement
├── IMC_DragMove           # Active during drag-based camera movement
├── IMC_Villager_Mode      # Active during villager interaction
├── IA_Move                # Camera movement action
├── IA_Zoom                # Zoom in/out action
├── IA_Spin                # Camera rotation action
├── IA_DragMove            # Drag-based movement action
├── IA_Build_Move          # Build mode movement action
├── IA_Villager            # Villager selection action
├── IM_Normalize           # Custom input modifier (normalize vector)
├── IM_Offset              # Custom input modifier (apply offset)
├── E_InputType            # Enum: input type detection
└── CUI_InputTable         # Data table mapping inputs per platform
```

### Context Switching Pattern (C++)

```cpp
// Get the Enhanced Input subsystem
UEnhancedInputLocalPlayerSubsystem* InputSubsystem =
    ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(GetLocalPlayer());

// Base context always active at priority 0
InputSubsystem->AddMappingContext(IMC_BaseInput, 0);

// Mode-specific contexts at higher priority (override base bindings)
void EnterBuildMode()
{
    InputSubsystem->AddMappingContext(IMC_BuildMode, 1);
}

void ExitBuildMode()
{
    InputSubsystem->RemoveMappingContext(IMC_BuildMode);
}

void EnterVillagerMode()
{
    InputSubsystem->AddMappingContext(IMC_VillagerMode, 1);
}
```

### Custom Input Modifiers

Custom input modifiers (IM_Normalize, IM_Offset) process raw input before it reaches the action:
- **IM_Normalize** — Normalizes a 2D vector input to unit length (prevents diagonal speed boost)
- **IM_Offset** — Applies a configurable offset to input values (useful for camera centering)

These are Blueprint subclasses of `UInputModifier` that can be reused across multiple IMCs.

### Input Type Detection Pattern

Use an enum (`E_InputType`) to track the current input method and adapt UI accordingly:

```cpp
UENUM(BlueprintType)
enum class EInputType : uint8
{
    MouseAndKeyboard,
    Gamepad,
    Touch
};
```

Combined with CommonUI's `OnActiveInputTypeChanged` delegate, this drives:
- Button prompt icon switching (keyboard keys vs gamepad buttons vs touch icons)
- UI layout adaptation (larger buttons for touch, focus highlights for gamepad)
- Cursor visibility toggling

### Data-Driven Input Configuration

The `CUI_InputTable` data table maps input actions to display names and icons per platform. This allows designers to configure input prompts without code changes:

| ActionTag | KeyboardIcon | GamepadIcon | TouchIcon | DisplayName |
|-----------|-------------|-------------|-----------|-------------|
| UI.Action.Confirm | Enter_Key.png | A_Button.png | Tap.png | "Confirm" |
| UI.Action.Back | Escape_Key.png | B_Button.png | Swipe.png | "Back" |

## Complete Cross-Platform Input↔UI Integration Pattern (from Cropout)

This documents the full production pattern for how input device detection drives UI adaptation.

### Architecture Flow

```
Legacy Input (DefaultInput.ini)    Enhanced Input (IMC assets)    CommonUI (widget stack)
         ↓                                   ↓                           ↓
    BP_PC detects device          BP_Player binds IA_* actions    UI_Layer_Game/Menu
         ↓                                   ↓                    (CommonActivatableWidget)
    KeySwitch delegate  ──────→  BP_Player switches IMC           ↓
         ↓                       + camera/cursor handling    CUI_Button shows
    UI_GameMain                                              correct icon via
    switches InputMode                                       CommonActionWidget
```

### Layer 1: Device Detection (BP_PC — Player Controller)

The Player Controller uses **legacy input** (not Enhanced Input) for device detection because it needs AnyKey capture:

```
DefaultInput.ini:
  ActionMapping: "KeyDetect"    → AnyKey + Gamepad_Left2D
  ActionMapping: "Touch Detect" → Touch1
  AxisMapping: "MouseMove"      → Mouse2D
```

When any input fires, BP_PC:
1. Checks `Key_IsGamepadKey` to classify the input
2. Updates an `E_InputType` variable (enum: `KeyMouse`, `Gamepad`, `Touch`)
3. Only if the type **changed**, broadcasts a `KeySwitch` multicast delegate
4. Toggles `bShowMouseCursor` and `bEnableMouseOverEvents`

**Key insight:** The project disables CommonInput's built-in input detection (`bEnableDefaultInputConfig=False`) and handles it manually in BP_PC for full control.

### Layer 2: Gameplay Input (BP_Player — Pawn)

On possession, BP_Player:
1. Gets `EnhancedInputLocalPlayerSubsystem` from the controller
2. Calls `AddMappingContext(IMC_BaseInput)` for the default gameplay context
3. Binds BP_PC's `KeySwitch` delegate to react to device changes

When `KeySwitch` fires, BP_Player runs a `SwitchEnum(E_InputType)`:
- **KeyMouse**: Uses `GetMousePosition` → projects cursor to world
- **Touch**: Uses `GetInputTouchState(Touch1/Touch2)`, only activates cursor while touching
- **Gamepad**: Resets cursor position, hides mouse, calls `SetFocusToGameViewport`

### Layer 3: UI Input Mode Switching (UI_GameMain)

`UI_GameMain` (the main HUD, a `CommonActivatableWidget`) also binds to `KeySwitch`:

```
On KeySwitch → SwitchEnum(E_InputType):
  KeyMouse  → SetInputMode_GameAndUIEx (allows mouse hover on UMG widgets)
              bShowMouseCursor = true
  Gamepad   → SetInputMode_GameOnly (prevents CommonUI from eating gamepad input)
              SetFocusToGameViewport
  Touch     → SetInputMode_GameOnly
              bShowMouseCursor = false
```

**Critical pattern:** For gamepad, the HUD uses `SetInputMode_GameOnly` even though there are interactive buttons. This prevents CommonUI from capturing D-pad input when the player should be moving. Interactive UI screens (pause, build) switch to `Menu` mode via their `GetDesiredInputConfig()`.

### Layer 4: Automatic Icon Display (CUI_Button → CommonActionWidget)

`CUI_Button` (extends `CommonButtonBase`) contains:
- A `CommonActionWidget` named `GamepadIcon` that auto-displays the correct platform icon
- A `CommonTextBlock` for the button label
- A `TriggeringInputAction` property (DataTableRowHandle) pointing to `NewCompositeDataTable`

The `NewCompositeDataTable` is a `CompositeDataTable` that merges:
1. `CUI_InputTable` — project-specific actions (Back, Build, Confirm, Pause, Place)
2. Engine's `/CommonUI/GenericInputActionDataTable` — generic actions (GenericAccept, GenericBack, etc.)

Each row contains per-platform icon brushes. `CommonActionWidget` reads the active input type and displays the matching brush automatically.

### Layer 5: Global Configuration

```ini
; DefaultGame.ini
[/Script/CommonUI.CommonUISettings]
InputData=/Game/UI/Common/CUI_InputData.CUI_InputData_C
bEnableDefaultInputConfig=False        ; Manual device detection in BP_PC
bEnableEnhancedInputSupport=False      ; Manual Enhanced Input in BP_Player

; CUI_InputData configures:
;   DefaultClickAction → "Confirm" row in NewCompositeDataTable
;   DefaultBackAction  → "Back" row in NewCompositeDataTable

; DefaultEngine.ini
[/Script/Engine.Engine]
GameViewportClientClassName=/Script/CommonUI.CommonGameViewportClient
```

### Input Mapping Context Details

| IMC | Actions | Keys | Purpose |
|-----|---------|------|---------|
| `IMC_BaseInput` | IA_Move, IA_Spin, IA_Zoom | Gamepad_Left2D, RightX/Y, MouseWheel, Gesture_Pinch/Rotate | Always active — base camera controls |
| `IMC_BuildMode` | IA_Build_Move | LeftMouse, Gamepad_A, Touch1 | Active in build placement mode |
| `IMC_DragMove` | IA_DragMove | Mouse2D, Touch1 | Active during drag-based camera |
| `IMC_Villager_Mode` | IA_Villager | LeftMouse, Gamepad_A, Touch1 | Active in villager interaction |

Each IMC maps the same logical action to mouse, gamepad, AND touch keys simultaneously — the correct one fires based on the active device.

### Widget Hierarchy

```
Viewport
└── UI_Layer_Game (CommonActivatableWidget)
    ├── SafeZone
    │   └── Resource display (UIE_Resource instances)
    ├── CommonActivatableWidgetStack "MainStack"
    │   ├── UI_GameMain (pushed on activation)
    │   ├── UI_Build (pushed when entering build mode)
    │   ├── UI_Pause (pushed on pause)
    │   └── UI_EndGame (pushed on game end)
    └── CUI_Button "BTN_Pause"

Viewport (menu level)
└── UI_Layer_Menu (CommonActivatableWidget)
    └── CommonActivatableWidgetStack "MainStack"
        └── UI_MainMenu (pushed on activation)
```

The `MainStack` is a `CommonActivatableWidgetStack` — only the top widget receives input. Pushing UI_Pause on top of UI_GameMain automatically deactivates the HUD input and activates menu input.
