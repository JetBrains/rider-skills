---
name: ue:input
description: "Use when the user asks to set up Enhanced Input, create Input Actions, configure Input Mapping Contexts, implement custom Input Modifiers or Triggers, build combo/chord systems, handle context switching, integrate with CommonUI, set up key remapping, or architect input systems. DO NOT TRIGGER for single property changes on existing input assets, general C++ questions unrelated to input, material/rendering tasks, or GAS ability bindings (use ue:gas)."
context: fork
agent: general-purpose
allowed-tools: Read, Glob, Grep, Bash, Write, Edit
argument-hint: "[Enhanced Input task description]"
---

See [Reference Image Handling](../_shared/reference-image-handling.md)

## Knowledge Retrieval

Before answering:
1. Resolve the `unrealengine` library in Context7 (see `../_shared/context7-protocol.md`)
2. Fetch the section relevant to this query
3. Merge with local knowledge files — Context7 wins on version-specific details, local knowledge wins on workflow/patterns

# UE Input Agent — Specialized Subagent

Spawn a focused subagent for complex Unreal Engine Enhanced Input System tasks that require setting up input from scratch, creating Input Actions and Mapping Contexts, implementing custom modifiers/triggers, building combo/chord systems, handling context switching, or architecting multiplayer input frameworks.

## Checklist

Call `TaskCreate` for each item below before starting, then mark each `in_progress` / `completed` as you go:

1. **Clarify** — Enhanced Input vs legacy, context switching needs, GAS binding, CommonUI integration
2. **Pre-flight** — check existing Input Actions, Mapping Contexts, project input settings
3. **Implement** — Input Actions, Mapping Contexts, Modifiers, Triggers; context switching logic
4. **Save** — save InputAction and IMC assets; confirm assets are on disk
5. **Verify** — test all bindings in PIE; confirm context switching and edge cases
6. **Code review** — dispatch `ue:code-review` subagent (see `../_shared/post-task.md`); fix all Critical and Important issues before proceeding

## CRITICAL — Mistakes That Waste Hours

These rules were learned from official documentation and community experience. Violating them causes silent failures, stuck input, or wasted debugging cycles.

### 1. NEVER Add IMC in Pawn BeginPlay
- `AddMappingContext()` in a Pawn's `BeginPlay()` fails silently because the Pawn is not yet possessed
- **Pawn**: Add IMC in `OnPossessed()` (C++) or `PossessedBy()`, NOT `BeginPlay()`
- **PlayerController**: `BeginPlay()` IS safe (controller exists before possession)
- Symptom: input bindings exist but never fire

### 2. ALWAYS Flush Keys Before UI Mode Switch
- Switching from `GameOnly` to `UIOnly` while player holds movement keys causes permanently stuck input
- Call `PlayerController->FlushPressedKeys()` BEFORE transitioning to `UIOnly`
- Symptom: character keeps moving after opening a menu

### 3. Consume Input Does NOT Block Other Actors
- The `bConsumeInput` flag only works within the same actor's input hierarchy and at the IMC priority level
- It does NOT prevent other actors from receiving the same input
- Use IMC priority levels for cross-actor input blocking

### 4. NEVER Use SetInputMode with CommonUI
- `SetInputMode()` breaks CommonUI's input routing entirely
- Use `GetDesiredInputConfig()` override on `UCommonActivatableWidget` instead
- Symptom: UI stops responding to input or game input bleeds through

### 5. ALWAYS Include EnhancedInput in Build.cs
- Missing `"EnhancedInput"` module causes cryptic linker errors
- Also need `"InputCore"` for `FKey` and related types
- ```cpp
  PublicDependencyModuleNames.AddRange(new string[] {
      "Core", "CoreUObject", "Engine", "InputCore", "EnhancedInput"
  });
  ```

### 6. ALWAYS Set Project Settings Default Classes
- Project Settings > Input > Default Player Input Class = `EnhancedPlayerInput`
- Project Settings > Input > Default Input Component Class = `EnhancedInputComponent`
- Without these, `CastChecked<UEnhancedInputComponent>` crashes at runtime

### 7. ALWAYS Assign Action References in Blueprint
- IMC maps keys to actions; the Character/Controller class needs UPROPERTY references to those same action assets
- Forgetting Blueprint assignment = bindings compile but never fire
- Symptom: no errors, no crashes, but input does nothing

### 8. NEVER Rebuild Mappings Mid-Frame
- `RequestRebuildControlMappings()` during active input processing prevents `Completed` and `Canceled` events from firing
- Only rebuild at safe points (between states, not during input callbacks)

### 9. Started Event Has Zero Value in UE 5.5+
- `ETriggerEvent::Started` fires with an empty/zero `FInputActionValue`
- For single-fire-with-value, use `ETriggerEvent::Triggered` with a `Pressed` trigger type
- Symptom: callback fires but `Value.Get<>()` returns zero

### 10. Default Trigger is Down (Continuous)
- An action with NO triggers gets an implicit `UInputTriggerDown` — fires every tick while held
- For one-shot press behavior, explicitly add a `Pressed` trigger
- Common confusion: binding `ETriggerEvent::Triggered` without a trigger = every-frame fire while held

## When to Delegate

- **Enhanced Input setup** — project settings, IMC creation, action binding, modifier/trigger configuration
- **Input Action creation** — defining actions with correct value types, triggers, modifiers
- **Input Mapping Context design** — priority-based context stacking, context switching patterns
- **Custom Modifier implementation** — aim sensitivity, acceleration curves, platform-specific transforms
- **Custom Trigger implementation** — double-tap, hold patterns, sequential combos
- **Chord/Combo systems** — modifier keys, multi-button combos, fighting game inputs
- **Context switching** — combat/vehicle/UI mode transitions, priority management
- **CommonUI integration** — input routing, widget focus, gamepad navigation
- **Key remapping** — runtime rebinding, UEnhancedInputUserSettings (5.3+), saving/loading
- **Multiplayer input** — local split-screen, listen server fixes, input replication patterns
- **GAS + Input integration** — ability binding via Enhanced Input, InputID assignment
- **Gamepad/KB+M detection** — device switching, UI prompt adaptation
- **Mobile/Touch input** — touch mapping contexts, virtual joystick integration

## When NOT to Delegate

- **Single property change** — just edit the data asset directly
- **General C++ unrelated to input** — use **ue:coder** skill
- **GAS ability logic** — use **ue:gas** skill (but input-to-ability binding IS this skill's domain)
- **Blueprint-only widget graphs** — use **ue:blueprint** skill
- **Material/rendering tasks** — use **ue:material** skill
- **General editor automation** — use **ue:task** skill

## How to Spawn

Use the **Agent** tool with `subagent_type: "general-purpose"`. Include the prompt template below with the specific task filled in.

### Prompt Template

```
You are a UE Enhanced Input System automation agent. Complete the following input task for an Unreal Engine project.

**Task:** [describe what to implement — input setup, actions, contexts, modifiers, triggers, etc.]

**How to communicate with the editor:**
All editor communication goes through **/ue:console**. See the ue:console skill for the full transport API.

DO NOT use raw `curl`. DO NOT use MCP tools (not available to subagents).

**C++ File Workflow:**
Enhanced Input code is primarily C++. Use Read/Write/Edit tools to create and modify .h/.cpp files directly in the project Source directory. After writing files:
1. Check existing files with Glob/Grep to understand project structure
2. Write .h and .cpp files using Write tool
3. Trigger hot-reload via `/ue:console --build --wait`
4. Verify compilation via `/ue:console --errors --filter "CompilerResultsLog"`

## Enhanced Input Workflow Paths

### Path 1: Project Setup (From Scratch)
1. **Verify plugin**: Enhanced Input plugin enabled (default in UE 5.1+)
2. **Project Settings**: Default Player Input Class = `EnhancedPlayerInput`, Default Input Component Class = `EnhancedInputComponent`
3. **Build.cs**: Add `"EnhancedInput"` and `"InputCore"` to dependencies
4. **Create Input Actions**: Data Assets with `IA_` prefix, set ValueType per action
5. **Create Input Mapping Context**: Data Asset with `IMC_` prefix, map keys to actions with modifiers/triggers
6. **Register IMC at runtime**: via `UEnhancedInputLocalPlayerSubsystem::AddMappingContext()`
7. **Bind actions**: in `SetupPlayerInputComponent()` using `UEnhancedInputComponent::BindAction()`

### Path 2: Input Action Design
1. **Determine value type**: Boolean (buttons), Axis1D (throttle/scroll), Axis2D (WASD/stick/mouse), Axis3D (VR)
2. **Set action-level modifiers**: Dead Zone, Scalar, Response Curve (applied to ALL mappings)
3. **Set action-level triggers**: Pressed, Hold, Tap (applied to ALL mappings)
4. **Configure consumption**: `bConsumeInput`, `bTriggerWhenPaused`, `bReserveAllMappings`
5. **Choose ETriggerEvent for binding**: Started (once), Triggered (continuous), Completed (release)

### Path 3: Input Mapping Context Design
1. **Map physical keys** to Input Actions
2. **Add per-mapping modifiers**: Negate (S/A keys), Swizzle (W/S for Y-axis), Scalar (sensitivity)
3. **Add per-mapping triggers**: Override action-level triggers for specific keys
4. **Set priority**: Higher number = higher priority = processes first
5. **WASD pattern**: W=Swizzle, S=Negate+Swizzle, A=Negate, D=none (for Axis2D Move action)

### Path 4: Context Switching
1. **Design context hierarchy**: IMC_Default (priority 0), IMC_Vehicle (1), IMC_UI (2)
2. **Swap contexts**: Remove old, Add new via subsystem
3. **Stack contexts**: Add overlay context at higher priority (keeps base context active)
4. **Flush keys**: Call `FlushPressedKeys()` before switching to UI-only mode
5. **Rebuild mappings**: Call `RequestRebuildControlMappings()` only at safe points

### Path 5: Custom Modifier
1. Create `UInputModifier` subclass
2. Override `ModifyRaw_Implementation(PlayerInput, CurrentValue, DeltaTime)`
3. Transform value and return `FInputActionValue(ValueType, TransformedVector)`
4. Add to IMC per-mapping or InputAction action-level modifiers array

### Path 6: Custom Trigger
1. Create `UInputTrigger` subclass
2. Override `GetTriggerType_Implementation()` — return Explicit, Implicit, or Blocker
3. Override `UpdateState_Implementation(PlayerInput, ModifiedValue, DeltaTime)` — return ETriggerState
4. Use `IsActuated(Value)` helper to check against ActuationThreshold

### Path 7: Chord/Combo System
1. **Chord (simultaneous)**: Add `UInputTriggerChordAction` to the combo action, referencing the modifier action
2. **Block base action during chord**: Add `UInputTriggerChordBlocker` to the base action
3. **Sequential combo (UE 5.4+)**: Use `UInputTriggerCombo` with ordered `ComboActions` array
4. **Custom combo**: Track combo state in a component, use anim notify windows for combo timing

### Path 8: Key Remapping (Runtime)
1. **UE 5.3+**: Enable User Settings in Project Settings, access via `GetUserSettings()`
2. **Mark mappings as player-mappable** in IMC (set `bIsPlayerMappable`, configure Name/DisplayName/Category)
3. **Save/Load**: `SaveSettings()` writes to `EnhancedInputUserSettings.sav`
4. **Pre-5.3**: Create modified copies of IMCs with swapped key bindings (manual approach)

### Path 9: CommonUI Integration
1. Enable CommonUI + Enhanced Input plugins
2. Project Settings > Common Input Settings > `Enable Enhanced Input Support = true`
3. Use `UCommonActivatableWidget` for UI panels
4. Override `GetDesiredInputConfig()` on widgets — return `FUIInputConfig(ECommonInputMode, EMouseCaptureMode)`
5. NEVER use `SetInputMode()` — it breaks CommonUI

### Path 10: GAS + Enhanced Input Binding
1. Server grants abilities in `PossessedBy()`
2. Client receives via ASC replication
3. Assign incrementing InputID to each `FGameplayAbilitySpec`
4. Bind `ETriggerEvent::Started` → `AbilityLocalInputPressed(InputID)`
5. Bind `ETriggerEvent::Completed` → `AbilityLocalInputReleased(InputID)`

## Critical Rules

1. **NEVER add IMC in Pawn BeginPlay** — use OnPossessed/PossessedBy; Controller BeginPlay is OK
2. **ALWAYS include EnhancedInput + InputCore in Build.cs** — missing either causes linker errors
3. **ALWAYS set Default Player Input/Component classes** — without them, Cast crashes at runtime
4. **ALWAYS flush keys before UI mode switch** — prevents permanently stuck input
5. **ALWAYS assign action UPROPERTY references in Blueprint** — IMC alone is not enough
6. **NEVER use SetInputMode() with CommonUI** — use GetDesiredInputConfig() override
7. **NEVER rebuild mappings mid-frame** — prevents Completed/Canceled events from firing
8. **NEVER put expensive logic in Triggered callbacks for mouse/look** — fires every frame
9. **Use Started/Completed for discrete actions** (jump, interact) — Triggered is for continuous
10. **Use Pressed trigger for single-fire-with-value** — Started has zero value in UE 5.5+
11. **Higher priority number = higher priority** — not lower; priority 2 beats priority 0
12. **Modifier order matters** — applied sequentially in array order; Negate before Swizzle ≠ Swizzle before Negate
13. **Default trigger is Down** — no triggers = fires every tick while held; add Pressed for one-shot
14. **Chord triggers are Implicit** — ALL implicit triggers must be Triggered for the action to fire
15. **Blocker triggers veto everything** — if ANY blocker is Triggered, the action is blocked

## Verification Steps

After completing Enhanced Input implementation, the subagent MUST:
1. Verify all .h/.cpp files compile: check `/ue:console --errors --filter "CompilerResultsLog"` or inform user to build
2. Confirm Build.cs includes `EnhancedInput` and `InputCore`
3. Verify Project Settings defaults are documented (EnhancedPlayerInput, EnhancedInputComponent)
4. Check that IMC priority ordering makes sense (higher number = higher priority)
5. Confirm WASD modifier pattern is correct (W=Swizzle, S=Negate+Swizzle, A=Negate, D=none)
6. Verify context switching calls FlushPressedKeys() before UI mode transitions
7. Report structured summary of what was created

**Output format:**
Return a structured summary:
- What was done (steps taken)
- Files created/modified (full paths)
- Input Actions created (names, value types)
- Input Mapping Contexts created (names, priority, key mappings)
- Custom Modifiers/Triggers (names, behavior)
- Context switching logic (if applicable)
- Any compilation warnings or issues
```

### Example Invocations

**Basic Enhanced Input setup for a character:**
```python
Agent(
    subagent_type="general-purpose",
    description="Set up Enhanced Input",
    prompt="""You are a UE Enhanced Input System automation agent...

    **Task:** Set up a complete Enhanced Input foundation for AMyCharacter:
    1. Add EnhancedInput + InputCore to Build.cs
    2. Create IA_Move (Axis2D), IA_Look (Axis2D), IA_Jump (Boolean), IA_Interact (Boolean)
    3. Create IMC_Default with WASD+mouse+gamepad mappings
    4. Bind all actions in SetupPlayerInputComponent
    5. Register IMC in BeginPlay (Character uses Controller, so it's safe there)
    6. Implement Move (direction-relative), Look (pitch/yaw), Jump, Interact callbacks

    Project source directory: [path to Source/]

    [include full tool list and workflow paths from template above]
    """
)
```

**Context switching for vehicle system:**
```python
Agent(
    subagent_type="general-purpose",
    description="Vehicle input context switching",
    prompt="""You are a UE Enhanced Input System automation agent...

    **Task:** Implement context switching for a vehicle system:
    1. Create IMC_OnFoot (priority 0) with standard movement bindings
    2. Create IMC_Vehicle (priority 0) with vehicle controls (WASD=throttle/steer, Space=brake)
    3. Create IMC_VehicleOverlay (priority 1) with shared actions (Escape=exit vehicle)
    4. Implement EnterVehicle(): remove IMC_OnFoot, add IMC_Vehicle + IMC_VehicleOverlay
    5. Implement ExitVehicle(): remove IMC_Vehicle + IMC_VehicleOverlay, add IMC_OnFoot
    6. FlushPressedKeys() on every transition

    [include full tool list and workflow paths from template above]
    """
)
```

**Chord and combo system:**
```python
Agent(
    subagent_type="general-purpose",
    description="Build chord+combo input system",
    prompt="""You are a UE Enhanced Input System automation agent...

    **Task:** Create a chord and combo input system:
    1. IA_Sprint (Boolean) — Shift key
    2. IA_LightAttack (Boolean) — Left Mouse
    3. IA_HeavyAttack (Boolean) — Right Mouse
    4. IA_SprintAttack (Boolean) — Shift+Left Mouse (Chord: requires IA_Sprint)
    5. Add ChordBlocker on IA_LightAttack so it doesn't fire during IA_SprintAttack
    6. IA_SpecialCombo (Boolean) — sequential: LightAttack → LightAttack → HeavyAttack
    7. Use UInputTriggerCombo for the sequential combo

    [include full tool list and workflow paths from template above]
    """
)
```

## Tips

- Keep subagent prompts focused on ONE input concern (don't mix "set up input" with "add vehicle context switching" with "add key remapping")
- Include the full tool list — the subagent does not inherit skill context
- For full input architectures, break into sequential subagent calls: Setup → Actions/Contexts → Custom Triggers → Context Switching → Remapping
- The subagent's output is returned to you — summarize it for the user
- Use `showdebug enhancedinput` console command to verify active actions and trigger states
- Use `InjectInputForAction()` for automated testing without physical input devices

see: knowledge/eis-reference.md — Complete Enhanced Input reference: core classes, actions, contexts, modifiers, triggers, enums, processing pipeline, project settings
see: knowledge/eis-patterns.md — Copy-paste C++ recipes: setup, WASD binding, context switching, chords, combos, custom modifiers/triggers, CommonUI, GAS integration, key remapping
see: knowledge/eis-pitfalls.md — Hard-won debugging knowledge: 15+ pitfalls with symptoms, causes, and fixes
see: knowledge/crossplatform-input.md — Cross-platform patterns: InputConfig tag binding, device-specific look actions, custom modifiers (deadzone, sensitivity, inversion), touch input, GameFeature input registration, asset organization, CommonUI integration, key remapping setup
