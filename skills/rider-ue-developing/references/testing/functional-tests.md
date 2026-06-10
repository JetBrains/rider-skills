# Functional Test Framework

Functional tests run inside a loaded level, operating on placed actors. They are ideal for integration and acceptance tests that verify gameplay behavior, visual output, and actor interactions in a real world context.

---

## Core Concepts

### AFunctionalTest

The base class for all functional tests. It is an `AActor` placed in a test map. When the `FunctionalTestingManager` runs the map, it finds all `AFunctionalTest` actors and executes them in sequence.

```cpp
#include "FunctionalTest.h"

UCLASS()
class MYPROJECT_API AMyFunctionalTest : public AFunctionalTest
{
    GENERATED_BODY()

public:
    virtual void PrepareTest() override;
    virtual void StartTest() override;
    virtual bool IsReady_Implementation() override;

protected:
    // Test-specific actors or state
    UPROPERTY()
    TObjectPtr<AMyActor> TestSubject;
};
```

### Lifecycle

1. **`IsReady_Implementation()`** -- Called each tick before the test starts. Return `true` when preconditions are met (e.g., assets loaded, actors spawned). Default returns `true` immediately.
2. **`PrepareTest()`** -- Called once before `StartTest`. Use for setup that must happen after the world is fully initialized.
3. **`StartTest()`** -- The main test body. Perform actions and queue observations.
4. **`FinishTest(EFunctionalTestResult, FString)`** -- Call this to end the test with a result. If you never call it, the test times out and fails.

### Finishing a Test

```cpp
void AMyFunctionalTest::StartTest()
{
    Super::StartTest();

    // Immediate test
    if (TestSubject == nullptr)
    {
        FinishTest(EFunctionalTestResult::Failed, TEXT("TestSubject is null"));
        return;
    }

    TestSubject->DoSomething();

    // Deferred finish (wait for a callback or timer)
    GetWorldTimerManager().SetTimer(TimerHandle, [this]()
    {
        if (TestSubject->IsInExpectedState())
        {
            FinishTest(EFunctionalTestResult::Succeeded, TEXT("Actor reached expected state"));
        }
        else
        {
            FinishTest(EFunctionalTestResult::Failed, TEXT("Actor did not reach expected state"));
        }
    }, 2.0f, false);
}
```

### Test Results

```cpp
enum class EFunctionalTestResult : uint8
{
    Default,     // Not finished yet
    Invalid,     // Test is invalid (configuration error)
    Error,       // Test encountered an error
    Running,     // Still running
    Failed,      // Test failed
    Succeeded,   // Test passed
};
```

---

## Setting Up Test Levels

### Creating a Test Map

1. Create a map in your project: `/Game/Tests/Maps/FT_MyFeature`.
2. Place your `AFunctionalTest`-derived actors in the map.
3. Configure each test actor's properties in the Details panel.
4. Save the map.

### Naming Convention

Use the `FT_` prefix for functional test maps:
- `FT_Combat_MeleeAttacks`
- `FT_Inventory_PickupItems`
- `FT_Movement_Climbing`

### Required Actors

Each test map should contain:
- One or more `AFunctionalTest` (or subclass) actors.
- Any supporting actors the test needs (targets, triggers, etc.).
- Optionally, a `AFunctionalTestGameMode` override.

### Test Map Configuration

In the World Settings of the test map:
- Set **Game Mode Override** if your test needs a specific game mode.
- Set **Default Pawn Class** if your test needs a specific pawn.

---

## Auto-Running Tests on Level Load

### FunctionalTestingManager

The `UFunctionalTestingManager` discovers and runs all functional tests in a map.

```cpp
// Programmatically trigger functional tests in the current map
UFunctionalTestingManager* Manager = UFunctionalTestingManager::GetManager(GetWorld());
if (Manager)
{
    Manager->RunAllFunctionalTests();
}
```

### Command-Line Execution

```bash
# Run all functional tests in a specific map
UnrealEditor-Cmd.exe MyProject.uproject \
    /Game/Tests/Maps/FT_MyFeature \
    -ExecCmds="Automation RunTests FunctionalTests" \
    -Unattended -NullRHI -Log

# Run functional tests across multiple maps
UnrealEditor-Cmd.exe MyProject.uproject \
    -ExecCmds="Automation RunTests Project.FunctionalTests" \
    -Unattended -NullRHI -Log
```

### Editor Execution

1. Open the test map.
2. Open **Session Frontend > Automation**.
3. Find tests under `FunctionalTests.<MapName>`.
4. Run them.

Alternatively, use the **Functional Testing Editor** plugin (enable in Plugins if not visible) to get a dedicated UI.

---

## Built-in Functional Test Subclasses

### AFunctionalTest (Base)

Standard functional test with timer-based timeout, assertions, and finish conditions.

### AFunctionalAITest

Specialized for AI testing with a pre-configured AI controller and pawn.

```cpp
UCLASS()
class AMyAIFunctionalTest : public AFunctionalAITest
{
    GENERATED_BODY()

public:
    virtual void PrepareTest() override
    {
        Super::PrepareTest();
        // SpawnedPawn and SpawnedController are set up automatically
        // Configure the AI behavior here
    }

    virtual void StartTest() override
    {
        Super::StartTest();
        // AI pawn is ready, run behavior tree or EQS
    }
};
```

Key properties (set in Details panel):
- `SpawnAIControllerClass` -- The AI controller to use.
- `SpawnPawnClass` -- The pawn to spawn.
- `SpawnLocation` -- Where to spawn (uses actor location if not set).

---

## Assertions in Functional Tests

Functional tests provide their own assertion methods:

```cpp
void AMyFunctionalTest::StartTest()
{
    Super::StartTest();

    // Log-based assertions (add to test log, do not immediately finish)
    AssertTrue(bCondition, TEXT("Condition should be true"));
    AssertFalse(bCondition, TEXT("Condition should be false"));
    AssertIsValid(Object, TEXT("Object should be valid"));
    AssertEqual_Int(Actual, Expected, TEXT("Ints should match"));
    AssertEqual_Float(Actual, Expected, TEXT("Floats should match"), Tolerance);
    AssertEqual_Vector(Actual, Expected, TEXT("Vectors should match"), Tolerance);
    AssertEqual_Rotator(Actual, Expected, TEXT("Rotators should match"), Tolerance);
    AssertEqual_Transform(Actual, Expected, TEXT("Transforms should match"));
    AssertEqual_String(Actual, Expected, TEXT("Strings should match"));

    // After all assertions
    FinishTest(EFunctionalTestResult::Succeeded, TEXT("All checks passed"));
}
```

---

## Network Functional Tests

For testing replicated gameplay:

```cpp
UCLASS()
class AMyNetFunctionalTest : public AFunctionalTest
{
    GENERATED_BODY()

public:
    virtual void StartTest() override
    {
        Super::StartTest();

        // This test must run in PIE with NumClients > 1
        // Check authority
        if (HasAuthority())
        {
            // Server-side test logic
            ServerSetup();
        }
        else
        {
            // Client-side verification
            ClientVerify();
        }
    }

    void ServerSetup()
    {
        // Spawn replicated actor, trigger RPC, etc.
        AMyReplicatedActor* Actor = GetWorld()->SpawnActor<AMyReplicatedActor>();
        Actor->ServerDoAction();

        // Wait for replication, then verify on client
        GetWorldTimerManager().SetTimer(TimerHandle, [this]()
        {
            FinishTest(EFunctionalTestResult::Succeeded, TEXT("Server setup complete"));
        }, 2.0f, false);
    }

    void ClientVerify()
    {
        // Verify replicated state on client
        GetWorldTimerManager().SetTimer(TimerHandle, [this]()
        {
            TArray<AActor*> Actors;
            UGameplayStatics::GetAllActorsOfClass(GetWorld(), AMyReplicatedActor::StaticClass(), Actors);

            if (Actors.Num() > 0)
            {
                FinishTest(EFunctionalTestResult::Succeeded, TEXT("Actor replicated to client"));
            }
            else
            {
                FinishTest(EFunctionalTestResult::Failed, TEXT("Actor not found on client"));
            }
        }, 3.0f, false);
    }
};
```

Run with PIE configured for multiple clients:
```
-ExecCmds="Automation RunTests FunctionalTests" -NumClients=2
```

---

## Screenshot Comparison Tests

### AFunctionalScreenshotTest (UE built-in)

Captures a screenshot and compares it against a ground truth image.

```cpp
UCLASS()
class AMyScreenshotTest : public AFunctionalTest
{
    GENERATED_BODY()

public:
    UPROPERTY(EditAnywhere)
    FAutomationScreenshotOptions ScreenshotOptions;

    virtual void StartTest() override
    {
        Super::StartTest();

        // Configure screenshot options
        ScreenshotOptions.Tolerance = EComparisonTolerance::Low;
        ScreenshotOptions.bIgnoreAntiAliasing = true;
        ScreenshotOptions.bIgnoreColors = false;

        // Request screenshot comparison
        FAutomationTestFramework::Get().OnScreenshotTakenAndCompared.AddUObject(
            this, &AMyScreenshotTest::OnComparisonComplete);

        // Take the screenshot
        const FString ScreenshotName = TEXT("MyFeature_ExpectedView");
        FScreenshotRequest::RequestScreenshot(ScreenshotName, false, false);
    }

    void OnComparisonComplete(const FAutomationScreenshotCompareResults& Results)
    {
        if (Results.bWasNew)
        {
            // First run -- ground truth saved
            FinishTest(EFunctionalTestResult::Succeeded, TEXT("Ground truth saved"));
        }
        else if (Results.bWasSimilar)
        {
            FinishTest(EFunctionalTestResult::Succeeded, TEXT("Screenshot matches"));
        }
        else
        {
            FinishTest(EFunctionalTestResult::Failed,
                FString::Printf(TEXT("Screenshot differs: %.2f%% mismatch"), Results.MaxLocalDifference));
        }
    }
};
```

### Ground Truth Workflow

1. Run the test once to capture the ground truth image.
2. Ground truth images are saved to `<Project>/Test/Screenshots/<Platform>/`.
3. Subsequent runs compare against the ground truth.
4. Update ground truth by deleting old images and re-running.

---

## Performance Capture Tests

Functional tests can capture performance metrics:

```cpp
UCLASS()
class APerfCaptureTest : public AFunctionalTest
{
    GENERATED_BODY()

    float AccumulatedTime = 0.0f;
    int32 FrameCount = 0;
    float CaptureDuration = 5.0f;

public:
    virtual void StartTest() override
    {
        Super::StartTest();
        AccumulatedTime = 0.0f;
        FrameCount = 0;
    }

    virtual void Tick(float DeltaSeconds) override
    {
        Super::Tick(DeltaSeconds);

        if (!IsRunning()) return;

        AccumulatedTime += DeltaSeconds;
        FrameCount++;

        if (AccumulatedTime >= CaptureDuration)
        {
            float AvgFPS = FrameCount / AccumulatedTime;
            float AvgFrameTime = (AccumulatedTime / FrameCount) * 1000.0f;

            LogStep(FString::Printf(TEXT("Avg FPS: %.1f, Avg Frame Time: %.2f ms"), AvgFPS, AvgFrameTime));

            if (AvgFPS >= 30.0f)
            {
                FinishTest(EFunctionalTestResult::Succeeded,
                    FString::Printf(TEXT("Performance OK: %.1f FPS"), AvgFPS));
            }
            else
            {
                FinishTest(EFunctionalTestResult::Failed,
                    FString::Printf(TEXT("Performance below threshold: %.1f FPS"), AvgFPS));
            }
        }
    }
};
```

---

## Blueprint Functional Tests

You can create functional tests entirely in Blueprints:

1. Create a new Blueprint class derived from `AFunctionalTest`.
2. Override **Prepare Test**, **Start Test**, **Is Ready** in the Event Graph.
3. Call **Finish Test** with the appropriate result.
4. Place the Blueprint actor in a test map.

### Blueprint Assertions

The following assertion nodes are available in Blueprint:
- **Assert True / Assert False**
- **Assert Is Valid**
- **Assert Equal (Int, Float, Vector, Rotator, String, Name, Object)**

### Blueprint Test Example

1. Create `BP_FT_DoorOpens` (parent: `AFunctionalTest`).
2. In Event Graph:
   - On **Start Test**: Find the door actor, call `Open()`.
   - Set a timer for 2 seconds.
   - On timer: **Assert True** that `Door.IsOpen`, then **Finish Test** with Succeeded.
3. Place `BP_FT_DoorOpens` in `FT_Doors` map alongside the door actor.

---

## CI Integration

### Running Functional Tests in CI

```bash
#!/bin/bash
# CI script for functional tests

UE_EDITOR="path/to/UnrealEditor-Cmd"
PROJECT="path/to/MyProject.uproject"
RESULTS_DIR="TestResults"

mkdir -p "$RESULTS_DIR"

# Run all functional tests
"$UE_EDITOR" "$PROJECT" \
    -ExecCmds="Automation RunTests FunctionalTests; Quit" \
    -Unattended -NullRHI -NoSound -NoSplash \
    -Log="$RESULTS_DIR/FunctionalTests.log" \
    -ReportExportPath="$RESULTS_DIR/report.json" \
    -NOSPLASH -NOSOUND 2>&1

EXIT_CODE=$?

# Parse results
if [ $EXIT_CODE -eq 0 ]; then
    echo "All functional tests passed"
else
    echo "Functional tests failed (exit code: $EXIT_CODE)"
    cat "$RESULTS_DIR/FunctionalTests.log" | grep -E "(Error|Failed|Success)"
    exit 1
fi
```

### BuildGraph Integration

```xml
<Node Name="Functional Tests" Requires="Compile Editor">
    <Property Name="TestMap" Value="/Game/Tests/Maps/FT_AllTests" />
    <Command Name="RunAutomationTests"
             Arguments="-Project=$(ProjectPath) -Filter=FunctionalTests -NullRHI -Unattended"
             />
</Node>
```

### JUnit-Style Report Output

To integrate with CI dashboards (Jenkins, TeamCity, etc.), export results in a parseable format:

```bash
"$UE_EDITOR" "$PROJECT" \
    -ExecCmds="Automation RunTests FunctionalTests; Quit" \
    -Unattended -NullRHI \
    -ReportExportPath="TestResults/junit-report.xml" \
    -ReportType=junit
```

---

## Best Practices

1. **One test per behavior.** Each `AFunctionalTest` actor should verify one specific behavior. Combine related tests in the same map, but keep them independent.
2. **Always call FinishTest.** A test that never finishes will time out and appear as a failure with an unhelpful message.
3. **Set reasonable timeouts.** Override `TimeLimit` (default 60 seconds) in the Details panel. Short timeouts catch hangs early.
4. **Use PrepareTest for setup.** Do not put setup logic in `BeginPlay`; it runs before the test framework is ready.
5. **Keep test maps minimal.** Only include actors needed for the test. Large maps slow down test execution.
6. **Version ground truth screenshots.** Check them into source control so CI can compare against them.
7. **Tag tests by category.** Use the test name hierarchy (`Project.Category.Feature.TestName`) so CI can filter by category.
8. **Test maps should be standalone.** Do not rely on streaming levels or World Partition for test maps unless you are specifically testing those features.
