# Decision Making for Game AI (Unreal Engine)

## Reactivity vs Deliberation (Game AI Pro, Ch. 11)

**Key insight**: Do NOT unify reactions and deliberation in a single decision model. Use separate models with an Action Selector that prioritizes reactions.

| Aspect | Reactivity | Deliberation |
|--------|-----------|--------------|
| Trigger | Interruptions (damage, sounds) | Task completion, context change |
| Goal | Instantaneous response | Sustained best action |
| Examples | Pain reaction, dodge, alert | Patrol, combat, investigate |

**FSM anti-pattern**: Mixing both creates N*M transitions (every reaction from every deliberation state).

**UE mapping**:
- **Reactions**: BT decorator aborts + high-priority interrupt branches
- **Deliberation**: Main BT structure with sustained behavior subtrees
- **Action Selector**: BT root selector with appropriate abort modes

## Utility AI (Game AI Pro, Ch. 9-10)

### UE Integration

UE has no built-in utility system. Integration paths:
- **Custom BT Composite**: Utility Selector that scores children, picks highest
- **EQS as Utility**: Environment Query System IS utility-based spatial reasoning already
- **Custom AI Controller**: Score available actions each tick, execute winner

### Non-Obvious Patterns

- **Bucket selection**: Group actions by utility score into buckets, weighted random within top bucket for natural variation (avoids robotic always-pick-highest).
- **Utility decorators**: Transform child utility through response curves to adjust urgency thresholds.
- **Keep 3-5 inputs per decision** max for tunability. Use weighted products for must-all-be-satisfied, weighted sums for substitutable inputs.
- Expose response curve params as data assets, not hardcode -- designers must iterate without recompilation.

## HTN Planning (Game AI Pro, Ch. 12)

### Key Non-Obvious Patterns

**Expected effects**: Effects applied only during planning to predict state changes from external systems. "Navigate to enemy" expects "can see enemy = true" even though vision is sensor-driven.

**Method Traversal Record (MTR)**: Record which method index was chosen at each compound task. Compare new plan's MTR against running plan to prevent lower-priority plans from interrupting valid higher-priority ones.

**Partial planning**: Only plan next few actions. Forward decomposition enables this (unlike GOAP's backward search). Saves CPU, handles dynamic worlds where distant plans go stale.

**Recursion**: "AttackEnemy" method can include "find weapon, then AttackEnemy again" -- terminates because effects change world state.

### HTN vs GOAP

- HTN searches forward; GOAP searches backward (goal to current)
- HTN can do partial planning; GOAP must complete full plan
- HTN was "considerably faster" than GOAP in Transformers: Fall of Cybertron
- HTN culls branches via compound task methods
- GOAP = more emergent; HTN = more authorial control

### UE Integration

No built-in HTN. `HTNPlanner` plugin and community implementations exist. DIY: custom `UBrainComponent` replacing BT runner, world state as specialized Blackboard, tasks as `UGameplayTask`.

## Influence Maps

Implement in UE via:
- Grid overlays updated periodically
- EQS tests that sample influence values
- Custom navigation query filters incorporating influence costs

## Game Trees

For turn-based UE games, implement as custom `UGameplayTask` or standalone algorithm. Not part of standard AI framework.

**Horizon effect**: A heuristically good position may be catastrophic one move deeper. Use iterative deepening with time cutoff.

## Gotchas

1. **Do NOT use one architecture for everything** -- combine FSMs for simple behaviors, BTs for main loop, utility for selection within BT nodes.
2. **Reactivity filtering** -- raw sensor data causes oscillation (patrol/chase flicker). Use hysteresis or cooldown timers on transitions.
3. **Plan invalidation** -- for HTN/GOAP, validate remaining plan steps against current world state each frame.
4. **Game tree depth** -- strict time budgets in real-time. Use iterative deepening with time cutoff, not fixed depth.

## References

- Dawe et al., "Behavior Selection Algorithms" (Game AI Pro, Ch. 4)
- Graham, "An Introduction to Utility Theory" (Game AI Pro, Ch. 9)
- Merrill, "Building Utility Decisions into Your Existing Behavior Tree" (Game AI Pro, Ch. 10)
- Cote, "Reactivity and Deliberation in Decision-Making Systems" (Game AI Pro, Ch. 11)
- Humphreys, "Exploring HTN Planners through Example" (Game AI Pro, Ch. 12)
- van der Sterren, "Hierarchical Plan-Space Planning" (Game AI Pro, Ch. 13)
- Smed & Hakonen, "Game Trees" (Algorithms and Networking for Computer Games, Ch. 4)
- Smed & Hakonen, "Decision-making" (Algorithms and Networking for Computer Games, Ch. 6)

---

## MCP tools

| Tool | Purpose | Scenario |
|------|---------|----------|
| `ue_play` | Start PIE | Run the scenario to exercise the decision-making system |
| `ue_get_logs` | Stream AI decision logs | `category="LogBehaviorTree"` or `category="LogStateTree"`, `minVerbosity="Verbose"` |
| `ue_execute_python` | Read utility scores or state at runtime | Dump Blackboard values or current utility evaluations for all agents |
| `xdebug_set_breakpoint` | Break on a specific decision transition | Catch the moment a utility score exceeds threshold or a plan is invalidated |
