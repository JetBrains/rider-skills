# Vectors, Matrices, and Coordinate Systems — UE API Reference

---

## UE Coordinate System

**Left-handed, Z-up, X-forward, Y-right.** Cross product direction and rotation signs are opposite from right-handed textbooks.

Units: **centimeters** everywhere.

## FVector API

| Operation | UE API | Notes |
|-----------|--------|-------|
| Dot product | `FVector::DotProduct(A, B)` or `A \| B` | Operator is pipe `\|` |
| Cross product | `FVector::CrossProduct(A, B)` or `A ^ B` | Left-hand rule in UE |
| Length | `V.Size()` or `V.Length()` | Identical |
| Length squared | `V.SizeSquared()` | Prefer over `Size()` to avoid sqrt |
| Normalize | `V.GetSafeNormal()` | Returns zero vector if length < SMALL_NUMBER |
| Unsafe normalize | `V.GetUnsafeNormal()` | NaN on zero-length — avoid unless guaranteed non-zero |
| Distance | `FVector::Dist(A, B)` | Also `FVector::DistSquared()` |
| Equality | `V.Equals(W, Tolerance)` | Never use `==` for float vectors |
| Projection of A onto B | `(FVector::DotProduct(A, B) / B.SizeSquared()) * B` | No built-in; manual formula |
| Orthonormal basis | `FVector::CreateOrthonormalBasis(X, Y, Z)` | Re-orthogonalize drifted bases |

Basis vectors from an actor:
- `GetActorForwardVector()` = X-axis
- `GetActorRightVector()` = Y-axis
- `GetActorUpVector()` = Z-axis

---

## FMatrix API (4x4)

**Row-major**, row vectors **premultiplied**: `Result = Vector * Matrix`. This is transposed from column-vector textbook convention.

| API | Purpose |
|-----|---------|
| `FMatrix::Identity` | Identity constant |
| `M.Determinant()` | Volume scale factor; 0 = singular |
| `M.GetTransposed()` | Transpose |
| `M.Inverse()` | General inverse |
| `M.TransformPosition(P)` | Transform point (w=1, affected by translation) |
| `M.TransformVector(V)` | Transform direction (w=0, ignores translation) |
| `FRotationMatrix::MakeFromXZ(Fwd, Up)` | Build rotation from basis vectors |

### Matrix Layout (row-major)

```
| R00 R01 R02 0 |
| R10 R11 R12 0 |
| R20 R21 R22 0 |
| Tx  Ty  Tz  1 |   <-- translation in LAST ROW (not column)
```

Combining: `S * T` applies S first, then T (row-vector convention).

---

## Gotchas

- **Row vs column vectors**: UE premultiplies `row * matrix`. Textbook formulas using `matrix * column` need transposed matrices.
- **Normal vector transforms**: Use **inverse transpose** of the matrix. Non-uniform scale breaks normals with the regular transform. Use `M.InverseFast().GetTransposed()` or `TransformByUsingAdjointT()`.
- **SizeSquared() over Size()**: Avoid unnecessary sqrt when comparing magnitudes.
- **Gram-Schmidt drift**: Orthonormal bases accumulate error. Periodically re-orthogonalize with `FVector::CreateOrthonormalBasis()`.
- **Floating-point comparison**: Use `V.Equals(W, Tolerance)` or `FMath::IsNearlyEqual()`, never exact `==`.

---

## Quick Reference

```cpp
// Dot and cross
float D = FVector::DotProduct(A, B);
FVector C = FVector::CrossProduct(A, B);

// Projection of A onto B
FVector Proj = (FVector::DotProduct(A, B) / B.SizeSquared()) * B;

// Angle between two vectors (radians)
float Angle = FMath::Acos(FVector::DotProduct(A.GetSafeNormal(), B.GetSafeNormal()));

// Build rotation matrix from basis vectors
FMatrix M = FRotationMatrix::MakeFromXZ(Forward, Up);

// Transform point vs direction
FVector WorldPoint = Matrix.TransformPosition(LocalPoint);
FVector WorldDir = Matrix.TransformVector(LocalDirection);
```
