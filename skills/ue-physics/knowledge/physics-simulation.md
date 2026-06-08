# Physics Simulation in Unreal Engine 5

## Chaos Physics Engine

UE5 replaced PhysX with Chaos, an in-house physics engine supporting rigid bodies, cloth,
destruction, and fluid simulation under a unified solver.

### Key Differences from PhysX

- Chaos uses a position-based solver by default (better stability for stacking).
- Geometry Collections replace legacy Destructible Meshes.
- The physics interface (`FPhysicsInterface`) abstracts the backend; most gameplay code
  is engine-agnostic.
- Chaos supports large-world coordinates natively.

### Enabling Chaos Features

Chaos is the default in UE5. Project-level toggles live in `DefaultEngine.ini`:

```ini
[/Script/Engine.PhysicsSettings]
PhysicsPrediction=ChaosPhysics
bEnableCCD=true
bEnableAsyncPhysics=true
```

---

## Rigid Body Simulation Setup

Any `UPrimitiveComponent` with collision can simulate physics.

```cpp
// In an AActor subclass constructor
UStaticMeshComponent* Mesh = CreateDefaultSubobject<UStaticMeshComponent>(TEXT("Mesh"));
Mesh->SetSimulatePhysics(true);
Mesh->SetEnableGravity(true);
Mesh->SetCollisionEnabled(ECollisionEnabled::QueryAndPhysics);
Mesh->SetCollisionProfileName(TEXT("PhysicsActor"));
RootComponent = Mesh;
```

### Runtime Activation

```cpp
void APhysicsToggleActor::EnablePhysics()
{
    UPrimitiveComponent* Prim = FindComponentByClass<UPrimitiveComponent>();
    if (!Prim) return;

    Prim->SetSimulatePhysics(true);
    Prim->WakeRigidBody();             // Ensure it is not sleeping
    Prim->SetPhysicsLinearVelocity(FVector::ZeroVector);
    Prim->SetPhysicsAngularVelocityInDegrees(FVector::ZeroVector);
}
```

---

## Mass, Damping, and Inertia

### Mass Configuration

Mass is derived from the collision shape volume and the physics material density,
or set explicitly via `SetMassOverrideInKg`.

```cpp
// Override mass to exactly 50 kg on the default body
MeshComp->SetMassOverrideInKg(NAME_None, 50.0f, true);

// Query effective mass
float Mass = MeshComp->GetMass();

// Center of mass offset (local space)
MeshComp->SetCenterOfMass(FVector(0.f, 0.f, -20.f), NAME_None);
```

### Linear and Angular Damping

Damping bleeds energy from the body each frame. Values of 0 mean no damping;
typical gameplay values range from 0.01 to 5.0.

```cpp
MeshComp->SetLinearDamping(0.5f);   // Slows translation
MeshComp->SetAngularDamping(1.0f);  // Slows rotation
```

### Inertia Tensor

Chaos computes inertia from shape geometry. You can scale it per-axis:

```cpp
FBodyInstance* Body = MeshComp->GetBodyInstance();
if (Body)
{
    Body->InertiaTensorScale = FVector(1.f, 1.f, 0.5f); // Easier to spin around Z
    Body->UpdateMassProperties();
}
```

---

## Physics Constraints

`UPhysicsConstraintComponent` connects two bodies with configurable limits.

### Fixed Constraint

Locks all six degrees of freedom. Useful for welding debris back together.

```cpp
UPhysicsConstraintComponent* Constraint =
    NewObject<UPhysicsConstraintComponent>(this);
Constraint->SetupAttachment(RootComponent);
Constraint->RegisterComponent();

Constraint->SetConstrainedComponents(MeshA, NAME_None, MeshB, NAME_None);

// Lock everything
Constraint->SetLinearXLimit(ELinearConstraintMotion::LCM_Locked, 0.f);
Constraint->SetLinearYLimit(ELinearConstraintMotion::LCM_Locked, 0.f);
Constraint->SetLinearZLimit(ELinearConstraintMotion::LCM_Locked, 0.f);
Constraint->SetAngularSwing1Limit(EAngularConstraintMotion::ACM_Locked, 0.f);
Constraint->SetAngularSwing2Limit(EAngularConstraintMotion::ACM_Locked, 0.f);
Constraint->SetAngularTwistLimit(EAngularConstraintMotion::ACM_Locked, 0.f);
```

### Hinge Constraint

One rotational degree of freedom (e.g., a door).

```cpp
void AHingeDoor::SetupHinge()
{
    HingeConstraint->SetAngularSwing1Limit(EAngularConstraintMotion::ACM_Locked, 0.f);
    HingeConstraint->SetAngularSwing2Limit(EAngularConstraintMotion::ACM_Free, 0.f);
    HingeConstraint->SetAngularTwistLimit(EAngularConstraintMotion::ACM_Limited, 90.f);

    // Optional motor to swing open
    HingeConstraint->SetAngularDriveMode(EAngularDriveMode::TwistAndSwing);
    HingeConstraint->SetAngularOrientationDrive(true, false);
    HingeConstraint->SetAngularDriveParams(500.f, 50.f, 0.f);
}
```

### Prismatic (Slider) Constraint

One translational degree of freedom (e.g., an elevator platform).

```cpp
void ASliderPlatform::SetupSlider()
{
    SliderConstraint->SetLinearXLimit(ELinearConstraintMotion::LCM_Limited, 200.f);
    SliderConstraint->SetLinearYLimit(ELinearConstraintMotion::LCM_Locked, 0.f);
    SliderConstraint->SetLinearZLimit(ELinearConstraintMotion::LCM_Locked, 0.f);

    // Drive the platform along the X axis
    SliderConstraint->SetLinearPositionDrive(true, false, false);
    SliderConstraint->SetLinearDriveParams(1000.f, 100.f, 0.f);
    SliderConstraint->SetLinearPositionTarget(FVector(200.f, 0.f, 0.f));
}
```

### Ball-Socket Constraint

Free rotation, locked translation (e.g., a wrecking ball chain link).

```cpp
void AChainLink::SetupBallSocket()
{
    BallConstraint->SetLinearXLimit(ELinearConstraintMotion::LCM_Locked, 0.f);
    BallConstraint->SetLinearYLimit(ELinearConstraintMotion::LCM_Locked, 0.f);
    BallConstraint->SetLinearZLimit(ELinearConstraintMotion::LCM_Locked, 0.f);
    BallConstraint->SetAngularSwing1Limit(EAngularConstraintMotion::ACM_Free, 0.f);
    BallConstraint->SetAngularSwing2Limit(EAngularConstraintMotion::ACM_Free, 0.f);
    BallConstraint->SetAngularTwistLimit(EAngularConstraintMotion::ACM_Free, 0.f);
}
```

### Breaking Constraints

```cpp
// Allow the constraint to break under force
Constraint->ConstraintInstance.ProfileInstance.bLinearBreakable = true;
Constraint->ConstraintInstance.ProfileInstance.LinearBreakThreshold = 5000.f;

// Listen for the break event
Constraint->OnConstraintBroken.AddDynamic(this, &AMyActor::OnConstraintSnapped);

void AMyActor::OnConstraintSnapped(int32 ConstraintIndex)
{
    UE_LOG(LogPhysics, Log, TEXT("Constraint %d broke"), ConstraintIndex);
}
```

---

## Physics Materials

`UPhysicalMaterial` defines surface response. Assign via mesh component or collision body.

### Creating in C++

```cpp
UPhysicalMaterial* RubberMat = NewObject<UPhysicalMaterial>();
RubberMat->Friction = 0.9f;
RubberMat->Restitution = 0.7f;          // High bounce
RubberMat->Density = 1.1f;              // g/cm^3 — affects auto-computed mass
RubberMat->FrictionCombineMode = EFrictionCombineMode::Max;
RubberMat->RestitutionCombineMode = EFrictionCombineMode::Max;

MeshComp->SetPhysMaterialOverride(RubberMat);
```

### Common Presets

| Material  | Friction | Restitution | Density | Notes                        |
|-----------|----------|-------------|---------|------------------------------|
| Default   | 0.7      | 0.3         | 1.0     | General purpose              |
| Ice       | 0.05     | 0.1         | 0.9     | Vehicles and sliding puzzles |
| Rubber    | 0.9      | 0.7         | 1.1     | Bouncy balls                 |
| Metal     | 0.4      | 0.2         | 7.8     | Heavy props                  |
| Wood      | 0.6      | 0.3         | 0.6     | Crates, furniture            |

### Surface Types for Audio/VFX

```cpp
// In UPhysicalMaterial subclass or via SurfaceType enum
RubberMat->SurfaceType = EPhysicalSurface::SurfaceType1; // Map in project settings

// Query at impact
void AProjectile::OnHit(UPrimitiveComponent* HitComp, AActor* OtherActor,
                         UPrimitiveComponent* OtherComp, FVector NormalImpulse,
                         const FHitResult& Hit)
{
    EPhysicalSurface Surface = UPhysicalMaterial::DetermineSurfaceType(
        Hit.PhysMaterial.Get());
    // Select VFX/SFX based on Surface
}
```

---

## Collision Callbacks

### OnHit (Blocking Hits)

Fires when two simulating (or simulating-vs-static) bodies collide with blocking response.

```cpp
// Bind in constructor or BeginPlay
MeshComp->OnComponentHit.AddDynamic(this, &AMyActor::HandleHit);

void AMyActor::HandleHit(UPrimitiveComponent* HitComp, AActor* OtherActor,
                          UPrimitiveComponent* OtherComp, FVector NormalImpulse,
                          const FHitResult& Hit)
{
    float ImpactForce = NormalImpulse.Size();
    if (ImpactForce > DamageThreshold)
    {
        float Damage = ImpactForce * DamageMultiplier;
        UGameplayStatics::ApplyDamage(OtherActor, Damage, nullptr, this, nullptr);
    }
}
```

### OnOverlap (Overlap Events)

Fires for overlap-enabled collision pairs. Both components must have
`bGenerateOverlapEvents = true`.

```cpp
TriggerVolume->OnComponentBeginOverlap.AddDynamic(this, &AMyActor::HandleOverlapBegin);
TriggerVolume->OnComponentEndOverlap.AddDynamic(this, &AMyActor::HandleOverlapEnd);

void AMyActor::HandleOverlapBegin(UPrimitiveComponent* OverlappedComp,
                                   AActor* OtherActor,
                                   UPrimitiveComponent* OtherComp,
                                   int32 OtherBodyIndex, bool bFromSweep,
                                   const FHitResult& SweepResult)
{
    if (OtherActor && OtherActor->ActorHasTag(TEXT("Player")))
    {
        ActivateTrap();
    }
}

void AMyActor::HandleOverlapEnd(UPrimitiveComponent* OverlappedComp,
                                 AActor* OtherActor,
                                 UPrimitiveComponent* OtherComp,
                                 int32 OtherBodyIndex)
{
    DeactivateTrap();
}
```

---

## Physics Sub-Stepping

Sub-stepping runs the physics solver multiple times per frame for stability at
variable frame rates.

### Configuration (DefaultEngine.ini)

```ini
[/Script/Engine.PhysicsSettings]
bSubstepping=true
MaxSubstepDeltaTime=0.008333   ; 120 Hz internal tick
MaxSubsteps=4                   ; Cap per frame
bSubsteppingAsync=true
```

### When to Enable

- Many stacked rigid bodies (e.g., Jenga tower).
- High-speed projectiles that tunnel through thin walls.
- Constraint-heavy scenes (ragdolls, chains, vehicles).

### CCD (Continuous Collision Detection)

For fast-moving bodies, enable CCD instead of (or alongside) sub-stepping:

```cpp
FBodyInstance* Body = MeshComp->GetBodyInstance();
Body->bUseCCD = true;
```

---

## Async Physics

Chaos can run the physics simulation on a dedicated thread, decoupled from the game
thread, reducing hitches.

### Enabling Async Scene

```ini
[/Script/Engine.PhysicsSettings]
bEnableAsyncPhysics=true
AsyncFixedTimeStepSize=0.01667  ; 60 Hz physics
```

### Writing Thread-Safe Physics Code

When async is active, physics state may lag one frame behind the game thread. Avoid
reading transforms from physics bodies on the game thread without going through the
component's cached values.

```cpp
// Safe: uses the interpolated / cached transform
FTransform T = MeshComp->GetComponentTransform();

// Unsafe in async mode: directly queries the physics body
// FBodyInstance* Body = MeshComp->GetBodyInstance();
// FTransform T = Body->GetUnrealWorldTransform(); // May race
```

### Async Callbacks

Physics callbacks (OnHit, OnOverlap) are marshalled to the game thread
automatically. No special handling is needed.

---

## Physics LOD and Optimization

### Simulation Distance Culling

Disable simulation for off-screen or distant actors:

```cpp
void APhysicsManager::OptimizePhysicsForDistance(const FVector& ViewLocation)
{
    for (AActor* Actor : ManagedPhysicsActors)
    {
        float Dist = FVector::Dist(Actor->GetActorLocation(), ViewLocation);
        UPrimitiveComponent* Prim = Actor->FindComponentByClass<UPrimitiveComponent>();
        if (!Prim) continue;

        if (Dist > SimulationCullDistance && Prim->IsSimulatingPhysics())
        {
            Prim->PutRigidBodyToSleep();
            Prim->SetSimulatePhysics(false);
        }
        else if (Dist <= SimulationCullDistance && !Prim->IsSimulatingPhysics())
        {
            Prim->SetSimulatePhysics(true);
            Prim->WakeRigidBody();
        }
    }
}
```

### Collision Complexity

Use simple collision (boxes, spheres, convex hulls) for runtime physics. Complex
collision (per-poly) should be reserved for static world geometry or traces only.

```cpp
MeshComp->SetCollisionEnabled(ECollisionEnabled::QueryAndPhysics);
MeshComp->BodyInstance.SetCollisionProfileName(TEXT("PhysicsActor"));
// Use simple collision for physics, complex for traces
MeshComp->bUseComplexAsSimpleCollision = false;
```

### Max Depenetration Velocity

Prevents explosive separation when bodies overlap:

```cpp
FBodyInstance* Body = MeshComp->GetBodyInstance();
Body->MaxDepenetrationVelocity = 100.f; // cm/s cap
```

---

## Sleeping and Wake Conditions

Sleeping bodies consume near-zero CPU. Chaos automatically sleeps bodies when their
linear and angular velocities fall below thresholds for a sustained period.

### Tuning Sleep Thresholds

```cpp
FBodyInstance* Body = MeshComp->GetBodyInstance();
Body->SleepFamily = ESleepFamily::Custom;
Body->CustomSleepThresholdMultiplier = 0.5f;  // More sensitive (sleeps faster)
```

### Manual Sleep/Wake

```cpp
// Force sleep
MeshComp->PutRigidBodyToSleep();

// Force wake
MeshComp->WakeRigidBody();

// Query state
bool bSleeping = MeshComp->RigidBodyIsAwake() == false;
```

### Keeping Bodies Awake

For gameplay-critical objects that must never sleep (e.g., a player-held physics prop):

```cpp
void APhysicsGrabber::TickGrab()
{
    if (GrabbedComponent && GrabbedComponent->IsSimulatingPhysics())
    {
        GrabbedComponent->WakeRigidBody();
        // Apply forces, update target location, etc.
    }
}
```

---

## Ragdoll

### Setup

Ragdoll requires a `USkeletalMeshComponent` with a `UPhysicsAsset`.

1. Create a Physics Asset in the editor (right-click Skeletal Mesh > Create > Physics Asset).
2. Configure body shapes per bone (capsules for limbs, sphere for head, box for pelvis).
3. Set constraints between adjacent bones (hinge for elbows/knees, ball-socket for shoulders).

### Activating Ragdoll at Runtime

```cpp
void AMyCharacter::ActivateRagdoll()
{
    GetMesh()->SetCollisionProfileName(TEXT("Ragdoll"));
    GetMesh()->SetSimulatePhysics(true);
    GetMesh()->SetAllBodiesSimulatePhysics(true);
    GetMesh()->WakeAllRigidBodies();

    // Disable capsule collision so the ragdoll does not fight it
    GetCapsuleComponent()->SetCollisionEnabled(ECollisionEnabled::NoCollision);

    // Disable movement
    GetCharacterMovement()->DisableMovement();
    GetCharacterMovement()->StopMovementImmediately();
}
```

### Applying Impact Impulse

```cpp
void AMyCharacter::ActivateRagdollWithImpact(const FVector& Impulse,
                                               const FVector& HitLocation,
                                               FName HitBoneName)
{
    ActivateRagdoll();
    GetMesh()->AddImpulseAtLocation(Impulse, HitLocation, HitBoneName);
}
```

### Blending Ragdoll with Animation (Physical Animation)

```cpp
void AMyCharacter::EnablePartialRagdoll(FName BoneBelow)
{
    UPhysicalAnimationComponent* PhysAnim =
        FindComponentByClass<UPhysicalAnimationComponent>();

    FPhysicalAnimationData AnimData;
    AnimData.bIsLocalSimulation = false;
    AnimData.OrientationStrength = 1000.f;
    AnimData.AngularVelocityStrength = 100.f;
    AnimData.PositionStrength = 1000.f;
    AnimData.VelocityStrength = 100.f;

    PhysAnim->SetSkeletalMeshComponent(GetMesh());
    PhysAnim->ApplyPhysicalAnimationSettingsBelow(BoneBelow, AnimData);

    GetMesh()->SetAllBodiesBelowSimulatePhysics(BoneBelow, true, true);
}
```

### Getting Up From Ragdoll

```cpp
void AMyCharacter::RecoverFromRagdoll()
{
    // Determine facing direction from pelvis
    FVector PelvisLocation = GetMesh()->GetBoneLocation(TEXT("pelvis"));
    FRotator PelvisRotation = GetMesh()->GetBoneRotation(TEXT("pelvis"));

    // Teleport capsule to ragdoll pelvis location
    FVector NewLocation = PelvisLocation;
    NewLocation.Z += GetCapsuleComponent()->GetScaledCapsuleHalfHeight();
    SetActorLocation(NewLocation);

    // Determine if face-up or face-down for choosing get-up animation
    FVector PelvisForward = PelvisRotation.Vector();
    bool bFaceDown = FVector::DotProduct(PelvisForward, FVector::UpVector) < 0.f;

    // Disable physics
    GetMesh()->SetSimulatePhysics(false);
    GetMesh()->SetCollisionProfileName(TEXT("CharacterMesh"));
    GetCapsuleComponent()->SetCollisionEnabled(ECollisionEnabled::QueryAndPhysics);
    GetCharacterMovement()->SetMovementMode(MOVE_Walking);

    // Play get-up montage (blend from ragdoll snapshot)
    UAnimMontage* GetUpMontage = bFaceDown ? GetUpFaceDownMontage : GetUpFaceUpMontage;
    PlayAnimMontage(GetUpMontage);
}
```

### Ragdoll Pose Snapshot for Blending

```cpp
void AMyCharacter::SaveRagdollPose()
{
    // Save current physics pose so the get-up animation can blend from it
    GetMesh()->SnapshotPose(RagdollSnapshot);
    // Use RagdollSnapshot as the source pose in the AnimBP via a
    // "Pose Snapshot" node connected to the blend graph
}
```

---

## Destructible Meshes and Geometry Collections

UE5 uses the Chaos Destruction system with `AGeometryCollectionActor`.

### Creating a Geometry Collection

1. Fracture a static mesh in the Fracture Mode editor (produces a `UGeometryCollection` asset).
2. Place as `AGeometryCollectionActor` in the level.
3. Configure damage thresholds on the Geometry Collection component.

### Runtime Destruction via Damage

```cpp
void ADestructibleWall::ApplyRadialDestruction(const FVector& Origin,
                                                float Radius, float Damage)
{
    TArray<FOverlapResult> Overlaps;
    FCollisionShape Shape = FCollisionShape::MakeSphere(Radius);

    if (GetWorld()->OverlapMultiByChannel(Overlaps, Origin, FQuat::Identity,
                                           ECC_Destructible, Shape))
    {
        for (const FOverlapResult& Overlap : Overlaps)
        {
            UGeometryCollectionComponent* GC =
                Cast<UGeometryCollectionComponent>(Overlap.GetComponent());
            if (GC)
            {
                GC->ApplyExternalStrain(
                    /* TransformIndex */ 0,
                    Origin,
                    Radius,
                    /* Strain */ Damage
                );
            }
        }
    }
}
```

### Field System for Destruction

Fields drive Chaos destruction (forces, strain, disable).

```cpp
void AExplosion::TriggerExplosion()
{
    URadialFalloff* StrainField = NewObject<URadialFalloff>(this);
    StrainField->SetRadialFalloff(
        /* Magnitude */ 500000.f,
        /* MinRange */ 0.f,
        /* MaxRange */ 500.f,
        /* Default */ 0.f,
        /* Radius */ 500.f,
        /* Position */ GetActorLocation(),
        EFieldFalloffType::Field_FallOff_Linear
    );

    UFieldSystemComponent* FieldComp =
        FindComponentByClass<UFieldSystemComponent>();
    FieldComp->ApplyStrainField(
        /* Enabled */ true,
        /* Position */ GetActorLocation(),
        StrainField
    );
}
```

### Geometry Collection Events

```cpp
// In BeginPlay or constructor
GeometryCollectionComp->OnChaosBreakEvent.AddDynamic(
    this, &AMyActor::OnFracture);

void AMyActor::OnFracture(const FChaosBreakEvent& BreakEvent)
{
    UE_LOG(LogPhysics, Log, TEXT("Piece broke at %s with mass %.1f"),
           *BreakEvent.Location.ToString(), BreakEvent.Mass);

    // Spawn debris VFX/SFX at break location
    UGameplayStatics::SpawnEmitterAtLocation(
        GetWorld(), FractureVFX, BreakEvent.Location);
}
```

### Cluster Management

Geometry Collections use a hierarchical cluster tree. Control how clusters break:

- Level 0: large structural chunks (high damage threshold).
- Level 1: medium chunks (medium threshold).
- Level 2: small debris (low threshold, auto-removed quickly).

### Performance Tips for Destruction

- Limit active Geometry Collection pieces with `ClusterGroupIndex` and removal timers.
- Use `SetNotifyRigidBodyCollision(false)` on debris pieces to reduce callback overhead.
- Disable collision on very small fragments via minimum size threshold in the asset.
- Pool and reuse Geometry Collection actors rather than spawning new ones.
- Use LOD on Geometry Collections for distant fracture meshes.

```cpp
// Remove debris after a delay
void ADebrisManager::ScheduleRemoval(UGeometryCollectionComponent* GC, float Delay)
{
    FTimerHandle Handle;
    GetWorldTimerManager().SetTimer(Handle, [GC]()
    {
        if (GC && IsValid(GC))
        {
            GC->GetOwner()->Destroy();
        }
    }, Delay, false);
}
```
