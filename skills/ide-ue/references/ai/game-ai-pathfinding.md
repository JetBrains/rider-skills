# Pathfinding and Navigation for Game AI (Unreal Engine)

## A* Optimization Priority (Game AI Pro, Ch. 17)

Fastest implementations are **100x faster** than naive. Priority order:

| Priority | Optimization | Impact |
|----------|-------------|--------|
| 1 | **High-quality heuristics** (precomputed, Euclidean embeddings) | Reduces nodes expanded dramatically |
| 2 | **Optimal search space** (NavMesh over grid) | Order of magnitude fewer nodes |
| 3 | **Preallocate memory** | Avoids allocation during search (10x speedup) |
| 4 | **Overestimate heuristic** (weight 1.1-1.5) | Faster search, slightly suboptimal |
| 5 | **Octile heuristic for grids** (`max(dx,dy) + 0.41*min(dx,dy)`) | Tighter bounds than Manhattan |
| 6 | **Open list optimization** (bucket sorting, LIFO tie-breaking) | Reduces sorting overhead |
| 7 | **Skip parent node** in successor expansion | Free ~12-33% speedup |
| 8 | **Cache successor lists** | Avoids repeated neighbor lookups |

**Anti-patterns** (Game AI Pro, Ch. 17):
- Do NOT run many simultaneous searches (cache thrashing, memory bloat)
- Do NOT use bidirectional A* (often 2x slower due to barrier backup)
- Do NOT cache successful paths (too many unique paths, low hit rate)

## UE Navigation Components

| Component | Purpose |
|-----------|---------|
| `ARecastNavMesh` | NavMesh asset, auto-generated from level geometry |
| `UNavigationSystemV1` | Singleton managing all navigation data |
| `UPathFollowingComponent` | Drives AI movement along found path |
| `UNavMovementComponent` | Movement capabilities for navigation system |
| `UCrowdManager` | RVO-based crowd avoidance for multiple agents |
| `UNavModifierComponent` | Modifies NavMesh areas (cost, accessibility) |
| `UNavLinkProxy` | Off-mesh links for jumps, teleporters, ladders |

## NavMesh Configuration

- **Agent Radius/Height**: Project Settings > Navigation System. Different sizes need separate NavMesh data.
- **Cell Size/Height**: NavMesh resolution. Smaller = more accurate, slower to build. Default: 10cm.
- **Tile Size**: Tiles enable partial rebuilds. Larger tiles = fewer but slower per-tile rebuild.
- **Runtime Generation**: `Dynamic` for destructible geometry, `Static` for baked-only.

## Path Queries

```cpp
// Sync path request
UNavigationSystemV1* NavSys = FNavigationSystem::GetCurrent<UNavigationSystemV1>(GetWorld());
FPathFindingQuery Query(Owner, *NavSys->GetDefaultNavDataInstance(), Start, Goal);
FPathFindingResult Result = NavSys->FindPathSync(Query);

// Async (preferred for multiple agents)
NavSys->FindPathAsync(NavAgentProperties, Query, FNavPathQueryDelegate::CreateUObject(...));
```

`UAIController::MoveToLocation()` / `MoveToActor()` combines pathfinding + path following + avoidance internally.

## Steering and Crowd Movement

- **CrowdManager**: Reciprocal Velocity Obstacles (RVO) for real-time multi-agent avoidance
- **Formation movement** (Game AI Pro, Ch. 21): steering circles for smooth formation turns
- **Collision avoidance** (Game AI Pro, Ch. 22): slide collision spheres along paths, resolve with speed changes or path modification

## Flow Fields (Game AI Pro, Ch. 23)

For 100+ agents sharing destinations (RTS): Dijkstra from goal outward, store direction vector per cell. Not built into UE but implementable with custom NavMesh queries.

## Dynamic Navigation

- **Nav Modifier Volumes**: Mark areas as higher cost, preferred, or forbidden at runtime
- **Nav Mesh Obstacle**: Dynamic obstacles that carve holes in NavMesh
- **Dirty tile rebuild**: Only affected tiles regenerate on geometry changes

**Gotcha**: Runtime NavMesh rebuilds are expensive. Prefer Nav Obstacles for temporary blockages (doors, barricades).

## Gotchas

1. **NavMesh not generating**: Check geometry has collision, is within NavMesh bounds volume, Agent radius fits through openings.
2. **Agents cutting corners**: Reduce agent radius or increase NavMesh cell resolution.
3. **Path fails silently**: Target may be off-NavMesh. Use `ProjectPointToNavigation()` to snap targets.
4. **Async path results arrive late**: Always check requesting actor is still valid in the callback.
5. **Multiple agent sizes**: Configure additional NavMesh data in Project Settings per agent profile.
6. **Performance with many agents**: Use CrowdManager (RVO), stagger path requests across frames, consider flow fields.

## References

- Rabin & Sturtevant, "Pathfinding Architecture Optimizations" (Game AI Pro, Ch. 17)
- Sturtevant, "Choosing a Search Space Representation" (Game AI Pro, Ch. 18)
- Bjore, "Techniques for Formation Movement Using Steering Circles" (Game AI Pro, Ch. 21)
- Anguelov, "Collision Avoidance for Preplanned Locomotion" (Game AI Pro, Ch. 22)
- Emerson, "Crowd Pathfinding and Steering Using Flow Field Tiles" (Game AI Pro, Ch. 23)
- Smed & Hakonen, "Path Finding" (Algorithms and Networking for Computer Games, Ch. 5)

---

## MCP tools

| Tool | Purpose | Scenario |
|------|---------|----------|
| `ue_play` | Start PIE | Trigger AI movement to observe pathfinding and avoidance live |
| `ue_get_logs` | Stream nav/path logs | `category="LogNavigation"`, `category="LogPathFollowing"`, `minVerbosity="Warning"` |
| `ue_execute_python` | Verify path quality at runtime | Request a test path, measure length, check for partial result flag |
| `viewport_camera` | Frame the AI pawn | `focus_on_actor` on an AI pawn to visually inspect navmesh with P key overlay |
