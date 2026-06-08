# UE Python API — Hotfix Module

**3 types** from the `Hotfix` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `OnlineHotfixManager`, `UpdateCompletionStatus`, `UpdateState`

---

## Classes

### `unreal.OnlineHotfixManager`
Inherits: `Object` | Header: `OnlineHotfixManager.h`

This class manages the downloading and application of hotfix data Hotfix data is a set of non-executable files downloaded and applied to the game. The base implementation knows how to handle INI, PAK,...

**Methods** (1):
  - `start_hotfix_process()` -> `None` — Starts the fetching of hotfix data from the OnlineTitleFileInterface that is registered for this game

### `unreal.UpdateCompletionStatus`
Inherits: `EnumBase` | Header: `UpdateManager.h`

Possible outcomes at the end of an update check

**Properties** (9):
  - `UPDATE_FAILURE_HOTFIX_CHECK`: `UpdateCompletionStatus = Ellipsis` — Update failed in the hotfix check 7
  - `UPDATE_FAILURE_NOT_LOGGED_IN`: `UpdateCompletionStatus = Ellipsis` — Update failed due to not being logged in 8
  - `UPDATE_FAILURE_PATCH_CHECK`: `UpdateCompletionStatus = Ellipsis` — Update failed in the patch check 6
  - `UPDATE_SUCCESS`: `UpdateCompletionStatus = Ellipsis` — Update completed successfully, some changes applied 1
  - `UPDATE_SUCCESS_NEEDS_PATCH`: `UpdateCompletionStatus = Ellipsis` — Update completed successfully, a patch must be download to continue 5
  - `UPDATE_SUCCESS_NEEDS_RELAUNCH`: `UpdateCompletionStatus = Ellipsis` — Update completed successfully, need to relaunch the game 4
  - `UPDATE_SUCCESS_NEEDS_RELOAD`: `UpdateCompletionStatus = Ellipsis` — Update completed successfully, need to reload the map 3
  - `UPDATE_SUCCESS_NO_CHANGE`: `UpdateCompletionStatus = Ellipsis` — Update completed successfully, no changed needed 2
  - `UPDATE_UNKNOWN`: `UpdateCompletionStatus = Ellipsis` — Unknown update completion 0

### `unreal.UpdateState`
Inherits: `EnumBase` | Header: `UpdateManager.h`

Various states the update manager flows through as it checks for patches/hotfixes

**Properties** (7):
  - `CHECKING_FOR_HOTFIX`: `UpdateState = Ellipsis` — Checking with hotfix for available updates 3
  - `CHECKING_FOR_PATCH`: `UpdateState = Ellipsis` — Checking for an available patch 2
  - `INITIAL_LOAD_COMPLETE`: `UpdateState = Ellipsis` — Preloading complete 5
  - `UPDATE_COMPLETE`: `UpdateState = Ellipsis` — Last update check completed successfully 6
  - `UPDATE_IDLE`: `UpdateState = Ellipsis` — No updates in progress 0
  - `UPDATE_PENDING`: `UpdateState = Ellipsis` — An update is waiting to be triggered at the right time 1
  - `WAITING_ON_INITIAL_LOAD`: `UpdateState = Ellipsis` — Waiting for the async loading / preloading to complete 4
