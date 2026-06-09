# AI Perception System

## Architecture Overview

The AI Perception system provides a unified framework for AI senses -- sight, hearing, damage, touch, prediction, and team awareness. It replaces ad-hoc raycasting and overlap checks with a configurable, event-driven sensing pipeline.

**Core classes:**
- **UAIPerceptionComponent** -- attached to the AIController, receives and processes stimuli
- **UAIPerceptionStimuliSourceComponent** -- attached to actors that EMIT stimuli (optional; some senses auto-register)
- **UAISenseConfig** -- configuration for a specific sense (range, age, affiliation)
- **UAISense** -- the sense implementation (processes raw stimuli into perception data)
- **FAIStimulus** -- a single sensory event (location, strength, age, tag)

## Setting Up Perception

### On the AIController
```cpp
AMyAIController::AMyAIController()
{
    PerceptionComponent = CreateDefaultSubobject<UAIPerceptionComponent>(TEXT("PerceptionComp"));
    SetPerceptionComponent(*PerceptionComponent);

    // Configure sight
    UAISenseConfig_Sight* SightConfig = CreateDefaultSubobject<UAISenseConfig_Sight>(TEXT("SightConfig"));
    SightConfig->SightRadius = 3000.f;
    SightConfig->LoseSightRadius = 3500.f;
    SightConfig->PeripheralVisionAngleDegrees = 60.f;
    SightConfig->SetMaxAge(5.f);
    SightConfig->AutoSuccessRangeFromLastSeenLocation = 500.f;
    SightConfig->DetectionByAffiliation.bDetectEnemies = true;
    SightConfig->DetectionByAffiliation.bDetectNeutrals = true;
    SightConfig->DetectionByAffiliation.bDetectFriendlies = false;

    PerceptionComponent->ConfigureSense(*SightConfig);
    PerceptionComponent->SetDominantSense(UAISense_Sight::StaticClass());
}
```

### On the Stimulus Source (Optional)
For senses that require explicit registration (Hearing, custom senses), add `UAIPerceptionStimuliSourceComponent` to the source actor:
```cpp
StimuliSource = CreateDefaultSubobject<UAIPerceptionStimuliSourceComponent>(TEXT("StimuliSource"));
StimuliSource->RegisterForSense(TSubclassOf<UAISense_Hearing>());
StimuliSource->bAutoRegister = true;
```

Sight auto-registers actors by default -- any actor can be seen without a stimuli source component.

## Sense Types

### Sight (UAISense_Sight)
The most commonly used sense. Performs visibility checks using line traces.

**Key parameters:**
- `SightRadius` -- maximum detection range
- `LoseSightRadius` -- range at which a previously seen target is lost (should be > SightRadius to prevent flicker)
- `PeripheralVisionAngleDegrees` -- half-angle of the vision cone (90 = 180-degree FOV)
- `AutoSuccessRangeFromLastSeenLocation` -- within this range of last known position, sight always succeeds (prevents "hiding behind a lamp post" issues)
- `MaxAge` -- how long a sight stimulus stays valid after the target is no longer visible
- `PointOfViewBackwardOffset` / `NearClippingRadius` -- fine-tune the origin of sight traces

### Hearing (UAISense_Hearing)
Detects noise events reported via `UAISense_Hearing::ReportNoiseEvent()` or `MakeNoise()` on actors.

```cpp
// Report a noise event
UAISense_Hearing::ReportNoiseEvent(
    GetWorld(),
    NoiseLocation,
    Loudness,        // 0-1 normalized
    NoiseMaker,
    MaxRange,        // 0 = use default from config
    Tag              // optional FName for filtering
);
```

The stimulus source actor must have `UAIPerceptionStimuliSourceComponent` with Hearing registered, OR use the `MakeNoise` function which auto-registers.

### Damage (UAISense_Damage)
Detects damage events. Report damage via:
```cpp
UAISense_Damage::ReportDamageEvent(
    GetWorld(),
    DamagedActor,
    DamageInstigator,
    DamageAmount,
    DamageLocation,
    HitLocation
);
```

This is separate from the UE damage system (`TakeDamage`). You must explicitly report damage events to the perception system, typically in your `TakeDamage` handler.

### Touch (UAISense_Touch)
Detects physical contact. Rarely used directly -- most projects use overlap events instead. Requires actors to generate touch/hit events.

### Prediction (UAISense_Prediction)
Provides predicted future locations of perceived targets. Useful for leading shots or interception paths. Automatically activated when other senses are configured.

### Team (UAISense_Team)
Shares perception data between team members. When one AI sees an enemy, teammates with Team sense configured also become aware. Configure via `FGenericTeamId` on the controllers.

## Affiliation Filtering

Every sense config has `DetectionByAffiliation`:
- `bDetectEnemies` -- detect hostile actors
- `bDetectNeutrals` -- detect neutral actors
- `bDetectFriendlies` -- detect allied actors

Affiliation is determined by `IGenericTeamAgentInterface` on the AIController:
```cpp
class AMyAIController : public AAIController, public IGenericTeamAgentInterface
{
    FGenericTeamId TeamId;

    virtual FGenericTeamId GetGenericTeamId() const override { return TeamId; }
    virtual ETeamAttitude::Type GetTeamAttitudeTowards(const AActor& Other) const override;
};
```

`GetTeamAttitudeTowards` returns `Friendly`, `Hostile`, or `Neutral`. The default implementation: same team = Friendly, different team = Hostile, no team = Neutral.

## Delegates and Event Handling

### OnPerceptionUpdated
Fires whenever any perceived actor's state changes. Provides the full list of currently perceived actors.
```cpp
PerceptionComponent->OnPerceptionUpdated.AddDynamic(this, &AMyAIController::OnPerceptionUpdated);

void AMyAIController::OnPerceptionUpdated(const TArray<AActor*>& UpdatedActors)
{
    for (AActor* Actor : UpdatedActors)
    {
        // Process all actors with updated perception state
    }
}
```

### OnTargetPerceptionUpdated
Fires per-actor when a specific target's perception changes. More granular than OnPerceptionUpdated.
```cpp
PerceptionComponent->OnTargetPerceptionUpdated.AddDynamic(this, &AMyAIController::OnTargetPerceptionUpdated);

void AMyAIController::OnTargetPerceptionUpdated(AActor* Actor, FAIStimulus Stimulus)
{
    if (Stimulus.WasSuccessfullySensed())
    {
        // Actor just detected
    }
    else
    {
        // Actor lost (stimulus expired or left range)
    }
}
```

### OnTargetPerceptionInfoUpdated (UE 5.x)
Extended version that provides the full `FActorPerceptionUpdateInfo` including sense class:
```cpp
PerceptionComponent->OnTargetPerceptionInfoUpdated.AddDynamic(
    this, &AMyAIController::OnTargetPerceptionInfoUpdated);

void AMyAIController::OnTargetPerceptionInfoUpdated(const FActorPerceptionUpdateInfo& UpdateInfo)
{
    UpdateInfo.Target;    // the perceived actor
    UpdateInfo.Stimulus;  // FAIStimulus
    // Check which sense triggered: UpdateInfo.Stimulus.Type
}
```

### Querying Perception State
```cpp
TArray<AActor*> PerceivedActors;
PerceptionComponent->GetCurrentlyPerceivedActors(UAISense_Sight::StaticClass(), PerceivedActors);

// Or check a specific actor
FActorPerceptionBlueprintInfo Info;
PerceptionComponent->GetActorsPerception(TargetActor, Info);
for (const FAIStimulus& Stimulus : Info.LastSensedStimuli)
{
    if (Stimulus.WasSuccessfullySensed()) { /* ... */ }
}
```

## Manual Stimulus Reporting

For custom events that don't fit built-in senses:
```cpp
// Report a hearing stimulus manually
FAIStimulus Stimulus(
    *UAISense_Hearing::StaticClass()->GetDefaultObject<UAISense>(),
    Strength,
    Location,
    Tag
);
UAIPerceptionSystem::GetCurrent(GetWorld())->OnEvent(Stimulus);
```

## Custom Sense Implementation

Create a new sense by subclassing `UAISense`:
```cpp
UCLASS()
class UAISense_Tremor : public UAISense
{
    GENERATED_BODY()

    virtual float Update() override;  // Process pending stimuli, return time until next update
};

UCLASS()
class UAISenseConfig_Tremor : public UAISenseConfig
{
    GENERATED_BODY()

    UPROPERTY(EditAnywhere)
    float TremorRange = 1000.f;

    virtual TSubclassOf<UAISense> GetSenseImplementation() const override
    {
        return UAISense_Tremor::StaticClass();
    }
};
```

## Debugging Perception

### Gameplay Debugger
Press `'` in PIE and select the Perception category. Shows:
- Vision cones with color-coded detection state
- Heard noise locations
- Perceived actor list with sense type and age

### AI Debugger (DrawDebug)
Enable `bDrawDebugInfo` on AIPerceptionComponent class defaults or at runtime. Draws vision cones, hearing radius, and detected actors in the viewport.

### Console Commands
```
ai.perception.debug 1                -- global perception debug draw
ai.perception.DrawSightRadii 1       -- sight radius visualization
LogAIPerception Verbose               -- detailed perception logging
```

### Common Issues
- **Nothing is sensed**: Check that at least one `UAISenseConfig` is added to the perception component. An empty config array is the most common mistake.
- **Sight works but hearing doesn't**: Ensure the noise source has `UAIPerceptionStimuliSourceComponent` with Hearing registered, or use `MakeNoise()`.
- **Detection flickers**: `LoseSightRadius` is too close to `SightRadius`. Add a buffer (e.g., SightRadius=2000, LoseSightRadius=2500).
- **Friendly fire detection**: `bDetectFriendlies` is false by default. Enable it if allies need to be sensed.
- **Perception not updating**: The AIPerceptionSystem updates on a timer. For immediate response, check `UAIPerceptionSystem::GetCurrent(World)->Tick(0.f)` in debug builds.

---

## MCP tools

| Tool | Purpose | Scenario |
|------|---------|----------|
| `ue_play` | Start PIE | Trigger the scenario where an AI should perceive a target |
| `ue_get_logs` | Stream perception log output | `category="LogAIPerception"`, `minVerbosity="Verbose"` — see when stimuli arrive and age out |
| `ue_execute_python` | Query perception state at runtime | `ai_controller.get_ai_perception_component().get_currently_perceived_actors(...)` |
| `xdebug_set_breakpoint` | Break on stimulus reception | `UAIPerceptionComponent::ProcessStimuli` — inspect `FAIStimulus` fields at the moment of detection |
| `xdebug_get_frame_values` | Read perceived actor list | Inspect `PerceptualData` map or `GetActorsPerception` result struct at the breakpoint |
