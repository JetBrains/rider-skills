# Automation Test Framework

The core C++ testing framework in Unreal Engine, built around `FAutomationTestBase`. Use this for unit tests, integration tests, and any test that does not require a fully placed actor in a level.

---

## Class Hierarchy

```
FAutomationTestBase
  FAutomationTestWithWorld        // Provides a transient test world
  FAutomationTestWithPIE          // Launches Play-In-Editor
```

All automation tests inherit from `FAutomationTestBase`. The framework discovers tests at startup by scanning registered instances created by the `IMPLEMENT_*` macros.

---

## Test Macros

### IMPLEMENT_SIMPLE_AUTOMATION_TEST

Use for tests that take no parameters and run a single iteration.

```cpp
IMPLEMENT_SIMPLE_AUTOMATION_TEST(FMyMathTest, "Project.Math.Addition",
    EAutomationTestFlags::EditorContext | EAutomationTestFlags::ProductFilter)

bool FMyMathTest::RunTest(const FString& Parameters)
{
    TestEqual(TEXT("1 + 1 should be 2"), 1 + 1, 2);
    return true;
}
```

**Arguments:**
1. `ClassName` -- The C++ class name for the test (must be unique).
2. `PrettyName` -- Dot-separated path that determines hierarchy in the test browser. Convention: `"Project.Category.TestName"`.
3. `Flags` -- Bitwise OR of `EAutomationTestFlags` values.

### IMPLEMENT_COMPLEX_AUTOMATION_TEST

Use for parameterized tests that iterate over a data set.

```cpp
IMPLEMENT_COMPLEX_AUTOMATION_TEST(FAssetLoadTest, "Project.Assets.LoadAll",
    EAutomationTestFlags::EditorContext | EAutomationTestFlags::ProductFilter)

void FAssetLoadTest::GetTests(TArray<FString>& OutBeautifiedNames,
                               TArray<FString>& OutTestCommands) const
{
    // Populate the parameter list
    OutBeautifiedNames.Add(TEXT("Texture_Diffuse"));
    OutTestCommands.Add(TEXT("/Game/Textures/T_Diffuse"));

    OutBeautifiedNames.Add(TEXT("Texture_Normal"));
    OutTestCommands.Add(TEXT("/Game/Textures/T_Normal"));
}

bool FAssetLoadTest::RunTest(const FString& Parameters)
{
    // Parameters contains the TestCommand string for this iteration
    UObject* Asset = StaticLoadObject(UObject::StaticClass(), nullptr, *Parameters);
    TestNotNull(TEXT("Asset should load"), Asset);
    return true;
}
```

`GetTests` is called once to enumerate all parameter sets. `RunTest` is called once per parameter.

### IMPLEMENT_CUSTOM_SIMPLE_AUTOMATION_TEST

For tests that need a custom base class (e.g., one that provides a world or fixture data).

```cpp
IMPLEMENT_CUSTOM_SIMPLE_AUTOMATION_TEST(FMyWorldTest, FAutomationTestWithWorld,
    "Project.World.SpawnActor",
    EAutomationTestFlags::EditorContext | EAutomationTestFlags::ProductFilter)

bool FMyWorldTest::RunTest(const FString& Parameters)
{
    UWorld* World = GetWorld(); // Provided by FAutomationTestWithWorld
    TestNotNull(TEXT("World exists"), World);

    AActor* Actor = World->SpawnActor<AActor>();
    TestNotNull(TEXT("Actor spawned"), Actor);
    return true;
}
```

---

## Test Flags (EAutomationTestFlags)

Flags are split into context flags and filter flags. You must include at least one of each.

### Context Flags (where the test can run)

| Flag | Description |
|------|-------------|
| `EditorContext` | Runs in the editor (most common for development) |
| `ClientContext` | Runs on a game client |
| `ServerContext` | Runs on a dedicated server |
| `CommandletContext` | Runs inside a commandlet |

### Filter Flags (when the test should run)

| Flag | Description |
|------|-------------|
| `SmokeFilter` | Fast tests (< 5 seconds), run on every commit |
| `EngineFilter` | Engine-level tests |
| `ProductFilter` | Project/game-level tests |
| `PerfFilter` | Performance benchmarks |
| `StressFilter` | Stress / soak tests |
| `NegativeFilter` | Tests that verify failure cases |

### Common Combinations

```cpp
// Standard editor unit test
EAutomationTestFlags::EditorContext | EAutomationTestFlags::ProductFilter

// Smoke test (fast, runs frequently)
EAutomationTestFlags::EditorContext | EAutomationTestFlags::SmokeFilter

// Performance benchmark
EAutomationTestFlags::EditorContext | EAutomationTestFlags::PerfFilter

// Client-side test (needs a running game)
EAutomationTestFlags::ClientContext | EAutomationTestFlags::ProductFilter

// Test that runs everywhere
EAutomationTestFlags::EditorContext | EAutomationTestFlags::ClientContext
    | EAutomationTestFlags::ProductFilter
```

---

## Assertions

All assertion methods are members of `FAutomationTestBase`.

### Boolean Assertions

```cpp
TestTrue(TEXT("Condition should be true"), bValue);
TestFalse(TEXT("Condition should be false"), bValue);
```

### Equality Assertions

```cpp
TestEqual(TEXT("Values should match"), Actual, Expected);
TestEqual(TEXT("Float comparison"), ActualFloat, ExpectedFloat, Tolerance);
TestNotEqual(TEXT("Values should differ"), Actual, Unexpected);
```

### Null Assertions

```cpp
TestNull(TEXT("Should be null"), Pointer);
TestNotNull(TEXT("Should not be null"), Pointer);
```

### String Assertions

```cpp
TestEqual(TEXT("String match"), ActualString, ExpectedString);
```

### Manual Error / Warning Reporting

```cpp
AddError(TEXT("Something went wrong: details here"));
AddWarning(TEXT("Non-fatal issue detected"));
AddInfo(TEXT("Informational message for the log"));

// Expected errors (test will fail if this error does NOT occur)
AddExpectedError(TEXT("Expected error substring"), EAutomationExpectedErrorFlags::Contains);
AddExpectedError(TEXT("^Exact regex match$"), EAutomationExpectedErrorFlags::Exact);
```

### Checking Expected Errors

When testing that code correctly produces an error:

```cpp
bool FMyErrorTest::RunTest(const FString& Parameters)
{
    // Tell the framework to expect this error (so it doesn't fail the test)
    AddExpectedError(TEXT("Invalid parameter"), EAutomationExpectedErrorFlags::Contains, 1);

    // Call code that should produce the error
    MyFunction(InvalidParam);

    return true;
}
```

---

## Latent Commands (Async Testing)

Latent commands allow tests to span multiple frames. They are queued and executed sequentially, one per tick (or until `Update` returns true).

### Built-in Latent Commands

```cpp
// Wait for a duration
ADD_LATENT_AUTOMATION_COMMAND(FWaitLatentCommand(2.0f));

// Wait for a condition
ADD_LATENT_AUTOMATION_COMMAND(FWaitUntilCommand([this]() {
    return bConditionMet;
}));

// Execute a lambda on the next tick
ADD_LATENT_AUTOMATION_COMMAND(FEngineWaitLatentCommand(0.0f)); // Wait one frame
ADD_LATENT_AUTOMATION_COMMAND(FFunctionLatentCommand([this]() {
    // Do something after waiting
    TestTrue(TEXT("Condition met"), bConditionMet);
    return true; // Return true when done
}));

// Open a map and wait for it to load
ADD_LATENT_AUTOMATION_COMMAND(FAutoOpenMapCommand(TEXT("/Game/Tests/Maps/TestLevel")));
ADD_LATENT_AUTOMATION_COMMAND(FWaitForMapToLoadCommand());
```

### Custom Latent Commands

```cpp
DEFINE_LATENT_AUTOMATION_COMMAND_ONE_PARAMETER(FWaitForActorReady, AActor*, TargetActor);

bool FWaitForActorReady::Update()
{
    // Return true when the command is complete
    // Return false to continue waiting (called again next tick)
    if (TargetActor && TargetActor->IsReady())
    {
        return true;
    }
    return false;
}
```

Available parameter variants:
- `DEFINE_LATENT_AUTOMATION_COMMAND` -- no parameters
- `DEFINE_LATENT_AUTOMATION_COMMAND_ONE_PARAMETER` -- one parameter
- `DEFINE_LATENT_AUTOMATION_COMMAND_TWO_PARAMETER` -- two parameters

### Latent Command with Test Reference

To access test assertions from a latent command:

```cpp
DEFINE_LATENT_AUTOMATION_COMMAND_TWO_PARAMETER(FVerifyActorCount, FAutomationTestBase*, Test, int32, ExpectedCount);

bool FVerifyActorCount::Update()
{
    UWorld* World = GEditor->GetEditorWorldContext().World();
    int32 ActorCount = 0;
    for (TActorIterator<AActor> It(World); It; ++It)
    {
        ActorCount++;
    }
    Test->TestEqual(TEXT("Actor count"), ActorCount, ExpectedCount);
    return true;
}

// Usage in RunTest:
ADD_LATENT_AUTOMATION_COMMAND(FVerifyActorCount(this, 5));
```

### Chaining Latent Commands

Commands execute in order. Build a sequence:

```cpp
bool FMyAsyncTest::RunTest(const FString& Parameters)
{
    // Step 1: Open map
    ADD_LATENT_AUTOMATION_COMMAND(FAutoOpenMapCommand(TEXT("/Game/Tests/TestMap")));
    ADD_LATENT_AUTOMATION_COMMAND(FWaitForMapToLoadCommand());

    // Step 2: Wait a moment for initialization
    ADD_LATENT_AUTOMATION_COMMAND(FWaitLatentCommand(1.0f));

    // Step 3: Verify state
    ADD_LATENT_AUTOMATION_COMMAND(FFunctionLatentCommand([this]() {
        UWorld* World = GEditor->GetEditorWorldContext().World();
        TestNotNull(TEXT("World loaded"), World);
        return true;
    }));

    return true; // RunTest returns immediately; latent commands run over subsequent frames
}
```

---

## Spec-Style Tests (Define / Describe / It)

UE supports BDD-style spec tests using `DEFINE_SPEC`:

```cpp
BEGIN_DEFINE_SPEC(FInventorySpec, "Project.Inventory",
    EAutomationTestFlags::EditorContext | EAutomationTestFlags::ProductFilter)

    TSharedPtr<FInventorySystem> Inventory;

END_DEFINE_SPEC(FInventorySpec)

void FInventorySpec::Define()
{
    BeforeEach([this]()
    {
        Inventory = MakeShared<FInventorySystem>();
    });

    Describe("Adding items", [this]()
    {
        It("should increase item count", [this]()
        {
            Inventory->AddItem(FItemId(1), 1);
            TestEqual(TEXT("Item count"), Inventory->GetItemCount(FItemId(1)), 1);
        });

        It("should stack identical items", [this]()
        {
            Inventory->AddItem(FItemId(1), 3);
            Inventory->AddItem(FItemId(1), 2);
            TestEqual(TEXT("Stacked count"), Inventory->GetItemCount(FItemId(1)), 5);
        });
    });

    Describe("Removing items", [this]()
    {
        BeforeEach([this]()
        {
            Inventory->AddItem(FItemId(1), 10);
        });

        It("should decrease item count", [this]()
        {
            Inventory->RemoveItem(FItemId(1), 3);
            TestEqual(TEXT("Remaining"), Inventory->GetItemCount(FItemId(1)), 7);
        });

        It("should not go below zero", [this]()
        {
            bool bSuccess = Inventory->RemoveItem(FItemId(1), 15);
            TestFalse(TEXT("Should fail"), bSuccess);
            TestEqual(TEXT("Count unchanged"), Inventory->GetItemCount(FItemId(1)), 10);
        });
    });

    AfterEach([this]()
    {
        Inventory.Reset();
    });
}
```

### Spec Lifecycle Hooks

| Hook | Timing |
|------|--------|
| `BeforeEach` | Runs before each `It` block (including nested scopes) |
| `AfterEach` | Runs after each `It` block |
| `Describe` | Groups related tests, can nest |
| `It` | Defines a single test case |
| `xDescribe` | Skipped describe block |
| `xIt` | Skipped test case |

### Latent Spec Tests

Use `LatentBeforeEach`, `LatentIt`, `LatentAfterEach` for async operations:

```cpp
void FMyAsyncSpec::Define()
{
    LatentBeforeEach([this](const FDoneDelegate& Done)
    {
        // Perform async setup
        AsyncTask(ENamedThreads::GameThread, [this, Done]()
        {
            // Setup complete
            Done.Execute();
        });
    });

    LatentIt("should complete async operation", [this](const FDoneDelegate& Done)
    {
        MyAsyncOperation([this, Done](bool bResult)
        {
            TestTrue(TEXT("Operation succeeded"), bResult);
            Done.Execute();
        });
    });
}
```

---

## Test Setup and Teardown

### Simple Tests

Override `Setup()` and `Teardown()` (available in UE 5.1+):

```cpp
IMPLEMENT_SIMPLE_AUTOMATION_TEST(FMyTest, "Project.MyTest",
    EAutomationTestFlags::EditorContext | EAutomationTestFlags::ProductFilter)

// Optional: called before RunTest
void FMyTest::Setup()
{
    // Initialize shared state
}

// Optional: called after RunTest (even if RunTest fails)
void FMyTest::Teardown()
{
    // Clean up shared state
}

bool FMyTest::RunTest(const FString& Parameters)
{
    // Test logic
    return true;
}
```

### Creating a Test World

When you need a `UWorld` without loading a map:

```cpp
bool FMyWorldTest::RunTest(const FString& Parameters)
{
    // Create a minimal test world
    UWorld* World = UWorld::CreateWorld(EWorldType::Game, false);
    FWorldContext& WorldContext = GEngine->CreateNewWorldContext(EWorldType::Game);
    WorldContext.SetCurrentWorld(World);

    // Initialize the world
    World->InitializeActorsForPlay(FURL());
    World->BeginPlay();

    // Run your tests
    AActor* Actor = World->SpawnActor<AMyActor>();
    TestNotNull(TEXT("Actor spawned"), Actor);

    // Clean up
    GEngine->DestroyWorldContext(World);
    World->DestroyWorld(false);

    return true;
}
```

### Editor Utility: Create a New Map

```cpp
#include "Tests/AutomationEditorCommon.h"

bool FMyEditorTest::RunTest(const FString& Parameters)
{
    UWorld* World = FAutomationEditorCommonUtils::CreateNewMap();
    TestNotNull(TEXT("New map created"), World);

    // Test in the clean map
    return true;
}
```

---

## Running Tests

### Command Line

```bash
# Run specific tests by name (supports wildcards)
UnrealEditor-Cmd.exe MyProject.uproject \
    -ExecCmds="Automation RunTests Project.Math" \
    -Unattended -NullRHI -NoSound -Log

# Run by filter
UnrealEditor-Cmd.exe MyProject.uproject \
    -ExecCmds="Automation RunFilter Smoke" \
    -Unattended -NullRHI -Log

# Run all tests
UnrealEditor-Cmd.exe MyProject.uproject \
    -ExecCmds="Automation RunAll" \
    -Unattended -NullRHI -Log

# Output results to a report file
UnrealEditor-Cmd.exe MyProject.uproject \
    -ExecCmds="Automation RunTests Project; Automation Quit" \
    -Unattended -NullRHI -Log \
    -ReportOutputPath="TestResults/"

# JSON test report
UnrealEditor-Cmd.exe MyProject.uproject \
    -ExecCmds="Automation RunTests Project" \
    -Unattended -NullRHI \
    -TestExitOnFinish \
    -ReportExportPath="TestResults/report.json"
```

### Editor Session Frontend

1. Open **Window > Developer Tools > Session Frontend**.
2. Select the **Automation** tab.
3. Use the filter bar to find tests by name.
4. Check boxes and click **Start Tests**.
5. Results appear inline with pass/fail/warning indicators.

### Console Commands

```
Automation List                    -- List all registered tests
Automation RunTests <Name>         -- Run tests matching name (supports *)
Automation RunAll                  -- Run every registered test
Automation RunFilter <Filter>      -- Run by filter (Smoke, Engine, Product, Perf, Stress)
```

---

## Best Practices

1. **Keep unit tests fast.** Target under 1 second per test. Use `SmokeFilter` for the fastest tests.
2. **Use descriptive PrettyNames.** `"Project.Inventory.AddItem.ShouldStackDuplicates"` is better than `"Test1"`.
3. **One assertion concept per test.** Multiple assertions are fine if they test the same logical condition.
4. **Clean up after yourself.** Spawned actors, loaded assets, and created worlds must be destroyed in teardown.
5. **Use spec-style for related tests.** `DEFINE_SPEC` with `Describe`/`It` groups tests logically and shares setup.
6. **Test in the right context.** Use `EditorContext` for editor tests, `ClientContext` only if you need a running game client.
7. **Prefer `TestEqual` over `TestTrue` for comparisons.** `TestEqual` prints both values on failure; `TestTrue` only says "false".
8. **Use `AddExpectedError` for negative tests.** Don't let expected errors fail your test.
