# UE UI Platform — Cross-Platform, Input Switching, Glyphs, Console/Mobile/PC

## Input Type Detection and Switching

### ECommonInputType Enum
```cpp
enum class ECommonInputType : uint8
{
    MouseAndKeyboard,  // PC default
    Gamepad,           // Console default, PC with controller
    Touch,             // Mobile default
    Count
};
```

### UCommonInputSubsystem (Key Methods)
```cpp
// Get current active input type
ECommonInputType GetCurrentInputType() const;

// Get platform default input type
ECommonInputType GetDefaultInputType() const;

// Override current input type programmatically
void SetCurrentInputType(ECommonInputType NewInputType);

// Delegate: fires when player switches input device
FOnInputMethodChanged OnInputMethodChanged;  // Blueprint-compatible
FOnInputMethodChangedNative OnInputMethodChangedNative;  // C++ native

// Gamepad-specific
FName GetCurrentRawGamepadName() const;
void SetGamepadInputType(const FName& InGamepadInputType);
bool IsGamepadTypeOverridden() const;
```

### How Auto-Switching Works
CommonUI monitors raw input events continuously:
1. Player presses gamepad button while in MKB mode → auto-switches to `Gamepad`
2. Player moves mouse or presses keyboard key while in Gamepad mode → auto-switches to `MouseAndKeyboard`
3. Player touches screen → auto-switches to `Touch`
4. `OnInputMethodChanged` fires on every switch → all `CommonActionWidget` instances auto-update icons

No manual code needed for basic switching — CommonUI handles it. You only need to listen if your custom widgets need to adapt.

### Reacting to Input Type Changes
```cpp
// In PlayerController or UI Manager:
void AMyPlayerController::BeginPlay()
{
    Super::BeginPlay();

    if (UCommonInputSubsystem* CIS = UCommonInputSubsystem::Get(GetLocalPlayer()))
    {
        CIS->OnInputMethodChangedNative.AddUObject(
            this, &AMyPlayerController::OnInputMethodChanged);
    }
}

void AMyPlayerController::OnInputMethodChanged(ECommonInputType NewInputType)
{
    switch (NewInputType)
    {
    case ECommonInputType::MouseAndKeyboard:
        // Show mouse cursor, enable hover states
        break;
    case ECommonInputType::Gamepad:
        // Hide cursor, ensure focus on a widget, show gamepad prompts
        break;
    case ECommonInputType::Touch:
        // Enlarge touch targets, simplify layout
        break;
    }
}
```

### Synthetic Cursor (Gamepad Hover)
CommonUI teleports an invisible mouse cursor to the focused element during gamepad navigation. This triggers hover animations without actual mouse movement — buttons highlight on gamepad focus just like mouse hover.

### Known Bug (UE 5.6)
Input mode can switch rapidly between mouse and gamepad when using a gamepad, causing controller failure. Related to `OnInputMethodChanged` event handling. Workaround: debounce input type changes or lock input type during critical transitions.

---

## Platform-Specific Button Prompts / Glyphs

### Architecture
```
CommonInputSettings (Project Settings)
    ├── Platform: Windows
    │     ├── Default Gamepad: GenericUSB (fallback)
    │     └── Controller Data: [DA_KeyboardMouse, DA_XboxController, DA_PSController]
    ├── Platform: PS5
    │     └── Controller Data: [DA_PSController]
    ├── Platform: XSX
    │     └── Controller Data: [DA_XboxController]
    ├── Platform: IOS
    │     └── Controller Data: [DA_TouchController, DA_MFiController]
    └── Platform: Android
          └── Controller Data: [DA_TouchController, DA_XboxController]
```

### UCommonInputBaseControllerData (Per-Controller Icon Set)
Blueprint data asset per controller type. Maps FKey → FSlateBrush (icon texture).

```
DA_XboxController : CommonInputBaseControllerData
    InputBrushDataMap:
        Gamepad_FaceButton_Bottom → T_Xbox_A.png
        Gamepad_FaceButton_Right  → T_Xbox_B.png
        Gamepad_FaceButton_Left   → T_Xbox_X.png
        Gamepad_FaceButton_Top    → T_Xbox_Y.png
        Gamepad_LeftShoulder      → T_Xbox_LB.png
        Gamepad_RightShoulder     → T_Xbox_RB.png
        Gamepad_LeftTrigger       → T_Xbox_LT.png
        Gamepad_RightTrigger      → T_Xbox_RT.png
        ...

DA_PSController : CommonInputBaseControllerData
    InputBrushDataMap:
        Gamepad_FaceButton_Bottom → T_PS_Cross.png
        Gamepad_FaceButton_Right  → T_PS_Circle.png
        ...

DA_KeyboardMouse : CommonInputBaseControllerData
    InputBrushDataMap:
        SpaceBar     → T_KB_Space.png
        LeftMouseButton → T_Mouse_LMB.png
        E            → T_KB_E.png
        ...
```

### CommonActionWidget — Auto-Updating Icon Display
Place inside a `CommonButtonBase`. Automatically shows the correct icon for current input device.

```cpp
// In your button Blueprint:
// 1. Add CommonActionWidget child, rename to "InputActionWidget"
// 2. Set InputAction property to the data table row
// 3. Done — icon auto-updates on input switch

// C++ access:
UPROPERTY(meta=(BindWidget))
UCommonActionWidget* InputActionWidget;

// Manual icon query:
FSlateBrush IconBrush = InputActionWidget->GetIcon();

// Listen for icon updates:
InputActionWidget->OnInputMethodChanged.AddDynamic(this, &HandleInputChanged);
```

### CommonInputActionDataBase (Input Action Data Table)
Data table row defining per-platform key bindings for UI display:

```
Row: "Confirm"
    DisplayName: "Confirm"
    DefaultInputAction:
        MouseAndKeyboard: Enter
        Gamepad: Gamepad_FaceButton_Bottom  (A / Cross)
        Touch: Virtual_Accept

Row: "Cancel"
    DisplayName: "Cancel"
    DefaultInputAction:
        MouseAndKeyboard: Escape
        Gamepad: Gamepad_FaceButton_Right   (B / Circle)
        Touch: Virtual_Back

Row: "TabLeft"
    DisplayName: "Previous Tab"
    DefaultInputAction:
        MouseAndKeyboard: Q
        Gamepad: Gamepad_LeftShoulder      (LB / L1)

Row: "TabRight"
    DisplayName: "Next Tab"
    DefaultInputAction:
        MouseAndKeyboard: E
        Gamepad: Gamepad_RightShoulder     (RB / R1)
```

### Rich Text Inline Icons
Show key icons inline in text: "Press [A] to jump"

```cpp
// 1. Create DataTable with RichImageRow type
// 2. Each row: Name="Jump", Brush=T_Xbox_A (updates per platform)
// 3. In RichTextBlock: "Press <img id='Jump'/> to continue"
// 4. Assign RichTextBlockImageRowDecorator with the DataTable
```

### Pre-Made Icon Sets
- **Xelu's Free Prompts**: CC0 license, covers Xbox/PS/KB+M/Switch
- **UE5-InputDevicesBrushes plugin**: https://github.com/Soskat/UE5-InputDevicesBrushes
  Pre-configured CommonInputBaseControllerData for Mouse/Keyboard, Xbox Series, PS5

### How Icons Auto-Update at Runtime
1. Player presses gamepad button → CommonUI detects input switch
2. `OnInputMethodChanged` fires globally
3. All `CommonActionWidget` instances query current platform's `CommonInputBaseControllerData`
4. Widgets display correct glyph for active input type
5. No manual refresh code needed

---

## Gamepad Navigation

### Focus System
Slate determines focus spatially — D-pad/stick direction maps to nearest widget in that direction. Independent of widget hierarchy.

### Focus Cascade on Activation
When `UCommonActivatableWidget` becomes foremost:
1. Auto-restore previous focus if `bAutoRestoreFocus = true`
2. Use `NativeGetDesiredFocusTarget()` if implemented
3. Accept current focus if it's a child of this widget
4. Focus the activatable itself (if focusable)
5. No focus (broken state — avoid)

### Navigation Rules (EUINavigationRule)
```cpp
enum class EUINavigationRule : uint8
{
    Escape,         // Exit the navigation context
    Explicit,       // Navigate to a specific widget
    Wrap,           // Loop: last → first
    Stop,           // Stop at boundary
    Custom,         // Delegate-driven
    CustomBoundary, // Delegate-driven at boundaries
    Invalid
};
```

**Setting navigation rules:**
```cpp
// Make left edge of grid wrap to right edge
MyButton->SetNavigationRuleCustomBoundary(
    EUINavigation::Left,
    FCustomWidgetNavigationDelegate::CreateUObject(
        this, &UMyWidget::HandleLeftNavigation));

// Explicit: Right from ButtonA goes to ButtonB
ButtonA->SetNavigationRuleExplicit(EUINavigation::Right, ButtonB);
```

### Tab Switching with Shoulder Buttons (L1/R1, LB/RB)
```cpp
// UCommonTabListWidgetBase + CommonAnimatedSwitcher
// Configure in Blueprint:
//   NextTabInputActionData → "TabRight" (RB/R1/E)
//   PreviousTabInputActionData → "TabLeft" (LB/L1/Q)
//
// C++ setup:
TabList->RegisterTab(FName("Audio"), UMyAudioSettings::StaticClass());
TabList->RegisterTab(FName("Video"), UMyVideoSettings::StaticClass());
TabList->RegisterTab(FName("Controls"), UMyControlSettings::StaticClass());
TabList->SetLinkedSwitcher(ContentSwitcher);
```

### Back Button Handling
```cpp
// On UCommonActivatableWidget:
UPROPERTY(EditAnywhere, Category = "Input")
bool bIsBackHandler = true;

UPROPERTY(EditAnywhere, Category = "Input")
bool bIsBackActionDisplayedInActionBar = true;

virtual bool NativeOnHandleBackAction() override
{
    DeactivateWidget();  // Pops from stack, restores previous
    return true;         // Consumed
}
```

### CommonBoundActionBar (Bottom Action Prompts)
```cpp
// Widget that displays all registered actions at screen bottom
// Shows: "[A] Select  [B] Back  [X] Sort  [Y] Details"
// Auto-updates icons per platform
// Add to HUD layout at bottom of screen
// Actions register automatically from CommonButtonBase widgets in active panel
```

### Virtual Cursor (Analog Stick Mouse Emulation)
Requires 2 subclasses:
1. `UMyGameViewportClient : UCommonGameViewportClient`
2. `UMyAnalogCursor : UCommonAnalogCursor`

Set in Project Settings → Engine → General → Game Viewport Client Class.

---

## Safe Zones (Console + Mobile)

### USafeZone Widget
Container that constrains children to the platform-reported safe area.

```
┌─────────────────────────────────────────┐  TV screen
│  ┌───────────────────────────────────┐  │  Title Safe (80%)
│  │  ┌─────────────────────────────┐  │  │  Action Safe (90%)
│  │  │                             │  │  │
│  │  │       Game Content          │  │  │
│  │  │                             │  │  │
│  │  └─────────────────────────────┘  │  │
│  └───────────────────────────────────┘  │
└─────────────────────────────────────────┘
```

**Title Safe (80%)**: Critical text and UI — must be readable
**Action Safe (90%)**: Interactive elements — must be accessible

### Usage
1. Wrap your HUD root in a `USafeZone` widget
2. SafeZone queries `FDisplayMetrics::GetDisplayMetrics()` for platform-specific insets
3. Handles console overscan, mobile notches, and TV safe areas automatically

### Testing Safe Zones in Editor
```
// Console commands:
r.DebugSafeZone.TitleRatio 0.8      // Simulate 80% title safe
r.DebugActionZone.ActionRatio 0.9    // Simulate 90% action safe
r.DebugSafeZone.Mode 1              // Show safe zone overlay
```

### Mobile Notch/Cutout
`USafeZone` automatically accounts for device-specific cutouts (iPhone notch, punch-hole cameras) via `FDisplayMetrics` platform-specific safe area insets.

---

## Console Certification Requirements (UI-Relevant)

### Xbox (XR Requirements)
| XR | Requirement | Impact |
|----|-------------|--------|
| XR-001 | Title stability: start promptly, remain responsive, shut down gracefully | Loading screens, error dialogs |
| XR-003 | No crashes, freezes, or dead-end menus; navigation must be seamless | All menus must have back/escape |
| XR-130 | Support all devices in console generation; navigation via gamepad | Full D-pad navigation required |
| XR-112 | Controller addition/removal handling; account picker | "Press A to continue" screen |
| XR-046 | Use gamertag as display name; show all 16 characters | Text truncation rules |
| Safe Zone | 90% action safe (strict), 80% title safe (recommended) | USafeZone widget required |

**XR Accessibility 112 — UI Navigation:**
- UI must be fully navigable by D-pad alone
- Focus order must match visual layout
- Consistent interaction: A=select, B=back, LB/RB=tabs, LT/RT=pages
- Linear menus should loop (Wrap navigation rule)
- Persistent back links on every screen

### PlayStation (TRC Requirements)
- Safe area requirements via `FDisplayMetrics`
- Controller disconnect/reconnect handling
- Branding regulations (button icons must use PlayStation glyphs)
- Localization requirements
- Activity card integration (PS5)

### Nintendo Switch
- Validate readability on TV (docked) AND portable display (handheld)
- Handle dock/undock transitions mid-session (resolution/DPI changes)
- Controller disconnect/reconnect
- Sleep/wake cycles
- Touch screen unavailable in docked mode — must handle gracefully
- Fonts must be readable at handheld resolution

---

## PC-Specific Patterns

### Mouse Hover States
- Only real mouse movement triggers hover — gamepad uses synthetic cursor for focus highlight
- Show/hide cursor based on input type:
  ```cpp
  void OnInputMethodChanged(ECommonInputType NewType)
  {
      bool bShowCursor = (NewType == ECommonInputType::MouseAndKeyboard);
      // Let CommonUI handle via GetDesiredInputConfig — don't call SetShowMouseCursor
  }
  ```
- NEVER call `SetShowMouseCursor` directly with CommonUI

### Resolution and Window Mode Settings
- PC settings screens should include: resolution, window mode (fullscreen/borderless/windowed), VSync, frame rate cap
- Use `UGameUserSettings` for runtime display changes
- These settings are PC-only — hide on consoles via `CommonHardwareVisibilityBorder`

### Ultra-Wide Support
- Test at 21:9 and 32:9 aspect ratios
- Use horizontal anchoring carefully — extreme left/right elements may be too far apart
- Consider max width constraints on centered UI panels

---

## Mobile-Specific Patterns

### Touch Target Sizes
- **Minimum**: 44×44 points (iOS), 48×48 dp (Android Material Design)
- **Recommended**: 60×60 for primary actions
- **Spacing**: 24pt minimum between touch targets

### Mobile Layout Adaptations
```cpp
void OnInputMethodChanged(ECommonInputType NewType)
{
    if (NewType == ECommonInputType::Touch)
    {
        // Enlarge buttons
        ActionButton->SetMinDesiredWidth(120.f);
        ActionButton->SetMinDesiredHeight(60.f);
        // Simplify layout — fewer visible elements
        DetailPanel->SetVisibility(ESlateVisibility::Collapsed);
    }
}
```

### DPI Scaling
- Project Settings → User Interface → DPI Scale Rule: **Shortest Side** (recommended for games)
- Design Screen Size: 1920×1080 (base resolution)
- UMG auto-scales based on actual device resolution

### Virtual Joystick (Production Pattern)
Two approaches:

**Option A: UTouchInterface (built-in, quick setup)**
- UMG `UTouchInterface` or custom touch zones
- Must not conflict with UI touch targets
- Hide during menu screens (check active UI layer)

**Option B: Custom Simulated Input Widget (recommended for CommonUI projects)**
The simulated input widget pattern injects touch input directly into the Enhanced Input system:

```cpp
// Base: UMySimulatedInputWidget : UCommonUserWidget
//   - Associates with a UInputAction (e.g., IA_Move)
//   - QueryKeyToSimulate() finds which FKey maps to that action
//   - InputKeyValue() / InputKeyValue2D() inject values into EIS
//   - FlushSimulatedInput() stops injection
//   - Listens to ControlMappingsRebuiltDelegate to refresh key cache

// Virtual Joystick: UMyJoystickWidget : UMySimulatedInputWidget
//   - JoystickBackground + JoystickForeground images (BindWidget)
//   - StickRange (max pixel travel from center)
//   - bNegateYAxis (for camera look controls)
//   - NativeOnTouchStarted: record TouchOrigin, activate
//   - NativeOnTouchMoved: compute StickVector = clamp(delta / StickRange, -1, 1)
//   - NativeOnTouchEnded: reset to zero, deactivate
//   - NativeTick: inject StickVector via InputKeyValue2D()

// Touch Region: UMyTouchRegion : UMySimulatedInputWidget
//   - Invisible touch zone for camera look
//   - NativeOnTouchMoved computes delta from previous frame
//   - Injects as 2D axis value
```

**Why custom over UTouchInterface:**
- Integrates with CommonUI's input routing (hidden when menus active)
- Works with Enhanced Input rebinding (auto-updates key mappings)
- Consistent with the rest of the CommonUI architecture
- Supports input injection to any action, not just predefined touch zones

---

## Controller Disconnect / Reconnect Handling

### Architecture
Controller disconnect is a **console certification requirement** (Xbox XR-112, PlayStation TRC). The system must:
1. Detect when ALL gamepads are disconnected
2. Show a blocking overlay instructing the player to reconnect
3. On platforms with user pairing (Xbox, PlayStation), offer "Change User" option
4. Resume gameplay seamlessly on reconnection

### Implementation Pattern
```cpp
// In your HUD layout widget:
void UMyHUDLayout::NativeOnInitialized()
{
    Super::NativeOnInitialized();

    // Listen to device connection changes
    IPlatformInputDeviceMapper& Mapper = IPlatformInputDeviceMapper::Get();
    Mapper.GetOnInputDeviceConnectionChange().AddUObject(
        this, &UMyHUDLayout::HandleInputDeviceConnectionChanged);
    Mapper.GetOnInputDevicePairingChange().AddUObject(
        this, &UMyHUDLayout::HandleInputDevicePairingChanged);
}

void UMyHUDLayout::HandleInputDeviceConnectionChanged(
    EInputDeviceConnectionState NewState,
    FPlatformUserId UserId,
    FInputDeviceId InputDeviceId)
{
    // Check if ALL gamepads are now disconnected
    bool bAnyGamepadConnected = false;
    // ... iterate connected devices ...

    if (!bAnyGamepadConnected && !bDisconnectScreenShowing)
    {
        // IMPORTANT: Defer to next tick (see Pitfall 18)
        DeferredShowDisconnectScreen();
    }
    else if (bAnyGamepadConnected && bDisconnectScreenShowing)
    {
        DismissDisconnectScreen();
    }
}
```

### Platform-Conditional "Change User" Button
```cpp
// In disconnect screen widget:
UPROPERTY(EditAnywhere, Category = "Platform")
FGameplayTagContainer PlatformSupportsUserChangeTags;
// Set to: "Platform.Trait.NeedsPrimaryUser" (Xbox, PlayStation)

void UMyControllerDisconnectedScreen::NativeOnActivated()
{
    Super::NativeOnActivated();

    // Show Change User button only on platforms with user pairing
    if (ChangeUserButton)
    {
        bool bShowChangeUser = false;
        // Check if current platform has any of the user-change tags
        // (Xbox and PlayStation require user pairing; PC/Switch do not)
        ICommonInputModule& Module = ICommonInputModule::Get();
        bShowChangeUser = /* platform trait check */;
        ChangeUserButton->SetVisibility(
            bShowChangeUser ? ESlateVisibility::Visible : ESlateVisibility::Collapsed);
    }
}
```

### Testing in Editor
- Unplug USB gamepad during PIE to trigger disconnect flow
- Use `FGenericPlatformInputDeviceMapper` to simulate pairing changes
- Test both "reconnect same controller" and "connect different controller" paths

---

## Cross-Platform Architecture

### CommonHardwareVisibilityBorder
Widget that conditionally shows/hides children based on platform. No code needed — checkbox-based.

```
CommonHardwareVisibilityBorder
    ├── Visible on PC: ✓
    ├── Visible on Console: ✗
    ├── Visible on Mobile: ✗
    └── Child: [Resolution Settings Panel]
```

### Platform Detection (Runtime)
```cpp
// Blueprint-accessible:
FString Platform = UGameplayStatics::GetPlatformName();
// Returns: "Windows", "Mac", "Linux", "IOS", "Android", "PS5", "XSX", "Switch"

// Compile-time:
#if PLATFORM_WINDOWS
    // PC-only code
#elif PLATFORM_SWITCH
    // Switch-only code
#elif PLATFORM_IOS || PLATFORM_ANDROID
    // Mobile code
#endif

// Per-platform settings:
auto* Settings = UPlatformSettingsManager::Get()
    .GetSettingsForPlatform<UMyPerPlatformSettings>();
```

### Platform-Specific Input Contexts
```cpp
// In Character/Controller setup:
#if PLATFORM_IOS || PLATFORM_ANDROID
    Subsystem->AddMappingContext(IMC_Mobile, 0);
#else
    Subsystem->AddMappingContext(IMC_Desktop, 0);
    Subsystem->AddMappingContext(IMC_GamepadOverlay, 1);
#endif
```

### Testing Platforms in Editor
- **Pretend platforms**: Lyra uses `UPlatformSettingsManager` to simulate platform in editor
- **PIE Settings**: Preview As → select target platform for input/safe zone simulation
- **Mobile Preview**: Use Mobile Preview mode in editor
- **Safe zone debug**: `r.DebugSafeZone.Mode 1` console command

### Required Project Settings for CommonUI
1. **Game Viewport Client Class** → `UCommonGameViewportClient` (or subclass)
2. **Common Input Settings** → Enable Enhanced Input Support = true
3. **Common Input Settings** → Per-platform controller data arrays configured
4. **CommonUIInputData** Blueprint → `DefaultClickAction`, `DefaultBackAction` assigned
5. **Build.cs** → `"CommonUI"`, `"CommonInput"` in dependencies

### Debug Commands
```
CommonUI.DumpActivatableTree        // Full widget hierarchy dump
Slate.InvalidationDebugging 1       // Invalidation visualization
r.DebugSafeZone.Mode 1             // Safe zone overlay
showdebug enhancedinput            // Active input actions/triggers
```
