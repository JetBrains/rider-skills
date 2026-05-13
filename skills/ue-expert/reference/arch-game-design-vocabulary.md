# Game Design Vocabulary for Unreal Engine Architecture

Concepts from *A Game Design Vocabulary* (Anthropy & Clark) mapped to Unreal Engine systems and patterns. Use these mappings when making architecture decisions that affect how players experience the game.

## Core Concepts

### Verbs = Player Actions (Input + Abilities)
A "verb" is any action the player can perform. In UE, verbs are implemented through the input-to-ability pipeline:

| Design Concept | UE Implementation |
|---------------|-------------------|
| Primary verb (e.g., "jump") | `UInputAction` bound via `UInputMappingContext` -> `UGameplayAbility` |
| Verb development (new uses over time) | Ability leveling, unlocking AbilityTags, swapping InputMappingContexts per scene |
| Verb relationships (verbs that affect each other) | GAS: abilities that grant/block other abilities via `ActivationBlockedTags` / `ActivationRequiredTags` |
| Physical layer (how input feels) | Enhanced Input modifiers (dead zones, smoothing, response curves) on `UInputAction` |

**Architecture rule**: Each verb should map to exactly one GameplayAbility (or one per variant). Do not scatter verb logic across Tick functions and raw input handlers — this makes verb development and relationships impossible to manage.

### Objects = Game Entities That Interact With Verbs
"Objects" are everything the player's verbs act upon: enemies, items, terrain, hazards. They create the choices that make verbs meaningful.

| Design Concept | UE Implementation |
|---------------|-------------------|
| Object with rules (e.g., "enemy that falls when ground removed") | Actor with components defining behavior + GameplayTags for properties |
| Object relationships | GameplayEffects that apply tags/modify attributes across actors |
| Object introduction (safe first encounter) | Level design: isolated area where object behavior is observable before it threatens |
| Contextual appearance (visual communicates rules) | Material instances, mesh selection, VFX that signal object properties |

**Architecture rule**: Define object properties via GameplayTags and DataAssets, not class hierarchies. An object that is "fireproof" and "explosive" should have tags `Object.Property.Fireproof` and `Object.Property.Explosive`, queryable by any ability.

### Scenes = Units of Pacing (Levels, Encounters, Moments)
A "scene" is the basic unit of pacing — where verbs get developed and choices get framed. Not necessarily a full level; a scene can be a single room or encounter.

| Design Concept | UE Implementation |
|---------------|-------------------|
| Scene (unit of pacing) | Sublevel (Level Streaming), or a region defined by trigger volumes |
| Scene purpose (what verb is developed here) | Document in `UPrimaryDataAsset` per encounter/region — "this scene teaches X" |
| Scene shape (possibility space) | Level geometry + AI spawn points + item placement constraining player choices |
| Scene pacing (wide/narrow choice space) | Alternate open arenas (exploration) with corridors/chokepoints (focused challenge) |
| Scene ordering | `ULyraExperienceDefinition` or GameMode controlling level sequence |

**Architecture rule**: Every scene/encounter should have a documented purpose. Use DataAssets (e.g., `UEncounterDefinition`) to tag what verbs/objects each encounter develops. This enables playtesting metrics: "Did the player learn X in scene Y?"

## Context = How Players Understand Rules

Context is visual art, animation, sound, and composition that communicates abstract rules to the player without explicit tutorials.

### Visual Communication Patterns
- **Recurring motifs**: Use consistent MaterialParameterCollections or material instances so that "dangerous" objects share visual language (e.g., red glow = damage, metallic sheen = indestructible)
- **Silhouette readability**: Character/object meshes must be distinguishable in silhouette. Test with a post-process material that renders everything as solid black
- **Animation as communication**: UAnimMontages and ABP states should visually convey object state (idle vs aggressive, vulnerable vs invulnerable). Use `PlayMontage` with GameplayTags for state visibility
- **Scene composition**: Camera placement and level art should direct the player's eye to the most important element. Use UE's post-process volumes, lighting, and focal points

### UE Implementation
```
ContextManager (GameInstanceSubsystem)
  ├── Visual language rules (DataAsset: which tags map to which VFX/materials)
  ├── Audio context (MetaSound patches per GameplayTag interaction)
  └── First-impression tracking (has player encountered object type X before?)
```

## Resistance = Difficulty as Storytelling

Resistance is not just "hard vs easy" — it shapes the player's emotional journey. Key concepts:

| Concept | Meaning | UE Pattern |
|---------|---------|------------|
| Push and pull | Alternate tension and release | Difficulty curves in DataTables; GameMode adjusting spawn rates/AI aggression per scene |
| Punishment vs teaching | Death should teach, not waste time | Checkpoint system (SaveGame + PlayerStart placement); minimize repetition of mastered content |
| Resistance as narrative | Difficulty communicates story beats | GameplayEffects that modify player stats per narrative act; AI behavior trees that escalate per story phase |
| Player-set resistance | Let players choose their challenge | Difficulty settings as DataAsset variants; optional harder paths with better rewards |
| Grind as resistance | Repetition that develops or stagnates | XP/progression curves in DataTables; monitor if repetition is developing verbs or just padding |

**Architecture rule**: Separate difficulty tuning from game logic. Store difficulty parameters in `UDataTable` or `UDifficultyDataAsset` so designers can tune resistance curves without code changes. Use `UGameplayModMagnitudeCalculation` for GAS-based scaling.

## Conversations = Designer-Player Dialogue

A game is a conversation between designer and player. The designer speaks through rules, scenes, and context; the player responds through choices and performance.

### Designing for Player Expression
- **Meaningful choices**: Every scene should offer choices made using the player's verbs (not arbitrary A/B button prompts disconnected from gameplay)
- **Performance space**: Give players room to express skill/style within the scene shape. In UE: design encounter volumes larger than the minimum required, with optional objectives
- **Playtesting infrastructure**: Build replay/telemetry systems early. Use `UGameplayMessageRouter` to broadcast key player actions for analytics

### Telling vs Listening
| Game Type | Designer Role | UE Pattern |
|-----------|--------------|------------|
| Expressive/authored (designer tells a story) | Tightly controlled scenes, limited branching | Linear level streaming, scripted sequences via LevelSequence |
| Open/emergent (player creates the story) | Wide possibility spaces, systemic interactions | Procedural spawning, AI with Behavior Trees reacting to world state, GameplayTags driving emergent combos |
| Hybrid | Authored backbone with systemic side-content | Main path via Experience system; open-world regions via WorldPartition with systemic encounters |

## Storytelling Through Systems

Stories in games emerge from rules, not cutscenes. The player perceives narrative through the sequence of interactions.

### Pattern Recognition in UE
- **Juxtaposition**: Place contrasting elements adjacent in time/space — the player constructs meaning. A peaceful scene followed by sudden danger tells a story without words
- **Environmental storytelling**: Use level art, object placement, and world state (destroyed objects, NPC positions) to imply narrative. Implement via `ALevelSequenceActor` for scripted environmental changes
- **Systemic narrative**: When game systems produce stories organically. Requires well-designed verb/object relationships. GAS ability interactions + AI Behavior Trees + destructible environments = emergent stories

### Anti-Patterns (From the Book)
- **Cutscene-as-story**: Interrupting gameplay for non-interactive exposition. Instead: convey story through scene design, object placement, environmental context
- **Tutorial-as-design-failure**: Explicit instruction text means the design failed to teach through play. Instead: introduce each rule in a safe scene where the player discovers it naturally
- **Disconnected moral choices**: Binary A/B choices that don't use the player's verbs. Instead: moral weight should emerge from how the player uses existing verbs in ambiguous situations
- **Upward-only difficulty**: Constantly escalating challenge burns out the player. Instead: alternate tension and release; revisit earlier verbs in new contexts

## Practical Checklist

When architecting a new game feature, ask:
1. **What verb does this add or develop?** Map it to a GameplayAbility
2. **What objects interact with this verb?** Define them with GameplayTags
3. **How will the player learn this?** Design an introduction scene (no text tutorials)
4. **What context communicates the rules?** Plan visual motifs, animation, sound
5. **What choices does this create?** Ensure choices use existing verbs, not disconnected prompts
6. **How does resistance shape the experience?** Define difficulty curves in data, not code
7. **What story emerges?** Consider what the player's journey through these scenes communicates

---
*Source: A Game Design Vocabulary — Exploring the Foundational Principles Behind Good Game Design (Anna Anthropy & Naomi Clark, 2014)*
