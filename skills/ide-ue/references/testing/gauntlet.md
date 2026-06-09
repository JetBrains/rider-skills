# Gauntlet Testing Framework

Gauntlet is Unreal Engine's system-level test automation framework for running full game instances end-to-end. It launches packaged builds or editor sessions, drives them through scripted states, and reports results. Use Gauntlet for boot tests, map cycle tests, soak tests, performance benchmarks, and any scenario that requires a complete running game rather than an in-editor unit test.

---

## Architecture

Gauntlet operates as an external controller process that launches and manages one or more Unreal game instances. The architecture has three layers:

```
Gauntlet.exe (Controller)
  |
  +-- Gauntlet Test Node (C# test script)
  |     |
  |     +-- Unreal Game Instance (client / server / editor)
  |           |
  |           +-- UGauntletTestController (C++ in-game state machine)
```

### Key Components

| Component | Language | Role |
|-----------|----------|------|
| **Gauntlet.exe** | C# | External process that orchestrates test execution, launches builds, collects results |
| **Test Node** | C# | Defines what build to launch, command-line args, pass/fail criteria, timeout |
| **UGauntletTestController** | C++ | In-game actor that drives test logic through states |
| **Gauntlet States** | C++ | Discrete phases of a test (e.g., WaitForMap, RunTest, Complete) |

### Data Flow

1. Gauntlet.exe reads the test node configuration.
2. It launches the game build with specific command-line arguments (including `-ExecCmds` to activate the test controller).
3. The `UGauntletTestController` in the running game drives through states.
4. The controller writes results to the log and sets the exit code.
5. Gauntlet.exe collects logs, parses results, and reports pass/fail.

---

## UGauntletTestController

The in-game controller is the C++ class that runs inside the Unreal process. It inherits from `UGauntletTestController` and implements a state machine.

```cpp
#include "GauntletTestController.h"

UCLASS()
class MYPROJECT_API UMyGauntletTest : public UGauntletTestController
{
    GENERATED_BODY()

public:
    virtual void OnInit() override;
    virtual void OnTick(float DeltaTime) override;
    virtual void OnStateChange(FName OldState, FName NewState) override;
    virtual void OnPostMapChange(UWorld* World) override;
};
```

### Lifecycle

1. **`OnInit()`** -- Called once when the controller is created. Set up initial state, configure timers.
2. **`OnTick(float DeltaTime)`** -- Called every frame. Drive the test state machine forward.
3. **`OnStateChange(FName OldState, FName NewState)`** -- Called when the state machine transitions. Use for state-specific setup/teardown.
4. **`OnPostMapChange(UWorld* World)`** -- Called after a map transition completes. Useful for map cycle tests.

### Ending a Test

```cpp
// Mark the test as passed and request exit
EndTest(0); // Exit code 0 = success

// Mark the test as failed
EndTest(1); // Non-zero = failure

// Mark with a specific error message
SetErrorMessage(TEXT("Player health did not regenerate within timeout"));
EndTest(1);
```

---

## Writing Gauntlet Test Modules (C#)

Test nodes are C# classes that configure how the game is launched and how results are evaluated. They live in the `Gauntlet/` directory structure of your project or in the engine's `AutomationTool` scripts.

### Minimal Test Node

```csharp
using Gauntlet;
using AutomationTool;
using UnrealBuildTool;

public class MyBootTest : UnrealTestNode<UnrealTestConfiguration>
{
    public MyBootTest(UnrealTestContext InContext) : base(InContext)
    {
    }

    public override UnrealTestConfiguration GetConfiguration()
    {
        var Config = base.GetConfiguration();

        // Launch a single client
        var ClientRole = Config.RequireRole(UnrealTargetRole.Client);
        ClientRole.Controllers.Add("MyGauntletTest");

        // Set timeout (seconds)
        Config.MaxDuration = 120;

        return Config;
    }
}
```

### Test Node with Server and Clients

```csharp
public class MyNetworkTest : UnrealTestNode<UnrealTestConfiguration>
{
    public MyNetworkTest(UnrealTestContext InContext) : base(InContext)
    {
    }

    public override UnrealTestConfiguration GetConfiguration()
    {
        var Config = base.GetConfiguration();

        // Dedicated server
        var ServerRole = Config.RequireRole(UnrealTargetRole.Server);
        ServerRole.Controllers.Add("MyNetGauntletServer");

        // Two clients
        var ClientRole = Config.RequireRole(UnrealTargetRole.Client);
        ClientRole.Controllers.Add("MyNetGauntletClient");
        Config.RequireRoleCount(UnrealTargetRole.Client, 2);

        Config.MaxDuration = 300;

        return Config;
    }
}
```

### Customizing Launch Arguments

```csharp
public override UnrealTestConfiguration GetConfiguration()
{
    var Config = base.GetConfiguration();

    var ClientRole = Config.RequireRole(UnrealTargetRole.Client);
    ClientRole.Controllers.Add("MyGauntletTest");

    // Add custom command-line arguments
    ClientRole.CommandLineParams.Add("ResX", "1920");
    ClientRole.CommandLineParams.Add("ResY", "1080");
    ClientRole.CommandLineParams.AddOrAppend("ExecCmds", "stat fps", ",");
    ClientRole.CommandLineParams.Add("Windowed");

    // Disable rendering for headless test
    ClientRole.CommandLineParams.Add("NullRHI");
    ClientRole.CommandLineParams.Add("NoSound");

    Config.MaxDuration = 60;

    return Config;
}
```

---

## Boot Test (Startup Verification)

The simplest Gauntlet test: verify the game starts, reaches the main menu, and exits cleanly.

### C++ Controller

```cpp
UCLASS()
class UBootTestController : public UGauntletTestController
{
    GENERATED_BODY()

    float ElapsedTime = 0.0f;
    float WaitAfterBoot = 5.0f;
    bool bMainMenuReached = false;

public:
    virtual void OnInit() override
    {
        UE_LOG(LogGauntlet, Display, TEXT("Boot test started. Waiting for main menu..."));
    }

    virtual void OnTick(float DeltaTime) override
    {
        if (!bMainMenuReached)
        {
            // Check if the main menu widget is visible or a specific map is loaded
            UWorld* World = GetWorld();
            if (World && World->GetMapName().Contains(TEXT("MainMenu")))
            {
                bMainMenuReached = true;
                UE_LOG(LogGauntlet, Display, TEXT("Main menu reached successfully."));
                ElapsedTime = 0.0f;
            }
        }
        else
        {
            ElapsedTime += DeltaTime;
            if (ElapsedTime >= WaitAfterBoot)
            {
                UE_LOG(LogGauntlet, Display, TEXT("Boot test passed. Exiting."));
                EndTest(0);
            }
        }
    }
};
```

### C# Test Node

```csharp
public class BootTest : UnrealTestNode<UnrealTestConfiguration>
{
    public BootTest(UnrealTestContext InContext) : base(InContext)
    {
    }

    public override UnrealTestConfiguration GetConfiguration()
    {
        var Config = base.GetConfiguration();
        var ClientRole = Config.RequireRole(UnrealTargetRole.Client);
        ClientRole.Controllers.Add("BootTestController");
        Config.MaxDuration = 120;
        return Config;
    }
}
```

---

## Map Cycle Tests

Map cycle tests load each map in sequence, verify it loads without errors, optionally run gameplay for a set duration, then advance to the next map.

### C++ Controller

```cpp
UCLASS()
class UMapCycleTestController : public UGauntletTestController
{
    GENERATED_BODY()

    TArray<FString> MapList;
    int32 CurrentMapIndex = 0;
    float TimeInCurrentMap = 0.0f;
    float TimePerMap = 30.0f;
    bool bMapReady = false;

public:
    virtual void OnInit() override
    {
        // Define the maps to cycle through
        MapList.Add(TEXT("/Game/Maps/Level_01"));
        MapList.Add(TEXT("/Game/Maps/Level_02"));
        MapList.Add(TEXT("/Game/Maps/Level_03"));
        MapList.Add(TEXT("/Game/Maps/MainMenu"));

        // Load the first map
        LoadNextMap();
    }

    void LoadNextMap()
    {
        if (CurrentMapIndex >= MapList.Num())
        {
            UE_LOG(LogGauntlet, Display, TEXT("All %d maps loaded successfully."), MapList.Num());
            EndTest(0);
            return;
        }

        bMapReady = false;
        TimeInCurrentMap = 0.0f;

        const FString& MapName = MapList[CurrentMapIndex];
        UE_LOG(LogGauntlet, Display, TEXT("Loading map %d/%d: %s"),
            CurrentMapIndex + 1, MapList.Num(), *MapName);

        UGameplayStatics::OpenLevel(GetWorld(), FName(*MapName));
    }

    virtual void OnPostMapChange(UWorld* World) override
    {
        bMapReady = true;
        UE_LOG(LogGauntlet, Display, TEXT("Map loaded: %s"), *World->GetMapName());
    }

    virtual void OnTick(float DeltaTime) override
    {
        if (!bMapReady)
        {
            return;
        }

        TimeInCurrentMap += DeltaTime;

        if (TimeInCurrentMap >= TimePerMap)
        {
            UE_LOG(LogGauntlet, Display, TEXT("Map %s: spent %.1f seconds, no errors. Advancing."),
                *MapList[CurrentMapIndex], TimeInCurrentMap);
            CurrentMapIndex++;
            LoadNextMap();
        }
    }
};
```

### Dynamic Map Discovery

Instead of hardcoding maps, discover them at runtime:

```cpp
virtual void OnInit() override
{
    // Find all maps in the project
    TArray<FAssetData> MapAssets;
    FAssetRegistryModule& AssetRegistry = FModuleManager::LoadModuleChecked<FAssetRegistryModule>("AssetRegistry");
    AssetRegistry.Get().GetAssetsByClass(UWorld::StaticClass()->GetClassPathName(), MapAssets);

    for (const FAssetData& Asset : MapAssets)
    {
        FString PackageName = Asset.PackageName.ToString();
        // Filter to game content maps only
        if (PackageName.StartsWith(TEXT("/Game/Maps/")))
        {
            MapList.Add(PackageName);
        }
    }

    UE_LOG(LogGauntlet, Display, TEXT("Discovered %d maps for cycle test."), MapList.Num());
    LoadNextMap();
}
```

---

## Performance Gauntlet Tests

Capture frame time, GPU time, and memory metrics over a sustained period.

### C++ Controller

```cpp
UCLASS()
class UPerfGauntletController : public UGauntletTestController
{
    GENERATED_BODY()

    float TestDuration = 60.0f;
    float ElapsedTime = 0.0f;
    float MinFPS = TNumericLimits<float>::Max();
    float MaxFrameTimeMs = 0.0f;
    float AccumulatedFrameTime = 0.0f;
    int32 FrameCount = 0;
    float TargetMinFPS = 30.0f;

public:
    virtual void OnInit() override
    {
        UE_LOG(LogGauntlet, Display, TEXT("Performance test starting. Duration: %.0fs, Target: %.0f FPS min"),
            TestDuration, TargetMinFPS);

        // Enable stat capture
        GEngine->Exec(GetWorld(), TEXT("stat startfile"));
    }

    virtual void OnTick(float DeltaTime) override
    {
        ElapsedTime += DeltaTime;
        FrameCount++;

        float FrameTimeMs = DeltaTime * 1000.0f;
        AccumulatedFrameTime += FrameTimeMs;

        if (FrameTimeMs > MaxFrameTimeMs)
        {
            MaxFrameTimeMs = FrameTimeMs;
        }

        float CurrentFPS = 1.0f / DeltaTime;
        if (CurrentFPS < MinFPS)
        {
            MinFPS = CurrentFPS;
        }

        if (ElapsedTime >= TestDuration)
        {
            // Stop stat capture
            GEngine->Exec(GetWorld(), TEXT("stat stopfile"));

            float AvgFrameTimeMs = AccumulatedFrameTime / FrameCount;
            float AvgFPS = 1000.0f / AvgFrameTimeMs;

            UE_LOG(LogGauntlet, Display, TEXT("=== Performance Results ==="));
            UE_LOG(LogGauntlet, Display, TEXT("Avg FPS: %.1f"), AvgFPS);
            UE_LOG(LogGauntlet, Display, TEXT("Min FPS: %.1f"), MinFPS);
            UE_LOG(LogGauntlet, Display, TEXT("Avg Frame Time: %.2f ms"), AvgFrameTimeMs);
            UE_LOG(LogGauntlet, Display, TEXT("Max Frame Time: %.2f ms"), MaxFrameTimeMs);
            UE_LOG(LogGauntlet, Display, TEXT("Total Frames: %d"), FrameCount);

            if (MinFPS >= TargetMinFPS)
            {
                UE_LOG(LogGauntlet, Display, TEXT("PASSED: Min FPS %.1f >= target %.1f"),
                    MinFPS, TargetMinFPS);
                EndTest(0);
            }
            else
            {
                SetErrorMessage(FString::Printf(
                    TEXT("FAILED: Min FPS %.1f < target %.1f"), MinFPS, TargetMinFPS));
                EndTest(1);
            }
        }
    }
};
```

### Memory Tracking Extension

```cpp
void LogMemoryStats()
{
    FPlatformMemoryStats MemStats = FPlatformMemory::GetStats();
    UE_LOG(LogGauntlet, Display, TEXT("Memory - Used Physical: %.2f MB, Peak Used: %.2f MB, Available: %.2f MB"),
        MemStats.UsedPhysical / (1024.0 * 1024.0),
        MemStats.PeakUsedPhysical / (1024.0 * 1024.0),
        MemStats.AvailablePhysical / (1024.0 * 1024.0));
}
```

---

## Custom Gauntlet States

For complex tests, use named states to structure the test flow as a state machine.

```cpp
UCLASS()
class UStateMachineGauntletController : public UGauntletTestController
{
    GENERATED_BODY()

    static const FName State_WaitForMap;
    static const FName State_SpawnActors;
    static const FName State_RunScenario;
    static const FName State_ValidateResults;
    static const FName State_Cleanup;

    float StateTimer = 0.0f;
    int32 EnemiesKilled = 0;

public:
    virtual void OnInit() override
    {
        SetState(State_WaitForMap);
    }

    virtual void OnStateChange(FName OldState, FName NewState) override
    {
        StateTimer = 0.0f;
        UE_LOG(LogGauntlet, Display, TEXT("State transition: %s -> %s"),
            *OldState.ToString(), *NewState.ToString());
    }

    virtual void OnTick(float DeltaTime) override
    {
        StateTimer += DeltaTime;
        FName CurrentState = GetCurrentState();

        if (CurrentState == State_WaitForMap)
        {
            TickWaitForMap();
        }
        else if (CurrentState == State_SpawnActors)
        {
            TickSpawnActors();
        }
        else if (CurrentState == State_RunScenario)
        {
            TickRunScenario(DeltaTime);
        }
        else if (CurrentState == State_ValidateResults)
        {
            TickValidateResults();
        }
        else if (CurrentState == State_Cleanup)
        {
            TickCleanup();
        }
    }

    void TickWaitForMap()
    {
        UWorld* World = GetWorld();
        if (World && World->HasBegunPlay())
        {
            SetState(State_SpawnActors);
        }
        else if (StateTimer > 30.0f)
        {
            SetErrorMessage(TEXT("Timed out waiting for map to load"));
            EndTest(1);
        }
    }

    void TickSpawnActors()
    {
        // Spawn test actors
        UWorld* World = GetWorld();
        for (int32 i = 0; i < 10; i++)
        {
            FVector SpawnLoc = FVector(FMath::RandRange(-1000.f, 1000.f), FMath::RandRange(-1000.f, 1000.f), 100.f);
            World->SpawnActor<AEnemyCharacter>(AEnemyCharacter::StaticClass(), &SpawnLoc);
        }
        SetState(State_RunScenario);
    }

    void TickRunScenario(float DeltaTime)
    {
        // Let gameplay run for 60 seconds
        if (StateTimer >= 60.0f)
        {
            SetState(State_ValidateResults);
        }
    }

    void TickValidateResults()
    {
        // Check gameplay outcomes
        if (EnemiesKilled >= 5)
        {
            UE_LOG(LogGauntlet, Display, TEXT("Scenario passed: %d enemies defeated"), EnemiesKilled);
            SetState(State_Cleanup);
        }
        else
        {
            SetErrorMessage(FString::Printf(TEXT("Only %d/5 enemies defeated"), EnemiesKilled));
            EndTest(1);
        }
    }

    void TickCleanup()
    {
        EndTest(0);
    }
};

const FName UStateMachineGauntletController::State_WaitForMap(TEXT("WaitForMap"));
const FName UStateMachineGauntletController::State_SpawnActors(TEXT("SpawnActors"));
const FName UStateMachineGauntletController::State_RunScenario(TEXT("RunScenario"));
const FName UStateMachineGauntletController::State_ValidateResults(TEXT("ValidateResults"));
const FName UStateMachineGauntletController::State_Cleanup(TEXT("Cleanup"));
```

---

## Command-Line Arguments

### Running Gauntlet from the Command Line

```bash
# Basic Gauntlet invocation via RunUAT
RunUAT.bat RunUnreal \
    -project=MyProject \
    -test=MyBootTest \
    -build=path/to/build \
    -platform=Win64 \
    -configuration=Development

# Specify a specific controller directly (without a C# test node)
RunUAT.bat RunUnreal \
    -project=MyProject \
    -test=UnrealTest \
    -build=path/to/build \
    -gauntlet.controller=BootTestController \
    -platform=Win64

# Run with editor instead of packaged build
RunUAT.bat RunUnreal \
    -project=path/to/MyProject.uproject \
    -test=MyBootTest \
    -UseEditor \
    -platform=Win64

# Multiple test passes
RunUAT.bat RunUnreal \
    -project=MyProject \
    -test=MapCycleTest+BootTest+PerfTest \
    -build=path/to/build \
    -platform=Win64
```

### Common Gauntlet Arguments

| Argument | Description |
|----------|-------------|
| `-project=<Name>` | Project name or path to `.uproject` |
| `-test=<TestName>` | Name of the C# test node class |
| `-build=<Path>` | Path to the packaged build directory |
| `-platform=<Platform>` | Target platform (Win64, Linux, Mac, etc.) |
| `-configuration=<Config>` | Build configuration (Development, Shipping, Test) |
| `-UseEditor` | Run in editor instead of packaged build |
| `-MaxDuration=<Seconds>` | Override the test timeout |
| `-gauntlet.controller=<Name>` | Specify the UGauntletTestController class |
| `-gauntlet.heartbeatperiod=<Seconds>` | Heartbeat interval for detecting hangs |
| `-nullrhi` | Run without rendering (headless) |
| `-unattended` | Suppress dialogs and user prompts |
| `-nosound` | Disable audio |
| `-log` | Enable logging |
| `-verbose` | Verbose log output |

### Game Instance Arguments (Passed to Unreal Process)

These are appended to the launched game's command line:

```bash
# Set specific map
-gauntlet.map=/Game/Maps/TestArena

# Set resolution
-ResX=1280 -ResY=720 -Windowed

# Enable specific stat groups for perf tests
-ExecCmds="stat unit,stat fps"
```

---

## Integration with Build Systems

### Jenkins Pipeline

```groovy
pipeline {
    agent { label 'unreal-build' }

    parameters {
        string(name: 'PROJECT_PATH', defaultValue: 'D:/Projects/MyProject')
        string(name: 'BUILD_PATH', defaultValue: 'D:/Builds/MyProject')
        choice(name: 'TEST_SUITE', choices: ['BootTest', 'MapCycleTest', 'PerfGauntlet', 'FullSuite'])
    }

    stages {
        stage('Build') {
            steps {
                bat """
                    RunUAT.bat BuildCookRun ^
                        -project=${params.PROJECT_PATH}/MyProject.uproject ^
                        -platform=Win64 ^
                        -clientconfig=Development ^
                        -cook -stage -pak -archive ^
                        -archivedirectory=${params.BUILD_PATH}
                """
            }
        }

        stage('Gauntlet Tests') {
            steps {
                bat """
                    RunUAT.bat RunUnreal ^
                        -project=MyProject ^
                        -test=${params.TEST_SUITE} ^
                        -build=${params.BUILD_PATH}/WindowsClient ^
                        -platform=Win64 ^
                        -configuration=Development ^
                        -log ^
                        -unattended
                """
            }
            post {
                always {
                    // Archive logs
                    archiveArtifacts artifacts: '**/Saved/Logs/*.log', allowEmptyArchive: true
                    // Publish test results if JUnit output is generated
                    junit allowEmptyResults: true, testResults: '**/TestResults/*.xml'
                }
            }
        }
    }
}
```

### TeamCity Build Configuration

```xml
<build-type id="MyProject_GauntletTests">
    <name>Gauntlet Tests</name>
    <build-runners>
        <runner id="gauntlet" type="simpleRunner">
            <parameters>
                <param name="command.executable" value="RunUAT.bat" />
                <param name="command.parameters">
                    RunUnreal
                    -project=MyProject
                    -test=%test.suite%
                    -build=%build.path%
                    -platform=Win64
                    -configuration=Development
                    -unattended
                    -log
                </param>
                <param name="teamcity.step.mode" value="default" />
            </parameters>
        </runner>
    </build-runners>
    <parameters>
        <param name="test.suite" value="BootTest" spec="select data_1='BootTest' data_2='MapCycleTest' data_3='PerfGauntlet' data_4='FullSuite'" />
        <param name="build.path" value="%system.teamcity.build.checkoutDir%/Build/WindowsClient" />
    </parameters>
    <artifact-paths>
        Saved/Logs/*.log => logs.zip
        TestResults/**/* => test-results.zip
    </artifact-paths>
</build-type>
```

### BuildGraph Integration

```xml
<?xml version='1.0' ?>
<BuildGraph xmlns="http://www.epicgames.com/BuildGraph" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <Option Name="TestSuite" DefaultValue="BootTest" Description="Gauntlet test suite to run" />
    <Option Name="ProjectPath" DefaultValue="" Description="Path to the .uproject file" />

    <Agent Name="Test Agent" Type="Win64">

        <Node Name="Cook Game" Produces="#CookedGame">
            <Cook Project="$(ProjectPath)" Platform="Win64" />
        </Node>

        <Node Name="Stage Game" Requires="#CookedGame" Produces="#StagedGame">
            <Stage Project="$(ProjectPath)" Platform="Win64"
                   StagingDirectory="$(RootDir)/Staging" />
        </Node>

        <Node Name="Boot Test" Requires="#StagedGame">
            <Command Name="RunUnreal"
                     Arguments="-project=$(ProjectPath) -test=BootTest -build=$(RootDir)/Staging -platform=Win64 -unattended -nullrhi" />
        </Node>

        <Node Name="Map Cycle Test" Requires="#StagedGame">
            <Command Name="RunUnreal"
                     Arguments="-project=$(ProjectPath) -test=MapCycleTest -build=$(RootDir)/Staging -platform=Win64 -unattended" />
        </Node>

        <Node Name="Performance Test" Requires="#StagedGame">
            <Command Name="RunUnreal"
                     Arguments="-project=$(ProjectPath) -test=PerfGauntlet -build=$(RootDir)/Staging -platform=Win64 -unattended" />
        </Node>

        <Node Name="Full Gauntlet Suite" Requires="Boot Test;Map Cycle Test;Performance Test">
            <!-- Aggregate node that depends on all test nodes -->
            <Log Message="All Gauntlet tests completed successfully." />
        </Node>

    </Agent>

</BuildGraph>
```

---

## Running Gauntlet Tests Locally

### Quick Local Run (Editor Mode)

The fastest way to iterate on a Gauntlet controller locally is to run in editor mode, which skips the cook/package step:

```bash
# Run boot test in editor
RunUAT.bat RunUnreal \
    -project=path/to/MyProject.uproject \
    -test=BootTest \
    -UseEditor \
    -platform=Win64 \
    -log

# Run with specific map
RunUAT.bat RunUnreal \
    -project=path/to/MyProject.uproject \
    -test=UnrealTest \
    -UseEditor \
    -gauntlet.controller=MapCycleTestController \
    -gauntlet.map=/Game/Maps/TestArena \
    -platform=Win64
```

### Direct Editor Launch (Without RunUAT)

For rapid iteration, launch the editor directly with Gauntlet arguments:

```bash
UnrealEditor.exe MyProject.uproject \
    -ExecCmds="Automation RunTests Gauntlet" \
    -gauntlet \
    -gauntlet.controller=BootTestController \
    -Unattended -Log -NullRHI
```

### Local Packaged Build Test

```bash
# Step 1: Package the game
RunUAT.bat BuildCookRun \
    -project=path/to/MyProject.uproject \
    -platform=Win64 -clientconfig=Development \
    -cook -stage -pak

# Step 2: Run Gauntlet against the package
RunUAT.bat RunUnreal \
    -project=MyProject \
    -test=BootTest \
    -build=path/to/Staging/Windows \
    -platform=Win64 \
    -log
```

---

## Module Setup

### Required Modules

To use Gauntlet controllers in your project, add the dependency in your `Build.cs`:

```csharp
public class MyProject : ModuleRules
{
    public MyProject(ReadOnlyTargetRules Target) : base(Target)
    {
        // ... existing config ...

        PrivateDependencyModuleNames.AddRange(new string[]
        {
            "Gauntlet",   // UGauntletTestController and related classes
        });
    }
}
```

### Plugin Requirement

Gauntlet is part of the engine's automation tooling. Ensure the **Gauntlet** plugin is enabled in your `.uproject` if it does not appear automatically:

```json
{
    "Plugins": [
        {
            "Name": "Gauntlet",
            "Enabled": true
        }
    ]
}
```

---

## Best Practices

1. **Start with boot tests.** Before writing complex Gauntlet scenarios, ensure your project passes a basic boot test. This catches startup crashes, missing assets, and configuration errors early.

2. **Set conservative timeouts.** Map loading times vary by machine. Set `MaxDuration` to at least 2x the expected runtime. A test that times out gives less useful information than one that fails with a clear error.

3. **Log liberally in controllers.** Use `UE_LOG(LogGauntlet, Display, ...)` at every state transition and decision point. Gauntlet tests run headless in CI -- logs are your primary debugging tool.

4. **Use exit codes consistently.** `EndTest(0)` for success, `EndTest(1)` for failure. CI systems rely on exit codes to gate deployments.

5. **Keep state logic in `OnTick`, not timers.** The state machine pattern with `OnTick` is easier to debug than scattered `FTimerHandle` callbacks. Each tick checks the current state and advances when conditions are met.

6. **Test the test locally first.** Use `-UseEditor` mode for fast iteration before running against a packaged build. Editor mode catches most logic errors without the 10+ minute cook step.

7. **Separate concerns across test nodes.** One test node per scenario (boot, map cycle, perf). Running all scenarios in a single monolithic test makes failure diagnosis harder and prevents parallel execution in CI.

8. **Capture artifacts.** Configure CI to archive `Saved/Logs/`, crash dumps, and any performance CSV output. Flaky Gauntlet failures are common and artifacts from the failing run are essential for diagnosis.

9. **Use heartbeat monitoring.** Set `-gauntlet.heartbeatperiod` so the controller process detects hangs (infinite loops, deadlocks) instead of waiting for the full timeout.

10. **Pin map lists for reproducibility.** Dynamic map discovery is convenient but makes test results non-deterministic if maps are added or removed. For CI, use an explicit list and update it deliberately.
