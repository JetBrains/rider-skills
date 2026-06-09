# Physics Traces and Queries in Unreal Engine 5

## Overview

Physics traces (raycasts) and overlap queries are the primary tools for spatial
interrogation in UE5. They test geometry against the physics scene without moving
objects, returning hit information used for shooting, ground detection, AI sight,
interaction systems, and more.

All trace functions live on `UWorld` and come in single-hit and multi-hit variants.

---

## Line Traces

### Single Line Trace

Returns the first blocking hit along a ray.

```cpp
bool AWeapon::FireHitscan(const FVector& MuzzleLocation,
                           const FVector& ShotDirection,
                           float Range)
{
    FVector Start = MuzzleLocation;
    FVector End = Start + ShotDirection * Range;

    FHitResult Hit;
    FCollisionQueryParams Params;
    Params.AddIgnoredActor(this);
    Params.AddIgnoredActor(GetOwner());
    Params.bReturnPhysicalMaterial = true;

    bool bHit = GetWorld()->LineTraceSingleByChannel(
        Hit,
        Start,
        End,
        ECC_Visibility,   // Trace channel
        Params
    );

    if (bHit)
    {
        ProcessHit(Hit);
    }

    return bHit;
}
```

### Multi Line Trace

Returns all hits (blocking and overlapping) along the ray, sorted by distance.

```cpp
void APenetrationRifle::FirePenetratingShot(const FVector& Start,
                                              const FVector& End,
                                              int32 MaxPenetrations)
{
    TArray<FHitResult> Hits;
    FCollisionQueryParams Params;
    Params.AddIgnoredActor(this);
    Params.AddIgnoredActor(GetOwner());
    Params.bReturnPhysicalMaterial = true;

    GetWorld()->LineTraceMultiByChannel(
        Hits,
        Start,
        End,
        ECC_GameTraceChannel1,  // Custom penetration channel
        Params
    );

    int32 PenCount = 0;
    for (const FHitResult& Hit : Hits)
    {
        if (PenCount >= MaxPenetrations) break;

        ApplyDamageAtHit(Hit);

        if (Hit.bBlockingHit)
        {
            ++PenCount;
        }
    }
}
```

---

## Shape Traces

Shape traces sweep a volume along a ray. More expensive than line traces but
essential for fat queries (character movement, projectiles with radius).

### Sphere Trace

```cpp
bool AInteractionSystem::SphereTraceForInteractable(const FVector& Start,
                                                      const FVector& End,
                                                      float Radius,
                                                      FHitResult& OutHit)
{
    FCollisionShape Shape = FCollisionShape::MakeSphere(Radius);
    FCollisionQueryParams Params;
    Params.AddIgnoredActor(this);

    return GetWorld()->SweepSingleByChannel(
        OutHit,
        Start,
        End,
        FQuat::Identity,
        ECC_GameTraceChannel2,  // Interaction channel
        Shape,
        Params
    );
}
```

### Box Trace

```cpp
bool AVehicleSensor::BoxTraceForward(FHitResult& OutHit)
{
    FVector Start = GetActorLocation();
    FVector End = Start + GetActorForwardVector() * DetectionRange;

    FCollisionShape Shape = FCollisionShape::MakeBox(
        FVector(50.f, 100.f, 30.f)  // Half-extents
    );

    FCollisionQueryParams Params;
    Params.AddIgnoredActor(this);

    return GetWorld()->SweepSingleByChannel(
        OutHit,
        Start,
        End,
        GetActorQuat(),
        ECC_Visibility,
        Shape,
        Params
    );
}
```

### Capsule Trace

Commonly used for character-sized queries (safe teleport, ledge detection).

```cpp
bool AMyCharacter::CapsuleTraceForSafeLanding(const FVector& TargetLocation,
                                                FHitResult& OutHit)
{
    float CapsuleRadius = GetCapsuleComponent()->GetScaledCapsuleRadius();
    float CapsuleHalfHeight = GetCapsuleComponent()->GetScaledCapsuleHalfHeight();

    FCollisionShape Shape = FCollisionShape::MakeCapsule(
        CapsuleRadius, CapsuleHalfHeight
    );

    FVector Start = TargetLocation + FVector(0.f, 0.f, CapsuleHalfHeight + 50.f);
    FVector End = TargetLocation;

    FCollisionQueryParams Params;
    Params.AddIgnoredActor(this);

    return GetWorld()->SweepSingleByChannel(
        OutHit,
        Start,
        End,
        FQuat::Identity,
        ECC_Pawn,
        Shape,
        Params
    );
}
```

---

## Overlap Tests

Overlap queries check whether a shape at a given position overlaps any geometry.
No sweep direction is needed.

### Overlap Multi

```cpp
TArray<AActor*> AExplosion::GetActorsInBlastRadius(const FVector& Origin,
                                                     float Radius)
{
    TArray<FOverlapResult> Overlaps;
    FCollisionShape Shape = FCollisionShape::MakeSphere(Radius);

    FCollisionQueryParams Params;
    Params.AddIgnoredActor(this);

    FCollisionObjectQueryParams ObjectParams;
    ObjectParams.AddObjectTypesToQuery(ECC_Pawn);
    ObjectParams.AddObjectTypesToQuery(ECC_PhysicsBody);
    ObjectParams.AddObjectTypesToQuery(ECC_Destructible);

    GetWorld()->OverlapMultiByObjectType(
        Overlaps,
        Origin,
        FQuat::Identity,
        ObjectParams,
        Shape,
        Params
    );

    TArray<AActor*> Result;
    for (const FOverlapResult& Overlap : Overlaps)
    {
        if (AActor* Actor = Overlap.GetActor())
        {
            Result.AddUnique(Actor);
        }
    }
    return Result;
}
```

### Overlap Test (Boolean Only)

When you only need to know if something is there, without details:

```cpp
bool ASpawnManager::IsSpawnPointClear(const FVector& Location, float Radius)
{
    FCollisionShape Shape = FCollisionShape::MakeSphere(Radius);
    FCollisionQueryParams Params;

    // Returns true if there IS an overlap (i.e., blocked)
    return !GetWorld()->OverlapBlockingTestByChannel(
        Location,
        FQuat::Identity,
        ECC_Pawn,
        Shape,
        Params
    );
}
```

---

## Trace Channels vs Object Channels

### ECollisionChannel (ECC) - Trace Channels

Trace channels define a query type. The collision response matrix (in Project Settings)
determines which object types block or overlap a trace channel.

| Channel               | Typical Use                        |
|-----------------------|------------------------------------|
| `ECC_Visibility`      | Camera, line-of-sight, hitscan     |
| `ECC_Camera`          | Camera obstruction                 |
| `ECC_GameTraceChannel1..18` | Custom project channels     |

### Object Type Queries (EObjectTypeQuery)

Object type queries match against the object type set on each component. Useful when
you want to find all objects of specific types regardless of channel response.

```cpp
// Trace by object type rather than channel
TArray<FHitResult> Hits;
FCollisionObjectQueryParams ObjectParams;
ObjectParams.AddObjectTypesToQuery(ECC_Pawn);
ObjectParams.AddObjectTypesToQuery(ECC_PhysicsBody);

GetWorld()->LineTraceMultiByObjectType(
    Hits, Start, End, ObjectParams, Params
);
```

### When to Use Which

- **By Channel**: when the trace represents an action (shooting, seeing, interacting) and
  you want per-object-type response control (block, overlap, ignore).
- **By Object Type**: when you want to find all objects of certain types regardless of
  how they respond to specific channels (e.g., "give me all Pawns in this sphere").

---

## Trace Parameters

### FCollisionQueryParams

```cpp
FCollisionQueryParams Params(TEXT("MyTrace"), false, OwnerActor);

// Stat tracking name (shows in profiler)
Params.TraceTag = TEXT("WeaponTrace");

// Use complex collision (per-poly) for the trace
Params.bTraceComplex = true;

// Return the face index (needed for UV queries on complex collision)
Params.bReturnFaceIndex = true;

// Return the physical material at the hit point
Params.bReturnPhysicalMaterial = true;

// Ignore specific actors
Params.AddIgnoredActor(this);
Params.AddIgnoredActors(IgnoreList);

// Ignore specific components
Params.AddIgnoredComponent(ShieldMesh);

// Stat ID for unreal insights
Params.OwnerTag = TEXT("WeaponSystem");
```

### FCollisionResponseParams

Override default channel responses for a single query:

```cpp
FCollisionResponseParams ResponseParams;
// Usually left at default; the collision profile on objects determines responses
```

---

## FHitResult Structure

`FHitResult` carries all information about a trace or sweep hit.

```cpp
void AWeapon::ProcessHit(const FHitResult& Hit)
{
    // Did the trace hit anything?
    bool bBlocking = Hit.bBlockingHit;

    // World-space impact point and normal
    FVector ImpactPoint = Hit.ImpactPoint;
    FVector ImpactNormal = Hit.ImpactNormal;

    // Distance from trace start to impact
    float Distance = Hit.Distance;

    // Fraction along the trace [0..1]
    float TimeFraction = Hit.Time;

    // The actor and component that were hit
    AActor* HitActor = Hit.GetActor();
    UPrimitiveComponent* HitComponent = Hit.GetComponent();

    // Bone name (for skeletal meshes)
    FName BoneName = Hit.BoneName;

    // Physical material at the hit location
    UPhysicalMaterial* PhysMat = Hit.PhysMaterial.Get();
    EPhysicalSurface Surface = UPhysicalMaterial::DetermineSurfaceType(PhysMat);

    // Face index (valid when bTraceComplex and bReturnFaceIndex are true)
    int32 FaceIndex = Hit.FaceIndex;

    // Location where the swept shape would be at the point of impact
    FVector SweepLocation = Hit.Location;

    // The trace start and end (for reference)
    FVector TraceStart = Hit.TraceStart;
    FVector TraceEnd = Hit.TraceEnd;
}
```

---

## Debug Visualization

### Drawing Debug Shapes

```cpp
#include "DrawDebugHelpers.h"

void AMyActor::DebugDrawTrace(const FVector& Start, const FVector& End,
                                const FHitResult& Hit, bool bHit)
{
    float Duration = 2.f;
    bool bPersistent = false;

    if (bHit)
    {
        // Green line to hit point, red line from hit to end
        DrawDebugLine(GetWorld(), Start, Hit.ImpactPoint,
                      FColor::Green, bPersistent, Duration, 0, 1.f);
        DrawDebugLine(GetWorld(), Hit.ImpactPoint, End,
                      FColor::Red, bPersistent, Duration, 0, 1.f);

        // Impact marker
        DrawDebugSphere(GetWorld(), Hit.ImpactPoint, 5.f, 12,
                        FColor::Yellow, bPersistent, Duration);

        // Normal arrow
        DrawDebugDirectionalArrow(GetWorld(), Hit.ImpactPoint,
                                   Hit.ImpactPoint + Hit.ImpactNormal * 30.f,
                                   5.f, FColor::Cyan, bPersistent, Duration);
    }
    else
    {
        DrawDebugLine(GetWorld(), Start, End,
                      FColor::Green, bPersistent, Duration, 0, 1.f);
    }
}

void AMyActor::DebugDrawSphereTrace(const FVector& Start, const FVector& End,
                                      float Radius, bool bHit)
{
    float Duration = 2.f;

    DrawDebugCapsule(GetWorld(),
                     (Start + End) * 0.5f,
                     FVector::Dist(Start, End) * 0.5f + Radius,
                     Radius,
                     FRotationMatrix::MakeFromZ(End - Start).ToQuat(),
                     bHit ? FColor::Red : FColor::Green,
                     false, Duration);
}

void AMyActor::DebugDrawBox(const FVector& Center, const FVector& HalfExtents,
                              const FQuat& Rotation, bool bHit)
{
    DrawDebugBox(GetWorld(), Center, HalfExtents,
                 Rotation,
                 bHit ? FColor::Red : FColor::Green,
                 false, 2.f);
}
```

### Console Commands for Trace Debugging

```
// Show all traces in the viewport (heavy, debug only)
p.VisualizeTraces 1

// Show collision geometry
show Collision
```

---

## Async Traces

For expensive queries that can tolerate one frame of latency, use async traces.
Results arrive next frame via delegate.

### Async Line Trace

```cpp
void AAISensor::StartAsyncVisibilityTrace(const FVector& Start, const FVector& End)
{
    FCollisionQueryParams Params;
    Params.AddIgnoredActor(this);
    Params.AddIgnoredActor(GetOwner());

    FTraceDelegate Delegate;
    Delegate.BindUObject(this, &AAISensor::OnAsyncTraceComplete);

    GetWorld()->AsyncLineTraceByChannel(
        EAsyncTraceType::Single,
        Start,
        End,
        ECC_Visibility,
        Params,
        FCollisionResponseParams::DefaultResponseParam,
        &Delegate
    );
}

void AAISensor::OnAsyncTraceComplete(const FTraceHandle& Handle,
                                       FTraceDatum& Data)
{
    if (Data.OutHits.Num() > 0 && Data.OutHits[0].bBlockingHit)
    {
        // Line of sight blocked
        bCanSeeTarget = false;
    }
    else
    {
        bCanSeeTarget = true;
    }
}
```

### Async Overlap

```cpp
void AAISensor::StartAsyncOverlapQuery(const FVector& Origin, float Radius)
{
    FCollisionShape Shape = FCollisionShape::MakeSphere(Radius);
    FCollisionQueryParams Params;
    Params.AddIgnoredActor(GetOwner());

    FOverlapDelegate Delegate;
    Delegate.BindUObject(this, &AAISensor::OnAsyncOverlapComplete);

    GetWorld()->AsyncOverlapByChannel(
        Origin,
        FQuat::Identity,
        ECC_Pawn,
        Shape,
        Params,
        FCollisionResponseParams::DefaultResponseParam,
        &Delegate
    );
}

void AAISensor::OnAsyncOverlapComplete(const FTraceHandle& Handle,
                                         FOverlapDatum& Data)
{
    NearbyPawns.Reset();
    for (const FOverlapResult& Overlap : Data.OutOverlaps)
    {
        if (APawn* Pawn = Cast<APawn>(Overlap.GetActor()))
        {
            NearbyPawns.Add(Pawn);
        }
    }
}
```

---

## Performance: Trace Costs and Optimization

### Relative Cost (Cheapest to Most Expensive)

1. Line trace single by channel
2. Line trace multi by channel
3. Sphere sweep single
4. Box/Capsule sweep single
5. Overlap tests
6. Multi sweeps with complex collision
7. Per-poly (complex) traces on high-poly meshes

### Optimization Guidelines

```cpp
// 1. Minimize trace count per frame — batch and spread across frames
void AAIManager::TickSightChecks(float DeltaTime)
{
    // Only check a subset of agents each frame
    int32 BatchSize = FMath::Max(1, AllAgents.Num() / SightCheckFrameSpread);
    int32 StartIdx = (CurrentBatchIndex * BatchSize) % AllAgents.Num();

    for (int32 i = 0; i < BatchSize; ++i)
    {
        int32 Idx = (StartIdx + i) % AllAgents.Num();
        AllAgents[Idx]->PerformSightTrace();
    }
    ++CurrentBatchIndex;
}

// 2. Use the simplest trace type that works
//    Prefer line traces over shape traces when possible.

// 3. Avoid bTraceComplex unless you need per-poly precision
//    (e.g., headshot detection on a skeletal mesh).

// 4. Use async traces for non-time-critical queries (AI perception).

// 5. Short traces are cheaper — limit range where possible.

// 6. Use collision channels and profiles to filter early.
//    An object set to "Ignore" for a channel is skipped at broadphase.

// 7. Profile with Unreal Insights: look for "Trace" stat in the physics group.
```

### Trace Stat Monitoring

```cpp
// In a debug HUD or console command handler
void ADebugHUD::DrawTraceStats()
{
    // Use stat commands in console:
    // stat physics       — general physics stats
    // stat collision     — collision query stats
    // stat scenequery    — line/sweep/overlap counts
}
```

---

## Common Trace Patterns

### Hitscan Weapon

```cpp
void AHitscanWeapon::Fire()
{
    FVector MuzzleLoc = GetMuzzleLocation();
    FVector AimDir = GetAimDirection();
    FVector TraceEnd = MuzzleLoc + AimDir * WeaponRange;

    FHitResult Hit;
    FCollisionQueryParams Params(SCENE_QUERY_STAT(WeaponTrace), false, GetOwner());
    Params.bReturnPhysicalMaterial = true;

    if (GetWorld()->LineTraceSingleByChannel(Hit, MuzzleLoc, TraceEnd,
                                              ECC_GameTraceChannel1, Params))
    {
        EPhysicalSurface Surface =
            UPhysicalMaterial::DetermineSurfaceType(Hit.PhysMaterial.Get());
        float Damage = CalcDamageForSurface(BaseDamage, Surface, Hit.BoneName);

        UGameplayStatics::ApplyPointDamage(
            Hit.GetActor(), Damage, AimDir,
            Hit, GetOwner()->GetInstigatorController(),
            this, DamageType);

        SpawnImpactEffect(Surface, Hit.ImpactPoint, Hit.ImpactNormal);
    }
}
```

### Ground Check

```cpp
bool AMyCharacter::IsGroundBelow(float CheckDistance, FHitResult& OutHit)
{
    FVector Start = GetActorLocation();
    FVector End = Start - FVector(0.f, 0.f, CheckDistance);

    FCollisionQueryParams Params;
    Params.AddIgnoredActor(this);

    return GetWorld()->LineTraceSingleByChannel(
        OutHit, Start, End, ECC_Visibility, Params);
}
```

### Visibility / Line-of-Sight Check

```cpp
bool AAIController::HasLineOfSightTo(const AActor* Target) const
{
    if (!Target) return false;

    FVector EyeLocation;
    FRotator EyeRotation;
    GetPawn()->GetActorEyesViewPoint(EyeLocation, EyeRotation);

    FVector TargetLocation = Target->GetActorLocation();

    FHitResult Hit;
    FCollisionQueryParams Params(SCENE_QUERY_STAT(LOSTrace));
    Params.AddIgnoredActor(GetPawn());
    Params.AddIgnoredActor(Target);

    bool bBlocked = GetWorld()->LineTraceSingleByChannel(
        Hit, EyeLocation, TargetLocation, ECC_Visibility, Params);

    return !bBlocked;
}
```

### Interaction Range (Sphere Trace)

```cpp
AActor* APlayerCharacter::FindInteractable()
{
    FVector Start = GetCameraLocation();
    FVector End = Start + GetCameraForwardVector() * InteractionRange;

    FHitResult Hit;
    FCollisionShape Shape = FCollisionShape::MakeSphere(InteractionRadius);
    FCollisionQueryParams Params;
    Params.AddIgnoredActor(this);

    if (GetWorld()->SweepSingleByChannel(Hit, Start, End, FQuat::Identity,
                                          ECC_GameTraceChannel2, Shape, Params))
    {
        AActor* HitActor = Hit.GetActor();
        if (HitActor && HitActor->GetClass()->ImplementsInterface(
                UInteractable::StaticClass()))
        {
            return HitActor;
        }
    }
    return nullptr;
}
```

### Wall Detection for Cover System

```cpp
bool ACoverSystem::FindCoverWall(const FVector& SearchOrigin,
                                   const FVector& SearchDirection,
                                   FCoverInfo& OutCover)
{
    FHitResult Hit;
    FVector End = SearchOrigin + SearchDirection * MaxCoverSearchDistance;

    FCollisionQueryParams Params;
    Params.AddIgnoredActor(GetOwner());

    if (!GetWorld()->LineTraceSingleByChannel(Hit, SearchOrigin, End,
                                               ECC_WorldStatic, Params))
    {
        return false;
    }

    // Verify wall is tall enough
    FVector WallTop = Hit.ImpactPoint + FVector(0.f, 0.f, MinCoverHeight);
    FHitResult HeightCheck;

    bool bTallEnough = GetWorld()->LineTraceSingleByChannel(
        HeightCheck,
        WallTop,
        WallTop + SearchDirection * 20.f,
        ECC_WorldStatic, Params);

    OutCover.Location = Hit.ImpactPoint;
    OutCover.Normal = Hit.ImpactNormal;
    OutCover.bIsHighCover = bTallEnough;
    return true;
}
```

---

## Python Automation for Trace Testing

Unreal Editor Python can set up automated trace tests for QA and level validation.

### Batch Trace Validation

```python
import unreal

def validate_navmesh_ground_traces(points, max_ground_distance=500.0):
    """Verify that a list of world positions have ground beneath them."""
    world = unreal.EditorLevelLibrary.get_editor_world()
    results = []

    for pt in points:
        start = unreal.Vector(pt[0], pt[1], pt[2])
        end = unreal.Vector(pt[0], pt[1], pt[2] - max_ground_distance)

        hit = unreal.SystemLibrary.line_trace_single(
            world,
            start,
            end,
            unreal.TraceTypeQuery.TRACE_TYPE_QUERY1,  # Visibility
            True,   # bTraceComplex
            [],     # ActorsToIgnore
            unreal.DrawDebugTrace.FOR_DURATION,
            True    # bIgnoreSelf
        )

        if hit is not None:
            results.append({
                "point": pt,
                "ground_distance": (start - hit.impact_point).length(),
                "surface": hit.phys_material.get_name() if hit.phys_material else "None"
            })
        else:
            results.append({
                "point": pt,
                "ground_distance": None,
                "surface": "NO_GROUND"
            })
            unreal.log_warning(f"No ground at {pt}")

    return results


def spawn_point_clearance_check(spawn_locations, clearance_radius=50.0):
    """Check that spawn points are not inside geometry."""
    world = unreal.EditorLevelLibrary.get_editor_world()
    blocked = []

    for loc in spawn_locations:
        center = unreal.Vector(loc[0], loc[1], loc[2])
        has_overlap = unreal.SystemLibrary.sphere_overlap_actors(
            world,
            center,
            clearance_radius,
            [unreal.ObjectTypeQuery.OBJECT_TYPE_QUERY1],  # WorldStatic
            None,
            []
        )
        if has_overlap and len(has_overlap) > 0:
            blocked.append(loc)
            unreal.log_warning(f"Spawn point blocked at {loc}")

    unreal.log(f"Checked {len(spawn_locations)} points, {len(blocked)} blocked")
    return blocked


def trace_coverage_heatmap(origin, radius, grid_spacing=100.0, height=2000.0):
    """
    Cast downward traces in a grid to build a ground coverage map.
    Useful for validating playable area boundaries.
    """
    world = unreal.EditorLevelLibrary.get_editor_world()
    coverage = []

    steps = int(radius * 2 / grid_spacing)
    start_x = origin[0] - radius
    start_y = origin[1] - radius

    for xi in range(steps):
        for yi in range(steps):
            x = start_x + xi * grid_spacing
            y = start_y + yi * grid_spacing
            start = unreal.Vector(x, y, origin[2] + height)
            end = unreal.Vector(x, y, origin[2] - height)

            hit = unreal.SystemLibrary.line_trace_single(
                world, start, end,
                unreal.TraceTypeQuery.TRACE_TYPE_QUERY1,
                False, [], unreal.DrawDebugTrace.NONE, True
            )

            coverage.append({
                "x": x, "y": y,
                "hit": hit is not None,
                "z": hit.impact_point.z if hit else None
            })

    return coverage
```

### Automated Weapon Range Test

```python
def test_weapon_range(weapon_actor_name, target_actor_name, expected_hit=True):
    """
    Validate that a weapon trace from one actor reaches another.
    Useful for balancing weapon ranges in test maps.
    """
    world = unreal.EditorLevelLibrary.get_editor_world()

    weapon = unreal.EditorLevelLibrary.get_actor_reference(weapon_actor_name)
    target = unreal.EditorLevelLibrary.get_actor_reference(target_actor_name)

    if not weapon or not target:
        unreal.log_error("Could not find weapon or target actor")
        return False

    start = weapon.get_actor_location()
    end = target.get_actor_location()

    hit = unreal.SystemLibrary.line_trace_single(
        world, start, end,
        unreal.TraceTypeQuery.TRACE_TYPE_QUERY1,
        False, [weapon], unreal.DrawDebugTrace.FOR_DURATION, True
    )

    did_hit_target = (hit is not None and hit.get_actor() == target)

    if did_hit_target != expected_hit:
        unreal.log_error(
            f"FAIL: Expected hit={expected_hit}, got hit={did_hit_target} "
            f"(distance={unreal.Vector.dist(start, end):.0f})"
        )
        return False

    unreal.log(f"PASS: Weapon range test (distance={unreal.Vector.dist(start, end):.0f})")
    return True
```
