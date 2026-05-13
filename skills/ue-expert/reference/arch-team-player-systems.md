# Team & Player Systems

## Team System Architecture (Lyra)

### Core Classes

**ULyraTeamSubsystem** (WorldSubsystem):
- Central authority for team registration, comparison, and rules
- Methods: RegisterTeamInfo, ChangeTeamForActor, FindTeamFromObject, CompareTeams, CanCauseDamage
- Team tag stacks: AddTeamTagStack, RemoveTeamTagStack, GetTeamTagStackCount

**ILyraTeamAgentInterface**:
- Implemented by: Character, PlayerState, PlayerController
- Methods: SetGenericTeamId, GetGenericTeamId, GetOnTeamIndexChangedDelegate

**Team Info Actors**:
- `ALyraTeamPublicInfo`: Public team state (visible to all)
- `ALyraTeamPrivateInfo`: Private team state (visible to team members only)

**Team Display**:
- `ULyraTeamDisplayAsset`: Colors, names, UI icons per team
- `GetTeamDisplayAsset(TeamId, ViewerTeamId)`: Perspective-relative display

### Team Comparison
```cpp
ELyraTeamComparison Result = TeamSubsystem->CompareTeams(ActorA, ActorB);
// Returns: OnSameTeam | DifferentTeams | InvalidArgument

bool CanDamage = TeamSubsystem->CanCauseDamage(Instigator, Target);
// Respects friendly-fire rules
```

### Team Tag Stacks
Team-wide counting via GameplayTags:
```cpp
TeamSubsystem->AddTeamTagStack(TeamId, ScoreTag, Points);
int32 Score = TeamSubsystem->GetTeamTagStackCount(TeamId, ScoreTag);
```
Used for: team scores, capture progress, objective counts.

---

## Player System Architecture

### Gameplay Framework Classes

| Class | Scope | Replication | Purpose |
|-------|-------|-------------|---------|
| GameMode | Server only | Not replicated | Rules, spawning, game flow |
| GameState | Server + all clients | Replicated | Match state, scores, team info |
| PlayerController | Per-player | Replicated to owner | Input, possession, RPCs |
| PlayerState | Per-player | Replicated to all | Name, score, team, persistent data |
| Pawn/Character | Per-player | Replicated | Physical representation |
| HUD | Local only | Not replicated | UI rendering |

### Key Relationships
```
GameInstance (persists across levels)
  └── LocalPlayer (per local player)
       └── PlayerController (per session)
            ├── PlayerState (replicated to all)
            └── Pawn (possessed, replicated)
```

### Lyra's Player Extensions

**UCommonLocalPlayer** (from CommonGame):
- Delegates: OnPlayerControllerSet, OnPlayerStateSet, OnPlayerPawnSet
- Use `CallAndRegister_OnPlayerXXXSet()` for late-binding (fires immediately if already set)
- `GetRootUILayout()`: Access primary game layout

**UCommonGameInstance** (from CommonGame):
- Session flow management
- System messages, privilege changes
- User/session reset

**UCommonUserSubsystem** (GameInstance Subsystem):
- User initialization state tracking
- Platform trait tags (RequiresStrictControllerMapping, SingleOnlineUser)

**UCommonSessionSubsystem** (GameInstance Subsystem):
- ECommonSessionOnlineMode: Offline / LAN / Online
- Session creation, matchmaking, party management

---

## Game Mode / Game State Pattern

### ALyraGameMode
- Inherits from `AModularGameModeBase`
- `GetPawnDataForController(Controller)`: Returns PawnData from experience
- `InitGameState()`: Sets up experience manager
- `SpawnDefaultPawnAtTransform_Implementation()`: Spawns with PawnData
- `FOnLyraGameModePlayerInitialized`: Delegate when player fully initialized

### ALyraGameState
- Inherits from `AModularGameStateBase`
- Implements `IAbilitySystemInterface` (owns game-wide ASC for global effects)
- Owns `ULyraExperienceManagerComponent`
- `MulticastMessageToClients(FLyraVerbMessage)`: Broadcast game events
- `GetServerFPS()`: Replicated server performance metric

### Game Phase System
Phases are GameplayAbilities on GameState's ASC, identified by hierarchical tags:
```
Game.Playing
Game.Playing.WarmUp
Game.Playing.InProgress
Game.ShowingScore
Game.PostGame
```

**Rules**:
- Parent and child phases coexist (Game.Playing + Game.Playing.WarmUp)
- Sibling phases are exclusive (WarmUp ends when InProgress starts)
- Transition: `ULyraGamePhaseSubsystem::StartPhase(PhaseAbilityClass)`
- Optional callback when phase concludes

---

## Cosmetics & Character Parts

### Architecture
**ULyraPawnComponent_CharacterParts** manages cosmetic parts on pawns:
- Uses `FFastArraySerializer` for replication
- Parts are `FLyraCharacterPart`: Actor class + socket name + collision mode
- Server adds/removes parts; clients see replicated state
- Returns opaque handles for later removal

### Animation Integration
`FLyraAnimBodyStyleSelectionSet`: Rules for selecting skeletal mesh based on cosmetic tags.
Combined tags from all equipped parts determine which animation body variant to use.

---

## Design Principles

### Why Teams as Subsystem (Not Component)
- Teams are a world-wide concept, not per-actor
- Need centralized comparison logic (is A on same team as B?)
- Need team-wide state (scores, display assets)
- Subsystem provides natural single-instance-per-world pattern

### Why PlayerState for Persistent Data
- PlayerState survives pawn death/respawn
- Replicated to all players (others can see your name, team, score)
- Natural place for ASC when using respawning characters

### Server Authority
- GameMode exists only on server — never query it from client
- Team changes are server-authoritative (ChangeTeamForActor)
- Player spawning is server-authoritative (GameMode.SpawnDefaultPawn)
- Clients react to replicated state, never drive it

---

## Anti-Patterns
- Querying GameMode on clients (server-only actor)
- Storing per-player data on GameState (use PlayerState)
- Not using team subsystem for damage checks (bypasses friendly fire rules)
- Direct player references instead of team-based queries
- Hardcoding team colors instead of using display assets
- Not handling join-in-progress (new players need current team/phase state)
