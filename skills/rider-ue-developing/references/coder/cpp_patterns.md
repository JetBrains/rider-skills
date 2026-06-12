# C++ Patterns

## Actor with component
```cpp
// .h
UCLASS()
class MYMODULE_API AMyActor : public AActor
{
    GENERATED_BODY()
public:
    AMyActor();

    UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = "Components")
    TObjectPtr<USceneComponent> SceneRoot;

    UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = "Components")
    TObjectPtr<UStaticMeshComponent> Mesh;
};

// .cpp
AMyActor::AMyActor()
{
    SceneRoot = CreateDefaultSubobject<USceneComponent>(TEXT("SceneRoot"));
    SetRootComponent(SceneRoot);

    Mesh = CreateDefaultSubobject<UStaticMeshComponent>(TEXT("Mesh"));
    Mesh->SetupAttachment(SceneRoot);
}
```

## Blueprint-implementable event
```cpp
UFUNCTION(BlueprintImplementableEvent, Category = "Events")
void OnCustomEvent(const FHitResult& HitResult);
```

## Blueprint-native event (C++ default + Blueprint override)
```cpp
UFUNCTION(BlueprintNativeEvent, Category = "Events")
void OnDamageReceived(float Amount);
virtual void OnDamageReceived_Implementation(float Amount);
```

## Delegate / Event Dispatcher
```cpp
DECLARE_DYNAMIC_MULTICAST_DELEGATE_OneParam(FOnHealthChanged, float, NewHealth);

UPROPERTY(BlueprintAssignable, Category = "Events")
FOnHealthChanged OnHealthChanged;
```

## Compile + Create Blueprint workflow

After writing C++ files, use batch execution to compile and create a Blueprint in one pass.

## Error Recovery

- **Compile errors**: Check include paths, verify `Build.cs` dependencies.
- **Blueprint can't find C++ parent**: Module not compiled yet. Compile first.
- **"Unresolved external symbol"**: Missing `MYMODULE_API` export macro or missing module in `Build.cs`.
- **"Cannot find generated.h"**: Run build once to generate, or check file naming matches class name.

---

## MCP tools

| Tool | Purpose | Scenario |
|------|---------|----------|
| `build_solution_start` / `build_solution_state` | Compile C++ before Blueprint creation | Start the build, poll until `buildIsSuccess == true`, then run the Blueprint creation Python script |
| `get_file_problems` | IDE diagnostics on the edited header/source | Run immediately after writing the `.h`/`.cpp` to surface missing includes or UCLASS macro errors before the full build |
| `search_symbol` | Locate a class or function across the codebase | Find the exact FQN needed for `unreal.load_class(None, "/Script/Module.MyActor")` in the create-from-class scripts |
| `ue_execute_python` | Execute the Blueprint-creation snippets | Run the `create_asset` + `compile_blueprint` + `save_asset` chain after a successful build |
| `ue_get_logs` | Check Live Coding result | `category="LogLiveCoding"` — confirm "Code successfully patched" before re-running Python |
