# Gameplay Ability System (GAS) Architecture

## When to Use GAS

**Use GAS when**:
- Game has abilities/skills with cooldowns, costs, and state management
- Need tag-based state queries (stunned, burning, silenced, etc.)
- Need attribute-based gameplay (health, mana, damage, armor)
- Building multiplayer with ability prediction
- Building RPG, action, or ability-heavy games

**Consider alternatives when**:
- Simple single-player with few interactions
- Minimal combat/ability needs (a basic health system may suffice)
- Prototyping (GAS adds complexity; start simple, migrate later)

---

## Architecture Layers

### Layer 1: AbilitySystemComponent (ASC)
The hub that lives on an actor and manages everything.

**ASC Ownership Decision**:
| Placement | Use When | Reason |
|-----------|----------|--------|
| On PlayerState | Persistent characters that respawn (MOBAs, hero shooters) | Attributes/effects survive pawn death |
| On Character/Pawn | AI minions, simple single-player, disposable pawns | Simpler lifecycle, no cross-pawn persistence needed |

Both the owning actor and the avatar actor should implement `IAbilitySystemInterface`.

**Lyra's ASC Extensions** (`ULyraAbilitySystemComponent`):
- **Activation Groups**: Independent, Exclusive_Replaceable, Exclusive_Blocking
- **Input-Tag Triggering**: `AbilityInputTagPressed(FGameplayTag)` activates matching abilities
- **Tag Relationship Mapping**: Per-pawn customization of which tags block/require abilities
- **Dynamic Tags**: Add/remove tags via temporary GameplayEffects

**Replication Mode Selection**:
| Mode | Target | Network Impact |
|------|--------|----------------|
| Full | Single-player | All effects replicated everywhere |
| Mixed | Player-controlled | Effects to owning client; tags/cues to all |
| Minimal | AI-controlled | No effect replication; tags/cues only |

### Layer 2: GameplayAbilities
Executable gameplay logic units.

**Lyra's Base Ability** (`ULyraGameplayAbility`):
```cpp
enum class ELyraAbilityActivationPolicy : uint8 {
    OnInputTriggered,   // Activate on input press
    WhileInputActive,   // Activate while input held
    OnSpawn             // Activate when avatar assigned
};

enum class ELyraAbilityActivationGroup : uint8 {
    Independent,            // Runs independently
    Exclusive_Replaceable,  // Can be replaced by another exclusive
    Exclusive_Blocking,     // Blocks other exclusives
};
```

**Specialized Abilities**: Death, Jump, Reset, RangedWeapon — each extends the base with specific logic.

**Ability Costs** (custom system):
- `ULyraAbilityCost_InventoryItem`: Consume inventory items
- `ULyraAbilityCost_PlayerTagStack`: Deduct from PlayerState tag stacks
- `ULyraAbilityCost_ItemTagStack`: Deduct from equipment item tag stacks
- `ShouldOnlyApplyCostOnHit()`: Applies cost only on successful hit (ammo-on-hit pattern)

### Layer 3: AbilitySets (Composition)
Bundles of abilities, effects, and attribute sets for data-driven composition.

**ULyraAbilitySet** (DataAsset):
```cpp
struct FLyraAbilitySet_GameplayAbility {
    TSubclassOf<ULyraGameplayAbility> Ability;
    int32 AbilityLevel;
    FGameplayTag InputTag;  // Tag that triggers this ability
};

struct FLyraAbilitySet_GameplayEffect {
    TSubclassOf<UGameplayEffect> GameplayEffect;
    float EffectLevel;
};

struct FLyraAbilitySet_AttributeSet {
    TSubclassOf<UAttributeSet> AttributeSet;
};
```

Grant with `GiveToAbilitySystem(ASC, GrantedHandles, SourceObject)`.
Revoke with `GrantedHandles.TakeFromAbilitySystem(ASC)`.

### Layer 4: Attribute Sets
Define gameplay attributes (health, damage, mana).

**Lyra's Attribute Sets**:
- `ULyraHealthSet`: Health, MaxHealth (with pre/post-modification events)
- `ULyraCombatSet`: Combat stats (from ShooterCore plugin)

**Best Practices**:
- Create specialized AttributeSet subclasses for logical groupings
- Use meta attributes (Damage, Healing) for temporary calculation values — never replicate meta attributes
- Initialize from DataTables, never hardcode
- Use `ATTRIBUTE_ACCESSORS` macro for boilerplate getters/setters

### Layer 5: Execution Calculations
Server-side damage/healing formulas.

- `LyraDamageExecution`: Calculates damage with mitigation
- `LyraHealExecution`: Calculates healing

### Layer 6: GameplayCues
Client-side visual/audio feedback. Never contain gameplay logic.

**Path configuration**: `UGameFeatureAction_AddGameplayCuePath` adds directories to cue search paths.

---

## Global Ability System

**ULyraGlobalAbilitySystem** (WorldSubsystem):
- Apply abilities/effects to ALL registered ASCs simultaneously
- `ApplyAbilityToAll()`, `ApplyEffectToAll()`
- `RemoveAbilityFromAll()`, `RemoveEffectFromAll()`
- Useful for global buffs, weather effects, game-wide modifiers

---

## Input-Tag-Based Ability Activation Flow

```
1. Player presses key → Enhanced Input → InputAction fires
2. HeroComponent maps InputAction → FGameplayTag (from LyraInputConfig)
3. HeroComponent calls ASC->AbilityInputTagPressed(Tag)
4. ASC finds all abilities matching that InputTag
5. ASC activates matching abilities (checking costs, tags, cooldowns)
6. On key release: ASC->AbilityInputTagReleased(Tag)
```

This decouples input from abilities entirely — changing which ability fires on a button = changing the InputConfig DataAsset.

---

## Tag Relationship Mapping

`ULyraAbilityTagRelationshipMapping`:
- Loaded from PawnData (not hardcoded)
- Per-pawn customization of tag requirements/blocking
- Example: Pawn A's jump ability is blocked by `Status.Stunned`, Pawn B's is not
- Applied via `ASC->SetTagRelationshipMapping(Mapping)`

---

## Performance Optimization

- **Ability Batching**: Batch multiple activations into single RPCs for rapid-fire
- **Cue Batching**: Combine cues from one effect into a single network message
- **Lazy Loading**: Defer ability spec creation until needed
- **Push Model**: Use property-level dirty flags for frequently-changing attributes
- **Replication Proxy**: Consolidate replication for multiple ASCs through a proxy actor
- **Minimal Replication**: Use Minimal mode for all AI — biggest performance win

---

## Common Anti-Patterns

- Calling `TryActivateAbility` without checking costs/tags first
- Replicating meta attributes (transient server-side only)
- Spawning projectiles predictively on client (non-predictable)
- Using Mixed replication mode without setting Owner to controlling Controller
- Granting all abilities at spawn instead of lazy-loading
- Hardcoding attribute initialization instead of driving from data
- Calling cues individually instead of batching
- Putting gameplay logic in GameplayCues (cues are cosmetic only)
- Not using GrantedHandles for cleanup (causes ability leaks on respawn)
- Using `ActivationGroup::Independent` for abilities that should be exclusive (firing while reloading)
