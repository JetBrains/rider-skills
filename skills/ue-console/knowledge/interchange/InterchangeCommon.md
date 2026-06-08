# UE Python API — InterchangeCommon Module

**6 types** from the `InterchangeCommon` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `InterchangeMaterialXBSDF`, `InterchangeMaterialXEDF`, `InterchangeMaterialXShaders`, `InterchangeMaterialXVDF`, `InterchangeSparseVolumeTextureFormat`, `InterchangeUsdPrimvar`

---

## Classes

### `unreal.InterchangeMaterialXBSDF`
Inherits: `EnumBase` | Header: `InterchangeMaterialXDefinitions.h`

Data type representing a Bidirectional Scattering Distribution Function.

**Properties** (9):
  - `BURLEY_DIFFUSE`: `InterchangeMaterialXBSDF = Ellipsis` — A BSDF node for Burley diffuse reflections. 1
  - `CONDUCTOR`: `InterchangeMaterialXBSDF = Ellipsis` — A reflection BSDF node based on a microfacet model and a Fresnel curve for conductors/metals. 4
  - `DIELECTRIC`: `InterchangeMaterialXBSDF = Ellipsis` — A reflection/transmission BSDF node based on a microfacet model and a Fresnel curve for dielectrics....
  - `GENERALIZED_SCHLICK`: `InterchangeMaterialXBSDF = Ellipsis` — A reflection/transmission BSDF node based on a microfacet model and a generalized Schlick Fresnel cu...
  - `OREN_NAYAR_DIFFUSE`: `InterchangeMaterialXBSDF = Ellipsis` — A BSDF node for diffuse reflections. 0
  - `SHEEN`: `InterchangeMaterialXBSDF = Ellipsis` — A microfacet BSDF for the back-scattering properties of cloth-like materials. 7
  - `SUBSURFACE`: `InterchangeMaterialXBSDF = Ellipsis` — A subsurface scattering BSDF for true subsurface scattering. 6
  - `THIN_FILM`: `InterchangeMaterialXBSDF = Ellipsis` — Adds an iridescent thin film layer over a microfacet base BSDF. 8
  - `TRANSLUCENT`: `InterchangeMaterialXBSDF = Ellipsis` — A BSDF node for pure diffuse transmission. 2

### `unreal.InterchangeMaterialXEDF`
Inherits: `EnumBase` | Header: `InterchangeMaterialXDefinitions.h`

Data type representing an Emission Distribution Function.

**Properties** (3):
  - `CONICAL`: `InterchangeMaterialXEDF = Ellipsis` — Constructs an EDF emitting light inside a cone around the normal direction. 1
  - `MEASURED`: `InterchangeMaterialXEDF = Ellipsis` — Constructs an EDF emitting light according to a measured IES light profile. 2
  - `UNIFORM`: `InterchangeMaterialXEDF = Ellipsis` — An EDF node for uniform emission. 0

### `unreal.InterchangeMaterialXShaders`
Inherits: `EnumBase` | Header: `InterchangeMaterialXDefinitions.h`

EInterchange Material XShaders

**Properties** (8):
  - `DISPLACEMENT`: `InterchangeMaterialXShaders = Ellipsis` — Shader used for displacement. 7
  - `OPEN_PBR_SURFACE`: `InterchangeMaterialXShaders = Ellipsis` — Default settings for Open PBR Surface shader. 0
  - `OPEN_PBR_SURFACE_TRANSMISSION`: `InterchangeMaterialXShaders = Ellipsis` — Open PBR Surface shader        used for translucency. 1
  - `STANDARD_SURFACE`: `InterchangeMaterialXShaders = Ellipsis` — Default settings for Autodeskâs Standard Surface shader. 2
  - `STANDARD_SURFACE_TRANSMISSION`: `InterchangeMaterialXShaders = Ellipsis` — Standard Surface shader used for translucency. 3
  - `SURFACE`: `InterchangeMaterialXShaders = Ellipsis` — A surface shader constructed from scattering and emission distribution functions. 6
  - `SURFACE_UNLIT`: `InterchangeMaterialXShaders = Ellipsis` — Shader used for unlit surfaces. 4
  - `USD_PREVIEW_SURFACE`: `InterchangeMaterialXShaders = Ellipsis` — Default settings for USDâs Surface shader. 5

### `unreal.InterchangeMaterialXVDF`
Inherits: `EnumBase` | Header: `InterchangeMaterialXDefinitions.h`

Data type representing a Volume Distribution Function.

**Properties** (2):
  - `ABSORPTION`: `InterchangeMaterialXVDF = Ellipsis` — Constructs a VDF for pure light absorption. 0
  - `ANISOTROPIC`: `InterchangeMaterialXVDF = Ellipsis` — Constructs a VDF scattering light for a participating medium, based on the Henyey-Greenstein phase f...

### `unreal.InterchangeSparseVolumeTextureFormat`
Inherits: `EnumBase` | Header: `InterchangeVolumeDefinitions.h`

EInterchange Sparse Volume Texture Format

**Properties** (3):
  - `FLOAT16`: `InterchangeSparseVolumeTextureFormat = Ellipsis` — 1
  - `FLOAT32`: `InterchangeSparseVolumeTextureFormat = Ellipsis` — 2
  - `UNORM8`: `InterchangeSparseVolumeTextureFormat = Ellipsis` — 0

### `unreal.InterchangeUsdPrimvar`
Inherits: `EnumBase` | Header: `InterchangeUsdDefinitions.h`

EInterchange Usd Primvar

**Properties** (3):
  - `ALL`: `InterchangeUsdPrimvar = Ellipsis` — Store all primvars in the MeshDescription, regardless 2
  - `BAKE`: `InterchangeUsdPrimvar = Ellipsis` — Store only primvars in the Mesh Description used for baking to textures (basically <geompropvalue> n...
  - `STANDARD`: `InterchangeUsdPrimvar = Ellipsis` — Store only the standard primvars such as UVs, VertexColors, etc. 0
