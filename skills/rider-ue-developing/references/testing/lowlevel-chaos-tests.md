# Low-Level Tests and ChaosTestHarness

Unreal Engine provides two Catch2-based testing frameworks for low-level and physics code: **LowLevelTestsRunner** (general purpose) and **ChaosTestHarness** (physics-specific). These run outside the normal Automation Framework — no `FAutomationTestBase`, no Session Frontend.

---

## When to Use

| Framework | Use When |
|-----------|----------|
| **LowLevelTestsRunner** | Testing core C++ logic with no UObject dependency, or modules that don't link full Engine |
| **ChaosTestHarness** | Testing Chaos physics simulation, collision, constraints, or solvers |
| **Automation Framework / CQTest** | Testing game code that requires UObject, UWorld, GEngine |

---

## LowLevelTestsRunner

**Module:** `LowLevelTestsRunner`
**Header:** `#include "TestHarness.h"`
**Backend:** Catch2

### Basic Test Pattern

```cpp
#include "TestHarness.h"

TEST_CASE("FMyMath::Clamp returns value within range")
{
    CHECK(FMyMath::Clamp(5.0f, 0.0f, 10.0f) == 5.0f);
    CHECK(FMyMath::Clamp(-1.0f, 0.0f, 10.0f) == 0.0f);
    CHECK(FMyMath::Clamp(11.0f, 0.0f, 10.0f) == 10.0f);
}

TEST_CASE("FMyContainer::Find returns correct index")
{
    FMyContainer Container;
    Container.Add(TEXT("Alpha"));
    Container.Add(TEXT("Beta"));

    int32 Index = Container.Find(TEXT("Beta"));
    REQUIRE(Index == 1);
}
```

### Assertion Macros

| Macro | Behavior |
|-------|----------|
| `CHECK(expr)` | Logs failure, continues test |
| `REQUIRE(expr)` | Logs failure, aborts test case |
| `CHECK_EQUAL(Actual, Expected)` | `CHECK` with equality message |
| `REQUIRE_EQUAL(Actual, Expected)` | `REQUIRE` with equality message |
| `CHECK_MESSAGE(Desc, expr)` | `CHECK` with description |
| `REQUIRE_MESSAGE(Desc, expr)` | `REQUIRE` with description |
| `VERIFY(Desc, expr)` | `CHECK` with `INFO` output |
| `TEST_EQUAL(Actual, Expected)` | `INFO` + `CHECK` equality |
| `TEST_NOT_EQUAL(Actual, Expected)` | `INFO` + `CHECK` inequality |
| `TEST_NULL(Ptr)` | Checks pointer is null |
| `TEST_NOT_NULL(Ptr)` | Checks pointer is not null |
| `TEST_VALID(UObj)` | Checks `IsValid(UObj)` |
| `TEST_INVALID(UObj)` | Checks `!IsValid(UObj)` |
| `ADD_WARNING(Msg)` | Log a warning (non-fatal) |
| `ADD_ERROR(Msg)` | Log an error (non-fatal) |

### Sections and Scenarios

```cpp
TEST_CASE("Pathfinder")
{
    FPathfinder Pf;

    SECTION("Empty graph returns no path")
    {
        TArray<FVector> Path = Pf.FindPath(FVector::ZeroVector, FVector(100, 0, 0));
        CHECK(Path.IsEmpty());
    }

    SECTION("Straight line with no obstacles")
    {
        Pf.AddWaypoint(FVector::ZeroVector);
        Pf.AddWaypoint(FVector(100, 0, 0));
        TArray<FVector> Path = Pf.FindPath(FVector::ZeroVector, FVector(100, 0, 0));
        REQUIRE(!Path.IsEmpty());
        CHECK_EQUAL(Path.Num(), 2);
    }
}
```

### Fixtures (Test Methods)

```cpp
struct FMyFixture
{
    FMyFixture() { /* setup */ }
    ~FMyFixture() { /* teardown */ }

    TUniquePtr<FMySystem> System = MakeUnique<FMySystem>();
};

TEST_CASE_METHOD(FMyFixture, "FMySystem processes events")
{
    System->Enqueue(FEvent{EType::Attack});
    CHECK(System->GetPendingCount() == 1);
    System->Flush();
    CHECK(System->GetPendingCount() == 0);
}
```

### Disabling Tests

```cpp
DISABLED_TEST_CASE("Broken test — tracked in UE-12345")
{
    // Not compiled out, but skipped at runtime
}
```

### UE Type Support

`TestHarness.h` provides `Catch2::StringMaker<>` specializations for common UE types so assertion failure output is readable:
- `FString`, `FName`, `FText`
- `FVector`, `FRotator`, `FQuat`, `FTransform`
- `TSharedPtr<T>`
- `TTuple<K, V>`
- `TMap<K, V>` equality operator

### Module Setup

```csharp
public class MyCoreTests : ModuleRules
{
    public MyCoreTests(ReadOnlyTargetRules Target) : base(Target)
    {
        PCHUsage = PCHUsageMode.UseExplicitOrSharedPCHs;

        PrivateDependencyModuleNames.AddRange(new string[]
        {
            "Core",
            "LowLevelTestsRunner",   // Catch2 harness
            "MyCore",                // Module under test
        });
    }
}
```

---

## ChaosTestHarness

**Module:** `ChaosTestHarness`
**Header:** `#include "Chaos/LowLevelTest/ChaosTestHarness.h"`
**Backend:** Catch2 + physics helpers

ChaosTestHarness extends LowLevelTestsRunner with physics-specific matchers, string makers, and scene setup helpers.

### Basic Physics Test

```cpp
#include "Chaos/LowLevelTest/ChaosTestHarness.h"

TEST_CASE("Sphere collision detects overlap")
{
    FChaosTestScene Scene;
    Scene.Initialize();

    // Add rigid bodies
    auto SphereA = Scene.AddSphere(FVector::ZeroVector, 50.0f);
    auto SphereB = Scene.AddSphere(FVector(60, 0, 0), 50.0f); // Overlapping

    Scene.Simulate(1.0f / 60.0f);

    CHECK(Scene.HasCollision(SphereA, SphereB));
}
```

### Floating Point Matchers

Catch2's `WithinAbs` and `WithinRel` matchers are available for physics tolerances:

```cpp
#include "Chaos/LowLevelTest/ChaosTestHarness.h"

TEST_CASE("Rigid body velocity after impulse")
{
    FChaosTestScene Scene;
    Scene.Initialize();

    auto Body = Scene.AddBox(FVector::ZeroVector, FVector(100, 100, 100));
    Scene.ApplyImpulse(Body, FVector(1000, 0, 0));
    Scene.Simulate(1.0f / 60.0f);

    FVector Velocity = Scene.GetLinearVelocity(Body);

    // WithinAbs(Expected, Tolerance)
    CHECK_THAT(Velocity.X, Catch::Matchers::WithinAbs(10.0f, 1.0f));
    CHECK_THAT(Velocity.Y, Catch::Matchers::WithinAbs(0.0f, 0.001f));
}
```

### Benchmarks

Catch2 benchmark support is included:

```cpp
TEST_CASE("Broadphase benchmark")
{
    FChaosTestScene Scene;
    Scene.Initialize();
    // Add many bodies...

    BENCHMARK("1000 static bodies broadphase")
    {
        Scene.UpdateBroadphase();
    };
}
```

### Generator-Based Tests (Parameterized)

```cpp
#include "Chaos/LowLevelTest/ChaosTestHarness.h"

TEST_CASE("Restitution varies by coefficient")
{
    float Restitution = GENERATE(0.0f, 0.5f, 1.0f);

    FChaosTestScene Scene;
    auto Body = Scene.AddSphere(FVector(0, 0, 1000), 50.0f);
    Scene.SetRestitution(Body, Restitution);
    Scene.Simulate(10.0f);

    float BounceHeight = Scene.GetActorLocation(Body).Z;

    if (Restitution == 0.0f)
        CHECK(BounceHeight < 10.0f);  // No bounce
    else if (Restitution == 1.0f)
        CHECK_THAT(BounceHeight, Catch::Matchers::WithinRel(1000.0f, 0.05f)); // Full bounce
}
```

### Log Suppression

Physics code often logs expected warnings during boundary-condition tests. Suppress them to avoid test noise:

```cpp
TEST_CASE("Degenerate geometry does not crash")
{
    FChaosTestErrorLogSuppressor SuppressLogs; // RAII: suppresses for scope

    FChaosTestScene Scene;
    Scene.Initialize();

    // This would normally log a warning about degenerate convex hull
    auto Body = Scene.AddConvexHull(TArray<FVector>{}); // Empty — degenerate
    Scene.Simulate(1.0f / 60.0f);

    // No crash is the pass condition
    CHECK(true);
}
```

### Custom Matchers

`ChaosTestMatchers.h` provides physics-specific matchers for comparing simulation results with appropriate tolerances. Check that file for the current matcher set — they vary by engine version.

### Module Setup

```csharp
public class MyChaosTests : ModuleRules
{
    public MyChaosTests(ReadOnlyTargetRules Target) : base(Target)
    {
        PCHUsage = PCHUsageMode.UseExplicitOrSharedPCHs;

        PrivateDependencyModuleNames.AddRange(new string[]
        {
            "Core",
            "CoreUObject",
            "Chaos",
            "ChaosTestHarness",      // Physics test helpers
            "LowLevelTestsRunner",   // Catch2 runner
        });
    }
}
```

---

## Running Low-Level / Chaos Tests

Low-level tests are NOT run via the standard Automation Framework or Session Frontend. They compile into a separate executable.

### Build and Run

```bash
# Build the test target (creates a standalone test executable)
RunUBT.bat MyProjectTests Win64 Development

# Run all tests
MyProjectTests.exe

# Run a specific test case by name
MyProjectTests.exe "FMyMath::Clamp returns value within range"

# Run tests matching a tag
MyProjectTests.exe "[Physics]"

# List all tests
MyProjectTests.exe --list-tests

# Output in JUnit XML (for CI)
MyProjectTests.exe --reporter junit --out TestResults.xml

# Verbose output
MyProjectTests.exe --reporter console -v high
```

### Target Setup

Low-level tests require a separate `*.Target.cs` file of type `TargetType.Program`:

```csharp
// MyProjectTests.Target.cs
public class MyProjectTestsTarget : TargetRules
{
    public MyProjectTestsTarget(TargetInfo Target) : base(Target)
    {
        Type = TargetType.Program;
        IncludeOrderVersion = EngineIncludeOrderVersion.Latest;

        // Include the test runner
        ExtraModuleNames.Add("LowLevelTestsRunner");
        ExtraModuleNames.Add("MyProjectTests"); // Your test module
    }
}
```

---

## Differences from Automation Framework

| Aspect | Automation / CQTest | LowLevel / Chaos |
|--------|--------------------|--------------------|
| Discovery | Session Frontend, `-ExecCmds="Automation RunTests"` | Standalone executable, Catch2 CLI |
| World | Requires UWorld setup | No UWorld (or minimal) |
| UObject support | Full UObject system | Limited or none |
| Async | Latent commands, multi-frame | Synchronous by default |
| Performance | Can measure FPS, frame time | Catch2 BENCHMARK |
| CI integration | `-ReportExportPath` JSON | Catch2 JUnit reporter |
| Setup overhead | Editor startup (~30s) | Near-instant |

---

## Best Practices

1. **Use LowLevelTestsRunner for pure C++ logic** that has no UObject or engine subsystem dependencies — tests start in milliseconds instead of waiting for the editor to boot.

2. **Prefer `CHECK` over `REQUIRE` inside sections.** `REQUIRE` aborts the entire test case; `CHECK` lets the section finish and report all failures.

3. **Use `WithinAbs` for physics assertions, not exact equality.** Floating-point simulation diverges by design; tight tolerances cause flaky CI failures.

4. **Use `FChaosTestErrorLogSuppressor`** when testing degenerate or error-path physics — expected warnings will fail test runs if left unsuppressed.

5. **Name tests as sentences.** Catch2 displays the test name as the failure message. `"Sphere overlap detects contact within one frame"` is more useful than `"SphereTest1"`.

6. **Use `GENERATE` for parameterized physics tests** instead of duplicating test logic with different inputs. Catch2 runs the test once per generated value.

7. **Output JUnit XML in CI** (`--reporter junit --out results.xml`) for dashboard integration. The format is compatible with Jenkins, TeamCity, and GitHub Actions.
