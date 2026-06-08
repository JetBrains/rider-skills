# Asset Management & Loading

## Primary vs Secondary Assets

| Type | Management | Example |
|------|-----------|---------|
| Primary | Directly managed by Asset Manager via PrimaryAssetId | ExperienceDefinitions, PawnData, Maps |
| Secondary | Loaded when referenced by Primary Assets | Meshes, Textures, Materials |

Configure primary asset scanning in Project Settings > Asset Manager or via custom `UAssetManager` subclass.

## Hard vs Soft References

| Aspect | Hard Reference | Soft Reference |
|--------|---------------|----------------|
| Types | `UObject*`, `TSubclassOf<>` | `TSoftObjectPtr<>`, `TSoftClassPtr<>`, `FSoftObjectPath` |
| Loading | Synchronous on owner load | Manual / on-demand |
| Memory | Always resident | Only when explicitly loaded |
| Build dependency | Creates cook dependency | No cook dependency until loaded |

### Rule of Thumb
- **Hard reference**: Asset is critical and ALWAYS needed (core gameplay mesh)
- **Soft reference**: Asset is optional, large, or context-dependent (level-specific, cosmetic, DLC)

### Checking Soft Pointers
```cpp
TSoftObjectPtr<UTexture2D> SoftTexture;
if (!SoftTexture.IsNull()) {     // Path is valid
    if (SoftTexture.IsValid()) {  // Asset is loaded
        UTexture2D* Texture = SoftTexture.Get();
    }
}
```

## Async Loading Patterns

### FStreamableManager (Simple)
```cpp
FStreamableManager& Mgr = UAssetManager::GetStreamableManager();
TSharedPtr<FStreamableHandle> Handle = Mgr.RequestAsyncLoad(
    AssetPaths,
    FStreamableDelegate::CreateUObject(this, &ThisClass::OnLoaded));
// Handle keeps assets alive
```

### Asset Manager (Full Featured)
```cpp
UAssetManager& AM = UAssetManager::Get();
AM.LoadPrimaryAsset(AssetId, LoadBundles, Delegate);  // Keeps in memory
AM.PreloadPrimaryAssets(AssetIds, LoadBundles);        // Auto-releases
```

### AsyncMixin Plugin (Lyra Pattern)
```cpp
CancelAsyncLoading();
AsyncLoad(SoftClassPtr, [this]() { /* Step 1 */ });
AsyncLoad(SoftObjectPtr, [this]() { /* Step 2 */ });
StartAsyncLoading();
// Callbacks fire in registration order
// OnFinishedLoading() virtual called at end
```

- Serialized execution: callbacks in order despite async load times
- Zero memory per instance: state in static TMap
- Weak callback safety: handles destroyed owners
- Supports primary asset preloading and async conditions

## Asset Bundles
Partition asset properties for selective loading:
```cpp
UPROPERTY(meta = (AssetBundles = "Client"))
TSoftObjectPtr<UTexture2D> HUDIcon;

UPROPERTY(meta = (AssetBundles = "Equipped"))
TSoftObjectPtr<UStaticMesh> WeaponMesh;
```

Lyra bundles: `"Equipped"` (always loaded), `"Client"` (HUD, input), `"Server"` (dedicated server)

## Reference Viewer & Audit
- **Reference Viewer**: Visual dependency graph (right-click asset → Reference Viewer)
- **Size Map**: Visual representation of asset sizes in dependency tree
- **Audit Assets**: Bulk asset quality checks
- **Asset Registry**: Runtime queryable database of all project assets

## Anti-Patterns
- **Losing FStreamableHandle**: Asset silently unloads without warning
- **Hard-referencing from DataTables**: All row assets load when table loads
- **Ignoring Reference Viewer**: Hidden dependency chains accumulate over time
- **Loading everything eagerly**: Use Asset Bundles for selective loading
- **Storing asset references as raw paths**: Use `FSoftObjectPath` or `TSoftObjectPtr`
- **Synchronous loading on game thread**: Causes hitches; always use async
- **Not configuring Primary Asset types**: Assets not scannable by Asset Manager

## Save/Load Patterns

### Binary Serialization (Recommended for shipping)
- Use `Serialize()` with `FMemoryWriter` → `FObjectAndNameAsStringProxyArchive`
- Set `ArIsSaveGame = true`
- 60-80% smaller than JSON
- Include version header for migration

### Version Migration
```
SaveVersion 1 → migrate → SaveVersion 2 → migrate → SaveVersion 3
```
- Add `SaveVersion` field
- Implement per-version migration routines
- Set defaults first, then overwrite from save data

### Best Practices
- JSON for development (debuggable), binary for shipping (efficient)
- Never store raw UObject pointers; use string paths or PrimaryAssetId
- Async I/O on background threads
- Test with empty saves, corrupted files, version mismatches
