# UE Python API — LiveLinkPrestonMDR Module

**4 types** from the `LiveLinkPrestonMDR` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `LiveLinkPrestonMDRBlueprintData`, `LiveLinkPrestonMDRFrameData`, `LiveLinkPrestonMDRStaticData`, `LiveLinkPrestonMDRRole`

---

## Classes

### `unreal.LiveLinkPrestonMDRBlueprintData`
Inherits: `LiveLinkBaseBlueprintData` | Header: `LiveLinkPrestonMDRTypes.h`

Facility structure to handle Preston MDR data in blueprint

**Properties** (2):
  - `frame_data`: `LiveLinkPrestonMDRFrameData` — [Read-Write] Dynamic data that can change every frame (LiveLinkPrestonMDRFrameData)
  - `static_data`: `LiveLinkPrestonMDRStaticData` — [Read-Write] Static data that should not change every frame (LiveLinkPrestonMDRStaticData)

### `unreal.LiveLinkPrestonMDRFrameData`
Inherits: `LiveLinkCameraFrameData` | Header: `LiveLinkPrestonMDRTypes.h`

Struct for dynamic (per-frame) Preston MDR data

### `unreal.LiveLinkPrestonMDRStaticData`
Inherits: `LiveLinkCameraStaticData` | Header: `LiveLinkPrestonMDRTypes.h`

Struct for static Preston MDR data

### `unreal.LiveLinkPrestonMDRRole`
Inherits: `LiveLinkCameraRole` | Header: `LiveLinkPrestonMDRRole.h`

Role associated with Preston MDR data
