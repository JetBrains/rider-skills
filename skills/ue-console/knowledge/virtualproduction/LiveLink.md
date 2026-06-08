# UE Python API — LiveLink Module

**16 types** from the `LiveLink` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ProviderPollResult`, `LiveLinkAnimationAxisSwitchPreProcessor`, `LiveLinkBlueprintLibrary`, `LiveLinkBlueprintVirtualSubject`, `LiveLinkComponent`, `LiveLinkCustomTimeStep`, `LiveLinkDrivenComponent`, `LiveLinkLocatorAxisSwitchPreProcessor`, `LiveLinkMessageBusFinder`, `LiveLinkPreset`, `LiveLinkTimecodeProvider`, `LiveLinkTransformAxisSwitchPreProcessor`, `LiveLinkTransformDeadbandPreProcessor`, `LiveLinkAxis`, `LiveLinkTimecodeProviderEvaluationType`, `LiveLinkTickSignature`

---

## Classes

### `unreal.ProviderPollResult`
Inherits: `StructBase` | Header: `LiveLinkMessageBusFinder.h`

Provider Poll Result

**Properties** (3):
  - `is_valid_provider`: `bool` [Read-Only] — [Read-Only] Whether the provider is valid (compatible with the current version of LiveLink) (bool)
  - `machine_name`: `str` [Read-Only] — [Read-Only] The name of the machine the provider is running on (str)
  - `name`: `str` [Read-Only] — [Read-Only] The name of the provider (str)

### `unreal.LiveLinkAnimationAxisSwitchPreProcessor`
Inherits: `LiveLinkTransformAxisSwitchPreProcessor` | Header: `LiveLinkAxisSwitchPreProcessor.h`

Allows to switch any axis of an incoming animation with another axis. note: For example the Z-Axis of an incoming transform can be set to the (optionally negated) Y-Axis of the transform in UE. note: ...

### `unreal.LiveLinkBlueprintLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `LiveLinkBlueprintLibrary.h`

Live Link Blueprint Library

**Methods** (35):
  - `child_count(live_link_transform=LiveLinkTransform)` [classmethod] — Returns the number of Children for a given LiveLink Transform
  - `component_space_transform(transform=Transform)` [classmethod] — Returns the Transform value in Root Space for a given LiveLink Transform
  - `get_animation_frame_data(subject_frame_handle)` -> `(subject_frame_handle=SubjectFrameHandle, animation_frame_data=LiveLinkAnimationFrameData) or None` [classmethod] — Returns the Subjectâs frame data stored in the Subject Frame. Returns false if no valid data found.
  - `get_animation_static_data(subject_frame_handle)` -> `(subject_frame_handle=SubjectFrameHandle, animation_static_data=LiveLinkSkeletonStaticData) or None` [classmethod] — Returns the Subjectâs static data stored in the Subject Frame. Returns false if no valid data found.
  - `get_basic_data(basic_blueprint_data=LiveLinkBasicBlueprintData)` [classmethod] — Returns the Subject base structure stored in the Subject Frame
  - `get_children()` [classmethod] — Returns an array of Child LiveLink Transforms for a given LiveLink Transform
  - `get_curves()` [classmethod] — Returns the float curves stored in the Subject Frame as a map
  - `get_live_link_enabled_subject_names(include_virtual_subject)` -> `Array [ LiveLinkSubjectName ]` [classmethod] — Get a list of all enabled subject names
  - `get_live_link_subject_role(subject_name)` [classmethod] — Get the role of the subject with this name
  - `get_live_link_subject_state(subject_name)` -> `LiveLinkSubjectState` [classmethod] — Returns the state of the subject with the given name.
  - `get_live_link_subjects(include_disabled_subject, include_virtual_subject)` -> `Array [ LiveLinkSubjectKey ]` [classmethod] — Get a list of all subjects
  - `get_metadata(metadata=SubjectMetadata)` [classmethod] — Returns the Subject Metadata structure stored in the Subject Frame
  - `get_parent(parent=LiveLinkTransform)` [classmethod] — Returns the Parent LiveLink Transform if one exists or an Identity transform if no parent exists
  - `get_property_value(basic_data, property_name)` -> `(basic_data=LiveLinkBasicBlueprintData, value=float) or None` [classmethod] — Returns the value of a property stored in the Subject Frame
  - `get_root_transform(live_link_transform=LiveLinkTransform)` [classmethod] — Returns the Root Transform for the Subject Frame as a LiveLink Transform or the Identity if there are no transforms.
  - `get_source_machine_name(source_handle=LiveLinkSourceHandle)` [classmethod] — Get the machine name of a LiveLink Source via its handle
  - `get_source_status(source_handle=LiveLinkSourceHandle)` [classmethod] — Get the text status of a LiveLink Source via its handle
  - `get_source_type(source_handle=LiveLinkSourceHandle)` [classmethod] — Get the type of a LiveLink Source via its handle
  - `get_source_type_from_guid(source_guid)` -> `Text` [classmethod] — Get the type of a source from the given GUID
  - `get_specific_live_link_subject_role(subject_key)` [classmethod] — Get the role of a subject from a specific source
  - `get_transform_by_index(subject_frame_handle, live_link_transform=LiveLinkTransform)` [classmethod] — Returns the LiveLink Transform stored in a Subject Frame at a given index. Returns an Identity transform if Transform In...
  - `get_transform_by_name(subject_frame_handle, live_link_transform=LiveLinkTransform)` [classmethod] — Returns the LiveLink Transform stored in a Subject Frame with a given name. Returns an Identity transform if Transform N...
  - `has_parent(live_link_transform)` -> `LiveLinkTransform or None` [classmethod] — Returns whether a given LiveLink Transform has a parent transform
  - `is_live_link_subject_enabled(subject_name)` -> `bool` [classmethod] — Whether or not the client has a subject with this name enabled Only 1 subject with the same name can be enabled. At the ...
  - `is_source_still_valid(source_handle)` -> `LiveLinkSourceHandle or None` [classmethod] — Checks whether the LiveLink Source is valid via its handle
  - `is_specific_live_link_subject_enabled(subject_key, for_this_frame)` -> `bool` [classmethod] — Whether or not a subject from the specific source is the enabled subject. Only 1 subject with the same name can be enabl...
  - `number_of_transforms(subject_frame_handle=SubjectFrameHandle)` [classmethod] — Returns the number of Transforms stored in the Subject Frame
  - `parent_bone_space_transform(transform=Transform)` [classmethod] — Returns the Transform value in Parent Space for a given LiveLink Transform
  - `pause_subject(subject_name)` -> `None` [classmethod] — Pause a subject, freezing its evaluation to the last data it received.
  - `remove_source(source_handle)` -> `LiveLinkSourceHandle or None` [classmethod] — Requests the given LiveLink Source to shut down via its handle
  - `request_shutdown(source_handle: LiveLinkSourceHandle)` -> `LiveLinkSourceHandle | None` [classmethod] — deprecated: ârequest_shutdownâ was renamed to âremove_sourceâ.
  - `set_live_link_subject_enabled(subject_key, enabled)` -> `None` [classmethod] — Set the subjectâs from a specific source to enabled, disabling the other in the process. Only 1 subject with the same ...
  - `transform_name(name=Name)` [classmethod] — Returns the Name of a given LiveLink Transform
  - `transform_names()` [classmethod] — Returns an array of Transform Names stored in the Subject Frame
  - `unpause_subject(subject_name)` -> `None` [classmethod] — Unpause a subject, resuming its normal operation.

### `unreal.LiveLinkBlueprintVirtualSubject`
Inherits: `LiveLinkVirtualSubject` | Header: `LiveLinkBlueprintVirtualSubject.h`

Base class for creating virtual subjects in Blueprints

**Methods** (2):
  - `on_initialize()` -> `None` — On Initialize
  - `on_update()` -> `None` — On Update

### `unreal.LiveLinkComponent`
Inherits: `ActorComponent` | Header: `LiveLinkComponent.h`

An actor component to enable accessing LiveLink data in Blueprints. Data can be accessed in Editor through the âOnLiveLinkUpdatedâ event. Any Skeletal Mesh Components on the parent will be set to ...

**Properties** (1):
  - `on_live_link_updated`: `LiveLinkTickSignature` — [Read-Write] This Event is triggered any time new LiveLink data is available, including in the edito...

### `unreal.LiveLinkCustomTimeStep`
Inherits: `GenlockedCustomTimeStep` | Header: `LiveLinkCustomTimeStep.h`

Control the Engine TimeStep via a live link source

### `unreal.LiveLinkDrivenComponent`
Inherits: `ActorComponent` | Header: `LiveLinkDrivenComponent.h`

A component that applies data from Live Link to the owning actor

### `unreal.LiveLinkLocatorAxisSwitchPreProcessor`
Inherits: `LiveLinkTransformAxisSwitchPreProcessor` | Header: `LiveLinkAxisSwitchPreProcessor.h`

Allows to switch any axis of an incoming locator subject with another axis. note: For example the Z-Axis of an incoming transform can be set to the (optionally negated) Y-Axis of the transform in UE. ...

### `unreal.LiveLinkMessageBusFinder`
Inherits: `Object` | Header: `LiveLinkMessageBusFinder.h`

Asset for finding available Message Bus Sources.

**Methods** (3):
  - `connect_to_provider(source_handle=LiveLinkSourceHandle)` [classmethod]
  - `construct_message_bus_finder()` -> `LiveLinkMessageBusFinder` [classmethod]
  - `get_available_providers(world_context_object, latent_info, duration = 0.200000)` -> `Array [ ProviderPollResult ]`

### `unreal.LiveLinkPreset`
Inherits: `Object` | Header: `LiveLinkPreset.h`

Live Link Preset

**Methods** (4):
  - `add_to_client(recreate_presets = True)` -> `bool` — Add the sources and subjects from this preset, but leave any existing sources and subjects connected.
  - `apply_to_client()` -> `bool` — Apply to Client
  - `apply_to_client_latent(world_context_object, latent_info)` -> `None` — Remove all previous sources and subjects and add the sources and subjects from this preset.
  - `build_from_client()` -> `None` — Reset this preset and build the list of sources and subjects from the client.

### `unreal.LiveLinkTimecodeProvider`
Inherits: `TimecodeProvider` | Header: `LiveLinkTimecodeProvider.h`

Fetch the latest frames from the LiveLink subject and create a Timecode from it.

### `unreal.LiveLinkTransformAxisSwitchPreProcessor`
Inherits: `LiveLinkFramePreProcessor` | Header: `LiveLinkAxisSwitchPreProcessor.h`

Allows to switch any axis of an incoming transform with another axis. note: For example the Z-Axis of an incoming transform can be set to the (optionally negated) Y-Axis of the transform in UE. note: ...

**Properties** (9):
  - `axis_x`: `LiveLinkAxis` — âaxis_xâ was renamed to âorientation_axis_xâ. deprecated
  - `axis_y`: `LiveLinkAxis` — âaxis_yâ was renamed to âorientation_axis_yâ. deprecated
  - `axis_z`: `LiveLinkAxis` — âaxis_zâ was renamed to âorientation_axis_zâ. deprecated
  - `orientation_axis_x`: `LiveLinkAxis` — [Read-Write]
deprecated: Use FrontAxis, RightAxis, UpAxis instead (LiveLinkAxis)
  - `orientation_axis_y`: `LiveLinkAxis` — [Read-Write]
deprecated: Use FrontAxis, RightAxis, UpAxis instead (LiveLinkAxis)
  - `orientation_axis_z`: `LiveLinkAxis` — [Read-Write]
deprecated: Use FrontAxis, RightAxis, UpAxis instead (LiveLinkAxis)
  - `translation_axis_x`: `LiveLinkAxis` — [Read-Write]
deprecated: Use FrontAxis, RightAxis, UpAxis instead (LiveLinkAxis)
  - `translation_axis_y`: `LiveLinkAxis` — [Read-Write]
deprecated: Use FrontAxis, RightAxis, UpAxis instead (LiveLinkAxis)
  - `translation_axis_z`: `LiveLinkAxis` — [Read-Write]
deprecated: Use FrontAxis, RightAxis, UpAxis instead (LiveLinkAxis)

### `unreal.LiveLinkTransformDeadbandPreProcessor`
Inherits: `LiveLinkFramePreProcessor` | Header: `LiveLinkDeadbandPreProcessor.h`

Implements a deadband filter that gets applied to the transform, with independent thresholds for rotation and translation.

### `unreal.LiveLinkAxis`
Inherits: `EnumBase` | Header: `LiveLinkAxisSwitchPreProcessor.h`

DO NOT modify the order or values of these enums - the code relies on the order and values and will fail if itâs changed

**Properties** (6):
  - `X`: `LiveLinkAxis = Ellipsis` — 0
  - `X_NEG`: `LiveLinkAxis = Ellipsis` — 3
  - `Y`: `LiveLinkAxis = Ellipsis` — 1
  - `Y_NEG`: `LiveLinkAxis = Ellipsis` — 4
  - `Z`: `LiveLinkAxis = Ellipsis` — 2
  - `Z_NEG`: `LiveLinkAxis = Ellipsis` — 5

### `unreal.LiveLinkTimecodeProviderEvaluationType`
Inherits: `EnumBase` | Header: `LiveLinkTimecodeProvider.h`

ELive Link Timecode Provider Evaluation Type

**Properties** (3):
  - `LATEST`: `LiveLinkTimecodeProviderEvaluationType = Ellipsis` — Use the newest frame that was received. 2
  - `LERP`: `LiveLinkTimecodeProviderEvaluationType = Ellipsis` — Interpolate between, or extrapolate using the 2 frames that are the closest to the current world tim...
  - `NEAREST`: `LiveLinkTimecodeProviderEvaluationType = Ellipsis` — Use the frame that is closest to the current world time. 1

### `unreal.LiveLinkTickSignature`
Inherits: `MulticastDelegateBase` | Header: `LiveLinkComponent.h`

Live Link Tick Signature Delegate Signature
