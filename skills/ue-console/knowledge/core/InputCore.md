# UE Python API — InputCore Module

**3 types** from the `InputCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `Key`, `ControllerHand`, `TouchIndex`

---

## Classes

### `unreal.Key`
Inherits: `StructBase` | Header: `InputCoreTypes.h`

### `unreal.ControllerHand`
Inherits: `EnumBase` | Header: `InputCoreTypes.h`

Defines the controller hands for tracking. Could be expanded, as needed, to facilitate non-handheld controllers

**Properties** (18):
  - `ANY_HAND`: `ControllerHand = Ellipsis` — 2
  - `CHEST`: `ControllerHand = Ellipsis` — 7
  - `EXTERNAL_CAMERA`: `ControllerHand = Ellipsis` — 4
  - `GUN`: `ControllerHand = Ellipsis` — 5
  - `HMD`: `ControllerHand = Ellipsis` — 6
  - `LEFT`: `ControllerHand = Ellipsis` — 0
  - `LEFT_ELBOW`: `ControllerHand = Ellipsis` — 10
  - `LEFT_FOOT`: `ControllerHand = Ellipsis` — 15
  - `LEFT_KNEE`: `ControllerHand = Ellipsis` — 13
  - `LEFT_SHOULDER`: `ControllerHand = Ellipsis` — 8
  - `PAD`: `ControllerHand = Ellipsis` — 3
  - `RIGHT`: `ControllerHand = Ellipsis` — 1
  - `RIGHT_ELBOW`: `ControllerHand = Ellipsis` — 11
  - `RIGHT_FOOT`: `ControllerHand = Ellipsis` — 16
  - `RIGHT_KNEE`: `ControllerHand = Ellipsis` — 14
  - `RIGHT_SHOULDER`: `ControllerHand = Ellipsis` — 9
  - `SPECIAL`: `ControllerHand = Ellipsis` — 17
  - `WAIST`: `ControllerHand = Ellipsis` — 12

### `unreal.TouchIndex`
Inherits: `EnumBase` | Header: `InputCoreTypes.h`

The number of entries in ETouchIndex must match the number of touch keys defined in EKeys and NUM_TOUCH_KEYS above

**Properties** (10):
  - `TOUCH1`: `TouchIndex = Ellipsis` — 0
  - `TOUCH10`: `TouchIndex = Ellipsis` — 9
  - `TOUCH2`: `TouchIndex = Ellipsis` — 1
  - `TOUCH3`: `TouchIndex = Ellipsis` — 2
  - `TOUCH4`: `TouchIndex = Ellipsis` — 3
  - `TOUCH5`: `TouchIndex = Ellipsis` — 4
  - `TOUCH6`: `TouchIndex = Ellipsis` — 5
  - `TOUCH7`: `TouchIndex = Ellipsis` — 6
  - `TOUCH8`: `TouchIndex = Ellipsis` — 7
  - `TOUCH9`: `TouchIndex = Ellipsis` — 8
