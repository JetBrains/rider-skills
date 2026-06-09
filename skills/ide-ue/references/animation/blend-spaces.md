# Blend Spaces and Locomotion

## Overview

Blend Spaces are animation assets that blend between multiple AnimSequences based on input parameter values. They are the foundation of locomotion systems, allowing smooth transitions between idle, walk, run, and directional movement animations driven by runtime variables like speed and direction.

---

## 1D vs 2D Blend Spaces

### 1D Blend Space (BlendSpace1D)
- Single input axis (e.g., Speed).
- Samples are placed along a one-dimensional line.
- Use for: simple speed-based locomotion (idle -> walk -> run), lean blending, aim pitch.
- Simpler to set up, lower evaluation cost.

### 2D Blend Space
- Two input axes (e.g., Speed on X, Direction on Y).
- Samples are placed on a 2D grid.
- Use for: directional locomotion (strafe, forward, backward at varying speeds), aim offset (yaw + pitch).
- More expressive but requires more animation samples to fill the space.

### Choosing Between Them
- If the animation only varies along one dimension, use 1D. Forcing a 2D space with one constant axis wastes samples and adds complexity.
- For 8-directional locomotion (forward, back, left, right, diagonals) at multiple speeds, 2D is required.

---

## Axis Configuration and Sample Placement

### Axis Setup
Each axis has:
- **Name**: Descriptive label (e.g., "Speed", "Direction").
- **Minimum / Maximum**: The range of input values. This MUST match the range of the variable driving it.
- **Grid Divisions**: Number of grid lines for snapping samples. Does not affect blending -- only editor convenience.
- **Snap to Grid**: Whether samples snap to grid intersections.

### Common Axis Ranges
| Parameter | Typical Min | Typical Max | Notes |
|-----------|------------|------------|-------|
| Speed | 0 | 350-600 | Match MaxWalkSpeed from CMC |
| Direction | -180 | 180 | Degrees, 0 = forward |
| Aim Yaw | -90 | 90 | Or -180/180 for full rotation |
| Aim Pitch | -90 | 90 | Up/down look |
| Lean | -1 | 1 | Normalized lean amount |

### Sample Placement Rules
- Place samples at parameter values that match the animation's intended context (e.g., a jog animation at Speed=300).
- Samples at the boundary of the space are extrapolated if inputs exceed the range -- clamp inputs in the AnimBP to avoid this.
- In 2D spaces, ensure the corners and edges have samples. Missing corner samples cause dead zones.
- The blend algorithm uses Delaunay triangulation -- irregular sample placement can create unexpected blend triangles.

### Smoothing
- **Target Weight Interpolation Speed**: Controls how fast the blend space reacts to input changes. Lower values = smoother but laggier response. Higher values = snappier but can cause jitter.
- Set to 0 for instant response (no smoothing). Values between 2-6 are typical for locomotion.
- **Damping**: Additional smoothing on axis values. Useful for preventing jitter from noisy input (e.g., analog stick).

---

## Locomotion Blend Space Patterns

### Speed-Only (1D)
The simplest locomotion setup:
- Axis: Speed (0 to MaxWalkSpeed).
- Samples: Idle at 0, Walk at 150-200, Jog at 350, Sprint at 600.
- Works well for forward-only movement (platformers, follow cameras).

### Speed + Direction (2D)
Standard third-person locomotion:
- X Axis: Speed (0 to MaxWalkSpeed).
- Y Axis: Direction (-180 to 180).
- Samples at each speed tier: forward (0), forward-right (45), right (90), back-right (135), back (180), and mirrored for left.
- Minimum ~9 samples per speed tier for smooth directional coverage.

### Cardinal Direction Pattern
Alternative to continuous direction blending:
- Use 4 or 8 blend spaces (Forward, Backward, Left, Right, or including diagonals).
- Select the appropriate blend space based on the direction quadrant.
- Each individual blend space is 1D (speed only).
- Lyra uses a variant of this approach for cleaner directional transitions.

### Start/Stop/Pivot Animations
For high-quality locomotion, blend spaces alone are insufficient. Combine with:
- Dedicated start animations (triggered when transitioning from idle to moving).
- Stop animations (triggered when speed drops below threshold).
- Pivot/turn animations (triggered on sharp direction changes).
- Distance matching to sync animation distance with actual movement distance.

---

## Aim Offset Setup

Aim Offsets are a specialized type of blend space designed for additive aim poses.

### Structure
- Typically 2D: Yaw (-90 to 90 or -180 to 180) x Pitch (-90 to 90).
- Each sample is an **additive** animation representing the character looking in that direction.
- The base animation (idle, walk, etc.) is not part of the aim offset -- it is applied additively on top.

### Creating Aim Offset Animations
1. Author center (0,0), up (0,90), down (0,-90), left (-90,0), right (90,0), and corner poses.
2. Export each as a single-frame AnimSequence.
3. Set each animation's **Additive Anim Type** to `Mesh Space` (not Local Space -- Mesh Space handles bone chain inheritance correctly).
4. Set the **Base Pose Type** to the reference pose (usually the skeleton's ref pose or a specific idle frame).

### Using in AnimBP
- Place an `AimOffset` node in the Anim Graph (or use Apply Additive with a blend space as the additive input).
- Connect the base pose input to the locomotion output.
- Feed Aim Yaw and Aim Pitch as the axis values.
- These values typically come from the character's aim rotation (`GetBaseAimRotation()`), calculated as the delta between mesh forward and aim direction.

### Common Mistakes
- Using Local Space additive instead of Mesh Space -- causes bones to double-rotate.
- Not clamping aim values to the blend space range -- extrapolation produces extreme neck rotations.
- Forgetting to set the base pose on additive animations -- results in a broken rest pose.

---

## Additive Animations

Beyond aim offsets, additive animations are used for:
- **Hit reactions**: Additive flinch layered on top of locomotion.
- **Breathing**: Subtle chest expansion overlaid on any state.
- **Leaning**: Body lean during turns or strafing.

### Additive Types
- **Local Space**: Bone transforms are added in the bone's local coordinate system. Suitable for small, localized adjustments (breathing, subtle reactions).
- **Mesh Space**: Bone transforms are added in mesh (component) coordinate space. Required when the additive needs to be independent of the base animation's bone orientations (aim offsets, full-body leans).

### Applying Additives in the Anim Graph
- `Apply Additive` node: Takes a base pose and an additive pose, outputs the combined result.
- `Blend Poses by Bool/Int`: Can conditionally apply additives.
- `Layered Blend Per Bone`: Apply additive only to specific bones (see Per-Bone Blending below).

---

## Per-Bone Blending and Layered Blending

### Layered Blend Per Bone
This node blends multiple pose inputs where each layer affects only specified bones.

Setup:
1. Connect the base pose (full body locomotion) to the Base Pose pin.
2. Connect layer pose(s) to the Blend Poses array.
3. For each layer, configure the **Branch Filter**: specify a bone name and blend depth.
   - Bone name: The root bone of the blend region (e.g., `spine_03` for upper body).
   - Blend depth: How many bones deep the blend extends. -1 = all children.
   - Blend weight: 0 to 1 per layer.

### Common Patterns

**Upper Body Override**:
- Base: Locomotion blend space (full body).
- Layer 1: Weapon anim or montage slot, filtered to `spine_01` and all children.
- Result: Legs run while upper body plays attack/reload animation.

**Additive Hit React**:
- Base: Full body animation.
- Layer 1: Additive hit reaction, filtered to `spine_02` with depth 3.
- Result: Torso flinches while legs and arms are unaffected.

### Blend Profiles
- Create a **Blend Profile** asset that assigns per-bone blend weights.
- Reference the Blend Profile in transition rules or blend nodes.
- Allows fine-grained control: e.g., fingers blend fast (0.1s), spine blends slow (0.3s).

### Bone Masking
- More granular than layer filters.
- Create a **Bone Mask** to explicitly include/exclude bones.
- Useful when the bone hierarchy doesn't cleanly split into upper/lower body.

---

## Performance Notes

- Blend spaces are cheap to evaluate (single triangulation + lerp per frame).
- Many samples in a 2D blend space don't significantly impact runtime cost -- the cost is per-evaluation, not per-sample.
- Target weight interpolation adds minimal overhead.
- The main cost driver is the number of animations being simultaneously decompressed and blended -- blend spaces typically blend 3 samples (one triangle), which is efficient.
- For LOD optimization, swap detailed blend spaces for simpler 1D versions at lower LODs.

---

## MCP tools

| Tool | Purpose | Scenario |
|------|---------|----------|
| `ue_play` | Start PIE | Drive the character at different speeds/directions to exercise the blend space |
| `ue_execute_python` | Query locomotion parameters at runtime | Read `character_movement.velocity` to verify axis values actually fed into the blend space match expected ranges |
| `search_assets` | Find blend space assets | Locate `.uasset` for `get_asset_properties` review |
| `get_asset_properties` | Read blend space CDO defaults | Inspect axis ranges, sample positions, interpolation settings |
| `take_screenshot` | Capture a locomotion pose | Visual check that the correct animation sample is selected at a given speed |
