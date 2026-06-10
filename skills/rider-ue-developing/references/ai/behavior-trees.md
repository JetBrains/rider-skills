# Behavior Trees

## Architecture Overview

Unreal Engine behavior trees use an event-driven model. Unlike traditional BTs that tick every frame from root, UE BTs only re-evaluate when relevant state changes via Blackboard observers and decorator notifications. This makes them significantly more performant for large AI populations.

**Core components:**
- **UBehaviorTree** -- the asset, edited in the BT editor
- **UBehaviorTreeComponent** -- lives on the AIController, executes the tree
- **UBlackboardComponent** -- shared key-value store for BT state
- **UBTCompositeNode** -- Selector, Sequence, Simple Parallel
- **UBTDecorator** -- conditional checks, flow control
- **UBTTaskNode** -- leaf nodes that perform actions
- **UBTService** -- periodic update nodes attached to composites or tasks

## Composite Nodes

### Selector (Fallback)
Executes children left to right. Succeeds when ANY child succeeds. Fails only if ALL children fail. Use for "try alternatives" logic -- try attack, else try flee, else idle.

### Sequence
Executes children left to right. Fails when ANY child fails. Succeeds only if ALL children succeed. Use for "do all steps" logic -- move to target, then attack, then celebrate.

### Simple Parallel
Runs a primary task and a secondary subtree simultaneously. The finish mode determines behavior:
- **Immediate**: finishes when the primary task finishes (aborts secondary)
- **Delayed**: waits for both to complete

Use for actions that need background monitoring -- move to location while checking for threats.

## Blackboard

The Blackboard is a typed key-value store shared between the BT, AIController, and any system that needs to communicate with the AI.

### Key Types
- `Bool`, `Int`, `Float`, `String`, `Name`
- `Vector` -- positions, directions
- `Rotator` -- orientations
- `Object` -- actor references, any UObject
- `Class` -- UClass references
- `Enum` -- custom enums

### Setting and Getting Keys
```cpp
// In AIController or Task
UBlackboardComponent* BB = GetBlackboardComponent();
BB->SetValueAsVector(FName("TargetLocation"), Location);
BB->SetValueAsObject(FName("TargetActor"), TargetActor);

FVector Loc = BB->GetValueAsVector(FName("TargetLocation"));
AActor* Target = Cast<AActor>(BB->GetValueAsObject(FName("TargetActor")));
```

### Observers
Register for key change notifications:
```cpp
BB->RegisterObserver(KeyID, this, FOnBlackboardChangeNotification::CreateUObject(
    this, &UMyDecorator::OnBlackboardKeyChanged));
```

Decorators with "Observer Aborts" use this internally to trigger re-evaluation.

## Custom Task Nodes

### Blueprint Tasks (BTTask_BlueprintBase)
Override these events:
- `Receive Execute` / `Receive Execute AI` -- called when task starts
- `Receive Abort` / `Receive Abort AI` -- called when task is aborted
- `Receive Tick` / `Receive Tick AI` -- called every frame while active (enable Tick in class defaults)

**You MUST call `Finish Execute` or `Finish Abort`** from these events. Forgetting this hangs the tree.

### C++ Tasks (UBTTaskNode)
```cpp
UCLASS()
class UBTTask_MyAction : public UBTTaskNode
{
    GENERATED_BODY()

    virtual EBTNodeResult::Type ExecuteTask(UBehaviorTreeComponent& OwnerComp,
                                             uint8* NodeMemory) override;
    virtual EBTNodeResult::Type AbortTask(UBehaviorTreeComponent& OwnerComp,
                                           uint8* NodeMemory) override;
    virtual void TickTask(UBehaviorTreeComponent& OwnerComp,
                          uint8* NodeMemory, float DeltaSeconds) override;
};
```

Return values: `Succeeded`, `Failed`, `InProgress` (must call `FinishLatentTask` later), `Aborted`.

For latent tasks:
```cpp
EBTNodeResult::Type UBTTask_MyAction::ExecuteTask(UBehaviorTreeComponent& OwnerComp, uint8* NodeMemory)
{
    // Start async work...
    return EBTNodeResult::InProgress;
}

// Later, when work completes:
FinishLatentTask(OwnerComp, EBTNodeResult::Succeeded);
```

## Custom Decorators

Decorators attach to composites or tasks and control execution flow.

```cpp
UCLASS()
class UBTDecorator_MyCheck : public UBTDecorator
{
    GENERATED_BODY()
    virtual bool CalculateRawConditionValue(UBehaviorTreeComponent& OwnerComp,
                                             uint8* NodeMemory) const override;
};
```

### Observer Abort Types
- **None** -- no reactive behavior, only checked when flow reaches the node
- **Self** -- if condition becomes false while this branch runs, abort this branch
- **Lower Priority** -- if condition becomes true while a lower-priority branch runs, abort that branch and run this one
- **Both** -- combines Self and Lower Priority

**Warning:** Self + a rapidly toggling condition = infinite abort-restart loop.

## Custom Services

Services run periodically while their parent composite or task is active. Use for updating Blackboard state.

```cpp
UCLASS()
class UBTService_UpdateTarget : public UBTService
{
    GENERATED_BODY()
    virtual void TickNode(UBehaviorTreeComponent& OwnerComp,
                          uint8* NodeMemory, float DeltaSeconds) override;
};
```

Set `Interval` and `RandomDeviation` in the service defaults to control tick rate with jitter.

## Running a Behavior Tree

### AIController Setup
```cpp
void AMyAIController::OnPossess(APawn* InPawn)
{
    Super::OnPossess(InPawn);

    if (UseBlackboard(BlackboardAsset, BlackboardComponent))
    {
        RunBehaviorTree(BehaviorTreeAsset);
    }
}
```

### Stopping and Switching Trees
```cpp
// Stop current tree
UBehaviorTreeComponent* BTComp = Cast<UBehaviorTreeComponent>(BrainComponent);
BTComp->StopTree(EBTStopMode::Safe); // Safe = finish current task; Forced = immediate

// Switch to a different tree
RunBehaviorTree(NewBehaviorTreeAsset);
```

## Common Patterns

### Patrol Pattern
Selector > [Sequence(HasTarget > MoveToTarget > Attack), Sequence(GetNextPatrolPoint > MoveToPatrol > Wait)]

### Combat with Fallback
Selector > [Sequence(IsInRange > Attack), Sequence(HasTarget > MoveToTarget), Sequence(FindEnemy > SetTarget)]

### Flee Pattern
Sequence > [CheckHealth < 20% > FindEscapePoint(EQS) > MoveTo > Heal]

## Debugging

- **Behavior Tree Debugger**: In-editor visual debugger shows real-time execution state. Select an AI pawn, open BT editor, enable debug mode.
- **Gameplay Debugger** (`'` key in PIE): Category "BehaviorTree" shows active node path and Blackboard values.
- **Visual Logger**: Records BT execution history for replay. Enable via `VisualLogger` console command.
- **Log output**: `LogBehaviorTree` verbosity controls BT logging. Set in DefaultEngine.ini:
  ```ini
  [Core.Log]
  LogBehaviorTree=Verbose
  ```

---

## MCP tools

| Tool | Purpose | Scenario |
|------|---------|----------|
| `ue_play` | Start / stop / pause PIE | Trigger the AI scenario you want to observe |
| `ue_get_logs` | Stream BT execution logs | `category="LogBehaviorTree"`, `minVerbosity="Verbose"` — watch active node transitions in real time |
| `ue_execute_python` | Read Blackboard values at runtime | `ai_controller.get_blackboard_component().get_value_as_object("TargetActor")` |
| `search_assets` | Find BehaviorTree / Blackboard assets | Locate the `.uasset` path for `get_asset_properties` inspection |
| `get_asset_properties` | Read Blackboard key definitions | Inspect key names and types without opening the editor |
| `xdebug_set_breakpoint` | Break when a specific task executes | Conditional breakpoint on `UBTTaskNode::ExecuteTask` to catch infinite BT restarts |
| `xdebug_get_frame_values` | Inspect task / decorator state | Read `UBlackboardComponent` keys or `FAIStimulusStore` at the breakpoint |
