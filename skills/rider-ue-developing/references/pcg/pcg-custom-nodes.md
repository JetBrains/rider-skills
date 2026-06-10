# Creating Custom PCG Nodes

## Prerequisites

### Build.cs
```cpp
// Add to your module's Build.cs:
PrivateDependencyModuleNames.AddRange(new string[] {
    "PCG"
});
```

### Required Headers
```cpp
#include "PCGSettings.h"
#include "PCGElement.h"
#include "PCGContext.h"
#include "PCGData.h"
#include "Data/PCGPointData.h"
#include "Data/PCGSpatialData.h"
#include "PCGPin.h"              // FPCGPinProperties
#include "PCGModule.h"           // PCG log categories
```

---

## C++ Custom Node — Complete Template

### Step 1: Settings Class (.h)

```cpp
#pragma once

#include "PCGSettings.h"
#include "MyPCGNode.generated.h"

/**
 * Custom PCG node that [describe what it does].
 */
UCLASS(BlueprintType, ClassGroup = (Procedural))
class MYMODULE_API UMyPCGNodeSettings : public UPCGSettings
{
    GENERATED_BODY()

public:
    UMyPCGNodeSettings();

    //~ UPCGSettings interface
    virtual FName GetDefaultNodeName() const override;

#if WITH_EDITOR
    virtual FName GetDefaultNodeTitle() const override;
    virtual FText GetNodeTooltipText() const override;
    virtual EPCGSettingsType GetType() const override;
#endif

protected:
    virtual TArray<FPCGPinProperties> InputPinProperties() const override;
    virtual TArray<FPCGPinProperties> OutputPinProperties() const override;
    virtual FPCGElementPtr CreateElement() const override;

public:
    // === Node Parameters (exposed in Details panel) ===

    /** Description of this parameter */
    UPROPERTY(BlueprintReadWrite, EditAnywhere, Category = "Settings",
        meta = (PCG_Overridable))
    float MyFloatParam = 1.0f;

    /** Another parameter with clamping */
    UPROPERTY(BlueprintReadWrite, EditAnywhere, Category = "Settings",
        meta = (PCG_Overridable, ClampMin = "0", ClampMax = "1"))
    float DensityThreshold = 0.5f;

    /** Enum parameter */
    UPROPERTY(BlueprintReadWrite, EditAnywhere, Category = "Settings",
        meta = (PCG_Overridable))
    EPCGDensityFunction DensityFunction = EPCGDensityFunction::ClampedOneMinusDistance;
};
```

### Step 2: Settings Class (.cpp)

```cpp
#include "MyPCGNode.h"
#include "PCGPin.h"

#define LOCTEXT_NAMESPACE "PCGMyNode"

UMyPCGNodeSettings::UMyPCGNodeSettings()
{
    bUseSeed = true;  // Enable seed-based randomness
}

FName UMyPCGNodeSettings::GetDefaultNodeName() const
{
    return FName(TEXT("MyCustomNode"));
}

#if WITH_EDITOR
FName UMyPCGNodeSettings::GetDefaultNodeTitle() const
{
    return FName(TEXT("My Custom Node"));
}

FText UMyPCGNodeSettings::GetNodeTooltipText() const
{
    return LOCTEXT("Tooltip", "Description of what this node does");
}

EPCGSettingsType UMyPCGNodeSettings::GetType() const
{
    // Choose category:
    // Sampler, Filter, PointOps, SpatialOps, Spawner, Subgraph, Debug, Generic
    return EPCGSettingsType::PointOps;
}
#endif

TArray<FPCGPinProperties> UMyPCGNodeSettings::InputPinProperties() const
{
    TArray<FPCGPinProperties> PinProperties;
    PinProperties.Emplace(
        PCGPinConstants::DefaultInputLabel,
        EPCGDataType::Spatial,          // Accepts spatial data (points, surfaces)
        /*bAllowMultipleData=*/ true,
        /*bAllowMultipleConnections=*/ true
    );
    return PinProperties;
}

TArray<FPCGPinProperties> UMyPCGNodeSettings::OutputPinProperties() const
{
    TArray<FPCGPinProperties> PinProperties;
    PinProperties.Emplace(
        PCGPinConstants::DefaultOutputLabel,
        EPCGDataType::Point             // Outputs point data
    );
    return PinProperties;
}

FPCGElementPtr UMyPCGNodeSettings::CreateElement() const
{
    return MakeShared<FMyPCGNodeElement>();
}

#undef LOCTEXT_NAMESPACE
```

### Step 3: Element Class (Execution Logic)

```cpp
// In the same .h file, after the Settings class:

class FMyPCGNodeElement : public IPCGElement
{
protected:
    virtual bool ExecuteInternal(FPCGContext* Context) const override;
};

// In the .cpp file:

bool FMyPCGNodeElement::ExecuteInternal(FPCGContext* Context) const
{
    TRACE_CPUPROFILER_EVENT_SCOPE(FMyPCGNodeElement::Execute);

    check(Context);

    const UMyPCGNodeSettings* Settings = Context->GetInputSettings<UMyPCGNodeSettings>();
    check(Settings);

    // Get inputs
    TArray<FPCGTaggedData> Inputs = Context->InputData.GetInputsByPin(
        PCGPinConstants::DefaultInputLabel);

    for (const FPCGTaggedData& Input : Inputs)
    {
        const UPCGSpatialData* SpatialData = Cast<UPCGSpatialData>(Input.Data);
        if (!SpatialData)
        {
            PCGE_LOG(Warning, LogPCG, "Input is not spatial data, skipping");
            continue;
        }

        // Convert to point data (samples surface if needed)
        const UPCGPointData* InPointData = SpatialData->ToPointData(Context);
        if (!InPointData)
        {
            PCGE_LOG(Warning, LogPCG, "Failed to convert to point data");
            continue;
        }

        const TArray<FPCGPoint>& InPoints = InPointData->GetPoints();

        // Create output point data — NEVER mutate input
        UPCGPointData* OutPointData = NewObject<UPCGPointData>();
        OutPointData->InitializeFromData(InPointData);
        TArray<FPCGPoint>& OutPoints = OutPointData->GetMutablePoints();

        // Process each point
        for (const FPCGPoint& InPoint : InPoints)
        {
            // === YOUR LOGIC HERE ===
            // Example: filter by density threshold
            if (InPoint.Density >= Settings->DensityThreshold)
            {
                FPCGPoint& OutPoint = OutPoints.Add_GetRef(InPoint);
                // Modify the output point as needed:
                OutPoint.Density *= Settings->MyFloatParam;
            }
        }

        // Add to output
        FPCGTaggedData& Output = Context->OutputData.TaggedData.Emplace_GetRef();
        Output.Data = OutPointData;
        Output.Pin = PCGPinConstants::DefaultOutputLabel;
    }

    return true;
}
```

---

## Multiple Input/Output Pins

```cpp
TArray<FPCGPinProperties> UMyNodeSettings::InputPinProperties() const
{
    TArray<FPCGPinProperties> Props;
    // Primary input
    Props.Emplace(TEXT("Source"), EPCGDataType::Spatial);
    // Secondary input (e.g., exclusion zone)
    Props.Emplace(TEXT("Exclusion"), EPCGDataType::Spatial, true, true);
    return Props;
}

TArray<FPCGPinProperties> UMyNodeSettings::OutputPinProperties() const
{
    TArray<FPCGPinProperties> Props;
    Props.Emplace(TEXT("Inside"), EPCGDataType::Point);
    Props.Emplace(TEXT("Outside"), EPCGDataType::Point);
    return Props;
}

// In Execute:
TArray<FPCGTaggedData> Sources = Context->InputData.GetInputsByPin(TEXT("Source"));
TArray<FPCGTaggedData> Exclusions = Context->InputData.GetInputsByPin(TEXT("Exclusion"));
// ...
Output.Pin = TEXT("Inside");  // or TEXT("Outside")
```

---

## Working with Attributes in Custom Nodes

### Reading Attributes
```cpp
const UPCGMetadata* Metadata = InPointData->ConstMetadata();

// Check if attribute exists
if (Metadata->HasAttribute(TEXT("BiomeType")))
{
    const FPCGMetadataAttributeBase* Attr = Metadata->GetConstAttribute(TEXT("BiomeType"));
    // Type-specific access:
    if (Attr->GetTypeId() == PCG::Private::MetadataTypes<int32>::Id)
    {
        auto* TypedAttr = static_cast<const FPCGMetadataAttribute<int32>*>(Attr);
        int32 Value = TypedAttr->GetValueFromItemKey(PointMetadataEntry);
    }
}
```

### Writing Attributes
```cpp
UPCGMetadata* OutMetadata = OutPointData->MutableMetadata();

// Create new attribute
FPCGMetadataAttribute<float>* NewAttr = OutMetadata->CreateAttribute<float>(
    TEXT("MyAttribute"), 0.0f, /*bAllowInterpolation=*/ true, /*bOverrideParent=*/ false);

// Set value for a point
NewAttr->SetValue(OutPoint.MetadataEntry, MyComputedValue);
```

### Copying Attributes
```cpp
// Initialize output metadata from input (preserves all attributes)
OutPointData->InitializeFromData(InPointData);
// Points added to OutPointData inherit attribute schema from InPointData
```

---

## Using Seeds for Deterministic Randomness

```cpp
bool FMyElement::ExecuteInternal(FPCGContext* Context) const
{
    const UMySettings* Settings = Context->GetInputSettings<UMySettings>();

    for (const FPCGPoint& Point : InPoints)
    {
        // Combine node seed with point seed for per-point randomness
        FRandomStream RandomStream(PCGHelpers::ComputeSeed(Settings->Seed, Point.Seed));

        float RandomValue = RandomStream.FRand();  // 0.0 - 1.0
        FVector RandomOffset = RandomStream.VRandCone(FVector::UpVector, PI / 4.0f) * 100.0f;
    }
}
```

---

## Blueprint Custom Node (UPCGBlueprintElement)

### Setup
1. Create Blueprint class → Parent: `PCGBlueprintElement`
2. In Class Defaults:
   - Set `Input Type` (e.g., Spatial)
   - Set `Output Type` (e.g., Point)
   - Set `Custom Input Pins` / `Custom Output Pins` if needed
3. Override `Execute With Context` function

### Blueprint Node Execution Pattern
```
Event: ExecuteWithContext(Context)
    │
    ├── Get Input Data → Loop through inputs
    │   ├── Cast to PCG Point Data
    │   ├── Get Points (array)
    │   ├── For Each Point:
    │   │   ├── Read point properties (Transform, Density, etc.)
    │   │   ├── Your logic here
    │   │   └── Add modified point to output
    │   └── Set Output Data
    └── Return
```

### When to Use Blueprint vs C++
| Factor | Blueprint | C++ |
|--------|-----------|-----|
| Prototyping speed | Fast | Slower |
| Runtime performance | Slower (overhead per point) | Fast |
| Point count threshold | < 10K points | Any count |
| Team accessibility | Artists/designers | Programmers |
| Debugging | Visual, breakpoints | Requires IDE |
| Complex math | Cumbersome | Natural |

**Recommendation**: Prototype in Blueprint, convert to C++ if performance matters.

---

## EPCGSettingsType — Node Categories

```cpp
enum class EPCGSettingsType : uint8
{
    InputOutput,    // Input/output nodes
    Spatial,        // Spatial operations
    Density,        // Density operations
    Blueprint,      // Blueprint nodes
    Metadata,       // Attribute/metadata operations
    Filter,         // Point filtering
    Sampler,        // Point sampling/generation
    Spawner,        // Mesh/actor spawning
    Subgraph,       // Subgraph embedding
    Debug,          // Debug visualization
    Generic,        // Uncategorized
    PointOps,       // Point operations (transforms, etc.)
    SpatialOps,     // Spatial operations
    HierarchicalGeneration,  // Hierarchical generation nodes
    ControlFlow,    // Branch, Select, Loop
    Param,          // Parameter nodes
};
```

---

## Async/GPU Execution (UE 5.5+)

For heavy operations, nodes can opt into async or GPU execution:

```cpp
// In Settings class:
virtual bool ShouldExecuteOnGPU() const override { return true; }

// In Element class:
virtual bool IsCacheable(const UPCGSettings* InSettings) const override { return true; }
virtual bool CanExecuteOnlyOnMainThread(FPCGContext* Context) const override { return false; }
```

GPU compute nodes must use GPU-compatible data paths. Consult UE 5.5+ documentation
for `FPCGGPUElement` base class and compute shader integration.

---

## Registration and Discovery

Custom C++ nodes are automatically discovered by the PCG graph editor through
Unreal's reflection system (UCLASS macro). No manual registration needed.

For Blueprint nodes, the `UPCGBlueprintElement` subclass appears in the graph editor's
"Add Node" menu under the "Blueprint" category.

### Module Loading Phase
If your custom nodes are in a plugin, ensure the module loads at `PostEngineInit`
or `Default` phase. Loading too early can cause PCG subsystem initialization issues.
