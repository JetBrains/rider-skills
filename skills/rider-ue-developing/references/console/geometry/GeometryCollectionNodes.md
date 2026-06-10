# UE Python API — GeometryCollectionNodes Module

**39 types** from the `GeometryCollectionNodes` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AnchorStateEnum`, `ClusterNeighborSelectionMethodEnum`, `ClusterSizeMethodEnum`, `CompareOperation1Enum`, `CompareOperationEnum`, `ConnectionContactAreaMethodEnum`, `ConvexOverlapRemovalMethodEnum`, `CustomAttributeTypeEnum`, `DataflowFieldFalloffType`, `DataflowFloatFieldOperationType`, `DataflowGeometryCollectionDynamicState`, `DataflowMeshSplitIslandsMethod`, `DataflowSetFloatArrayMethod`, `DataflowSetMaskConditionType`, `DataflowStairTypeEnum`, `DataflowTransferVertexAttributeNodeBoundingVolume`, `DataflowTransferVertexAttributeNodeFalloff`, `DataflowTransferVertexAttributeNodeSourceScale`, `DataflowTransferVertexAttributeNodeTransferMethod`, `DataflowVectorFieldOperationType`, ... (39 total)

---

## Classes

### `unreal.AnchorStateEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionNodes.h`

EAnchor State Enum

**Properties** (2):
  - `DATAFLOW_ANCHOR_STATE_ANCHORED`: `AnchorStateEnum = Ellipsis` — 0
  - `DATAFLOW_ANCHOR_STATE_NOT_ANCHORED`: `AnchorStateEnum = Ellipsis` — 1

### `unreal.ClusterNeighborSelectionMethodEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionClusteringNodes.h`

ECluster Neighbor Selection Method Enum

**Properties** (2):
  - `DATAFLOW_CLUSTER_NEIGHBOR_SELECTION_METHOD_LARGEST_NEIGHBOR`: `ClusterNeighborSelectionMethodEnum = Ellipsis` — 0
  - `DATAFLOW_CLUSTER_NEIGHBOR_SELECTION_METHOD_NEAREST_CENTER`: `ClusterNeighborSelectionMethodEnum = Ellipsis` — 1

### `unreal.ClusterSizeMethodEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionClusteringNodes.h`

ECluster Size Method Enum

**Properties** (4):
  - `DATAFLOW_CLUSTER_SIZE_METHOD_BY_FRACTION_OF_INPUT`: `ClusterSizeMethodEnum = Ellipsis` — 1
  - `DATAFLOW_CLUSTER_SIZE_METHOD_BY_GRID`: `ClusterSizeMethodEnum = Ellipsis` — 3
  - `DATAFLOW_CLUSTER_SIZE_METHOD_BY_NUMBER`: `ClusterSizeMethodEnum = Ellipsis` — 0
  - `DATAFLOW_CLUSTER_SIZE_METHOD_BY_SIZE`: `ClusterSizeMethodEnum = Ellipsis` — 2

### `unreal.CompareOperation1Enum`
Inherits: `EnumBase` | Header: `GeometryCollectionArrayNodes.h`

ECompare Operation 1Enum

**Properties** (5):
  - `DATAFLOW_COMPARE_EQUAL`: `CompareOperation1Enum = Ellipsis` — 0
  - `DATAFLOW_COMPARE_GREATER`: `CompareOperation1Enum = Ellipsis` — 3
  - `DATAFLOW_COMPARE_GREATER_OR_EQUAL`: `CompareOperation1Enum = Ellipsis` — 4
  - `DATAFLOW_COMPARE_SMALLER`: `CompareOperation1Enum = Ellipsis` — 1
  - `DATAFLOW_COMPARE_SMALLER_OR_EQUAL`: `CompareOperation1Enum = Ellipsis` — 2

### `unreal.CompareOperationEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionNodes.h`

ECompare Operation Enum

**Properties** (5):
  - `DATAFLOW_COMPARE_EQUAL`: `CompareOperationEnum = Ellipsis` — 0
  - `DATAFLOW_COMPARE_GREATER`: `CompareOperationEnum = Ellipsis` — 3
  - `DATAFLOW_COMPARE_GREATER_OR_EQUAL`: `CompareOperationEnum = Ellipsis` — 4
  - `DATAFLOW_COMPARE_SMALLER`: `CompareOperationEnum = Ellipsis` — 1
  - `DATAFLOW_COMPARE_SMALLER_OR_EQUAL`: `CompareOperationEnum = Ellipsis` — 2

### `unreal.ConnectionContactAreaMethodEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionNodes.h`

EConnection Contact Area Method Enum

**Properties** (2):
  - `DATAFLOW_CONNECTION_CONTACT_AREA_METHOD_NONE`: `ConnectionContactAreaMethodEnum = Ellipsis` — Do not compute contact areas 0
  - `DATAFLOW_PROXIMITY_CONTACT_FILTERING_METHOD_CONVEX_HULL_AREA`: `ConnectionContactAreaMethodEnum = Ellipsis` — Compute approximate contact surface area via the intersection of convex hulls (allowing for optional...

### `unreal.ConvexOverlapRemovalMethodEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionUtilityNodes.h`

EConvex Overlap Removal Method Enum

**Properties** (4):
  - `DATAFLOW_E_CONVEX_OVERLAP_REMOVAL_METHOD_ALL`: `ConvexOverlapRemovalMethodEnum = Ellipsis` — 1
  - `DATAFLOW_E_CONVEX_OVERLAP_REMOVAL_METHOD_NONE`: `ConvexOverlapRemovalMethodEnum = Ellipsis` — 0
  - `DATAFLOW_E_CONVEX_OVERLAP_REMOVAL_METHOD_ONLY_CLUSTERS`: `ConvexOverlapRemovalMethodEnum = Ellipsis` — 2
  - `DATAFLOW_E_CONVEX_OVERLAP_REMOVAL_METHOD_ONLY_CLUSTERS_VS_CLUSTERS`: `ConvexOverlapRemovalMethodEnum = Ellipsis` — 3

### `unreal.CustomAttributeTypeEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionNodes.h`

ECustom Attribute Type Enum

**Properties** (24):
  - `DATAFLOW_CUSTOM_ATTRIBUTE_TYPE_BOOL`: `CustomAttributeTypeEnum = Ellipsis` — Bool 4 Data type
  - `DATAFLOW_CUSTOM_ATTRIBUTE_TYPE_BOX`: `CustomAttributeTypeEnum = Ellipsis` — FBox 13 Data type
  - `DATAFLOW_CUSTOM_ATTRIBUTE_TYPE_DOUBLE`: `CustomAttributeTypeEnum = Ellipsis` — Double 3 Data type
  - `DATAFLOW_CUSTOM_ATTRIBUTE_TYPE_FLOAT`: `CustomAttributeTypeEnum = Ellipsis` — Float 2 Data type
  - `DATAFLOW_CUSTOM_ATTRIBUTE_TYPE_FLOAT_ARRAY`: `CustomAttributeTypeEnum = Ellipsis` — TArray<float> 21 Data type
  - `DATAFLOW_CUSTOM_ATTRIBUTE_TYPE_F_VECTOR3F_ARRAY`: `CustomAttributeTypeEnum = Ellipsis` — TArray<FVector3f> 23 Data type
  - `DATAFLOW_CUSTOM_ATTRIBUTE_TYPE_GUID`: `CustomAttributeTypeEnum = Ellipsis` — FGuid 14 Data type
  - `DATAFLOW_CUSTOM_ATTRIBUTE_TYPE_INT32`: `CustomAttributeTypeEnum = Ellipsis` — Int32 1 Data type
  - `DATAFLOW_CUSTOM_ATTRIBUTE_TYPE_INT32_ARRAY`: `CustomAttributeTypeEnum = Ellipsis` — TArray<int32> 16 Data type
  - `DATAFLOW_CUSTOM_ATTRIBUTE_TYPE_INT32_SET`: `CustomAttributeTypeEnum = Ellipsis` — TSet<int32> 15 Data type
  - `DATAFLOW_CUSTOM_ATTRIBUTE_TYPE_INT_VECTOR`: `CustomAttributeTypeEnum = Ellipsis` — FIntVector 17 Data type
  - `DATAFLOW_CUSTOM_ATTRIBUTE_TYPE_INT_VECTOR2`: `CustomAttributeTypeEnum = Ellipsis` — FIntVector2 18 Data type
  - `DATAFLOW_CUSTOM_ATTRIBUTE_TYPE_INT_VECTOR2_ARRAY`: `CustomAttributeTypeEnum = Ellipsis` — TArray<FIntVector2> 20 Data type
  - `DATAFLOW_CUSTOM_ATTRIBUTE_TYPE_INT_VECTOR4`: `CustomAttributeTypeEnum = Ellipsis` — FIntVector4 19 Data type
  - `DATAFLOW_CUSTOM_ATTRIBUTE_TYPE_LINEAR_COLOR`: `CustomAttributeTypeEnum = Ellipsis` — FLinearColor 10 Data type
  - `DATAFLOW_CUSTOM_ATTRIBUTE_TYPE_QUAT4F`: `CustomAttributeTypeEnum = Ellipsis` — FQuat4f 12 Data type
  - `DATAFLOW_CUSTOM_ATTRIBUTE_TYPE_STRING`: `CustomAttributeTypeEnum = Ellipsis` — FString 5 Data type
  - `DATAFLOW_CUSTOM_ATTRIBUTE_TYPE_TRANSFORM`: `CustomAttributeTypeEnum = Ellipsis` — FTransform 11 Data type
  - `DATAFLOW_CUSTOM_ATTRIBUTE_TYPE_U_INT8`: `CustomAttributeTypeEnum = Ellipsis` — UInt8 0 Data type
  - `DATAFLOW_CUSTOM_ATTRIBUTE_TYPE_VECTOR2F`: `CustomAttributeTypeEnum = Ellipsis` — FVector2f 6 Data type
  - `DATAFLOW_CUSTOM_ATTRIBUTE_TYPE_VECTOR2F_ARRAY`: `CustomAttributeTypeEnum = Ellipsis` — TArray<FVector2f> 22 Data type
  - `DATAFLOW_CUSTOM_ATTRIBUTE_TYPE_VECTOR3D`: `CustomAttributeTypeEnum = Ellipsis` — FVector3d 8 Data type
  - `DATAFLOW_CUSTOM_ATTRIBUTE_TYPE_VECTOR3F`: `CustomAttributeTypeEnum = Ellipsis` — FVector3f 7 Data type
  - `DATAFLOW_CUSTOM_ATTRIBUTE_TYPE_VECTOR4F`: `CustomAttributeTypeEnum = Ellipsis` — FVector4f 9 Data type

### `unreal.DataflowFieldFalloffType`
Inherits: `EnumBase` | Header: `GeometryCollectionFieldNodes.h`

EDataflow Field Falloff Type

**Properties** (5):
  - `DATAFLOW_FIELD_FALLOFF_TYPE_INVERSE`: `DataflowFieldFalloffType = Ellipsis` — The falloff function will be proportional to 1.0/x 2
  - `DATAFLOW_FIELD_FALLOFF_TYPE_LINEAR`: `DataflowFieldFalloffType = Ellipsis` — The falloff function will be proportional to x 1
  - `DATAFLOW_FIELD_FALLOFF_TYPE_LOGARITHMIC`: `DataflowFieldFalloffType = Ellipsis` — The falloff function will be proportional to log(x) 4
  - `DATAFLOW_FIELD_FALLOFF_TYPE_NONE`: `DataflowFieldFalloffType = Ellipsis` — No falloff function is used 0
  - `DATAFLOW_FIELD_FALLOFF_TYPE_SQUARED`: `DataflowFieldFalloffType = Ellipsis` — The falloff function will be proportional to x*x 3

### `unreal.DataflowFloatFieldOperationType`
Inherits: `EnumBase` | Header: `GeometryCollectionFieldNodes.h`

EDataflow Float Field Operation Type

**Properties** (6):
  - `DATAFLOW_FLOAT_FIELD_FALLOFF_TYPE_ADD`: `DataflowFloatFieldOperationType = Ellipsis` — Output = Left + Right 2 Add the fields output values
  - `DATAFLOW_FLOAT_FIELD_FALLOFF_TYPE_DIVIDE`: `DataflowFloatFieldOperationType = Ellipsis` — Output = Left / Right 1 Divide the fields output values
  - `DATAFLOW_FLOAT_FIELD_FALLOFF_TYPE_MAX`: `DataflowFloatFieldOperationType = Ellipsis` — Output = Max(Left, Right) 5 Max of the fields output values
  - `DATAFLOW_FLOAT_FIELD_FALLOFF_TYPE_MIN`: `DataflowFloatFieldOperationType = Ellipsis` — Output = Min(Left, Right) 4 Min of the fields output values
  - `DATAFLOW_FLOAT_FIELD_FALLOFF_TYPE_SUBSTRACT`: `DataflowFloatFieldOperationType = Ellipsis` — Output = Left - Right 3 Subtract the fields output
  - `DATAFLOW_FLOAT_FIELD_OPERATION_TYPE_MULTIPLY`: `DataflowFloatFieldOperationType = Ellipsis` — Output = Left * Right 0 Multiply the fields output values

### `unreal.DataflowGeometryCollectionDynamicState`
Inherits: `EnumBase` | Header: `GeometryCollectionNodes.h`

EDataflow Geometry Collection Dynamic State

**Properties** (4):
  - `DYNAMIC`: `DataflowGeometryCollectionDynamicState = Ellipsis` — 1
  - `KINEMATIC`: `DataflowGeometryCollectionDynamicState = Ellipsis` — 2
  - `NONE`: `DataflowGeometryCollectionDynamicState = Ellipsis` — 0
  - `STATIC`: `DataflowGeometryCollectionDynamicState = Ellipsis` — 3

### `unreal.DataflowMeshSplitIslandsMethod`
Inherits: `EnumBase` | Header: `GeometryCollectionMeshNodes.h`

EDataflow Mesh Split Islands Method

**Properties** (3):
  - `BY_MESH_TOPOLOGY`: `DataflowMeshSplitIslandsMethod = Ellipsis` — 1
  - `BY_VERTEX_OVERLAP`: `DataflowMeshSplitIslandsMethod = Ellipsis` — 2
  - `NO_SPLIT`: `DataflowMeshSplitIslandsMethod = Ellipsis` — 0

### `unreal.DataflowSetFloatArrayMethod`
Inherits: `EnumBase` | Header: `GeometryCollectionFracturingNodes.h`

EDataflow Set Float Array Method

**Properties** (3):
  - `BY_BOUNDING_BOX`: `DataflowSetFloatArrayMethod = Ellipsis` — 2
  - `NOISE`: `DataflowSetFloatArrayMethod = Ellipsis` — 1
  - `RANDOM`: `DataflowSetFloatArrayMethod = Ellipsis` — 0

### `unreal.DataflowSetMaskConditionType`
Inherits: `EnumBase` | Header: `GeometryCollectionFieldNodes.h`

EDataflow Set Mask Condition Type

**Properties** (3):
  - `DATAFLOW_SET_MASK_CONDITION_TYPE_ALWAYS`: `DataflowSetMaskConditionType = Ellipsis` — The particle output value will be equal to Interior-value if the particle position is inside a spher...
  - `DATAFLOW_SET_MASK_CONDITION_TYPE_IFF_NOT_EXTERIOR`: `DataflowSetMaskConditionType = Ellipsis` — The particle output value will be equal to Exterior-value if the particle position is outside the sp...
  - `DATAFLOW_SET_MASK_CONDITION_TYPE_IFF_NOT_INTERIOR`: `DataflowSetMaskConditionType = Ellipsis` — The particle output value will be equal to Interior-value if the particle position is inside the sph...

### `unreal.DataflowStairTypeEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionMakeNodes.h`

EDataflow Stair Type Enum

**Properties** (4):
  - `CURVED`: `DataflowStairTypeEnum = Ellipsis` — 2
  - `FLOATING`: `DataflowStairTypeEnum = Ellipsis` — 1
  - `LINEAR`: `DataflowStairTypeEnum = Ellipsis` — 0
  - `SPIRAL`: `DataflowStairTypeEnum = Ellipsis` — 3

### `unreal.DataflowTransferVertexAttributeNodeBoundingVolume`
Inherits: `EnumBase` | Header: `GeometryCollectionTransferVertexAttributeNode.h`

EDataflow Transfer Vertex Attribute Node Bounding Volume

**Properties** (2):
  - `TRIANGLE`: `DataflowTransferVertexAttributeNodeBoundingVolume = Ellipsis` — Bounding volume on triangles of the source triangle mesh 1
  - `VERTEX`: `DataflowTransferVertexAttributeNodeBoundingVolume = Ellipsis` — Bounding volume on vertices of the source mesh 0

### `unreal.DataflowTransferVertexAttributeNodeFalloff`
Inherits: `EnumBase` | Header: `GeometryCollectionTransferVertexAttributeNode.h`

EDataflow Transfer Vertex Attribute Node Falloff

**Properties** (3):
  - `LINEAR`: `DataflowTransferVertexAttributeNodeFalloff = Ellipsis` — Linear falloff based on distance from triangle 1
  - `NONE`: `DataflowTransferVertexAttributeNodeFalloff = Ellipsis` — No distance falloff 2
  - `SQUARED`: `DataflowTransferVertexAttributeNodeFalloff = Ellipsis` — Squared falloff based on distance from triangle 0

### `unreal.DataflowTransferVertexAttributeNodeSourceScale`
Inherits: `EnumBase` | Header: `GeometryCollectionTransferVertexAttributeNode.h`

EDataflow Transfer Vertex Attribute Node Source Scale

**Properties** (3):
  - `ASSET_BOUND`: `DataflowTransferVertexAttributeNodeSourceScale = Ellipsis` — Bounding volume hierarchy cell size based on max length of the bounding box of the whole asset 2
  - `ASSET_EDGE`: `DataflowTransferVertexAttributeNodeSourceScale = Ellipsis` — Bounding volume hierarchy cell size based on max edge length of the whole asset 1
  - `COMPONENT_EDGE`: `DataflowTransferVertexAttributeNodeSourceScale = Ellipsis` — Bounding volume hierarchy cell size based on max edge length of each geometry group.
Only works if t...

### `unreal.DataflowTransferVertexAttributeNodeTransferMethod`
Inherits: `EnumBase` | Header: `GeometryCollectionTransferVertexAttributeNode.h`

EDataflow Transfer Vertex Attribute Node Transfer Method

**Properties** (3):
  - `COMPONENT`: `DataflowTransferVertexAttributeNodeTransferMethod = Ellipsis` — Transfers vertex attribute between matched geometries. 0
  - `GLOBAL`: `DataflowTransferVertexAttributeNodeTransferMethod = Ellipsis` — attributes on one geometry might bleed over to neighbor geometries. 1 Transfers vertex attribute glo...
  - `NONE`: `DataflowTransferVertexAttributeNodeTransferMethod = Ellipsis` — No distance falloff 2

### `unreal.DataflowVectorFieldOperationType`
Inherits: `EnumBase` | Header: `GeometryCollectionFieldNodes.h`

EDataflow Vector Field Operation Type

**Properties** (5):
  - `DATAFLOW_VECTOR_FIELD_FALLOFF_TYPE_ADD`: `DataflowVectorFieldOperationType = Ellipsis` — Output = Left + Right 2 Add the fields output values
  - `DATAFLOW_VECTOR_FIELD_FALLOFF_TYPE_CROSS_PRODUCT`: `DataflowVectorFieldOperationType = Ellipsis` — Output = Left x Right 4 Cross product of the fields output values
  - `DATAFLOW_VECTOR_FIELD_FALLOFF_TYPE_DIVIDE`: `DataflowVectorFieldOperationType = Ellipsis` — Output = Left / Right 1 Divide the fields output values
  - `DATAFLOW_VECTOR_FIELD_FALLOFF_TYPE_SUBSTRACT`: `DataflowVectorFieldOperationType = Ellipsis` — Output = Left - Right 3 Subtract the fields output
  - `DATAFLOW_VECTOR_FIELD_OPERATION_TYPE_MULTIPLY`: `DataflowVectorFieldOperationType = Ellipsis` — Output = Left * Right 0 Multiply the fields output values

### `unreal.DataflowVisualizeFractureColoringType`
Inherits: `EnumBase` | Header: `GeometryCollectionFracturingNodes.h`

EDataflow Visualize Fracture Coloring Type

**Properties** (6):
  - `COLOR_BY_ATTR`: `DataflowVisualizeFractureColoringType = Ellipsis` — 5
  - `COLOR_BY_CLUSTER`: `DataflowVisualizeFractureColoringType = Ellipsis` — 2
  - `COLOR_BY_LEAF`: `DataflowVisualizeFractureColoringType = Ellipsis` — 4
  - `COLOR_BY_LEAF_LEVEL`: `DataflowVisualizeFractureColoringType = Ellipsis` — 3
  - `COLOR_BY_LEVEL`: `DataflowVisualizeFractureColoringType = Ellipsis` — 1
  - `COLOR_BY_PARENT`: `DataflowVisualizeFractureColoringType = Ellipsis` — 0

### `unreal.DataflowWaveFunctionType`
Inherits: `EnumBase` | Header: `GeometryCollectionFieldNodes.h`

EDataflow Wave Function Type

**Properties** (4):
  - `DATAFLOW_WAVE_FUNCTION_TYPE_COSINE`: `DataflowWaveFunctionType = Ellipsis` — Cosine wave that will move in time. 0
  - `DATAFLOW_WAVE_FUNCTION_TYPE_DECAY`: `DataflowWaveFunctionType = Ellipsis` — The magnitude of the field will decay in time. 3
  - `DATAFLOW_WAVE_FUNCTION_TYPE_FALLOFF`: `DataflowWaveFunctionType = Ellipsis` — The radial falloff radius will move along temporal wave. 2
  - `DATAFLOW_WAVE_FUNCTION_TYPE_GAUSSIAN`: `DataflowWaveFunctionType = Ellipsis` — Gaussian wave that will move in time. 1

### `unreal.FloatArrayToIntArrayFunctionEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionArrayNodes.h`

EFloat Array to Int Array Function Enum

**Properties** (6):
  - `DATAFLOW_FLOAT_TO_INT_FUNCTION_CEIL`: `FloatArrayToIntArrayFunctionEnum = Ellipsis` — 1
  - `DATAFLOW_FLOAT_TO_INT_FUNCTION_FLOOR`: `FloatArrayToIntArrayFunctionEnum = Ellipsis` — 0
  - `DATAFLOW_FLOAT_TO_INT_FUNCTION_ROUND`: `FloatArrayToIntArrayFunctionEnum = Ellipsis` — 2
  - `DATAFLOW_FLOAT_TO_INT_FUNCTION_TRUNCATE`: `FloatArrayToIntArrayFunctionEnum = Ellipsis` — 3
  - `DATAFLOW_FLOAT_TO_INT_NON_ZERO_TO_INDEX`: `FloatArrayToIntArrayFunctionEnum = Ellipsis` — 4
  - `DATAFLOW_FLOAT_TO_INT_ZERO_TO_INDEX`: `FloatArrayToIntArrayFunctionEnum = Ellipsis` — 5

### `unreal.FloatToIntFunctionEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionConversionNodes.h`

EFloat to Int Function Enum

**Properties** (4):
  - `DATAFLOW_FLOAT_TO_INT_FUNCTION_CEIL`: `FloatToIntFunctionEnum = Ellipsis` — 1
  - `DATAFLOW_FLOAT_TO_INT_FUNCTION_FLOOR`: `FloatToIntFunctionEnum = Ellipsis` — 0
  - `DATAFLOW_FLOAT_TO_INT_FUNCTION_ROUND`: `FloatToIntFunctionEnum = Ellipsis` — 2
  - `DATAFLOW_FLOAT_TO_INT_FUNCTION_TRUNCATE`: `FloatToIntFunctionEnum = Ellipsis` — 3

### `unreal.MakeBoxDataTypeEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionMakeNodes.h`

EMake Box Data Type Enum

**Properties** (2):
  - `DATAFLOW_MAKE_BOX_DATA_TYPE_CENTER_SIZE`: `MakeBoxDataTypeEnum = Ellipsis` — 1
  - `DATAFLOW_MAKE_BOX_DATA_TYPE_MIN_MAX`: `MakeBoxDataTypeEnum = Ellipsis` — 0

### `unreal.MakeMeshTypeEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionMakeNodes.h`

EMake Mesh Type Enum

**Properties** (3):
  - `CAPSULE`: `MakeMeshTypeEnum = Ellipsis` — 1
  - `CYLINDER`: `MakeMeshTypeEnum = Ellipsis` — 2
  - `SPHERE`: `MakeMeshTypeEnum = Ellipsis` — 0

### `unreal.MathConstantsEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionMathNodes.h`

EMath Constants Enum

**Properties** (14):
  - `DATAFLOW_FLOAT_TO_INT_FUNCTION_E`: `MathConstantsEnum = Ellipsis` — 10
  - `DATAFLOW_FLOAT_TO_INT_FUNCTION_GAMMA`: `MathConstantsEnum = Ellipsis` — 11
  - `DATAFLOW_FLOAT_TO_INT_FUNCTION_GOLDEN_RATIO`: `MathConstantsEnum = Ellipsis` — 12
  - `DATAFLOW_FLOAT_TO_INT_FUNCTION_ZERO_TOLERANCE`: `MathConstantsEnum = Ellipsis` — 13
  - `DATAFLOW_MATH_CONSTANTS_FOUR_PI`: `MathConstantsEnum = Ellipsis` — 3
  - `DATAFLOW_MATH_CONSTANTS_HALF_PI`: `MathConstantsEnum = Ellipsis` — 1
  - `DATAFLOW_MATH_CONSTANTS_INV_PI`: `MathConstantsEnum = Ellipsis` — 4
  - `DATAFLOW_MATH_CONSTANTS_INV_SQRT2`: `MathConstantsEnum = Ellipsis` — 7
  - `DATAFLOW_MATH_CONSTANTS_INV_SQRT3`: `MathConstantsEnum = Ellipsis` — 9
  - `DATAFLOW_MATH_CONSTANTS_INV_TWO_PI`: `MathConstantsEnum = Ellipsis` — 5
  - `DATAFLOW_MATH_CONSTANTS_PI`: `MathConstantsEnum = Ellipsis` — 0
  - `DATAFLOW_MATH_CONSTANTS_SQRT2`: `MathConstantsEnum = Ellipsis` — 6
  - `DATAFLOW_MATH_CONSTANTS_SQRT3`: `MathConstantsEnum = Ellipsis` — 8
  - `DATAFLOW_MATH_CONSTANTS_TWO_PI`: `MathConstantsEnum = Ellipsis` — 2

### `unreal.ProximityContactFilteringMethodEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionNodes.h`

EProximity Contact Filtering Method Enum

**Properties** (3):
  - `DATAFLOW_PROXIMITY_CONTACT_FILTERING_METHOD_CONVEX_HULL_AREA`: `ProximityContactFilteringMethodEnum = Ellipsis` — Rejects proximity if the surface area of the intersection of convex hulls (allowing for optional off...
  - `DATAFLOW_PROXIMITY_CONTACT_FILTERING_METHOD_CONVEX_HULL_SHARP`: `ProximityContactFilteringMethodEnum = Ellipsis` — Rejects proximity if the intersection of convex hulls (allowing for optional offset) follows a sharp...
  - `DATAFLOW_PROXIMITY_CONTACT_FILTERING_METHOD_PROJECTED_BOUNDS_OVERLAP`: `ProximityContactFilteringMethodEnum = Ellipsis` — Rejects proximity if the bounding boxes do not overlap by more than Contact Threshold centimeters in...

### `unreal.ProximityMethodEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionNodes.h`

EProximity Method Enum

**Properties** (2):
  - `DATAFLOW_PROXIMITY_METHOD_CONVEX_HULL`: `ProximityMethodEnum = Ellipsis` — Convex Hull proximity mode looks for geometry with overlapping convex hulls(with an optional offset)...
  - `DATAFLOW_PROXIMITY_METHOD_PRECISE`: `ProximityMethodEnum = Ellipsis` — Precise proximity mode looks for geometry with touching vertices or touching, coplanar, opposite - f...

### `unreal.RangeSettingEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionSelectionNodes.h`

ERange Setting Enum

**Properties** (2):
  - `DATAFLOW_RANGE_SETTING_INSIDE_RANGE`: `RangeSettingEnum = Ellipsis` — Values for selection must be inside of the specified range 0
  - `DATAFLOW_RANGE_SETTING_OUTSIDE_RANGE`: `RangeSettingEnum = Ellipsis` — Values for selection must be outside of the specified range 1

### `unreal.RotationOrderEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionNodes.h`

ERotation Order Enum

**Properties** (6):
  - `DATAFLOW_ROTATION_ORDER_XYZ`: `RotationOrderEnum = Ellipsis` — 0
  - `DATAFLOW_ROTATION_ORDER_XZY`: `RotationOrderEnum = Ellipsis` — 3
  - `DATAFLOW_ROTATION_ORDER_YXZ`: `RotationOrderEnum = Ellipsis` — 4
  - `DATAFLOW_ROTATION_ORDER_YZX`: `RotationOrderEnum = Ellipsis` — 1
  - `DATAFLOW_ROTATION_ORDER_ZXY`: `RotationOrderEnum = Ellipsis` — 2
  - `DATAFLOW_ROTATION_ORDER_ZYX`: `RotationOrderEnum = Ellipsis` — 5

### `unreal.SelectionByAttrGroup`
Inherits: `EnumBase` | Header: `GeometryCollectionSelectionNodes.h`

ESelection by Attr Group

**Properties** (5):
  - `FACES`: `SelectionByAttrGroup = Ellipsis` — 1
  - `GEOMETRY`: `SelectionByAttrGroup = Ellipsis` — 3
  - `MATERIAL`: `SelectionByAttrGroup = Ellipsis` — 4
  - `TRANSFORM`: `SelectionByAttrGroup = Ellipsis` — 2
  - `VERTICES`: `SelectionByAttrGroup = Ellipsis` — 0

### `unreal.SelectionByAttrOperation`
Inherits: `EnumBase` | Header: `GeometryCollectionSelectionNodes.h`

ESelection by Attr Operation

**Properties** (8):
  - `EQUAL`: `SelectionByAttrOperation = Ellipsis` — Select faces which attribute value equal with specified value 0
  - `GREATER`: `SelectionByAttrOperation = Ellipsis` — Select faces which attribute value greater than specified value 2
  - `GREATER_OR_EQUAL`: `SelectionByAttrOperation = Ellipsis` — Select faces which attribute value greater or equal than specified value 3
  - `MAXIMUM`: `SelectionByAttrOperation = Ellipsis` — Select faces which attribute value greater than specified value 6
  - `MINIMUM`: `SelectionByAttrOperation = Ellipsis` — Select faces which attribute value greater than specified value 7
  - `NOT_EQUAL`: `SelectionByAttrOperation = Ellipsis` — Select faces which attribute value not equal with specified value 1
  - `SMALLER`: `SelectionByAttrOperation = Ellipsis` — Select faces which attribute value smaller than specified value 4
  - `SMALLER_OR_EQUAL`: `SelectionByAttrOperation = Ellipsis` — Select faces which attribute value greater than specified value 5

### `unreal.SelectSubjectTypeEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionSelectionNodes.h`

ESelect Subject Type Enum

**Properties** (3):
  - `DATAFLOW_SELECT_SUBJECT_TYPE_BOUNDING_BOX`: `SelectSubjectTypeEnum = Ellipsis` — InBox must contain the BoundingBox of the bone 1
  - `DATAFLOW_SELECT_SUBJECT_TYPE_CENTROID`: `SelectSubjectTypeEnum = Ellipsis` — InBox must contain the centroid of the bone 2
  - `DATAFLOW_SELECT_SUBJECT_TYPE_VERTICES`: `SelectSubjectTypeEnum = Ellipsis` — InBox must contain the vertices of the bone 0

### `unreal.SetMaterialOperationTypeEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionMaterialNodes.h`

ESet Material Operation Type Enum

**Properties** (2):
  - `DATAFLOW_SET_MATERIAL_OPERATION_TYPE_ADD`: `SetMaterialOperationTypeEnum = Ellipsis` — 0
  - `DATAFLOW_SET_MATERIAL_OPERATION_TYPE_INSERT`: `SetMaterialOperationTypeEnum = Ellipsis` — 1

### `unreal.SetOperationEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionSelectionNodes.h`

ESet Operation Enum

**Properties** (4):
  - `DATAFLOW_SET_OPERATION_AND`: `SetOperationEnum = Ellipsis` — Select elements that are selected in both incoming selections (Bitwise AND) 0
  - `DATAFLOW_SET_OPERATION_OR`: `SetOperationEnum = Ellipsis` — Select elements that are selected in either incoming selections (Bitwise OR) 1
  - `DATAFLOW_SET_OPERATION_SUBTRACT`: `SetOperationEnum = Ellipsis` — Select elements that are selected in only the first of the incoming selections (Bitwise A AND (NOT B...
  - `DATAFLOW_SET_OPERATION_XOR`: `SetOperationEnum = Ellipsis` — Select elements that are selected in exactly one incoming selection (Bitwise XOR) 2

### `unreal.StandardGroupNameEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionNodes.h`

EStandard Group Name Enum

**Properties** (7):
  - `DATAFLOW_E_STANDARD_GROUP_NAME_ENUM_BREAKING`: `StandardGroupNameEnum = Ellipsis` — 5
  - `DATAFLOW_E_STANDARD_GROUP_NAME_ENUM_CUSTOM`: `StandardGroupNameEnum = Ellipsis` — 6
  - `DATAFLOW_E_STANDARD_GROUP_NAME_ENUM_FACES`: `StandardGroupNameEnum = Ellipsis` — 2
  - `DATAFLOW_E_STANDARD_GROUP_NAME_ENUM_GEOMETRY`: `StandardGroupNameEnum = Ellipsis` — 1
  - `DATAFLOW_E_STANDARD_GROUP_NAME_ENUM_MATERIAL`: `StandardGroupNameEnum = Ellipsis` — 4
  - `DATAFLOW_E_STANDARD_GROUP_NAME_ENUM_TRANSFORM`: `StandardGroupNameEnum = Ellipsis` — 0
  - `DATAFLOW_E_STANDARD_GROUP_NAME_ENUM_VERTICES`: `StandardGroupNameEnum = Ellipsis` — 3

### `unreal.StatisticsOperationEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionArrayNodes.h`

EStatistics Operation Enum

**Properties** (6):
  - `DATAFLOW_E_STATISTICS_OPERATION_ENUM_MAX`: `StatisticsOperationEnum = Ellipsis` — 1
  - `DATAFLOW_E_STATISTICS_OPERATION_ENUM_MEAN`: `StatisticsOperationEnum = Ellipsis` — 2
  - `DATAFLOW_E_STATISTICS_OPERATION_ENUM_MEDIAN`: `StatisticsOperationEnum = Ellipsis` — 3
  - `DATAFLOW_E_STATISTICS_OPERATION_ENUM_MIN`: `StatisticsOperationEnum = Ellipsis` — 0
  - `DATAFLOW_E_STATISTICS_OPERATION_ENUM_MODE`: `StatisticsOperationEnum = Ellipsis` — 4
  - `DATAFLOW_E_STATISTICS_OPERATION_ENUM_SUM`: `StatisticsOperationEnum = Ellipsis` — 5

### `unreal.VisibiltyOptionsEnum`
Inherits: `EnumBase` | Header: `GeometryCollectionEditNodes.h`

EVisibilty Options Enum

**Properties** (2):
  - `DATAFLOW_VISIBILITY_OPTIONS_INVISIBLE`: `VisibiltyOptionsEnum = Ellipsis` — 1
  - `DATAFLOW_VISIBILITY_OPTIONS_VISIBLE`: `VisibiltyOptionsEnum = Ellipsis` — 0
