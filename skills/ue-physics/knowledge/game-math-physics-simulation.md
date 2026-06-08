# Physics Simulation — UE API Reference

---

## UE Physics Units

**Everything is centimeters.** Gravity default: **-980 cm/s^2** (not -9.8 m/s^2). Scale all physics values accordingly.

---

## UE Chaos Physics API

UE wraps Chaos physics internally. Key classes and methods:

### Applying Forces and Impulses

| Method | Behavior | Use When |
|--------|----------|----------|
| `AddForce(FVector)` | Accumulated over physics tick (continuous) | Thrust, wind, springs |
| `AddImpulse(FVector)` | Instantaneous velocity change | Explosions, jumps, one-shot events |
| `AddTorque(FVector)` | Continuous rotational force | Spinning motors |
| `AddAngularImpulseInRadians(FVector)` | Instantaneous angular velocity change | Impact reactions |

**Do NOT use `AddForce()` for one-shot events** — it spreads over the tick and feels weak. Use `AddImpulse()`.

**Do NOT use `AddImpulse()` in Tick for continuous forces** — it bypasses force accumulation and substepping.

### Velocity Access

```cpp
Comp->SetPhysicsLinearVelocity(FVector);
Comp->SetPhysicsAngularVelocityInRadians(FVector);
Comp->GetPhysicsLinearVelocity();
Comp->GetPhysicsAngularVelocityInRadians();
```

### Collision Events and Queries

| API | Purpose |
|-----|---------|
| `UPrimitiveComponent::OnComponentHit` | Collision event delegate |
| `FHitResult` | Contact point, normal, penetration depth, hit actor |
| `UWorld::SweepSingleByChannel()` | Swept shape cast (single hit) |
| `UWorld::SweepMultiByChannel()` | Swept shape cast (multiple hits) |
| `UWorld::LineTraceSingleByChannel()` | Ray cast |

### FBodyInstance

Core physics body wrapper:

| API | Purpose |
|-----|---------|
| `FBodyInstance::GetCOMPosition()` | Center of mass world position |
| `FBodyInstance::GetMassOverride()` | Mass control |
| `FBodyInstance::bUseCCD` | Enable continuous collision detection |
| `FBodyInstance::bSimulatePhysics` | Toggle simulation |

---

## Substepping

UE physics runs at a **fixed substep rate** (default 1/60s), independent of frame rate.

- Do NOT multiply physics forces by frame delta time — the engine handles substepping internally.
- Custom physics in `TickComponent` should use `DeltaTime` from the function parameter, not `GetWorld()->GetDeltaSeconds()`.
- Increase substep rate (Project Settings > Physics > Max Substep Delta Time) for stiff springs or high-speed constraints.

---

## Other Physics APIs

- **CCD**: `BodyInstance.bUseCCD = true` (or Blueprint: Physics body > Advanced > CCD). Expensive — only for fast/small objects.
- **Sleeping**: `WakeRigidBody()` before applying forces (sleeping bodies ignore forces). `PutRigidBodyToSleep()` to manually sleep.
- **Center of mass**: `FBodyInstance::GetCOMPosition()`. Override via Blueprint: Physics body > Center of Mass Offset. Vehicles are very sensitive to CoM placement.
- **Inertia tensor**: Auto-computed from collision shape + mass. Override with `FBodyInstance::InertiaTensorScale`.
- **Angular velocity**: `FVector` (axis * radians/s). Torque via `AddTorque(FVector)`.

---

## Gotchas

- **AddForce vs AddImpulse**: Mixing them up is the #1 physics bug. `AddForce()` for continuous; `AddImpulse()` for one-shot.
- **Fixed substep**: Do not multiply forces by delta time. The engine substeps internally.
- **Sleeping bodies ignore forces**: Always `WakeRigidBody()` before applying forces.

---

## Quick Reference

```cpp
// Continuous force (call every tick)
Comp->AddForce(FVector(0, 0, 50000.f));

// One-shot impulse (bVelChange=true ignores mass)
Comp->AddImpulse(FVector(0, 0, 500.f), NAME_None, true);

// Sweep test
FHitResult Hit;
bool bHit = GetWorld()->SweepSingleByChannel(
    Hit, Start, End, FQuat::Identity,
    ECC_Visibility, FCollisionShape::MakeSphere(50.f));

// Wake sleeping body before applying forces
Comp->WakeRigidBody();
Comp->AddImpulse(Direction * 1000.f);
```
