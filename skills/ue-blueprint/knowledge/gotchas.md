# Blueprint Gotchas — Mistakes That Waste Hours

These rules were learned through painful debugging. Violating them causes silent failures, editor crashes, or corrupted assets.

## 1. ALWAYS Compile After Graph Changes
- `unreal.KismetSystemLibrary.execute_console_command(None, "")` does NOT compile BPs
- Use `unreal.BlueprintEditorLibrary.compile_blueprint(bp)` after every graph modification batch
- Uncompiled changes are INVISIBLE to the runtime — actors will use stale bytecode

## 2. Pin Names Are Internal Names, NOT Display Names
- The pin you see as "Exec" in the editor is internally `execute` or `then`
- "Return Value" is internally `ReturnValue` (no space)
- Boolean output pins are often `ReturnValue` not `Result` or `bResult`
- **Always discover pin names first**: use the `discover-pins.py` script
- Wiring a wrong pin name silently fails — no error, no connection

## 3. Node Position Matters for Readability
- Nodes placed at (0,0) pile up and become unreadable
- Use a grid: X increments of 300, Y increments of 200
- Event nodes at X=0, logic at X=300-600, output at X=900+

## 4. Don't Create Duplicate Event Nodes
- A Blueprint can only have ONE `Event BeginPlay`, ONE `Event Tick`, etc.
- Creating a second one causes a compile error
- **Check first**: search existing nodes before adding events

## 5. EdGraph vs EventGraph vs FunctionGraph
- `EventGraph` is the main graph — events and gameplay logic go here
- `ConstructionScript` runs in-editor on property changes — NO gameplay logic here
- Function graphs are separate — create with `add_function_graph()`
- **WRONG**: Adding Event BeginPlay to a Function graph (won't fire)

## 6. Variable Creation Order Matters
- Create variables BEFORE creating nodes that reference them
- Variable types use internal names: `bool`, `int`, `float`, `Vector`, `Rotator`, `Name`, `String`
- Object references: `/Script/Engine.Actor`, `/Script/Engine.StaticMeshComponent`

## 7. Asset Path Validation
- Blueprint asset paths MUST start with `/Game/`
- Path must NOT include file extension (no `.uasset`)
- Parent directory must exist — use `EditorAssetLibrary.make_directory()` first
- **WRONG**: `/Content/Blueprints/BP_MyActor` — **CORRECT**: `/Game/Blueprints/BP_MyActor`

## 8. Parent Class Must Be Loaded
- If parent class is C++, it must be compiled and loaded (build first via ue-builder)
- If parent is another Blueprint, load it first: `unreal.load_asset('/Game/Path/BP_Parent')`

## 9. Save After Creation AND After Compile
- `unreal.EditorAssetLibrary.save_asset(asset_path)` — call after creating AND after compiling
- Unsaved BPs can be lost on editor crash

## 9a. Blueprint `status` Property is Protected
- `bp.get_editor_property("status")` raises error — property is protected
- **Don't check compile status** — just compile and save
- **WRONG**: `status = bp.get_editor_property('status')`
- **RIGHT**: just call `compile_blueprint(bp)` and `save_asset(path)`

## 9b. Accessing Blueprint Generated Class
- `bp.get_editor_property("generated_class")` does NOT work
- Use `_C` suffix: `unreal.load_object(None, "/Game/Path/BP_Name.BP_Name_C")`

## 10. Safe Blueprint Deletion — Clearing GCObjectReferencer Holds
- **GCObjectReferencer** blocks deletion when: BP editor is open, generated class was loaded, level instances exist, or PIE is running
- Use `safe-delete-bp.py` script which handles all 8 steps with fallbacks
- Key technique: `EditorLoadingAndSavingUtils.unload_packages([pkg])` releases holds that GC alone cannot clear

## 11. NEVER rename_asset + create_asset at the Same Path
- `rename_asset()` leaves an ObjectRedirector at the old path
- Creating a new asset at the same path causes a fatal crash
- **Instead**: modify the existing BP in-place, or create at a NEW path

## 12. SCS Component Templates — Use load_object, NOT CDO
- After `add_new_subobject()`, the component appears in SCS but NOT on the CDO
- CDO modification does NOT persist for SCS components across editor restarts
- Get the template via `export_text()` → parse path → `load_object(None, template_path)`

## 13. Always Health-Check After Risky Operations
- After rename_asset, delete_asset, add_new_subobject, or bulk SCS changes
- If health check fails, editor likely crashed — rebuild + restart

## 14. WidgetTree Initialization Required
- Both `create_asset()` and `ensure_asset()` create WBPs with `WidgetTree` as `nullptr`
- All `add_widget_to_tree`/`list_widgets_in_tree` calls silently return `False`/`[]` until you **open the WBP in the editor**:
  ```python
  subsys = unreal.get_editor_subsystem(unreal.AssetEditorSubsystem)
  subsys.open_editor_for_assets([wbp])
  ```
- Without this, every add/list returns False/[] with no error message
