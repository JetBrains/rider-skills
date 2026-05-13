# Advanced Gameplay Cue Patterns — Production-Grade Architecture

Patterns extracted from production UE5 projects for scalable, modular Gameplay Cue systems.

---

## 1. Production GameplayCueManager — On-Demand Loading with Reference Tracking

This is the recommended pattern for shipping games. Instead of preloading ALL cue classes at startup (slow, memory-heavy), this manager:
- Tracks which cues are referenced by loaded content
- Async loads cue classes as their tags are registered
- Maintains a dual tracking system: always-loaded (code) vs content-preloaded (data)
- Cleans up stale references on map transitions and GC

### ProductionGameplayCueManager.h

```cpp
#pragma once

#include "GameplayCueManager.h"
#include "ProductionGameplayCueManager.generated.h"

/**
 * Production-grade GameplayCueManager with on-demand async loading.
 * Skips preloading at startup — cue classes load as their tags are registered.
 * Dual tracking: AlwaysLoadedCues (code-critical) vs PreloadedCues (content-referenced).
 *
 * DefaultGame.ini:
 * [/Script/GameplayAbilities.AbilitySystemGlobals]
 * GlobalGameplayCueManagerClass=/Script/MyProject.UProductionGameplayCueManager
 */
UCLASS()
class MYPROJECT_API UProductionGameplayCueManager : public UGameplayCueManager
{
    GENERATED_BODY()

public:
    UProductionGameplayCueManager(const FObjectInitializer& ObjectInitializer = FObjectInitializer::Get());

    static UProductionGameplayCueManager* Get();

    //~ UGameplayCueManager interface
    virtual void OnCreated() override;
    virtual bool ShouldAsyncLoadRuntimeObjectLibraries() const override;
    virtual bool ShouldSyncLoadMissingGameplayCues() const override;
    virtual bool ShouldAsyncLoadMissingGameplayCues() const override;
    //~ End of UGameplayCueManager interface

    /** Called by AssetManager during startup to preload always-loaded cues */
    void LoadAlwaysLoadedCues();

    /** Updates the primary asset bundles for cue references (cook-time dependency tracking) */
    void RefreshGameplayCuePrimaryAsset();

    /** Debug: dump all loaded cues to log */
    static void DumpGameplayCues(const TArray<FString>& Args);

private:
    /** Called when a gameplay tag is loaded from content — triggers async preload */
    void OnGameplayTagLoaded(const FGameplayTag& Tag);

    /** Deferred processing after GC completes (can't call StaticFindObject during GC) */
    void HandlePostGarbageCollect();

    /** Process queued tag loads on game thread */
    void ProcessLoadedTags();

    /** Resolve a tag to its cue class and begin loading if needed */
    void ProcessTagToPreload(const FGameplayTag& Tag, UObject* OwningObject);

    /** Callback when async load completes */
    void OnPreloadCueComplete(FSoftObjectPath Path, TWeakObjectPtr<UObject> OwningObject, bool bAlwaysLoadedCue);

    /** Register a loaded cue class into the appropriate tracking set */
    void RegisterPreloadedCue(UClass* LoadedGameplayCueClass, UObject* OwningObject);

    /** Clean up stale references on map load */
    void HandlePostLoadMap(UWorld* NewWorld);

    /** Wire up or tear down delegate listeners based on load mode */
    void UpdateDelayLoadDelegateListeners();

    /** Whether cue loading should be deferred (true for clients, false for dedicated server) */
    bool ShouldDelayLoadGameplayCues() const;

private:
    /** Thread-safe queue for tags to process */
    struct FLoadedGameplayTagProcessData
    {
        FGameplayTag Tag;
        TWeakObjectPtr<UObject> WeakOwner;
    };

    /** Cue classes preloaded due to content references — cleaned up on map transition */
    UPROPERTY(Transient)
    TSet<TObjectPtr<UClass>> PreloadedCues;

    /** Maps preloaded cue class → set of referencing objects (for cleanup tracking) */
    TMap<FObjectKey, TSet<FObjectKey>> PreloadedCueReferencers;

    /** Cue classes that are always loaded (code-critical, no cleanup) */
    UPROPERTY(Transient)
    TSet<TObjectPtr<UClass>> AlwaysLoadedCues;

    /** Thread-safe queue of tags pending game-thread processing */
    TArray<FLoadedGameplayTagProcessData> LoadedGameplayTagsToProcess;
    FCriticalSection LoadedGameplayTagsToProcessCS;

    /** Flag to defer processing when tags load during GC */
    bool bProcessLoadedTagsAfterGC = false;
};
```

### ProductionGameplayCueManager.cpp

```cpp
#include "ProductionGameplayCueManager.h"
#include "Engine/AssetManager.h"
#include "GameplayCueSet.h"
#include "AbilitySystemGlobals.h"
#include "GameplayTagsManager.h"
#include "UObject/UObjectThreadContext.h"
#include "Async/Async.h"

//////////////////////////////////////////////////////////////////////
// Thread synchronization helper — ensures tag processing runs on game thread

struct FGameplayCueTagThreadSyncTask : public FAsyncGraphTaskBase
{
    TFunction<void()> TheTask;
    FGameplayCueTagThreadSyncTask(TFunction<void()>&& Task) : TheTask(MoveTemp(Task)) {}
    void DoTask(ENamedThreads::Type CurrentThread, const FGraphEventRef& MyCompletionGraphEvent) { TheTask(); }
    ENamedThreads::Type GetDesiredThread() { return ENamedThreads::GameThread; }
};

//////////////////////////////////////////////////////////////////////

UProductionGameplayCueManager::UProductionGameplayCueManager(const FObjectInitializer& ObjectInitializer)
    : Super(ObjectInitializer)
{
}

UProductionGameplayCueManager* UProductionGameplayCueManager::Get()
{
    return Cast<UProductionGameplayCueManager>(UAbilitySystemGlobals::Get().GetGameplayCueManager());
}

void UProductionGameplayCueManager::OnCreated()
{
    Super::OnCreated();
    UpdateDelayLoadDelegateListeners();
}

bool UProductionGameplayCueManager::ShouldAsyncLoadRuntimeObjectLibraries() const
{
    // Skip preloading if delay-loading is active (clients in packaged game)
    return !ShouldDelayLoadGameplayCues();
}

bool UProductionGameplayCueManager::ShouldSyncLoadMissingGameplayCues() const
{
    // Never block on missing cues — async load instead
    return false;
}

bool UProductionGameplayCueManager::ShouldAsyncLoadMissingGameplayCues() const
{
    // If a cue is triggered but not loaded, async load it and execute when ready
    return true;
}

bool UProductionGameplayCueManager::ShouldDelayLoadGameplayCues() const
{
    // Clients delay-load; dedicated servers load upfront (they don't play cues anyway)
    const bool bClientDelayLoad = true;
    return !IsRunningDedicatedServer() && bClientDelayLoad;
}

void UProductionGameplayCueManager::LoadAlwaysLoadedCues()
{
    if (!ShouldDelayLoadGameplayCues()) return;

    UGameplayTagsManager& TagManager = UGameplayTagsManager::Get();

    // Add critical cue tags that must never hitch (e.g., death, respawn)
    TArray<FName> CriticalCueTags;
    // CriticalCueTags.Add(TEXT("GameplayCue.Character.Death"));
    // CriticalCueTags.Add(TEXT("GameplayCue.Character.Spawn"));

    for (const FName& CueTagName : CriticalCueTags)
    {
        FGameplayTag CueTag = TagManager.RequestGameplayTag(CueTagName, /*ErrorIfNotFound=*/ false);
        if (CueTag.IsValid())
        {
            ProcessTagToPreload(CueTag, nullptr); // nullptr owner = always-loaded
        }
    }
}

//////////////////////////////////////////////////////////////////////
// Tag-driven preloading

void UProductionGameplayCueManager::OnGameplayTagLoaded(const FGameplayTag& Tag)
{
    // Called from loading thread — must be thread-safe
    FScopeLock ScopeLock(&LoadedGameplayTagsToProcessCS);

    bool bStartTask = LoadedGameplayTagsToProcess.Num() == 0;

    // Capture the object being serialized (the content referencing this tag)
    FUObjectSerializeContext* LoadContext = FUObjectThreadContext::Get().GetSerializeContext();
    UObject* OwningObject = LoadContext ? LoadContext->SerializedObject : nullptr;

    LoadedGameplayTagsToProcess.Add({Tag, OwningObject});

    if (bStartTask)
    {
        // Dispatch processing to game thread
        TGraphTask<FGameplayCueTagThreadSyncTask>::CreateTask().ConstructAndDispatchWhenReady([]()
        {
            if (GIsRunning)
            {
                if (UProductionGameplayCueManager* GCM = Get())
                {
                    if (IsGarbageCollecting())
                    {
                        GCM->bProcessLoadedTagsAfterGC = true;
                    }
                    else
                    {
                        GCM->ProcessLoadedTags();
                    }
                }
            }
        });
    }
}

void UProductionGameplayCueManager::HandlePostGarbageCollect()
{
    if (bProcessLoadedTagsAfterGC)
    {
        ProcessLoadedTags();
    }
    bProcessLoadedTagsAfterGC = false;
}

void UProductionGameplayCueManager::ProcessLoadedTags()
{
    TArray<FLoadedGameplayTagProcessData> TagsToProcess;
    {
        FScopeLock ScopeLock(&LoadedGameplayTagsToProcessCS);
        TagsToProcess = MoveTemp(LoadedGameplayTagsToProcess);
        LoadedGameplayTagsToProcess.Empty();
    }

    if (!GIsRunning || !RuntimeGameplayCueObjectLibrary.CueSet) return;

    for (const FLoadedGameplayTagProcessData& Data : TagsToProcess)
    {
        if (RuntimeGameplayCueObjectLibrary.CueSet->GameplayCueDataMap.Contains(Data.Tag))
        {
            if (!Data.WeakOwner.IsStale())
            {
                ProcessTagToPreload(Data.Tag, Data.WeakOwner.Get());
            }
        }
    }
}

void UProductionGameplayCueManager::ProcessTagToPreload(const FGameplayTag& Tag, UObject* OwningObject)
{
    check(RuntimeGameplayCueObjectLibrary.CueSet);

    int32* DataIdx = RuntimeGameplayCueObjectLibrary.CueSet->GameplayCueDataMap.Find(Tag);
    if (!DataIdx || !RuntimeGameplayCueObjectLibrary.CueSet->GameplayCueData.IsValidIndex(*DataIdx))
    {
        return;
    }

    const FGameplayCueNotifyData& CueData = RuntimeGameplayCueObjectLibrary.CueSet->GameplayCueData[*DataIdx];

    // Check if class is already in memory
    UClass* LoadedClass = FindObject<UClass>(nullptr, *CueData.GameplayCueNotifyObj.ToString());
    if (LoadedClass)
    {
        RegisterPreloadedCue(LoadedClass, OwningObject);
    }
    else
    {
        // Async load the cue class
        bool bAlwaysLoaded = (OwningObject == nullptr);
        TWeakObjectPtr<UObject> WeakOwner = OwningObject;

        StreamableManager.RequestAsyncLoad(
            CueData.GameplayCueNotifyObj,
            FStreamableDelegate::CreateUObject(this, &ThisClass::OnPreloadCueComplete,
                CueData.GameplayCueNotifyObj, WeakOwner, bAlwaysLoaded),
            FStreamableManager::DefaultAsyncLoadPriority,
            false, false, TEXT("GameplayCueManager")
        );
    }
}

void UProductionGameplayCueManager::OnPreloadCueComplete(
    FSoftObjectPath Path, TWeakObjectPtr<UObject> OwningObject, bool bAlwaysLoadedCue)
{
    if (bAlwaysLoadedCue || OwningObject.IsValid())
    {
        if (UClass* LoadedClass = Cast<UClass>(Path.ResolveObject()))
        {
            RegisterPreloadedCue(LoadedClass, OwningObject.Get());
        }
    }
}

void UProductionGameplayCueManager::RegisterPreloadedCue(UClass* LoadedClass, UObject* OwningObject)
{
    check(LoadedClass);

    const bool bAlwaysLoaded = (OwningObject == nullptr);

    if (bAlwaysLoaded)
    {
        // Always-loaded: promote from preloaded set, clear referencers
        AlwaysLoadedCues.Add(LoadedClass);
        PreloadedCues.Remove(LoadedClass);
        PreloadedCueReferencers.Remove(LoadedClass);
    }
    else if (OwningObject != LoadedClass
        && OwningObject != LoadedClass->GetDefaultObject()
        && !AlwaysLoadedCues.Contains(LoadedClass))
    {
        // Content-preloaded: track with referencer
        PreloadedCues.Add(LoadedClass);
        TSet<FObjectKey>& Referencers = PreloadedCueReferencers.FindOrAdd(LoadedClass);
        Referencers.Add(OwningObject);
    }
}

//////////////////////////////////////////////////////////////////////
// Cleanup

void UProductionGameplayCueManager::HandlePostLoadMap(UWorld* NewWorld)
{
    // Prevent always-loaded and preloaded cues from being unloaded by the cue set
    if (RuntimeGameplayCueObjectLibrary.CueSet)
    {
        for (UClass* CueClass : AlwaysLoadedCues)
        {
            RuntimeGameplayCueObjectLibrary.CueSet->RemoveLoadedClass(CueClass);
        }
        for (UClass* CueClass : PreloadedCues)
        {
            RuntimeGameplayCueObjectLibrary.CueSet->RemoveLoadedClass(CueClass);
        }
    }

    // Clean up stale references (owners that were garbage collected)
    for (auto CueIt = PreloadedCues.CreateIterator(); CueIt; ++CueIt)
    {
        TSet<FObjectKey>& Referencers = PreloadedCueReferencers.FindChecked(*CueIt);
        for (auto RefIt = Referencers.CreateIterator(); RefIt; ++RefIt)
        {
            if (!RefIt->ResolveObjectPtr())
            {
                RefIt.RemoveCurrent();
            }
        }
        if (Referencers.Num() == 0)
        {
            PreloadedCueReferencers.Remove(*CueIt);
            CueIt.RemoveCurrent();
        }
    }
}

void UProductionGameplayCueManager::UpdateDelayLoadDelegateListeners()
{
    // Clean existing bindings
    UGameplayTagsManager::Get().OnGameplayTagLoadedDelegate.RemoveAll(this);
    FCoreUObjectDelegates::GetPostGarbageCollect().RemoveAll(this);
    FCoreUObjectDelegates::PostLoadMapWithWorld.RemoveAll(this);

    if (!ShouldDelayLoadGameplayCues()) return;

    // Listen for gameplay tags being loaded (drives preloading)
    UGameplayTagsManager::Get().OnGameplayTagLoadedDelegate.AddUObject(
        this, &ThisClass::OnGameplayTagLoaded);

    // Deferred processing after GC
    FCoreUObjectDelegates::GetPostGarbageCollect().AddUObject(
        this, &ThisClass::HandlePostGarbageCollect);

    // Cleanup on map transition
    FCoreUObjectDelegates::PostLoadMapWithWorld.AddUObject(
        this, &ThisClass::HandlePostLoadMap);
}

//////////////////////////////////////////////////////////////////////
// Debug

void UProductionGameplayCueManager::DumpGameplayCues(const TArray<FString>& Args)
{
    UProductionGameplayCueManager* GCM = Get();
    if (!GCM) return;

    const bool bIncludeRefs = Args.Contains(TEXT("Refs"));

    UE_LOG(LogTemp, Log, TEXT("===== Always Loaded Cues ====="));
    for (UClass* CueClass : GCM->AlwaysLoadedCues)
    {
        UE_LOG(LogTemp, Log, TEXT("  %s"), *GetPathNameSafe(CueClass));
    }

    UE_LOG(LogTemp, Log, TEXT("===== Preloaded Cues ====="));
    for (UClass* CueClass : GCM->PreloadedCues)
    {
        TSet<FObjectKey>* Refs = GCM->PreloadedCueReferencers.Find(CueClass);
        UE_LOG(LogTemp, Log, TEXT("  %s (%d refs)"), *GetPathNameSafe(CueClass),
            Refs ? Refs->Num() : 0);
    }

    UE_LOG(LogTemp, Log, TEXT("===== Summary ====="));
    UE_LOG(LogTemp, Log, TEXT("  Always loaded: %d"), GCM->AlwaysLoadedCues.Num());
    UE_LOG(LogTemp, Log, TEXT("  Preloaded: %d"), GCM->PreloadedCues.Num());
}
```

---

## 2. GameFeature Plugin Cue Path Registration

For modular projects using GameFeature plugins, each plugin needs to register its cue directories with the GameplayCueManager. INI-based `+GameplayCueNotifyPaths` does NOT work reliably for plugin content.

### GameFeatureAction_AddGameplayCuePath.h

```cpp
#pragma once

#include "GameFeatureAction.h"
#include "GameFeatureAction_AddGameplayCuePath.generated.h"

/**
 * GameFeatureAction that registers cue directories with the GameplayCueManager.
 * Add to your GameFeature Data Asset's Actions array.
 * Paths are relative to the plugin's content directory.
 */
UCLASS(MinimalAPI, meta = (DisplayName = "Add Gameplay Cue Path"))
class UGameFeatureAction_AddGameplayCuePath final : public UGameFeatureAction
{
    GENERATED_BODY()

public:
    UGameFeatureAction_AddGameplayCuePath();

#if WITH_EDITOR
    virtual EDataValidationResult IsDataValid(class FDataValidationContext& Context) const override;
#endif

    const TArray<FDirectoryPath>& GetDirectoryPathsToAdd() const { return DirectoryPathsToAdd; }

private:
    /** Directories to register (relative to game content dir). Default: /GameplayCues */
    UPROPERTY(EditAnywhere, Category = "Gameplay Cues",
        meta = (RelativeToGameContentDir, LongPackageName))
    TArray<FDirectoryPath> DirectoryPathsToAdd;
};
```

### GameFeatureAction_AddGameplayCuePath.cpp

```cpp
#include "GameFeatureAction_AddGameplayCuePath.h"
#if WITH_EDITOR
#include "Misc/DataValidation.h"
#endif

UGameFeatureAction_AddGameplayCuePath::UGameFeatureAction_AddGameplayCuePath()
{
    // Default path convention
    DirectoryPathsToAdd.Add(FDirectoryPath{TEXT("/GameplayCues")});
}

#if WITH_EDITOR
EDataValidationResult UGameFeatureAction_AddGameplayCuePath::IsDataValid(
    FDataValidationContext& Context) const
{
    EDataValidationResult Result = Super::IsDataValid(Context);
    for (const FDirectoryPath& Dir : DirectoryPathsToAdd)
    {
        if (Dir.Path.IsEmpty())
        {
            Context.AddError(FText::Format(
                NSLOCTEXT("GameFeatures", "InvalidCuePath", "'{0}' is not a valid path!"),
                FText::FromString(Dir.Path)));
            Result = CombineDataValidationResults(Result, EDataValidationResult::Invalid);
        }
    }
    return CombineDataValidationResults(Result, EDataValidationResult::Valid);
}
#endif
```

### Observer — Registers Cue Paths When Plugin Loads

```cpp
// In your GameFeaturePolicy class:

UCLASS()
class UGameFeatureObserver_AddGameplayCuePaths : public UObject, public IGameFeatureStateChangeObserver
{
    GENERATED_BODY()

public:
    virtual void OnGameFeatureRegistering(const UGameFeatureData* GameFeatureData,
        const FString& PluginName, const FString& PluginURL) override
    {
        const FString PluginRootPath = TEXT("/") + PluginName;

        for (const UGameFeatureAction* Action : GameFeatureData->GetActions())
        {
            if (const auto* AddCueAction = Cast<UGameFeatureAction_AddGameplayCuePath>(Action))
            {
                if (UProductionGameplayCueManager* GCM = UProductionGameplayCueManager::Get())
                {
                    UGameplayCueSet* CueSet = GCM->GetRuntimeCueSet();
                    const int32 PreCount = CueSet ? CueSet->GameplayCueData.Num() : 0;

                    for (const FDirectoryPath& Dir : AddCueAction->GetDirectoryPathsToAdd())
                    {
                        FString ResolvedPath = Dir.Path;
                        UGameFeaturesSubsystem::FixPluginPackagePath(ResolvedPath,
                            PluginRootPath, false);
                        GCM->AddGameplayCueNotifyPath(ResolvedPath,
                            /*bShouldRescanCueAssets=*/ false);
                    }

                    // Rebuild runtime library with new paths
                    if (!AddCueAction->GetDirectoryPathsToAdd().IsEmpty())
                    {
                        GCM->InitializeRuntimeObjectLibrary();
                    }

                    // Update primary asset bundles if new cues were found
                    const int32 PostCount = CueSet ? CueSet->GameplayCueData.Num() : 0;
                    if (PreCount != PostCount)
                    {
                        GCM->RefreshGameplayCuePrimaryAsset();
                    }
                }
            }
        }
    }

    virtual void OnGameFeatureUnregistering(const UGameFeatureData* GameFeatureData,
        const FString& PluginName, const FString& PluginURL) override
    {
        const FString PluginRootPath = TEXT("/") + PluginName;

        for (const UGameFeatureAction* Action : GameFeatureData->GetActions())
        {
            if (const auto* AddCueAction = Cast<UGameFeatureAction_AddGameplayCuePath>(Action))
            {
                if (UGameplayCueManager* GCM = UAbilitySystemGlobals::Get().GetGameplayCueManager())
                {
                    int32 NumRemoved = 0;
                    for (const FDirectoryPath& Dir : AddCueAction->GetDirectoryPathsToAdd())
                    {
                        FString ResolvedPath = Dir.Path;
                        UGameFeaturesSubsystem::FixPluginPackagePath(ResolvedPath,
                            PluginRootPath, false);
                        NumRemoved += GCM->RemoveGameplayCueNotifyPath(ResolvedPath,
                            /*bShouldRescanCueAssets=*/ false);
                    }

                    if (NumRemoved > 0)
                    {
                        GCM->InitializeRuntimeObjectLibrary();
                    }
                }
            }
        }
    }
};
```

---

## 3. Custom EffectContext with Cartridge Grouping

Groups multiple projectiles (shotgun pellets, burst fire) under a single cartridge ID so impact cues can correlate hits.

### ProjectGameplayEffectContext.h

```cpp
#pragma once

#include "GameplayEffectTypes.h"
#include "ProjectGameplayEffectContext.generated.h"

class IAbilitySourceInterface;

/**
 * Extended effect context carrying projectile grouping and ability source data.
 * CartridgeID groups multiple projectiles from a single fire event (shotgun, burst).
 */
USTRUCT()
struct MYPROJECT_API FProjectGameplayEffectContext : public FGameplayEffectContext
{
    GENERATED_BODY()

public:
    FProjectGameplayEffectContext() : FGameplayEffectContext() {}

    FProjectGameplayEffectContext(AActor* InInstigator, AActor* InEffectCauser)
        : FGameplayEffectContext(InInstigator, InEffectCauser) {}

    /** Extract typed context from handle (nullptr if wrong type) */
    static FProjectGameplayEffectContext* ExtractEffectContext(FGameplayEffectContextHandle Handle);

    /** Set the ability source interface for weapon spread, range, etc. */
    void SetAbilitySource(const IAbilitySourceInterface* InObject, float InSourceLevel);

    /** Get ability source (authority only — not replicated) */
    const IAbilitySourceInterface* GetAbilitySource() const;

    /** Get physical material from hit result */
    const UPhysicalMaterial* GetPhysicalMaterial() const;

    //~ FGameplayEffectContext overrides
    virtual FGameplayEffectContext* Duplicate() const override
    {
        FProjectGameplayEffectContext* NewContext = new FProjectGameplayEffectContext();
        *NewContext = *this;
        if (GetHitResult())
        {
            NewContext->AddHitResult(*GetHitResult(), true); // Deep copy
        }
        return NewContext;
    }

    virtual UScriptStruct* GetScriptStruct() const override
    {
        return FProjectGameplayEffectContext::StaticStruct();
    }

    virtual bool NetSerialize(FArchive& Ar, UPackageMap* Map, bool& bOutSuccess) override;

public:
    /**
     * Groups projectiles from the same fire event.
     * Shotgun: all pellets share same CartridgeID.
     * Impact cue can check if it already played for this cartridge.
     */
    UPROPERTY()
    int32 CartridgeID = -1;

protected:
    /** Ability source (weapon stats, spread). NOT replicated — authority only. */
    UPROPERTY()
    TWeakObjectPtr<const UObject> AbilitySourceObject;
};

template<>
struct TStructOpsTypeTraits<FProjectGameplayEffectContext>
    : public TStructOpsTypeTraitsBase2<FProjectGameplayEffectContext>
{
    enum
    {
        WithNetSerializer = true,
        WithCopy = true
    };
};
```

### Usage in Weapon Code

```cpp
void AMyWeapon::FireShotgun(int32 PelletCount)
{
    const int32 CartridgeID = FMath::Rand(); // Same ID for all pellets

    for (int32 i = 0; i < PelletCount; ++i)
    {
        FGameplayEffectContextHandle ContextHandle = ASC->MakeEffectContext();
        FProjectGameplayEffectContext* Context =
            static_cast<FProjectGameplayEffectContext*>(ContextHandle.Get());
        Context->CartridgeID = CartridgeID;
        Context->AddHitResult(PelletHitResults[i]);

        FGameplayEffectSpecHandle DamageSpec = ASC->MakeOutgoingSpec(
            DamageEffect, 1, ContextHandle);
        ASC->ApplyGameplayEffectSpecToTarget(*DamageSpec.Data, TargetASC);
    }
}
```

### Usage in Impact Cue

```cpp
bool UGCN_WeaponImpact::OnExecute_Implementation(AActor* MyTarget,
    const FGameplayCueParameters& Parameters) const
{
    // Deduplicate impact effects per cartridge (shotgun pellets)
    const FProjectGameplayEffectContext* Context =
        static_cast<const FProjectGameplayEffectContext*>(Parameters.EffectContext.Get());

    if (Context && Context->CartridgeID >= 0)
    {
        // Only play full impact for first pellet of this cartridge
        // Subsequent pellets get reduced effects
        // (Track CartridgeIDs in a TSet on the target component)
    }

    return true;
}
```

---

## 4. Asset Organization — Directory Convention

### Recommended Directory Structure

```
Content/
├── GameplayCueNotifies/          ← Main project cues (registered via DefaultGame.ini)
│   ├── GCN_Character_Heal.uasset
│   ├── GCN_Character_Death.uasset
│   ├── GCNL_Character_DamageTaken.uasset
│   └── GCNL_Widget_Base.uasset
│
├── Plugins/
│   └── ShooterCore/              ← GameFeature plugin
│       └── Content/
│           ├── GameplayCues/     ← Plugin cues (registered via GameFeatureAction)
│           │   ├── GCN_Weapon_Melee.uasset
│           │   ├── GCNL_Dash.uasset
│           │   └── GCNL_Death.uasset
│           └── Weapons/
│               ├── Pistol/
│               │   └── GCN_Weapon_Pistol_Fire.uasset   ← Co-located with weapon
│               ├── Rifle/
│               │   └── GCN_Weapon_Rifle_Fire.uasset
│               └── Shotgun/
│                   └── GCN_Weapon_Shotgun_Fire.uasset
```

### Naming Conventions

| Prefix | Type | Example |
|--------|------|---------|
| `GCN_` | Burst / Static (instant) | `GCN_Weapon_Rifle_Fire` |
| `GCNL_` | Looping / Actor (persistent) | `GCNL_Character_DamageTaken` |
| `W_` | Widget-based cues | `W_MatchDecided_Message` |
| `I_` | Cue interfaces | `I_GameplayCueWidget` |

Pattern: `GCN[L]_[Category]_[Subcategory]_[Effect]`

---

## 5. Tag Taxonomy — Recommended Hierarchy

```
GameplayCue.
├── Character.
│   ├── DamageTaken
│   ├── Dash
│   ├── Dash.Cooldown
│   ├── Death
│   ├── Heal
│   ├── Melee.Cooldown
│   └── Spawn
│
├── Weapon.
│   ├── Pistol.Fire
│   ├── Rifle.Fire
│   ├── Rifle.Impact
│   ├── Shotgun.Fire
│   ├── Melee.Hit
│   ├── Melee.Impact
│   └── Grenade.Detonate
│
├── World.
│   ├── Launcher.Activate
│   ├── Teleporter.Activate
│   └── Pickup.Acquired
│
├── Status.
│   ├── Burning
│   ├── Frozen
│   └── SpeedBoost
│
├── UI.
│   ├── DamageNumber
│   ├── HitMarker
│   └── MatchDecided
│
└── Ability.
    ├── Fireball.Impact
    ├── Shield.Activate
    └── ChargedAttack.Charging
```

Categories:
- **Character.** — player state changes (damage, death, healing, movement)
- **Weapon.** — weapon-specific fire and impact effects
- **World.** — environmental interactables
- **Status.** — buff/debuff visual indicators
- **UI.** — local-only UI feedback (damage numbers, messages)
- **Ability.** — ability-specific visual feedback

---

## 6. Asset Manager Integration

Register cue references as a primary asset for cook-time dependency tracking. Ensures all referenced cue classes are included in the correct chunk.

```cpp
// In your GameplayCueManager:

static const FPrimaryAssetType GameplayCueRefsType = TEXT("GameplayCueRefs");
static const FName GameplayCueRefsName = TEXT("GameplayCueReferences");
static const FName LoadStateClient = FName(TEXT("Client"));

void UProductionGameplayCueManager::RefreshGameplayCuePrimaryAsset()
{
    TArray<FSoftObjectPath> CuePaths;
    if (UGameplayCueSet* CueSet = GetRuntimeCueSet())
    {
        CueSet->GetSoftObjectPaths(CuePaths);
    }

    FAssetBundleData BundleData;
    BundleData.AddBundleAssetsTruncated(LoadStateClient, CuePaths);

    FPrimaryAssetId PrimaryAssetId(GameplayCueRefsType, GameplayCueRefsName);
    UAssetManager::Get().AddDynamicAsset(PrimaryAssetId, FSoftObjectPath(), BundleData);
}
```

This ensures the Asset Manager includes all cue classes in client builds, even if they're only referenced dynamically via tags.
