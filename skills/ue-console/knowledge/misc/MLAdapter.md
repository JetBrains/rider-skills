# UE Python API — MLAdapter Module

**17 types** from the `MLAdapter` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MLAdapterActuator`, `MLAdapterActuator_Camera`, `MLAdapterActuator_EnhancedInput`, `MLAdapterActuator_InputKey`, `MLAdapterAgent`, `MLAdapterAgent_Inference`, `MLAdapterAgentElement`, `MLAdapterLocalDataCollectionSession`, `MLAdapterSensor`, `MLAdapterSensor_AIPerception`, `MLAdapterSensor_Attribute`, `MLAdapterSensor_Camera`, `MLAdapterSensor_EnhancedInput`, `MLAdapterSensor_Input`, `MLAdapterSensor_Movement`, `MLAdapterSession`, `MLAdapterTickPolicy`

---

## Classes

### `unreal.MLAdapterActuator`
Inherits: `MLAdapterAgentElement` | Header: `MLAdapterActuator.h`

Allows an agent to take an action in the game world.

### `unreal.MLAdapterActuator_Camera`
Inherits: `MLAdapterActuator` | Header: `MLAdapterActuator_Camera.h`

Allows an agent to rotate the camera.

### `unreal.MLAdapterActuator_EnhancedInput`
Inherits: `MLAdapterActuator` | Header: `MLAdapterActuator_EnhancedInput.h`

Allows an agent to simulate player input via the UEnhancedPlayerInput subsystem.

**Properties** (2):
  - `clear_action_on_use`: `bool` [Read-Only] — [Read-Only] (bool)
  - `tracked_actions`: `None` [Read-Only] — [Read-Only] The actions that this actuator is allowed to inject data into. Modifying this list after...

### `unreal.MLAdapterActuator_InputKey`
Inherits: `MLAdapterActuator` | Header: `MLAdapterActuator_InputKey.h`

Allows an agent to directly inject key presses into its avatarâs input component.

### `unreal.MLAdapterAgent`
Inherits: `Object` | Header: `MLAdapterAgent.h`

An agent capable of controlling a single avatar (e.g. a Pawn or Controller). Contains sensors for perceiving information about the environment and actuators for taking actions in the game.

**Properties** (3):
  - `actuators`: `None` [Read-Only] — [Read-Only] (Array[MLAdapterActuator])
  - `avatar_class`: `Class` [Read-Only] — [Read-Only] (type(Class))
  - `sensors`: `None` [Read-Only] — [Read-Only] (Array[MLAdapterSensor])

### `unreal.MLAdapterAgent_Inference`
Inherits: `MLAdapterAgent` | Header: `MLAdapterAgent_Inference.h`

Inference agents have a neural network that can process senses and output actuations via their Think method. You can create a blueprint of this class to easily wire-up an agent that functions entirely...

### `unreal.MLAdapterAgentElement`
Inherits: `Object` | Header: `MLAdapterAgentElement.h`

An agent element is any object that can be attached to an agent. Base class for UMLAdapterSensor and UMLAdapterActuator.

### `unreal.MLAdapterLocalDataCollectionSession`
Inherits: `MLAdapterSession` | Header: `MLAdapterLocalDataCollectionSession.h`

Collects data from agentsâ sensors and writes them to a file for offline processing. Only works with a locally controlled, single-player game.

### `unreal.MLAdapterSensor`
Inherits: `MLAdapterAgentElement` | Header: `MLAdapterSensor.h`

Allows an agent to sense information about the game world or itself.

### `unreal.MLAdapterSensor_AIPerception`
Inherits: `MLAdapterSensor` | Header: `MLAdapterSensor_AIPerception.h`

When applied to a player controller will create an AIPerception component for that player and plug it into the AIPerceptionSystem. The sensor will report information gathered by the perception system ...

### `unreal.MLAdapterSensor_Attribute`
Inherits: `MLAdapterSensor` | Header: `MLAdapterSensor_Attribute.h`

MLAdapter Sensor Attribute

### `unreal.MLAdapterSensor_Camera`
Inherits: `MLAdapterSensor` | Header: `MLAdapterSensor_Camera.h`

Observing playerâs camera

### `unreal.MLAdapterSensor_EnhancedInput`
Inherits: `MLAdapterSensor` | Header: `MLAdapterSensor_EnhancedInput.h`

MLAdapter Sensor Enhanced Input

**Properties** (2):
  - `input_component`: `EnhancedInputComponent` [Read-Only] — [Read-Only] (EnhancedInputComponent)
  - `tracked_actions`: `None` [Read-Only] — [Read-Only] (Array[InputAction])

### `unreal.MLAdapterSensor_Input`
Inherits: `MLAdapterSensor` | Header: `MLAdapterSensor_Input.h`

Note that this sensor doesnât buffer input state between GetObservations call todo: a child class could easily do that by overriding OnInputKey/OnInputAxis and GetObservations

### `unreal.MLAdapterSensor_Movement`
Inherits: `MLAdapterSensor` | Header: `MLAdapterSensor_Movement.h`

Allows an agent to sense its avatarâs location and velocity.

### `unreal.MLAdapterSession`
Inherits: `Object` | Header: `MLAdapterSession.h`

Container for agents that exist in the world. Ticks the agents. Finds avatars for the agents.

### `unreal.MLAdapterTickPolicy`
Inherits: `EnumBase` | Header: `MLAdapterSensor.h`

Controls the frequency that a sensor should tick at.

**Properties** (4):
  - `EVERY_N_TICKS`: `MLAdapterTickPolicy = Ellipsis` — 2
  - `EVERY_TICK`: `MLAdapterTickPolicy = Ellipsis` — 0
  - `EVERY_X_SECONDS`: `MLAdapterTickPolicy = Ellipsis` — 1
  - `NEVER`: `MLAdapterTickPolicy = Ellipsis` — 3
