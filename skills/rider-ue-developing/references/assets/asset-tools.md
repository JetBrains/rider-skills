# rider-ue-developing:assets — Asset & Tag Index

These tools run against **Rider's project index**, not the running editor. Use them even when `ue_health` reports `connected = false`.

## Tool reference

| Tool | Purpose | Notes |
|------|---------|-------|
| `search_assets` | Find `.uasset`/`.umap` by name **or** by derived `baseClass` | Filename glob is case-insensitive; `baseClass` walks the full C++ inheritance closure — abstract / `NotBlueprintable` bases work, returns BPs of every concrete subclass |
| `get_class_hierarchy` | List all Blueprints inheriting from a C++ class (full chain) | Walks the full C++ inheritance closure; `limit` defaults to 1000 |
| `get_asset_properties` | Dump CDO property values from a `.uasset` | **Absolute filesystem path required** — not a `/Game/...` package path |
| `find_default_value_overrides` | For a `UPROPERTY` field, list every BP whose CDO overrides its default value | Returns `{ assetPath, instanceName, typeName, value }` per override |
| `search_tags` | Search GameplayTag definitions across `.uasset` files; supports `prefix` filter | Use before adding new tags to avoid duplicates / collisions |

## Workflow

1. **Find by name or class.** `search_assets { query: "BP_Hero" }` or `search_assets { baseClass: "GameCharacter" }`.
2. **Enumerate descendants.** `get_class_hierarchy { baseClass: "CameraMode", limit: 5000 }` — returns BPs of every concrete subclass including those that inherit only via intermediate C++ bases.
3. **Inspect one BP's CDO.** `get_asset_properties { assetPath: "D:/abs/.../Foo.uasset" }` — absolute filesystem path.
   - **If the result is `[]`:** the Blueprint has no property overrides — all values are the C++ defaults. Do NOT fall back to `ue_execute_python`. Instead: `search_symbol { q: "ClassName" }` to find the `.h` file, then `read_file` it to read the `UPROPERTY` default initialisers directly.
4. **Find every override of one field across the hierarchy.** `find_default_value_overrides { className: "CameraMode", fieldName: "FieldOfView" }` — call once per property; returns every BP whose CDO overrides that field, with the textual value each one stores. `className` is the **C++ base class**, not a Blueprint name.
5. **Audit tags.** `search_tags { prefix: "Ability.Damage" }` before adding new tags.

## Critical rules

- **`get_asset_properties` requires absolute filesystem path**, not `/Game/...` package path. Use the `assetPath` returned by `search_assets` verbatim — it is already absolute.
- **`get_asset_properties` returning `[]` is NOT a failure.** It means the Blueprint stores no overrides; every property is inherited from C++ defaults. Read the C++ header instead — do NOT escalate to `ue_execute_python`.
- **`find_default_value_overrides` requires `className` + `fieldName`.** `className` is the C++ base class (e.g. `HorrorCharacter`), not the Blueprint asset name. Call it once per property you want to audit. It tells you which BPs override a given field across the whole hierarchy — it does NOT dump all properties of one BP (use `get_asset_properties` for that).
- **`baseClass` and `className` accept either UE convention.** Bare name (`CameraMode`) or C++ form with prefix (`UCameraMode`) both match — the backend probes every UE class prefix (`U`/`A`/`F`/`S`/`H`/`T`/`E`/`I`) when the input is unprefixed. **Do NOT use the `/Script/Module.Class` FQN** — that form is rejected. Matching is case-sensitive on the identifier itself.
- **`get_class_hierarchy` and `search_assets { baseClass }` descend through `Abstract` / `NotBlueprintable` bases.** A query against `UCameraMode` returns BPs of every concrete subclass without you having to enumerate them first.
- **`find_default_value_overrides` reads from Rider's index.** Works whether or not `ue_health` reports `connected`. The `value` field is the textual representation UE generates for the property type (`"70"` for a float, `"Ability.Weapon.SteadyAim"` for an `FGameplayTag`); fields with no `ValuePresentation` (struct-only members) are omitted.
- **None of these tools need the editor running.** Pure Rider-backend operations — faster than opening the editor and don't depend on RiderLink connection.
- **`search_assets` with `baseClass` vs. `get_class_hierarchy`:** `search_assets { baseClass }` returns the `.uasset` paths with an optional `query` name filter. `get_class_hierarchy` returns the full hierarchy as a structured tree. Use `search_assets` when you also need to filter by name; use `get_class_hierarchy` when you want the full tree at once.
- **Do NOT use `ue_execute_python` to read CDO property values.** `get_asset_properties` and C++ header reads cover all static-default queries without requiring the editor or a Python round-trip. Reserve `ue_execute_python` for runtime state that only exists in a live PIE session.
