# UE5 Collision Channel Setup

## Custom Trace Channels

Define in header, match in DefaultEngine.ini:
```cpp
// MyCollisionChannels.h
#define My_TraceChannel_Interaction    ECC_GameTraceChannel1
#define My_TraceChannel_Weapon         ECC_GameTraceChannel2
#define My_TraceChannel_Weapon_Capsule ECC_GameTraceChannel3
#define My_TraceChannel_Weapon_Multi   ECC_GameTraceChannel4
```

### Channel Design Patterns
- **Interaction**: For interactable actors/components (pickup, doors)
- **Weapon (Physics)**: Hits detailed physics bodies for accurate detection
- **Weapon (Capsule)**: Hits simplified capsule for fast/broad detection
- **Weapon (Multi)**: Penetrating traces — continues through hit pawns

## Config Sync

`DefaultEngine.ini` collision profiles MUST match C++ channel definitions:
```ini
[/Script/Engine.CollisionProfile]
+DefaultChannelResponses=(Channel=ECC_GameTraceChannel1,DefaultResponse=ECR_Ignore,bTraceType=True,bStaticObject=False,Name="Interaction")
```

## PhysicalMaterial with Tags

Extend `UPhysicalMaterial` with GameplayTags for surface-dependent effects:
```cpp
UCLASS()
class UPhysicalMaterialWithTags : public UPhysicalMaterial {
    UPROPERTY(EditAnywhere)
    FGameplayTagContainer Tags;
};
```
Drive audio/visual feedback from surface type → tag → appropriate effect.

## Weapon Trace Pattern

Layered traces for robust hit detection:
1. Primary trace against physics assets (detailed bodies)
2. Fallback trace against capsules (simplified)
3. Feed results into custom GameplayEffectContext with CartridgeID for grouping
