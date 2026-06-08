# UE Docs — Editor Utilities & Blueprint Scripting

Extracted from UE 5.6 official documentation.

## Overview

Four primary methods for Blueprint-based editor automation:

1. **Editor Utility Widgets** — UMG widgets as dockable editor panels
2. **Editor Utility Blueprints** — Scripted Actions via right-click context menus
3. **Call in Editor** — Functions callable from Details panel
4. **Startup Objects** — Auto-instantiated on project load

---

## Editor Utility Widgets

UMG-based custom editor tabs.

### Creation

1. Content Browser → right-click → `Editor Utilities > Editor Utility Widget`
2. Double-click to open Widget Blueprint editor
3. Design using standard UMG tools
4. Right-click asset → `Run Editor Utility Widget` to open as editor tab

### Key Facts

- Docks exclusively with Level Editor tabs
- Available in `Tools > Editor Utility Widgets` after first run
- Beta feature — use with caution in production
- **Non-modal** — other tools remain usable while widget is open

### Programmatic Spawning

```python
import unreal
subsys = unreal.get_editor_subsystem(unreal.EditorUtilitySubsystem)
# SpawnAndRegisterTab() to open widget programmatically
```

---

## Scripted Actions

Editor Utility Blueprints invoked via right-click context menus.

### Creation

1. Content Browser → right-click → `Editor Utilities > Editor Utility Blueprint`
2. Choose parent class:
   - `AssetActionUtility` — for Content Browser assets
   - `ActorActionUtility` — for Level actors
3. Create functions (auto-enabled "Call In Editor") or Custom Events (manually enable)

### Key Nodes

- `Get Selected Assets` — returns selected Content Browser items
- `Get Selection Set` — returns selected Level actors

### Restricting to Specific Classes

- Open Class Defaults → click (+) on `Supported Classes` → select target class
- Example: restrict to `StaticMeshActor` only

### Dynamic Inputs

Function parameters become user prompts when invoking. Scripts should validate inputs themselves.

### Result

Each function/Custom Event becomes a separate option under **Scripted Actions** submenu in context menus.

---

## Call in Editor

Mark functions/events as callable from the Details panel.

- Works for both runtime and editor functionality
- Available in standard Actor-derived classes (limited set) and EditorUtilityActor classes (full set)

---

## Startup Objects

Auto-instantiated Editor Utility classes that run pre-defined functions on project load.

Managed by the **Editor Utility Subsystem**.

---

## Blueprint Node Access

- Editor-only nodes appear only in editor-specific classes:
  - Editor Utility Blueprint
  - Editor Utility Widget
  - Classes deriving from editor-only parents
- Standard Actor classes: limited "Editor Scripting" category
- EditorUtilityActor classes: comprehensive editor manipulation

### Key Subsystem

**Editor Utility Subsystem** — manages editor scripting features, Startup Object lifecycle, `SpawnAndRegisterTab()`.

---

## Python Integration with Blueprints

Three Blueprint nodes for Python execution (in `Python > Execution`):

1. **Execute Python Script** — literal code with custom input/output pins (recommended)
2. **Execute Python Command** — code or filename, simple success/fail
3. **Execute Python Command (Advanced)** — execution modes, file scope, logging
