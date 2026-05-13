# Navigation and Pathfinding

## Architecture Overview

Unreal Engine uses Recast/Detour for navmesh generation and pathfinding. The navigation system converts world geometry into a walkable mesh that AI pawns query for movement paths.

**Core classes:**
- **UNavigationSystemV1** -- singleton managing navigation data, queries, and path requests
- **ARecastNavMesh** -- the navigation mesh actor, configurable per-agent type
- **ANavMeshBoundsVolume** -- defines the area where navmesh is generated
- **UPathFollowingComponent** -- on AIController, handles path execution
- **UNavigationQueryFilter** -- customizes pathfinding cost/traversal rules
- **ANavLinkProxy** -- off-mesh connections for jumps, ladders, teleports
- **UCrowdManager** -- handles local avoidance between multiple AI agents

## RecastNavMesh Configuration

### Agent Profile (Project Settings > Navigation System)
Each agent type gets its own navmesh with these critical parameters:

- **Agent Radius** -- horizontal clearance. MUST match pawn capsule radius. Too small = AI walks through walls. Too large = AI can't fit through doorways.
- **Agent Height** -- vertical clearance. MUST match pawn capsule height. Wrong value = AI can't pass under low ceilings.
- **Agent Max Slope** -- maximum walkable slope angle (default 44 degrees)
- **Agent Max Step Height** -- max height the agent can step up (stairs, curbs)

### Navmesh Generation Parameters
- **Cell Size** -- horizontal resolution of the navmesh voxelization. Smaller = more accurate but slower to generate. Default 19 works for most cases. For tight spaces, try 10.
- **Cell Height** -- vertical resolution. Affects multi-level navmesh accuracy.
- **Tile Size** -- navmesh is divided into tiles for streaming and dynamic updates. Larger tiles = fewer tiles but more expensive per-tile rebuild.
- **Min Region Area** -- tiny navmesh islands below this area are discarded. Prevents AI from targeting unreachable slivers.
- **Merge Region Size** -- adjacent small regions are merged if combined area is below this threshold.

### Setting Up NavMesh
1. Place a `NavMeshBoundsVolume` covering playable area
2. NavMesh auto-generates in the editor (green overlay visible with P key)
3. Configure agent profile in Project Settings > Navigation System > Agents
4. Ensure `ARecastNavMesh` in the level matches agent settings

## Static vs Dynamic NavMesh

### Static (Default)
NavMesh is generated at build time. Fast at runtime, no rebuild cost. Use for levels with fixed geometry.

### Dynamic
Enable `Runtime Generation` on the RecastNavMesh actor:
- **Static** -- only at build time
- **Dynamic** -- rebuilds affected tiles when geometry changes
- **Dynamic Modifiers Only** -- only responds to NavModifierVolumes, not geometry changes

Dynamic generation has a per-frame budget. Configure `MaxSimultaneousTileGenerationJobsCount` to control CPU cost.

### NavigationInvoker for Large Worlds
For open-world games, generating navmesh everywhere is wasteful. Add `UNavigationInvokerComponent` to pawns:
```cpp
NavInvoker = CreateDefaultSubobject<UNavigationInvokerComponent>(TEXT("NavInvoker"));
NavInvoker->SetGenerationRadii(5000.f, 7000.f); // generation radius, removal radius
```
NavMesh is only generated around pawns with invokers. The removal radius should be larger than generation radius to prevent constant rebuild at the boundary.

## Navigation Modifiers and Areas

### NavArea Classes
Custom area classes define traversal costs:
```cpp
UCLASS()
class UNavArea_Swamp : public UNavArea
{
    GENERATED_BODY()
public:
    UNavArea_Swamp()
    {
        DefaultCost = 5.f;        // 5x more expensive than default
        DrawColor = FColor::Green;
        AreaFlags = 0;            // custom flags for query filters
    }
};
```

### NavModifierVolume
Place `ANavModifierVolume` in the level and assign a NavArea class. Any navmesh within the volume gets that area's cost. Use for:
- Swamps, hazards (high cost -- AI avoids)
- Roads (low cost -- AI prefers)
- Restricted zones (null area -- AI cannot traverse)

### NavModifierComponent
Attach to actors for dynamic navigation modification:
```cpp
NavModifier = CreateDefaultSubobject<UNavModifierComponent>(TEXT("NavModifier"));
NavModifier->SetAreaClass(UNavArea_Swamp::StaticClass());
```

## Path Following

### AIController Movement
```cpp
// Move to a location
FAIMoveRequest MoveReq(TargetLocation);
MoveReq.SetAcceptanceRadius(50.f);
MoveReq.SetUsePathfinding(true);
MoveReq.SetAllowPartialPath(false);
MoveReq.SetNavigationFilter(TSubclassOf<UNavigationQueryFilter>());

FNavPathSharedPtr Path;
MoveTo(MoveReq, &Path);

// Simpler versions
MoveToLocation(TargetLocation, AcceptanceRadius);
MoveToActor(TargetActor, AcceptanceRadius);
```

### Move Result Handling
```cpp
// Delegate-based
GetPathFollowingComponent()->OnRequestFinished.AddUObject(
    this, &AMyAIController::OnMoveCompleted);

void AMyAIController::OnMoveCompleted(FAIRequestID RequestID, const FPathFollowingResult& Result)
{
    switch (Result.Code)
    {
    case EPathFollowingResult::Success:        // reached goal
    case EPathFollowingResult::Blocked:        // path blocked
    case EPathFollowingResult::OffPath:        // pawn fell off navmesh
    case EPathFollowingResult::Aborted:        // move was cancelled
    case EPathFollowingResult::Invalid:        // invalid request
    }
}
```

### In Behavior Trees
Use the built-in **Move To** task or **Move Directly Toward** task. Configure:
- Blackboard key (Vector or Actor)
- Acceptable radius
- Allow partial path
- Observe Blackboard value (re-path when target moves)

## Navigation Query Filters

Customize which areas are traversable and their costs:
```cpp
UCLASS()
class UNavFilter_AvoidSwamp : public UNavigationQueryFilter
{
    GENERATED_BODY()
public:
    UNavFilter_AvoidSwamp()
    {
        // Exclude swamp areas entirely
        SetExcludedArea(UNavArea_Swamp::StaticClass());

        // Or make them very expensive
        // SetAreaCost(UNavArea_Swamp::StaticClass(), 100.f);
    }
};
```

Different AI types can use different filters -- a flying AI ignores water cost, a heavy unit avoids bridges.

## NavLinks (Off-Mesh Connections)

NavLinks connect disconnected navmesh regions for special traversals.

### NavLinkProxy
Place `ANavLinkProxy` in the level with two endpoints:
- **Simple link**: instant teleport between endpoints (for AI, not visual)
- **Smart link**: triggers custom logic when AI uses it

### Smart NavLinks
```cpp
// In your NavLinkProxy Blueprint or C++
void AMyNavLink::ReceiveSmartLinkReached(AActor* Agent, const FVector& Destination)
{
    // Play jump animation, teleport, climb ladder, etc.
    APawn* Pawn = Cast<APawn>(Agent);
    // Trigger montage, launch character, etc.

    // MUST call ResumePathFollowing when traversal completes
    ResumePathFollowing(Agent);
}
```

Enable `bSmartLinkIsRelevant = true` and override the reached event. The AI pauses path following until you call `ResumePathFollowing`.

### Common NavLink Uses
- **Jump pads**: launch pawn with physics, resume on landing
- **Ladders**: play climb animation, teleport between floors
- **Doors**: open door, wait for animation, then proceed
- **Teleporters**: instant repositioning

## Crowd Manager and Avoidance

### UCrowdManager
Handles local avoidance so AI pawns don't overlap. Enable on the AIController:
```cpp
// In AIController constructor or BeginPlay
UCrowdFollowingComponent* CrowdComp = FindComponentByClass<UCrowdFollowingComponent>();
if (CrowdComp)
{
    CrowdComp->SetCrowdAvoidanceQuality(ECrowdAvoidanceQuality::Medium);
    CrowdComp->SetAvoidanceGroup(1);
    CrowdComp->SetGroupsToAvoid(1);
}
```

Replace `UPathFollowingComponent` with `UCrowdFollowingComponent` on the AIController for crowd-enabled pathfinding.

### Avoidance Quality Levels
- **Low** -- 4 samples, fast, jittery
- **Medium** -- 8 samples, good balance (recommended)
- **High** -- 16 samples, smooth but expensive
- **Good** -- 32 samples, best quality, high CPU cost

### Avoidance Groups
Assign agents to groups and configure which groups to avoid. Useful for factions that should avoid allies but ignore enemies for blocking purposes.

### RVO (Reciprocal Velocity Obstacles)
For simpler avoidance without full Detour crowd, use `UCharacterMovementComponent`'s built-in RVO:
```cpp
CharacterMovement->bUseRVOAvoidance = true;
CharacterMovement->AvoidanceConsiderationRadius = 500.f;
CharacterMovement->AvoidanceWeight = 0.5f;
```

## Debugging Navigation

### Viewport Visualization
- Press **P** in the editor to toggle navmesh overlay
- Green = walkable, red = non-walkable, colored = custom areas
- Show Navigation in the viewport Show menu for runtime visualization

### Console Commands
```
show Navigation                   -- toggle navmesh rendering in game
p.NavMeshTriCount                 -- display triangle count
ai.nav.DisplayStat 1             -- show navigation statistics
ai.nav.VerifyNavOctree 1         -- verify octree integrity
RecastNavMesh.DrawDebug 1        -- detailed navmesh debug draw
LogNavigation Verbose             -- detailed nav logging
LogPathFollowing Verbose          -- path following logging
```

### Gameplay Debugger
Press `'` in PIE, NavMesh category shows:
- Current path (with waypoints)
- Path following state
- NavMesh around the selected pawn

### Common Issues
- **AI won't move**: Check navmesh exists (P key). Check agent radius matches capsule. Check `NavMeshBoundsVolume` covers the area.
- **AI takes weird paths**: Check for high-cost nav areas or missing navlinks. Verify cell size is small enough for the environment detail level.
- **AI gets stuck on corners**: Reduce agent radius slightly, or add navmesh padding. Check `Agent Max Step Height` for small ledges.
- **NavMesh has holes**: Increase `Min Region Area` threshold, or check for invisible blocking geometry. Static meshes need collision enabled for navmesh generation.
- **Dynamic obstacles not respected**: Ensure `Runtime Generation` is set to Dynamic. Check that the obstacle has collision and is set to block navigation.
- **Path is partial**: The destination may be off-navmesh. Use `ProjectPointToNavigation()` to snap destinations to the navmesh before requesting paths.
