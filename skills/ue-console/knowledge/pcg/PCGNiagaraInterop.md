# UE Python API — PCGNiagaraInterop Module

**1 types** from the `PCGNiagaraInterop` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `PCGWriteToNiagaraDataChannelSettings`

---

## Classes

### `unreal.PCGWriteToNiagaraDataChannelSettings`
Inherits: `PCGSettings` | Header: `PCGWriteToNiagaraDataChannel.h`

Allow writing attributes to a Niagara Data Channel.

**Properties** (6):
  - `data_channel`: `NiagaraDataChannelAsset` — [Read-Write] (NiagaraDataChannelAsset)
  - `niagara_variables_pcg_attribute_mapping`: `None` — [Read-Write] (Map[Name,PCGAttributePropertyInputSelector])
  - `synchronous_load`: `bool` — [Read-Write] (bool)
  - `visible_to_cpu`: `bool` — [Read-Write] Data written to this data channel is visible to Niagara CPU emitters (bool)
  - `visible_to_game`: `bool` — [Read-Write] Data written to this data channel is visible to Blueprint and C++ logic reading from it...
  - `visible_to_gpu`: `bool` — [Read-Write] Data written to this data channel is visible to Niagara GPU emitters (bool)
