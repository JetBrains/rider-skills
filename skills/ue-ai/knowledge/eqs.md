# Environment Query System (EQS)

## Architecture Overview

EQS finds optimal locations or actors in the environment for AI decisions -- cover positions, flanking routes, patrol points, spawn locations. It works by generating a set of candidate items, filtering them, and scoring the survivors.

**Pipeline:** Generator -> Tests (Filter + Score) -> Best Item

**Core classes:**
- **UEnvQuery** -- the query asset, edited in the EQS editor
- **UEnvQueryGenerator** -- produces candidate items (points or actors)
- **UEnvQueryTest** -- evaluates each item with a score or filter
- **UEnvQueryContext** -- provides reference points (querier, target, custom locations)
- **UEnvQueryManager** -- singleton that runs queries asynchronously
- **UEnvQueryInstanceBlueprintWrapper** -- Blueprint-friendly async query handle

## Generators

Generators produce the initial set of items to evaluate.

### Built-in Generators

**Points: Grid**
Generates a grid of points around a context. Parameters: grid size, space between points, projection onto navmesh. Best for area searches like "find cover in this zone."

**Points: Donut**
Ring-shaped point generation with inner/outer radius. Good for flanking positions, surrounding, or maintaining distance.

**Points: Circle**
Points along a circle perimeter. Use for equal-distance sampling around a target.

**Points: Cone**
Points within a cone shape in a specified direction. Useful for forward-facing searches.

**Points: NavMesh**
Points sampled directly from the navigation mesh. Guarantees all points are navigable. Slower but avoids wasted evaluations on unreachable locations.

**Actors Of Class**
Returns all actors of a specified class within a search radius. Use to find items, enemies, cover actors, or interactive objects.

**Current Location**
Returns the querier's current location as a single item. Use as a baseline comparison with composite queries.

### Custom Generators (C++)
```cpp
UCLASS()
class UEnvQueryGenerator_CoverPoints : public UEnvQueryGenerator
{
    GENERATED_BODY()

    virtual void GenerateItems(FEnvQueryInstance& QueryInstance) const override
    {
        TArray<FNavLocation> CoverPoints = FindCoverPointsNearby(QueryInstance);
        for (const FNavLocation& Point : CoverPoints)
        {
            QueryInstance.AddItemData<UEnvQueryItemType_Point>(Point.Location);
        }
    }
};
```

Item types: `UEnvQueryItemType_Point` (locations) and `UEnvQueryItemType_ActorBase` (actors).

## Tests

Tests evaluate each generated item. They run in two phases: filtering first, then scoring.

### Filter vs Score
- **Filter**: binary pass/fail. Items that fail are removed entirely.
- **Score**: assigns a numerical value. After all tests, items are ranked by total weighted score.

A single test can do both: filter items outside a range, then score survivors within it.

### Built-in Tests

**Distance**
Measures distance from each item to a context. Filter: min/max range. Score: prefer closer or farther.

**Dot Product (Dot)**
Computes dot product between two direction vectors (e.g., item-to-context vs querier facing direction). Score: prefer items in front (+1) or behind (-1). Essential for flanking and facing checks.

**Trace**
Line trace from item to context. Filter: require clear line of sight (or blocked). Score by hit distance. Use for cover validation -- can the enemy see this position?

**Pathfinding**
Actual navigation path cost/distance from item to context. More expensive than Distance but respects navmesh topology. Filter by reachability. Score by path length.

**Overlap**
Sphere/capsule overlap check at item location. Filter: only keep items with/without overlapping actors. Use to avoid positions inside geometry or near hazards.

**GameplayTag**
Check if an actor item has specific gameplay tags. Filter or score based on tag presence.

**Project**
Projects points onto navmesh or geometry surface. Usually used as a generator post-process rather than standalone.

### Scoring

Each test produces a raw score that gets normalized (0-1) and multiplied by the test weight. Tests support multiple scoring equations:
- **Linear** -- direct proportional scoring
- **Square** -- emphasizes extremes
- **Inverse Linear** -- inverts the preference
- **Constant** -- flat bonus for passing

Final item score = sum of (normalized_score * weight) across all tests.

## Contexts

Contexts provide reference points for generators and tests.

### Built-in Contexts
- **EnvQueryContext_Querier** -- the AI pawn running the query
- **EnvQueryContext_Item** -- the current item being evaluated (implicit)

### Custom Contexts
```cpp
UCLASS()
class UEnvQueryContext_EnemyLocation : public UEnvQueryContext
{
    GENERATED_BODY()

    virtual void ProvideContext(FEnvQueryInstance& QueryInstance,
                                FEnvQueryContextData& ContextData) const override
    {
        AActor* Enemy = GetEnemyForQuerier(QueryInstance);
        if (Enemy)
        {
            UEnvQueryItemType_Actor::SetContextHelper(ContextData, Enemy);
        }
    }
};
```

Contexts can provide single or multiple items (e.g., all known enemies as multiple contexts).

## Running EQS Queries

### From C++ (Async)
```cpp
UEnvQueryManager* EQSManager = UEnvQueryManager::GetCurrent(GetWorld());
FEnvQueryRequest Request(QueryAsset, this);
Request.Execute(EEnvQueryRunMode::SingleBestItem,
    FQueryFinishedSignature::CreateUObject(this, &AMyAIController::OnQueryFinished));

void AMyAIController::OnQueryFinished(TSharedPtr<FEnvQueryResult> Result)
{
    if (Result->IsSuccessful())
    {
        FVector BestLocation = Result->GetItemAsLocation(0);
        // or AActor* BestActor = Result->GetItemAsActor(0);
    }
}
```

### Run Modes
- **SingleBestItem** -- returns only the highest-scoring item (fastest)
- **RandomBest5Pct** -- random item from top 5% (adds variety)
- **RandomBest25Pct** -- random item from top 25% (more variety)
- **AllMatching** -- returns all items that pass filters (for batch processing)

### From Behavior Trees
Use the built-in **Run EQS Query** task node. Configure:
- Query template (the EQS asset)
- Blackboard key to store the result
- Run mode
- Query config overrides (parameter binding)

### From Blueprints
Use `Run EQS Query` async node. Bind to `OnQueryFinished` delegate to receive results.

## EQS Debugging

### Visual Logger
EQS automatically logs query results to the Visual Logger. Each item shows its score breakdown, which test failed/scored what. Enable via `VisualLogger` console command.

### Gameplay Debugger
Press `'` in PIE, navigate to the EQS category. Shows the last query result with color-coded spheres:
- **Green** = high score
- **Red** = low score
- **Grey** = filtered out

### EQS Testing Pawn
Place an `AEQSTestingPawn` in the level and assign a query. It continuously runs the query and visualizes results in the viewport. Excellent for iterating on query design without running AI.

### Console Commands
```
ai.eqs.AllowStale 0       -- force fresh queries every time
ai.eqs.StepResults 1      -- step through results one at a time
LogEQS Verbose             -- detailed EQS logging
```

## Common Query Patterns

### Find Cover Position
Generator: Points Grid around querier. Tests: Trace (filter: blocked from enemy = good cover), Distance to enemy (score: prefer medium range), Pathfinding to querier (score: prefer short path), Distance to querier (filter: max range).

### Find Flanking Position
Generator: Points Donut around enemy. Tests: Dot product of enemy-facing vs enemy-to-item (filter: remove items in front of enemy), Trace from item to enemy (score: prefer line of sight), Pathfinding (score: prefer shorter paths).

### Find Patrol Point
Generator: Points NavMesh in large radius. Tests: Distance to querier (filter: min distance for variety), Distance to last patrol point (score: prefer variety), Pathfinding (filter: must be reachable).

### Find Safe Retreat Position
Generator: Points Grid behind querier (relative to threat). Tests: Distance to threat (score: prefer far), Trace from threat (filter: prefer no line of sight), Pathfinding to querier (score: prefer short path).
