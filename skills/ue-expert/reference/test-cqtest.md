# CQTest Framework

CQTest is a modern C++ testing framework built on top of `FAutomationTestBase`. It was extracted from an internal plugin and became an Engine module in UE5.5. It provides fixture-based tests with automatic state reset, latent action composition, async support, and component helpers for actor/map/network testing.

> **Module:** `CQTest` (Engine module, no plugin needed in UE5.5+)
> **Header:** `#include "CQTest.h"`
> **Default Flags:** `EAutomationTestFlags_ApplicationContextMask | EAutomationTestFlags::ProductFilter`

---

## When to Use CQTest vs Other Frameworks

| Need | Use |
|------|-----|
| Pure C++ logic with setup/teardown per test | **CQTest** `TEST_CLASS` |
| Simple one-off test with no fixture | **CQTest** `TEST` or Automation `IMPLEMENT_SIMPLE_AUTOMATION_TEST` |
| BDD-style grouped tests | Automation `DEFINE_SPEC` |
| In-world actor behavior | Functional Tests (`AFunctionalTest`) |
| Multi-frame async sequences | **CQTest** `TestCommandBuilder` |
| Server + client replication testing | **CQTest** `PIENetworkComponent` |
| Full game boot / map cycle / CI pipeline | Gauntlet |

---

## Defining Tests

### Simple Test (no fixture)

```cpp
#include "CQTest.h"

TEST(MySimpleTest, "Game.Math")
{
    ASSERT_THAT(AreEqual(1 + 1, 2));
}
```

### Test with Tags

```cpp
TEST_WITH_TAGS(MyTaggedTest, "Game.Math", "[Smoke][Math]")
{
    ASSERT_THAT(IsTrue(FMath::IsNearlyZero(0.0f)));
}
```

### Fixture Class (BEFORE_EACH / AFTER_EACH)

```cpp
TEST_CLASS(FInventoryTests, "Game.Inventory")
{
    TSharedPtr<FInventorySystem> Inventory;

    BEFORE_EACH()
    {
        // Runs before each TEST_METHOD. Member variables are automatically
        // reset to default between tests (destructor/constructor cycle).
        Inventory = MakeShared<FInventorySystem>();
    }

    AFTER_EACH()
    {
        Inventory.Reset();
    }

    BEFORE_ALL()
    {
        // Static — runs once before all tests in this class. Static members persist.
    }

    AFTER_ALL()
    {
        // Static — runs once after all tests in this class.
    }

    TEST_METHOD(AddItem_ShouldIncreaseCount)
    {
        Inventory->AddItem(FName("Sword"), 1);
        ASSERT_THAT(AreEqual(Inventory->GetCount(FName("Sword")), 1));
    }

    TEST_METHOD(AddSameItem_ShouldStack)
    {
        Inventory->AddItem(FName("Arrow"), 10);
        Inventory->AddItem(FName("Arrow"), 5);
        ASSERT_THAT(AreEqual(Inventory->GetCount(FName("Arrow")), 15));
    }

    TEST_METHOD_WITH_TAGS(RemoveItem_Negative, "[EdgeCase]")
    {
        bool bResult = Inventory->RemoveItem(FName("Potion"), 99);
        ASSERT_THAT(IsFalse(bResult));
    }
};
```

**Key behavior:** Member variables reset automatically between tests via destructor + constructor. Only `static` members persist across `TEST_METHOD` calls.

### Custom Flags / Base Class

```cpp
// Custom automation flags
TEST_CLASS_WITH_FLAGS(FMyPerfTest, "Game.Perf",
    EAutomationTestFlags::EditorContext | EAutomationTestFlags::PerfFilter)
{
    TEST_METHOD(MeasureSomething) { /* ... */ }
};

// Custom base class
TEST_CLASS_WITH_BASE(FMyWorldTest, "Game.World", FActorTestSpawner)
{
    TEST_METHOD(SpawnAndVerify)
    {
        AActor* Actor = SpawnActor<AActor>();
        ASSERT_THAT(IsNotNull(Actor));
    }
};
```

### Auto-Generated Test Directory

Use `GenerateTestDirectory` to derive the dot-path from the source file location:

```cpp
// File: MyProject/Plugins/Combat/Source/CombatTests/Private/WeaponTest.cpp
// Generates path: "MyProject.Plugins.Combat.WeaponTest"
TEST_CLASS(FWeaponTests, GenerateTestDirectory)
{
    TEST_METHOD(FireRate_IsPositive) { /* ... */ }
};

// Mixed: fixed prefix + auto-generated suffix
TEST_CLASS(FWeaponTests, "Combat.[GenerateTestDirectory].Weapon")
{
    // Generates: "Combat.MyProject.Plugins.Combat.CombatTests.WeaponTest.Weapon"
};
```

---

## Assertions

All assertion methods are in the `Asserter` (accessible as `ASSERT_THAT(expr)`). The `[[nodiscard]]` pattern means assertions return a bool; `ASSERT_THAT` converts a failure to an early return.

### ASSERT_THAT Macro

```cpp
ASSERT_THAT(AreEqual(Actual, Expected));
// Expands to: if (!AreEqual(Actual, Expected)) return;
```

**Important:** Placing `ASSERT_THAT` inside a lambda does NOT return from the test — it returns from the lambda. Use carefully in loops and callbacks.

### Available Assertions

```cpp
ASSERT_THAT(IsTrue(bCondition));
ASSERT_THAT(IsFalse(bCondition));
ASSERT_THAT(IsNull(Pointer));
ASSERT_THAT(IsNotNull(Pointer));
ASSERT_THAT(AreEqual(Actual, Expected));
ASSERT_THAT(AreNotEqual(Actual, Unexpected));
ASSERT_THAT(IsNear(Actual, Expected, Tolerance));
ASSERT_THAT(AreEqualIgnoreCase(ActualStr, ExpectedStr));
ASSERT_THAT(AreNotEqualIgnoreCase(ActualStr, UnexpectedStr));
ASSERT_THAT(Fail(TEXT("Explicit failure message")));

// Expected errors (test passes if this error occurs)
ASSERT_THAT(ExpectError(TEXT("Expected error substring")));
```

### CQTestCondition Helpers

For comparisons outside `ASSERT_THAT`:

```cpp
#include "Assert/CQTestCondition.h"

// Exact equality
bool bMatch = CQTestCondition::IsEqual(Actual, Expected);
bool bNear  = CQTestCondition::IsNearlyEqual(ActualFloat, ExpectedFloat, Tolerance);

// Vector / rotator / transform
bool bVecMatch = CQTestCondition::IsNearlyEqual(ActualVec, ExpectedVec, 0.01f);
bool bRotMatch = CQTestCondition::IsNearlyEqual(ActualRot, ExpectedRot, 0.1f);
```

---

## Latent Commands (Async / Multi-frame Tests)

CQTest provides a fluent `TestCommandBuilder` API for composing multi-frame test sequences.

### TestCommandBuilder API

Commands are added in `BEFORE_EACH` or `TEST_METHOD`. They execute sequentially across ticks. The builder must be accessed as a member of the test class — **cannot add latent actions from within latent actions**.

```cpp
TEST_CLASS(FAsyncTest, "Game.Async")
{
    bool bEventFired = false;

    BEFORE_EACH()
    {
        bEventFired = false;
    }

    TEST_METHOD(EventFiresWithinTimeout)
    {
        TestCommandBuilder
            .Do([this]()
            {
                // Fire the event
                MySystem->TriggerEvent();
            })
            .Until([this]() -> bool
            {
                // Poll until condition is true (or timeout)
                return bEventFired;
            })
            .Then([this]()
            {
                // Verify after condition met
                ASSERT_THAT(IsTrue(bEventFired));
            })
            .OnTearDown([this]()
            {
                // Runs even if test fails (LIFO order)
                MySystem->Reset();
            });
    }
};
```

### Command Builder Methods

| Method | Behavior |
|--------|----------|
| `.Do(Lambda)` | Execute once; skipped if test has errors |
| `.Then(Lambda)` | Execute once after prior commands; skipped on errors |
| `.Until(Predicate, Timeout)` | Poll predicate each tick; fails on timeout |
| `.StartWhen(Predicate, Timeout)` | Wait until condition before proceeding |
| `.WaitDelay(Seconds)` | Timed wait (discouraged — causes flakiness) |
| `.DoAsync<T>(Lambda, OnResult)` | Run async work; callback receives result |
| `.ThenAsync<T>(Lambda, OnResult)` | Async after prior commands |
| `.UntilAsync<T>(Lambda, Timeout)` | Async poll with timeout |
| `.OnTearDown(Lambda)` | Cleanup; runs even on failure, LIFO order |
| `.CleanUpWith(Lambda)` | Alias for `OnTearDown` |

### Built-in Latent Commands (Lower-Level)

```cpp
// Single-tick execute
ADD_LATENT_AUTOMATION_COMMAND(FExecute([this]() { DoWork(); }));

// Wait for condition
ADD_LATENT_AUTOMATION_COMMAND(FWaitUntil(TEXT("Condition"), [this]() { return bDone; }, Timeout));

// Wait delay (avoid; can cause flakiness)
ADD_LATENT_AUTOMATION_COMMAND(FWaitDelay(2.0f));

// Sequence
TArray<TUniquePtr<IAutomationLatentCommand>> Cmds;
ADD_LATENT_AUTOMATION_COMMAND(FRunSequence(MoveTemp(Cmds)));
```

### Async Execution

```cpp
TEST_METHOD(AsyncDataFetch)
{
    TestCommandBuilder
        .DoAsync<FMyResult>(
            [this]() -> TFuture<FMyResult>
            {
                return Async(EAsyncExecution::ThreadPool, []()
                {
                    return FetchDataFromDatabase();
                });
            },
            [this](FMyResult Result)
            {
                ASSERT_THAT(IsTrue(Result.bSuccess));
            }
        );
}
```

### Timeout Configuration

Timeouts are configurable per project (UE5.6+):

| CVar | Applies To |
|------|-----------|
| `TestFramework.CQTest.CommandTimeout` | General latent commands |
| `TestFramework.CQTest.CommandTimeout.MapTest` | `MapTestSpawner` map loading |
| `TestFramework.CQTest.CommandTimeout.Network` | `PIENetworkComponent` |

Configure in `DefaultEngine.ini`:
```ini
[/Script/CQTest.CQTestSettings]
CommandTimeout=30.0
```

Or in Project Settings > CQ Test Settings (Editor).

---

## Components (Composition Helpers)

### ActorTestSpawner — Spawn Actors Without a Map

Creates a minimal `UWorld` in memory. No map loading, no PIE. Fast for actor-level tests.

```cpp
TEST_CLASS_WITH_BASE(FActorSpawnTests, "Game.Actors", FActorTestSpawner)
{
    TEST_METHOD(SpawnEnemy_HasCorrectTag)
    {
        // SpawnActor available from base
        AEnemyCharacter* Enemy = SpawnActor<AEnemyCharacter>();
        ASSERT_THAT(IsNotNull(Enemy));
        ASSERT_THAT(IsTrue(Enemy->ActorHasTag(FName("Enemy"))));
    }

    TEST_METHOD(SpawnAtLocation)
    {
        FVector SpawnLoc(100, 0, 0);
        APickup* Pickup = SpawnActorAt<APickup>(SpawnLoc, FRotator::ZeroRotator);
        ASSERT_THAT(IsNotNull(Pickup));
        ASSERT_THAT(IsNear(Pickup->GetActorLocation().X, 100.0f, 1.0f));
    }
};
```

- Only allocates what actors need; subsystems may be missing
- Use `InitializeGameSubsystems()` if your actors require `UGameInstance` subsystems
- All spawned actors tracked and destroyed on teardown automatically

### MapTestSpawner — Load an Actual Map

Loads a real map via PIE for tests that need the full world context (lighting, streaming, game mode, etc.).

```cpp
TEST_CLASS_WITH_BASE(FMapTests, "Game.Map", FMapTestSpawner)
{
    FMapTestSpawner(TEXT("/Game/Tests/Maps"), TEXT("TestArena"))
    {
    }

    BEFORE_EACH()
    {
        // MUST call this in BEFORE_EACH — adds latent command to wait for load
        AddWaitUntilLoadedCommand(TestRunner, 30.0f);
    }

    TEST_METHOD(PlayerPawn_ExistsAfterLoad)
    {
        TestCommandBuilder
            .Then([this]()
            {
                APawn* Pawn = FindFirstPlayerPawn();
                ASSERT_THAT(IsNotNull(Pawn));
            });
    }
};
```

- Editor context only (`WITH_EDITOR`)
- `AddWaitUntilLoadedCommand` must be called in `BEFORE_EACH`, not in the constructor
- Use `FMapTestSpawner::CreateFromTempLevel(CommandBuilder)` for a blank level

### PIENetworkComponent — Server + Client Replication Tests

Tests replication with a real server and N clients in PIE. Requires `ENABLE_PIE_NETWORK_TEST` (automatically set in editor builds with automation tests enabled).

```cpp
#include "Components/PIENetworkComponent.h"

struct FMyNetworkState : FBasePIENetworkComponentState
{
    // Per-instance state (separate for server and each client)
    AMyReplicatedActor* SpawnedActor = nullptr;
};

NETWORK_TEST_CLASS(FReplicationTests, "Game.Network")
{
    using NetworkComponent = FPIENetworkComponent<FMyNetworkState>;
    NetworkComponent Network;

    BEFORE_EACH()
    {
        Network = FNetworkComponentBuilder<FMyNetworkState>()
            .WithClients(2)
            .WithGameMode<AMyGameMode>()
            .Build(TestCommandBuilder);
    }

    TEST_METHOD(ActorReplicatesToAllClients)
    {
        TestCommandBuilder
            .Do([this]()
            {
                Network.GetServerState().SpawnedActor =
                    SpawnAndReplicate<AMyReplicatedActor>(
                        Network.GetServerState(),
                        &FMyNetworkState::SpawnedActor
                    );
            })
            .ThenClients([this](FMyNetworkState& ClientState)
            {
                ASSERT_THAT(IsNotNull(ClientState.SpawnedActor));
                ASSERT_THAT(IsFalse(ClientState.SpawnedActor->HasAuthority()));
            });
    }
};
```

**Key `FPIENetworkComponent<StateType>` methods:**
- `GetServerState()` — Access server-side state
- `GetClientState(Index)` — Access client state by index
- `SpawnAndReplicate<T>(State, MemberPtr)` — Spawn on server, wait for replication
- `.ThenServer(Lambda)` / `.ThenClients(Lambda)` — Per-role latent steps

---

## Asset Helpers

```cpp
#include "Helpers/CQTestAssetHelper.h"

TEST_METHOD(DataAsset_LoadsByName)
{
    // Find asset package path by name
    FString Path = CQTestAssetHelper::FindAssetPackagePathByName(TEXT("MyWeaponData"));
    ASSERT_THAT(IsFalse(Path.IsEmpty()));

    // Get Blueprint-derived UClass
    UClass* WeaponClass = CQTestAssetHelper::GetBlueprintClass(TEXT("BP_Sword"));
    ASSERT_THAT(IsNotNull(WeaponClass));

    // Load a data blueprint object
    UWeaponData* Data = Cast<UWeaponData>(
        CQTestAssetHelper::FindDataBlueprint(TEXT("WD_Sword")));
    ASSERT_THAT(IsNotNull(Data));
}

// With asset filter
auto Filter = CQTestAssetHelper::FAssetFilterBuilder()
    .WithPackagePath(TEXT("/Game/Data/Weapons"))
    .Build();

TArray<UClass*> WeaponClasses = CQTestAssetHelper::GetBlueprintClasses(Filter);
```

**Gotcha:** Asset-dependent code in constructors must check `!bInitializing` — plugins are not loaded during framework startup when constructors run for static registration.

---

## Object Builder

Builds UObjects and AActor instances via reflection, useful for parameterizing spawned actors before they begin play.

```cpp
#include "ObjectBuilder.h"

TEST_CLASS_WITH_BASE(FBuilderTests, "Game.Builder", FActorTestSpawner)
{
    TEST_METHOD(SpawnWithParams)
    {
        AActor* Actor = TObjectBuilder<AMyActor>(this)
            .SetParam(TEXT("Speed"), 350.0f)
            .SetParam(TEXT("TeamTag"), FName("Blue"))
            .AddComponentTo<UHealthComponent>()
            .Spawn();

        ASSERT_THAT(IsNotNull(Actor));
    }
};
```

---

## Module Setup

CQTest is available as an Engine module in UE5.5+. Add it to your test module's `Build.cs`:

```csharp
public class MyGameTests : ModuleRules
{
    public MyGameTests(ReadOnlyTargetRules Target) : base(Target)
    {
        PCHUsage = PCHUsageMode.UseExplicitOrSharedPCHs;

        PrivateDependencyModuleNames.AddRange(new string[]
        {
            "Core",
            "CoreUObject",
            "Engine",
            "CQTest",          // Required
            "MyGame",          // Module under test
        });

        // For map tests (Editor only)
        if (Target.bBuildEditor)
        {
            PrivateDependencyModuleNames.Add("UnrealEd");
        }
    }
}
```

**No `.uproject` plugin entry needed in UE5.5+** — CQTest is a built-in Engine module.

If using enhanced input actions in tests, add separately (extracted to its own plugin in UE5.5):
```csharp
PrivateDependencyModuleNames.Add("CQTestEnhancedInput");
```

---

## Critical Gotchas

1. **State reset is automatic but only for instance members.** Static members, external singletons, and CDOs are NOT reset between tests. Explicitly reset anything that persists outside the test instance.

2. **ASSERT_THAT in lambdas only returns from the lambda.** If you write `ASSERT_THAT` inside a `TestCommandBuilder` lambda, a failure returns from the lambda, not the test. The command sequence continues unless the assertion registers an error.

3. **Cannot add latent actions from within latent actions.** Calling `TestCommandBuilder.Do(...)` inside an already-executing latent command will assert in the destructor. Queue all commands upfront in `BEFORE_EACH` or `TEST_METHOD`.

4. **MapTestSpawner requires `AddWaitUntilLoadedCommand` in `BEFORE_EACH`.** Calling it in the constructor silently fails because the latent queue doesn't exist yet.

5. **Commands are skipped after any test error.** If `BEFORE_EACH` fails, subsequent `Do`/`Then` blocks are skipped. Only commands registered with `ECQTestFailureBehavior::Run` (or `OnTearDown`) still execute.

6. **Garbage collection is delayed during test execution.** CQTest holds off GC while latent commands run and forces a collection at teardown. Actors or UObjects you expect to be GC'd mid-test may still be alive.

7. **`BEFORE_ALL` / `AFTER_ALL` share state across tests.** They are static. Any state they set up must be thread-safe and deterministic across test orderings.

8. **CQTestAssetHelper constructors must guard against startup.** Check `!bInitializing` before querying the asset registry in any constructor that may run during module load.

---

## Tags System

Tags filter tests in the Session Frontend and on the command line.

```cpp
// Class-level tags (apply to all methods)
TEST_CLASS_WITH_TAGS(FWeaponTests, "Game.Combat", "[Combat][Weapon]")
{
    // Method-level tags (additive)
    TEST_METHOD_WITH_TAGS(Durability_DegradesOnHit, "[Smoke]")
    {
        // This test has tags: [Combat][Weapon][Smoke]
    }
};
```

Filter on command line:
```bash
UnrealEditor-Cmd.exe MyProject.uproject \
    -ExecCmds="Automation RunTests Game; Automation Filter [Smoke]" \
    -Unattended -NullRHI
```

---

## Best Practices

1. **Prefer `TEST_CLASS` over `IMPLEMENT_SIMPLE_AUTOMATION_TEST`** when you have more than one related test — automatic state reset prevents inter-test contamination.

2. **Use `TestCommandBuilder` over raw `ADD_LATENT_AUTOMATION_COMMAND`** — the fluent API is readable, handles cleanup ordering, and skips steps on failure.

3. **Use `OnTearDown` instead of `AFTER_EACH` for resource cleanup** when the cleanup must run even if the test fails mid-sequence.

4. **Use `ActorTestSpawner` by default; escalate to `MapTestSpawner` only if needed.** Map loading adds significant test time.

5. **Avoid `WaitDelay`** — fixed time waits make tests flaky on slow machines. Use `Until` with a predicate instead.

6. **Keep `BEFORE_ALL` / `AFTER_ALL` stateless or with carefully controlled state.** Test execution order is not guaranteed.

7. **Use `GenerateTestDirectory`** to auto-derive test paths from file location — avoids stale hardcoded paths when files move.
