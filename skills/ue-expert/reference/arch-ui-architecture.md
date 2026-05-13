# UI Architecture (CommonUI & UIExtension)

## CommonUI Framework

### Core Concepts
CommonUI provides platform-agnostic input routing and widget lifecycle management. It replaces manual widget visibility/focus management with a structured layer + stack system.

### Activatable Widgets

**Use when**:
- Widget has multiple interactable children
- Needs to block input from rest of UI
- Examples: pop-up windows, modal menus, settings screens, inventory panels

**Do NOT use when**:
- Tooltips (appear/disappear quickly, no input routing needed)
- Simple display-only elements
- Decorative widgets

**Critical implementations**:
```cpp
// ALWAYS implement — CommonUI cannot determine focus without it
virtual UWidget* NativeGetDesiredFocusTarget() const override;

// ALWAYS implement — controls input state per widget
virtual TOptional<FUIInputConfig> GetDesiredInputConfig() const override;
```

Without `GetDesiredFocusTarget`, gamepad/keyboard navigation breaks.
Without `GetDesiredInputConfig`, deactivating the last widget may soft-lock input.

### Widget Lifecycle
Widgets are **reused, not deleted**. `OnActivated` and `OnDeactivated` fire many times during a widget's lifetime.

```
Widget Created → [Activated → Deactivated → Activated → ...] → Destroyed
```

---

## Layer Architecture (Lyra Pattern)

| Layer Tag | Purpose | Example |
|-----------|---------|---------|
| `UI.Layer.Game` | HUD elements | Health bar, ammo counter |
| `UI.Layer.GameMenu` | In-game menus | Inventory, map, scoreboard |
| `UI.Layer.Menu` | Full-screen menus | Settings, pause screen |
| `UI.Layer.Modal` | Dialogs | Confirmation, error messages |

Each layer contains a widget stack. Only the top widget is active:
- **Push**: Activates new widget, deactivates previous
- **Pop/Deactivate**: Removes current, restores previous

---

## UIExtension System (Lyra Plugin)

### Architecture
Decoupled widget injection via tag-based extension points.

**Extension Point** (receptive slot):
```cpp
struct FUIExtensionPoint {
    FGameplayTag ExtensionPointTag;  // e.g., "UI.HUD.TopRight"
    UObject* ContextObject;
    EUIExtensionPointMatch MatchRule; // ExactMatch or PartialMatch
    TArray<TSubclassOf<UObject>> AllowedDataClasses;
    FExtensionCallback Callback;     // Called when extensions add/remove
};
```

**Extension** (content to inject):
```cpp
struct FUIExtension {
    FGameplayTag ExtensionPointTag;  // Target point
    int32 Priority;                  // Order for multiple extensions
    UObject* Data;                   // Widget, config, or custom object
};
```

### Matching Rules
- **ExactMatch**: `"A.B"` matches only `"A.B"`, not `"A.B.C"`
- **PartialMatch**: `"A.B"` matches `"A.B"` and `"A.B.C"`

### Integration with GameFeatures
`UGameFeatureAction_AddWidgets` uses UIExtension to inject:
- **Layout widgets**: Full HUD layouts with layer tags
- **Element widgets**: Individual UI elements with slot tags

When a GameFeature deactivates, its widgets are automatically removed.

---

## Lyra UI Architecture

### Primary Game Layout
`UPrimaryGameLayout` (from CommonGame) is the root HUD widget:
- Contains layers as named slots
- Managed by `UGameUIManagerSubsystem`
- Accessed via `UCommonLocalPlayer::GetRootUILayout()`

### HUD Widget Injection Flow
```
1. Experience loads → GameFeature activates
2. AddWidgets action registers HUD layout request
3. Layout widget added to appropriate layer
4. Layout widget contains UIExtensionPoint widgets
5. AddWidgets action registers element extensions
6. UIExtensionSystem matches extensions to points
7. Widgets appear at their designated slots
```

### CommonLocalPlayer Delegates
```cpp
// React to gameplay object changes
FOnPlayerControllerSet OnPlayerControllerSet;
FOnPlayerStateSet OnPlayerStateSet;
FOnPlayerPawnSet OnPlayerPawnSet;

// Use CallAndRegister pattern for late-binding:
LocalPlayer->CallAndRegister_OnPlayerControllerSet(Delegate);
```

---

## Best Practices

1. **Layer discipline**: Always push widgets to the correct layer; don't mix HUD and menu widgets
2. **Focus management**: Every activatable widget must implement GetDesiredFocusTarget
3. **Input config restoration**: Ensure valid input state when deactivating last widget
4. **Use UIExtension for modular HUD**: Don't hardcode widget references in the HUD class
5. **Tag-based slots**: Use gameplay tags for extension points, not widget references
6. **Lifecycle awareness**: Handle OnActivated/OnDeactivated correctly (widget reuse)
7. **Platform abstraction**: Use CommonUI's input routing instead of manual platform checks

## Anti-Patterns
- Not implementing focus targets (unpredictable gamepad/keyboard navigation)
- Deactivating all widgets without restoring valid input config (soft-lock)
- Making every widget activatable (unnecessary overhead)
- Hardcoding HUD widget references instead of using extension points
- Direct widget creation instead of using the layer/stack system
- Ignoring CommonUI input routing (breaks cross-platform)
