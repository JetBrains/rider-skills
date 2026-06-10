# Gameplay Cue Pitfalls — Debugging Guide

Common issues with Gameplay Cues, organized by symptom → cause → fix.

---

## 1. Gameplay Logic in Cues

**Symptom**: Inconsistent game state between clients. Health/damage/cooldown values differ. Some clients miss state changes entirely.

**Cause**: Gameplay Cues use **unreliable** multicast RPCs. Clients may miss cue events due to packet loss, network congestion, or relevancy. They are designed for cosmetic-only feedback.

**Fix**:
- NEVER put gameplay logic in GameplayCues — no health changes, no spawning actors with gameplay impact, no state mutations
- All gameplay state changes go through GameplayEffects, Abilities, or replicated RPCs
- Cues are for: particles, sounds, camera shakes, UI animations, screen effects

---

## 2. Cue Not Firing

**Symptom**: GameplayCue doesn't execute. No visual/audio feedback despite GE being applied successfully.

**Cause (most common — wrong scan paths)**: The `UGameplayCueManager` doesn't know where to find the cue class. Without configured paths, it scans ALL of `/Game/` which can fail or be extremely slow.

**Fix**:
```ini
[/Script/GameplayAbilities.AbilitySystemGlobals]
+GameplayCueNotifyPaths=/Game/Effects/GameplayCues
```
Ensure the GCN Blueprint/class is in one of these directories.

**Cause (missing tag prefix)**: Cue tag doesn't start with `GameplayCue.`

**Fix**: All cue tags MUST begin with `GameplayCue.` prefix. Example: `GameplayCue.Damage.Fire`, NOT `Damage.Fire`.

**Cause (class not loaded)**: Async loading hasn't completed when cue fires.

**Fix**:
- Set `NumPreallocatedInstances > 0` for critical cues (preloads the class)
- Override `ShouldSyncLoadMissingGameplayCues()` → `true` for blocking load
- Or override `ShouldAsyncLoadMissingGameplayCues()` → `true` for deferred execution

**Cause (GameFeature plugin cues)**: INI-based `+GameplayCueNotifyPaths` doesn't work for GameFeature modules.

**Fix**: Register paths programmatically:
```cpp
UAbilitySystemGlobals::Get().GetGameplayCueManager()->AddGameplayCueNotifyPath(TEXT("/YourPlugin/GameplayCues"));
```

---

## 3. Cue Fires on Server but Not Clients

**Symptom**: Server shows VFX/SFX but clients see nothing.

**Cause**: Replication mode mismatch. Using `Minimal` replication where `Mixed` is needed, or ASC not properly initialized on client.

**Fix**:
- Verify `InitAbilityActorInfo()` is called on BOTH server (`PossessedBy()`) AND client (`OnRep_PlayerState()`)
- Check `EGameplayEffectReplicationMode` — use `Mixed` for player-controlled actors
- Verify the cue class is available on clients (packaged in the build)

---

## 4. Cue Fires Twice on Listen Server

**Symptom**: On a listen server, the host player sees VFX/SFX play twice — once locally and once from the replicated RPC.

**Cause**: Known engine behavior with `Mixed`/`Minimal` replication modes. `OnActive`/`OnRemove` fire twice:
1. Once from local GE application
2. Once from the NetMulticast RPC

`WhileActive` fires only once. Pure clients are unaffected.

**Fix**:
- Use a guard flag to prevent double execution:
```cpp
bool AGCN_MyEffect::OnActive_Implementation(AActor* MyTarget, const FGameplayCueParameters& Parameters)
{
    if (bIsAlreadyActive) return true; // Guard against double-fire
    bIsAlreadyActive = true;
    // ... spawn effects
    return true;
}
```
- Or accept the double-fire and make effects idempotent (re-spawning the same particle is a no-op)

---

## 5. Cue "Stuck On" for Late Joiners

**Symptom**: A client joins mid-game and sees an effect permanently stuck (particles never stop, sound loops forever), or doesn't see an ongoing effect at all.

**Cause**: `WhileActive` / `OnBecomeRelevant` (UE 5.5+) is not implemented. Only `OnActive` was overridden.

**Fix**: ALWAYS implement `WhileActive` alongside `OnActive`:
```cpp
// WhileActive handles late joiners — restart effects if not playing
bool WhileActive_Implementation(AActor* MyTarget, const FGameplayCueParameters& Parameters) override
{
    if (!ActiveParticle || !ActiveParticle->IsActive())
    {
        SpawnEffects(MyTarget); // Same as OnActive
    }
    return true;
}
```

UE 5.5+ issues asset validation warnings for `OnBurst` + `OnCeaseRelevant` without `OnBecomeRelevant`.

---

## 6. Actor Cue Memory Leak / Pool Exhaustion

**Symptom**: Memory grows over time. `GameplayCueNotify_Actor` instances accumulate. Performance degrades.

**Cause**: `bAutoDestroyOnRemove` is false (default), and `EndGameplayCue()` is never called manually.

**Fix**:
- Set `bAutoDestroyOnRemove = true` in the constructor
- Optionally set `AutoDestroyDelay` for particles to finish before recycling
- Override `Recycle()` and `ReuseAfterRecycle()` if using object pooling
- Monitor with: `UGameplayCueManager::DumpPreallocationStats(World)`

---

## 7. Wrong Effect for Physical Material

**Symptom**: Metal impact plays wood sound, or all impacts look the same regardless of surface.

**Cause**: `FGameplayCueParameters::PhysicalMaterial` is not populated. The GE's `EffectContext` doesn't carry hit result data.

**Fix**: Ensure the ability sets hit result on the effect context:
```cpp
FGameplayEffectContextHandle ContextHandle = ASC->MakeEffectContext();
ContextHandle.AddHitResult(HitResult); // This populates PhysicalMaterial
FGameplayEffectSpecHandle Spec = ASC->MakeOutgoingSpec(DamageEffect, Level, ContextHandle);
```

---

## 8. Cue Parameters Missing Location/Normal

**Symptom**: Impact particles spawn at world origin (0,0,0) instead of hit location.

**Cause**: `FGameplayCueParameters::Location` and `Normal` are NOT auto-populated from the effect context. They default to `FVector::ZeroVector`.

**Fix**: Either set them explicitly when triggering manual cues:
```cpp
FGameplayCueParameters Params;
Params.Location = HitResult.ImpactPoint;
Params.Normal = HitResult.ImpactNormal;
ASC->ExecuteGameplayCue(Tag, Params);
```
Or extract from EffectContext in the cue handler:
```cpp
if (const FHitResult* Hit = Parameters.EffectContext.GetHitResult())
{
    FVector Location = Hit->ImpactPoint;
    FVector Normal = Hit->ImpactNormal;
}
```

---

## 9. Custom EffectContext Data Not Available in Cue

**Symptom**: `static_cast<FMyContext*>(Parameters.EffectContext.Get())` returns base type, custom fields are zero/empty.

**Cause**: Custom `AbilitySystemGlobals` subclass not registered, so `AllocGameplayEffectContext()` still returns the base type.

**Fix**:
```ini
[/Script/GameplayAbilities.AbilitySystemGlobals]
AbilitySystemGlobalsClassName=/Script/MyProject.MyAbilitySystemGlobals
```
AND call `UAbilitySystemGlobals::Get().InitGlobalData()` early (e.g., in `UGameInstanceSubsystem::Initialize()`).

---

## 10. Massive Startup Hitch from Cue Loading

**Symptom**: Game takes 10-30+ seconds to load. Memory usage spikes at startup. All particle systems and sounds load into memory.

**Cause**: No `GameplayCueNotifyPaths` configured. The GameplayCueManager scans ALL of `/Game/`, loading every GCN Blueprint and all their referenced assets (particles, sounds, textures).

**Fix**:
```ini
[/Script/GameplayAbilities.AbilitySystemGlobals]
+GameplayCueNotifyPaths=/Game/Effects/GameplayCues
```
Or use the Lyra pattern — custom GameplayCueManager that returns false from `ShouldAsyncLoadRuntimeObjectLibraries()` for on-demand loading.

---

## 11. Cues Out of Order (Add then Remove Before Load)

**Symptom**: `AddGameplayCue` fires, then `RemoveGameplayCue` fires immediately. The cue class hasn't async-loaded yet. When the load completes, `OnActive` fires but `OnRemove` never does → effect stuck on.

**Cause**: Known engine race condition when async loading cues (reported as UE-259543).

**Fix**:
- Preload critical cues via `NumPreallocatedInstances` or `GetAlwaysLoadedGameplayCuePaths()`
- For non-critical cues: accept occasional stuck effects or implement a timeout
- Override `ShouldSyncLoadMissingGameplayCues()` → `true` for critical cues (blocks but guarantees order)

---

## 12. Prediction Mismatch — Cue Plays Twice or Not At All

**Symptom**: Locally predicted cue plays, then server-replicated cue plays again (double VFX). Or predicted cue plays but server rejects → visual artifact lingers.

**Cause**: Prediction key handling. If the client predicts a cue and the server confirms with a matching key, the replicated event should be suppressed. If keys don't match, both fire.

**Fix**:
- Ensure abilities use proper prediction: `LocalPredicted` net execution policy
- For cues triggered via GEs: prediction is automatic if the GE application is predicted
- For manual cues (`ExecuteGameplayCue`): the prediction key is passed automatically from the ability's activation info
- If server rejects: the predicted cue is rolled back via `FPredictionKeyDelegates`

---

## 13. Cue Tag Not Found in Editor

**Symptom**: Tag dropdown in Blueprint doesn't show `GameplayCue.*` tags. Can't assign tag to GCN Blueprint.

**Cause**: Tags not registered in the gameplay tag table. The `GameplayCue.` parent tag hierarchy doesn't exist.

**Fix**:
- Add tags to `DefaultGameplayTags.ini` or a Gameplay Tag DataTable
- Or use native C++ tag declaration:
```cpp
UE_DEFINE_GAMEPLAY_TAG(TAG_GameplayCue_Fire_Impact, "GameplayCue.Fire.Impact");
```
- Ensure the `GameplayCue` root tag exists in the tag hierarchy

---

## 14. Performance: Too Many Actor Cues Spawning

**Symptom**: Frame rate drops during combat. Profiler shows high actor spawn/destroy cost.

**Cause**: Using `AGameplayCueNotify_Actor` for effects that don't need persistence (one-shot impacts, flashes).

**Fix**:
- Use `UGameplayCueNotify_Static` for simple instant effects (no actor spawned)
- Use `UGameplayCueNotify_Burst` for one-off VFX/SFX with built-in spawn config
- Reserve `_Actor` for effects that genuinely need state and persistence
- Set `NumPreallocatedInstances` on Actor cues to use pooling
- Use `FScopedGameplayCueSendContext` to batch RPCs

---

## 15. Blueprint vs C++ Cue Performance

**Symptom**: High-frequency cue (every hit in rapid combat) causes frame drops when using Blueprint GCN.

**Cause**: Blueprint Virtual Machine overhead per cue execution. Each Blueprint event node has dispatch cost.

**Fix**:
- Use C++ `GameplayCueNotify_Static` for high-frequency cues (hit impacts)
- Use C++ base class + Blueprint-configurable properties for designer iteration
- Blueprint GCN is fine for low-frequency cues (ability activation, buff application)

---

## Diagnostic Checklist

When a cue isn't working, check these in order:

1. **Tag prefix**: Does the tag start with `GameplayCue.`?
2. **Scan paths**: Is the cue class in a directory listed in `GameplayCueNotifyPaths`?
3. **Tag match**: Does the GCN's `GameplayCueTag` match exactly?
4. **GE attachment**: Is the cue tag listed in the GameplayEffect's `GameplayCues` array?
5. **ASC init**: Is `InitAbilityActorInfo()` called on both server and client?
6. **Replication mode**: Is the ASC replication mode correct for the use case?
7. **Class loaded**: Is the cue class loaded at runtime? Check with `ShouldSyncLoadMissingGameplayCues()`
8. **WhileActive**: Is `WhileActive` implemented alongside `OnActive`?
9. **Console debug**: Run `showdebug abilitysystem` and `AbilitySystem.GameplayCue.DisplayStates`
10. **Logs**: Enable `Log LogGameplayCueNotify Verbose` to trace cue dispatch
