# UE Python API — GooglePAD Module

**6 types** from the `GooglePAD` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `GooglePADFunctionLibrary`, `GooglePADCellularDataConfirmStatus`, `GooglePADConfirmationDialogStatus`, `GooglePADDownloadStatus`, `GooglePADErrorCode`, `GooglePADStorageMethod`

---

## Classes

### `unreal.GooglePADFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `GooglePADFunctionLibrary.h`

Google PADFunction Library

**Methods** (17):
  - `cancel_download(asset_packs)` -> `GooglePADErrorCode` [classmethod] — Cancel download of a set of asset packs
  - `get_asset_pack_location(location=int32)` [classmethod] — Get location handle of requested asset pack (release when done)
  - `get_assets_path(location)` -> `str` [classmethod] — Get asset path from from location
  - `get_bytes_downloaded(state)` -> `int32` [classmethod] — Get the number of bytes downloaded from a download state
  - `get_download_state(state=int32)` [classmethod] — Get download state handle of an asset pack (release when done)
  - `get_download_status(state)` -> `GooglePADDownloadStatus` [classmethod] — Get download status from a download state
  - `get_show_cellular_data_confirmation_status(status=GooglePADCellularDataConfirmStatus)` [classmethod] — Get status of cellular confirmation dialog (DEPRECIATED)
  - `get_show_confirmation_dialog_status(status=GooglePADConfirmationDialogStatus)` [classmethod] — Gets the status of confirmation dialog requests
  - `get_storage_method(location)` -> `GooglePADStorageMethod` [classmethod] — Get storage method from location
  - `get_total_bytes_to_download(state)` -> `int32` [classmethod] — Get the total number of bytes to download from a download state
  - `release_asset_pack_location(location)` -> `None` [classmethod] — Release location resources
  - `release_download_state(state)` -> `None` [classmethod] — Release download state resources
  - `request_download(asset_packs)` -> `GooglePADErrorCode` [classmethod] — Request download of a set of asset packs
  - `request_info(asset_packs)` -> `GooglePADErrorCode` [classmethod] — Request information about a set of asset packs
  - `request_removal(name)` -> `GooglePADErrorCode` [classmethod] — Request removal of an asset pack
  - `show_cellular_data_confirmation()` -> `GooglePADErrorCode` [classmethod] — Show confirmation dialog requesting data download over cellular network (DEPRECIATED)
  - `show_confirmation_dialog()` -> `GooglePADErrorCode` [classmethod] — Show confirmation dialog to start all asset pack downloads in either REQUIRES_USER_CONFIRMATION or WAITING_FOR_WIFI stat...

### `unreal.GooglePADCellularDataConfirmStatus`
Inherits: `EnumBase` | Header: `GooglePADFunctionLibrary.h`

The status associated with a request to display a cellular data confirmation dialog.

**Properties** (4):
  - `ASSET_PACK_CONFIRM_PENDING`: `GooglePADCellularDataConfirmStatus = Ellipsis` — AssetPackManager_showCellularDataConfirmation() has been called, but the user hasnât made a choice...
  - `ASSET_PACK_CONFIRM_UNKNOWN`: `GooglePADCellularDataConfirmStatus = Ellipsis` — AssetPackManager_showCellularDataConfirmation() has not been called. 0
  - `ASSET_PACK_CONFIRM_USER_APPROVED`: `GooglePADCellularDataConfirmStatus = Ellipsis` — The user approved of downloading Asset Packs over cellular data. 2
  - `ASSET_PACK_CONFIRM_USER_CANCELED`: `GooglePADCellularDataConfirmStatus = Ellipsis` — The user declined to download Asset Packs over cellular data. 3

### `unreal.GooglePADConfirmationDialogStatus`
Inherits: `EnumBase` | Header: `GooglePADFunctionLibrary.h`

The status associated with a request to display a confirmation dialog.

**Properties** (4):
  - `ASSET_PACK_CONFIRMATION_DIALOG_APPROVED`: `GooglePADConfirmationDialogStatus = Ellipsis` — The user approved of downloading asset packs. 2
  - `ASSET_PACK_CONFIRMATION_DIALOG_CANCELED`: `GooglePADConfirmationDialogStatus = Ellipsis` — The user declined to download asset packs. 3
  - `ASSET_PACK_CONFIRMATION_DIALOG_PENDING`: `GooglePADConfirmationDialogStatus = Ellipsis` — AssetPackManager_showConfirmationDialog() has been called, but the user hasnât made a choice. 1
  - `ASSET_PACK_CONFIRMATION_DIALOG_UNKNOWN`: `GooglePADConfirmationDialogStatus = Ellipsis` — AssetPackManager_showConfirmationDialog() has not been called. 0

### `unreal.GooglePADDownloadStatus`
Inherits: `EnumBase` | Header: `GooglePADFunctionLibrary.h`

The status associated with Asset Pack download operations.

**Properties** (14):
  - `ASSET_PACK_DOWNLOADING`: `GooglePADDownloadStatus = Ellipsis` — The Asset Pack download is in progress. 2
  - `ASSET_PACK_DOWNLOAD_CANCELED`: `GooglePADDownloadStatus = Ellipsis` — Asset Pack download has been canceled. 6
  - `ASSET_PACK_DOWNLOAD_COMPLETED`: `GooglePADDownloadStatus = Ellipsis` — Download and transfer are complete; the assets are available to the app. 4
  - `ASSET_PACK_DOWNLOAD_FAILED`: `GooglePADDownloadStatus = Ellipsis` — An AssetPackManager_requestDownload() has failed. 5
  - `ASSET_PACK_DOWNLOAD_PENDING`: `GooglePADDownloadStatus = Ellipsis` — An AssetPackManager_requestDownload() async request is pending. 1
  - `ASSET_PACK_INFO_FAILED`: `GooglePADDownloadStatus = Ellipsis` — An AssetPackManager_requestInfo() async request has failed. 10
  - `ASSET_PACK_INFO_PENDING`: `GooglePADDownloadStatus = Ellipsis` — An AssetPackManager_requestInfo() async request started, but the result isnât known yet. 9
  - `ASSET_PACK_NOT_INSTALLED`: `GooglePADDownloadStatus = Ellipsis` — The Asset Pack isnât installed. 8
  - `ASSET_PACK_REMOVAL_FAILED`: `GooglePADDownloadStatus = Ellipsis` — An AssetPackManager_requestRemoval() async request has failed. 12
  - `ASSET_PACK_REMOVAL_PENDING`: `GooglePADDownloadStatus = Ellipsis` — An AssetPackManager_requestRemoval() async request started. 11
  - `ASSET_PACK_REQUIRES_USER_CONFIRMATION`: `GooglePADDownloadStatus = Ellipsis` — The Asset Pack download is waiting for user confirmation to proceed. 13
  - `ASSET_PACK_TRANSFERRING`: `GooglePADDownloadStatus = Ellipsis` — The Asset Pack is being transferred to the app. 3
  - `ASSET_PACK_UNKNOWN`: `GooglePADDownloadStatus = Ellipsis` — Nothing is known about the Asset Pack. 0
  - `ASSET_PACK_WAITING_FOR_WIFI`: `GooglePADDownloadStatus = Ellipsis` — The Asset Pack download is waiting for Wi-Fi to proceed. 7

### `unreal.GooglePADErrorCode`
Inherits: `EnumBase` | Header: `GooglePADFunctionLibrary.h`

An error code associated with Asset Pack operations.

**Properties** (17):
  - `ASSET_PACK_ACCESS_DENIED`: `GooglePADErrorCode = Ellipsis` — Download not permitted under current device circumstances, e.g. app in
background or device not sign...
  - `ASSET_PACK_API_NOT_AVAILABLE`: `GooglePADErrorCode = Ellipsis` — The Asset Pack API is unavailable. 5
  - `ASSET_PACK_APP_NOT_OWNED`: `GooglePADErrorCode = Ellipsis` — The app isnât owned by any user on this device. An app is âownedâ if it has been acquired from...
  - `ASSET_PACK_APP_UNAVAILABLE`: `GooglePADErrorCode = Ellipsis` — The requesting app is unavailable. 1
  - `ASSET_PACK_CONFIRMATION_NOT_REQUIRED`: `GooglePADErrorCode = Ellipsis` — Returned if showConfirmationDialog is called but no asset packs are waiting for user confirmation. 1...
  - `ASSET_PACK_DOWNLOAD_NOT_FOUND`: `GooglePADErrorCode = Ellipsis` — The requested download isnât found. 4
  - `ASSET_PACK_INITIALIZATION_FAILED`: `GooglePADErrorCode = Ellipsis` — There was an error initializing the Asset Pack API. 13
  - `ASSET_PACK_INITIALIZATION_NEEDED`: `GooglePADErrorCode = Ellipsis` — need to call AssetPackManager_init() first. 12 The requested operation failed
  - `ASSET_PACK_INSUFFICIENT_STORAGE`: `GooglePADErrorCode = Ellipsis` — Asset Packs download failed due to insufficient storage. 8
  - `ASSET_PACK_INTERNAL_ERROR`: `GooglePADErrorCode = Ellipsis` — Unknown error downloading Asset Pack. 11
  - `ASSET_PACK_INVALID_REQUEST`: `GooglePADErrorCode = Ellipsis` — The request is invalid. 3
  - `ASSET_PACK_NETWORK_ERROR`: `GooglePADErrorCode = Ellipsis` — Network error. Unable to obtain Asset Pack details. 6
  - `ASSET_PACK_NETWORK_UNRESTRICTED`: `GooglePADErrorCode = Ellipsis` — Returned if showCellularDataConfirmation is called but no Asset Packs are waiting for Wi-Fi. 10
  - `ASSET_PACK_NO_ERROR`: `GooglePADErrorCode = Ellipsis` — There was no error with the request. 0
  - `ASSET_PACK_PLAY_STORE_NOT_FOUND`: `GooglePADErrorCode = Ellipsis` — The Play Store app is either not installed or not the official version. 9
  - `ASSET_PACK_UNAVAILABLE`: `GooglePADErrorCode = Ellipsis` — The requested Asset Pack isnât available for this app version. 2
  - `ASSET_PACK_UNRECOGNIZED_INSTALLATION`: `GooglePADErrorCode = Ellipsis` — Returned if the app was not installed by Play. 16

### `unreal.GooglePADStorageMethod`
Inherits: `EnumBase` | Header: `GooglePADFunctionLibrary.h`

The method used to store an Asset Pack on the device.

**Properties** (4):
  - `ASSET_PACK_STORAGE_APK`: `GooglePADStorageMethod = Ellipsis` — The Asset Pack is installed as an APK containing packed asset files. Assets can be accessed via AAss...
  - `ASSET_PACK_STORAGE_FILES`: `GooglePADStorageMethod = Ellipsis` — The Asset Pack is unpacked into a folder containing individual asset files. Assets can be accessed v...
  - `ASSET_PACK_STORAGE_NOT_INSTALLED`: `GooglePADStorageMethod = Ellipsis` — The Asset Pack is not installed. 3
  - `ASSET_PACK_STORAGE_UNKNOWN`: `GooglePADStorageMethod = Ellipsis` — Nothing is known, perhaps due to an error. 2
