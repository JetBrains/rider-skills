# UE Python API — MobilePatchingUtils Module

**7 types** from the `MobilePatchingUtils` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MobileInstalledContent`, `MobilePatchingLibrary`, `MobilePendingContent`, `OnContentInstallFailed`, `OnContentInstallSucceeded`, `OnRequestContentFailed`, `OnRequestContentSucceeded`

---

## Classes

### `unreal.MobileInstalledContent`
Inherits: `Object` | Header: `MobilePatchingLibrary.h`

Mobile Installed Content

**Methods** (3):
  - `get_disk_free_space()` -> `float` — Get the disk free space in megabytes where content is installed
  - `get_installed_content_size()` -> `float` — Get the installed content size in megabytes
  - `mount(pak_order=1, mount_point)` -> `bool` — Mount installed content

### `unreal.MobilePatchingLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `MobilePatchingLibrary.h`

Mobile Patching Library

**Methods** (5):
  - `get_active_device_profile_name()` -> `str` [classmethod] — Get the name of currently selected device profile name
  - `get_installed_content(install_directory)` -> `MobileInstalledContent` [classmethod] — Get the installed content. Will return non-null object if there is an installed content at specified directory User can ...
  - `get_supported_platform_names()` -> `Array [ str ]` [classmethod] — Get the list of supported platform names on this device. Example: Android_ETC2, Android_ASTC
  - `has_active_wi_fi_connection()` -> `bool` [classmethod] — Whether WiFi connection is currently available
  - `request_content(remote_manifest_url, cloud_url, install_directory, on_succeeded, on_failed)` -> `None` [classmethod] — Attempt to download manifest file using specified manifest URL. On success it will return an object that represents remo...

### `unreal.MobilePendingContent`
Inherits: `MobileInstalledContent` | Header: `MobilePatchingLibrary.h`

Mobile Pending Content

**Methods** (7):
  - `get_download_size()` -> `float` — Get the total download size for this content installation
  - `get_download_speed()` -> `float` — Get the current download speed in megabytes per second. Valid during installation
  - `get_download_status_text()` -> `Text` — Get Download Status Text
  - `get_install_progress()` -> `float` — Get the current installation progress. Between 0 and 1 for known progress, or less than 0 for unknown progress
  - `get_required_disk_space()` -> `float` — Get the required disk space in megabytes for this content installation
  - `get_total_downloaded_size()` -> `float` — Get the total downloaded size in megabytes. Valid during installation
  - `start_install(on_succeeded, on_failed)` -> `None` — Attempt to download and install remote content. User can choose to mount installed content into the game.

### `unreal.OnContentInstallFailed`
Inherits: `DelegateBase` | Header: `MobilePatchingLibrary.h`

On Content Install Failed Delegate Signature

### `unreal.OnContentInstallSucceeded`
Inherits: `DelegateBase` | Header: `MobilePatchingLibrary.h`

On Content Install Succeeded Delegate Signature

### `unreal.OnRequestContentFailed`
Inherits: `DelegateBase` | Header: `MobilePatchingLibrary.h`

On Request Content Failed Delegate Signature

### `unreal.OnRequestContentSucceeded`
Inherits: `DelegateBase` | Header: `MobilePatchingLibrary.h`

On Request Content Succeeded Delegate Signature
