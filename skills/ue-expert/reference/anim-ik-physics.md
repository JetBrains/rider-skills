# IK and Physics-Based Animation

## Overview

Inverse Kinematics (IK) and physics-based animation systems add procedural realism on top of authored animations. IK solvers adjust bone chains to reach target positions (feet on uneven ground, hands gripping objects), while physics systems simulate secondary motion (hair, cloth, ragdoll). Unreal Engine provides these through Control Rig, built-in IK nodes, Physical Animation, and AnimDynamics.

---

## Control Rig Basics

Control Rig is UE5's node-based procedural animation framework. It replaces the older AnimGraph IK nodes for most use cases and provides a visual scripting environment for building IK solvers, procedural bone manipulation, and animation post-processing.

### Structure
- **Rig Graph**: The main execution graph where you build the IK logic.
- **Controls**: Named handles that serve as targets (e.g., `IK_Foot_L`, `IK_Hand_R`). These are manipulable in Sequencer and at runtime.
- **Bones**: Direct references to skeleton bones that the rig reads from and writes to.
- **Variables**: Parameters exposed for runtime input (ground normal, weapon grip offset, etc.).

### Using Control Rig in AnimBP
1. Create a Control Rig asset targeting your skeleton.
2. In the AnimBP Anim Graph, add a `Control Rig` node.
3. Connect the input pose (from state machine or blend space).
4. The Control Rig node evaluates the rig and outputs the modified pose.
5. Feed runtime data to the rig via exposed variables (set from the AnimBP Event Graph or Property Access).

### Key Advantages Over Legacy Nodes
- Single rig asset handles all IK for a character (feet, hands, spine, look-at).
- Visual debugging: preview solver results directly in the rig editor.
- Reusable across characters sharing the same skeleton.
- Supports forward and backward solve in the same graph.
- Full Math and Logic nodes available for procedural logic.

---

## FABRIK (Forward And Backward Reaching Inverse Kinematics)

### How It Works
FABRIK iteratively solves a bone chain by alternating forward (tip-to-root) and backward (root-to-tip) passes. Each pass adjusts bone positions to satisfy the target while respecting chain length constraints.

### When to Use
- Chains with 3+ bones (spine, tentacles, tails).
- When you need smooth, natural-looking results over long chains.
- Less suitable for simple 2-bone setups (use Two-Bone IK instead).

### Setup in Control Rig
```
FABRIK Node:
  - Root Bone: spine_01
  - Tip Bone: head
  - Effector: Target transform (world space)
  - Precision: 0.1 (convergence threshold)
  - Max Iterations: 10
  - Propagate to Children: false (or true for sub-chains)
```

### Tips
- Set `Max Iterations` high enough for the chain to converge (10-20 for long chains).
- Use `Pole Vector` to control the "elbow direction" of the solved chain -- without it, the chain can flip unpredictably.
- FABRIK respects bone length but NOT joint angle limits by default. Add constraints separately if needed.

---

## Two-Bone IK

### How It Works
Solves a simple 3-joint chain (root, mid, tip) to reach a target. The classic use case: upper arm -> forearm -> hand reaching a target, or thigh -> calf -> foot reaching the ground.

### When to Use
- Limb IK: arms and legs.
- The most common and performant IK solver.
- Not suitable for chains with more than 3 joints.

### Setup
```
Two Bone IK:
  - Root Bone: thigh_l
  - Mid Bone: calf_l (automatically inferred in some setups)
  - Tip Bone: foot_l
  - Effector Target: World-space foot placement position
  - Joint Target (Pole Vector): Position that the knee/elbow should point toward
  - Allow Stretching: false (or true with limits)
  - Stretch Limits: Start 0.8, Max 1.2 (if stretching enabled)
```

### Critical: Pole Vector
Without a pole vector, the knee/elbow direction is undefined and may flip frame-to-frame. Always provide a pole vector:
- For legs: a point in front of the knee (character forward + slightly up).
- For arms: a point behind the elbow (character backward + slightly down).

---

## CCDIK (Cyclic Coordinate Descent IK)

### How It Works
CCDIK solves by rotating one bone at a time from tip to root, each rotation bringing the tip closer to the target. Iterates multiple times until convergence.

### When to Use
- Chains where FABRIK's stretching behavior is undesirable.
- When you need per-bone rotation limits (CCDIK naturally supports angle constraints).
- Spine bending, mechanical arms with joint limits.

### Setup
- Similar to FABRIK: specify root bone, tip bone, effector.
- Per-bone rotation limits can be set to constrain each joint individually.
- `Rotation Limit Per Joints`: array of max angle deltas per bone.

---

## Foot Placement IK

The most common IK application: adjusting feet to match uneven terrain.

### Full Pipeline
1. **Trace**: From each foot bone, cast a line trace downward to find the ground surface.
2. **Compute offset**: Calculate the vertical difference between the flat-ground foot position and the trace hit point.
3. **Adjust pelvis**: Lower the pelvis (root/hips bone) by the largest foot offset to prevent legs from stretching.
4. **Solve IK**: Apply Two-Bone IK to each leg, with the effector at the trace hit point.
5. **Rotate foot**: Align the foot bone to the ground normal from the trace hit.

### Implementation in Control Rig
```
// Per foot (left and right):
1. Get bone transform (foot_l) in world space
2. Line trace from foot + (0,0,50) downward by 100 units
3. If hit: offset = hit.Z - foot.Z
4. Pelvis offset = min(left_offset, right_offset)  // lower pelvis
5. Adjust pelvis bone by (0, 0, pelvis_offset)
6. Two-Bone IK: thigh_l -> calf_l -> foot_l, target = hit location
7. Rotate foot_l to align with hit normal
```

### Common Mistakes
- Forgetting to lower the pelvis -- one leg stretches impossibly.
- Using too long a trace distance -- feet snap to surfaces far below ledges.
- Not interpolating IK weight -- causes snapping when transitioning on/off slopes.
- Not accounting for animation root motion offset when computing trace origin.

### IK Weight Interpolation
- Blend the IK effect on/off smoothly (over 0.1-0.2s) to avoid pops.
- When the character is in the air (jumping/falling), blend IK weight to 0.
- Use `FMath::FInterpTo` for smooth weight transitions.

---

## Hand IK for Weapons

### Two-Hand Weapon Grip
1. Dominant hand is animated normally (part of the weapon animation or montage).
2. Off-hand uses IK to reach a socket on the weapon mesh.
3. In the AnimBP: after the main pose, apply Two-Bone IK on the off-hand arm chain with the weapon socket's world transform as the effector.

### Setup
```
// In AnimBP or Control Rig:
1. Get weapon mesh socket transform ("LeftHandGrip" socket)
2. Two-Bone IK: upperarm_l -> lowerarm_l -> hand_l
   Effector = socket world transform
   Pole Vector = elbow target (behind and below the socket)
3. Blend weight based on weapon state (holstered = 0, equipped = 1)
```

### Virtual Bones
- Create a **Virtual Bone** between two existing bones to serve as an IK target embedded in the skeleton.
- Useful for weapon grip points that need to move with the skeleton but don't correspond to a real bone.
- Virtual bones are zero-cost at runtime.

---

## Physical Animation Component

The Physical Animation Component drives skeletal mesh bones with physics simulation while blending with authored animation.

### Setup
1. Add `UPhysicalAnimationComponent` to the character.
2. The skeletal mesh must have a **Physics Asset** with bodies for relevant bones.
3. Call `ApplyPhysicalAnimationSettingsBelow(BoneName, Settings)` to enable physics on a bone chain.
4. Call `SetSkeletalMeshComponent(Mesh)` to bind the component.

### Physical Animation Settings
```cpp
FPhysicalAnimationData Settings;
Settings.bIsLocalSimulation = false;
Settings.OrientationStrength = 1000.f;  // How strongly bones try to match animation
Settings.AngularVelocityStrength = 100.f;
Settings.PositionStrength = 1000.f;
Settings.VelocityStrength = 100.f;
```

### Use Cases
- Procedural hit reactions that respect physics (character staggers based on impact direction).
- Interactive objects (grabbing, pushing) where bones need to react to physics forces.
- Partial ragdoll: upper body physically simulated while legs play walk animation.

---

## Ragdoll Setup and Blending

### Physics Asset
- Every bone that participates in ragdoll needs a **physics body** (capsule, sphere, or convex shape) in the Physics Asset.
- Add **constraints** between adjacent bodies to limit joint ranges (prevent limbs from bending backward).
- Tune constraint limits: stiff for spine (15-30 degrees), loose for arms (90+ degrees).

### Triggering Ragdoll
```cpp
// Full ragdoll:
Mesh->SetSimulatePhysics(true);
Mesh->SetAllBodiesBelowSimulatePhysics(FName("pelvis"), true);

// Stop ragdoll (get up):
Mesh->SetSimulatePhysics(false);
```

### Blend from Animation to Ragdoll
- Use `Physical Animation Blend Weight` to smoothly transition.
- `SetAllBodiesBelowPhysicsBlendWeight(BoneName, Weight)`: 0 = pure animation, 1 = pure physics.
- Ramp weight from 0 to 1 over 0.1-0.3s for a smooth death transition.

### Get-Up from Ragdoll
1. Capture the ragdoll pose via `Pose Snapshot`.
2. Disable physics simulation.
3. Determine if the character is face-up or face-down (check pelvis forward vector).
4. Play the appropriate get-up montage.
5. Blend from the snapshot pose into the get-up animation over 0.2-0.5s.

### Ragdoll Networking
- Ragdoll is NOT replicated by default. Physics simulations diverge across clients.
- For death: trigger ragdoll on each client independently (acceptable visual divergence).
- For recoverable ragdoll (get-up), replicate the trigger event and let each client simulate locally. Snap to the replicated position after recovery.

---

## AnimDynamics for Secondary Motion

AnimDynamics simulates lightweight physics on bone chains for secondary motion: hair, capes, tails, pouches, antenna.

### Setup in AnimBP
1. Add an `AnimDynamics` node in the Anim Graph (after the main pose).
2. Configure the bone chain: specify the bone to simulate.
3. Set physics properties:
   - **Linear Limits**: How far the bone can move from its animated position (box constraints).
   - **Angular Limits**: How far the bone can rotate from its animated orientation.
   - **Damping**: Resistance to motion (higher = less bouncy). 0.5-0.8 is typical.
   - **Stiffness**: How strongly the bone returns to its animated position. Higher = stiffer.
   - **Gravity Scale**: How much gravity affects the bone. 1.0 = full gravity.
   - **Wind**: Enable to respond to the wind system.

### Per-Bone Setup
For a chain (e.g., ponytail with 4 bones):
- Apply AnimDynamics to each bone in the chain.
- Decrease stiffness down the chain (root = stiff, tip = loose) for natural falloff.
- Or use a single AnimDynamics node with `Chain` mode that handles the full chain.

### Performance
- AnimDynamics is cheaper than full physics simulation (no collision detection).
- Use `LOD Threshold` on the AnimDynamics node to disable it at lower LODs.
- For many characters with hair/cloth dynamics, consider significance-based culling.
- On mobile, consider disabling AnimDynamics entirely and using pre-baked animation instead.

### AnimDynamics vs Physical Animation
| Feature | AnimDynamics | Physical Animation |
|---------|-------------|-------------------|
| Collision with world | No | Yes |
| Cost | Low | High |
| Setup complexity | Simple (per-bone) | Complex (Physics Asset required) |
| Best for | Hair, cloth, tails | Hit reactions, interactive physics |
| Fidelity | Approximate | Physically accurate |

### Common Patterns
- **Hair**: Chain of 3-5 bones, medium stiffness, high damping, gravity enabled.
- **Cape/Cloak**: Multiple parallel chains from the shoulder line, low stiffness, medium damping.
- **Weapon sway**: Single bone on the weapon, high stiffness (subtle sway), high damping.
- **Antenna/Feathers**: Short chain, low damping (bouncy), medium stiffness.
