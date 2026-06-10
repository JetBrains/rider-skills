# State Tree

## Architecture Overview

State Tree is UE's general-purpose hierarchical state machine. Unlike Behavior Trees (which are AI-only and live on the AIController), State Tree is engine-wide: it drives AI, but also UI flow, game phases, ability logic, or any actor behavior. It combines a **hierarchy of states** (like an HFSM) with **selection** that flows down the tree (like a BT), and is **event-driven** rather than ticking from the root every frame.

**Plugins:** `StateTree` (core runtime, `Engine/Plugins/Runtime/StateTree`) and `GameplayStateTree` (the Actor/AI component integration). Enable both. The asset is a `UStateTree` (a normal `.uasset`).

**Core concepts:**
- **State** -- a node in the hierarchy. Holds enter conditions, tasks, transitions, and child states.
- **Task** (`FStateTreeTaskBase`) -- does work while its state is active; returns `EStateTreeRunStatus`.
- **Evaluator** (`FStateTreeEvaluatorBase`) -- computes values every tick and exposes them for binding.
- **Condition** (`FStateTreeConditionBase`) -- boolean gate used by enter conditions and transitions.
- **Consideration** (`FStateTreeConsiderationBase`) -- utility scorer for utility-based child selection (UE 5.3+).
- **Schema** (`UStateTreeSchema`) -- defines which context data and node types a tree may use.
- **Parameters / Instance Data** -- the data model. There is **no Blackboard**; data flows through property **bindings** between nodes, parameters, and context objects.

All tasks/evaluators/conditions are instanced `USTRUCT`s (lightweight, value types), not `UObject`s -- though Blueprint variants (`UStateTreeTaskBlueprintBase`, etc.) exist for designer authoring.

## States and Selection

A State Tree is a tree of states. When selection enters a parent state, the parent's **selection behavior** decides what happens next:

- **Try Enter** -- enter this state directly (a leaf-style state).
- **Try Select Children In Order** -- pick the first child whose enter conditions pass (BT Selector-like). The default.
- **Try Select Children With Highest Utility** -- score children via Considerations and pick the best.
- **Try Follow Transitions** -- delegate to this state's transitions.
- **None** -- state cannot be selected.

Enter conditions on a child must pass for selection to choose it. Selection always resolves to a **leaf**, and the active set is the chain of states from root to that leaf -- every state on the path runs its tasks simultaneously.

## Tasks

Tasks perform the actual behavior of a state. A C++ task is a `USTRUCT` deriving from `FStateTreeTaskCommonBase`, with its mutable state stored in a separate **instance data** struct (the task struct itself is effectively `const` at runtime):

```cpp
USTRUCT()
struct FMoveToActorInstanceData
{
    GENERATED_BODY()

    UPROPERTY(EditAnywhere, Category = "Input")
    TObjectPtr<AActor> TargetActor = nullptr;

    UPROPERTY(EditAnywhere, Category = "Parameter")
    float AcceptanceRadius = 50.f;
};

USTRUCT(meta = (DisplayName = "Move To Actor"))
struct FMoveToActorTask : public FStateTreeTaskCommonBase
{
    GENERATED_BODY()

    using FInstanceDataType = FMoveToActorInstanceData;
    virtual const UStruct* GetInstanceDataType() const override
        { return FInstanceDataType::StaticStruct(); }

    virtual EStateTreeRunStatus EnterState(FStateTreeExecutionContext& Context,
        const FStateTreeTransitionResult& Transition) const override;
    virtual EStateTreeRunStatus Tick(FStateTreeExecutionContext& Context,
        const float DeltaTime) const override;
    virtual void ExitState(FStateTreeExecutionContext& Context,
        const FStateTreeTransitionResult& Transition) const override;
};
```

Access the instance data through the context -- never store per-run state on the struct:

```cpp
EStateTreeRunStatus FMoveToActorTask::Tick(FStateTreeExecutionContext& Context, const float) const
{
    FInstanceDataType& Data = Context.GetInstanceData(*this);
    if (!Data.TargetActor)
    {
        return EStateTreeRunStatus::Failed;
    }
    // ... drive movement, check arrival ...
    return bArrived ? EStateTreeRunStatus::Succeeded : EStateTreeRunStatus::Running;
}
```

`EStateTreeRunStatus`: `Running`, `Succeeded`, `Failed`, `Stopped`, `Unset`. A task returning `Succeeded`/`Failed` triggers the state's completion transitions. By default `EnterState` returns `Running`; override only what you need.

## Evaluators and Conditions

**Evaluators** run while the tree is active and publish computed values for other nodes to bind to. Override `TreeStart`, `TreeStop`, and `Tick`. Use them for shared, expensive-once-per-frame queries (e.g. "distance to player", "current threat actor").

**Conditions** gate selection and transitions. Override `TestCondition`:

```cpp
USTRUCT()
struct FIsTargetInRangeCondition : public FStateTreeConditionCommonBase
{
    GENERATED_BODY()
    using FInstanceDataType = FIsTargetInRangeInstanceData;
    virtual const UStruct* GetInstanceDataType() const override
        { return FInstanceDataType::StaticStruct(); }

    virtual bool TestCondition(FStateTreeExecutionContext& Context) const override;
};
```

Conditions can be combined with AND/OR/NOT and parentheses in the editor.

## Property Binding (the data model)

State Tree has no Blackboard. Instead, any `EditAnywhere` property on a node's instance data can be **bound** in the editor to:
- **Context data** -- objects the schema exposes (e.g. the owning Actor, the AIController).
- **Tree parameters** -- a `FInstancedPropertyBag` of inputs set per-instance.
- **Evaluator / Task outputs** -- values published by earlier nodes.
- **State parameters** -- per-state typed inputs, useful for reusable subtrees.

Bindings are resolved by the compiler into a flat instance-data layout, so runtime access is a direct memory read -- this is the performant path; there is no string-keyed lookup to optimize away.

## External Data

To touch engine systems (movement component, perception, etc.), declare an external data handle and link it instead of calling `GetComponent` every tick:

```cpp
TStateTreeExternalDataHandle<UCharacterMovementComponent> MovementHandle;

virtual bool Link(FStateTreeLinker& Linker) override
{
    Linker.LinkExternalData(MovementHandle);
    return true;
}

// In EnterState/Tick:
UCharacterMovementComponent& Movement = Context.GetExternalData(MovementHandle);
```

The schema must permit the requested external data type, or compilation fails.

## Transitions

Transitions move selection to another state. Each is `Trigger + optional Condition(s) + Target`, with a priority. Trigger types (`EStateTreeTransitionTrigger`):

- **On State Completed** -- fires when the state's tasks finish (split into On Succeeded / On Failed).
- **On Tick** -- evaluated every tick (gate it with conditions).
- **On Event** -- fires when a matching gameplay event (by `FGameplayTag`) is sent to the tree.

Targets: another **named state**, **Next State** (sibling), **Tree Succeeded**, or **Tree Failed**. Higher-priority transitions on deeper active states are evaluated first. Completion transitions are the normal way to chain states; `OnTick`/`OnEvent` give reactive, interrupt-style behavior.

## Events

Drive reactive transitions by sending events to a running tree:

```cpp
FStateTreeComponent* Comp = MyActor->FindComponentByClass<UStateTreeComponent>();
Comp->SendStateTreeEvent(FStateTreeEvent(FGameplayTag::RequestGameplayTag("AI.Event.Alerted")));
```

A transition with trigger **On Event** and the matching tag will then fire. Events are the State Tree equivalent of BT "Observer Aborts" -- the clean way to interrupt the current state.

## Running a State Tree

Attach a component and point it at the asset:

- **`UStateTreeComponent`** -- runs a tree on any Actor. Use `UStateTreeComponentSchema`.
- **`UStateTreeAIComponent`** -- runs on an AIController and integrates with the AI task system. Use `UStateTreeAIComponentSchema`.

```cpp
// In an Actor constructor
StateTreeComp = CreateDefaultSubobject<UStateTreeComponent>(TEXT("StateTreeComp"));

// Logic control at runtime
StateTreeComp->StartLogic();
StateTreeComp->StopLogic(TEXT("Reason"));
StateTreeComp->RestartLogic();
```

Set the tree via the component's `StateTreeRef` (a `FStateTreeReference`, which also carries the parameter bag) in the editor or C++. The schema chosen on the **asset** must match the component running it.

## Debugging

- **State Tree Debugger** -- `Tools → State Tree Debugger` (or the toolbar button in the State Tree editor). It records execution via Unreal Insights tracing; launch with `-trace=default,statetree` (or enable the StateTree trace channel) to capture state entries/exits, transitions, and task statuses on a timeline. Integrates with the Rewind Debugger.
- **Visual logging** -- nodes emit to the Visual Logger; open with the `VisLog` console command to correlate state changes with world state.
- **Live state** -- in PIE, the State Tree editor highlights the active state path when the debugger is attached to an instance.

## State Tree vs Behavior Tree

| Aspect | State Tree | Behavior Tree |
|--------|-----------|---------------|
| Scope | Engine-wide (AI, UI, gameplay, abilities) | AI only, on the AIController |
| Data model | Property bindings + parameters (no Blackboard) | Blackboard component |
| Structure | States with tasks + transitions | Composites / decorators / tasks / services |
| Reactivity | Events + `OnTick`/`OnEvent` transitions | Decorator Observer Aborts |
| Node cost | Instanced structs (value types) | `UObject` nodes |
| Best fit | Mixed state + selection logic, non-AI flow | Established AI behavior authoring |

State Tree is the newer system and Epic's strategic direction, but Behavior Trees remain fully supported. They can coexist -- e.g. a BT task that runs a State Tree, or a State Tree that drives high-level mode while BTs handle sub-behaviors.

## Pitfalls

- **No Blackboard.** Don't look for one -- wire data with property bindings and parameters. Forgetting to bind a required input leaves it at its default (often null), which usually shows up as a task failing immediately in `EnterState`.
- **Tasks are stateless structs.** All per-run state must live in the instance data struct and be reached via `Context.GetInstanceData(*this)`. Storing mutable state on the task struct corrupts shared instances.
- **Schema mismatch.** The asset's schema must allow every context object, external data type, and node type used, and must match the component running it. Mismatches fail at compile, not runtime.
- **Override `GetInstanceDataType()` and declare `FInstanceDataType`.** Omitting either means your editable properties never appear or never bind.
- **Completion vs reactive transitions.** Use `On State Completed` to chain sequential behavior; use `On Event`/`On Tick` for interrupts. Relying on `On Tick` for everything reintroduces per-frame polling and defeats the event-driven design.
- **Enable both plugins.** `StateTree` alone gives you the asset but not `UStateTreeComponent`; that lives in `GameplayStateTree`.
