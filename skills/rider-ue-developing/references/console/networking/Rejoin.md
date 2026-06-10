# UE Python API — Rejoin Module

**1 types** from the `Rejoin` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `RejoinStatus`

---

## Classes

### `unreal.RejoinStatus`
Inherits: `EnumBase` | Header: `RejoinCheck.h`

Possible states that a rejoin check can be in at any given time

**Properties** (5):
  - `NEEDS_RECHECK`: `RejoinStatus = Ellipsis` — We need to recheck the state before allowing any further progress through the UI (e.g right after lo...
  - `NO_MATCH_TO_REJOIN`: `RejoinStatus = Ellipsis` — There is no match to rejoin.  The user is already in a match or there is no match in progress for th...
  - `NO_MATCH_TO_REJOIN_MATCH_ENDED`: `RejoinStatus = Ellipsis` — Match ended normally, no check required (only set when returning from a match) 4
  - `REJOIN_AVAILABLE`: `RejoinStatus = Ellipsis` — There is a rejoin available for the user 1
  - `UPDATING_STATUS`: `RejoinStatus = Ellipsis` — We are currently updating the status of rejoin 2
