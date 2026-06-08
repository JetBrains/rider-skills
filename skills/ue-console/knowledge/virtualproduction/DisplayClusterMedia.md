# UE Python API — DisplayClusterMedia Module

**4 types** from the `DisplayClusterMedia` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DisplayClusterMediaOutputSynchronizationPolicyEthernetBarrier`, `DisplayClusterMediaOutputSynchronizationPolicyEthernetBarrierBase`, `DisplayClusterMediaOutputSynchronizationPolicyThresholdBase`, `DisplayClusterMediaOutputSynchronizationPolicyVblank`

---

## Classes

### `unreal.DisplayClusterMediaOutputSynchronizationPolicyEthernetBarrier`
Inherits: `DisplayClusterMediaOutputSynchronizationPolicyEthernetBarrierBase` | Header: `DisplayClusterMediaOutputSynchronizationPolicyEthernetBarrier.h`

EthernetBarrier media synchronization policy implementation

### `unreal.DisplayClusterMediaOutputSynchronizationPolicyEthernetBarrierBase`
Inherits: `DisplayClusterMediaOutputSynchronizationPolicy` | Header: `DisplayClusterMediaOutputSynchronizationPolicyEthernetBarrierBase.h`

Base class for Ethernet barrier based media synchronization policies. It encapsulates network barriers related settings.

**Properties** (1):
  - `barrier_timeout_ms`: `int` — [Read-Write] Barrier timeout (ms) (int32)

### `unreal.DisplayClusterMediaOutputSynchronizationPolicyThresholdBase`
Inherits: `DisplayClusterMediaOutputSynchronizationPolicyEthernetBarrierBase` | Header: `DisplayClusterMediaOutputSynchronizationPolicyThresholdBase.h`

Base class for threshold based media synchronization policies. Basically it uses the same approach that we use in âEthernetâ sync policy where v-blanks are used as the timepoints.

**Properties** (1):
  - `margin_ms`: `int` — [Read-Write] Synchronization margin (ms) (int32)

### `unreal.DisplayClusterMediaOutputSynchronizationPolicyVblank`
Inherits: `DisplayClusterMediaOutputSynchronizationPolicyThresholdBase` | Header: `DisplayClusterMediaOutputSynchronizationPolicyVblank.h`

Vblank media synchronization policy config
