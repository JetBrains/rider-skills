# UE Docs — Programming Subsystems

Extracted from UE 5.6 official documentation.

## What Are Subsystems?

Automatically instanced classes with managed lifetimes. Extension points for adding functionality without modifying engine classes. Automatically exposed to Blueprint and Python.

---

## Subsystem Types

| Type | Base Class | Lifetime |
| --- | --- | --- |
| Engine | `UEngineSubsystem` | GEngine lifetime |
| Editor | `UEditorSubsystem` | GEditor lifetime |
| GameInstance | `UGameInstanceSubsystem` | GameInstance lifetime |
| LocalPlayer | `ULocalPlayerSubsystem` | LocalPlayer lifetime |

---

## Lifecycle

1. Instance created after parent object initializes
2. `Initialize()` called during parent setup
3. `Deinitialize()` called during parent shutdown
4. Garbage-collected when references dropped

---

## Accessing Subsystems

### Python

```python
import unreal
engine_sub = unreal.get_engine_subsystem(unreal.MyEngineSubsystem)
editor_sub = unreal.get_editor_subsystem(unreal.MyEditorSubsystem)
```

### C++

```cpp
// Engine
UMyEngineSubsystem* Sub = GEngine->GetEngineSubsystem<UMyEngineSubsystem>();
// Editor
UMyEditorSubsystem* Sub = GEditor->GetEditorSubsystem<UMyEditorSubsystem>();
// GameInstance
UMyGameSubsystem* Sub = GameInstance->GetSubsystem<UMyGameSubsystem>();
// LocalPlayer
UMyPlayerSubsystem* Sub = LocalPlayer->GetSubsystem<UMyPlayerSubsystem>();
```

### Blueprint

Right-click in graph → search "subsystems" → organized by type. Smart nodes handle context automatically without casting.

---

## Common Editor Subsystems

| Subsystem | Purpose |
| --- | --- |
| `UnrealEditorSubsystem` | Get editor world, editor state |
| `EditorActorSubsystem` | Query/spawn/modify actors |
| `EditorAssetSubsystem` | Asset loading, path queries |
| `LevelEditorSubsystem` | Load levels, level management |
| `StaticMeshEditorSubsystem` | Mesh operations (LODs, joins) |
| `EditorUtilitySubsystem` | Manage EUW tabs, startup objects |

---

## Creating Custom Subsystems

```cpp
UCLASS()
class UMyStatsSubsystem : public UGameInstanceSubsystem
{
    GENERATED_BODY()
public:
    virtual void Initialize(FSubsystemCollectionBase& Collection) override;
    virtual void Deinitialize() override;

    UFUNCTION(BlueprintCallable)
    void IncrementStat();
};
```

Benefits:
- No engine class modifications needed
- Automatic Blueprint + Python exposure
- Clean API — avoids bloat on existing classes
- Ideal for plugin development
