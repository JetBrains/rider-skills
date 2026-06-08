---
name: ue:ui
description: "Use when user asks to create UMG widgets, set up CommonUI, build HUD systems, implement menus, configure input routing, handle focus navigation, create widget animations, or architect UI frameworks. DO NOT TRIGGER for material/shader work (use ue:material), Blueprint logic unrelated to UI (use ue:blueprint), C++ non-UI code (use ue:coder), or Slate-only editor extensions (use ue:coder)."
context: fork
agent: general-purpose
allowed-tools: Read, Glob, Grep, Bash, Write, Edit
argument-hint: "[UI/widget task description]"
---

See [Reference Image Handling](../_shared/reference-image-handling.md)

## Context7 Version Check

If the query mentions a specific UE version, or involves features known to change across versions, fetch the relevant Context7 section before answering. See `../_shared/context7-protocol.md`.

# UE-UI Skill: Unreal Engine UI/UMG Specialist

## Checklist

Call `TaskCreate` for each item below before starting, then mark each `in_progress` / `completed` as you go:

1. **Clarify** — widget type, CommonUI setup, input routing, existing widget hierarchy
2. **Health check** — verify editor running, AgentBridge reachable
3. **Create widgets** — build widget tree via AgentBridge, set properties, configure layout
4. **Compile and save** — compile Blueprint; save widget asset; confirm zero compile errors
5. **Verify** — add to viewport, test in PIE; confirm layout, focus navigation, and input routing
6. **Code review** — dispatch `ue:code-review` subagent (see `../_shared/post-task.md`); fix all Critical and Important issues before proceeding

## CRITICAL -- Mistakes That Waste Hours

These rules are non-negotiable. Violating any of them leads to subtle bugs, crashes, or hours of debugging.

1. **Never construct UUserWidget with NewObject.** Always use `CreateWidget<UMyWidget>(GetWorld(), WidgetClass)` in C++ or the `Create Widget` node in Blueprints. `NewObject` skips essential widget initialization and causes crashes or silent failures when adding to viewport.

2. **Widget visibility: Collapsed vs Hidden vs HitTestInvisible.** `Collapsed` removes the widget from layout entirely (zero size). `Hidden` keeps layout space but doesn't render. `HitTestInvisible` renders but passes all hit tests to children/widgets behind. `SelfHitTestInvisible` renders, children can receive hits but the widget itself cannot. Using `Hidden` when you mean `Collapsed` wastes layout computation; using `Visible` when you mean `SelfHitTestInvisible` blocks input to the game world.

3. **Don't add to viewport every frame.** Always check `IsInViewport()` before calling `AddToViewport()`. Repeatedly adding an already-present widget duplicates it in the viewport's widget list, causing rendering artifacts and memory leaks.

4. **Input mode: SetInputMode_UIOnly blocks game input entirely.** Use `SetInputMode_GameAndUI` for in-game HUD elements that coexist with gameplay. Reserve `SetInputMode_UIOnly` exclusively for full-screen menus where the player should not move. Forgetting to restore input mode on widget removal locks the player out of controls.

5. **Focus navigation requires explicit configuration.** Gamepad and keyboard navigation does not "just work." You must set `IsFocusable = true` on interactive widgets, configure `Navigation` rules (Explicit, Wrap, Stop, Custom) per direction, and call `SetFocus()` on the initial widget. Without this, D-pad/arrow keys do nothing.

6. **Anchors and alignment must match for responsive UI.** A widget anchored top-left but positioned with absolute coordinates from center will break at non-native resolutions. Always test at 1280x720, 1920x1080, 2560x1440, and ultrawide. Use anchor presets and size boxes for resolution independence.

7. **NEVER use `->SetText()` / `->SetPercent()` / `->SetBrushFromTexture()` for data that changes during widget lifetime.** This is the #1 architecture mistake in UE UI code. Direct widget manipulation scatters update logic across C++, couples game logic to specific widget types, breaks MVVM separation, and causes redundant Slate invalidation. **Use MVVM FieldNotify instead:** define a `UMVVMViewModelBase` with `FieldNotify` properties and `UE_MVVM_SET_PROPERTY_VALUE` setters, then bind widgets to the ViewModel in the Widget Blueprint's View Bindings panel. This updates UI only when values actually change and keeps C++ free of widget references. **Acceptable exceptions only:** `NativeOnListItemObjectSet()` in ListView entries (pooled widgets need explicit data push), one-shot dialogs/tooltips that display static data and are immediately discarded, or quick prototyping (replace with MVVM before shipping). Property Bindings (UMG Designer's Bind dropdown) are equally bad — they evaluate every frame. Avoid them too.

8. **Don't tick widgets for updates.** Widget tick is expensive and scales poorly. Use event-driven patterns: delegates, `OnRep_` functions for replicated data, or explicit `UpdateUI()` calls when data changes. Disable tick on widgets by default with `SetDesiredTickInterval(0)`.

9. **Large widget hierarchies tank performance.** Lists with hundreds of entries must use `UListView` or `UTileView` (virtualized lists) instead of manually spawning widgets into a ScrollBox. For inventories, use widget pooling via `IUserObjectListEntry`. A ScrollBox with 500 child widgets will hitch every frame.

10. **CommonUI activation stack: widgets must implement ICommonActivatableWidget.** If a widget is pushed onto the activation stack but does not implement `UCommonActivatableWidget` (C++) or derive from it, activation callbacks (`OnActivated`, `OnDeactivated`) are silently skipped. The widget appears to work but does not participate in the stack, leading to broken back-navigation and input routing.

11. **WidgetTree is sealed at runtime in C++.** `WidgetTree->ConstructWidget()` and `WidgetTree->RootWidget =` only work at design-time (editor widget construction). Calling them in `NativeConstruct()` fails silently — widgets won't appear. **However**, AgentBridge provides design-time widget tree manipulation via Python: `unreal.AgentBridgeLibrary.add_widget_to_tree()`, `remove_widget_from_tree()`, `list_widgets_in_tree()`, and `set_widget_property()`. Use these to programmatically build widget hierarchies in the editor.

12. **`SetRootWidget()` does not exist** on UUserWidget. There is no method to change the root widget at runtime. Design the widget hierarchy in the UMG Designer, or use AgentBridge widget tree APIs to build the hierarchy programmatically at design-time.

13. **Button hover delegates use `AddDynamic`, not `AddWeakLambda`.** `UButton::OnHovered` and `OnUnhovered` are simple multicast delegates — `AddWeakLambda` is not available. Use `AddDynamic()` with a UFUNCTION. For Slate-level SButton, use `.OnHovered_Lambda()` / `.OnUnhovered_Lambda()`.

14. **Python CAN manipulate WidgetTree via AgentBridge.** The native `WidgetTree` API is C++-only, but AgentBridge exposes full widget tree manipulation to Python:
    - `unreal.AgentBridgeLibrary.add_widget_to_tree(bp_path, parent_name, child_class, child_name)` — supported classes: TextBlock, Button, Image, ProgressBar, Slider, CheckBox, ComboBoxString, EditableTextBox, CanvasPanel, VerticalBox, HorizontalBox, Overlay, ScrollBox, SizeBox, Border, Spacer, ScaleBox, GridPanel, WrapBox, WidgetSwitcher
    - `unreal.AgentBridgeLibrary.remove_widget_from_tree(bp_path, widget_name)`
    - `unreal.AgentBridgeLibrary.list_widgets_in_tree(bp_path)` → JSON array
    - `unreal.AgentBridgeLibrary.set_widget_property(bp_path, widget_name, property_name, value_json)` — supports FText, FString, bool, float, int, enum, FLinearColor, FVector
    - **When creating Widget Blueprints via Python**, pass `None` as the asset_class parameter: `asset_tools.create_asset("MyWidget", "/Game/UI", None, unreal.WidgetBlueprintFactory())`. Passing `unreal.WidgetBlueprint` as the class silently returns `None`.
    - **Or use EnsureAsset**: `unreal.AgentBridgeLibrary.ensure_asset("/Game/UI", "WBP_MyWidget", "WidgetBlueprint", "WidgetBlueprintFactory")` — safe create-or-load, no modal dialogs.

15. **CRITICAL — WidgetTree is NULL after factory creation.** Both `create_asset()` and `ensure_asset()` create the `.uasset` file but do NOT initialize the internal `WidgetTree`. All `add_widget_to_tree`/`list_widgets_in_tree` calls will silently return `False`/`[]`. **You MUST open the widget in the editor first** to initialize the WidgetTree, then manually create a root panel:
    ```python
    # Step 1: Create the asset
    tools = unreal.AssetToolsHelpers.get_asset_tools()
    factory = unreal.WidgetBlueprintFactory()
    factory.set_editor_property("parent_class", unreal.UserWidget)
    wbp = tools.create_asset("WBP_MyWidget", "/Game/UI", None, factory)

    # Step 2: MUST open in editor to initialize WidgetTree
    subsys = unreal.get_editor_subsystem(unreal.AssetEditorSubsystem)
    subsys.open_editor_for_assets([wbp])

    # Step 3: Create root panel (empty parent = create root)
    ab = unreal.AgentBridgeLibrary
    ab.add_widget_to_tree("/Game/UI/WBP_MyWidget", "", "CanvasPanel", "RootCanvas")

    # Step 4: Now add children — this will work
    ab.add_widget_to_tree("/Game/UI/WBP_MyWidget", "RootCanvas", "TextBlock", "MyText")
    ```
    Without Step 2, the WidgetTree pointer is `nullptr` and ALL widget operations fail silently. This is the #1 cause of "widgets not appearing" when creating WBPs programmatically.

16. **Reparenting does NOT break the WidgetTree** — but do it BEFORE opening/adding widgets. Use `unreal.BlueprintEditorLibrary.reparent_blueprint(bp, parent_class)` after creation but before opening in editor.

17. **Never create UI visuals in C++ — exception: new custom components.** Do NOT use `RebuildWidget()` with Slate (`SNew(SOverlay)`, `SNew(STextBlock)`, etc.) to build UI layouts like menus, HUDs, or screens. C++ should only contain data bindings (`UPROPERTY(meta=(BindWidget))`), delegates, and data update logic. All visual widget creation (layouts, text, buttons, styling) must happen in Blueprint Widget Designer (UMG) or via AgentBridge widget tree APIs. **Exception:** Creating a new reusable UWidget Component (a custom building block for the UMG Designer palette) may use C++ Slate construction in `RebuildWidget()`.

18. **Always wrap persistent HUD elements in SafeZone.** Console TVs have overscan, mobile devices have notches and cutouts. Wrap your HUD root in a `SafeZone` widget so critical UI stays visible on all devices. Test with `r.DebugSafeZone.Mode 1` in the editor. Without SafeZone, resource counters, health bars, and buttons may be clipped on console/mobile.

19. **Blueprint-only projects: use AgentBridge for all widget automation.** Many production projects (including Epic's Cropout sample) are pure Blueprint with no C++ source. For these projects, all widget creation and modification must go through AgentBridge Python APIs or manual Blueprint editing. Do NOT suggest creating C++ widget base classes when the project has no Source/ directory. Check for `.uproject` + absence of `Source/` folder to detect Blueprint-only projects.

20. **Level transition overlays: create once in GameInstance, reuse everywhere.** Create a `UI_Transition` widget (full-screen fade/wipe) in `GameInstance.Init` and keep a reference. Trigger it before `OpenLevel` calls. Do NOT create a new transition widget per level load — this causes flicker and GC pressure. The GameInstance persists across level loads, making it the correct owner for transition UI.

21. **WorldSettings GameMode property is `default_game_mode`**, NOT `GameModeOverride`. When setting a level's GameMode via Python: `world_settings.set_editor_property("default_game_mode", gm_class)`.

22. **Screenshot verification of widgets requires `take_screenshot_with_ui()`.** Standard viewport screenshots (`take_viewport_screenshot`, `AutomationLibrary.take_high_res_screenshot`) only capture the 3D scene without UMG overlays. To verify widgets are displaying correctly, use `unreal.AgentBridgeLibrary.take_screenshot_with_ui('/tmp/screenshot.png')`. This captures the full editor window including all UMG widgets. **Requirement:** PIE must run in **Selected Viewport** mode (not New Window) for the screenshot to include game UI.

## Knowledge Files

The following knowledge files provide detailed reference material:

- `knowledge/umg-fundamentals.md` -- Widget hierarchy, lifecycle, binding, animations, layout, and responsive design
- `knowledge/commonui.md` -- CommonUI framework setup, activatable widgets, input routing, multi-platform input config, responsive UI scaling, controller data assets, material-driven button states, Blueprint-only project guidance
- `knowledge/input-and-focus.md` -- Input modes, focus model, gamepad navigation, event routing, and touch handling
- `knowledge/patterns.md` -- Production-ready recipes for HUD, menus, inventory, nameplates, loading screens, and settings
- `knowledge/ui-organization.md` -- Widget layer system, UI extension points, GameFeature widget composition, tag-based visibility, indicator system, settings framework, PocketWorlds, messaging/dialog, UI manager policy, tab navigation, source organization

## Subagent Delegation Template

When delegating a UI task, provide the subagent with:

```
You are a specialized Unreal Engine UI/UMG developer.

TASK: [describe the specific UI task]

CONTEXT:
- Engine version: [UE5.x]
- Framework: [Raw UMG / CommonUI / Both]
- Project type: [C++ / Blueprint-only] -- check for Source/ directory
- Platform targets: [PC / Console / Mobile / Cross-platform]
- Input methods: [Mouse+Keyboard / Gamepad / Touch / All]

REFERENCE these knowledge files before writing code:
- @knowledge/umg-fundamentals.md -- for widget creation, lifecycle, layout
- @knowledge/commonui.md -- if using CommonUI framework
- @knowledge/input-and-focus.md -- for input handling and navigation
- @knowledge/patterns.md -- for established recipes and patterns

RULES (non-negotiable):
1. Use CreateWidget<>(), never NewObject for UUserWidget
2. Use event-driven updates, never tick-based
3. Use virtualized lists for any list > 20 items
4. Configure focus navigation explicitly for gamepad support
5. Set correct visibility states (Collapsed/Hidden/HitTestInvisible)
6. Test-ready for multiple resolutions (anchor properly)
7. Follow the CRITICAL rules in SKILL.md
8. For Blueprint-only projects: use AgentBridge Python APIs, never suggest C++ classes
9. Wrap persistent HUD elements in SafeZone for console/mobile safety
10. NEVER use ->SetText()/->SetPercent() for data that changes during widget lifetime. Use MVVM FieldNotify ViewModel instead. Only acceptable in ListView NativeOnListItemObjectSet(), one-shot static dialogs, or quick prototyping.

OUTPUT:
- C++ header and source files (if C++ project)
- AgentBridge Python scripts (if Blueprint-only project)
- Blueprint instructions (if BP path)
- Widget hierarchy description for the UMG designer
- Input configuration notes
```

## When to Delegate

TRIGGER this skill when the user asks to:

- Create or modify UMG widgets (UserWidget, WidgetComponent)
- Build HUD systems, health bars, ammo counters, minimaps
- Implement menu systems (main menu, pause menu, settings)
- Set up CommonUI in a project
- Configure input routing between UI and game
- Handle focus and gamepad navigation
- Create widget animations (UWidgetAnimation, material-based)
- Build inventory, shop, or list-based UI with data binding
- Implement floating world-space widgets (nameplates, damage numbers)
- Architect a UI framework or widget hierarchy for a project
- Implement loading screens or transition screens
- Create dialog/popup/confirmation systems
- Set up SafeZone for console/mobile HUD
- Create material-driven button states (master material + instances for hover/pressed)

## When NOT to Delegate

DO NOT trigger this skill for:

- **Image/texture generation** -- when UI needs icons, backgrounds, or placeholder art that don't exist in the project, use `generate-image` skill to create them first, then import and reference in widgets
- **Material/shader work** -- even if used in UI (e.g., material-based health bar shader), delegate to `ue:material` for the material itself; this skill handles the widget integration only
- **Blueprint logic unrelated to UI** -- gameplay mechanics, AI, movement belong in `ue:blueprint`
- **C++ UI classes** -- UUserWidget subclasses with BindWidget, MVVM ViewModels, CommonUI C++ base classes, indicator systems, UI subsystems belong in `ue:ui-cpp`
- **C++ non-UI code** -- actor components, subsystems, gameplay abilities belong in `ue:coder`
- **Slate-only editor extensions** -- low-level Slate for editor tooling is out of scope; this skill covers UMG (which wraps Slate) for runtime game UI
- **Networking/replication** -- even if it feeds UI data; handle replication separately and call UI updates via delegates
- **Audio** -- UI sound effects should be triggered from UI code but designed in the audio system
