# UE Python API — OSC Module

**10 types** from the `OSC` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `OSCAddress`, `OSCBundle`, `OSCMessage`, `OSCClient`, `OSCManager`, `OSCServer`, `OSCDispatchMessageEvent`, `OSCDispatchMessageEventBP`, `OSCReceivedBundleEvent`, `OSCReceivedMessageEvent`

---

## Classes

### `unreal.OSCAddress`
Inherits: `StructBase` | Header: `OSCAddress.h`

namespace UE::OSC

### `unreal.OSCBundle`
Inherits: `StructBase` | Header: `OSCBundle.h`

### `unreal.OSCMessage`
Inherits: `StructBase` | Header: `OSCMessage.h`

### `unreal.OSCClient`
Inherits: `Object` | Header: `OSCClient.h`

**Methods** (4):
  - `get_send_ip_address(ip_address, port=int32)` — Gets the OSC Client IP address and port.
  - `send_osc_bundle(bundle)` -> `OSCBundle` — Send OSC Bundle over the network.
  - `send_osc_message(message)` -> `OSCMessage` — Send OSC message to a specific address.
  - `set_send_ip_address(ip_address, port)` -> `bool` — Sets the OSC Client IP address and port. Returns whether address and port was successfully set.

### `unreal.OSCManager`
Inherits: `BlueprintFunctionLibrary` | Header: `OSCManager.h`

**Methods** (51):
  - `add_address(message, message=OSCMessage)` [classmethod] — Adds address (packed as string) value to end of OSCMessage
  - `add_blob(message, message=OSCMessage)` [classmethod] — Adds blob value to end of OSCMessage
  - `add_bool(message, message=OSCMessage)` [classmethod] — Adds boolean value to end of OSCMessage
  - `add_bundle_to_bundle(bundle, out_bundle=OSCBundle)` [classmethod] — Adds bundle packet to bundle.
  - `add_float(message, message=OSCMessage)` [classmethod] — Adds float value to end of OSCMessage
  - `add_int32(message, message=OSCMessage)` [classmethod] — Adds Int32 value to end of OSCMessage
  - `add_int64(message, message=OSCMessage)` [classmethod] — Adds Int64 value to end of OSCMessage
  - `add_message_to_bundle(message, bundle=OSCBundle)` [classmethod] — Adds provided message packet to bundle.
  - `add_string(message, message=OSCMessage, value=str)` [classmethod] — Adds string value to end of OSCMessage
  - `clear_bundle(bundle=OSCBundle)` [classmethod] — Clears provided bundle of all internal messages/bundle packets.
  - `clear_message(message=OSCMessage)` [classmethod] — Clears provided message of all arguments.
  - `clear_osc_address_containers(address=OSCAddress)` [classmethod] — Clears containers of OSC Address provided
  - `convert_string_to_osc_address(string)` -> `OSCAddress` [classmethod] — Converts string to OSC Address
  - `create_osc_client(send_ip_address, port, client_name, outer = None)` -> `OSCClient` [classmethod] — Creates an OSC Client. If SendIPAddress left empty (or â0â) attempts to use LocalHost IP address.
  - `create_osc_server(receive_ip_address, port, multicast_loopback, start_listening, server_name, outer = None)` -> `OSCServer` [classmethod] — Creates an OSC Server. If ReceiveIPAddress left empty (or â0â), attempts to use LocalHost IP address. If StartListen...
  - `find_object_at_osc_address(address)` -> `Object` [classmethod] — Finds an object with the given OSC Address in path form, where containers correspond to path folders and the the address...
  - `get_address(message, index)` -> `OSCAddress or None` [classmethod] — Sets Value to address at provided Index in OSCMessage if in bounds and OSC type matches âStringâ (Does NOT return ad...
  - `get_all_addresses(message)` -> `Array [ OSCAddress ]` [classmethod] — Returns all strings that are valid address paths in order received from OSCMessage (Does NOT include address of message,...
  - `get_all_bools(message)` -> `Array [ bool ]` [classmethod] — Returns all boolean values in order of received from OSCMessage
  - `get_all_floats(message)` -> `Array [ float ]` [classmethod] — Returns all float values in order of received from OSCMessage
  - `get_all_int32s(message)` -> `Array [ int32 ]` [classmethod] — Returns all integer values in order of received from OSCMessage
  - `get_all_int64s(message)` -> `Array [ int64 ]` [classmethod] — Returns all Int64 values in order of received from OSCMessage
  - `get_all_strings(message)` -> `Array [ str ]` [classmethod] — Returns all string values in order of received from OSCMessage
  - `get_blob(message, index)` -> `Array[uint8] or None` [classmethod] — Sets Value to blob at provided Index from OSCMessage if in bounds and type matches
  - `get_bool(message, index)` -> `bool or None` [classmethod] — Sets Value to boolean at provided Index from OSCMessage if in bounds and type matches
  - `get_bundles_from_bundle(bundle)` -> `Array [ OSCBundle ]` [classmethod] — Fills array with child bundles found in bundle.
  - `get_float(message, index)` -> `float or None` [classmethod] — Set Value to float at provided Index in OSCMessage if in bounds and type matches
  - `get_int32(message, index)` -> `int32 or None` [classmethod] — Set Value to integer at provided Index in OSCMessage if in bounds and type matches
  - `get_int64(message, index)` -> `int64 or None` [classmethod] — Set Value to Int64 at provided Index in OSCMessage if in bounds and type matches
  - `get_message_from_bundle(bundle, succeeded=bool)` [classmethod] — Returns message found in bundle at ordered index.
  - `get_messages_from_bundle(bundle)` -> `Array [ OSCMessage ]` [classmethod] — Fills array with messages found in bundle.
  - `get_osc_address_container(address, index)` -> `str` [classmethod] — Returns the OSC Address container at the provided âIndex.â Returns empty string if index is out-of-bounds.
  - `get_osc_address_container_path(address)` -> `str` [classmethod] — Returns full path of OSC address in the form â/Container1/Container2/Methodâ
  - `get_osc_address_containers(address)` -> `Array [ str ]` [classmethod] — Builds referenced array of address of containers in order
  - `get_osc_address_full_path(address)` -> `str` [classmethod] — Returns full path of OSC address in the form â/Container1/Container2â
  - `get_osc_address_method(address)` -> `str` [classmethod] — Returns method name of OSC Address provided
  - `get_osc_message_address(message)` -> `OSCAddress` [classmethod] — Returns copy of messageâs OSC Address
  - `get_string(message, index)` -> `str or None` [classmethod] — Set Value to string at provided Index in OSCMessage if in bounds and type matches
  - `object_path_from_osc_address(address)` -> `str` [classmethod] — Converts OSC Address to an object path.
  - `osc_address_from_object_path(object)` -> `OSCAddress` [classmethod] — Converts object path to OSC Address, converting folders to address containers and the objectâs name to the address met...
  - `osc_address_from_object_path_string(path_name)` -> `OSCAddress` [classmethod] — Converts object path string to OSC Address, converting folders to address containers and the objectâs name to the addr...
  - `osc_address_is_valid_path(address)` -> `bool` [classmethod] — Returns whether OSC Address is valid path
  - `osc_address_is_valid_pattern(address)` -> `bool` [classmethod] — Returns whether OSC Address is valid pattern to match against
  - `osc_address_path_matches_pattern(pattern, path)` -> `bool` [classmethod] — Returns if address pattern matches the provided address path. If passed address is not a valid path, returns false.
  - `osc_address_pop_container(address=OSCAddress)` [classmethod] — Pops container from ordered array of containers. If no containers, returns empty string
  - `osc_address_pop_containers()` [classmethod] — Pops container from ordered array of containers. If NumContainers is greater than or equal to the number of containers i...
  - `osc_address_push_container(address, address=OSCAddress)` [classmethod] — Pushes container onto addressâ ordered array of containers
  - `osc_address_push_containers(address, address=OSCAddress)` [classmethod] — Pushes container onto addressâ ordered array of containers
  - `osc_address_remove_containers(address, index, address=OSCAddress)` [classmethod] — Remove containers from ordered array of containers at index up to count of containers.
  - `set_osc_address_method(address, address=OSCAddress)` [classmethod] — Sets the method name of the OSC Address provided
  - `set_osc_message_address(message, message=OSCMessage)` [classmethod] — Sets the OSC Address of the provided message

### `unreal.OSCServer`
Inherits: `Object` | Header: `OSCServer.h`

**Methods** (24):
  - `add_allowlisted_client(ip_address, ip_port = 0)` -> `None` — Adds client to allowlist of clients to listen for.
  - `add_whitelisted_client(ip_address: str, ip_port: int = 0)` -> `None` — deprecated: âadd_whitelisted_clientâ was renamed to âadd_allowlisted_clientâ.
  - `bind_event_to_on_osc_address_pattern_matches_path(osc_address_pattern, event)` -> `None` — Adds event to dispatch when OSCAddressPattern is matched.
  - `clear_allowlisted_clients()` -> `None` — Clears client allowlist to listen for.
  - `clear_whitelisted_clients()` -> `None` — deprecated: âclear_whitelisted_clientsâ was renamed to âclear_allowlisted_clientsâ.
  - `get_allowlisted_clients(include_port = False)` -> `Set [ str ]` — Returns set of allowlisted endpoint clients as strings with (optional) port included.
  - `get_bound_osc_address_patterns()` -> `Array [ OSCAddress ]` — Returns set of OSCAddressPatterns currently listening for matches to dispatch.
  - `get_ip_address(include_port)` -> `str` — Returns the IP for the server if connected as a string.
  - `get_multicast_loopback()` -> `bool` — Gets whether or not to loopback if ReceiveIPAddress provided is multicast.
  - `get_port()` -> `int32` — Returns the port for the server if connected.
  - `get_whitelisted_clients(include_port: bool = False)` -> `None` — deprecated: âget_whitelisted_clientsâ was renamed to âget_allowlisted_clientsâ.
  - `is_active()` -> `bool` — Returns whether server is actively listening to incoming messages.
  - `listen()` -> `None` — Sets the IP address and port to listen for OSC data.
  - `remove_allowlisted_client(ip_address, ip_port = 0)` -> `None` — Removes allowlisted client to listen for.
  - `remove_whitelisted_client(ip_address: str, ip_port: int = 0)` -> `None` — deprecated: âremove_whitelisted_clientâ was renamed to âremove_allowlisted_clientâ.
  - `set_address(receive_ip_address, port)` -> `bool` — Set the address and port of server. Fails if server is currently active.
  - `set_allowlist_clients_enabled(enabled)` -> `None` — When set to true, server will only process received messages from allowlisted clients.
  - `set_multicast_loopback(multicast_loopback)` -> `None` — Set whether or not to loopback if ReceiveIPAddress provided is multicast.
  - `set_tick_in_editor(tick_in_editor)` -> `None` — Set whether server instance can be ticked in-editor (editor only and available to blueprint for use in editor utility sc...
  - `set_whitelist_clients_enabled(enabled: bool)` -> `None` — deprecated: âset_whitelist_clients_enabledâ was renamed to âset_allowlist_clients_enabledâ.
  - `stop()` -> `None` — Stop and tidy up network socket.
  - `unbind_all_events_from_on_osc_address_pattern_matches_path(osc_address_pattern)` -> `None` — Removes OSCAddressPattern from sending dispatch events.
  - `unbind_all_events_from_on_osc_address_pattern_matching()` -> `None` — Removes all events from OSCAddressPatterns to dispatch.
  - `unbind_event_from_on_osc_address_pattern_matches_path(osc_address_pattern, event)` -> `None` — Unbinds specific event from OSCAddress pattern.

**Properties** (2):
  - `on_osc_bundle_received`: `OSCReceivedBundleEvent` — [Read-Write] Event that gets called when an OSC bundle is received. (OSCReceivedBundleEvent)
  - `on_osc_message_received`: `OSCReceivedMessageEvent` — [Read-Write] Event that gets called when an OSC message is received. (OSCReceivedMessageEvent)

### `unreal.OSCDispatchMessageEvent`
Inherits: `MulticastDelegateBase` | Header: `OSCServer.h`

OSCDispatch Message Event Delegate Signature

### `unreal.OSCDispatchMessageEventBP`
Inherits: `DelegateBase` | Header: `OSCServer.h`

OSCDispatch Message Event BP Delegate Signature

### `unreal.OSCReceivedBundleEvent`
Inherits: `MulticastDelegateBase` | Header: `OSCServer.h`

OSCReceived Bundle Event Delegate Signature

### `unreal.OSCReceivedMessageEvent`
Inherits: `MulticastDelegateBase` | Header: `OSCServer.h`

Delegates
