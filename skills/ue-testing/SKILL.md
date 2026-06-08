---
name: ue:testing
description: "Use when user asks to write automation tests, create functional tests, set up Gauntlet, run test suites, create test fixtures, or implement CI test pipelines for UE projects. DO NOT TRIGGER for building (use ue:builder), running the editor (use ue:console), writing non-test C++ (use ue:coder), or debugging existing code (use ue:debugger)."
allowed-tools: Read, Glob, Grep, Bash, Write, Edit
argument-hint: "[test type or test task]"
---

See [Reference Image Handling](../_shared/reference-image-handling.md)

## Context7 Version Check

If the query mentions a specific UE version, or involves features known to change across versions (automation framework, FAutomationTestBase, Gauntlet, UE_ADD_LATENT_AUTOMATION_COMMAND), fetch the relevant Context7 section before answering. See `../_shared/context7-protocol.md`.

# Unreal Engine Automated Testing Skill

## Checklist

Call `TaskCreate` for each item below before starting, then mark each `in_progress` / `completed` as you go:

1. **Identify scope** — unit vs functional vs Gauntlet; what system or feature to test
2. **Create test** — test module, fixture class, test spec with `DEFINE_SPEC` or `IMPLEMENT_SIMPLE_AUTOMATION_TEST`
3. **Build and run** — compile, run via Session Frontend or cmd; check pass/fail
4. **Integrate CI** — add to automation filter if needed; document test requirements

## CRITICAL -- Mistakes That Waste Hours

1. **Test class MUST be in a module with `Type = Editor` or `Type = Test`, or in a `*Tests` module.**
   If your test lives in a `Runtime` module, the Automation framework will never discover it. Create a separate test module (e.g., `MyFeatureTests`) with `Type = Editor` in the `.Build.cs`, or add `bAutomationTest = true;` in an editor-only module. Otherwise the macro registers nothing and you will spend hours wondering why the test list is empty.

2. **`IMPLEMENT_SIMPLE_AUTOMATION_TEST` flags control where tests run -- wrong flags = test never appears.**
   The flags parameter (e.g., `EAutomationTestFlags::EditorContext | EAutomationTestFlags::ProductFilter`) determines visibility. If you use `ClientContext` but run from the editor session list, the test is invisible. Always include `EditorContext` for editor-run tests. Always include a product filter (`ProductFilter` or `EngineFilter`).

3. **`FAutomationTestBase::RunTest` must return `true` on success, `false` on failure -- returning the wrong value skips the test silently.**
   A `RunTest` that returns `false` marks the test as failed, but if you accidentally return `false` early before any assertions, the framework may treat it as "nothing to report" and you see no output. Ensure every code path ends with an explicit `return true;` (success) or assertions that call `AddError`.

4. **Latent commands don't block -- they queue; check completion with `FDoneDelegate`.**
   `ADD_LATENT_AUTOMATION_COMMAND` queues work for the next tick. If you assert immediately after queuing, the command hasn't executed yet. Use `FDoneDelegate` or chain latent commands so assertions run after the async work completes.

5. **World context in tests requires manual setup -- `GetWorld()` returns null without a proper test world.**
   Unlike gameplay code, automation tests don't have a default world. You must either: (a) load a map with `AutomationOpenMap`, (b) create a minimal world with `UWorld::CreateWorld`, or (c) use `FAutomationEditorCommonUtils::CreateNewMap()`. Calling `GetWorld()` on a bare test crashes or returns null.

6. **Asset paths in tests must use `/Game/` prefix -- relative paths fail at cook time.**
   Always use full asset paths like `/Game/Tests/Maps/TestLevel`. Relative paths or paths without the mount point work in-editor but break during cook and packaged test runs. Use `FSoftObjectPath` or `FName` with the full path.

7. **Network tests need PIE with multiple clients -- use `AutomationController` for that.**
   You cannot test replication in a single-process test. Network tests require launching PIE with `NumClients > 1` via `UEditorAutomationController` or Gauntlet. Attempting `GetNetMode()` checks in a plain automation test always returns `NM_Standalone`.

8. **Functional tests need a test level -- they don't create their own world.**
   `AFunctionalTest` actors must be placed in a map. The `FunctionalTestingManager` loads that map and runs the tests it finds. If you create a functional test class but forget the level, the test never executes. Always create a companion test map with the actors placed.

9. **CQTest: `ASSERT_THAT` inside a lambda only returns from that lambda -- not from the test.**
   `ASSERT_THAT(AreEqual(...))` expands to `if (!expr) return;`. Inside a `TestCommandBuilder` `.Do([this](){ ... })` lambda, a failing assertion exits the lambda but the command sequence continues. The error is recorded, but subsequent commands still execute unless they check `HasAnyErrors()`.

10. **CQTest: Cannot add latent commands from within an executing latent command.**
    Calling `TestCommandBuilder.Do(...)` from inside an already-running latent callback asserts in the destructor. Queue all commands upfront in `BEFORE_EACH` or `TEST_METHOD`.

11. **CQTest: `MapTestSpawner` requires `AddWaitUntilLoadedCommand` in `BEFORE_EACH`, not the constructor.**
    If called in the constructor, the latent command queue does not exist yet and the call silently does nothing. The test then races against map loading and produces non-deterministic failures.

12. **CQTest is an Engine module in UE5.5+ -- do not add it as a plugin.**
    In UE5.5+, `CQTest` is a built-in Engine module. Adding a `CQTest` plugin entry to `.uproject` causes duplicate symbol errors at link time. Just add `"CQTest"` to `PrivateDependencyModuleNames` in `Build.cs`.

---

## Test Framework Overview

Unreal Engine provides five testing frameworks at different levels of abstraction:

| Framework | Scope | Use Case |
|-----------|-------|----------|
| **Automation Framework** | Unit / integration | C++ logic, math, data validation, subsystem tests |
| **CQTest** | Unit / integration | Fixture-based C++ tests with auto state-reset, async sequences, actor/network helpers |
| **Functional Tests** | Integration / acceptance | In-world actor behavior, gameplay sequences, screenshots |
| **Gauntlet** | System / E2E | Full game boot, map cycles, soak tests, CI pipelines |
| **LowLevel / ChaosTestHarness** | Unit / physics | Pure C++ or Chaos physics tests (Catch2); no editor startup |

### Quick Decision Guide

- Testing a pure C++ function/class with **no UObject dependency**? Use **LowLevelTestsRunner** (fastest startup).
- Testing Chaos **physics simulation** (collision, constraints, solvers)? Use **ChaosTestHarness**.
- Testing a C++ class or subsystem **with multiple related cases and shared setup**? Use **CQTest** `TEST_CLASS`.
- Testing a simple one-off C++ assertion? Use `IMPLEMENT_SIMPLE_AUTOMATION_TEST` or CQTest `TEST`.
- Testing **BDD-style grouped behaviors**? Use Automation `DEFINE_SPEC`.
- Testing **multi-frame async sequences** in C++? Use **CQTest** `TestCommandBuilder`.
- Testing **server + client replication** in PIE? Use **CQTest** `PIENetworkComponent`.
- Testing actor behavior **in a real level**? Use **Functional Tests** (`AFunctionalTest` in a test map).
- Testing full game startup, stability, or performance in CI? Use **Gauntlet**.

---

## Running Tests

### From the Editor
1. **Session Frontend**: Window > Developer Tools > Session Frontend > Automation tab.
2. Filter by test name, check the boxes, click "Start Tests."

### From the Command Line

```bash
# Run all tests matching a filter
UnrealEditor-Cmd.exe MyProject.uproject -ExecCmds="Automation RunTests MyTestName" -Unattended -NullRHI -NoSound -NoSplash -Log

# Run a specific test group
UnrealEditor-Cmd.exe MyProject.uproject -ExecCmds="Automation RunFilter Smoke" -Unattended -NullRHI

# List available tests
UnrealEditor-Cmd.exe MyProject.uproject -ExecCmds="Automation List" -Unattended -NullRHI
```

### Console Commands (In-Editor Console)

```
Automation RunTests <TestName>
Automation RunAll
Automation RunFilter <FilterName>
Automation List
```

---

## Knowledge Files

| File | Contents |
|------|----------|
| [`knowledge/automation-framework.md`](knowledge/automation-framework.md) | Core `FAutomationTestBase` hierarchy, macros, flags, latent commands, spec-style tests, assertions, CLI usage |
| [`knowledge/cqtest.md`](knowledge/cqtest.md) | CQTest framework: `TEST_CLASS`, `BEFORE_EACH`/`AFTER_EACH`, `TestCommandBuilder`, `ActorTestSpawner`, `MapTestSpawner`, `PIENetworkComponent`, asset helpers |
| [`knowledge/functional-tests.md`](knowledge/functional-tests.md) | `AFunctionalTest`, test levels, screenshot comparison, network functional tests, CI integration |
| [`knowledge/gauntlet.md`](knowledge/gauntlet.md) | Gauntlet architecture, test modules, states, map cycle tests, boot tests, performance, CI integration |
| [`knowledge/lowlevel-chaos-tests.md`](knowledge/lowlevel-chaos-tests.md) | LowLevelTestsRunner (Catch2) and ChaosTestHarness for pure C++ and physics tests without editor startup |

---

## Module Setup Checklist

When creating a new test module:

1. Create `MyFeatureTests.Build.cs`:
   ```csharp
   public class MyFeatureTests : ModuleRules
   {
       public MyFeatureTests(ReadOnlyTargetRules Target) : base(Target)
       {
           PCHUsage = PCHUsageMode.UseExplicitOrSharedPCHs;
           // Test modules should be Editor type
           // (they are excluded from shipping builds automatically)

           PrivateDependencyModuleNames.AddRange(new string[]
           {
               "Core",
               "CoreUObject",
               "Engine",
               "MyFeature",           // Module under test
               "UnrealEd",            // For editor automation utilities
               "FunctionalTesting",   // If using functional tests
           });
       }
   }
   ```

2. Add the module to your `.uproject` or `.uplugin`:
   ```json
   {
       "Name": "MyFeatureTests",
       "Type": "Editor",
       "LoadingPhase": "Default"
   }
   ```

3. Create the module class (minimal):
   ```cpp
   // MyFeatureTests.h / .cpp
   #include "Modules/ModuleManager.h"
   IMPLEMENT_MODULE(FDefaultModuleImpl, MyFeatureTests);
   ```

4. Write your first test (see `knowledge/automation-framework.md`).

---

## Workflow

1. **Identify what to test** -- pure logic (Automation), in-world behavior (Functional), full game (Gauntlet).
2. **Create or locate the test module** -- ensure `Type = Editor` or `Type = Test`.
3. **Write the test** following patterns from the relevant knowledge file.
4. **Build** with `ue:builder` (test modules compile only in Editor configuration).
5. **Run** from editor or command line; check results.
6. **Integrate into CI** if needed (Gauntlet for full pipelines, command-line automation for unit/integration).
