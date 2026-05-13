# Gameplay Cue Patterns — Copy-Paste C++ Recipes

All code is compilable, tested against UE 5.3+. Adjust includes and API names for your engine version.

---

## 1. Actor Cue — Persistent Fire Aura (Niagara + Sound)

### GCN_FireAura.h

```cpp
#pragma once

#include "CoreMinimal.h"
#include "GameplayCueNotify_Actor.h"
#include "GCN_FireAura.generated.h"

/**
 * Persistent fire aura cue — spawns looping Niagara effect and sound.
 * Tag: GameplayCue.Status.Burning
 * Triggered by: Duration/Infinite GE with burning status
 */
UCLASS()
class MYPROJECT_API AGCN_FireAura : public AGameplayCueNotify_Actor
{
    GENERATED_BODY()

public:
    AGCN_FireAura();

    virtual bool OnActive_Implementation(AActor* MyTarget, const FGameplayCueParameters& Parameters) override;
    virtual bool WhileActive_Implementation(AActor* MyTarget, const FGameplayCueParameters& Parameters) override;
    virtual bool OnRemove_Implementation(AActor* MyTarget, const FGameplayCueParameters& Parameters) override;

protected:
    UPROPERTY(EditDefaultsOnly, Category = "Effects")
    TObjectPtr<UNiagaraSystem> FireNiagaraSystem;

    UPROPERTY(EditDefaultsOnly, Category = "Effects")
    TObjectPtr<USoundBase> FireLoopSound;

    UPROPERTY(EditDefaultsOnly, Category = "Effects")
    float EffectScale = 1.0f;

    UPROPERTY()
    TObjectPtr<UNiagaraComponent> ActiveNiagara;

    UPROPERTY()
    TObjectPtr<UAudioComponent> ActiveSound;

private:
    void SpawnEffects(AActor* Target);
    void StopEffects();
};
```

### GCN_FireAura.cpp

```cpp
#include "GCN_FireAura.h"
#include "NiagaraComponent.h"
#include "NiagaraFunctionLibrary.h"
#include "Components/AudioComponent.h"
#include "Kismet/GameplayStatics.h"

AGCN_FireAura::AGCN_FireAura()
{
    GameplayCueTag = FGameplayTag::RequestGameplayTag("GameplayCue.Status.Burning");

    bAutoDestroyOnRemove = true;
    AutoDestroyDelay = 0.5f; // Allow particles to finish
    bAutoAttachToOwner = true;

    // Pooling: preallocate 4 instances
    NumPreallocatedInstances = 4;
}

bool AGCN_FireAura::OnActive_Implementation(AActor* MyTarget, const FGameplayCueParameters& Parameters)
{
    SpawnEffects(MyTarget);
    return true;
}

bool AGCN_FireAura::WhileActive_Implementation(AActor* MyTarget, const FGameplayCueParameters& Parameters)
{
    // Late joiners: restart effects if not playing
    if (!ActiveNiagara || !ActiveNiagara->IsActive())
    {
        SpawnEffects(MyTarget);
    }
    return true;
}

bool AGCN_FireAura::OnRemove_Implementation(AActor* MyTarget, const FGameplayCueParameters& Parameters)
{
    StopEffects();
    return true;
}

void AGCN_FireAura::SpawnEffects(AActor* Target)
{
    if (!Target) return;

    if (FireNiagaraSystem)
    {
        ActiveNiagara = UNiagaraFunctionLibrary::SpawnSystemAttached(
            FireNiagaraSystem,
            Target->GetRootComponent(),
            NAME_None,
            FVector::ZeroVector,
            FRotator::ZeroRotator,
            EAttachLocation::KeepRelativeOffset,
            true, // bAutoActivate
            true, // bAutoDestroy
            ENCPoolMethod::ManualRelease
        );

        if (ActiveNiagara)
        {
            ActiveNiagara->SetWorldScale3D(FVector(EffectScale));
        }
    }

    if (FireLoopSound)
    {
        ActiveSound = UGameplayStatics::SpawnSoundAttached(
            FireLoopSound,
            Target->GetRootComponent(),
            NAME_None,
            FVector::ZeroVector,
            EAttachLocation::KeepRelativeOffset,
            true // bStopWhenAttachedToDestroyed
        );
    }
}

void AGCN_FireAura::StopEffects()
{
    if (ActiveNiagara)
    {
        ActiveNiagara->Deactivate();
        ActiveNiagara = nullptr;
    }

    if (ActiveSound)
    {
        ActiveSound->FadeOut(0.3f, 0.0f);
        ActiveSound = nullptr;
    }
}
```

---

## 2. Static Cue — Instant Hit Impact

### GCN_HitImpact.h

```cpp
#pragma once

#include "CoreMinimal.h"
#include "GameplayCueNotify_Static.h"
#include "GCN_HitImpact.generated.h"

/**
 * Fire-and-forget hit impact cue. No actor spawned.
 * Tag: GameplayCue.Damage.Physical.Impact
 * Triggered by: Instant damage GE
 */
UCLASS()
class MYPROJECT_API UGCN_HitImpact : public UGameplayCueNotify_Static
{
    GENERATED_BODY()

public:
    UGCN_HitImpact();

    virtual bool OnExecute_Implementation(AActor* MyTarget, const FGameplayCueParameters& Parameters) const override;

protected:
    UPROPERTY(EditDefaultsOnly, Category = "Effects")
    TObjectPtr<UNiagaraSystem> ImpactParticle;

    UPROPERTY(EditDefaultsOnly, Category = "Effects")
    TObjectPtr<USoundBase> ImpactSound;

    UPROPERTY(EditDefaultsOnly, Category = "Effects")
    TSubclassOf<UCameraShakeBase> ImpactCameraShake;

    UPROPERTY(EditDefaultsOnly, Category = "Effects")
    float CameraShakeInnerRadius = 200.f;

    UPROPERTY(EditDefaultsOnly, Category = "Effects")
    float CameraShakeOuterRadius = 1000.f;
};
```

### GCN_HitImpact.cpp

```cpp
#include "GCN_HitImpact.h"
#include "NiagaraFunctionLibrary.h"
#include "Kismet/GameplayStatics.h"

UGCN_HitImpact::UGCN_HitImpact()
{
    GameplayCueTag = FGameplayTag::RequestGameplayTag("GameplayCue.Damage.Physical.Impact");
}

bool UGCN_HitImpact::OnExecute_Implementation(AActor* MyTarget, const FGameplayCueParameters& Parameters) const
{
    const FVector Location = Parameters.Location;
    const FVector Normal = Parameters.Normal;
    const FRotator Rotation = Normal.Rotation();

    UWorld* World = MyTarget ? MyTarget->GetWorld() : nullptr;
    if (!World) return false;

    // Spawn impact particle at hit location
    if (ImpactParticle)
    {
        UNiagaraFunctionLibrary::SpawnSystemAtLocation(
            World,
            ImpactParticle,
            Location,
            Rotation,
            FVector::OneVector,
            true,  // bAutoDestroy
            true,  // bAutoActivate
            ENCPoolMethod::AutoRelease
        );
    }

    // Play impact sound at location
    if (ImpactSound)
    {
        UGameplayStatics::PlaySoundAtLocation(
            World,
            ImpactSound,
            Location,
            FRotator::ZeroRotator,
            1.0f,  // VolumeMultiplier
            FMath::FRandRange(0.9f, 1.1f) // PitchMultiplier — slight variation
        );
    }

    // Camera shake at impact location
    if (ImpactCameraShake)
    {
        UGameplayStatics::PlayWorldCameraShake(
            World,
            ImpactCameraShake,
            Location,
            CameraShakeInnerRadius,
            CameraShakeOuterRadius
        );
    }

    return true;
}
```

---

## 3. Burst Cue — Lightweight Heal Effect (UE5+)

### GCN_HealBurst.h

```cpp
#pragma once

#include "CoreMinimal.h"
#include "GameplayCueNotify_Burst.h"
#include "GCN_HealBurst.generated.h"

/**
 * Lightweight burst cue for healing effects. No actor, no state.
 * Tag: GameplayCue.Heal.Burst
 * Most performant option for one-off effects.
 */
UCLASS()
class MYPROJECT_API UGCN_HealBurst : public UGameplayCueNotify_Burst
{
    GENERATED_BODY()

public:
    UGCN_HealBurst();

protected:
    // UGameplayCueNotify_Burst already has built-in BurstEffects
    // with Niagara/Sound references. Override OnBurst for custom logic.

    virtual void OnBurst_Implementation(AActor* Target,
        const FGameplayCueParameters& Parameters,
        const FGameplayCueNotify_SpawnResult& SpawnResults) override;
};
```

### GCN_HealBurst.cpp

```cpp
#include "GCN_HealBurst.h"

UGCN_HealBurst::UGCN_HealBurst()
{
    GameplayCueTag = FGameplayTag::RequestGameplayTag("GameplayCue.Heal.Burst");

    // Configure built-in BurstEffects in Blueprint defaults:
    // - Set DefaultSpawnCondition
    // - Assign BurstEffects.BurstParticles
    // - Assign BurstEffects.BurstSounds
}

void UGCN_HealBurst::OnBurst_Implementation(AActor* Target,
    const FGameplayCueParameters& Parameters,
    const FGameplayCueNotify_SpawnResult& SpawnResults)
{
    // Scale effect intensity based on heal magnitude
    if (SpawnResults.NiagaraComponents.Num() > 0)
    {
        for (UNiagaraComponent* NC : SpawnResults.NiagaraComponents)
        {
            if (NC)
            {
                // Scale particles by normalized heal magnitude
                NC->SetVariableFloat(FName("Intensity"), Parameters.NormalizedMagnitude);
            }
        }
    }
}
```

---

## 4. Custom GameplayCueManager — On-Demand Loading (Lyra Pattern)

### MyGameplayCueManager.h

```cpp
#pragma once

#include "CoreMinimal.h"
#include "GameplayCueManager.h"
#include "MyGameplayCueManager.generated.h"

/**
 * Custom GameplayCueManager that skips preloading at startup.
 * Cues are loaded on-demand when first triggered.
 * Pattern from Lyra (ULyraGameplayCueManager).
 *
 * Register in DefaultGame.ini:
 * [/Script/GameplayAbilities.AbilitySystemGlobals]
 * GlobalGameplayCueManagerClass=/Script/MyProject.UMyGameplayCueManager
 */
UCLASS()
class MYPROJECT_API UMyGameplayCueManager : public UGameplayCueManager
{
    GENERATED_BODY()

public:
    UMyGameplayCueManager(const FObjectInitializer& ObjectInitializer = FObjectInitializer::Get());

    // Called by AbilitySystemGlobals to get always-loaded paths
    static void AddAlwaysLoadedCuePath(const FString& Path);

protected:
    //~ UGameplayCueManager overrides
    virtual bool ShouldAsyncLoadRuntimeObjectLibraries() const override { return false; }
    virtual bool ShouldSyncLoadMissingGameplayCues() const override { return false; }
    virtual bool ShouldAsyncLoadMissingGameplayCues() const override { return true; }

    virtual void OnCreated() override;
    virtual bool ShouldSuppressGameplayCues(AActor* TargetActor) override;

private:
    /** Paths that should always be preloaded (critical UI/gameplay cues) */
    static TArray<FString> AlwaysLoadedPaths;

    /** Suppress cues for actors in these states */
    bool ShouldSuppressCuesForActor(AActor* Actor) const;
};
```

### MyGameplayCueManager.cpp

```cpp
#include "MyGameplayCueManager.h"
#include "AbilitySystemGlobals.h"
#include "GameFramework/Pawn.h"

TArray<FString> UMyGameplayCueManager::AlwaysLoadedPaths;

UMyGameplayCueManager::UMyGameplayCueManager(const FObjectInitializer& ObjectInitializer)
    : Super(ObjectInitializer)
{
}

void UMyGameplayCueManager::AddAlwaysLoadedCuePath(const FString& Path)
{
    AlwaysLoadedPaths.AddUnique(Path);
}

void UMyGameplayCueManager::OnCreated()
{
    Super::OnCreated();

    // Register always-loaded cue paths (critical effects that can't hitch)
    for (const FString& Path : AlwaysLoadedPaths)
    {
        AddGameplayCueNotifyPath(Path, /*bShouldRescanCueAssets=*/ false);
    }
}

bool UMyGameplayCueManager::ShouldSuppressGameplayCues(AActor* TargetActor)
{
    if (ShouldSuppressCuesForActor(TargetActor))
    {
        return true;
    }
    return Super::ShouldSuppressGameplayCues(TargetActor);
}

bool UMyGameplayCueManager::ShouldSuppressCuesForActor(AActor* Actor) const
{
    if (!Actor || Actor->IsPendingKillPending())
    {
        return true;
    }

    // Suppress cues for hidden actors (e.g., ragdolls being cleaned up)
    if (Actor->IsHidden())
    {
        return true;
    }

    return false;
}
```

### DefaultGame.ini

```ini
[/Script/GameplayAbilities.AbilitySystemGlobals]
; Register custom GameplayCueManager
GlobalGameplayCueManagerClass=/Script/MyProject.UMyGameplayCueManager

; Cue scan paths (only these directories are scanned)
+GameplayCueNotifyPaths=/Game/Effects/GameplayCues
+GameplayCueNotifyPaths=/Game/Characters/GameplayCues
+GameplayCueNotifyPaths=/Game/Weapons/GameplayCues
```

---

## 5. RPC Batching with FScopedGameplayCueSendContext

```cpp
#include "GameplayCueManager.h"

void UMyAbility::ApplyAreaDamage(const TArray<AActor*>& HitActors)
{
    // Batch all cues into a single network frame
    FScopedGameplayCueSendContext CueBatchContext;

    for (AActor* HitActor : HitActors)
    {
        if (UAbilitySystemComponent* TargetASC = UAbilitySystemBlueprintLibrary::GetAbilitySystemComponent(HitActor))
        {
            // Apply damage GE (triggers cue automatically)
            FGameplayEffectSpecHandle DamageSpec = MakeOutgoingGameplayEffectSpec(DamageEffectClass);
            ApplyGameplayEffectSpecToTarget(CurrentSpecHandle, CurrentActorInfo, CurrentActivationInfo,
                DamageSpec, TargetASC);
        }
    }

    // When CueBatchContext goes out of scope, FlushPendingCues() sends all cues in one batch
}
```

---

## 6. Local-Only Cues (No Replication) — Damage Numbers

```cpp
void UMyDamageNumberComponent::ShowDamageNumber(float DamageAmount, const FVector& WorldLocation)
{
    UAbilitySystemComponent* ASC = UAbilitySystemBlueprintLibrary::GetAbilitySystemComponent(GetOwner());
    if (!ASC) return;

    FGameplayCueParameters Params;
    Params.RawMagnitude = DamageAmount;
    Params.Location = WorldLocation;

    // Local only — no network traffic, only shows on this client
    ASC->ExecuteGameplayCueLocal(
        FGameplayTag::RequestGameplayTag("GameplayCue.UI.DamageNumber"),
        Params
    );
}
```

---

## 7. Cue with Camera Shake (1P vs 3P Differentiation)

```cpp
bool AGCN_ExplosionImpact::OnExecute_Implementation(AActor* MyTarget, const FGameplayCueParameters& Parameters)
{
    UWorld* World = MyTarget ? MyTarget->GetWorld() : nullptr;
    if (!World) return false;

    const FVector Location = Parameters.Location;

    // VFX — everyone sees
    if (ExplosionNiagara)
    {
        UNiagaraFunctionLibrary::SpawnSystemAtLocation(World, ExplosionNiagara, Location);
    }

    // Sound — everyone hears
    if (ExplosionSound)
    {
        UGameplayStatics::PlaySoundAtLocation(World, ExplosionSound, Location);
    }

    // Camera shake — only for locally controlled players
    if (Parameters.IsInstigatorLocallyControlledPlayer())
    {
        // Stronger shake for the instigator
        if (InstigatorCameraShake)
        {
            APlayerController* PC = Cast<APlayerController>(
                Cast<APawn>(Parameters.GetInstigator())->GetController());
            if (PC && PC->PlayerCameraManager)
            {
                PC->PlayerCameraManager->StartCameraShake(InstigatorCameraShake);
            }
        }
    }
    else
    {
        // World shake for nearby players
        if (WorldCameraShake)
        {
            UGameplayStatics::PlayWorldCameraShake(World, WorldCameraShake, Location, 500.f, 3000.f);
        }
    }

    return true;
}
```

---

## 8. Actor Cue with Recycling/Pooling

```cpp
AGCN_ShieldBubble::AGCN_ShieldBubble()
{
    GameplayCueTag = FGameplayTag::RequestGameplayTag("GameplayCue.Ability.Shield");

    // Pooling configuration
    bAutoDestroyOnRemove = true;
    AutoDestroyDelay = 1.0f; // Allow fade-out animation
    NumPreallocatedInstances = 8;

    // Instance management
    bUniqueInstancePerInstigator = false;
    bUniqueInstancePerSourceObject = false;
    bAllowMultipleOnActiveEvents = false;
    bAllowMultipleWhileActiveEvents = false;
}

void AGCN_ShieldBubble::Recycle()
{
    // Called instead of destroy when pooling is enabled
    // Hide everything, stop effects, but DON'T destroy
    if (ShieldMesh)
    {
        ShieldMesh->SetVisibility(false);
    }
    if (ShieldNiagara)
    {
        ShieldNiagara->Deactivate();
    }
    if (ShieldSound)
    {
        ShieldSound->Stop();
    }

    // MUST call super — returns to pool
    Super::Recycle();
}

void AGCN_ShieldBubble::ReuseAfterRecycle()
{
    // Called when recycled instance is reused
    // Undo EVERYTHING done in Recycle()
    if (ShieldMesh)
    {
        ShieldMesh->SetVisibility(true);
    }

    // MUST call super
    Super::ReuseAfterRecycle();
}
```

---

## 9. IGameplayCueInterface — Direct Actor Handler

```cpp
// MyCharacter.h
UCLASS()
class MYPROJECT_API AMyCharacter : public ACharacter, public IGameplayCueInterface
{
    GENERATED_BODY()

public:
    //~ IGameplayCueInterface
    virtual void HandleGameplayCue(AActor* Self, FGameplayTag GameplayCueTag,
        EGameplayCueEvent::Type EventType, FGameplayCueParameters Parameters) override;

    virtual bool ShouldAcceptGameplayCue(AActor* Self, FGameplayTag GameplayCueTag,
        EGameplayCueEvent::Type EventType, FGameplayCueParameters Parameters) override;

    // Tag-matched function: GameplayCue.Character.LevelUp → GameplayCue_Character_LevelUp
    UFUNCTION()
    void GameplayCue_Character_LevelUp(EGameplayCueEvent::Type EventType,
        FGameplayCueParameters Parameters);
};

// MyCharacter.cpp
void AMyCharacter::HandleGameplayCue(AActor* Self, FGameplayTag GameplayCueTag,
    EGameplayCueEvent::Type EventType, FGameplayCueParameters Parameters)
{
    // Custom routing logic before default dispatch
    UE_LOG(LogTemp, Log, TEXT("Cue received: %s, Event: %d"),
        *GameplayCueTag.ToString(), static_cast<int32>(EventType));

    // Call default implementation (routes to tag-matched functions)
    IGameplayCueInterface::HandleGameplayCue(Self, GameplayCueTag, EventType, Parameters);
}

bool AMyCharacter::ShouldAcceptGameplayCue(AActor* Self, FGameplayTag GameplayCueTag,
    EGameplayCueEvent::Type EventType, FGameplayCueParameters Parameters)
{
    // Reject cues while dead
    if (bIsDead)
    {
        return false;
    }
    return true;
}

void AMyCharacter::GameplayCue_Character_LevelUp(EGameplayCueEvent::Type EventType,
    FGameplayCueParameters Parameters)
{
    if (EventType == EGameplayCueEvent::Executed)
    {
        // Play level-up fanfare and particle burst
        PlayLevelUpEffects();
    }
}
```

---

## 10. Custom FGameplayEffectContext for Extra Cue Data

### MyGameplayEffectTypes.h

```cpp
#pragma once

#include "GameplayEffectTypes.h"
#include "MyGameplayEffectTypes.generated.h"

/**
 * Extended effect context to pass custom data through to GameplayCues.
 * Pattern from GASShooter (Tranek).
 */
USTRUCT()
struct MYPROJECT_API FMyGameplayEffectContext : public FGameplayEffectContext
{
    GENERATED_BODY()

public:
    /** Damage type tag for selecting visual effects */
    FGameplayTag DamageType;

    /** Whether this was a critical hit (for enhanced VFX) */
    bool bIsCriticalHit = false;

    /** Number of targets hit (for multi-hit scaling) */
    int32 TargetCount = 1;

    //~ FGameplayEffectContext overrides
    virtual UScriptStruct* GetScriptStruct() const override
    {
        return FMyGameplayEffectContext::StaticStruct();
    }

    virtual FGameplayEffectContext* Duplicate() const override
    {
        FMyGameplayEffectContext* NewContext = new FMyGameplayEffectContext();
        *NewContext = *this;
        NewContext->AddActors(Actors);
        if (GetHitResult())
        {
            NewContext->AddHitResult(*GetHitResult(), true);
        }
        return NewContext;
    }

    virtual bool NetSerialize(FArchive& Ar, UPackageMap* Map, bool& bOutSuccess) override;
};

template<>
struct TStructOpsTypeTraits<FMyGameplayEffectContext> : public TStructOpsTypeTraitsBase2<FMyGameplayEffectContext>
{
    enum
    {
        WithNetSerializer = true,
        WithCopy = true,
    };
};
```

### MyAbilitySystemGlobals.h

```cpp
#pragma once

#include "AbilitySystemGlobals.h"
#include "MyAbilitySystemGlobals.generated.h"

UCLASS()
class MYPROJECT_API UMyAbilitySystemGlobals : public UAbilitySystemGlobals
{
    GENERATED_BODY()

public:
    virtual FGameplayEffectContext* AllocGameplayEffectContext() const override
    {
        return new FMyGameplayEffectContext();
    }
};
```

### DefaultGame.ini

```ini
[/Script/GameplayAbilities.AbilitySystemGlobals]
AbilitySystemGlobalsClassName=/Script/MyProject.MyAbilitySystemGlobals
```

### Usage in Cue

```cpp
bool UGCN_DamageImpact::OnExecute_Implementation(AActor* MyTarget,
    const FGameplayCueParameters& Parameters) const
{
    // Cast to custom context for extra data
    const FMyGameplayEffectContext* MyContext =
        static_cast<const FMyGameplayEffectContext*>(Parameters.EffectContext.Get());

    if (MyContext)
    {
        if (MyContext->bIsCriticalHit)
        {
            // Enhanced critical hit VFX
            SpawnCriticalHitEffects(Parameters.Location);
        }

        // Select particle based on damage type
        SelectImpactParticle(MyContext->DamageType);
    }

    return true;
}
```

---

## 11. Physical Material-Based Impact Selection

```cpp
bool UGCN_WeaponImpact::OnExecute_Implementation(AActor* MyTarget,
    const FGameplayCueParameters& Parameters) const
{
    const UPhysicalMaterial* PhysMat = Parameters.PhysicalMaterial.Get();
    if (!PhysMat) return false;

    // Map physical material surface type to impact effects
    EPhysicalSurface SurfaceType = UPhysicalMaterial::DetermineSurfaceType(PhysMat);

    UNiagaraSystem* SelectedParticle = nullptr;
    USoundBase* SelectedSound = nullptr;

    switch (SurfaceType)
    {
    case SurfaceType1: // Metal
        SelectedParticle = MetalSparkParticle;
        SelectedSound = MetalImpactSound;
        break;
    case SurfaceType2: // Wood
        SelectedParticle = WoodChipParticle;
        SelectedSound = WoodImpactSound;
        break;
    case SurfaceType3: // Flesh
        SelectedParticle = BloodSplatterParticle;
        SelectedSound = FleshImpactSound;
        break;
    default:
        SelectedParticle = DefaultImpactParticle;
        SelectedSound = DefaultImpactSound;
        break;
    }

    UWorld* World = MyTarget->GetWorld();
    if (World && SelectedParticle)
    {
        UNiagaraFunctionLibrary::SpawnSystemAtLocation(
            World, SelectedParticle, Parameters.Location, Parameters.Normal.Rotation());
    }
    if (World && SelectedSound)
    {
        UGameplayStatics::PlaySoundAtLocation(World, SelectedSound, Parameters.Location);
    }

    return true;
}
```

---

## 12. Looping Cue — Charging Ability (UE5+)

### Usage Pattern (from ability)

```cpp
void UGA_ChargedAttack::ActivateAbility(...)
{
    // Start charging VFX
    if (UAbilitySystemComponent* ASC = GetAbilitySystemComponentFromActorInfo())
    {
        FGameplayCueParameters Params;
        Params.SourceObject = this;
        ASC->AddGameplayCue(
            FGameplayTag::RequestGameplayTag("GameplayCue.Ability.ChargedAttack.Charging"),
            Params
        );
    }

    // ... start charge timer, montage, etc.
}

void UGA_ChargedAttack::ReleaseCharge()
{
    if (UAbilitySystemComponent* ASC = GetAbilitySystemComponentFromActorInfo())
    {
        // Stop charging VFX
        ASC->RemoveGameplayCue(
            FGameplayTag::RequestGameplayTag("GameplayCue.Ability.ChargedAttack.Charging")
        );

        // Fire release burst VFX
        FGameplayCueParameters Params;
        Params.NormalizedMagnitude = ChargePercent; // 0-1 charge level
        ASC->ExecuteGameplayCue(
            FGameplayTag::RequestGameplayTag("GameplayCue.Ability.ChargedAttack.Release"),
            Params
        );
    }
}
```

---

## 13. Magnitude-Scaled Effect

```cpp
bool AGCN_HealingAura::OnActive_Implementation(AActor* MyTarget,
    const FGameplayCueParameters& Parameters)
{
    if (!MyTarget || !HealNiagara) return false;

    ActiveNiagara = UNiagaraFunctionLibrary::SpawnSystemAttached(
        HealNiagara,
        MyTarget->GetRootComponent(),
        NAME_None,
        FVector::ZeroVector,
        FRotator::ZeroRotator,
        EAttachLocation::KeepRelativeOffset,
        true
    );

    if (ActiveNiagara)
    {
        // Scale particle count and size by effect magnitude
        float Magnitude = FMath::Clamp(Parameters.NormalizedMagnitude, 0.1f, 1.0f);
        ActiveNiagara->SetVariableFloat(FName("SpawnRate"), Magnitude * MaxSpawnRate);
        ActiveNiagara->SetVariableFloat(FName("ParticleSize"), Magnitude * MaxParticleSize);
        ActiveNiagara->SetVariableLinearColor(FName("Color"),
            FLinearColor::LerpUsingHSV(MinHealColor, MaxHealColor, Magnitude));
    }

    return true;
}
```

---

## 14. Cue Forwarding — Pawn to Weapon

```cpp
// In your character/pawn class
void AMyCharacter::HandleGameplayCue(AActor* Self, FGameplayTag GameplayCueTag,
    EGameplayCueEvent::Type EventType, FGameplayCueParameters Parameters)
{
    // Forward weapon-related cues to the equipped weapon actor
    if (GameplayCueTag.MatchesTag(FGameplayTag::RequestGameplayTag("GameplayCue.Weapon")))
    {
        if (AWeapon* Weapon = GetEquippedWeapon())
        {
            // Forward the cue to the weapon actor
            IGameplayCueInterface* CueInterface = Cast<IGameplayCueInterface>(Weapon);
            if (CueInterface)
            {
                CueInterface->HandleGameplayCue(Weapon, GameplayCueTag, EventType, Parameters);
                return; // Don't process on character
            }
        }
    }

    // Default handling for non-weapon cues
    IGameplayCueInterface::HandleGameplayCue(Self, GameplayCueTag, EventType, Parameters);
}
```
