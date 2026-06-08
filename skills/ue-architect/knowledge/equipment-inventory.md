# Equipment & Inventory Architecture

## Inventory System

### Core Classes (Lyra Pattern)

**ULyraInventoryItemDefinition** — Immutable DataAsset:
```cpp
FText DisplayName;
TArray<TObjectPtr<ULyraInventoryItemFragment>> Fragments;
```
An Item Definition is nothing more than a display name and an array of Fragments that define the item.

**ULyraInventoryItemInstance** — Runtime instance of an item:
- References its Definition
- Has instance-specific state (via tag stacks)
- Can be queried for fragments: `FindFragmentByClass<T>()`

**ULyraInventoryManagerComponent** — PawnComponent managing inventory:
- Uses `FFastArraySerializer` for network replication
- Methods: AddItemDefinition, RemoveItemInstance, GetAllItems, FindFirstItemStackByDefinition, ConsumeItemsByDefinition
- Publishes `FLyraInventoryChangeMessage` to GameplayMessageRouter

### Inventory Entry (Replicated)
```cpp
struct FLyraInventoryEntry : public FFastArraySerializerItem {
    ULyraInventoryItemInstance* Instance;
    int32 StackCount;
    int32 LastObservedCount;  // Authority-only
};

struct FLyraInventoryList : public FFastArraySerializer {
    void PreReplicatedRemove(const TArrayView<int32>&, int32);
    void PostReplicatedAdd(const TArrayView<int32>&, int32);
    void PostReplicatedChange(const TArrayView<int32>&, int32);
};
```

### Stacking Rules
Items with `StackSizeMax > 1` only stack if their fragment states are identical. Different instances of the same definition with different stats won't combine.

---

## Equipment System

### Core Classes (Lyra Pattern)

**ULyraEquipmentDefinition** — Immutable DataAsset:
```cpp
TSubclassOf<ULyraEquipmentInstance> InstanceType;
TArray<const ULyraAbilitySet*> AbilitySetsToGrant;
TArray<FLyraEquipmentActorToSpawn> ActorsToSpawn;  // Meshes + sockets + transforms
```

**ULyraEquipmentInstance** — Runtime equipment object:
- Lifecycle: `OnEquipped()` → `OnUnequipped()`
- Can grant abilities via AbilitySets
- Can spawn actors (weapon meshes) attached to sockets

**ULyraEquipmentManagerComponent** — PawnComponent:
- Uses `FFastArraySerializer` for replication
- Methods: EquipItem (server only), UnequipItem, GetFirstInstanceOfType
- Tracks `FLyraAbilitySet_GrantedHandles` for cleanup

### Equipment Entry (Replicated)
```cpp
struct FLyraAppliedEquipmentEntry : public FFastArraySerializerItem {
    TSubclassOf<ULyraEquipmentDefinition> EquipmentDefinition;
    ULyraEquipmentInstance* Instance;
    FLyraAbilitySet_GrantedHandles GrantedHandles;  // Authority-only
};
```

---

## Inventory → Equipment Bridge

The `UInventoryFragment_EquippableItem` fragment holds a reference to a `ULyraEquipmentDefinition`. Items with this fragment can be equipped. The flow:

```
1. Player picks up item → InventoryManager.AddItemDefinition()
2. Item has EquippableItem fragment → eligible for QuickBar
3. Player selects item → QuickBar reads EquippableItem fragment
4. QuickBar calls EquipmentManager.EquipItem(EquipmentDef)
5. EquipmentManager creates EquipmentInstance
6. EquipmentManager grants AbilitySets to ASC
7. EquipmentManager spawns weapon actors on sockets
8. On unequip: reverse all grants and destroy spawned actors
```

---

## Fragment Composition Examples

### Rifle Item
```
ULyraInventoryItemDefinition "Rifle"
├── InventoryFragment_EquippableItem
│   └── EquipmentDef → DA_Rifle_Equipment
├── InventoryFragment_SetStats
│   ├── Tag: Weapon.MagazineSize → 30
│   └── Tag: Weapon.MagazineAmmo → 30
├── InventoryFragment_QuickBarIcon
│   └── Icon → T_Rifle_Icon
├── InventoryFragment_PickupIcon
│   └── Mesh → SM_Rifle_Pickup
└── InventoryFragment_ReticleConfig
    └── ReticleWidgets → [W_Crosshair_Rifle]
```

### Health Potion (Non-Equippable)
```
UMyItemDefinition "Health Potion"
├── MyFragment_Consumable
│   └── Effect → GE_HealOnUse
├── MyFragment_StackableItem
│   └── MaxStack → 5
└── MyFragment_InventoryIcon
    └── Icon → T_Potion_Red
```

---

## Design Principles

### Why Fragment Pattern Over Inheritance
A `Weapon` subclass of `Item` with a `RangedWeapon` subclass creates rigid hierarchies. What about a throwable potion that acts as both consumable and projectile? Fragments let you combine any capabilities freely.

### Why FastArraySerializer Over TArray Replication
- Standard TArray: Removing from middle causes all subsequent elements to re-send
- FastArraySerializer: Only delta changes sent (add/remove/modify)
- For 10K items: 3ms → 0.05ms per frame
- Provides client-side callbacks for spawning/destroying visual representations

### Authority Pattern
- **Server**: Adds/removes items, validates operations, manages stacking
- **Client**: Receives deltas via FastArraySerializer, spawns visual representations
- **EquipItem is server-only**: Client sends input → ability activates → server equips

---

## Anti-Patterns
- Hardcoding item types as subclasses instead of using fragments
- Replicating full arrays instead of using FastArraySerializer
- Not tracking GrantedHandles (ability leaks on unequip)
- Client directly manipulating inventory (server-authoritative)
- Not publishing change messages (other systems can't react)
- Mixing inventory logic with equipment logic (keep separate concerns)
