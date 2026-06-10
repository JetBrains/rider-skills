# UE Docs — Python Scripting Guide

Extracted from UE 5.6 official documentation.

## Python Environment

- **Version**: Python 3.11.8 embedded (VFX Reference Platform aligned)
- **Scope**: Editor-only — unavailable in Play-in-Editor, Standalone Game, or packaged builds
- **Module**: `import unreal` for all scripting APIs
- **Isolated mode**: `Edit > Project Settings > Plugins > Python > Isolate Interpreter Environment`

### Auto-Added Python Paths

- Project's `Content/Python` folder
- Engine's `Content/Python` folder
- Each enabled Plugin's `Content/Python` folder
- `Documents/UnrealEngine/Python` in user directory

### Setup

Enable **Python Editor Script Plugin**: `Edit > Plugins > Scripting > Python Editor Script Plugin`.
Optionally enable **Editor Scripting Utilities** for simplified APIs.

---

## Execution Methods

| Method | Use Case | Details |
| --- | --- | --- |
| Python Console | Interactive line-by-line | Output Log or `~` key; `Shift+Enter` for multi-line |
| `py` command | Console-mode inline | `py "path/script.py"` |
| File Menu | Browse and execute | Includes recent scripts list |
| CLI (Full Editor) | Automated workflows | `-ExecutePythonScript="path"` after project loads |
| CLI (Commandlet) | Fast headless execution | `-run=pythonscript -script="path or code"` |
| `init_unreal.py` | Auto-startup script | Auto-runs if found in configured paths |
| Startup Scripts | Per-project init | `Edit > Project Settings > Python > Startup scripts` |
| Editor Blueprints | Visual scripting | Editor Utility Widgets/Blueprints only |

---

## Blueprint Python Nodes

Three nodes in `Python > Execution`:

1. **Execute Python Script** — Literal code with custom input/output pins (recommended)
2. **Execute Python Command** — Code or filename, simple success/fail output
3. **Execute Python Command (Advanced)** — Execution modes, file scope, detailed logging

---

## Naming Conventions

- Classes: Same as Blueprints (no `U`/`T` prefixes) → `unreal.StaticMeshActor`
- Functions/properties: `snake_case` → `get_actor_transform()`
- Enumerations: `UPPER_SNAKE_CASE`
- Parameters: positional or named in any order

```python
# Both equivalent:
subsys.join_static_mesh_actors(actors, options)
subsys.join_static_mesh_actors(join_options=options, actors_to_join=actors)
```

---

## Property Access Patterns

### Blueprint-Exposed Properties

`BlueprintReadOnly`/`BlueprintReadWrite` → direct property access on the object.

### Editor Properties (ViewAnywhere / EditAnywhere)

```python
obj.set_editor_property("property_name", value)  # triggers pre/post-edit callbacks
obj.get_editor_property("property_name")
```

**Key distinction**: `set_editor_property()` triggers Editor callbacks matching UI behavior. Direct assignment bypasses them.

---

## Transactions (Undo/Redo)

Wrap operations in `ScopedEditorTransaction`:

```python
with unreal.ScopedEditorTransaction("My Operation") as trans:
    obj.set_editor_property("property", value)
```

---

## Progress Feedback

For long operations, use `ScopedSlowTask`:

```python
with unreal.ScopedSlowTask(total_frames, "Working!") as slow_task:
    slow_task.make_dialog(True)
    for i in range(total_frames):
        if slow_task.should_cancel():
            break
        slow_task.enter_progress_frame(1)
```

---

## Logging

```python
unreal.log("info message")        # or print()
unreal.log_warning("alert")
unreal.log_error("severe issue")
```

---

## Asset Management Rules

- **NEVER** use `os.rename()` or `shutil.move()` on UE assets
- Always use `unreal.EditorAssetLibrary` or `unreal.AssetTools`
- Unreal assets contain internal references that break with filesystem operations

---

## Subsystem Access Pattern

```python
import unreal
subsys = unreal.get_editor_subsystem(unreal.LevelEditorSubsystem)
subsys.load_level("/Game/Maps/LevelName")
```

Common editor subsystems:
- `UnrealEditorSubsystem` — get editor world
- `EditorActorSubsystem` — query/spawn actors, get by tag
- `EditorAssetSubsystem` — asset loading, path queries
- `LevelEditorSubsystem` — load levels, level management
- `StaticMeshEditorSubsystem` — mesh operations (LODs, joins)

---

## Type Conversions

- Python `list`/`set`/`dict` auto-convert to Unreal `Array`/`Set`/`Map`
- Retrieved collections maintain Python-compatible APIs
- Use `isinstance()` and `type()` for inheritance checking

---

## Common Workflows

### Asset Pipeline Automation
- Generate LODs for Static Meshes
- Procedurally layout Level content
- Cross-application pipeline integration

### Editor UI Control
- Custom Python-based UIs via PySide integration
- Automate multi-step tasks
- Build asset management systems
