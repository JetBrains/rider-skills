# UE Data Pitfalls & Gotchas

## 1. Hot-Reload + Struct Changes = Data Loss

**Problem:** Adding/removing/renaming UPROPERTY fields in a C++ row struct with hot-reload active can corrupt DataTable assets.

**What happens:**
- New properties may not appear in editor after hot-reload
- After editor restart, DataTable may reference `REINST_` (hot-reload ghost) struct
- ALL table data can be silently lost

**Mitigation:**
- NEVER rely on hot-reload for struct changes — always restart the editor
- Export DataTable to JSON BEFORE changing any row struct
- Add new fields with default values to avoid breaking existing rows
- Use `ignore_missing_fields = true` when importing after removing columns
- Use `ignore_extra_fields = true` when importing CSVs with extra columns

## 2. CSV Encoding Issues

| Issue | Symptom | Fix |
|-------|---------|-----|
| Wrong encoding | Garbled text, missing characters | Save as UTF-8 (not Windows-1252) |
| BOM bytes | First column name not matching | Use UTF-8 without BOM, or handle BOM |
| CRLF vs LF | Phantom empty rows on some platforms | Normalize line endings |
| Unquoted commas | Row splits incorrectly | Quote all string fields |
| Trailing newline | Phantom empty row at end | Strip trailing whitespace |
| Excel auto-format | Numbers→dates, leading zeros stripped | Format cells as Text before editing |
| Column name mismatch | Import silently ignores column | Headers MUST match UPROPERTY names (case-sensitive) |

## 3. Circular References

**Problem:** DataAssets referencing each other create circular dependencies:
- Infinite load loops
- Package cook failures
- Memory leaks

**Fix:**
- Use `TSoftObjectPtr` / `TSoftClassPtr` instead of hard references
- Use `FDataTableRowHandle` to reference rows indirectly
- Break cycles with FName or FPrimaryAssetId identifiers

## 4. Binary UAsset Diffing

**Problem:** DataTables/DataAssets are binary `.uasset` files — cannot diff in version control.

**Mitigation:**
- Export JSON sidecars alongside binary .uasset for diffable history
- Automate CSV export in CI to detect unintended data changes
- Use exclusive checkout (Perforce) or file locking (Git LFS)
- Keep a `RawData/` folder outside `Content/` for authoritative CSV/JSON sources

## 5. RowName Collisions

**Problem:** Duplicate row names in CSV/JSON silently overwrite earlier rows during import.

**Fix:**
- Validate RowName uniqueness before import
- After import, compare `len(get_row_names())` with expected count
- Use a pre-import validation script

## 6. FindRow Returning nullptr

**Problem:** `FindRow<T>()` returns nullptr if row was removed/renamed, or wrong struct type used.

**Fix:**
- ALWAYS null-check: `if (Row) { ... }`
- Blueprint: use `Does Data Table Row Exist` before `Get Data Table Row`
- Check that template parameter matches the DataTable's actual row struct

## 7. DataTable Stripped from Packaged Build

**Problem:** If a DataTable is not directly or indirectly referenced, the cooker strips it from builds.

**Fix:**
- Reference from a Blueprint or C++ class that IS referenced
- Add to `PrimaryAssetTypesToScan` in DefaultGame.ini with `CookRule=AlwaysCook`
- Add to `+DirectoriesToAlwaysCook` in DefaultGame.ini

## 8. Blueprint Struct Changes Breaking Tables

**Problem:** Changing a Blueprint UserDefinedStruct used by a DataTable can corrupt ALL rows.

**Fix:**
- Prefer C++ structs for DataTables — they have stable serialization
- If using BP structs: export to JSON BEFORE any struct modification
- After modifying BP struct: reimport from JSON to recover data

## 9. Array/Map Types in CSV

**Problem:** Arrays and Maps are NOT well-supported in CSV format.

**Fix:**
- Use JSON format for any struct with TArray, TMap, or TSet members
- CSV truncates arrays to first element or fails silently
- JSON preserves full array/map structure with round-trip fidelity

## 10. Import Key Field Confusion

**Problem:** `import_key_field` defaults to "Name" for JSON but first column for CSV.

**Fix:**
- CSV: first column MUST be `RowName`
- JSON: top-level `"Name"` field is the row key
- Override via `dt.set_editor_property('import_key_field', 'MyKeyField')`

## 11. Spaces in Field Names

**Problem:** Field names with spaces work in editor but cause parsing errors after packaging.

**Fix:**
- NEVER use spaces in UPROPERTY names
- Use CamelCase or snake_case for all struct member names
- DisplayName metadata is OK: `UPROPERTY(meta = (DisplayName = "Base Damage"))`

## 12. Soft Reference Path Format

**Problem:** Soft references in CSV must use the full path format including class suffix.

**Fix:**
- Correct: `"/Game/Icons/T_Sword.T_Sword"` (path + `.AssetName`)
- Wrong: `"/Game/Icons/T_Sword"` (missing asset name suffix)
- For Blueprint classes: `"/Game/BP/BP_Item.BP_Item_C"` (note the `_C` suffix)

## 13. create_asset on Existing Path

**Problem:** `create_asset()` at an existing asset path opens a modal override dialog that freezes the editor when called via AgentBridge.

**Fix:**
- ALWAYS check `EditorAssetLibrary.does_asset_exist()` first
- If exists: `load_asset()` and modify in-place
- If new: `create_asset()` is safe

## 14. delete_asset Modal Dialog

**Problem:** `EditorAssetLibrary.delete_asset()` opens a confirmation dialog that blocks the game thread.

**Fix:**
- NEVER call `delete_asset()` from AgentBridge scripts
- Use `rename_asset()` to move assets instead
- Delete manually via editor Content Browser

## 15. CompositeDataTable Parent Struct Mismatch

**Problem:** Setting `parent_tables` with DataTables using different row structs causes silent failures — rows from mismatched tables are invisible.

**Fix:**
- ALL parent tables in a CompositeDataTable MUST use the same row struct
- Verify struct compatibility before adding: `dt.get_editor_property('row_struct')`
- CompositeDataTable inherits its row struct from the first parent table

## 16. Blueprint Struct (UserDefinedStruct) Field Renaming

**Problem:** Renaming a field in a Blueprint UserDefinedStruct changes its internal GUID. DataTables referencing the struct lose data for that column — the old column is orphaned and the new column gets default values.

**What happens:**
- Field "Damage" renamed to "BaseDamage" → DataTable shows empty BaseDamage column, old Damage data gone
- Cannot undo through editor Undo — data loss is immediate on struct save

**Fix:**
- Export DataTable to JSON BEFORE renaming any struct field
- Rename the field in the struct
- Edit the JSON file to update the field name
- Reimport JSON into the DataTable
- NEVER rename Blueprint struct fields without a backup

## 17. Co-Located Data Assets Not Found by Scripts

**Problem:** Scripts searching in `/Game/Data/` miss DataTables/Structs that are co-located with their systems (e.g., `/Game/Blueprint/Villagers/DT_Jobs`).

**Fix:**
- Always search from `/Game/` with `recursive=True` when listing data assets
- Or check the project's actual organization BEFORE writing search paths
- Use `list_assets('/Game/', recursive=True)` and filter by class, not assumed directory
