# UE Python API — InterchangeDNA Module

**3 types** from the `InterchangeDNA` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `MeshVertexColorData`, `DNAMeshVertexColorDataAsset`, `MetaHumanInterchangeDnaTranslator`

---

## Classes

### `unreal.MeshVertexColorData`
Inherits: `StructBase` | Header: `MetaHumanDNAImportColorMap.h`

Mesh Vertex Color Data

**Properties** (2):
  - `colors`: `None` — [Read-Write] (Array[LinearColor])
  - `mesh_name`: `str` — [Read-Write] (str)

### `unreal.DNAMeshVertexColorDataAsset`
Inherits: `DataAsset` | Header: `MetaHumanDNAImportColorMap.h`

DNAMesh Vertex Color Data Asset

**Methods** (1):
  - `get_color_by_mesh_and_index(mesh_name, vertex_id)` -> `LinearColor` — Get Color by Mesh and Index

**Properties** (1):
  - `mesh_color_entries`: `None` — [Read-Write] (Array[MeshVertexColorData])

### `unreal.MetaHumanInterchangeDnaTranslator`
Inherits: `InterchangeTranslatorBase` | Header: `MetaHumanInterchangeDnaTranslator.h`

MetaHuman Interchange Dna Translator
