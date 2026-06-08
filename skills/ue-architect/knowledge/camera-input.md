# Camera & Input Architecture

## Camera System (Lyra Pattern)

### Camera Mode Stack
Lyra uses a stack-based blending system for camera modes:

**ULyraCameraMode** (base class):
```cpp
FGameplayTag CameraTypeTag;     // Query "what kind of camera is active"
float FieldOfView;
float ViewPitchMin, ViewPitchMax;
float BlendTime;
ELyraCameraModeBlendFunction BlendFunction;  // Linear, EaseIn/Out, EaseInOut
float BlendExponent;
```

**ULyraCameraModeStack**:
- `PushCameraMode(TSubclassOf<ULyraCameraMode>)`: Add mode (instances created on demand)
- `EvaluateStack(DeltaTime, OutView)`: Update all modes, blend result
- Top mode contributes most; previous modes blend out over BlendTime

**ULyraCameraComponent**:
- Extends UCameraComponent
- Owns CameraModeStack
- Delegate: `DetermineCameraModeDelegate` for querying active mode from HeroComponent
- `AddFieldOfViewOffset()`: Temporary one-frame FOV adjustment (for zoom effects)

### Camera Mode Blending
```cpp
struct FLyraCameraModeView {
    FVector Location;
    FRotator Rotation;
    FRotator ControlRotation;
    float FieldOfView;
    void Blend(const FLyraCameraModeView& Other, float OtherWeight);
};
```
Each mode produces a view; the stack blends them based on weights.

### Ability Camera Override
Abilities can temporarily override the camera:
```cpp
// In ability:
SetCameraMode(UMyCameraMode_AimDownSights::StaticClass());
// On ability end:
ClearCameraMode();
```
HeroComponent tracks override via ability spec handle. When ability ends, camera reverts.

### Specialized Camera Modes
- `ULyraCameraMode_ThirdPerson`: Orbit camera with wall collision avoidance
- Custom modes: Aim-down-sights, vehicle, spectator, top-down

---

## Enhanced Input System

### Architecture
Four core concepts:
1. **Input Actions** (UInputAction): Player intentions (Move, Jump, Fire) with value types (Bool, Axis1D, Axis2D, Axis3D)
2. **Input Mapping Contexts** (UInputMappingContext): Maps physical keys → actions, with priority ordering
3. **Input Modifiers**: Pre-process raw input (dead zones, negate, swizzle, scale)
4. **Input Triggers**: Determine when actions fire (Down, Pressed, Released, Hold, Tap, Chord)

### Lyra's Input Config
**ULyraInputConfig** (DataAsset):
```cpp
struct FLyraInputAction {
    const UInputAction* InputAction;
    FGameplayTag InputTag;
};

TArray<FLyraInputAction> NativeInputActions;    // Manual binding (move, look)
TArray<FLyraInputAction> AbilityInputActions;   // Auto-bound to abilities via tags
```

### Input → Ability Flow
```
1. Player presses key
2. Enhanced Input fires UInputAction
3. HeroComponent maps action → FGameplayTag (from LyraInputConfig)
4. HeroComponent calls ASC->AbilityInputTagPressed(Tag)
5. ASC finds abilities matching InputTag
6. ASC activates matching abilities
7. On release: ASC->AbilityInputTagReleased(Tag)
```

This completely decouples input from abilities. Changing which ability fires on a button = editing InputConfig DataAsset.

### Input Context Switching
Mapping contexts have priorities. Higher priority overrides lower:
```
IMC_DefaultControls (Priority: 0)    — Basic movement
IMC_VehicleControls (Priority: 1)    — Override when in vehicle
IMC_Swimming (Priority: 1)           — Override when swimming
```

Add/remove at runtime:
```cpp
EnhancedInputSubsystem->AddMappingContext(IMC_Vehicle, 1);
EnhancedInputSubsystem->RemoveMappingContext(IMC_Default);
```

### GameFeature Input Injection
- **GameFeatureAction_AddInputBinding**: Adds ability input bindings from LyraInputConfig
- **GameFeatureAction_AddInputContextMapping**: Adds mapping contexts with priority
- When feature deactivates, injected input is automatically removed

---

## Input Tags (Lyra)
```
InputTag_Move          — Movement input
InputTag_Look_Mouse    — Mouse aim
InputTag_Look_Stick    — Gamepad look
InputTag_Crouch        — Toggle crouch
InputTag_AutoRun       — Auto-run toggle
```

Plus ability-specific input tags that trigger abilities through the ASC.

---

## Design Principles

### Why Tag-Based Input (Not Direct Binding)
- Same ability can be triggered by different inputs on different platforms
- Remapping = changing tag→key association, not ability code
- GameFeature plugins inject input without knowing about specific abilities
- Multiple abilities can share the same input tag (both fire on press)

### Why Camera Mode Stack (Not Single Camera)
- Smooth transitions between modes (third-person → aim → spectator)
- Abilities can temporarily override without losing previous state
- Multiple systems can influence camera without conflicting
- Blending handles the interpolation automatically

### Why DataAsset-Driven Input (Not Hardcoded)
- `ULyraInputConfig` is a DataAsset: designers tune input without code
- Different PawnData → different InputConfig → completely different controls
- Same character class can have different input layouts per experience

---

## Anti-Patterns
- Hardcoding key bindings instead of using action/context abstraction
- Mixing gameplay and UI inputs in same mapping context
- Not removing old contexts when state changes (ghost inputs)
- Directly binding abilities to input without tag indirection
- Not implementing camera collision for third-person modes
- Tick-based input polling instead of Enhanced Input callbacks
- Not using priorities for overlapping mapping contexts
