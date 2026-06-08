# UE Python API — NiagaraShader Module

**3 types** from the `NiagaraShader` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `NiagaraScriptBase`, `NiagaraMipMapGenerationType`, `OnNiagaraScriptCompilationComplete`

---

## Classes

### `unreal.NiagaraScriptBase`
Inherits: `Object` | Header: `NiagaraScriptBase.h`

Niagara Script Base

### `unreal.NiagaraMipMapGenerationType`
Inherits: `EnumBase` | Header: `NiagaraGenerateMips.h`

ENiagara Mip Map Generation Type

**Properties** (6):
  - `BLUR1`: `NiagaraMipMapGenerationType = Ellipsis` — A blur filter across a 3x3 (or 3x3x3) region of texels. 2
  - `BLUR2`: `NiagaraMipMapGenerationType = Ellipsis` — A blur filter across a 5x5 (or 5x5x5) region of texels. 3
  - `BLUR3`: `NiagaraMipMapGenerationType = Ellipsis` — A blur filter across a 7x7 (or 7x7x7) region of texels. 4
  - `BLUR4`: `NiagaraMipMapGenerationType = Ellipsis` — A blur filter across a 9x9 (or 9x9x9) region of texels. 5
  - `LINEAR`: `NiagaraMipMapGenerationType = Ellipsis` — Linear blending is performed between a 2x2 (or 2x2x2) region of texels, aka Bilinear / Trilinear. 1
  - `UNFILTERED`: `NiagaraMipMapGenerationType = Ellipsis` — Result is taken from whatever texel the sample lies on, aka Point Sampling. 0

### `unreal.OnNiagaraScriptCompilationComplete`
Inherits: `MulticastDelegateBase` | Header: `NiagaraShared.h`

On Niagara Script Compilation Complete Delegate Signature
