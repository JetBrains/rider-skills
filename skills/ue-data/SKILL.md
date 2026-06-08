---
name: ue:data
description: "Use when user asks to create DataTables, import CSV/JSON data, set up DataAssets, configure CurveTables, build data-driven gameplay systems, manage Primary Asset Types, or work with the Asset Manager. DO NOT TRIGGER for Blueprint creation (use ue:blueprint), C++ struct definition (use ue:coder), material data (use ue:material), or editor automation unrelated to data (use ue:editor)."
allowed-tools: Bash, Read, Write
argument-hint: "[data task description]"
---

See [Reference Image Handling](../_shared/reference-image-handling.md)

## Context7 Version Check

If the query mentions a specific UE version, or involves features known to change across versions, fetch the relevant Context7 section before answering. See `../_shared/context7-protocol.md`.

# UE Data — DataTables, DataAssets & Data-Driven Content

Manage data-driven content in Unreal Engine: create DataTables, import/export CSV/JSON/Excel, set up DataAssets and CurveTables, configure the Asset Manager.

## Checklist

Call `TaskCreate` for each item below before starting, then mark each `in_progress` / `completed` as you go:

1. **Clarify** — data type (DataTable/DataAsset/CurveTable), source format (CSV/JSON/manual), access patterns
2. **Create structure** — C++ row struct (`FTableRowBase`) if DataTable; `UDataAsset` subclass if DataAsset
3. **Import/create data** — import CSV/JSON or create assets via editor/AgentBridge
4. **Save** — save DataTable/DataAsset/CurveTable to disk; confirm no broken redirectors
5. **Verify** — validate data loads at runtime; test access via `GetRowMap` or `FindRow`
6. **Code review** — dispatch `ue:code-review` subagent (see `../_shared/post-task.md`); fix all Critical and Important issues before proceeding

## IMPORTANT — How to Execute Scripts

All editor communication goes through **/ue:console**. See the ue:console skill for the full transport API (flags, response format, shell quoting rules, error recovery).

---

## Static Scripts

All scripts accept parameters via `globals()`. Use `--file` for defaults or `--script` with variable overrides:

```bash
# Default usage:
/ue:console --file ${CLAUDE_SKILL_DIR}/scripts/export-datatable.py

# Parameterized:
/ue:console --script '__asset_path__="/Game/Data/DT_Items"; __format__="csv"; __output_path__="/tmp/items.csv"; exec(open("${CLAUDE_SKILL_DIR}/scripts/export-datatable.py").read())'
```

| Script | Purpose | Params |
|--------|---------|--------|
| `export-datatable.py` | Export DataTable to CSV/JSON file | `__asset_path__`, `__format__` (csv/json), `__output_path__` |
| `import-datatable.py` | Import CSV/JSON into DataTable | `__asset_path__`, `__format__` (csv/json), `__input_path__`, `__mode__` (rewrite/update/apply) |
| `create-datatable.py` | Create DataTable from struct | `__name__`, `__path__`, `__struct_path__` |
| `create-dataasset.py` | Create DataAsset instance | `__name__`, `__path__`, `__class_path__` |
| `list-data-assets.py` | List DataTables/DataAssets/CurveTables | `__search_dir__`, `__asset_type__` |
| `inspect-datatable.py` | Show DataTable schema, row count, sample rows | `__asset_path__`, `__sample_rows__` |
| `create-curvetable.py` | Create CurveTable from CSV/JSON | `__name__`, `__path__`, `__input_path__`, `__format__`, `__interp__` |
| `batch-export.py` | Export multiple DataTables at once | `__table_paths__` (comma-separated), `__output_dir__`, `__format__` |
| `batch-import.py` | Import multiple files into DataTables | `__mapping__` (JSON: {asset_path: file_path}), `__format__`, `__mode__` |
| `excel-convert.py` | Convert between XLSX and CSV/JSON | CLI: `python excel-convert.py input output [sheet]` |

### Import Modes

| Mode | Behavior |
|------|----------|
| `rewrite` | Clear ALL existing rows, then fill from file (default) |
| `update` | Merge: update existing rows by RowName, add new rows, keep rows not in file |
| `apply` | Overwrite matching rows only, ignore new rows, keep unmatched rows |

---

## CRITICAL — Common Mistakes

### 1. Use EnsureAsset Instead of create_asset
- `create_asset()` on an existing path opens a **modal override dialog** that freezes the editor
- **Preferred**: Use `unreal.AgentBridgeLibrary.ensure_asset('/Game/Data', 'DT_Items', 'DataTable', 'DataTableFactory')` — safely returns existing asset or creates new one, no modal dialog
- **Alternative**: Check `EditorAssetLibrary.does_asset_exist()` first, then `load_asset()` or `create_asset()`
- **Suppress all dialogs**: `unreal.AgentBridgeLibrary.set_suppress_modal_dialogs(True)` (restore with `False` when done)

### 2. ALWAYS Save After Modification
- Call `EditorAssetLibrary.save_asset('/Game/...')` after any DataTable/DataAsset change
- Unsaved assets are lost on editor restart

### 3. CSV Encoding Must Be UTF-8
- Windows Excel saves as Windows-1252 by default — force UTF-8
- First column MUST be `RowName` (or configured `import_key_field`)
- Commas in values MUST be quoted: `"Hello, World"`
- Arrays NOT supported in CSV — use JSON instead

### 4. Row Struct Changes + Hot-Reload = Data Loss
- NEVER rely on hot-reload for struct changes — always restart editor
- Keep JSON backup before changing row structs
- Use `ignore_missing_fields` / `ignore_extra_fields` when schema evolves

### 5. Validate Return Values
- `create_asset()` and `load_asset()` can return `None`
- Always check: `if dt is None: print("ERROR: ..."); return`

### 6. Use ForceDeleteAsset Instead of delete_asset()
- `EditorAssetLibrary.delete_asset()` opens a modal dialog that freezes AgentBridge
- **Use**: `unreal.AgentBridgeLibrary.force_delete_asset('/Game/Data/DT_Old')` — no modal, handles reference cleanup
- **Batch**: `unreal.AgentBridgeLibrary.force_delete_assets(['/Game/A', '/Game/B'])` — returns count of deleted assets
- Also available via REST: `POST /agent/asset/delete` with `{"path": "..."}` or `{"paths": [...]}`

---

## Blueprint-Only Projects

Many projects (including Epic's Cropout) have no C++ source. For these projects:
- Use `UserDefinedStruct` (ST_ or S_ prefix) instead of C++ `USTRUCT`
- Use `UserDefinedEnum` (E_ prefix) instead of C++ `UENUM`
- All data asset creation/manipulation goes through Python (AgentBridge)
- Co-locate data assets with their systems (not centralized Data/ folder) if that's the project pattern
- Do NOT suggest creating C++ row structs when no `Source/` directory exists

## When to Delegate to Other Skills

| Task | Use |
|------|-----|
| C++ row struct definition (`USTRUCT`) | **ue:coder** |
| Blueprint UserDefinedStruct (complex, many fields) | **ue:blueprint** |
| Material parameter data | **ue:material** |
| Complex multi-step editor automation | **ue:task** |
| Build after C++ struct changes | **ue:builder** |
| Architecture decisions (DataTable vs DataAsset vs CompositeDataTable) | **ue:architect** |

---

## Quick Reference — Data Type Selection

| Data Pattern | Best Storage | Why |
|-------------|-------------|-----|
| 100s of similar flat entries (items, buffs) | DataTable | Tabular, CSV-importable, O(1) lookup |
| Merge multiple DataTables (base + DLC/platform) | CompositeDataTable | Combines tables without duplication |
| Complex objects with UObject refs | UDataAsset | Supports hard refs, inheritance |
| Asset Manager discovery + async loading | UPrimaryDataAsset | Auto PrimaryAssetId, bundle loading |
| Continuous scaling curves (XP, damage) | CurveTable | Built-in interpolation, multi-row |
| Single animation/tuning curve | CurveFloat / CurveVector / CurveLinearColor | Per-asset curve, timeline-keyable |
| Multi-source overridable data (mods/DLC) | Data Registry | Priority merge from multiple sources |
| Persistent player/world state | SaveGame + custom structs | Serialization-safe, slot-based |
| Environment config (server URLs) | .ini Config | Not game content, per-environment |

---

## Naming Conventions

| Asset Type | Prefix | Example |
|-----------|--------|---------|
| DataTable | `DT_` | `DT_Items`, `DT_Dialogue` |
| CompositeDataTable | `DT_` or descriptive | `NewCompositeDataTable`, `DT_AllInput` |
| CurveTable | `CT_` | `CT_DamageScaling`, `CT_XPCurve` |
| CurveFloat / CurveVector | `C_` | `C_WobbleCurve`, `C_FadeIn` |
| CurveLinearColorAtlas | descriptive | `NewCurveLinearColorAtlas` |
| DataAsset | `DA_` | `DA_BossConfig`, `DA_WeaponSword` |
| Row Struct (C++) | `F...Row` | `FItemDataRow`, `FDialogueRow` |
| Row Struct (BP) | `S_` or `ST_` | `S_ItemRow`, `ST_Job`, `ST_Resource` |
| UserDefinedEnum | `E_` | `E_ItemRarity`, `E_ResourceType` |
| SaveGame struct (BP) | `ST_Save...` | `ST_SaveInteract`, `ST_Villager` |

---

## Folder Structure Conventions

Two valid patterns exist — match whichever the project already uses:

### Pattern A: Centralized Data Folder
All data assets in a dedicated `Data/` directory. Best for large C++ projects with shared data.
```
Content/
  Data/
    DataTables/        DT_*.uasset
    CurveTables/       CT_*.uasset
    DataAssets/
      Characters/      DA_Hero_*.uasset
      Weapons/         DA_Weapon_*.uasset
    Structs/           S_*.uasset (BP structs only)
    Enums/             E_*.uasset
  RawData/             CSV/JSON source files (excluded from cook)
```

### Pattern B: Co-Located with Systems (Cropout Pattern)
Data lives next to the Blueprint systems that use it. Best for Blueprint-only projects and smaller teams.
```
Content/
  Blueprint/
    Villagers/
      DT_Jobs.uasset          # Job definitions
      ST_Job.uasset           # Row struct for DT_Jobs
      AI/                     # Behavior trees that read DT_Jobs
    Interactable/
      Extras/
        DT_Buidables.uasset   # Building definitions
        ST_Resource.uasset    # Row struct for buildings
        E_ResourceType.uasset # Resource type enum
    Core/
      Save/
        BP_SaveGM.uasset      # Save game manager
        ST_SaveInteract.uasset # Save data struct
        ST_Villager.uasset     # Villager save struct
      Player/Input/
        CUI_InputTable.uasset  # Input data table
        E_InputType.uasset     # Input type enum
        NewCompositeDataTable.uasset  # Merged input tables
```

**Rule:** Check the project's existing organization BEFORE creating data assets. Match the pattern already in use.

---

see: knowledge/data-reference.md — Full Python API reference for DataTable, DataAsset, CurveTable, CompositeDataTable, standalone curves, Asset Manager, PythonDataTableLib, PythonStructLib
see: knowledge/data-recipes.md — Copy-paste Python recipes: create DataTable, import/export CSV/JSON, create DataAsset, CurveTable, CompositeDataTable, Blueprint Enum, standalone curves, round-trip workflow, batch operations
see: knowledge/data-pitfalls.md — Common pitfalls: hot-reload corruption, CSV encoding, circular references, binary diffing, RowName collisions, struct changes, Blueprint-only struct gotchas
see: knowledge/data-driven-gameplay.md — GameplayTags via DataTable, soft references, Data Registries, FDataTableRowHandle, FScalableFloat, async loading patterns, save system patterns
