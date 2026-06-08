# UE Python API — DMXProtocol Module

**15 types** from the `DMXProtocol` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DMXAttributeName`, `DMXFixtureCategory`, `DMXInputPortConfig`, `DMXInputPortReference`, `DMXOutputPortConfig`, `DMXOutputPortDestinationAddress`, `DMXOutputPortReference`, `DMXProtocolName`, `DMXAttributeNameConversions`, `DMXNameContainersConversions`, `DMXRuntimeLibrary`, `DMXCommunicationType`, `DMXFixtureSignalFormat`, `DMXPortPriorityStrategy`, `DMXSendResult`

---

## Classes

### `unreal.DMXAttributeName`
Inherits: `StructBase` | Header: `DMXAttribute.h`

DMXAttribute Name

### `unreal.DMXFixtureCategory`
Inherits: `StructBase` | Header: `DMXProtocolTypes.h`

Category of a fixture

### `unreal.DMXInputPortConfig`
Inherits: `StructBase` | Header: `DMXInputPortConfig.h`

Blueprint Configuration of a Port, used in DXM Settings to specify inputs and outputs.

**Properties** (12):
  - `auto_complete_device_address`: `str` [Read-Only] — [Read-Only] Searches available Network Interface Card IP Addresses and uses the first match as the â...
  - `auto_complete_device_address_enabled`: `bool` [Read-Only] — [Read-Only] Enables âAuto Complete Device Addressâ, hidden via customization - EditConditionInli...
  - `communication_type`: `DMXCommunicationType` [Read-Only] — [Read-Only] The type of communication used with this port (DMXCommunicationType)
  - `device_address`: `str` [Read-Only] — [Read-Only] The Network Interface Cardâs IP Adress, over which DMX is received (str)
  - `extern_universe_start`: `int` [Read-Only] — [Read-Only] Remaps the range of local Universes (Num Universes from Local Universe Start) to a diffe...
  - `local_universe_start`: `int` [Read-Only] — [Read-Only] Local Start Universe (int32)
  - `num_universes`: `int` [Read-Only] — [Read-Only] Number of Universes (int32)
  - `port_guid`: `Guid` [Read-Only] — [Read-Only] Unique identifier, shared with the port instance.
Note: This needs be BlueprintReadWrite...
  - `port_name`: `str` [Read-Only] — [Read-Only] The name displayed wherever the port can be displayed (str)
  - `priority`: `int` [Read-Only] — [Read-Only] Priority value, can act as a filter or a threshold (int32)
  - `priority_strategy`: `DMXPortPriorityStrategy` [Read-Only] — [Read-Only] How to deal with the priority value (DMXPortPriorityStrategy)
  - `protocol_name`: `Name` [Read-Only] — [Read-Only] DMX Protocol (Name)

### `unreal.DMXInputPortReference`
Inherits: `StructBase` | Header: `DMXInputPortReference.h`

Reference of an input port

**Properties** (2):
  - `enabled_flag`: `bool` — [Read-Write] Optional flag for port references that can be enabled or disabled (bool)
  - `port_guid`: `Guid` — [Read-Write] Unique identifier shared with port config and port instance.
Note: This needs be Bluepr...

### `unreal.DMXOutputPortConfig`
Inherits: `StructBase` | Header: `DMXOutputPortConfig.h`

Blueprint Configuration of a Port, used in DXM Settings to specify inputs and outputs.

**Properties** (16):
  - `auto_complete_device_address`: `str` [Read-Only] — [Read-Only] Searches available Network Interface Card IP Addresses and uses the first match as the â...
  - `auto_complete_device_address_enabled`: `bool` [Read-Only] — [Read-Only] Enables âAuto Complete Device Addressâ, hidden via customization - EditConditionInli...
  - `communication_type`: `DMXCommunicationType` — [Read-Write] The type of communication used with this port (DMXCommunicationType)
  - `delay`: `float` [Read-Only] — [Read-Only] The amout by which sending of packets is delayed (double)
  - `delay_frame_rate`: `FrameRate` [Read-Only] — [Read-Only] Framerate of the delay (FrameRate)
  - `destination_address`: `str` — [Read-Write] For Unicast, the IP address outbound DMX is sent to
deprecated: DestinationAddress is d...
  - `destination_addresses`: `None` [Read-Only] — [Read-Only] For Unicast, the IP addresses outbound DMX is sent to (Array[DMXOutputPortDestinationAdd...
  - `device_address`: `str` [Read-Only] — [Read-Only] The IP address of the network interface card over which outbound DMX is sent (str)
  - `extern_universe_start`: `int` [Read-Only] — [Read-Only] Remaps the range of local Universes (Num Universes from Local Universe Start) to a diffe...
  - `local_universe_start`: `int` [Read-Only] — [Read-Only] Local Start Universe (int32)
  - `loopback_to_engine`: `bool` [Read-Only] — [Read-Only] If true, the signals output from this port are input into to the engine. Note, signals i...
  - `num_universes`: `int` [Read-Only] — [Read-Only] Number of Universes (int32)
  - `port_guid`: `Guid` [Read-Only] — [Read-Only] Unique identifier, shared with the port instance.
Note: This needs be BlueprintReadWrite...
  - `port_name`: `str` [Read-Only] — [Read-Only] The name displayed wherever the port can be displayed (str)
  - `priority`: `int` [Read-Only] — [Read-Only] Priority on which packets are being sent (int32)
  - `protocol_name`: `Name` [Read-Only] — [Read-Only] DMX Protocol (Name)

### `unreal.DMXOutputPortDestinationAddress`
Inherits: `StructBase` | Header: `DMXOutputPortConfig.h`

The IP address outbound DMX is sent to

**Properties** (1):
  - `destination_address_string`: `str` [Read-Only] — [Read-Only] The IP address outbound DMX is sent to (str)

### `unreal.DMXOutputPortReference`
Inherits: `StructBase` | Header: `DMXOutputPortReference.h`

Reference of an input port

**Properties** (2):
  - `enabled_flag`: `bool` — [Read-Write] Optional flag for port references that can be enabled or disabled (bool)
  - `port_guid`: `Guid` — [Read-Write] Unique identifier shared with port config and port instance.
Note: This needs be Bluepr...

### `unreal.DMXProtocolName`
Inherits: `StructBase` | Header: `DMXProtocolTypes.h`

A DMX protocol as a name that can be displayed in UI. The protocol is directly accessible via GetProtocol

### `unreal.DMXAttributeNameConversions`
Inherits: `BlueprintFunctionLibrary` | Header: `DMXAttribute.h`

DMXAttribute Name Conversions

**Methods** (2):
  - `conv_dmx_attribute_to_name(attribute)` -> `Name` [classmethod] — Conv DMXAttribute to Name
  - `conv_dmx_attribute_to_string(attribute)` -> `str` [classmethod] — Conv DMXAttribute to String

### `unreal.DMXNameContainersConversions`
Inherits: `BlueprintFunctionLibrary` | Header: `DMXProtocolTypes.h`

DMXName Containers Conversions

**Methods** (4):
  - `conv_dmx_fixture_category_to_name(fixture_category)` -> `Name` [classmethod] — Conv DMXFixture Category to Name
  - `conv_dmx_fixture_category_to_string(fixture_category)` -> `str` [classmethod] — Conv DMXFixture Category to String
  - `conv_dmx_protocol_name_to_name(protocol_name)` -> `Name` [classmethod] — Conv DMXProtocol Name to Name
  - `conv_dmx_protocol_name_to_string(protocol_name)` -> `str` [classmethod] — Conv DMXProtocol Name to String

### `unreal.DMXRuntimeLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `DMXProtocolBlueprintLibrary.h`

DMXProtocol Blueprint Library

**Methods** (9):
  - `get_local_dmx_network_interface_card_i_ps()` -> `Array [ str ]` [classmethod] — Returns the IP addresses of the network interface cards available to the system.
  - `is_receive_dmx_enabled()` -> `bool` [classmethod] — Returns whether Receive DMX from the network is enabled globally.
  - `is_send_dmx_enabled()` -> `bool` [classmethod] — Returns whether send DMX to the network is enabled globally.
  - `set_dmx_input_port_device_address(input_port, device_address)` -> `None` [classmethod] — Sets the Device Address of the Output Port. For networking Protocols thatâs the IP Adress of the network interface car...
  - `set_dmx_output_port_destination_address(output_port, destination_address)` -> `None` [classmethod] — Set DMXOutput Port Destination Address deprecated: Deprecated 5.0. Output Ports now support many Destination Addresses. ...
  - `set_dmx_output_port_destination_addresses(output_port, destination_addresses)` -> `None` [classmethod] — Sets the Destination Address Address of the Output Port. For networking Protocols thatâs the Unicast IP Adress. Not re...
  - `set_dmx_output_port_device_address(output_port, device_address)` -> `None` [classmethod] — Sets the Device Address of the Output Port. For networking Protocols thatâs the IP Adress of the network interface car...
  - `set_receive_dmx_enabled(receive_dmx_enabled = True, affect_editor = False)` -> `None` [classmethod] — Sets if DMX is received from the network
  - `set_send_dmx_enabled(send_dmx_enabled = True, affect_editor = False)` -> `None` [classmethod] — Sets if DMX is sent to the network

### `unreal.DMXCommunicationType`
Inherits: `EnumBase` | Header: `DMXProtocolTypes.h`

Type of network communication

**Properties** (4):
  - `BROADCAST`: `DMXCommunicationType = Ellipsis` — 0
  - `INTERNAL_ONLY`: `DMXCommunicationType = Ellipsis` — 3
  - `MULTICAST`: `DMXCommunicationType = Ellipsis` — 2
  - `UNICAST`: `DMXCommunicationType = Ellipsis` — 1

### `unreal.DMXFixtureSignalFormat`
Inherits: `EnumBase` | Header: `DMXProtocolTypes.h`

EDMXFixture Signal Format

**Properties** (4):
  - `E16_BIT`: `DMXFixtureSignalFormat = Ellipsis` — 0 to 65.535 1 Uses 2 channels (bytes). Range
  - `E24_BIT`: `DMXFixtureSignalFormat = Ellipsis` — 0 to 16.777.215 2 Uses 3 channels (bytes). Range
  - `E32_BIT`: `DMXFixtureSignalFormat = Ellipsis` — 0 to 4.294.967.295 3 Uses 4 channels (bytes). Range
  - `E8_BIT`: `DMXFixtureSignalFormat = Ellipsis` — 0 to 255 0 Uses 1 channel (byte). Range

### `unreal.DMXPortPriorityStrategy`
Inherits: `EnumBase` | Header: `DMXInputPortConfig.h`

Strategy for priority system (when receiving packets)

**Properties** (6):
  - `EQUAL`: `DMXPortPriorityStrategy = Ellipsis` — Manage the packet only if the priority is equal to the specified value 1
  - `HIGHER_THAN`: `DMXPortPriorityStrategy = Ellipsis` — Manage the packet only if the priority is higher than the specified value 2
  - `HIGHEST`: `DMXPortPriorityStrategy = Ellipsis` — Manage the packet only if it matches the highest received priority 4
  - `LOWER_THAN`: `DMXPortPriorityStrategy = Ellipsis` — Manage the packet only if the priority is lower than the specified value 3
  - `LOWEST`: `DMXPortPriorityStrategy = Ellipsis` — Manage the packet only if it matches the lowest received priority 5
  - `NONE`: `DMXPortPriorityStrategy = Ellipsis` — Always manage the packet 0

### `unreal.DMXSendResult`
Inherits: `EnumBase` | Header: `DMXProtocolTypes.h`

Result when sending a DMX packet

**Properties** (6):
  - `ERROR_ENQUEUE_PACKAGE`: `DMXSendResult = Ellipsis` — 4
  - `ERROR_GET_UNIVERSE`: `DMXSendResult = Ellipsis` — 1
  - `ERROR_NO_SENDER_INTERFACE`: `DMXSendResult = Ellipsis` — 5
  - `ERROR_SET_BUFFER`: `DMXSendResult = Ellipsis` — 2
  - `ERROR_SIZE_BUFFER`: `DMXSendResult = Ellipsis` — 3
  - `SUCCESS`: `DMXSendResult = Ellipsis` — 0
