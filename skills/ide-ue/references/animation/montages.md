# Montage System

## Overview

Animation Montages are composite animation assets that allow you to combine multiple AnimSequences into sections, control playback order with branching logic, trigger notifications at precise times, and play animations on specific body slots. Montages are the primary tool for ability-driven, event-driven, and gameplay-triggered animations.

---

## Montage Structure

### Sections
- A montage is divided into **sections** -- named segments that correspond to ranges of time.
- Default section: every montage starts with a "Default" section at time 0.
- Sections can be linked to control playback order: Default -> Loop -> End, or Default -> Attack1 -> Attack2.
- Sections can branch: call `Montage_JumpToSection` to skip to a specific section at runtime.
- Unlinked sections stop playback at their end. Linked sections auto-advance to the next linked section.

### Slots
- Each montage plays on a **Slot** (a named channel in the AnimBP's Anim Graph).
- The AnimBP must have a **Slot** node with a matching name (e.g., `DefaultGroup.DefaultSlot`, `DefaultGroup.UpperBody`).
- If the slot names don't match, the montage plays internally but produces no visible result.
- Multiple slots can be active simultaneously for layered playback (e.g., upper body attack + lower body locomotion).

### Tracks
- **Anim Segment Track**: Holds the AnimSequence references and their start/end times within the montage.
- **Notify Track**: Holds AnimNotify and AnimNotifyState events (see Notifications below).
- **Curve Track**: Exposes float curves that can drive blend weights or gameplay parameters.
- **Sync Marker Track**: Sync markers for synchronized montage playback.

---

## Playing from C++

### Basic Playback
```cpp
// Get the AnimInstance
UAnimInstance* AnimInstance = Mesh->GetAnimInstance();

// Play a montage
float Duration = AnimInstance->Montage_Play(AttackMontage, PlayRate);

// Jump to a section
AnimInstance->Montage_JumpToSection(FName("Combo2"), AttackMontage);

// Stop a montage with blend out
AnimInstance->Montage_Stop(0.25f, AttackMontage);
```

### With Delegates (Callbacks)
```cpp
FOnMontageEnded EndDelegate;
EndDelegate.BindUObject(this, &AMyCharacter::OnMontageEnded);
AnimInstance->Montage_SetEndDelegate(EndDelegate, AttackMontage);

FOnMontageBlendingOutStarted BlendOutDelegate;
BlendOutDelegate.BindUObject(this, &AMyCharacter::OnMontageBlendingOut);
AnimInstance->Montage_SetBlendingOutDelegate(BlendOutDelegate, AttackMontage);
```

### UAbilitySystemComponent Integration (GAS)
```cpp
// In a GameplayAbility:
UAbilityTask_PlayMontageAndWait* Task =
    UAbilityTask_PlayMontageAndWait::CreatePlayMontageAndWaitProxy(
        this, NAME_None, MontageToPlay, PlayRate, StartSection);
Task->OnCompleted.AddDynamic(this, &UMyAbility::OnMontageCompleted);
Task->OnBlendOut.AddDynamic(this, &UMyAbility::OnMontageBlendOut);
Task->OnCancelled.AddDynamic(this, &UMyAbility::OnMontageCancelled);
Task->OnInterrupted.AddDynamic(this, &UMyAbility::OnMontageInterrupted);
Task->ReadyForActivation();
```

This is the recommended way to play montages in GAS-based projects. The ability task handles replication, interruption, and cleanup automatically.

---

## Playing from Blueprint

### PlayMontage Node
- Use `Play Anim Montage` on the Character or `Montage Play` on the AnimInstance.
- For GAS: use the `PlayMontageAndWait` ability task node.
- Outputs: On Completed, On Blend Out, On Interrupted, On Cancelled.

### Montage Control
- `Montage Jump to Section`: skip to a named section (for combos).
- `Montage Set Next Section`: define the next section to auto-advance to.
- `Montage Set Play Rate`: change speed mid-playback.
- `Montage Pause` / `Montage Resume`: freeze/unfreeze playback.

---

## Montage Notifications and Callbacks

### AnimNotify (Single Frame)
- Fires at an exact point in time during the montage.
- Use for: spawning projectiles, playing sound cues, triggering VFX at a precise moment.
- Risk: can be skipped if frame rate drops below the notification's time window.

### AnimNotifyState (Duration)
- Has `NotifyBegin`, `NotifyTick`, and `NotifyEnd` callbacks.
- Use for: enabling/disabling hit detection windows, applying trails, toggling weapon collision.
- More reliable than single-frame notifies for gameplay logic.

### Common Notify Patterns
- **Combo Window Notify**: An AnimNotifyState that opens a window during which the player can input the next combo attack. If input is received, call `Montage_JumpToSection` to advance. If not, the section plays out and stops.
- **Damage Window Notify**: Opens weapon collision for a specific time range -- prevents damage on wind-up and recovery frames.
- **FootStep Notify**: Single-frame notify on each foot contact frame for footstep sounds and dust FX.

### Custom Notifies in C++
```cpp
UCLASS()
class UAnimNotify_SpawnProjectile : public UAnimNotify
{
    GENERATED_BODY()
public:
    virtual void Notify(USkeletalMeshComponent* MeshComp,
                        UAnimSequenceBase* Animation,
                        const FAnimNotifyEventReference& EventReference) override;

    UPROPERTY(EditAnywhere)
    TSubclassOf<AProjectile> ProjectileClass;
};
```

---

## Montage Blending

### Blend In
- Controls how the montage blends into the current pose when playback starts.
- `Blend In Time`: Duration in seconds (0.25 is a common default).
- `Blend Option`: Linear, Cubic, Custom Curve.
- Setting Blend In to 0 causes an instant snap to the montage's first frame.

### Blend Out
- Controls how the montage blends back to the underlying animation when it ends or is stopped.
- `Blend Out Time`: Duration in seconds.
- `Blend Out Trigger Time`: How far before the montage's end to begin blending out. Set to -1 to use `Blend Out Time` as the trigger (automatic).
- If Blend Out Time is longer than the remaining montage, the blend out starts immediately.

### Inertialization
- UE5 supports inertialization blending for montages.
- Add an `Inertialization` node after the Slot node in the Anim Graph.
- Set montage blend mode to `Inertialized` in montage settings.
- Produces smoother transitions, especially for fast combat animations.

---

## Networked Montages (Replication)

### Automatic Replication
- When using GAS `PlayMontageAndWait`, replication is handled automatically via the AbilitySystemComponent.
- The ASC replicates `RepAnimMontageInfo` to all clients.

### Manual Replication Pattern
For non-GAS projects:
```cpp
// Server plays montage and multicasts to clients
UFUNCTION(Server, Reliable)
void ServerPlayMontage(UAnimMontage* Montage, float Rate);

UFUNCTION(NetMulticast, Reliable)
void MulticastPlayMontage(UAnimMontage* Montage, float Rate);

void AMyCharacter::ServerPlayMontage_Implementation(UAnimMontage* Montage, float Rate)
{
    MulticastPlayMontage(Montage, Rate);
}

void AMyCharacter::MulticastPlayMontage_Implementation(UAnimMontage* Montage, float Rate)
{
    if (UAnimInstance* AnimInstance = GetMesh()->GetAnimInstance())
    {
        AnimInstance->Montage_Play(Montage, Rate);
    }
}
```

### Replication Pitfalls
- **Late joiners** won't see in-progress montages unless you replicate current section and position.
- **Montage section jumps** need separate replication -- the initial play RPC doesn't cover mid-montage branching.
- **Play rate changes** mid-montage must also be replicated.
- **Interruption**: if the server stops a montage, clients must also be notified to stop.

---

## Root Motion with Montages

### Setup
1. Enable `EnableRootMotion` on the source AnimSequence(s) used in the montage.
2. On the Character: set `bUseControllerRotationYaw = false` (or manage it per-state).
3. On the CharacterMovementComponent: set `bAllowPhysicsRotationDuringAnimRootMotion = true` if you want physics to influence rotation.
4. In the AnimBP: `Root Motion Mode` should be `RootMotionFromMontagesOnly` or `RootMotionFromEverything`.

### Root Motion and Networking
- Root motion is applied locally and then reconciled with the server.
- The CMC's root motion replication uses `FRootMotionSource` for server-authoritative movement.
- For montage-driven root motion, the server plays the montage and both server and client extract root motion independently -- corrections happen via the CMC's normal reconciliation.

### Root Motion Scaling
- Use `Montage_SetPlayRate` to slow or speed up root motion distance.
- Alternatively, apply a root motion modifier via `URootMotionModifier` (from Motion Warping plugin) to warp the root motion to a specific target location.

### Motion Warping
- The Motion Warping plugin allows montage root motion to be dynamically redirected toward a target.
- Add a `MotionWarpingComponent` to the character.
- Place `Motion Warping` windows (notify states) in the montage.
- At runtime, set the warp target: `MotionWarpingComp->AddOrUpdateWarpTarget(FName("Target"), TargetTransform)`.
- The root motion is warped so the character ends at the target location when the window completes.

---

## MCP tools

| Tool | Purpose | Scenario |
|------|---------|----------|
| `ue_play` | Start / stop PIE | Trigger the montage playback you need to observe |
| `ue_get_logs` | Stream montage log output | `category="LogAnimMontage"`, `minVerbosity="Log"` — track section transitions and notify events |
| `ue_execute_python` | Query montage playback state at runtime | `anim_instance.montage_get_position(montage)`, `montage_is_playing(montage)` |
| `search_assets` | Find montage assets | Locate `/Game/...` path for `get_asset_properties` review |
| `get_asset_properties` | Read montage CDO defaults | Inspect slot, sections, blend in/out time, root motion settings |
| `take_screenshot` | Capture mid-montage pose | Visual check of root motion displacement or IK pose during the montage |
