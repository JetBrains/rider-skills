# UE Python API — OnlineSubsystem Module

**3 types** from the `OnlineSubsystem` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `TurnBasedMatchInterface`, `InAppPurchaseState`, `MPMatchOutcome`

---

## Classes

### `unreal.TurnBasedMatchInterface`
Inherits: `Interface` | Header: `TurnBasedMatchInterface.h`

Turn Based Match Interface

**Methods** (2):
  - `on_match_ended(match)` -> `None` — On Match Ended
  - `on_match_received_turn(match, did_become_active)` -> `None` — On Match Received Turn

### `unreal.InAppPurchaseState`
Inherits: `EnumBase` | Header: `OnlineStoreInterfaceV2.h`

Possible result states of an in-app purchase transaction

**Properties** (8):
  - `ALREADY_OWNED`: `InAppPurchaseState = Ellipsis` — 7
  - `CANCELLED`: `InAppPurchaseState = Ellipsis` — 3
  - `FAILED`: `InAppPurchaseState = Ellipsis` — 2
  - `INVALID`: `InAppPurchaseState = Ellipsis` — 4
  - `NOT_ALLOWED`: `InAppPurchaseState = Ellipsis` — 5
  - `RESTORED`: `InAppPurchaseState = Ellipsis` — 6
  - `SUCCESS`: `InAppPurchaseState = Ellipsis` — 1
  - `UNKNOWN`: `InAppPurchaseState = Ellipsis` — 0

### `unreal.MPMatchOutcome`
Inherits: `EnumBase` | Header: `OnlineTurnBasedInterface.h`

EMPMatchOutcome represents all the possible outcomes for this player in a match

**Properties** (10):
  - `FIRST`: `MPMatchOutcome = Ellipsis` — 6
  - `FOURTH`: `MPMatchOutcome = Ellipsis` — 9
  - `LOST`: `MPMatchOutcome = Ellipsis` — 3
  - `NONE`: `MPMatchOutcome = Ellipsis` — 0
  - `QUIT`: `MPMatchOutcome = Ellipsis` — 1
  - `SECOND`: `MPMatchOutcome = Ellipsis` — 7
  - `THIRD`: `MPMatchOutcome = Ellipsis` — 8
  - `TIED`: `MPMatchOutcome = Ellipsis` — 4
  - `TIME_EXPIRED`: `MPMatchOutcome = Ellipsis` — 5
  - `WON`: `MPMatchOutcome = Ellipsis` — 2
