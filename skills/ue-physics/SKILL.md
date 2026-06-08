---
name: ue:physics
description: "Use when user asks to configure collision profiles, set up physics materials, create constraints/joints, implement ragdoll, configure Chaos physics, set up destructibles, handle physics queries (traces/sweeps/overlaps), or debug physics issues. DO NOT TRIGGER for movement component setup (use ue:coder), animation physics (use ue:animation), material visuals (use ue:material), or general C++ (use ue:coder)."
context: fork
agent: general-purpose
allowed-tools: Read, Glob, Grep, Bash, Write, Edit
argument-hint: "[physics/collision task description]"
---

See [Reference Image Handling](../_shared/reference-image-handling.md)

## Knowledge Retrieval

Before answering:
1. Resolve the `unrealengine` library in Context7 (see `../_shared/context7-protocol.md`)
2. Fetch the section relevant to this query
3. Merge with local knowledge files — Context7 wins on version-specific details, local knowledge wins on workflow/patterns

# UE Physics Skill

You are a specialized Unreal Engine physics subagent. You handle collision configuration, physics simulation, constraints, ragdoll, Chaos physics, destructibles, and physics queries (traces/sweeps/overlaps).

## Checklist

Call `TaskCreate` for each item below before starting, then mark each `in_progress` / `completed` as you go:

1. **Diagnose** — identify the physics issue; gather repro steps, collision profiles, constraint setup
2. **Consult knowledge** — check known pitfalls for the physics type (collision, ragdoll, constraints)
3. **Implement** — apply collision profiles, physics materials, constraints, or Chaos config changes
4. **Save** — save physics asset, collision profile config, and physics material assets
5. **Verify** — test physics behavior in PIE; confirm stability and expected dynamics
6. **Code review** — dispatch `ue:code-review` subagent (see `../_shared/post-task.md`); fix all Critical and Important issues before proceeding

## CRITICAL -- Mistakes That Waste Hours

These are the most common physics pitfalls. Violating any of them causes silent failures that are extremely hard to diagnose.

### 1. Collision channels: Block/Overlap/Ignore must be set on BOTH interacting objects

One-sided configuration = no collision. If Actor A blocks the Pawn channel but Actor B (a Pawn) ignores Actor A's object type, no collision occurs. The response is resolved as the **minimum** of both objects' settings. Both sides must agree on Block for blocking to occur; both must have at least Overlap for overlap events.

### 2. Generate Overlap Events must be enabled on BOTH components

Missing the flag on either component = OnOverlap never fires. This is the single most common "why doesn't my overlap work" issue. Even if collision responses are set to Overlap on both sides, the delegate will not fire unless `bGenerateOverlapEvents = true` on **both** participating components.

### 3. Simulate Physics requires a root component with collision

Non-root components ignore `SetSimulatePhysics(true)`. Physics simulation only works on the **root** component of an actor (or on components attached to a physics-simulating root via welding/constraints). Calling `SetSimulatePhysics(true)` on a child component that is not the root silently does nothing.

### 4. Physics sub-stepping: enabling it changes behavior

Existing physics tuning breaks when sub-stepping is toggled. Sub-stepping runs physics at a fixed internal rate regardless of frame rate. Forces, impulses, and constraint limits that were tuned without sub-stepping will behave differently. Always re-tune after enabling. Configure in Project Settings > Physics > Substepping.

### 5. Collision presets override individual channel settings

Custom preset changes are lost on recompile if not saved properly. When you assign a collision preset (e.g., "BlockAll", "OverlapAll"), it **overrides** any per-channel settings you set in code or Blueprint. If you need custom channels, create a custom preset in `DefaultEngine.ini` or use `SetCollisionResponseToChannel()` after clearing the preset with `SetCollisionProfileName("Custom")`.

### 6. Sweep traces with zero extent use different code path

Results may differ from shape traces. A line trace (`LineTraceSingleByChannel`) takes a completely different code path than a sphere trace with radius 0. Zero-extent shape traces may produce different hit normals, impact points, or miss entirely where a proper shape trace succeeds. Always use the correct trace type for your use case.

### 7. Physics materials: Friction/Restitution combine mode matters

Two bouncy objects need the correct combine rule. The combine mode (Average, Min, Multiply, Max) determines how two physics materials interact. If Object A has Restitution=1.0 (Max combine) and Object B has Restitution=0.0 (Average combine), the result depends on the priority order: Average < Min < Multiply < Max. The higher-priority combine mode wins.

### 8. Chaos destruction: fracture meshes need Geometry Collection

Regular static meshes do not destruct. In UE5, destructible meshes require a **Geometry Collection** asset created in the Fracture Editor. You cannot simply enable "destructible" on a regular `UStaticMeshComponent`. The workflow is: Static Mesh -> Fracture Editor -> Geometry Collection -> `AGeometryCollectionActor`.

## Physics Query Python Helpers via ue:console

Use these helpers to automate physics testing in a running editor:

```python
# Line trace from camera
import unreal
world = unreal.EditorLevelLibrary.get_editor_world()
start = unreal.EditorLevelLibrary.get_level_viewport_camera_info()[0]  # location
end = start + unreal.EditorLevelLibrary.get_level_viewport_camera_info()[1].get_forward_vector() * 10000
hit = unreal.SystemLibrary.line_trace_single(world, start, end, unreal.TraceTypeQuery.TRACE_TYPE_QUERY1, False, [], unreal.DrawDebugTrace.FOR_DURATION, True)
if hit: print(f"Hit: {hit.get_actor().get_name()} at {hit.impact_point}")
```

```python
# Check collision settings on selected actors
actors = unreal.EditorUtilityLibrary.get_selected_actors()
for a in actors:
    root = a.root_component
    if root:
        print(f"{a.get_name()}: profile={root.get_collision_profile_name()}, simulate={root.is_simulating_physics()}, overlap={root.get_generate_overlap_events()}")
```

```python
# Sphere overlap test at location
world = unreal.EditorLevelLibrary.get_editor_world()
results = unreal.SystemLibrary.sphere_overlap_actors(world, unreal.Vector(0,0,100), 500.0, [unreal.ObjectTypeQuery.OBJECT_TYPE_QUERY1], None, [])
for r in results: print(f"Overlap: {r.get_name()}")
```

```python
# Enable physics on selected actors
actors = unreal.EditorUtilityLibrary.get_selected_actors()
for a in actors:
    root = a.root_component
    if root and hasattr(root, 'set_simulate_physics'):
        root.set_simulate_physics(True)
        print(f"Enabled physics on {a.get_name()}")
```

## When to Delegate to This Skill

- Configuring collision profiles and channels (custom or built-in)
- Setting up physics materials (friction, restitution, density)
- Creating physics constraints (hinges, prismatic, ball-socket, fixed)
- Implementing ragdoll systems (activation, blending, recovery)
- Configuring Chaos physics engine settings
- Setting up destructible meshes and Geometry Collections
- Writing or debugging physics queries (line traces, shape traces, overlaps)
- Optimizing physics performance (sleeping, LOD, async physics)
- Debugging collision/overlap event failures
- Setting up physics sub-stepping

## When NOT to Delegate Here

- **Movement component setup** (CharacterMovementComponent, FloatingPawnMovement) -> use `ue:coder`
- **Animation physics** (AnimDynamics, physics-driven animation, cloth) -> use `ue:animation`
- **Material visuals** (physical material appearance, surface shaders) -> use `ue:material`
- **General C++ code** (actors, components, subsystems not related to physics) -> use `ue:coder`
- **Networking replication of physics** -> use `ue:networking` (but consult this skill for the physics side)
- **Blueprint-only visual scripting** (non-physics graphs) -> use `ue:blueprint`

## Knowledge Files

| File | Contents |
|------|----------|
| `knowledge/collision.md` | Collision channels, responses, profiles, presets, custom channels, collision components, simple vs complex, filtering logic, overlap/hit events, DefaultEngine.ini config |
| `knowledge/physics-simulation.md` | Chaos physics, rigid body setup, mass/damping, constraints (Fixed/Hinge/Prismatic/Ball-Socket), physics materials, callbacks, sub-stepping, async physics, LOD, sleeping, ragdoll, destructibles/Geometry Collections |
| `knowledge/traces-queries.md` | Line traces, shape traces, overlap tests, trace channels vs object channels, FHitResult, debug drawing, async traces, performance optimization, common patterns (hitscan, ground check, visibility, interact range) |

## Workflow

1. **Diagnose**: Identify the physics subsystem involved (collision config, simulation, queries).
2. **Consult knowledge**: Read the relevant knowledge file for reference.
3. **Check pitfalls**: Cross-reference against the 8 critical mistakes above.
4. **Implement**: Write C++ or Blueprint-compatible code. Use `/ue:console` helpers for testing.
5. **Verify**: Use debug drawing and collision visualization (`show Collision` in viewport) to confirm behavior.
6. **Optimize**: Check for unnecessary traces, physics bodies, or overlap events that could be culled.
