# ide-ue:assets — Asset & Tag Index

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

1. **Find by name or class.** `search_assets { query: "BP_Hero" }` or `search_assets { baseClass: "LyraCharacter" }`.
2. **Enumerate descendants.** `get_class_hierarchy { baseClass: "LyraCameraMode", limit: 5000 }` — returns BPs of every concrete subclass including those that inherit only via intermediate C++ bases.
3. **Inspect one BP's CDO.** `get_asset_properties { assetPath: "/abs/.../Foo.uasset" }` — absolute filesystem path.
4. **Find every override of one field across the hierarchy.** `find_default_value_overrides { className: "LyraCameraMode", fieldName: "FieldOfView" }` — returns every BP that differs from the C++ default, with the textual value each one stores.
5. **Audit tags.** `search_tags { prefix: "Ability.Damage" }` before adding new tags.

## Critical rules

- **`get_asset_properties` requires absolute filesystem path**, not `/Game/...` package path.
- **`baseClass` and `className` accept either UE convention.** Bare name (`LyraCameraMode`) or C++ form with prefix (`ULyraCameraMode`) both match — the backend probes every UE class prefix (`U`/`A`/`F`/`S`/`H`/`T`/`E`/`I`) when the input is unprefixed. **Do NOT use the `/Script/Module.Class` FQN** — that form is rejected. Matching is case-sensitive on the identifier itself.
- **`get_class_hierarchy` and `search_assets { baseClass }` descend through `Abstract` / `NotBlueprintable` bases.** A query against `ULyraCameraMode` returns BPs of every concrete subclass without you having to enumerate them first.
- **`find_default_value_overrides` reads from Rider's index.** Works whether or not `ue_health` reports `connected`. The `value` field is the textual representation UE generates for the property type (`"70"` for a float, `"Lyra.Weapon.SteadyAimingCamera"` for an `FGameplayTag`); fields with no `ValuePresentation` (struct-only members) are omitted.
- **None of these tools need the editor running.** Pure Rider-backend operations — faster than opening the editor and don't depend on RiderLink connection.
- **`search_assets` with `baseClass` vs. `get_class_hierarchy`:** `search_assets { baseClass }` returns the `.uasset` paths with an optional `query` name filter. `get_class_hierarchy` returns the full hierarchy as a structured tree. Use `search_assets` when you also need to filter by name; use `get_class_hierarchy` when you want the full tree at once.
