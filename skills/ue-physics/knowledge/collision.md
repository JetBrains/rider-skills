# Collision System

Comprehensive reference for Unreal Engine's collision system, covering channels, responses, profiles, custom configuration, and event handling.

## Collision Channels (Object Types)

Every physics-enabled component has an **Object Type** that categorizes what it is. Built-in object types:

| Channel | Enum Value | Typical Use |
|---------|------------|-------------|
| WorldStatic | `ECC_WorldStatic` | Static level geometry, walls, floors, BSP |
| WorldDynamic | `ECC_WorldDynamic` | Movable but non-pawn objects (doors, platforms, projectiles) |
| Pawn | `ECC_Pawn` | Characters, AI-controlled pawns |
| PhysicsBody | `ECC_PhysicsBody` | Simulating physics objects (crates, barrels) |
| Vehicle | `ECC_Vehicle` | Wheeled or flying vehicles |
| Destructible | `ECC_Destructible` | Destructible meshes, Geometry Collections |

### Custom Collision Channels

You can define up to 18 custom channels (ECC_GameTraceChannel1 through ECC_GameTraceChannel18). Configure in:

**Project Settings > Collision > Object Channels / Trace Channels**

Or directly in `DefaultEngine.ini`:

```ini
[/Script/Engine.CollisionProfile]
+DefaultChannelResponses=(Channel=ECC_GameTraceChannel1,DefaultResponse=ECR_Block,bTraceType=False,bStaticObject=False,Name="Projectile")
+DefaultChannelResponses=(Channel=ECC_GameTraceChannel2,DefaultResponse=ECR_Ignore,bTraceType=True,bStaticObject=False,Name="InteractTrace")
+DefaultChannelResponses=(Channel=ECC_GameTraceChannel3,DefaultResponse=ECR_Overlap,bTraceType=False,bStaticObject=False,Name="Pickup")
```

**C++ header for custom channels** (typically in your project header):

```cpp
// MyProject.h
#define ECC_Projectile     ECollisionChannel::ECC_GameTraceChannel1
#define ECC_InteractTrace  ECollisionChannel::ECC_GameTraceChannel2
#define ECC_Pickup         ECollisionChannel::ECC_GameTraceChannel3
```

### Object Channels vs Trace Channels

- **Object Channels**: Define what an object IS. Used for collision between objects. Set via `SetCollisionObjectType()`.
- **Trace Channels**: Define what a trace LOOKS FOR. Used for line/shape traces. Do not apply to object-object collision.

Both share the same `ECollisionChannel` enum but are flagged differently in the editor. A trace channel cannot be assigned as an object type and vice versa.

## Collision Responses

Each component defines how it responds to every collision channel:

| Response | Enum | Behavior |
|----------|------|----------|
| **Block** | `ECR_Block` | Physical collision, generates Hit events, prevents penetration |
| **Overlap** | `ECR_Overlap` | No physical collision, generates Overlap events if both have `bGenerateOverlapEvents` |
| **Ignore** | `ECR_Ignore` | No interaction whatsoever, no events, no physics |

### Response Resolution Between Two Objects

The effective response between two objects is the **minimum** of their mutual settings:

```
Block + Block   = Block    (physical collision + Hit events)
Block + Overlap = Overlap  (no physical collision, Overlap events if flags set)
Block + Ignore  = Ignore   (nothing happens)
Overlap + Overlap = Overlap (Overlap events if flags set)
Overlap + Ignore  = Ignore  (nothing happens)
Ignore + Ignore   = Ignore  (nothing happens)
```

This means BOTH objects must agree on Block for blocking to occur. If either side is set to Overlap or Ignore, the interaction degrades.

### Setting Responses in C++

```cpp
// Set object type
MeshComponent->SetCollisionObjectType(ECC_WorldDynamic);

// Set individual channel responses
MeshComponent->SetCollisionResponseToChannel(ECC_Pawn, ECR_Block);
MeshComponent->SetCollisionResponseToChannel(ECC_WorldStatic, ECR_Block);
MeshComponent->SetCollisionResponseToChannel(ECC_Projectile, ECR_Overlap);

// Set all channels at once then override specific ones
MeshComponent->SetCollisionResponseToAllChannels(ECR_Ignore);
MeshComponent->SetCollisionResponseToChannel(ECC_Pawn, ECR_Block);
MeshComponent->SetCollisionResponseToChannel(ECC_WorldDynamic, ECR_Overlap);

// Enable/disable collision entirely
MeshComponent->SetCollisionEnabled(ECollisionEnabled::QueryAndPhysics);
// Options: NoCollision, QueryOnly, PhysicsOnly, QueryAndPhysics, ProbeOnly
```

## Collision Profiles (Presets)

Profiles are named presets that bundle object type + all channel responses. Built-in profiles:

| Profile Name | Object Type | Description |
|-------------|-------------|-------------|
| `NoCollision` | WorldStatic | No collision at all |
| `BlockAll` | WorldStatic | Blocks everything |
| `OverlapAll` | WorldStatic | Overlaps everything |
| `BlockAllDynamic` | WorldDynamic | Blocks everything, dynamic object type |
| `OverlapAllDynamic` | WorldDynamic | Overlaps everything, dynamic object type |
| `IgnoreOnlyPawn` | WorldDynamic | Ignores Pawn channel, blocks others |
| `OverlapOnlyPawn` | WorldDynamic | Overlaps Pawn channel, ignores others |
| `Pawn` | Pawn | Standard pawn collision |
| `Spectator` | Pawn | Ignores most, blocks WorldStatic |
| `CharacterMesh` | Pawn | Character mesh (overlap with camera) |
| `PhysicsActor` | PhysicsBody | Simulating physics body |
| `Destructible` | Destructible | Destructible mesh |
| `InvisibleWall` | WorldStatic | Blocks Pawns, ignored by traces |
| `InvisibleWallDynamic` | WorldDynamic | Blocks Pawns dynamically |
| `Trigger` | WorldDynamic | QueryOnly overlap trigger |
| `Ragdoll` | PhysicsBody | Ragdoll collision config |
| `Vehicle` | Vehicle | Vehicle collision |
| `UI` | WorldDynamic | UI interaction collision |

### Using Profiles in C++

```cpp
// Apply a built-in profile
MeshComponent->SetCollisionProfileName(TEXT("BlockAll"));

// Apply a custom profile
MeshComponent->SetCollisionProfileName(TEXT("Projectile"));

// IMPORTANT: Setting a profile OVERRIDES all individual channel settings.
// If you need custom per-channel config, either:
// 1. Create a custom profile in DefaultEngine.ini
// 2. Use "Custom" profile and set channels manually:
MeshComponent->SetCollisionProfileName(TEXT("Custom"));
MeshComponent->SetCollisionObjectType(ECC_WorldDynamic);
MeshComponent->SetCollisionResponseToAllChannels(ECR_Ignore);
MeshComponent->SetCollisionResponseToChannel(ECC_Pawn, ECR_Overlap);
```

### Creating Custom Profiles in DefaultEngine.ini

```ini
[/Script/Engine.CollisionProfile]
+Profiles=(Name="Projectile",CollisionEnabled=QueryAndPhysics,ObjectTypeName="Projectile",CustomResponses=((Channel="WorldStatic",Response=ECR_Block),(Channel="WorldDynamic",Response=ECR_Block),(Channel="Pawn",Response=ECR_Block),(Channel="PhysicsBody",Response=ECR_Block),(Channel="Vehicle",Response=ECR_Block),(Channel="Destructible",Response=ECR_Block)),HelpMessage="Projectile collision profile")
+Profiles=(Name="Pickup",CollisionEnabled=QueryOnly,ObjectTypeName="Pickup",CustomResponses=((Channel="WorldStatic",Response=ECR_Ignore),(Channel="WorldDynamic",Response=ECR_Ignore),(Channel="Pawn",Response=ECR_Overlap),(Channel="PhysicsBody",Response=ECR_Ignore)),HelpMessage="Pickup items that overlap with pawns only")
+Profiles=(Name="InteractableObject",CollisionEnabled=QueryAndPhysics,ObjectTypeName="WorldDynamic",CustomResponses=((Channel="WorldStatic",Response=ECR_Block),(Channel="Pawn",Response=ECR_Block),(Channel="InteractTrace",Response=ECR_Block)),HelpMessage="Object that can be interacted with via trace")
```

## Collision Components

### Primitive Collision Shapes

```cpp
// Box collision
UPROPERTY(VisibleAnywhere)
UBoxComponent* BoxCollision;
BoxCollision = CreateDefaultSubobject<UBoxComponent>(TEXT("BoxCollision"));
BoxCollision->SetBoxExtent(FVector(50.f, 50.f, 50.f));

// Sphere collision
UPROPERTY(VisibleAnywhere)
USphereComponent* SphereCollision;
SphereCollision = CreateDefaultSubobject<USphereComponent>(TEXT("SphereCollision"));
SphereCollision->SetSphereRadius(100.f);

// Capsule collision
UPROPERTY(VisibleAnywhere)
UCapsuleComponent* CapsuleCollision;
CapsuleCollision = CreateDefaultSubobject<UCapsuleComponent>(TEXT("CapsuleCollision"));
CapsuleCollision->SetCapsuleSize(34.f, 88.f);  // Radius, HalfHeight
```

### Mesh Collision

Static meshes can have collision in several forms:

```cpp
// Use simple collision (convex hulls, boxes, spheres from mesh editor)
MeshComponent->SetCollisionEnabled(ECollisionEnabled::QueryAndPhysics);
MeshComponent->BodyInstance.SetCollisionProfileName(TEXT("BlockAll"));

// Use complex collision (per-triangle, expensive)
MeshComponent->bUseComplexAsSimpleCollision = true; // Editor only; in code use body setup
```

## Simple vs Complex Collision

### Simple Collision
- Convex hulls, boxes, spheres, capsules, sphyl (tapered capsule)
- Used for physics simulation (rigid bodies REQUIRE simple collision)
- Fast for runtime queries
- Created in Static Mesh Editor or auto-generated
- Types: DOP (Discrete Oriented Polytope), auto-convex, custom convex

### Complex Collision
- Per-triangle mesh collision
- Used for precise traces and queries
- Cannot be used for physics simulation (will crash or be ignored)
- Expensive for runtime overlap/sweep queries
- Set via `bUseComplexAsSimpleCollision` on the static mesh asset

### Which Is Used When

| Operation | Default | Can Override |
|-----------|---------|-------------|
| Physics simulation (rigid body) | Simple only | Cannot use complex |
| Line traces | Complex (per-triangle) | `bTraceComplex` parameter |
| Shape sweeps | Simple | `bTraceComplex` parameter |
| Overlap tests | Simple | Depends on collision settings |
| Character movement | Simple | Cannot use complex for movement |

```cpp
// Force trace to use simple collision
FCollisionQueryParams Params;
Params.bTraceComplex = false;  // Use simple collision for this trace

// Force trace to use complex (per-triangle) collision
Params.bTraceComplex = true;
```

## Generate Overlap Events Flag

The `bGenerateOverlapEvents` flag must be `true` on BOTH components for overlap events to fire.

```cpp
// Enable overlap event generation
MeshComponent->SetGenerateOverlapEvents(true);
// or
MeshComponent->bGenerateOverlapEvents = true;  // In constructor
```

**Performance note**: Every component with `bGenerateOverlapEvents = true` participates in the broad-phase overlap check every tick. Disable it on components that don't need overlap events.

## Hit Events vs Overlap Events

### Hit Events (Blocking Collision)

Fired when two objects with Block response physically collide.

```cpp
// Binding Hit events
UFUNCTION()
void OnHit(UPrimitiveComponent* HitComponent, AActor* OtherActor,
           UPrimitiveComponent* OtherComp, FVector NormalImpulse,
           const FHitResult& Hit);

// In constructor or BeginPlay
MeshComponent->OnComponentHit.AddDynamic(this, &AMyActor::OnHit);
```

Requirements for Hit events:
- Both objects have `Block` response to each other's object type
- `Simulation Generates Hit Events` is enabled on the simulating body
- At least one component is simulating physics OR one is moving (sweep)
- Collision is enabled (`QueryAndPhysics` or `PhysicsOnly`)

### Overlap Events

Fired when two objects with Overlap response interpenetrate.

```cpp
// Binding Overlap events
UFUNCTION()
void OnOverlapBegin(UPrimitiveComponent* OverlappedComponent, AActor* OtherActor,
                    UPrimitiveComponent* OtherComp, int32 OtherBodyIndex,
                    bool bFromSweep, const FHitResult& SweepResult);

UFUNCTION()
void OnOverlapEnd(UPrimitiveComponent* OverlappedComponent, AActor* OtherActor,
                  UPrimitiveComponent* OtherComp, int32 OtherBodyIndex);

// In constructor or BeginPlay
MeshComponent->OnComponentBeginOverlap.AddDynamic(this, &AMyActor::OnOverlapBegin);
MeshComponent->OnComponentEndOverlap.AddDynamic(this, &AMyActor::OnOverlapEnd);
```

Requirements for Overlap events:
- The effective response between both components is Overlap (not Block or Ignore)
- `bGenerateOverlapEvents = true` on BOTH components
- Collision is enabled (`QueryAndPhysics` or `QueryOnly`)
- At least one component moves or is spawned into overlap

### Actor-Level Events

```cpp
// Actor-level overlap (aggregates all component overlaps)
// In constructor:
// Note: requires bGenerateOverlapEvents on the relevant component
OnActorBeginOverlap.AddDynamic(this, &AMyActor::OnActorOverlapBegin);
OnActorEndOverlap.AddDynamic(this, &AMyActor::OnActorOverlapEnd);

// Actor-level hit
OnActorHit.AddDynamic(this, &AMyActor::OnActorHit);
```

## Collision Enabled Modes

```cpp
// No collision at all -- invisible to traces and physics
MeshComponent->SetCollisionEnabled(ECollisionEnabled::NoCollision);

// Query only -- traces and overlaps work, no physics simulation
MeshComponent->SetCollisionEnabled(ECollisionEnabled::QueryOnly);

// Physics only -- physics simulation, but invisible to traces
MeshComponent->SetCollisionEnabled(ECollisionEnabled::PhysicsOnly);

// Full collision -- both query and physics
MeshComponent->SetCollisionEnabled(ECollisionEnabled::QueryAndPhysics);

// Probe only -- generates overlap events but does not block or trigger hit events
MeshComponent->SetCollisionEnabled(ECollisionEnabled::ProbeOnly);
```

## DefaultEngine.ini Collision Configuration

Complete example of a project's collision configuration:

```ini
[/Script/Engine.CollisionProfile]
; Custom Object Channels
+DefaultChannelResponses=(Channel=ECC_GameTraceChannel1,DefaultResponse=ECR_Block,bTraceType=False,bStaticObject=False,Name="Projectile")
+DefaultChannelResponses=(Channel=ECC_GameTraceChannel2,DefaultResponse=ECR_Ignore,bTraceType=True,bStaticObject=False,Name="WeaponTrace")
+DefaultChannelResponses=(Channel=ECC_GameTraceChannel3,DefaultResponse=ECR_Overlap,bTraceType=False,bStaticObject=False,Name="Pickup")
+DefaultChannelResponses=(Channel=ECC_GameTraceChannel4,DefaultResponse=ECR_Ignore,bTraceType=True,bStaticObject=False,Name="InteractTrace")
+DefaultChannelResponses=(Channel=ECC_GameTraceChannel5,DefaultResponse=ECR_Ignore,bTraceType=True,bStaticObject=False,Name="CameraTrace")

; Custom Collision Profiles
+Profiles=(Name="Projectile",CollisionEnabled=QueryAndPhysics,ObjectTypeName="Projectile",CustomResponses=((Channel="WorldStatic",Response=ECR_Block),(Channel="WorldDynamic",Response=ECR_Block),(Channel="Pawn",Response=ECR_Block),(Channel="PhysicsBody",Response=ECR_Block),(Channel="Vehicle",Response=ECR_Block),(Channel="Destructible",Response=ECR_Block),(Channel="Projectile",Response=ECR_Ignore)),HelpMessage="Used by projectile actors")

+Profiles=(Name="PickupItem",CollisionEnabled=QueryOnly,ObjectTypeName="Pickup",CustomResponses=((Channel="WorldStatic",Response=ECR_Ignore),(Channel="WorldDynamic",Response=ECR_Ignore),(Channel="Pawn",Response=ECR_Overlap),(Channel="PhysicsBody",Response=ECR_Ignore),(Channel="Projectile",Response=ECR_Ignore)),HelpMessage="Pickup items overlap with pawns only")

+Profiles=(Name="Interactable",CollisionEnabled=QueryAndPhysics,ObjectTypeName="WorldDynamic",CustomResponses=((Channel="WorldStatic",Response=ECR_Block),(Channel="WorldDynamic",Response=ECR_Block),(Channel="Pawn",Response=ECR_Block),(Channel="InteractTrace",Response=ECR_Block),(Channel="WeaponTrace",Response=ECR_Block)),HelpMessage="Interactive objects that respond to interact traces")

; Edit existing profiles (override built-in)
+EditProfiles=(Name="Pawn",CustomResponses=((Channel="Projectile",Response=ECR_Block),(Channel="Pickup",Response=ECR_Overlap),(Channel="InteractTrace",Response=ECR_Ignore)))
+EditProfiles=(Name="BlockAll",CustomResponses=((Channel="Projectile",Response=ECR_Block),(Channel="WeaponTrace",Response=ECR_Block),(Channel="InteractTrace",Response=ECR_Block)))
```

## Collision Filtering Logic: Full Resolution Algorithm

When two components A and B potentially collide, the engine resolves whether and how they interact:

1. **Collision Enabled check**: Both must have collision enabled. If either is `NoCollision`, no interaction.
2. **Object Type lookup**: Get A's object type and B's object type.
3. **Response lookup**: Get A's response to B's object type, and B's response to A's object type.
4. **Minimum resolution**: The effective response = min(A's response to B, B's response to A).
   - If effective = Ignore: no interaction.
   - If effective = Overlap: overlap events fire (if flags are set).
   - If effective = Block: blocking collision + hit events.
5. **Event generation check**:
   - For Overlap: both components need `bGenerateOverlapEvents = true`.
   - For Hit: at least one component needs `bNotifyRigidBodyCollision = true` (Simulation Generates Hit Events).
6. **Actor ignore list**: Components can ignore specific actors via `MoveIgnoreActors`.

```cpp
// Add actor to ignore list (useful for projectile ignoring its spawner)
Projectile->MoveIgnoreActorAdd(GetOwner());

// Check ignore list
Projectile->GetMoveIgnoreActors();

// Clear ignore list
Projectile->ClearMoveIgnoreActors();
```

## Debugging Collision

### Console Commands

```
show Collision          -- Toggle collision shape visualization in viewport
p.DrawCollision 1      -- Draw collision shapes for physics bodies
p.ShowSweeps 1         -- Visualize character movement sweeps
```

### C++ Debug Helpers

```cpp
// Check what collision profile is active
FName ProfileName = MeshComponent->GetCollisionProfileName();
UE_LOG(LogTemp, Warning, TEXT("Collision Profile: %s"), *ProfileName.ToString());

// Check collision response to a specific channel
ECollisionResponse Response = MeshComponent->GetCollisionResponseToChannel(ECC_Pawn);
// ECR_Block, ECR_Overlap, or ECR_Ignore

// Check if collision is enabled
ECollisionEnabled::Type CollisionType = MeshComponent->GetCollisionEnabled();

// Check object type
ECollisionChannel ObjectType = MeshComponent->GetCollisionObjectType();

// Get all overlapping actors
TArray<AActor*> OverlappingActors;
MeshComponent->GetOverlappingActors(OverlappingActors);

// Get all overlapping components
TArray<UPrimitiveComponent*> OverlappingComponents;
MeshComponent->GetOverlappingComponents(OverlappingComponents);
```

### Collision Visualization in Editor

- Select an actor and check the collision wireframe in the Details panel
- Use the viewport Show menu > Collision to render collision shapes
- Static Mesh Editor: view simple and complex collision overlays
- Physics Asset Editor: inspect per-bone collision bodies on skeletal meshes
