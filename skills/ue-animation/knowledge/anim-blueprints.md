# Animation Blueprint Architecture

## Overview

An Animation Blueprint (AnimBP) is a specialized Blueprint class that controls skeletal mesh animation. It consists of two main graphs -- the Event Graph and the Anim Graph -- plus optional sub-graphs for state machines, Linked Anim Graphs, and Anim Layers.

Every AnimBP must be assigned a **Skeleton** asset. This is set at creation time and cannot be changed. If the wrong skeleton is assigned, the AnimBP compiles without error but produces a T-pose at runtime because no bones match.

---

## Event Graph vs Anim Graph

### Event Graph
- Runs on the **game thread**.
- Executes once per frame via `BlueprintUpdateAnimation` (or the native `NativeUpdateAnimation`).
- Used for reading game state: character velocity, input values, is-falling checks, combat state flags.
- Writes values into AnimBP member variables that the Anim Graph reads.
- Should be kept lightweight -- heavy logic here blocks the game thread.

### Anim Graph
- Runs on a **worker thread** (when multi-threaded animation update is enabled).
- Produces the final pose each frame by evaluating animation nodes.
- Reads variables via **Property Access** (the Fast Path) rather than direct variable reads.
- Contains State Machines, Blend nodes, Slot nodes, and other pose-producing nodes.
- Cannot call non-thread-safe functions or modify game state.

**Key rule:** Data flows one way -- Event Graph writes variables, Anim Graph reads them. Never try to write game state from the Anim Graph.

---

## Thread-Safe Property Access (BlueprintThreadSafe)

UE5 introduced the Property Access system to replace the old "copy pose" workflow. It allows the Anim Graph to read variables directly using property paths like `Character.MovementComponent.Velocity`.

Requirements for thread safety:
- Mark custom AnimBP variables as `BlueprintThreadSafe` in their UPROPERTY metadata.
- Any function called from Property Access bindings must be marked `BlueprintThreadSafe`.
- Accessing non-thread-safe properties causes intermittent crashes or pose flickering.

```cpp
UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Animation",
          meta = (BlueprintThreadSafe))
float Speed;

UFUNCTION(BlueprintPure, Category = "Animation",
          meta = (BlueprintThreadSafe))
bool ShouldSprint() const;
```

In Blueprint, check "Thread Safe" on variables and enable "Thread Safe Update Animation" on the AnimBP class defaults.

---

## Fast Path Optimization

The Fast Path is UE's optimization that avoids calling into Blueprint VM for simple variable reads. When the Anim Graph evaluates, nodes that use Fast Path read member variables directly from memory instead of executing Blueprint bytecode.

To stay on Fast Path:
- Use direct member variable access or Property Access, not function calls.
- Avoid Break Struct nodes -- access struct members directly.
- Avoid intermediate Blueprint nodes between the variable and the animation node pin.
- The AnimBP compiler shows a lightning bolt icon on nodes that are on Fast Path.

Nodes that break Fast Path: any custom Blueprint function call, most macro nodes, array operations, and string conversions.

---

## State Machines

State machines are the primary tool for organizing animation states (idle, walk, run, jump, fall, land, etc.).

### Structure
- **States**: Each state contains a sub-graph that produces a pose (play animation, blend space, sub-state machine, etc.).
- **Transitions**: Directed edges between states with a boolean rule that determines when to transition.
- **Conduits**: Helper nodes for fan-in/fan-out transition logic.

### Transition Rules
- Each transition has a rule graph returning true/false.
- Blend settings: duration (seconds), blend profile (linear, cubic, custom curve), blend logic (standard crossfade or inertialization).
- **Inertialization** (UE5 preferred): Set blend logic to "Inertialization" and add an Inertialization node after the state machine. Produces smoother blends with less animation data.
- Automatic rule: "Time Remaining" on current animation < blend duration is the most common pattern.
- **Priority order** matters when multiple transitions are valid simultaneously.

### Best Practices
- Keep state count manageable (under 15 per machine). Use sub-state machines for complexity.
- Name states descriptively: `Idle`, `Jog_Start`, `Jog_Loop`, `Jog_Stop`, not `State1`.
- Use transition interruption sparingly -- it can cause pose pops.
- Set "Remaining Time" transition rules relative to blend duration to avoid animation pops at the end.

---

## Linked Anim Graphs and Anim Layers

### Linked Anim Graphs
Allow composing AnimBPs from multiple sub-AnimBPs. The parent AnimBP links in child AnimBPs that produce poses independently.

- All linked AnimBPs must target the **same Skeleton** (or use compatible skeletons with bone remapping).
- Useful for separating upper body and lower body logic, weapon-specific overlays, or vehicle animation layers.
- Set up via `Link Anim Graph Layers` node or `Linked Anim Blueprint` property.

### Anim Layers
- Define an Anim Layer Interface (ALI) with named layer functions.
- Implement layers in different AnimBPs.
- Swap layer implementations at runtime to change animation behavior without rebuilding the main AnimBP.
- Lyra uses this pattern extensively: base locomotion AnimBP + weapon-specific layer AnimBPs.

```
// In parent AnimBP Anim Graph:
LinkedAnimLayer("UpperBodyLayer") -> Layered Blend Per Bone -> Output Pose
```

---

## Sync Groups

Sync groups keep multiple animations synchronized by phase (normalized time). Essential for:
- Walk/run blending where the foot cycle must stay in sync.
- Paired animations (dance partners, co-op actions).

Setup:
1. On each animation player node, set the **Sync Group Name** (e.g., "Locomotion").
2. Set the **Group Role**: Leader (drives timing) or Follower (matches leader's phase).
3. The leader is usually the animation with the highest blend weight.

Common mistake: forgetting to set sync groups on blend space animations, causing foot sliding during speed transitions.

---

## Pose Caching and Snapshots

### Pose Caching
- `Cache Pose` node: Evaluates a pose once per frame and stores it. Multiple consumers can read the cached result without re-evaluation.
- Use when the same sub-graph result feeds into multiple blend branches.
- Reduces redundant evaluation but adds one frame of latency if used incorrectly.

### Pose Snapshots
- `Snapshot Pose` captures the current pose into a static snapshot.
- Useful for blending from a "frozen" pose (e.g., death pose, hit reaction start pose).
- The snapshot does not update -- it is a single-frame capture.

---

## Common AnimBP Patterns from Lyra

### Locomotion Layer Architecture
Lyra separates animation into:
1. **Base AnimBP** (`ABP_Character`): Manages the main state machine (locomotion, jump/fall, etc.).
2. **Anim Layer Interfaces**: Define contracts like `FullBodyLayer`, `UpperBodyLayer`.
3. **Weapon AnimBPs** (e.g., `ABP_Rifle`, `ABP_Pistol`): Implement the ALIs with weapon-specific poses.
4. At runtime, `LinkAnimClassLayers` swaps in the correct weapon AnimBP.

### Distance Matching
Lyra uses distance matching for starts/stops:
- `DistanceMatchingToTarget` for stop animations (matches distance to stop point).
- `DistanceMatchingFromStart` for start animations (matches distance from start).
- Eliminates foot sliding without root motion for locomotion starts/stops.

### Stride Warping
Adjusts leg stride length to match actual movement speed:
- Prevents foot sliding during speed mismatches.
- Works alongside sync groups for blend space locomotion.
- Configure via the `Stride Warping` anim node with min/max stride scale.

### Turn-in-Place
- Detects yaw offset between mesh and character rotation.
- Triggers turn animation when offset exceeds threshold (e.g., 60 degrees).
- Uses root yaw offset curve embedded in the turn animations.
- Rotates mesh root bone to consume the offset during the turn.

---

## Performance Considerations

- **URO (Update Rate Optimization)**: Reduce AnimBP tick rate for distant characters. Set via `AnimUpdateRateTick` parameters.
- **Visibility-based tick**: Set `VisibilityBasedAnimTickOption` to skip ticking off-screen meshes.
- **LOD-based simplification**: Disable expensive nodes (IK, physics) at lower LODs via LOD Threshold on nodes.
- **Significance Manager**: Prioritize which characters get full animation updates based on camera distance and screen size.
- **Parallel evaluation**: Ensure AnimBP is thread-safe to benefit from multi-threaded anim evaluation.
- **Node count**: Keep total Anim Graph node count under 200 per AnimBP. Excessive nodes slow compilation and evaluation.
