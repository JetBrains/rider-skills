# UE Docs — Scriptable Tools System

Extracted from UE 5.6 official documentation.

## Overview

Create custom interactive tools without C++ via the Interactive Tools Framework exposed to Blueprint/Python. Tools appear in a dedicated editor mode, similar to Modeling Mode.

### Setup

Enable plugin: `Edit > Plugins > Scriptable Tools Editor Mode`

Access: Selection Mode dropdown in Level Editor → Scriptable Tools mode.

---

## Base Classes

| Class | Use |
| --- | --- |
| `UScriptableInteractiveTool` | Foundation for all scriptable tools |
| `UEditorScriptableInteractiveTool` | Editor variant with editor-only Blueprint nodes |
| `UScriptableModularBehaviorTool` | Mouse/keyboard interaction support |
| `UEditorScriptableModularBehaviorTool` | Editor + modular behavior |

---

## Capabilities

- Blueprint graph execution during setup, shutdown, tick
- 3D geometry rendering (lines, points, triangles)
- 2D HUD elements
- Property Sets as user-visible tool settings
- Property change monitoring with callbacks
- 3D Transform Gizmos (position, rotation, scale)
- User messaging and feedback
- Mouse click, hover, drag, mousewheel input
- Keyboard detection
- Blueprint Slate Widgets (UMG) for custom viewport UI
- Custom startup conditions based on scene selection

---

## Creating Tools

1. Create Blueprint subclass of a base tool class
2. Configure metadata: name, category, tooltip, icon path
3. Implement events:
   - `On Script Setup` — initialization
   - `On Script Tick` — per-frame update
   - `On Script Shutdown` — cleanup
   - `On Script Draw HUD` — 2D overlay rendering

---

## Property Sets

Structured tool settings visible in editor panel.

1. Create subclass of `ScriptableInteractiveToolPropertySet`
2. Add public member variables
3. In tool: `Add Property Set of Type` to instantiate
4. Variables auto-appear in settings panel

### Property Watchers

Monitor specific property changes → trigger callback events.
Supported types: Int, Float, Bool, String, FName, Enum, Object, plus general-purpose watcher.

---

## Gizmos

- `CreateTRSGizmo(id)` — spawn transform gizmo
- `DestroyTRSGizmo(id)` — remove gizmo
- `GetGizmoTransform(id)` / `SetGizmoTransform(id, transform)`
- `SetGizmoVisible(id, visible)`
- Event fires on gizmo transform change

---

## Input Behaviors (Modular Tool)

- Click and drag
- Hover detection
- Mousewheel input
- Multi-click patterns
- Single/multi keyboard inputs
- Each behavior accepts callback lists for multiple conditions

---

## Modal vs Non-Modal

Scriptable tools are **modal** — no other tool active simultaneously. Editor state is strictly managed. Safe for temporary actor creation/destruction. Auto-shutdown before level changes or PIE.

Editor Utility Widgets are **non-modal** — other tools remain usable.

---

## Rendering

**Persistent Rendering API**: Sets for lines, points, triangles managed throughout tool lifecycle.

**Legacy Event Rendering** (deprecated): `Event On Script Render` per-frame without persistent refs.

---

## Shutdown

- Accept/Cancel or Complete buttons (configurable via `Shutdown Type`)
- `RequestToolShutdown()` for programmatic shutdown with optional message
