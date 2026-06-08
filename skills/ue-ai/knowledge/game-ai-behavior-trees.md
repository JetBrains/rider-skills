# Behavior Trees for Game AI (Unreal Engine)

## UE Node Types and Classes

| Node Type | UE Class | Purpose |
|-----------|----------|---------|
| **Selector** | `UBTComposite_Selector` | Tries children L-R, succeeds on first success |
| **Sequence** | `UBTComposite_Sequence` | Runs children L-R, fails on first failure |
| **Simple Parallel** | `UBTComposite_SimpleParallel` | Main task + background subtree simultaneously |
| **Task** | `UBTTaskNode` | Leaf node (MoveTo, Wait, PlayAnimation, custom) |
| **Decorator** | `UBTDecorator` | Conditional wrapper gating child execution |
| **Service** | `UBTService` | Background periodic tick while parent is active |

## UE-Specific Architecture

- **Blackboard**: Typed key-value store (Object, Vector, Bool, Enum, Float, Int, String, Name, Class). Decorators observe keys and abort on change.
- **AI Controller** (`AAIController`): Owns BT + Blackboard. `RunBehaviorTree()` to start. Persists across pawn possession.
- **BT Asset**: `UBehaviorTree` asset, set via `DefaultBehaviorTree` on AI Controller.

## Observer Abort Modes (UE-specific)

| Abort Mode | Behavior |
|------------|----------|
| `None` | No abort on value change |
| `Self` | Aborts this subtree if condition becomes false |
| `LowerPriority` | Aborts lower-priority subtrees if condition becomes true |
| `Both` | Combines Self and LowerPriority |

Use `LowerPriority` on combat decorators so spotting an enemy immediately interrupts patrol. This replaces the explicit reactivity/deliberation separation from Game AI Pro Ch. 11.

## Utility Selector Pattern (Game AI Pro, Ch. 10)

Implement as custom `UBTComposite` that calls `CalculateUtility()` on each child, sorts by score, executes highest.

- **Bucket selection**: Group children by utility into buckets, weighted random within top bucket for natural variation.
- **Utility decorators**: Transform scores through response curves (square, cube, sigmoid) to adjust urgency thresholds.
- **Propagating utility**: Composites return max utility of children. Cache to avoid per-tick recalc.
- **EQS as utility**: Environment Query System IS utility-based spatial reasoning -- use it.

## Services as Periodic Updates

Services tick at configurable intervals while parent composite is active. Use for updating Blackboard keys, perception checks, utility scores, tactical data.

**Gotcha**: Service tick interval has random deviation by default (`RandomDeviation` property). Account for this in timing-sensitive logic.

## Gotchas

1. **Do NOT put heavy logic in decorators** -- they evaluate frequently. Use Services for periodic computation, store results in Blackboard.
2. **MoveTo task requires NavMesh** -- ensure NavMesh is baked and AI pawn has `UNavigationInvokerComponent` or is within NavMesh bounds.
3. **Blackboard key types must match** -- setting a Vector key with an Object value silently fails.
4. **Observer abort ordering** -- place high-priority branches with `LowerPriority` abort LEFT of lower-priority branches.
5. **RunBehaviorTree replaces, not stacks** -- calling it again stops the current tree. Use Blackboard-driven subtree switching.
6. **Simple Parallel finish mode** -- `Immediate` (finish when main task finishes) vs `Delayed` (wait for background tree too).

## Best Practices

- **Keep trees shallow** (3-5 levels). Use subtree references (`UBTTask_RunBehavior`) for shared patterns.
- **Name Blackboard keys descriptively**: `BB_CurrentEnemy`, `BB_LastKnownLocation`.
- **Use EQS for spatial queries** rather than hardcoding positions in tasks.
- **Profile with Visual Logger** (`vlog`): records BT state per tick. `'` key toggles AI debug display.

## References

- Champandard & Dunstan, "The Behavior Tree Starter Kit" (Game AI Pro, Ch. 6)
- Dawe, "Real-World Behavior Trees in Script" (Game AI Pro, Ch. 7)
- Merrill, "Building Utility Decisions into Your Existing Behavior Tree" (Game AI Pro, Ch. 10)
- Cote, "Reactivity and Deliberation in Decision-Making Systems" (Game AI Pro, Ch. 11)
- Hilburn, "Simulating Behavior Trees" (Game AI Pro, Ch. 8)
