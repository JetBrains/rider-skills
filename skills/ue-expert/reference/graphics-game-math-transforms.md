# Transforms, Rotations, and Quaternions — UE API Reference

---

## FTransform

Stores rotation (`FQuat`), translation (`FVector`), and scale (`FVector`) as **separate components** — not a 4x4 matrix. Avoids decomposition costs.

```cpp
FTransform T;
T.GetLocation();          // FVector
T.GetRotation();          // FQuat
T.GetScale3D();           // FVector
T.ToMatrixWithScale();    // Convert to FMatrix when needed
```

### Combining Transforms

`A * B` applies **A first, then B** (local-to-parent convention):

```cpp
FTransform WorldTransform = LocalTransform * ParentTransform;
FTransform LocalTransform = WorldTransform.GetRelativeTransform(ParentTransform);
```

### Hierarchy API

- `AActor::GetActorTransform()` — world transform
- `USceneComponent::GetRelativeTransform()` — parent-relative transform

---

## FRotator (Euler Angles)

Stores **Pitch, Yaw, Roll in degrees**.

| Component | Axis | Meaning |
|-----------|------|---------|
| Pitch | Y-axis | Look up/down |
| Yaw | Z-axis | Turn left/right |
| Roll | X-axis | Tilt sideways |

Application order: **Roll -> Pitch -> Yaw** (X -> Y -> Z).

**Use FRotator for**: UI display/input, camera controls with clamped pitch, one-shot rotation setup.

**Avoid FRotator for**: interpolation, accumulating rotations, physics angular velocity. Use FQuat instead.

Gimbal lock occurs at Pitch +/-90 degrees (Yaw and Roll collapse). Multiple Euler triples can represent the same rotation — round-tripping through FRotator may change angle values while preserving the rotation.

---

## FQuat (Quaternions)

### Construction

```cpp
FQuat Q = FQuat(FVector::UpVector, FMath::DegreesToRadians(90.0f));  // axis-angle
FQuat Q = FRotator(Pitch, Yaw, Roll).Quaternion();                   // from rotator
```

### Operations

| Operation | API | Notes |
|-----------|-----|-------|
| Combine rotations | `Q2 * Q1` | Applies **Q1 first**, then Q2 |
| Rotate vector | `Q.RotateVector(V)` | |
| Inverse rotation | `Q.UnrotateVector(V)` | Or `Q.Inverse().RotateVector(V)` |
| Slerp | `FQuat::Slerp(Q1, Q2, Alpha)` | |
| To rotator | `Q.Rotator()` | |
| To matrix | `FRotationMatrix::Make(Q)` | |
| Dot | `FQuat::Dot(Q1, Q2)` | Check sign before Slerp |

### Concatenation Order

`Q2 * Q1` = apply Q1 first, then Q2. Matches matrix convention `M2 * M1`.

---

## Gotchas

- **FRotator is degrees, FQuat constructor takes radians**: Always use `FMath::DegreesToRadians()` when constructing quaternions from angle values.
- **Quaternion multiplication order**: `Q2 * Q1` applies Q1 first. Reads right-to-left.
- **Double cover**: `Q` and `-Q` are the same rotation. Before Slerp, check `FQuat::Dot(Q1, Q2)` — if negative, negate one to take the short path.
- **Normalize after arithmetic**: Addition and scalar multiplication on quaternions break unit length. Always renormalize.
- **FTransform vs FMatrix**: Prefer `FTransform` for game logic (cheaper component access). Use `FMatrix` only for rendering or manual matrix math.
- **Non-uniform scale + rotation = shear**: FTransform cannot represent shear cleanly. Scale is applied in local space before rotation. Causes unexpected results in hierarchies with non-uniform scale.
- **Normal vector transform**: Under non-uniform scale, transform normals by inverse transpose: `M.InverseFast().GetTransposed()` or `TransformByUsingAdjointT()`.
- **Floating-point drift**: Rotation matrices accumulate error over many multiplications. Periodically rebuild from quaternion or re-orthogonalize.

---

## Quick Reference

```cpp
// Combine rotations: Q1 first, then Q2
FQuat Combined = Q2 * Q1;

// Slerp with short-path fix
if (FQuat::Dot(Q1, Q2) < 0.f) Q2 = -Q2;
FQuat Result = FQuat::Slerp(Q1, Q2, Alpha);

// FTransform from components
FTransform T(FQuat::Identity, FVector(100, 0, 0), FVector(1, 1, 1));
```
