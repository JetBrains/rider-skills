# rider-ue-developing:python — Editor Python Execution

Single tool: `ue_execute_python`. Runs Python on the editor game thread. Requires `ue_health.connected = true`.

Reference: https://dev.epicgames.com/documentation/en-us/unreal-engine/python-api/

## Tool reference

| Tool | Purpose | When to use |
|------|---------|-------------|
| `ue_execute_python` | Run Python on the editor game thread | Primary tool: asset creation, CDO edits, graph manipulation, runtime state queries |
| `ue_status` | Confirm editor connected | Always check before executing Python; `connected = false` = immediate failure |
| `ue_health` | Lightweight connection ping | Use instead of `ue_status` when you only need the connection check with no logs |
| `read_file` | Read a file written by a Python script | Python output is capped at 10k chars; write large dumps to `Saved/*.txt` then read with this tool |

`ue_execute_python { script?, scripts?, isolated?, startFrom? }`

Pass **exactly one** of `script` (single source) or `scripts` (list). Always returns batch-shape `{ results: [...], lastSuccessfulIndex }`.

| Param | Notes |
|-------|-------|
| `script` | Single script string |
| `scripts` | Array for resumable batch — each snippet should be independently re-runnable |
| `isolated` | `true` → evaluate as expression (returns value); ignored for batch |
| `startFrom` | Resume batch from 0-based index (`lastSuccessfulIndex + 1` after failure) |

Output per result capped at 10,000 chars. For larger output, write to `Saved/*.txt` inside the script and `read_file` it.

## Critical rules

- **Runs on the game thread.** Long scripts block editor UI. Keep snippets short.
- **`script` is compiled with `compile(..., 'single')` — only one statement.** Multi-line scripts raise `SyntaxError`. Two workarounds:
  - **Semicolon-join**: `import unreal; asset = unreal.EditorAssetLibrary.load_asset('/Game/X')`
  - **`exec(open(...))`**: write body to `/tmp/foo.py`, then `script="exec(open('/tmp/foo.py').read())"` — the exec call is one statement.
- **`\n` in `--script` via `mcp__rider__execute_tool` is a literal backslash-n, not a newline.** The CLI string parser does not unescape escape sequences, so multi-line Python with `\n` raises `SyntaxError: unexpected character after line continuation character`. Always flatten to one line with `;` separators when calling via `mcp__rider__execute_tool --command "ue_execute_python --script ..."`.
- **Batch is sequential, not parallel.**
- **A C++ access violation cannot be caught by Python `try/except`** — it crashes the editor. Prevention happens *before* the call: check every reference value (e.g., `create_asset`/`load_asset` return) to be not `None` before using it.

## UE Python API cheatsheet (5.7-tested)

| Goal | Snippet |
|------|---------|
| Load asset by package path | `bp = unreal.EditorAssetLibrary.load_asset('/Game/B_X')` |
| Open asset in editor | `unreal.get_editor_subsystem(unreal.AssetEditorSubsystem).open_editor_for_assets([bp])` |
| Get the generated class | `gen = bp.generated_class()` |
| Read CDO | `cdo = unreal.get_default_object(gen)` |
| Read a UPROPERTY value | `cdo.get_editor_property('default_pawn_class')` |
| Iterate components on CDO | `cdo.get_components_by_class(unreal.ActorComponent)` |
| C++ inheritance chain | `t = type(cdo); while t and t.__name__ != 'object': chain.append(t.__name__); t = t.__bases__[0]` |
| AssetRegistry data | `ar = unreal.AssetRegistryHelpers.get_asset_registry(); ad = ar.get_asset_by_object_path(unreal.Name(bp.get_path_name()))` |
| Asset-registry tags | `ad.get_tag_value('ParentClass')`, `ad.get_tag_value('NativeParentClass')`, `ad.get_tag_value('ImplementedInterfaces')` |

## Gotchas

- **`unreal.SystemLibrary.get_class_property_names` / `get_class_function_names` do NOT exist.** Walk `dir(cdo)` and probe with `get_editor_property`, or read AssetRegistry tags.
- **`bp.parent_class` and `bp.simple_construction_script` are not direct attributes** — use `get_editor_property(...)`.
- **`ubergraph_pages` / `function_graphs` not Python-accessible.** For graph introspection, use Rider's index or C++ editor internals.
- **`dir(cdo)` logs `DeprecationWarning`** for renamed Actor properties — cosmetic noise.
- **`Class.get_superclass()` does not exist on `BlueprintGeneratedClass`.** Walk `type(cdo).__bases__` instead.
- **`UUnrealEditorSubsystem()` constructor deprecated since UE 5.2** — use `unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem)`.
- **`unreal.Rotator(a, b, c)` positional order is `(roll, pitch, yaw)` — NOT `(pitch, yaw, roll)`.** Always use keyword args to avoid silent axis swaps: `unreal.Rotator(pitch=0, yaw=-90, roll=0)`. Positional `Rotator(0, -90, 0)` silently produces `{pitch:-90, yaw:0, roll:0}`.
- **CDO property changes don't auto-propagate to existing level instances.** `set_editor_property` on a CDO component updates the default; actors already placed in the level keep their per-instance overrides. To see the CDO change reflected on an existing actor: destroy it (`EditorActorSubsystem.destroy_actor`) and respawn — or update the instance component directly via `actor.get_component_by_class(...)`.
- **`get_actor_bounds` is unreliable for diagnosing rotated `SkeletalMeshComponent`.** The world-space bounding box for a rotated skeletal mesh component can be misleading — it may span unexpected Z ranges that don't match the mesh's imported geometry extents. For mesh rotation/placement diagnostics use `skeletal_mesh_asset.get_imported_bounds()` for asset-space extents, or open the Blueprint editor and inspect the component viewport there.
- **Blueprint editor component viewport is the source of truth for CDO mesh state.** The level editor viewport can show stale cached actor states. When debugging mesh `RelativeLocation` / `RelativeRotation`, always verify in the Blueprint editor's built-in component viewport — it reflects the actual CDO property values in real time.
- **`EditorLevelLibrary.get_all_level_actors()` / `destroy_actor()` are deprecated.** Use `EditorActorSubsystem` instead: `eas = unreal.get_editor_subsystem(unreal.EditorActorSubsystem); eas.get_all_level_actors(); eas.destroy_actor(actor)`.
