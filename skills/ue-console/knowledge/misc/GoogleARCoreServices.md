# UE Python API — GoogleARCoreServices Module

**6 types** from the `GoogleARCoreServices` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `GoogleARCoreServicesConfig`, `CloudARPin`, `GoogleARCoreServicesFunctionLibrary`, `ARPinCloudMode`, `ARPinCloudTaskResult`, `CloudARPinCloudState`

---

## Classes

### `unreal.GoogleARCoreServicesConfig`
Inherits: `StructBase` | Header: `GoogleARCoreServicesTypes.h`

ingroup: GoogleARCoreServices A struct describes the configuration in GoogleARCore Services

**Properties** (1):
  - `ar_pin_cloud_mode`: `ARPinCloudMode` — [Read-Write] Whether enabling ARPin hosting/resolving in GoogleARCoreServices. (ARPinCloudMode)

### `unreal.CloudARPin`
Inherits: `ARPin` | Header: `GoogleARCoreServicesTypes.h`

A CloudARPin will be created when you host an existing ARPin, or resolved a previous hosted CloudARPin. It is a subclass of UARPin so all functions on UARPin works on CloudARPin, besides that you can ...

**Methods** (2):
  - `get_ar_pin_cloud_state()` -> `CloudARPinCloudState` — Gets the current cloud state of this CloudARPin. Note that the cloud state will only be updated once per frame.
  - `get_cloud_id()` -> `str` — Gets the CloudID of this CloudARPin.

### `unreal.GoogleARCoreServicesFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `GoogleARCoreServicesFunctionLibrary.h`

A function library that provides static/Blueprint functions for Google ARCore Services.

**Methods** (7):
  - `config_google_ar_core_services(service_config)` -> `bool` [classmethod] — Configure the current Unreal AR session with the desired GoogleARCoreServices configuration. If there is an running AR s...
  - `create_and_host_cloud_ar_pin(ar_pin_to_host, out_task_result=ARPinCloudTaskResult)` [classmethod] — Creating and hosting a CloudARPin and return it immediately. Note that this function only start the hosting process. Cal...
  - `create_and_host_cloud_ar_pin_latent_action(world_context_object, latent_info, ar_pin_to_host, out_cloud_ar_pin=CloudARPin)` [classmethod] — This will start a Latent Action to host the ARPin and creating a UCloudARPin from it. The complete flow of this Latent A...
  - `create_and_resolve_cloud_ar_pin(out_task_result=ARPinCloudTaskResult)` [classmethod] — Creating and Resolving a CloudARPin and return it immediately. Note that this function only start the acquiring process....
  - `create_and_resolve_cloud_ar_pin_latent_action(world_context_object, latent_info, out_cloud_ar_pin=CloudARPin)` [classmethod] — This will start a Latent Action to create UCloudARPin using the given CloudId. The complete flow of this Latent Action w...
  - `get_all_cloud_ar_pin()` -> `Array [ CloudARPin ]` [classmethod] — Get a list of all CloudARPin in the current ARSession.
  - `remove_cloud_ar_pin(pin_to_remove)` -> `None` [classmethod] — Remove the given CloudARPin from the current ARSession.

### `unreal.ARPinCloudMode`
Inherits: `EnumBase` | Header: `GoogleARCoreServicesTypes.h`

ingroup: GoogleARCoreServices This is an enum that can be set in a FGoogleARCoreServicesConfig to enable/disable cloud ARPin. When EARPinCloudMode is Enabled, ARCoreServices will provides functionalit...

**Properties** (2):
  - `DISABLED`: `ARPinCloudMode = Ellipsis` — 0
  - `ENABLED`: `ARPinCloudMode = Ellipsis` — 1

### `unreal.ARPinCloudTaskResult`
Inherits: `EnumBase` | Header: `GoogleARCoreServicesTypes.h`

ingroup: GoogleARCoreServices A enum describes the CloudARPin task result.

**Properties** (8):
  - `CLOUD_AR_PIN_NOT_ENABLED`: `ARPinCloudTaskResult = Ellipsis` — CloudARPin hosting/resolving failed because ARPin hosting isnât enabled. 3
  - `FAILED`: `ARPinCloudTaskResult = Ellipsis` — CloudARPin hosting/resolving is failed. Check the CloudARPin cloud state for details why it failed.
...
  - `INVALID_PIN`: `ARPinCloudTaskResult = Ellipsis` — CloudARPin hosting failed because the input ARPin is invalid. 6
  - `NOT_TRACKING`: `ARPinCloudTaskResult = Ellipsis` — CloudARPin hosting/resolving failed because ARPin is not in Tracking State. 4
  - `RESOURCE_EXHAUSTED`: `ARPinCloudTaskResult = Ellipsis` — CloudARPin hosting failed because a new CloudARPin couldnât be created in ARSystem due to
resource...
  - `SESSION_PAUSED`: `ARPinCloudTaskResult = Ellipsis` — CloudARPin hosting/resolving failed because there is no valid ARSession or the session is paused. 5
  - `STARTED`: `ARPinCloudTaskResult = Ellipsis` — CloudARPin hosting/resolving is started successfully.
Only used the non-latent UGoogleARCoreServices...
  - `SUCCESS`: `ARPinCloudTaskResult = Ellipsis` — CloudARPin hosting/resolving task is successfully completed.
Only used the latent action UGoogleARCo...

### `unreal.CloudARPinCloudState`
Inherits: `EnumBase` | Header: `GoogleARCoreServicesTypes.h`

ingroup: GoogleARCoreServices A enum describes the cloud state of a CloudARPin.

**Properties** (13):
  - `CANCELLED`: `CloudARPinCloudState = Ellipsis` — A hosting/resolving task has been cancelled.  This CloudARPin would not be cloud hosted.
NOTE: this ...
  - `ERROR_HOSTING_DATASET_PROCESSING_FAILED`: `CloudARPinCloudState = Ellipsis` — Hosting failed, because the server could not successfully process the
dataset for the given anchor. ...
  - `ERROR_INTERNAL_ERROR`: `CloudARPinCloudState = Ellipsis` — A hosting/resolving task for this CloudARPin finished with an internal error.
This error is hard to ...
  - `ERROR_LOCALIZATION_FAILURE`: `CloudARPinCloudState = Ellipsis` — The server could not localize the device for the requested Cloud ID. This
means that the ARPin was n...
  - `ERROR_NOT_AUTHORIZED`: `CloudARPinCloudState = Ellipsis` — The app cannot communicate with the Google AR Cloud Service because of a
bad/invalid/nonexistent API...
  - `ERROR_RESOLVING_CLOUD_ID_NOT_FOUND`: `CloudARPinCloudState = Ellipsis` — Resolving failed, because the AR Cloud Service could not find the
provided cloud anchor ID. 10
  - `ERROR_RESOURCE_EXHAUSTED`: `CloudARPinCloudState = Ellipsis` — The application has exhausted the request quota allotted to the given API
key. The developer should ...
  - `ERROR_SDK_VERSION_TOO_NEW`: `CloudARPinCloudState = Ellipsis` — The CloudARPin could not be acquired because the SDK used to host the CloudARPin
was older than the ...
  - `ERROR_SDK_VERSION_TOO_OLD`: `CloudARPinCloudState = Ellipsis` — The CloudARPin could not be resolved because the SDK used to host the CloudARPin
was newer than the ...
  - `ERROR_SERVICE_UNAVAILABLE`: `CloudARPinCloudState = Ellipsis` — The Google AR Cloud Service was unreachable. This can happen because of a
number of reasons. The req...
  - `IN_PROGRESS`: `CloudARPinCloudState = Ellipsis` — A hosting/resolving task for the CloudARPin has been scheduled.
Once the task completes in the backg...
  - `NOT_HOSTED`: `CloudARPinCloudState = Ellipsis` — The CloudARPin just got created and the background task for hosting/resolving the CloudARPin
hasnâ...
  - `SUCCESS`: `CloudARPinCloudState = Ellipsis` — A hosting/resolving task for this CloudARPin completed successfully. 3
