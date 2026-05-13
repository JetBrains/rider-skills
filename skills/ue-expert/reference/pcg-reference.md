# PCG Framework Reference

## Core Classes Hierarchy

```
UObject
├── UPCGData
│   ├── UPCGSpatialData
│   │   ├── UPCGPointData          — Point cloud (primary data type)
│   │   ├── UPCGSurfaceData        — Surface/landscape data
│   │   ├── UPCGVolumeData         — 3D volume data
│   │   ├── UPCGPolyLineData       — Spline/polyline data
│   │   ├── UPCGLandscapeData      — Landscape heightfield
│   │   ├── UPCGPrimitiveData      — Mesh primitive data
│   │   └── UPCGTextureData        — Texture-sourced data
│   └── UPCGParamData              — Parameter/attribute data
├── UPCGSettings (via UPCGSettingsInterface)
│   ├── UPCGSurfaceSamplerSettings
│   ├── UPCGVolumeSamplerSettings
│   ├── UPCGSplineSamplerSettings
│   ├── UPCGDensityFilterSettings
│   ├── UPCGSelfPruningSettings
│   ├── UPCGTransformPointsSettings
│   ├── UPCGStaticMeshSpawnerSettings
│   ├── UPCGActorSpawnerSettings
│   ├── UPCGSpatialNoiseSettings
│   ├── UPCGNormalToDensitySettings
│   ├── UPCGPointFilterSettings
│   ├── UPCGBoundsFilterSettings
│   ├── UPCGDifferenceSettings
│   ├── UPCGUnionSettings
│   ├── UPCGProjectionSettings
│   ├── UPCGCopyPointsSettings
│   ├── UPCGAttributePartitionSettings
│   ├── UPCGAttributeOperationSettings
│   ├── UPCGCreateAttributeSettings
│   ├── UPCGMatchAndSetAttributesSettings
│   ├── UPCGSubgraphSettings
│   ├── UPCGLoopSubgraphSettings
│   ├── UPCGGetActorPropertySettings
│   ├── UPCGGetLandscapeSettings
│   ├── UPCGGetSplineSettings
│   └── [your custom UPCGSettings subclass]
├── UPCGGraph                      — Graph asset (node container)
├── UPCGGraphInstance              — Instance of a graph
├── UPCGComponent                  — Actor component triggering generation
├── UPCGBlueprintElement           — Blueprint custom node base
└── UPCGNode                       — Node within a graph
```

## FPCGPoint — Point Data Structure

```cpp
struct FPCGPoint
{
    FTransform Transform;       // Position, Rotation, Scale
    float Density;              // 0.0 - 1.0, probability/weight
    int32 Seed;                 // Deterministic randomness seed
    FVector BoundsMin;          // Local-space bounds (min)
    FVector BoundsMax;          // Local-space bounds (max)
    FVector4 Color;             // RGBA for debug viz / data passing
    float Steepness;            // Surface slope value
    // + Custom metadata attributes via PCG attribute system
};
```

## EPCGDataType — Pin Type Compatibility

```cpp
enum class EPCGDataType : uint32
{
    None           = 0,
    Point          = 1 << 1,    // Point cloud data
    Spatial        = 1 << 2,    // Any spatial data (includes Point)
    PolyLine       = 1 << 3,    // Spline/polyline
    Surface        = 1 << 4,    // Surface (landscape, mesh)
    Landscape      = 1 << 5,    // Landscape specifically
    Texture        = 1 << 6,    // Texture data
    Volume         = 1 << 7,    // 3D volume
    Primitive      = 1 << 8,    // Mesh primitive
    Concrete       = ...,       // Concrete types (non-abstract)
    Any            = ~0u,       // Accepts any type
    // Commonly used combinations:
    // Spatial | Point — accepts both spatial and point data
};
```

## FPCGPinProperties — Defining Node Pins

```cpp
struct FPCGPinProperties
{
    FName Label;                        // Pin display name
    EPCGDataType AllowedTypes;          // What data types this pin accepts
    bool bAllowMultipleData = true;     // Multiple connections allowed
    bool bAllowMultipleConnections = true;
    // ...
};

// Common pin labels:
PCGPinConstants::DefaultInputLabel   // "In"
PCGPinConstants::DefaultOutputLabel  // "Out"
```

## FPCGContext — Execution Context

```cpp
struct FPCGContext
{
    FPCGDataCollection InputData;    // All input data by pin
    FPCGDataCollection OutputData;   // Write output data here

    // Helper methods:
    UPCGComponent* GetComponent();
    UPCGSettings* GetSettings();
    AActor* GetTargetActor(UPCGSpatialData*);
    int64 GetTaskId();

    // Input access pattern:
    TArray<FPCGTaggedData> Inputs = InputData.GetInputsByPin(PinLabel);
    // Each FPCGTaggedData has: .Data (UPCGData*), .Pin (FName), .Tags (TArray<FString>)
};
```

## FPCGDataCollection — Input/Output Container

```cpp
struct FPCGDataCollection
{
    TArray<FPCGTaggedData> TaggedData;

    // Query methods:
    TArray<FPCGTaggedData> GetInputsByPin(FName PinLabel);
    TArray<FPCGTaggedData> GetInputs();      // All inputs
    TArray<FPCGTaggedData> GetInputsByTag(FString Tag);

    // Adding output:
    TaggedData.Add(FPCGTaggedData{OutputData, PinLabel, Tags});
};
```

## UPCGComponent — Generation Controller

Key properties:
- `PCGGraph` (UPCGGraph*) — the graph to execute
- `Seed` (int32) — root seed for deterministic generation
- `bIsPartitioned` — enable World Partition integration
- `bUseHierarchicalGeneration` — enable hierarchical generation
- `GenerationTrigger` — OnLoad, Manual, or Runtime

Key methods:
- `GeneratePCG()` — trigger generation
- `CleanupPCG()` — remove all generated content
- `ResetLastGeneratedBounds()` — reset bounds tracking
- `GetGeneratedActors()` — get spawned actors

## PCG Attribute System

Points carry metadata via the attribute system:

```cpp
// Reading attributes in custom nodes:
const UPCGMetadata* Metadata = PointData->Metadata;
FPCGMetadataAttributeBase* Attr = Metadata->GetAttribute(AttributeName);

// Typed access:
FPCGMetadataAttribute<float>* FloatAttr = static_cast<FPCGMetadataAttribute<float>*>(Attr);
float Value = FloatAttr->GetValue(PointIndex);

// Writing attributes:
UPCGMetadata* OutMetadata = OutPointData->MutableMetadata();
OutMetadata->CreateFloatAttribute(Name, DefaultValue, bAllowInterpolation);
```

Common built-in attributes:
- `$Density` — point density (0-1)
- `$Position` — world position (FVector)
- `$Rotation` — rotation (FQuat)
- `$Scale` — scale (FVector)
- `$BoundsMin` / `$BoundsMax` — local bounds
- `$Color` — point color (FVector4)
- `$Steepness` — surface slope

## Generation Modes

### Standard (Non-Partitioned)
- All generation runs in one pass on the PCG Component's actor
- Good for small areas, prototyping, and simple setups
- All generated content is owned by the PCG actor

### Partitioned
- Enable `bIsPartitioned` on PCG Component
- PCG creates `APCGPartitionActor` per grid cell
- Grid size configurable on the component
- Content streams with World Partition cells
- Required for large open worlds

### Hierarchical
- Enable `bUseHierarchicalGeneration`
- Containers can nest — parent-child generation
- Coarse-to-fine: large features generate first, details within sub-cells
- Mirrors level instance hierarchy

### Runtime
- Set `GenerationTrigger` to Runtime
- Generates during gameplay (CPU-intensive)
- Use sparingly — pre-generation is always preferred

## Python API (via ue-scripter)

```python
import unreal

# Create/find PCG component
actor = unreal.EditorLevelLibrary.spawn_actor_from_class(
    unreal.PCGVolume, unreal.Vector(0, 0, 0))
pcg_comp = actor.get_component_by_class(unreal.PCGComponent)

# Assign graph
graph = unreal.load_asset('/Game/PCG/MyGraph')
pcg_comp.set_editor_property('graph', graph)

# Set seed
pcg_comp.set_editor_property('seed', 42)

# Trigger generation
pcg_comp.generate()

# Clean up generated content
pcg_comp.cleanup()

# Check partition settings
pcg_comp.set_editor_property('is_partitioned', True)
```

## Useful Console Commands

| Command | Purpose |
|---------|---------|
| `stat PCG` | PCG performance statistics |
| `pcg.ShowDebug 1` | Enable PCG debug visualization |
| `pcg.Graph.Regenerate` | Force regenerate all PCG in level |
| `pcg.Component.ForceRefresh` | Force refresh specific component |
