# UE Python API — CoreUObject Module

**129 types** from the `CoreUObject` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ARFilter`, `AssetData`, `Box`, `Box2D`, `Box2f`, `Box3f`, `BoxSphereBounds`, `Color`, `DateTime`, `DirectoryPath`, `DoubleRange`, `DoubleRangeBound`, `FilePath`, `FloatInterval`, `FloatRange`, `FloatRangeBound`, `FrameNumber`, `FrameNumberRange`, `FrameNumberRangeBound`, `FrameRate`, ... (129 total)

---

## Classes

### `unreal.ARFilter`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A struct to serve as a filter for Asset Registry queries. (mirrored in ARFilter.h)

**Methods** (1):
  - `get_blueprint_assets()` -> `Array [ AssetData ]` — Gets asset data for all blueprint assets that match the filter. ClassPaths in the filter specify the blueprintâs paren...

**Properties** (10):
  - `class_names`: `None` — [Read-Write] [DEPRECATED] - Class names are now represented by path names. Please use ClassPaths ins...
  - `class_paths`: `None` — [Read-Write] The filter component for class path names. Instances of the specified classes, but not ...
  - `include_only_on_disk_assets`: `bool` — [Read-Write] If true, only on-disk assets will be returned. Be warned that this is rarely what you w...
  - `package_names`: `None` — [Read-Write] The filter component for package names (Array[Name])
  - `package_paths`: `None` — [Read-Write] The filter component for package paths (Array[Name])
  - `recursive_class_paths_exclusion_set`: `None` — [Read-Write] Only if bRecursiveClasses is true, the results will exclude classes (and subclasses) in...
  - `recursive_classes`: `bool` — [Read-Write] If true, subclasses of ClassNames will also be included and RecursiveClassesExclusionSe...
  - `recursive_classes_exclusion_set`: `None` — [Read-Write] [DEPRECATED] - Class names are now represented by path names. Please use RecursiveClass...
  - `recursive_paths`: `bool` — [Read-Write] If true, PackagePath components will be recursive (bool)
  - `soft_object_paths`: `None` — [Read-Write] The filter component containing specific object paths (Array[SoftObjectPath])

### `unreal.AssetData`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A struct to hold important information about an assets found by the Asset Registry This struct is transient and should never be serialized

**Methods** (13):
  - `find_asset_native_class()` — Returns the first native class of the asset type that can be found. Normally this is just the FAssetData::GetClass(), ho...
  - `get_asset()` -> `Object` — Returns the asset UObject if it is loaded or loads the asset if it is unloaded then returns the result
  - `get_class()` — Get Class
  - `get_export_text_name()` -> `str` — Returns the name for the asset in the form: ClassâObjectPathâ
  - `get_full_name()` -> `str` — Returns the full name for the asset in the form: Class ObjectPath
  - `get_tag_value(tag_name)` -> `str or None` — Gets the value associated with the given tag as a string
  - `has_editor_only_data()` -> `bool` — Returns true if the asset has its editor-only data
  - `is_asset_loaded()` -> `bool` — Returns true if the asset is loaded
  - `is_cooked()` -> `bool` — Returns true if the asset is cooked
  - `is_redirector()` -> `bool` — Returns true if the this asset is a redirector.
  - `is_u_asset()` -> `bool` — Returns true if this is the primary asset in a package, true for maps and assets but false for secondary objects like cl...
  - `is_valid()` -> `bool` — Checks to see if this AssetData refers to an asset or is NULL
  - `to_soft_object_path()` -> `SoftObjectPath` — Convert to a SoftObjectPath for loading

**Properties** (5):
  - `asset_class`: `Name` [Read-Only] — [Read-Only] The name of the assetâs class
deprecated: Short asset class name must be converted to ...
  - `asset_class_path`: `TopLevelAssetPath` [Read-Only] — [Read-Only] The path name of the assetâs class (TopLevelAssetPath)
  - `asset_name`: `Name` [Read-Only] — [Read-Only] The name of the asset without the package (Name)
  - `package_name`: `Name` [Read-Only] — [Read-Only] The name of the package in which the asset is found, this is the full long package name ...
  - `package_path`: `Name` [Read-Only] — [Read-Only] The path to the package in which the asset is found, this is /Game/Path with the Package...

### `unreal.Box`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A bounding box. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathBox.h

**Methods** (14):
  - `find_box_box_intersection(is_intersecting=bool)` — Find the Box formed by the intersection of Box1 and Box2
  - `find_closest_point_on_box(is_inside=bool)` — Find the point on the faces of the Box that is closest to the input Point. If the Point is inside the Box, it is returne...
  - `get_box_box_distance(box2)` -> `double` — Calculate the minimum distance between Box1 and Box2
  - `get_box_center_size(dimensions=Vector)` — Get the Center point and X/Y/Z Dimensions of a Box (full dimensions, not Extents)
  - `get_box_corner(corner_index)` -> `Vector` — Get the position of a corner of the Box. Corners are indexed from 0 to 7, using an ordering where 0 is the Min corner, 1...
  - `get_box_face_center(face_normal=Vector)` — Get the position of the center of a face of the Box. Faces are indexed from 0 to 5, using an ordering where 0/1 are the ...
  - `get_box_point_distance(point)` -> `double` — Calculate the minimum distance between the Box and the Point
  - `get_box_volume_area(surface_area=double)` — Get the Volume and Surface Area of a Box
  - `get_expanded_box(expand_by)` -> `Box` — Get the input Box expanded by adding the ExpandBy parameter to both the Min and Max. Dimensions will be clamped to the c...
  - `get_transformed_box(transform)` -> `Box` — Apply the input Transform to the corners of the input Box, and return the new Box containing those points
  - `random_point_in_box_extents()` -> `Vector` — Returns a random point within the specified bounding box.
  - `test_box_box_intersection(box2)` -> `bool` — Test if Box1 and Box2 intersect
  - `test_box_sphere_intersection(sphere_center, sphere_radius)` -> `bool` — Check if the Box intersects a Sphere defined by the SphereCenter and SphereRadius
  - `test_point_inside_box(point, consider_on_box_as_inside = True)` -> `bool` — Test if a Point is inside the Box, returning true if so, otherwise false

**Properties** (3):
  - `is_valid`: `bool` — [Read-Write] (bool)
  - `max`: `Vector` — [Read-Write] (Vector)
  - `min`: `Vector` — [Read-Write] (Vector)

### `unreal.Box2D`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A rectangular 2D Box. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathBox2D.h

**Properties** (3):
  - `is_valid`: `bool` — [Read-Write] (bool)
  - `max`: `Vector2D` — [Read-Write] (Vector2D)
  - `min`: `Vector2D` — [Read-Write] (Vector2D)

### `unreal.Box2f`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A rectangular 2D Box. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathBox2D.h

### `unreal.Box3f`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A point or direction FVector in 3d space. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathBox.h

### `unreal.BoxSphereBounds`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A bounding box and bounding sphere with the same origin. note: The full C++ class is located here : EngineSourceRuntimeCorePublicMathBoxSphereBounds.h

**Properties** (3):
  - `box_extent`: `Vector` — [Read-Write] Holds the extent of the bounding box, which is half the size of the box in 3D space (Ve...
  - `origin`: `Vector` — [Read-Write] Holds the origin of the bounding box and sphere. (Vector)
  - `sphere_radius`: `float` — [Read-Write] Holds the radius of the bounding sphere. (double)

### `unreal.Color`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Stores a color with 8 bits of precision per channel. (BGRA). note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathColor.h

**Properties** (4):
  - `a`: `int` — [Read-Write] (uint8)
  - `b`: `int` — [Read-Write] (uint8)
  - `g`: `int` — [Read-Write] (uint8)
  - `r`: `int` — [Read-Write] (uint8)

### `unreal.DateTime`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A value representing a specific point date and time over a wide range of years. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMiscDateTime.h

### `unreal.DirectoryPath`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Structure for directory paths that are displayed in the editor with a picker UI.

**Properties** (1):
  - `path`: `str` — [Read-Write] The path to the directory. (str)

### `unreal.DoubleRange`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A contiguous set of doubles described by lower and upper bound values. note: This is a mirror of TRange<double>, defined in Range.h note: Fields are private to match the C++ declaration in the header ...

**Properties** (2):
  - `lower_bound`: `DoubleRangeBound` — [Read-Write] Holds the rangeâs lower bound. (DoubleRangeBound)
  - `upper_bound`: `DoubleRangeBound` — [Read-Write] Holds the rangeâs upper bound. (DoubleRangeBound)

### `unreal.DoubleRangeBound`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Defines a single bound for a range of values. note: This is a mirror of TRangeBound<double>, defined in RangeBound.h note: Fields are private to match the C++ declaration in the header above.

**Properties** (2):
  - `type`: `RangeBoundTypes` — [Read-Write] Holds the type of the bound. (RangeBoundTypes)
  - `value`: `float` — [Read-Write] Holds the boundâs value. (double)

### `unreal.FilePath`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Structure for file paths that are displayed in the editor with a picker UI.

**Properties** (1):
  - `file_path`: `str` — [Read-Write] The path to the file. (str)

### `unreal.FloatInterval`
Inherits: `StructBase` | Header: `NoExportTypes.h`

An interval of floats, defined by inclusive min and max values note: This is a mirror of TInterval<float>, defined in Interval.h

**Properties** (2):
  - `max`: `float` — [Read-Write] Values must be <= Max (float)
  - `min`: `float` — [Read-Write] Values must be >= Min (float)

### `unreal.FloatRange`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A contiguous set of floats described by lower and upper bound values. note: This is a mirror of TRange<float>, defined in Range.h note: Fields are private to match the C++ declaration in the header ab...

**Properties** (2):
  - `lower_bound`: `FloatRangeBound` — [Read-Write] Holds the rangeâs lower bound. (FloatRangeBound)
  - `upper_bound`: `FloatRangeBound` — [Read-Write] Holds the rangeâs upper bound. (FloatRangeBound)

### `unreal.FloatRangeBound`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Defines a single bound for a range of values. note: This is a mirror of TRangeBound<float>, defined in RangeBound.h note: Fields are private to match the C++ declaration in the header above.

**Properties** (2):
  - `type`: `RangeBoundTypes` — [Read-Write] Holds the type of the bound. (RangeBoundTypes)
  - `value`: `float` — [Read-Write] Holds the boundâs value. (float)

### `unreal.FrameNumber`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A frame number value, representing discrete frames since the start of timing. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMiscFrameNumber.h

**Methods** (13):
  - `__add__(other: FrameNumber)` -> `None` — Overloads:
  - `__iadd__(other: FrameNumber)` -> `None` — Overloads:
  - `__imul__(other: FrameNumber)` -> `None` — Overloads:
  - `__isub__(other: FrameNumber)` -> `None` — Overloads:
  - `__mul__(other: FrameNumber)` -> `None` — Overloads:
  - `__sub__(other: FrameNumber)` -> `None` — Overloads:
  - `__truediv__(other: FrameNumber)` -> `None` — Overloads:
  - `add_frame_number_frame_number(b)` -> `None` — Addition (FrameNumber A + FrameNumber B)
  - `add_frame_number_integer(b)` -> `None` — Addition (FrameNumber A + int B)
  - `divide_frame_number_integer(b)` -> `None` — Divide (FrameNumber A / B)
  - `multiply_frame_number_integer(b)` -> `None` — Multiply (FrameNumber A * B)
  - `subtract_frame_number_frame_number(b)` -> `None` — Subtraction (FrameNumber A - FrameNumber B)
  - `subtract_frame_number_integer(b)` -> `None` — Subtraction (FrameNumber A - int B)

**Properties** (1):
  - `value`: `int` — [Read-Write] (int32)

### `unreal.FrameNumberRange`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A contiguous set of frame numbers described by lower and upper bound values. note: This is a mirror of TRange<FFrameNumber>, defined in Range.h note: Fields are private to match the C++ declaration in...

**Properties** (2):
  - `lower_bound`: `FrameNumberRangeBound` — [Read-Write] (FrameNumberRangeBound)
  - `upper_bound`: `FrameNumberRangeBound` — [Read-Write] (FrameNumberRangeBound)

### `unreal.FrameNumberRangeBound`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Defines a single bound for a range of frame numbers. note: This is a mirror of TRangeBound<FFrameNumber>, defined in RangeBound.h note: Fields are private to match the C++ declaration in the header ab...

**Properties** (2):
  - `type`: `RangeBoundTypes` — [Read-Write] (RangeBoundTypes)
  - `value`: `FrameNumber` — [Read-Write] (FrameNumber)

### `unreal.FrameRate`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A frame rate represented as a fraction comprising 2 integers: a numerator (number of frames), and a denominator (per second). note: The full C++ class is located here: EngineSourceRuntimeCorePublicMis...

**Properties** (2):
  - `denominator`: `int` — [Read-Write] The denominator of the framerate represented as a number of frames per second (e.g. 1 f...
  - `numerator`: `int` — [Read-Write] The numerator of the framerate represented as a number of frames per second (e.g. 60 fo...

### `unreal.FrameTime`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Represents a time by a context-free frame number, plus a sub frame value in the range [0:1). note: The full C++ class is located here: EngineSourceRuntimeCorePublicMiscFrameTime.h note: The âSubFram...

**Properties** (2):
  - `frame_number`: `FrameNumber` — [Read-Write] Count of frames from start of timing (FrameNumber)
  - `sub_frame`: `float` — [Read-Write] Time within a frame, always between >= 0 and < 1 (float)

### `unreal.Guid`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A globally unique identifier (mirrored from Guid.h)

**Methods** (1):
  - `to_string()` -> `str` — Converts a GUID value to a string, in the form âA-B-C-Dâ

### `unreal.InputDeviceId`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Represents a single input device such as a gamepad, keyboard, or mouse.

**Methods** (4):
  - `__eq__(other: object)` -> `bool` — Overloads:
  - `__ne__(other: object)` -> `bool` — Overloads:
  - `equals(b)` -> `bool` — Returns true if InputDeviceId A is equal to InputDeviceId B (A == B)
  - `not_equal(b)` -> `bool` — Returns true if InputDeviceId A is not equal to InputDeviceId B (A != B)

**Properties** (1):
  - `NONE`: `InputDeviceId` — Static invalid input device (InputDeviceId)

### `unreal.InstancedPropertyBag`
Inherits: `StructBase` | Header: `PropertyBag.h`

Instanced Property Bag

### `unreal.InstancedStruct`
Inherits: `StructBase` | Header: `InstancedStruct.h`

FInstancedStruct works similarly as instanced UObject* property but is USTRUCTs.

### `unreal.Int32Interval`
Inherits: `StructBase` | Header: `NoExportTypes.h`

An interval of integers, defined by inclusive min and max values note: This is a mirror of TInterval<int32>, defined in Interval.h

**Properties** (2):
  - `max`: `int` — [Read-Write] Values must be <= Max (int32)
  - `min`: `int` — [Read-Write] Values must be >= Min (int32)

### `unreal.Int32Range`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A contiguous set of floats described by lower and upper bound values. note: This is a mirror of TRange<int32>, defined in Range.h note: Fields are private to match the C++ declaration in the header ab...

**Properties** (2):
  - `lower_bound`: `Int32RangeBound` — [Read-Write] Holds the rangeâs lower bound. (Int32RangeBound)
  - `upper_bound`: `Int32RangeBound` — [Read-Write] Holds the rangeâs upper bound. (Int32RangeBound)

### `unreal.Int32RangeBound`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Defines a single bound for a range of values. note: This is a mirror of TRangeBound<int32>, defined in RangeBound.h note: Fields are private to match the C++ declaration in the header above.

**Properties** (2):
  - `type`: `RangeBoundTypes` — [Read-Write] Holds the type of the bound. (RangeBoundTypes)
  - `value`: `int` — [Read-Write] Holds the boundâs value. (int32)

### `unreal.InterpCurveFloat`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Describes an entire curve that is used to compute a float output value from a float input. note: This is a mirror of TInterpCurve<float>, defined in InterpCurve.h

**Methods** (1):
  - `keys_from_interp_curve_float()` -> `Array [ RichCurveKeyBP ]` — Cascade curve helpers

**Properties** (3):
  - `is_looped`: `bool` — [Read-Write] Specify whether the curve is looped or not (bool)
  - `loop_key_offset`: `float` — [Read-Write] Specify the offset from the last pointâs input key corresponding to the loop point (f...
  - `points`: `None` — [Read-Write] Holds the collection of interpolation points. (Array[InterpCurvePointFloat])

### `unreal.InterpCurveLinearColor`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Describes an entire curve that is used to compute a color output value from a float input. note: This is a mirror of TInterpCurve<FLinearColor>, defined in InterpCurve.h

**Properties** (3):
  - `is_looped`: `bool` — [Read-Write] Specify whether the curve is looped or not (bool)
  - `loop_key_offset`: `float` — [Read-Write] Specify the offset from the last pointâs input key corresponding to the loop point (f...
  - `points`: `None` — [Read-Write] Holds the collection of interpolation points. (Array[InterpCurvePointLinearColor])

### `unreal.InterpCurvePointFloat`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Describes one specific point on an interpolation curve. note: This is a mirror of TInterpCurvePoint<float>, defined in InterpCurvePoint.h

**Properties** (5):
  - `arrive_tangent`: `float` — [Read-Write] Tangent of curve arriving at this point. (float)
  - `interp_mode`: `InterpCurveMode` — [Read-Write] Interpolation mode between this point and the next one. (InterpCurveMode)
  - `leave_tangent`: `float` — [Read-Write] Tangent of curve leaving this point. (float)
  - `out_val`: `float` — [Read-Write] Float output value type when input is equal to InVal. (float)
  - `val`: `float` — [Read-Write] Float input value that corresponds to this key (eg. time). (float)

### `unreal.InterpCurvePointLinearColor`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Describes one specific point on an interpolation curve. note: This is a mirror of TInterpCurvePoint<FLinearColor>, defined in InterpCurvePoint.h

**Properties** (5):
  - `arrive_tangent`: `LinearColor` — [Read-Write] Tangent of curve arriving at this point. (LinearColor)
  - `interp_mode`: `InterpCurveMode` — [Read-Write] Interpolation mode between this point and the next one. (InterpCurveMode)
  - `leave_tangent`: `LinearColor` — [Read-Write] Tangent of curve leaving this point. (LinearColor)
  - `out_val`: `LinearColor` — [Read-Write] Color output value of when input is equal to InVal. (LinearColor)
  - `val`: `float` — [Read-Write] Float input value that corresponds to this key (eg. time). (float)

### `unreal.InterpCurvePointQuat`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Describes one specific point on an interpolation curve. note: This is a mirror of TInterpCurvePoint<FQuat>, defined in InterpCurvePoint.h

**Properties** (5):
  - `arrive_tangent`: `Quat` — [Read-Write] Tangent of curve arriving at this point. (Quat)
  - `interp_mode`: `InterpCurveMode` — [Read-Write] Interpolation mode between this point and the next one. (InterpCurveMode)
  - `leave_tangent`: `Quat` — [Read-Write] Tangent of curve leaving this point. (Quat)
  - `out_val`: `Quat` — [Read-Write] Quaternion output value of when input is equal to InVal. (Quat)
  - `val`: `float` — [Read-Write] Float input value that corresponds to this key (eg. time). (float)

### `unreal.InterpCurvePointTwoVectors`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Describes one specific point on an interpolation curve. note: This is a mirror of TInterpCurvePoint<FTwoVectors>, defined in InterpCurvePoint.h

**Properties** (5):
  - `arrive_tangent`: `TwoVectors` — [Read-Write] Tangent of curve arriving at this point. (TwoVectors)
  - `interp_mode`: `InterpCurveMode` — [Read-Write] Interpolation mode between this point and the next one. (InterpCurveMode)
  - `leave_tangent`: `TwoVectors` — [Read-Write] Tangent of curve leaving this point. (TwoVectors)
  - `out_val`: `TwoVectors` — [Read-Write] Two 3D vectors output value of when input is equal to InVal. (TwoVectors)
  - `val`: `float` — [Read-Write] Float input value that corresponds to this key (eg. time). (float)

### `unreal.InterpCurvePointVector`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Describes one specific point on an interpolation curve. note: This is a mirror of TInterpCurvePoint<FVector>, defined in InterpCurvePoint.h

**Properties** (5):
  - `arrive_tangent`: `Vector` — [Read-Write] Tangent of curve arriving at this point. (Vector)
  - `interp_mode`: `InterpCurveMode` — [Read-Write] Interpolation mode between this point and the next one. (InterpCurveMode)
  - `leave_tangent`: `Vector` — [Read-Write] Tangent of curve leaving this point. (Vector)
  - `out_val`: `Vector` — [Read-Write] 3D vector output value of when input is equal to InVal. (Vector)
  - `val`: `float` — [Read-Write] Float input value that corresponds to this key (eg. time). (float)

### `unreal.InterpCurvePointVector2D`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Describes one specific point on an interpolation curve. note: This is a mirror of TInterpCurvePoint<FVector2D>, defined in InterpCurvePoint.h

**Properties** (5):
  - `arrive_tangent`: `Vector2D` — [Read-Write] Tangent of curve arriving at this point. (Vector2D)
  - `interp_mode`: `InterpCurveMode` — [Read-Write] Interpolation mode between this point and the next one. (InterpCurveMode)
  - `leave_tangent`: `Vector2D` — [Read-Write] Tangent of curve leaving this point. (Vector2D)
  - `out_val`: `Vector2D` — [Read-Write] 2D vector output value of when input is equal to InVal. (Vector2D)
  - `val`: `float` — [Read-Write] Float input value that corresponds to this key (eg. time). (float)

### `unreal.InterpCurveQuat`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Describes an entire curve that is used to compute a quaternion output value from a float input. note: This is a mirror of TInterpCurve<FQuat>, defined in InterpCurve.h

**Properties** (3):
  - `is_looped`: `bool` — [Read-Write] Specify whether the curve is looped or not (bool)
  - `loop_key_offset`: `float` — [Read-Write] Specify the offset from the last pointâs input key corresponding to the loop point (f...
  - `points`: `None` — [Read-Write] Holds the collection of interpolation points. (Array[InterpCurvePointQuat])

### `unreal.InterpCurveTwoVectors`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Describes an entire curve that is used to compute two 3D vector values from a float input. note: This is a mirror of TInterpCurve<FTwoVectors>, defined in InterpCurve.h

**Methods** (1):
  - `keys_from_interp_curve_two_vectors(component_idx)` -> `Array [ RichCurveKeyBP ]` — Keys from Interp Curve Two Vectors

**Properties** (3):
  - `is_looped`: `bool` — [Read-Write] Specify whether the curve is looped or not (bool)
  - `loop_key_offset`: `float` — [Read-Write] Specify the offset from the last pointâs input key corresponding to the loop point (f...
  - `points`: `None` — [Read-Write] Holds the collection of interpolation points. (Array[InterpCurvePointTwoVectors])

### `unreal.InterpCurveVector`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Describes an entire curve that is used to compute a 3D vector output value from a float input. note: This is a mirror of TInterpCurve<FVector>, defined in InterpCurve.h

**Methods** (1):
  - `keys_from_interp_curve_vector(component_idx)` -> `Array [ RichCurveKeyBP ]` — Keys from Interp Curve Vector

**Properties** (3):
  - `is_looped`: `bool` — [Read-Write] Specify whether the curve is looped or not (bool)
  - `loop_key_offset`: `float` — [Read-Write] Specify the offset from the last pointâs input key corresponding to the loop point (f...
  - `points`: `None` — [Read-Write] Holds the collection of interpolation points. (Array[InterpCurvePointVector])

### `unreal.InterpCurveVector2D`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Describes an entire curve that is used to compute a 2D vector output value from a float input. note: This is a mirror of TInterpCurve<FVector2D>, defined in InterpCurve.h

**Methods** (1):
  - `keys_from_interp_curve_vector2d(component_idx)` -> `Array [ RichCurveKeyBP ]` — Keys from Interp Curve Vector 2D

**Properties** (3):
  - `is_looped`: `bool` — [Read-Write] Specify whether the curve is looped or not (bool)
  - `loop_key_offset`: `float` — [Read-Write] Specify the offset from the last pointâs input key corresponding to the loop point (f...
  - `points`: `None` — [Read-Write] Holds the collection of interpolation points. (Array[InterpCurvePointVector2D])

### `unreal.IntPoint`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Screen coordinates. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathIntPoint.h

**Methods** (20):
  - `__add__(other: IntPoint)` -> `None` — Overloads:
  - `__eq__(other: object)` -> `bool` — Overloads:
  - `__iadd__(other: IntPoint)` -> `None` — Overloads:
  - `__imul__(other: IntPoint)` -> `None` — Overloads:
  - `__isub__(other: IntPoint)` -> `None` — Overloads:
  - `__mul__(other: IntPoint)` -> `None` — Overloads:
  - `__ne__(other: object)` -> `bool` — Overloads:
  - `__sub__(other: IntPoint)` -> `None` — Overloads:
  - `__truediv__(other: IntPoint)` -> `None` — Overloads:
  - `add(b)` -> `IntPoint` — Returns IntPoint A added by B
  - `add_int(b)` -> `IntPoint` — Addition (A - B)
  - `divide(b)` -> `IntPoint` — Returns IntPoint A divided by B
  - `divide_int(b)` -> `IntPoint` — Division (A * B)
  - `equals(b)` -> `bool` — Returns true if IntPoint A is equal to IntPoint B (A == B)
  - `multiply(b)` -> `IntPoint` — Returns IntPoint A multiplied by B
  - `multiply_int(b)` -> `IntPoint` — Multiplication (A * B)
  - `not_equal(b)` -> `bool` — Returns true if IntPoint A is NOT equal to IntPoint B (A != B)
  - `subtract(b)` -> `IntPoint` — Returns IntPoint A subtracted by B
  - `subtract_int(b)` -> `IntPoint` — Subtraction (A - B)
  - `vector2d()` -> `Vector2D` — Converts an IntPoint to a Vector2D

**Properties** (8):
  - `DOWN`: `IntPoint` — Down Int Point (0, 1) (IntPoint)
  - `LEFT`: `IntPoint` — Left Int Point (-1, 0) (IntPoint)
  - `ONE`: `IntPoint` — One Int Point (1, 1) (IntPoint)
  - `RIGHT`: `IntPoint` — Right Int Point (1, 0) (IntPoint)
  - `UP`: `IntPoint` — Up Int Point (0, -1) (IntPoint)
  - `ZERO`: `IntPoint` — Zero Int Point (0, 0) (IntPoint)
  - `x`: `int` — [Read-Write] (int32)
  - `y`: `int` — [Read-Write] (int32)

### `unreal.IntRect`
Inherits: `StructBase` | Header: `NoExportTypes.h`

An integer rectangle in 2D space. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathIntRect.h

**Properties** (2):
  - `max`: `IntPoint` — [Read-Write] (IntPoint)
  - `min`: `IntPoint` — [Read-Write] (IntPoint)

### `unreal.IntVector`
Inherits: `StructBase` | Header: `NoExportTypes.h`

An integer vector in 3D space. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathIntVector.h

**Properties** (3):
  - `x`: `int` — [Read-Write] (int32)
  - `y`: `int` — [Read-Write] (int32)
  - `z`: `int` — [Read-Write] (int32)

### `unreal.IntVector2`
Inherits: `StructBase` | Header: `NoExportTypes.h`

An integer vector in 4D space. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathIntVector.h

**Properties** (2):
  - `x`: `int` — [Read-Write] (int32)
  - `y`: `int` — [Read-Write] (int32)

### `unreal.IntVector4`
Inherits: `StructBase` | Header: `NoExportTypes.h`

An integer vector in 4D space. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathIntVector.h

**Properties** (4):
  - `w`: `int` — [Read-Write] (int32)
  - `x`: `int` — [Read-Write] (int32)
  - `y`: `int` — [Read-Write] (int32)
  - `z`: `int` — [Read-Write] (int32)

### `unreal.LinearColor`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A linear, 32-bit/component floating point RGBA color. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathColor.h

**Methods** (43):
  - `__add__(other: LinearColor)` -> `None` — Overloads:
  - `__eq__(other: object)` -> `bool` — Overloads:
  - `__iadd__(other: LinearColor)` -> `None` — Overloads:
  - `__imul__(other: LinearColor)` -> `None` — Overloads:
  - `__isub__(other: LinearColor)` -> `None` — Overloads:
  - `__mul__(other: LinearColor)` -> `None` — Overloads:
  - `__ne__(other: object)` -> `bool` — Overloads:
  - `__sub__(other: LinearColor)` -> `None` — Overloads:
  - `__truediv__(other: LinearColor)` -> `None` — Overloads:
  - `add(b)` -> `LinearColor` — Element-wise addition of two linear colors (R+R, G+G, B+B, A+A)
  - `desaturated(desaturation)` -> `LinearColor` — Returns a desaturated color, with 0 meaning no desaturation and 1 == full desaturation
  - `distance(c2)` -> `float` — Euclidean distance between two color points.
  - `divide(b)` -> `LinearColor` — Element-wise multiplication of two linear colors (R/R, G/G, B/B, A/A)
  - `equals(b)` -> `bool` — Returns true if linear color A is equal to linear color B (A == B) within a specified error tolerance
  - `get_luminance()` -> `float` — Returns the perceived brightness of a color on a display taking into account the impact on the human eye per color chann...
  - `get_max()` -> `float` — Returns the maximum color channel value in this color structure
  - `get_min()` -> `float` — Returns the minimum color channel value in this color structure
  - `hsv_into_rgb()` -> `LinearColor` — Converts a HSV linear color (where H is in R (0..360), S is in G (0..1), and V is in B (0..1)) to RGB
  - `hsv_to_rgb()` -> `LinearColor` — Converts a HSV linear color (where H is in R, S is in G, and V is in B) to linear RGB
  - `interpolate_to(target, delta_time, interp_speed)` -> `LinearColor` — Interpolate Linear Color from Current to Target. Scaled by distance to Target, so it has a strong start speed and ease o...
  - `is_near_equal(b, tolerance = 0.000100)` -> `bool` — Returns true if linear color A is equal to linear color B (A == B) within a specified error tolerance
  - `lerp_to(b, alpha)` -> `LinearColor` — Linearly interpolates between A and B based on Alpha (100% of A when Alpha=0 and 100% of B when Alpha=1)
  - `lerp_using_hsv_to(b, alpha)` -> `LinearColor` — Linearly interpolates between two colors by the specified Alpha amount (100% of A when Alpha=0 and 100% of B when Alpha=...
  - `multiply(b)` -> `LinearColor` — Element-wise multiplication of two linear colors (R*R, G*G, B*B, A*A)
  - `multiply_float(b)` -> `LinearColor` — Element-wise multiplication of a linear color by a float (F*R, F*G, F*B, F*A)
  - `not_equal(b)` -> `bool` — Returns true if linear color A is not equal to linear color B (A != B) within a specified error tolerance
  - `quantize()` -> `Color` — Quantizes the linear color and returns the result as an 8-bit color. This bypasses the SRGB conversion. deprecated: Use ...
  - `quantize_round()` -> `Color` — Quantizes the linear color with rounding and returns the result as an 8-bit color. This bypasses the SRGB conversion.
  - `rgb_into_hsv()` -> `LinearColor` — Converts a RGB linear color to HSV (where H is in R (0..360), S is in G (0..1), and V is in B (0..1))
  - `rgb_into_hsv_components(s=float, v=float, a=float)` — Breaks apart a color into individual HSV components (as well as alpha) (Hue is [0..360) while Saturation and Value are 0...
  - `rgb_to_hsv()` -> `LinearColor` — Converts a RGB linear color to HSV (where H is in R, S is in G, and V is in B)
  - `set(color)` -> `None` — Assign contents of InColor
  - `set_from_hsv(h, s, v, a = 1.000000)` -> `None` — Assigns an HSV color to a linear space RGB color
  - `set_from_pow22(color)` -> `None` — Assigns an FColor coming from an observed Pow(1/2.2) output, into a linear color.
  - `set_from_srgb(srgb)` -> `None` — Assigns an FColor coming from an observed sRGB output, into a linear color.
  - `set_random_hue()` -> `None` — Sets to a random color. Choses a quite nice color based on a random hue.
  - `set_rgba(r, g, b, a = 1.000000)` -> `None` — Assign individual linear RGBA components.
  - `set_temperature(temperature)` -> `None` — Converts temperature in Kelvins of a black body radiator to RGB chromaticity.
  - `subtract(b)` -> `LinearColor` — Element-wise subtraction of two linear colors (R-R, G-G, B-B, A-A)
  - `to_color(use_srgb = True)` -> `Color` — Quantizes the linear color and returns the result as a FColor with optional sRGB conversion and quality as goal.
  - `to_new_opacity(opacity)` -> `LinearColor` — Returns a copy of this color using the specified opacity/alpha.
  - `to_rgb_vector()` -> `Vector` — Converts a LinearColor to a vector
  - `to_rgbe()` -> `Color` — Converts from linear to 8-bit RGBE as outlined in Gregory Wardâs Real Pixels article, Graphics Gems II, page 80.

**Properties** (12):
  - `BLACK`: `LinearColor` — Black linear color (LinearColor)
  - `BLUE`: `LinearColor` — Blue linear color (LinearColor)
  - `GRAY`: `LinearColor` — Grey linear color (LinearColor)
  - `GREEN`: `LinearColor` — Green linear color (LinearColor)
  - `RED`: `LinearColor` — Red linear color (LinearColor)
  - `TRANSPARENT`: `LinearColor` — Transparent linear color - black with 0 opacity/alpha (LinearColor)
  - `WHITE`: `LinearColor` — White linear color (LinearColor)
  - `YELLOW`: `LinearColor` — Yellow linear color (LinearColor)
  - `a`: `float` — [Read-Write] (float)
  - `b`: `float` — [Read-Write] (float)
  - `g`: `float` — [Read-Write] (float)
  - `r`: `float` — [Read-Write] (float)

### `unreal.Matrix`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A 4x4 matrix. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathMatrix.h

**Methods** (50):
  - `__add__(other: Matrix)` -> `None` — Overloads:
  - `__eq__(other: object)` -> `bool` — Overloads:
  - `__iadd__(other: Matrix)` -> `None` — Overloads:
  - `__imul__(other: Matrix)` -> `None` — Overloads:
  - `__mul__(other: Matrix)` -> `None` — Overloads:
  - `__ne__(other: object)` -> `bool` — Overloads:
  - `add(b)` -> `Matrix` — Gets the result of adding a matrix to this.
  - `apply_scale(scale)` -> `Matrix` — Apply Scale to this matrix (Assumes Matrix represents a transform)
  - `concatenate_translation(translation)` -> `Matrix` — Returns a matrix with an additional translation concatenated. (Assumes Matrix represents a transform)
  - `contains_na_n()` -> `bool` — Returns true if any element of this matrix is NaN
  - `equals(b, tolerance = 0.000100)` -> `bool` — Checks whether another Matrix is equal to this, within specified tolerance.
  - `get_column(column)` -> `Vector` — get a column of this matrix
  - `get_determinant()` -> `float`
  - `get_frustum_bottom_plane()` -> `Plane or None` — Get the bottom plane of the Frustum of this matrix (Assumes Matrix represents a View Projection Matrix)
  - `get_frustum_far_plane()` -> `Plane or None` — Get the far plane of the Frustum of this matrix (Assumes Matrix represents a View Projection Matrix)
  - `get_frustum_left_plane()` -> `Plane or None` — Get the left plane of the Frustum of this matrix (Assumes Matrix represents a View Projection Matrix)
  - `get_frustum_near_plane()` -> `Plane or None` — Get the near plane of the Frustum of this matrix (Assumes Matrix represents a View Projection Matrix)
  - `get_frustum_right_plane()` -> `Plane or None` — Get the right plane of the Frustum of this matrix (Assumes Matrix represents a View Projection Matrix)
  - `get_frustum_top_plane()` -> `Plane or None` — Get the top plane of the Frustum of this matrix (Assumes Matrix represents a View Projection Matrix)
  - `get_inverse()` -> `Matrix` — Get the inverse of the Matrix. Handles nil matrices.
  - `get_matrix_without_scale(tolerance = 0.000000)` -> `Matrix` — Returns matrix after RemoveScaling with error Tolerance (Assumes Matrix represents a transform)
  - `get_maximum_axis_scale()` -> `float`
  - `get_origin()` -> `Vector` — Get the origin of the co-ordinate system (Assumes Matrix represents a transform)
  - `get_rot_determinant()` -> `float`
  - `get_rotator()` -> `Rotator` — Get the rotator representation of this matrix (Assumes Matrix represents a transform)
  - `get_scale_vector(tolerance = 0.000000)` -> `Vector` — return a 3D scale vector calculated from this matrix (where each component is the magnitude of a row vector) with error ...
  - `get_scaled_axes(y=Vector, z=Vector)` — get axes of this matrix scaled by the scale of the matrix (Assumes Matrix represents a transform)
  - `get_scaled_axis(axis)` -> `Vector` — get axis of this matrix scaled by the scale of the matrix (Assumes Matrix represents a transform)
  - `get_transpose_adjoint()` -> `Matrix` — Get the Transose Adjoint of the Matrix.
  - `get_transposed()` -> `Matrix` — Transpose.
  - `get_unit_axes(y=Vector, z=Vector)` — get unit length axes of this matrix (Assumes Matrix represents a transform)
  - `get_unit_axis(axis)` -> `Vector` — get unit length axis of this matrix (Assumes Matrix represents a transform)
  - `inverse_transform_position(v)` -> `Vector` — Inverts the matrix and then transforms V - correctly handles scaling in this matrix. (Assumes Matrix represents a transf...
  - `inverse_transform_vector(v)` -> `Vector` — Transform a direction vector by the inverse of this matrix - will not take into account translation part. If you want to...
  - `mirror(mirror_axis, flip_axis)` -> `Matrix` — Utility for mirroring this transform across a certain plane, and flipping one of the axis as well. (Assumes Matrix repre...
  - `multiply(b)` -> `Matrix` — Gets the result of multiplying a Matrix to this.
  - `multiply_float(b)` -> `Matrix` — Multiplies all values of the matrix by a float. If your Matrix represents a Transform that you wish to scale you should ...
  - `not_equal(b, tolerance = 0.000100)` -> `bool` — Checks whether another Matrix is not equal to this, within specified tolerance.
  - `remove_scaling(tolerance = 0.000000)` -> `None` — Remove any scaling from this matrix (ie magnitude of each row is 1) with error Tolerance (Assumes Matrix represents a tr...
  - `remove_translation()` -> `Matrix` — Remove any translation from this matrix (Assumes Matrix represents a transform)
  - `rotator()` -> `Rotator` — Converts a Matrix to a Rotator (Assumes Matrix represents a transform)
  - `scale_translation(scale3d)` -> `Matrix` — Scale the translation part of the matrix by the supplied vector. (Assumes Matrix represents a transform)
  - `set_axis(axis, axis_vector)` -> `None` — set an axis of this matrix (Assumes Matrix represents a transform)
  - `set_column(column, value)` -> `None` — Matrix Set Column
  - `set_origin(new_origin)` -> `None` — Set the origin of the coordinate system to the given vector (Assumes Matrix represents a transform)
  - `to_quat()` -> `Quat` — Transform a rotation matrix into a quaternion. (Assumes Matrix represents a transform) warning: rotation part will need ...
  - `transform()` -> `Transform` — Converts a Matrix to a Transform (Assumes Matrix represents a transform)
  - `transform_position(v)` -> `Vector4` — Transform a location - will take into account translation part of the FMatrix. (Assumes Matrix represents a transform)
  - `transform_vector(v)` -> `Vector4` — Transform a direction vector - will not take into account translation part of the FMatrix. If you want to transform a su...
  - `transform_vector4(v)` -> `Vector4` — Transform a vector by the matrix. (Assumes Matrix represents a transform)

**Properties** (5):
  - `IDENTITY`: `Matrix` — Identity matrix (Matrix)
  - `w_plane`: `Plane` — [Read-Write] (Plane)
  - `x_plane`: `Plane` — [Read-Write] (Plane)
  - `y_plane`: `Plane` — [Read-Write] (Plane)
  - `z_plane`: `Plane` — [Read-Write] (Plane)

### `unreal.Matrix44f`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A 4x4 matrix. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathMatrix.h

### `unreal.PackedRemoteObjectPathName`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Packed Remote Object Path Name

### `unreal.PerPlatformBool`
Inherits: `StructBase` | Header: `PerPlatformProperties.h`

FPerPlatformBool - bool property with per-platform overrides

### `unreal.PerPlatformFloat`
Inherits: `StructBase` | Header: `PerPlatformProperties.h`

FPerPlatformFloat - float property with per-platform overrides

**Properties** (1):
  - `default`: `float` [Read-Only] — [Read-Only] (float)

### `unreal.PerPlatformFrameRate`
Inherits: `StructBase` | Header: `PerPlatformProperties.h`

FPerPlatformFrameRate - FFrameRate property with per-platform overrides

### `unreal.PerPlatformInt`
Inherits: `StructBase` | Header: `PerPlatformProperties.h`

FPerPlatformInt - int32 property with per-platform overrides

**Properties** (1):
  - `default`: `int` [Read-Only] — [Read-Only] (int32)

### `unreal.Plane`
Inherits: `Vector` | Header: `NoExportTypes.h`

A plane definition in 3D space. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathPlane.h

**Properties** (1):
  - `w`: `float` — [Read-Write] (double)

### `unreal.Plane4f`
Inherits: `Vector3f` | Header: `NoExportTypes.h`

A plane definition in 3D space. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathPlane.h

### `unreal.PlatformInputDeviceState`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Data about an input deviceâs current state

**Properties** (2):
  - `connection_state`: `InputDeviceConnectionState` [Read-Only] — [Read-Only] The connection state of this input device (InputDeviceConnectionState)
  - `owning_platform_user`: `PlatformUserId` [Read-Only] — [Read-Only] The platform user that this input device belongs to (PlatformUserId)

### `unreal.PlatformUserId`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Handle that defines a local user on this platform. This used to be just a typedef int32 that was used interchangeably as ControllerId and LocalUserIndex. Moving forward these will be allocated by the ...

**Methods** (4):
  - `__eq__(other: object)` -> `bool` — Overloads:
  - `__ne__(other: object)` -> `bool` — Overloads:
  - `equals(b)` -> `bool` — Returns true if PlatformUserId A is equal to PlatformUserId B (A == B)
  - `not_equal(b)` -> `bool` — Returns true if PlatformUserId A is not equal to PlatformUserId B (A != B)

**Properties** (1):
  - `NONE`: `PlatformUserId` — Static invalid platform user (PlatformUserId)

### `unreal.PolyglotTextData`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Polyglot data that may be registered to the text localization manager at runtime. note: This struct is mirrored in PolyglotTextData.h

**Properties** (7):
  - `category`: `LocalizedTextSourceCategory` — [Read-Write] The category of this polyglot data.
note: This affects when and how the data is loaded ...
  - `is_minimal_patch`: `bool` — [Read-Write] True if this polyglot data is a minimal patch, and that missing translations should be
...
  - `key`: `str` — [Read-Write] The key of the text created from this polyglot data.
note: This must not be empty. (str...
  - `localized_strings`: `None` — [Read-Write] Mapping between a culture code and its localized string.
note: The native culture may a...
  - `namespace`: `str` — [Read-Write] The namespace of the text created from this polyglot data.
note: This may be empty. (st...
  - `native_culture`: `str` — [Read-Write] The native culture of this polyglot data.
note: This may be empty, and if empty, will b...
  - `native_string`: `str` — [Read-Write] The native string for this polyglot data.
note: This must not be empty (it should be th...

### `unreal.PrimaryAssetId`
Inherits: `StructBase` | Header: `NoExportTypes.h`

This identifies an object as a âprimaryâ asset that can be searched for by the AssetManager and used in various tools note: The full C++ class is located here: EngineSourceRuntimeCoreUObjectPublic...

**Methods** (11):
  - `__bool__()` -> `bool` — Returns true if the Primary Asset Id is valid
  - `__eq__(other: object)` -> `bool` — Overloads:
  - `__ne__(other: object)` -> `bool` — Overloads:
  - `get_class()` — Returns the Blueprint Class associated with a Primary Asset Id, this will only return a valid object if it is in memory,...
  - `get_current_bundle_state(force_current_state)` -> `Array[Name] or None` — Returns the list of loaded bundles for a given Primary Asset. This will return false if the asset is not loaded at all. ...
  - `get_object()` -> `Object` — Returns the Object associated with a Primary Asset Id, this will only return a valid object if it is in memory, it will ...
  - `get_soft_class_reference()` -> `Class` — Returns the Blueprint Class Id associated with a Primary Asset Id, this works even if the asset is not loaded
  - `get_soft_object_reference()` -> `Object` — Returns the Object Id associated with a Primary Asset Id, this works even if the asset is not loaded
  - `is_valid()` -> `bool` — Returns true if the Primary Asset Id is valid
  - `to_string()` -> `str` — Converts a Primary Asset Id to a string. The other direction is not provided because it cannot be validated
  - `unload()` -> `None` — Unloads a primary asset, which allows it to be garbage collected if nothing else is referencing it

**Properties** (2):
  - `primary_asset_name`: `Name` — [Read-Write] The Name of this object, by default its short name (Name)
  - `primary_asset_type`: `PrimaryAssetType` — [Read-Write] The Type of this object, by default its base classâs name (PrimaryAssetType)

### `unreal.PrimaryAssetType`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A type of primary asset, used by the Asset Manager system. note: The full C++ class is located here: EngineSourceRuntimeCoreUObjectPublicUObjectPrimaryAssetId.h

**Methods** (6):
  - `__bool__()` -> `bool` — Returns list of Primary Asset Ids for a PrimaryAssetType
  - `__eq__(other: object)` -> `bool` — Overloads:
  - `__ne__(other: object)` -> `bool` — Overloads:
  - `get_primary_asset_id_list()` -> `Array [ PrimaryAssetId ]` — Returns list of PrimaryAssetIds for a PrimaryAssetType
  - `is_valid()` -> `bool` — Returns list of Primary Asset Ids for a PrimaryAssetType
  - `to_string()` -> `str` — Converts a Primary Asset Type to a string. The other direction is not provided because it cannot be validated

**Properties** (1):
  - `name`: `Name` — [Read-Write] The Type of this object, by default its base classâs name (Name)

### `unreal.QualifiedTime`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A frame time qualified by a frame rate context. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMiscQualifiedFrameTime.h

**Properties** (2):
  - `rate`: `FrameRate` — [Read-Write] The rate that this frame time is in (FrameRate)
  - `time`: `FrameTime` — [Read-Write] The frame time (FrameTime)

### `unreal.Quat`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Quaternion. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathQuat.h

**Methods** (42):
  - `__add__(other: Quat)` -> `None` — Overloads:
  - `__eq__(other: object)` -> `bool` — Overloads:
  - `__iadd__(other: Quat)` -> `None` — Overloads:
  - `__imul__(other: Quat)` -> `None` — Overloads:
  - `__isub__(other: Quat)` -> `None` — Overloads:
  - `__mul__(other: Quat)` -> `None` — Overloads:
  - `__ne__(other: object)` -> `bool` — Overloads:
  - `__sub__(other: Quat)` -> `None` — Overloads:
  - `add(b)` -> `Quat` — Returns addition of Vector A and Vector B (A + B)
  - `angular_distance(b)` -> `float` — Find the angular distance/difference between two rotation quaternions.
  - `ensure_shortest_arc_to(b)` -> `None` — Modify the quaternion to ensure that the delta between it and B represents the shortest possible rotation angle.
  - `equals(b, tolerance = 0.000100)` -> `bool` — Returns true if Quaternion A is equal to Quaternion B (A == B) within a specified error tolerance
  - `euler()` -> `Vector` — Convert a Quaternion into floating-point Euler angles (in degrees).
  - `exp()` -> `Quat` — Used in combination with Log(). Assumes a quaternion with W=0 and V=theta*v (where |v| = 1). Exp(q) = (sin(theta)*v, cos...
  - `get_angle()` -> `float` — Get the angle of this quaternion
  - `get_axis_x()` -> `Vector` — Get the forward direction (X axis) after it has been rotated by this Quaternion.
  - `get_axis_y()` -> `Vector` — Get the right direction (Y axis) after it has been rotated by this Quaternion.
  - `get_axis_z()` -> `Vector` — Get the up direction (Z axis) after it has been rotated by this Quaternion.
  - `get_rotation_axis()` -> `Vector` — Get the axis of rotation of the Quaternion. This is the axis around which rotation occurs to transform the canonical coo...
  - `interp_spring_to(target, spring_state, stiffness, critical_damping_factor, delta_time, mass=1.000000, target_velocity_amount=1.000000, spring_state=QuaternionSpringState)` — Uses a simple spring model to interpolate a quaternion from Current to Target.
  - `inversed()` -> `Quat` — Return an inversed copy of this quaternion.
  - `is_finite()` -> `bool` — Determine if all the values are finite (not NaN nor Inf) in this Quat.
  - `is_identity(tolerance = 0.000100)` -> `bool` — Checks whether this Quaternion is an Identity Quaternion. Assumes Quaternion tested is normalized.
  - `is_non_finite()` -> `bool` — Determine if there are any non-finite values (NaN or Inf) in this Quat.
  - `is_normalized()` -> `bool` — Return true if this quaternion is normalized
  - `log()` -> `Quat` — Quaternion with W=0 and V=theta*v. Used in combination with Exp().
  - `multiply(b)` -> `Quat` — Gets the result of multiplying two quaternions (A * B). Order matters when composing quaternions: C = A * B will yield a...
  - `normalize(tolerance = 0.000100)` -> `None` — Normalize this quaternion if it is large enough as compared to the supplied tolerance. If it is too small then set it to...
  - `normalized(tolerance = 0.000100)` -> `Quat` — Get a normalized copy of this quaternion. If it is too small, returns an identity quaternion.
  - `not_equal(b, error_tolerance = 0.000100)` -> `bool` — Returns true if Quat A is not equal to Quat B (A != B) within a specified error tolerance
  - `rotate_vector(v)` -> `Vector` — Rotate a vector by this quaternion.
  - `rotator()` -> `Rotator` — Converts to Rotator representation of this Quaternion.
  - `set_components(x, y, z, w)` -> `None` — Set X, Y, Z, W components of Quaternion.
  - `set_from_euler(euler)` -> `None` — Convert a vector of floating-point Euler angles (in degrees) into a Quaternion.
  - `size()` -> `float` — Get the length of the quaternion.
  - `size_squared()` -> `float` — Get the squared length of the quaternion.
  - `slerp_quat(b, alpha)` -> `Quat` — Spherical interpolation between Quaternions. Result is normalized.
  - `subtract(b)` -> `Quat` — Returns subtraction of Vector B from Vector A (A - B)
  - `unrotate_vector(v)` -> `Vector` — Rotate a vector by the inverse of this quaternion.
  - `vector_forward()` -> `Vector` — Get the forward direction (X axis) after it has been rotated by this Quaternion.
  - `vector_right()` -> `Vector` — Get the right direction (Y axis) after it has been rotated by this Quaternion.
  - `vector_up()` -> `Vector` — Get the up direction (Z axis) after it has been rotated by this Quaternion.

**Properties** (5):
  - `IDENTITY`: `Quat` — Identity quaternion constant (Quat)
  - `w`: `float` — [Read-Write] (double)
  - `x`: `float` — [Read-Write] (double)
  - `y`: `float` — [Read-Write] (double)
  - `z`: `float` — [Read-Write] (double)

### `unreal.Quat4d`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Quaternion. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathQuat.h

### `unreal.Quat4f`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Quaternion. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathQuat.h

### `unreal.RandomStream`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Thread-safe random number generator that can be manually seeded. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathRandomStream.h

**Methods** (17):
  - `generate_new_seed()` -> `None` — Create a new random seed for a random stream
  - `random_bool()` -> `bool` — Returns a random bool
  - `random_bool_with_weight(weight = 0.500000)` -> `bool`
  - `random_float()` -> `float` — Returns a random float between 0 and 1
  - `random_float_in_range(min, max)` -> `float` — Generate a random number between Min and Max
  - `random_int(max)` -> `int32` — Returns a uniformly distributed random number between 0 and Max - 1
  - `random_int_in_range(min, max)` -> `int32` — Return a random integer between Min and Max (>= Min and <= Max)
  - `random_point_in_bounded_box(center, half_size)` -> `Vector` — Returns a random point within the specified bounding box using the first vector as an origin and the second as the half ...
  - `random_point_in_box(box)` -> `Vector` — Returns a random point within the specified bounding box.
  - `random_rotator(roll)` -> `Rotator` — Create a random rotation
  - `random_unit_vector()` -> `Vector` — Returns a random vector with length of 1.0
  - `random_unit_vector_in_cone_in_degrees(cone_dir, cone_half_angle_in_degrees)` -> `Vector` — Returns a random vector with length of 1, within the specified cone, with uniform random distribution.
  - `random_unit_vector_in_cone_in_radians(cone_dir, cone_half_angle_in_radians)` -> `Vector` — Returns a random vector with length of 1, within the specified cone, with uniform random distribution.
  - `random_unit_vector_in_elliptical_cone_in_degrees(cone_dir, max_yaw_in_degrees, max_pitch_in_degrees)` -> `Vector` — Returns a random vector with length of 1, within the specified cone, with uniform random distribution. The shape of the ...
  - `random_unit_vector_in_elliptical_cone_in_radians(cone_dir, max_yaw_in_radians, max_pitch_in_radians)` -> `Vector` — Returns a random vector with length of 1, within the specified cone, with uniform random distribution. The shape of the ...
  - `reset()` -> `None` — Reset a random stream
  - `set_seed(new_seed)` -> `None` — Set the seed of a random stream to a specific number

**Properties** (1):
  - `initial_seed`: `int` — [Read-Write] Holds the initial seed. (int32)

### `unreal.Ray`
Inherits: `StructBase` | Header: `NoExportTypes.h`

3D Ray represented by Origin and (normalized) Direction. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathRay.h

**Methods** (11):
  - `get_ray_box_intersection(box)` -> `double or None` — Find the intersection of a Ray and a Box
  - `get_ray_closest_point(point)` -> `Vector` — Get the closest point on the Ray to the given Point
  - `get_ray_line_closest_point(line_origin, ray_parameter=double, ray_point=Vector, line_parameter=double, line_point=Vector)` — Compute the pair of closest points on a 3D Ray and Line. The Line is defined by an Origin and Direction (ie same as a Ra...
  - `get_ray_parameter(point)` -> `double` — Project the given Point onto the closest point along the Ray, and return the Ray Parameter/Distance at that Point
  - `get_ray_plane_intersection(plane)` -> `double or None` — Find the intersection of a Ray and a Plane
  - `get_ray_point(distance)` -> `Vector` — Get a Point at the given Distance along the Ray (Origin + Distance*Direction)
  - `get_ray_point_distance(point)` -> `double` — Get the distance from Point to the closest point on the Ray
  - `get_ray_segment_closest_point(seg_start_point, ray_parameter=double, ray_point=Vector, seg_point=Vector)` — Compute the pair of closest points on a 3D Ray and Line Segment The Line Segment is defined by its two Endpoints.
  - `get_ray_sphere_intersection(sphere_center, sphere_radius)` -> `(distance1=double, distance2=double) or None` — Check if the Ray intersects a Sphere defined by the SphereCenter and SphereRadius. This function returns two intersectio...
  - `get_ray_start_end(start_distance=0.000000, end_point=Vector)` — Get two points along the ray.
  - `get_transformed_ray(transform, invert = False)` -> `Ray` — Apply the given Transform to the given Ray, or optionally the Transform Inverse, and return the new transformed Ray

**Properties** (2):
  - `direction`: `Vector` — [Read-Write] (Vector)
  - `origin`: `Vector` — [Read-Write] (Vector)

### `unreal.RemoteObjectBytes`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Remote Object Bytes

### `unreal.RemoteObjectData`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Remote Object Data

### `unreal.RemoteObjectId`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Remote Object Id

### `unreal.RemoteObjectPathName`
Inherits: `RemoteObjectTables` | Header: `NoExportTypes.h`

Remote Object Path Name

### `unreal.RemoteObjectReference`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Remote Object Reference

### `unreal.RemoteObjectTables`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Remote Object Tables

### `unreal.RemoteServerId`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Remote Server Id

### `unreal.RemoteTransactionId`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Remote Transaction Id

### `unreal.RemoteWorkPriority`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Remote Work Priority

### `unreal.Rotator`
Inherits: `StructBase` | Header: `NoExportTypes.h`

An orthogonal rotation in 3d space. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathRotator.h

**Methods** (18):
  - `__eq__(other: object)` -> `bool` — Overloads:
  - `__ne__(other: object)` -> `bool` — Overloads:
  - `__neg__()` -> `None` — Negate a rotator
  - `combine(b)` -> `Rotator` — Combine 2 rotations to give you the resulting rotation of first applying A, then B.
  - `delta(b)` -> `Rotator` — Normalized A-B
  - `get_axes(y=Vector, z=Vector)` — Get the reference frame direction vectors (axes) described by this rotation
  - `get_forward_vector()` -> `Vector` — Rotate the world forward vector by the given rotation
  - `get_right_vector()` -> `Vector` — Rotate the world right vector by the given rotation
  - `get_up_vector()` -> `Vector` — Rotate the world up vector by the given rotation
  - `inversed()` -> `Rotator` — Negate a rotator
  - `is_near_equal(b, error_tolerance = 0.000100)` -> `bool` — Returns true if rotator A is equal to rotator B (A == B) within a specified error tolerance
  - `is_not_near_equal(b, error_tolerance = 0.000100)` -> `bool` — Returns true if rotator A is not equal to rotator B (A != B) within a specified error tolerance
  - `lerp(b, alpha, shortest_path)` -> `Rotator` — Linearly interpolates between A and B based on Alpha (100% of A when Alpha=0 and 100% of B when Alpha=1)
  - `quaternion()` -> `Quat` — Converts to Quaternion representation of this Rotator.
  - `scale(b)` -> `Rotator` — Returns rotator representing rotator A scaled by B
  - `scale_integer(b)` -> `Rotator` — Returns rotator representing rotator A scaled by B
  - `to_vector()` -> `Vector` — Get the X direction vector after this rotation
  - `transform()` -> `Transform` — Converts Rotator to Transform

**Properties** (3):
  - `pitch`: `float` — [Read-Write] Pitch (degrees) around Y axis (double)
  - `roll`: `float` — [Read-Write] Roll (degrees) around X axis (double)
  - `yaw`: `float` — [Read-Write] Yaw (degrees) around Z axis (double)

### `unreal.Rotator3d`
Inherits: `StructBase` | Header: `NoExportTypes.h`

An orthogonal rotation in 3d space. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathRotator.h

### `unreal.Rotator3f`
Inherits: `StructBase` | Header: `NoExportTypes.h`

An orthogonal rotation in 3d space. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathRotator.h

### `unreal.SoftClassPath`
Inherits: `SoftObjectPath` | Header: `NoExportTypes.h`

A struct that contains a string reference to a class, can be used to make soft references to classes. note: The full C++ class is located here: EngineSourceRuntimeCoreUObjectPublicUObjectSoftObjectPat...

### `unreal.SoftObjectPath`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A struct that contains a string reference to an object, either a top level asset or a subobject. note: The full C++ class is located here: EngineSourceRuntimeCoreUObjectPublicUObjectSoftObjectPath.h

### `unreal.Sphere`
Inherits: `StructBase` | Header: `NoExportTypes.h`

3D Sphere represented by Center and Radius. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathSphere.h

**Properties** (2):
  - `center`: `Vector` — [Read-Write] (Vector)
  - `w`: `float` — [Read-Write] (double)

### `unreal.TemplateString`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Structure for templated strings that are displayed in the editor with a allowed args.

**Properties** (2):
  - `resolved`: `Text` [Read-Only] — [Read-Only] The resolved (localizable) string. (Text)
  - `template`: `str` — [Read-Write] The format string. (str)

### `unreal.Timecode`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A timecode that stores time in HH:MM:SS format with the remainder of time represented by an integer frame count. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMiscTimeCode.h

**Properties** (6):
  - `drop_frame_format`: `bool` — [Read-Write] If true, this Timecode represents a Drop Frame timecode used to account for fractional ...
  - `frames`: `int` — [Read-Write] (int32)
  - `hours`: `int` — [Read-Write] (int32)
  - `minutes`: `int` — [Read-Write] (int32)
  - `seconds`: `int` — [Read-Write] (int32)
  - `subframe`: `float` — [Read-Write] (float)

### `unreal.Timespan`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A time span value, which is the difference between two dates and times. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMiscTimespan.h

**Properties** (3):
  - `MAX_VALUE`: `Timespan` — Returns the maximum time span value (Timespan)
  - `MIN_VALUE`: `Timespan` — Returns the minimum time span value (Timespan)
  - `ZERO`: `Timespan` — Returns a zero time span value (Timespan)

### `unreal.TopLevelAssetPath`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A struct that can reference a top level asset such as â/Path/To/Package.AssetNameâ note: The full C++ class is located here: EngineSourceRuntimeCoreUObjectPublicUObjectTopLevelAssetPath.h

**Properties** (2):
  - `asset_name`: `Name` — [Read-Write] Name of the asset within the package e.g. âAssetNameâ (Name)
  - `package_name`: `Name` — [Read-Write] Name of the package containing the asset e.g. /Path/To/Package (Name)

### `unreal.Transform`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Transform composed of Quat/Translation/Scale. note: This is implemented in either TransformVectorized.h or TransformNonVectorized.h depending on the platform.

**Methods** (18):
  - `__eq__(other: object)` -> `bool` — Overloads:
  - `__imul__(other: Transform)` -> `None` — Overloads:
  - `__mul__(other: Transform)` -> `None` — Overloads:
  - `determinant()` -> `float` — Calculates the determinant of the transform (converts to FMatrix internally)
  - `equals(b)` -> `bool` — Returns true if transform A is equal to transform B
  - `interp_to(target, delta_time, interp_speed)` -> `Transform` — Tries to reach Target transform based on distance from Current position, giving a nice smooth feeling when tracking a po...
  - `inverse()` -> `Transform` — Returns the inverse of the given transform T. Example: Given a LocalToWorld transform, WorldToLocal will be returned.
  - `inverse_transform_direction(direction)` -> `Vector` — Transform a direction vector by the inverse of the supplied transform - will not change its length. For example, if T wa...
  - `inverse_transform_location(location)` -> `Vector` — Transform a position by the inverse of the supplied transform. For example, if T was an objectâs transform, this would...
  - `inverse_transform_rotation(rotation)` -> `Rotator` — Transform a rotator by the inverse of the supplied transform. For example, if T was an objectâs transform, this would ...
  - `is_near_equal(b, location_tolerance = 0.000100, rotation_tolerance = 0.000100, scale3d_tolerance = 0.000100)` -> `bool` — Returns true if transform A is nearly equal to B
  - `lerp(b, alpha, interp_mode = LerpInterpolationMode.QUAT_INTERP)` -> `Transform` — Linearly interpolates between A and B based on Alpha (100% of A when Alpha=0 and 100% of B when Alpha=1).
  - `make_relative(relative_to)` -> `Transform` — Computes a relative transform of one transform compared to another. Example: ChildOffset = MakeRelativeTransform(Child.G...
  - `multiply(b)` -> `Transform` — Compose two transforms in order: A * B. Order matters when composing transforms: A * B will yield a transform that logic...
  - `to_matrix()` -> `Matrix` — Converts a Transform to a Matrix with scale
  - `transform_direction(direction)` -> `Vector` — Transform a direction vector by the supplied transform - will not change its length. For example, if T was an objectâs...
  - `transform_location(location)` -> `Vector` — Transform a position by the supplied transform. For example, if T was an objectâs transform, this would transform a po...
  - `transform_rotation(rotation)` -> `Rotator` — Transform a rotator by the supplied transform. For example, if T was an objectâs transform, this would transform a rot...

**Properties** (3):
  - `rotation`: `Quat` — [Read-Write] Rotation of this transformation, as a quaternion. (Quat)
  - `scale3d`: `Vector` — [Read-Write] 3D scale (always applied in local space) as a vector. (Vector)
  - `translation`: `Vector` — [Read-Write] Translation of this transformation, as a vector. (Vector)

### `unreal.Transform3d`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Transform composed of Quat/Translation/Scale. note: This is implemented in either TransformVectorized.h or TransformNonVectorized.h depending on the platform.

### `unreal.Transform3f`
Inherits: `StructBase` | Header: `NoExportTypes.h`

Transform composed of Quat/Translation/Scale. note: This is implemented in either TransformVectorized.h or TransformNonVectorized.h depending on the platform.

### `unreal.TwoVectors`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A pair of 3D vectors (mirrored from TwoVectors.h).

**Properties** (2):
  - `v1`: `Vector` — [Read-Write] (Vector)
  - `v2`: `Vector` — [Read-Write] (Vector)

### `unreal.Vector`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A point or direction FVector in 3d space. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathVector.h

**Methods** (101):
  - `__add__(other: Vector)` -> `None` — Overloads:
  - `__eq__(other: object)` -> `bool` — Overloads:
  - `__iadd__(other: Vector)` -> `None` — Overloads:
  - `__imul__(other: Vector)` -> `None` — Overloads:
  - `__isub__(other: Vector)` -> `None` — Overloads:
  - `__mul__(other: Vector)` -> `None` — Overloads:
  - `__ne__(other: object)` -> `bool` — Overloads:
  - `__neg__()` -> `None` — Negate a vector.
  - `__or__(other: Vector)` -> `None` — Overloads:
  - `__sub__(other: Vector)` -> `None` — Overloads:
  - `__truediv__(other: Vector)` -> `None` — Overloads:
  - `__xor__(other: Vector)` -> `None` — Overloads:
  - `add(b)` -> `Vector` — Vector addition
  - `add_bounded(add_vect, radius)` -> `None` — Add a vector to this and clamp the result to an axis aligned cube centered at the origin.
  - `add_float(b)` -> `Vector` — Adds a float to each component of a vector
  - `add_int(b)` -> `Vector` — Adds an integer to each component of a vector
  - `assign(vector)` -> `None` — Assign the values of the supplied vector.
  - `bounded_to_box(box_min, box_max)` -> `Vector` — Get a copy of this vector, clamped inside of the specified axis aligned cube.
  - `bounded_to_cube(radius)` -> `Vector` — Get a copy of this vector, clamped inside of an axis aligned cube centered at the origin.
  - `clamped_size(min, max)` -> `Vector` — Create a copy of this vector, with its magnitude/size/length clamped between Min and Max.
  - `clamped_size2d(min, max)` -> `Vector` — Create a copy of this vector, with the 2D magnitude/size/length clamped between Min and Max. Z is unchanged.
  - `clamped_size_max(max)` -> `Vector` — Create a copy of this vector, with its maximum magnitude/size/length clamped to MaxSize.
  - `clamped_size_max2d(max)` -> `Vector` — Create a copy of this vector, with the maximum 2D magnitude/size/length clamped to MaxSize. Z is unchanged.
  - `cosine_angle2d(b)` -> `double` — Returns the cosine of the angle between this vector and another projected onto the XY plane (no Z).
  - `cross(b)` -> `Vector` — Returns the cross product of two 3d vectors - see http://mathworld.wolfram.com/CrossProduct.html
  - `direction_unit_to(to)` -> `Vector` — Find the unit direction vector from one position to another or (0,0,0) if positions are the same.
  - `distance(v2)` -> `double` — Distance between two points.
  - `distance2d(v2)` -> `double` — Euclidean distance between two points in the XY plane (ignoring Z).
  - `distance2d_squared(v2)` -> `double` — Squared euclidean distance between two points in the XY plane (ignoring Z).
  - `distance_squared(v2)` -> `double` — Squared distance between two points.
  - `divide(b = [1.000000,1.000000,1.000000])` -> `Vector` — Element-wise Vector division (Result = {A.x/B.x, A.y/B.y, A.z/B.z})
  - `divide_float(b = 1.000000)` -> `Vector` — Vector divide by a float
  - `divide_int(b = 1)` -> `Vector` — Vector divide by an integer
  - `dot(b)` -> `double` — Returns the dot product of two 3d vectors - see http://mathworld.wolfram.com/DotProduct.html
  - `equals(b)` -> `bool` — Returns true if vector A is equal to vector B (A == B)
  - `find_quat_between_normals(end_normal)` -> `Quat` — Generates the âsmallestâ (geodesic) rotation around a sphere between two normals (assumed to be unit length).
  - `find_quat_between_vectors(end)` -> `Quat` — Generates the âsmallestâ (geodesic) rotation around a sphere between two vectors of arbitrary length.
  - `get_abs()` -> `Vector` — Get a copy of this vector with absolute value of each component.
  - `get_abs_max()` -> `double` — Find the maximum absolute element (abs(X), abs(Y) or abs(Z)) of a vector
  - `get_abs_min()` -> `double` — Find the minimum absolute element (abs(X), abs(Y) or abs(Z)) of a vector
  - `get_max(b)` -> `Vector` — Find the maximum elements (X, Y and Z) between the two vectorâs components
  - `get_max_element()` -> `double` — Find the maximum element (X, Y or Z) of a vector
  - `get_min(b)` -> `Vector` — Find the minimum elements (X, Y and Z) between the two vectorâs components
  - `get_min_element()` -> `double` — Find the minimum element (X, Y or Z) of a vector
  - `get_projection()` -> `Vector` — Projects 2D components of vector based on Z.
  - `get_sign_vector()` -> `Vector` — Get a copy of the vector as sign only. Each component is set to +1 or -1, with the sign of zero treated as +1.
  - `heading_angle()` -> `double` — Convert a direction vector into a âheadingâ angle.
  - `interp_spring_to()` — Uses a simple spring model to interpolate a vector from Current to Target.
  - `interp_to(target, delta_time, interp_speed)` -> `Vector` — Tries to reach Target based on distance from Current position, giving a nice smooth feeling when tracking a position.
  - `interp_to_constant(target, delta_time, interp_speed)` -> `Vector` — Tries to reach Target at a constant rate.
  - `is_nan()` -> `bool` — Determines if any component is not a number (NAN)
  - `is_near_equal(b, error_tolerance = 0.000100)` -> `bool` — Returns true if vector A is equal to vector B (A == B) within a specified error tolerance
  - `is_nearly_zero(tolerance = 0.000100)` -> `bool` — Checks whether vector is near to zero within a specified tolerance.
  - `is_normal()` -> `bool` — Determines if vector is normalized / unit (length 1).
  - `is_not_near_equal(b, error_tolerance = 0.000100)` -> `bool` — Returns true if vector A is not equal to vector B (A != B) within a specified error tolerance
  - `is_uniform(tolerance = 0.000100)` -> `bool` — Checks whether all components of this vector are the same, within a tolerance.
  - `is_unit(squared_lenth_tolerance = 0.000100)` -> `bool` — Determines if vector is normalized / unit (length 1) within specified squared tolerance.
  - `is_zero()` -> `bool` — Checks whether all components of the vector are exactly zero.
  - `length()` -> `double` — Returns the length of the vector
  - `length2d()` -> `double` — Returns the length of the vectorâs XY components.
  - `length2d_squared()` -> `double` — Returns the squared length of the vectorâs XY components.
  - `length_squared()` -> `double` — Returns the squared length of the vector
  - `lerp_to(b, alpha)` -> `Vector` — Linearly interpolates between A and B based on Alpha (100% of A when Alpha=0 and 100% of B when Alpha=1)
  - `linear_color()` -> `LinearColor` — Converts a vector to LinearColor
  - `mirror_by_plane(plane)` -> `Vector` — Mirrors a vector about a plane.
  - `mirror_by_vector(surface_normal)` -> `Vector` — Given a direction vector and a surface normal, returns the vector reflected across the surface normal. Produces a result...
  - `multiply(b)` -> `Vector` — Element-wise Vector multiplication (Result = {A.x*B.x, A.y*B.y, A.z*B.z})
  - `multiply_float(b)` -> `Vector` — Scales Vector A by B
  - `multiply_int(b)` -> `Vector` — Scales Vector A by B
  - `negated()` -> `Vector` — Negate a vector.
  - `normal(tolerance = 0.000100)` -> `Vector` — Gets a normalized unit copy of the vector, ensuring it is safe to do so based on the length. Returns zero vector if vect...
  - `normal2d(tolerance = 0.000100)` -> `Vector` — Gets a normalized unit copy of the 2D components of the vector, ensuring it is safe to do so. Z is set to zero. Returns ...
  - `normal_unsafe()` -> `Vector` — Calculates normalized unit version of vector without checking for zero length.
  - `normalize(tolerance = 0.000000)` -> `None` — Normalize this vector in-place if it is large enough or set it to (0,0,0) otherwise.
  - `not_equal(b)` -> `bool` — Returns true if vector A is not equal to vector B (A != B)
  - `project_on_to(target)` -> `Vector` — Projects one vector (V) onto another (Target) and returns the projected vector. If Target is nearly zero in length, retu...
  - `project_on_to_normal(normal)` -> `Vector` — Gets a copy of this vector projected onto the input vector, which is assumed to be unit length.
  - `project_on_to_plane(plane_normal)` -> `Vector` — Projects a vector onto a plane defined by a normalized vector (PlaneNormal).
  - `project_point_on_to_plane(plane_base, plane_normal)` -> `Vector` — Projects/snaps a point onto a plane defined by a point on the plane and a plane normal.
  - `quaternion()` -> `Quat` — Return the Quaternion orientation corresponding to the direction in which the vector points. Similar to the FRotator ver...
  - `random_point_in_box_extents(half_size)` -> `Vector` — Returns a random point within the specified bounding box using the first vector as an origin and the second as the box e...
  - `reciprocal()` -> `Vector` — Gets the reciprocal of this vector, avoiding division by zero. Zero components are set to BIG_NUMBER.
  - `rotate(b)` -> `Vector` — Returns result of vector A rotated by Rotator B
  - `rotate_angle_axis(angle_deg, axis)` -> `Vector` — Returns result of vector A rotated by AngleDeg around Axis
  - `rotator()` -> `Rotator` — Return the FRotator orientation corresponding to the direction in which the vector points. Sets Yaw and Pitch to the pro...
  - `rotator_from_axis_and_angle(angle)` -> `Rotator` — Create a rotation from an axis and supplied angle (in degrees)
  - `set(x, y, z)` -> `None` — Set the values of the vector directly.
  - `slerp_normals(normal_b, alpha)` -> `Vector` — Interpolate from normalized vector A to normalized vector B along a spherical path.
  - `slerp_vectors(direction, alpha)` -> `Vector` — Interpolate from a vector to the direction of another vector along a spherical path.
  - `snapped_to_grid(grid_size)` -> `Vector` — Gets a copy of this vector snapped to a grid.
  - `subtract(b)` -> `Vector` — Vector subtraction
  - `subtract_float(b)` -> `Vector` — Subtracts a float from each component of a vector
  - `subtract_int(b)` -> `Vector` — Subtracts an integer from each component of a vector
  - `to_degrees()` -> `Vector` — Converts a vector containing radian values to a vector containing degree values.
  - `to_radians()` -> `Vector` — Converts a vector containing degree values to a vector containing radian values.
  - `transform()` -> `Transform` — Converts a vector to a transform. Uses vector as location
  - `truncated()` -> `IntVector` — Rounds A to an integer with truncation towards zero for each element in a vector. (e.g. -1.7 truncated to -1, 2.8 trunca...
  - `unit_cartesian_to_spherical()` -> `Vector2D` — Converts a Cartesian unit vector into spherical coordinates on the unit sphere.
  - `unrotate(b)` -> `Vector` — Returns result of vector A rotated by the inverse of Rotator B
  - `unwind_euler()` -> `None` — When this vector contains Euler angles (degrees), ensure that angles are between +/-180
  - `vector2d()` -> `Vector2D` — Converts a Vector to a Vector2D using the Vectorâs (X, Y) coordinates

**Properties** (11):
  - `BACKWARD`: `Vector` — 3D vector Unreal backward direction constant (-1,0,0) (Vector)
  - `DOWN`: `Vector` — 3D vector Unreal down direction constant (0,0,-1) (Vector)
  - `FORWARD`: `Vector` — 3D vector Unreal forward direction constant (1,0,0) (Vector)
  - `LEFT`: `Vector` — 3D vector Unreal left direction constant (0,-1,0) (Vector)
  - `ONE`: `Vector` — 3D vector one constant (1,1,1) (Vector)
  - `RIGHT`: `Vector` — 3D vector Unreal right direction constant (0,1,0) (Vector)
  - `UP`: `Vector` — 3D vector Unreal up direction constant (0,0,1) (Vector)
  - `ZERO`: `Vector` — 3D vector zero constant (0,0,0) (Vector)
  - `x`: `float` — [Read-Write] (double)
  - `y`: `float` — [Read-Write] (double)
  - `z`: `float` — [Read-Write] (double)

### `unreal.Vector2D`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A vector in 2-D space composed of components (X, Y) with floating point precision. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathVector2D.h

**Methods** (52):
  - `__add__(other: Vector2D)` -> `None` — Overloads:
  - `__eq__(other: object)` -> `bool` — Overloads:
  - `__iadd__(other: Vector2D)` -> `None` — Overloads:
  - `__imul__(other: Vector2D)` -> `None` — Overloads:
  - `__isub__(other: Vector2D)` -> `None` — Overloads:
  - `__mul__(other: Vector2D)` -> `None` — Overloads:
  - `__ne__(other: object)` -> `bool` — Overloads:
  - `__neg__()` -> `None` — Gets a negated copy of the vector.
  - `__or__(other: Vector2D)` -> `None` — Overloads:
  - `__sub__(other: Vector2D)` -> `None` — Overloads:
  - `__truediv__(other: Vector2D)` -> `None` — Overloads:
  - `__xor__(other: Vector2D)` -> `None` — Overloads:
  - `add(b)` -> `Vector2D` — Returns addition of Vector A and Vector B (A + B)
  - `add_float(b)` -> `Vector2D` — Returns Vector A added by B
  - `clamped_axes(min_axis_val, max_axis_val)` -> `Vector2D` — Creates a copy of this vector with both axes clamped to the given range.
  - `cross(b)` -> `double` — Returns the cross product of two 2d vectors - see http://mathworld.wolfram.com/CrossProduct.html
  - `distance(v2)` -> `double` — Distance between two 2D points.
  - `distance_squared(v2)` -> `double` — Squared distance between two 2D points.
  - `divide(b)` -> `Vector2D` — Element-wise Vector divide (Result = {A.x/B.x, A.y/B.y})
  - `divide_float(b = 1.000000)` -> `Vector2D` — Returns Vector A divided by B
  - `dot(b)` -> `double` — Returns the dot product of two 2d vectors - see http://mathworld.wolfram.com/DotProduct.html
  - `equals(b)` -> `bool` — Returns true if vector A is equal to vector B (A == B)
  - `get_abs()` -> `Vector2D` — Get a copy of this vector with absolute value of each component.
  - `get_abs_max()` -> `double` — Get the maximum absolute value of the vectorâs components.
  - `get_max()` -> `double` — Get the maximum value of the vectorâs components.
  - `get_min()` -> `double` — Get the minimum value of the vectorâs components.
  - `get_rotated(angle_deg)` -> `Vector2D` — Rotates around axis (0,0,1)
  - `int_point()` -> `IntPoint` — Converts a Vector2D to an IntPoint
  - `interp_to(target, delta_time, interp_speed)` -> `Vector2D` — Tries to reach Target based on distance from Current position, giving a nice smooth feeling when tracking a position.
  - `interp_to_constant(target, delta_time, interp_speed)` -> `Vector2D` — Tries to reach Target at a constant rate.
  - `is_near_equal(b, error_tolerance = 0.000100)` -> `bool` — Returns true if vector2D A is equal to vector2D B (A == B) within a specified error tolerance
  - `is_nearly_zero(tolerance = 0.000100)` -> `bool` — Checks whether vector is near to zero within a specified tolerance.
  - `is_not_near_equal(b, error_tolerance = 0.000100)` -> `bool` — Returns true if vector2D A is not equal to vector2D B (A != B) within a specified error tolerance
  - `is_zero()` -> `bool` — Checks whether all components of the vector are exactly zero.
  - `length()` -> `double` — Returns the length of a 2D Vector.
  - `length_squared()` -> `double` — Returns the squared length of a 2D Vector.
  - `multiply(b)` -> `Vector2D` — Element-wise Vector multiplication (Result = {A.x*B.x, A.y*B.y})
  - `multiply_float(b)` -> `Vector2D` — Returns Vector A scaled by B
  - `negated()` -> `Vector2D` — Gets a negated copy of the vector.
  - `normal(tolerance = 0.000000)` -> `Vector2D` — Gets a normalized copy of the vector, checking it is safe to do so based on the length. Returns zero vector if vector le...
  - `normal_unsafe()` -> `Vector2D` — Returns a unit normal version of the 2D vector
  - `normalize(tolerance = 0.000000)` -> `None` — Normalize this vector in-place if it is large enough, set it to (0,0) otherwise. see: NormalSafe2D()
  - `not_equal(b)` -> `bool` — Returns true if vector2D A is not equal to vector2D B (A != B) within a specified error tolerance
  - `set(x, y)` -> `None` — Set the values of the vector directly.
  - `spherical_to_unit_cartesian()` -> `Vector` — Converts spherical coordinates on the unit sphere into a Cartesian unit length vector.
  - `subtract(b)` -> `Vector2D` — Returns subtraction of Vector B from Vector A (A - B)
  - `subtract_float(b)` -> `Vector2D` — Returns Vector A subtracted by B
  - `to_direction_and_length(out_length=double)` — Util to convert this vector into a unit direction vector and its original length.
  - `to_rounded()` -> `Vector2D` — Get this vector as a vector where each component has been rounded to the nearest int.
  - `to_sign()` -> `Vector2D` — Get a copy of the vector as sign only. Each component is set to +1 or -1, with the sign of zero treated as +1.
  - `truncated()` -> `IntVector2` — Rounds A to an integer with truncation towards zero for each element in a vector2D. (e.g. -1.7 truncated to -1, 2.8 trun...
  - `vector(z = 0.000000)` -> `Vector` — Converts a Vector2D to a Vector

**Properties** (5):
  - `ONE`: `Vector2D` — 2D one vector constant (1,1) (Vector2D)
  - `UNIT45_DEG`: `Vector2D` — //en.wikipedia.org/wiki/Unit_vector (Vector2D) 2D unit vector constant along the 45 degree angle or ...
  - `ZERO`: `Vector2D` — 2D zero vector constant (0,0) (Vector2D)
  - `x`: `float` — [Read-Write] (double)
  - `y`: `float` — [Read-Write] (double)

### `unreal.Vector2f`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A vector in 2-D space composed of components (X, Y) with floating point precision. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathVector2D.h

### `unreal.Vector3d`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A point or direction FVector in 3d space. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathVector.h

### `unreal.Vector3f`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A point or direction FVector in 3d space. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathVector.h

### `unreal.Vector4`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A 4-D homogeneous vector. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathVector4.h

**Methods** (41):
  - `__add__(other: Vector4)` -> `None` — Overloads:
  - `__eq__(other: object)` -> `bool` — Overloads:
  - `__iadd__(other: Vector4)` -> `None` — Overloads:
  - `__imul__(other: Vector4)` -> `None` — Overloads:
  - `__isub__(other: Vector4)` -> `None` — Overloads:
  - `__mul__(other: Vector4)` -> `None` — Overloads:
  - `__ne__(other: object)` -> `bool` — Overloads:
  - `__neg__()` -> `None` — Gets a negated copy of the vector. Equivalent to -Vector for scripts.
  - `__or__(other: Vector4)` -> `None` — Overloads:
  - `__sub__(other: Vector4)` -> `None` — Overloads:
  - `__truediv__(other: Vector4)` -> `None` — Overloads:
  - `add(b)` -> `Vector4` — Returns addition of Vector A and Vector B (A + B)
  - `assign(vector)` -> `None` — Assign the values of the supplied vector.
  - `cross3(b)` -> `Vector4` — Returns the cross product of two vectors - see http://mathworld.wolfram.com/CrossProduct.html
  - `divide(b)` -> `Vector4` — Element-wise Vector divide (Result = {A.x/B.x, A.y/B.y, A.z/B.z, A.w/B.w})
  - `dot(b)` -> `double` — Returns the dot product of two vectors - see http://mathworld.wolfram.com/DotProduct.html
  - `dot3(b)` -> `double` — Returns the dot product of two vectors - see http://mathworld.wolfram.com/DotProduct.html The W element is ignored.
  - `equals(b)` -> `bool` — Returns true if vector A is equal to vector B (A == B)
  - `is_nan()` -> `bool` — Determines if any component is not a number (NAN)
  - `is_near_equal(b, error_tolerance = 0.000100)` -> `bool` — Returns true if vector A is equal to vector B (A == B) within a specified error tolerance
  - `is_nearly_zero3(tolerance = 0.000100)` -> `bool` — Checks whether vector is near to zero within a specified tolerance. The W element is ignored.
  - `is_normal3()` -> `bool` — Determines if vector is normalized / unit (length 1). The W element is ignored.
  - `is_not_near_equal(b, error_tolerance = 0.000100)` -> `bool` — Returns true if vector A is not equal to vector B (A != B) within a specified error tolerance
  - `is_unit3(squared_lenth_tolerance = 0.000100)` -> `bool` — Determines if vector is normalized / unit (length 1) within specified squared tolerance. The W element is ignored.
  - `is_zero()` -> `bool` — Checks whether all components of the vector are exactly zero.
  - `length()` -> `double` — Returns the length of the vector.
  - `length3()` -> `double` — Returns the length of the vector. The W element is ignored.
  - `length_squared()` -> `double` — Returns the squared length of the vector.
  - `length_squared3()` -> `double` — Returns the squared length of the vector. The W element is ignored.
  - `mirror_by_vector3(surface_normal)` -> `Vector4` — Given a direction vector and a surface normal, returns the vector reflected across the surface normal. Produces a result...
  - `multiply(b)` -> `Vector4` — Element-wise Vector multiplication (Result = {A.x*B.x, A.y*B.y, A.z*B.z, A.w*B.w})
  - `negated()` -> `Vector4` — Gets a negated copy of the vector. Equivalent to -Vector for scripts.
  - `normal3(tolerance = 0.000100)` -> `Vector4` — Gets a normalized unit copy of the vector, ensuring it is safe to do so based on the length. The W element is ignored an...
  - `normal_unsafe3()` -> `Vector4` — Calculates normalized unit version of vector without checking for zero length. The W element is ignored and the returned...
  - `normalize3(tolerance = 0.000000)` -> `None` — Normalize this vector in-place if it is large enough or set it to (0,0,0,0) otherwise. The W element is ignored and the ...
  - `not_equal(b)` -> `bool` — Returns true if vector A is not equal to vector B (A != B) within a specified error tolerance
  - `quaternion()` -> `Quat` — Return the Quaternion orientation corresponding to the direction in which the vector points. Similar to the FRotator ver...
  - `rotator()` -> `Rotator` — Return the FRotator orientation corresponding to the direction in which the vector points. Sets Yaw and Pitch to the pro...
  - `set(x, y, z, w)` -> `None` — Set the values of the vector directly.
  - `subtract(b)` -> `Vector4` — Returns subtraction of Vector B from Vector A (A - B)
  - `vector()` -> `Vector` — Converts a Vector4 to a Vector (dropping the W element)

**Properties** (5):
  - `ZERO`: `Vector4` — 4D vector zero constant (0,0,0) (Vector4)
  - `w`: `float` — [Read-Write] (double)
  - `x`: `float` — [Read-Write] (double)
  - `y`: `float` — [Read-Write] (double)
  - `z`: `float` — [Read-Write] (double)

### `unreal.Vector4d`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A 4-D homogeneous vector. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathVector4.h

### `unreal.Vector4f`
Inherits: `StructBase` | Header: `NoExportTypes.h`

A 4-D homogeneous vector. note: The full C++ class is located here: EngineSourceRuntimeCorePublicMathVector4.h

### `unreal.Class`
Inherits: `Struct`

**Methods** (1):
  - `get_class_path_name()` -> `TopLevelAssetPath` — Returns the full path to the specified class as a Top Level Asset Path used by asset utilities

### `unreal.EditorPathObjectInterface`
Inherits: `Interface` | Header: `EditorPathObjectInterface.h`

Editor Path Object Interface

### `unreal.Enum`
Inherits: `Field`

**Methods** (1):
  - `get_enum_path_name()` -> `TopLevelAssetPath` — Returns the full path to the specified enum as a Top Level Asset Path used by asset utilities

### `unreal.Field`
Inherits: `Object`

### `unreal.Function`
Inherits: `Struct`

### `unreal.Interface`
Inherits: `Object`

### `unreal.Object`
Inherits: `_ObjectBase` | Header: `NoExportTypes.h`

Direct base class for all UE objects note: The full C++ class is located here: EngineSourceRuntimeCoreUObjectPublicUObjectObject.h

**Methods** (4):
  - `acquire_editor_element_handle(allow_create = True)` -> `ScriptTypedElementHandle` — K2 Acquire Editor Object Element Handle
  - `get_interpolated_pcg_landscape_layer_weights(location)` -> `Array [ PCGLandscapeLayerWeight ]` — Get Interpolated PCGLandscape Layer Weights
  - `is_editor_property_overridden(property_name)` -> `EditorPropertyValueState` — Attempts to query whether the value of a named property on the given object overrides the value of its archetype (ie, wo...
  - `reset_editor_property(property_name, change_notify_mode = PropertyAccessChangeNotifyMode.DEFAULT)` -> `bool` — Attempts to reset the value of a named property on the given object so that it matches the value of the archetype.

### `unreal.Package`
Inherits: `Object`

### `unreal.ScriptStruct`
Inherits: `Struct`

Script Struct

**Methods** (1):
  - `get_struct_path_name()` -> `TopLevelAssetPath` — Returns the full path to the specified struct as a Top Level Asset Path used by asset utilities

### `unreal.Struct`
Inherits: `Field`

### `unreal.UserDefinedStruct`
Inherits: `ScriptStruct` | Header: `UserDefinedStruct.h`

User Defined Struct

### `unreal.AppMsgCategory`
Inherits: `EnumBase` | Header: `NoExportTypes.h`

Enumerates supported message dialog category types. note: Mirrored from GenericPlatformMisc.h

**Properties** (4):
  - `ERROR`: `AppMsgCategory = Ellipsis` — 1
  - `INFO`: `AppMsgCategory = Ellipsis` — 3
  - `SUCCESS`: `AppMsgCategory = Ellipsis` — 2
  - `WARNING`: `AppMsgCategory = Ellipsis` — 0

### `unreal.AppMsgType`
Inherits: `EnumBase` | Header: `NoExportTypes.h`

Enumerates supported message dialog button types.

**Properties** (8):
  - `CANCEL_RETRY_CONTINUE`: `AppMsgType = Ellipsis` — 4
  - `OK`: `AppMsgType = Ellipsis` — 0
  - `OK_CANCEL`: `AppMsgType = Ellipsis` — 2
  - `YES_NO`: `AppMsgType = Ellipsis` — 1
  - `YES_NO_CANCEL`: `AppMsgType = Ellipsis` — 3
  - `YES_NO_YES_ALL`: `AppMsgType = Ellipsis` — 7
  - `YES_NO_YES_ALL_NO_ALL`: `AppMsgType = Ellipsis` — 5
  - `YES_NO_YES_ALL_NO_ALL_CANCEL`: `AppMsgType = Ellipsis` — 6

### `unreal.AppReturnType`
Inherits: `EnumBase` | Header: `NoExportTypes.h`

Enum denoting message dialog return types. note: Mirrored from GenericPlatformMisc.h

**Properties** (8):
  - `CANCEL`: `AppReturnType = Ellipsis` — 4
  - `CONTINUE`: `AppReturnType = Ellipsis` — 7
  - `NO`: `AppReturnType = Ellipsis` — 0
  - `NO_ALL`: `AppReturnType = Ellipsis` — 3
  - `OK`: `AppReturnType = Ellipsis` — 5
  - `RETRY`: `AppReturnType = Ellipsis` — 6
  - `YES`: `AppReturnType = Ellipsis` — 1
  - `YES_ALL`: `AppReturnType = Ellipsis` — 2

### `unreal.AxisType`
Inherits: `EnumBase` | Header: `NoExportTypes.h`

Generic axis enum (mirrored for native use in Axis.h).

**Properties** (4):
  - `NONE`: `AxisType = Ellipsis` — 0
  - `X`: `AxisType = Ellipsis` — 1
  - `Y`: `AxisType = Ellipsis` — 2
  - `Z`: `AxisType = Ellipsis` — 3

### `unreal.DataValidationResult`
Inherits: `EnumBase` | Header: `NoExportTypes.h`

Enum used by DataValidation plugin to see if an asset has been validated for correctness (mirrored in UObjectGlobals.h)

**Properties** (3):
  - `INVALID`: `DataValidationResult = Ellipsis` — Asset has failed validation 0
  - `NOT_VALIDATED`: `DataValidationResult = Ellipsis` — Asset has not yet been validated 2
  - `VALID`: `DataValidationResult = Ellipsis` — Asset has passed validation 1

### `unreal.DataValidationUsecase`
Inherits: `EnumBase` | Header: `DataValidation.h`

EData Validation Usecase

**Properties** (6):
  - `COMMANDLET`: `DataValidationUsecase = Ellipsis` — A commandlet invoked the validation 2
  - `MANUAL`: `DataValidationUsecase = Ellipsis` — Triggered on userâs demand 1
  - `NONE`: `DataValidationUsecase = Ellipsis` — No usecase specified 0
  - `PRE_SUBMIT`: `DataValidationUsecase = Ellipsis` — Submit dialog triggered the validation 4
  - `SAVE`: `DataValidationUsecase = Ellipsis` — Saving a package triggered the validation 3
  - `SCRIPT`: `DataValidationUsecase = Ellipsis` — Triggered by blueprint or c++ 5

### `unreal.InputDeviceAnalogStickMask`
Inherits: `EnumBase` | Header: `NoExportTypes.h`

Represents input device analog sticks that are available

**Properties** (3):
  - `LEFT`: `InputDeviceAnalogStickMask = Ellipsis` — 1
  - `NONE`: `InputDeviceAnalogStickMask = Ellipsis` — 0
  - `RIGHT`: `InputDeviceAnalogStickMask = Ellipsis` — 2

### `unreal.InputDeviceConnectionState`
Inherits: `EnumBase` | Header: `NoExportTypes.h`

Represents the connection status of a given FInputDeviceId

**Properties** (4):
  - `CONNECTED`: `InputDeviceConnectionState = Ellipsis` — Definitely connected and powered on 3
  - `DISCONNECTED`: `InputDeviceConnectionState = Ellipsis` — Device is definitely connected 2
  - `INVALID`: `InputDeviceConnectionState = Ellipsis` — This is not a valid input device 0
  - `UNKNOWN`: `InputDeviceConnectionState = Ellipsis` — It is not known if this device is connected or not 1

### `unreal.InputDeviceTriggerMask`
Inherits: `EnumBase` | Header: `NoExportTypes.h`

Represents input device triggers that are available

**Properties** (4):
  - `ALL`: `InputDeviceTriggerMask = Ellipsis` — 3
  - `LEFT`: `InputDeviceTriggerMask = Ellipsis` — 1
  - `NONE`: `InputDeviceTriggerMask = Ellipsis` — 0
  - `RIGHT`: `InputDeviceTriggerMask = Ellipsis` — 2

### `unreal.InterpCurveMode`
Inherits: `EnumBase` | Header: `NoExportTypes.h`

Describes shape of an interpolation curve (mirrored from InterpCurvePoint.h).

**Properties** (6):
  - `CIM_CONSTANT`: `InterpCurveMode = Ellipsis` — The out value is held constant until the next key, then will jump to that value. 2
  - `CIM_CURVE_AUTO`: `InterpCurveMode = Ellipsis` — A cubic-hermite curve between two keypoints, using Arrive/Leave tangents. These tangents will be aut...
  - `CIM_CURVE_AUTO_CLAMPED`: `InterpCurveMode = Ellipsis` — A cubic-hermite curve between two keypoints, using Arrive/Leave tangents. These tangents will be aut...
  - `CIM_CURVE_BREAK`: `InterpCurveMode = Ellipsis` — A curve like CIM_Curve, but the arrive and leave tangents are not forced to be the same, so you can ...
  - `CIM_CURVE_USER`: `InterpCurveMode = Ellipsis` — A smooth curve just like CIM_Curve, but tangents are not automatically updated so you can have manua...
  - `CIM_LINEAR`: `InterpCurveMode = Ellipsis` — A straight line between two keypoint values. 0

### `unreal.LifetimeCondition`
Inherits: `EnumBase` | Header: `CoreNetTypes.h`

Secondary condition to check before considering the replication of a lifetime property.

**Properties** (14):
  - `COND_AUTONOMOUS_ONLY`: `LifetimeCondition = Ellipsis` — This property will only send to simulated actors 5
  - `COND_CUSTOM`: `LifetimeCondition = Ellipsis` — This property will send on the initial packet, or to the actors owner 8
  - `COND_INITIAL_ONLY`: `LifetimeCondition = Ellipsis` — This property has no condition, and will send anytime it changes 1
  - `COND_INITIAL_OR_OWNER`: `LifetimeCondition = Ellipsis` — This property will send to simulated OR bRepPhysics actors 7
  - `COND_NONE`: `LifetimeCondition = Ellipsis` — 0
  - `COND_OWNER_ONLY`: `LifetimeCondition = Ellipsis` — This property will only attempt to send on the initial bunch 2
  - `COND_REPLAY_ONLY`: `LifetimeCondition = Ellipsis` — This property will only send to the replay connection, or to the actors owner 10
  - `COND_REPLAY_OR_OWNER`: `LifetimeCondition = Ellipsis` — This property has no particular condition, but wants the ability to toggle on/off via SetCustomIsAct...
  - `COND_SIMULATED_ONLY`: `LifetimeCondition = Ellipsis` — This property send to every connection EXCEPT the owner 4
  - `COND_SIMULATED_ONLY_NO_REPLAY`: `LifetimeCondition = Ellipsis` — This property will only send to the replay connection 11
  - `COND_SIMULATED_OR_PHYSICS`: `LifetimeCondition = Ellipsis` — This property will only send to autonomous actors 6
  - `COND_SIMULATED_OR_PHYSICS_NO_REPLAY`: `LifetimeCondition = Ellipsis` — This property will send to actors only, but not to replay connections 12
  - `COND_SKIP_OWNER`: `LifetimeCondition = Ellipsis` — This property will only send to the actorâs owner 3
  - `COND_SKIP_REPLAY`: `LifetimeCondition = Ellipsis` — This property will send to simulated Or bRepPhysics actors, but not to replay connections 13

### `unreal.LocalizedTextSourceCategory`
Inherits: `EnumBase` | Header: `NoExportTypes.h`

Categories of localized text (mirrored in LocalizedTextSourceTypes.h

**Properties** (3):
  - `EDITOR`: `LocalizedTextSourceCategory = Ellipsis` — 2
  - `ENGINE`: `LocalizedTextSourceCategory = Ellipsis` — 1
  - `GAME`: `LocalizedTextSourceCategory = Ellipsis` — 0

### `unreal.MouseCursor`
Inherits: `EnumBase` | Header: `NoExportTypes.h`

Mouse cursor types (mirrored from ICursor.h)

**Properties** (15):
  - `CARDINAL_CROSS`: `MouseCursor = Ellipsis` — MoveItem. 7
  - `CROSSHAIRS`: `MouseCursor = Ellipsis` — Target Cross. 8
  - `CUSTOM`: `MouseCursor = Ellipsis` — Custom cursor shape for platforms that support setting a native cursor shape. Same as specifying Non...
  - `DEFAULT`: `MouseCursor = Ellipsis` — Default cursor (arrow). 1
  - `EYE_DROPPER`: `MouseCursor = Ellipsis` — Eye-dropper cursor for picking colors. 13
  - `GRAB_HAND`: `MouseCursor = Ellipsis` — Grab Hand cursor. 10
  - `GRAB_HAND_CLOSED`: `MouseCursor = Ellipsis` — Grab Hand cursor closed. 11
  - `HAND`: `MouseCursor = Ellipsis` — Hand cursor. 9
  - `NONE`: `MouseCursor = Ellipsis` — Causes no mouse cursor to be visible. 0
  - `RESIZE_LEFT_RIGHT`: `MouseCursor = Ellipsis` — Resize horizontal. 3
  - `RESIZE_SOUTH_EAST`: `MouseCursor = Ellipsis` — Resize diagonal. 5
  - `RESIZE_SOUTH_WEST`: `MouseCursor = Ellipsis` — Resize other diagonal. 6
  - `RESIZE_UP_DOWN`: `MouseCursor = Ellipsis` — Resize vertical. 4
  - `SLASHED_CIRCLE`: `MouseCursor = Ellipsis` — a circle with a diagonal line through it. 12
  - `TEXT_EDIT_BEAM`: `MouseCursor = Ellipsis` — Text edit beam. 2

### `unreal.PixelFormat`
Inherits: `EnumBase` | Header: `NoExportTypes.h`

Describes the format of a each pixel in a graphics buffer. warning:: When you update this, you must add an entry to GPixelFormats(see RenderUtils.cpp) warning:: When you update this, you must add an e...

**Properties** (93):
  - `PF_A1`: `PixelFormat = Ellipsis` — 25
  - `PF_A16B16G16R16`: `PixelFormat = Ellipsis` — 19
  - `PF_A2B10G10R10`: `PixelFormat = Ellipsis` — 18
  - `PF_A32B32G32R32F`: `PixelFormat = Ellipsis` — 1
  - `PF_A8`: `PixelFormat = Ellipsis` — 27
  - `PF_A8R8G8B8`: `PixelFormat = Ellipsis` — Only used for legacy loading; do NOT use! 38
  - `PF_ASTC_10X10`: `PixelFormat = Ellipsis` — 1.28 bpp 53
  - `PF_ASTC_10X10_HDR`: `PixelFormat = Ellipsis` — 76
  - `PF_ASTC_10X10_NORM_RG`: `PixelFormat = Ellipsis` — 90
  - `PF_ASTC_12X12`: `PixelFormat = Ellipsis` — 0.89 bpp 54
  - `PF_ASTC_12X12_HDR`: `PixelFormat = Ellipsis` — 77
  - `PF_ASTC_12X12_NORM_RG`: `PixelFormat = Ellipsis` — 91
  - `PF_ASTC_4X4`: `PixelFormat = Ellipsis` — 8.00 bpp 50
  - `PF_ASTC_4X4_HDR`: `PixelFormat = Ellipsis` — 73
  - `PF_ASTC_4X4_NORM_RG`: `PixelFormat = Ellipsis` — 87
  - `PF_ASTC_6X6`: `PixelFormat = Ellipsis` — 3.56 bpp 51
  - `PF_ASTC_6X6_HDR`: `PixelFormat = Ellipsis` — 74
  - `PF_ASTC_6X6_NORM_RG`: `PixelFormat = Ellipsis` — 88
  - `PF_ASTC_8X8`: `PixelFormat = Ellipsis` — 2.00 bpp 52
  - `PF_ASTC_8X8_HDR`: `PixelFormat = Ellipsis` — 75
  - `PF_ASTC_8X8_NORM_RG`: `PixelFormat = Ellipsis` — 89
  - `PF_ATC_RGB`: `PixelFormat = Ellipsis` — ATITC format. 41
  - `PF_ATC_RGBA_E`: `PixelFormat = Ellipsis` — ATITC format. 42
  - `PF_ATC_RGBA_I`: `PixelFormat = Ellipsis` — ATITC format. 43
  - `PF_B5G5R5A1_UNORM`: `PixelFormat = Ellipsis` — 72
  - `PF_B8G8R8A8`: `PixelFormat = Ellipsis` — UNORM (0..1), corresponds to FColor.  Unpacks as rgba in the shader. 2
  - `PF_BC4`: `PixelFormat = Ellipsis` — High precision single channel block compressed, equivalent to a single channel BC5, 8 bytes per 4x4 ...
  - `PF_BC5`: `PixelFormat = Ellipsis` — 23
  - `PF_BC6H`: `PixelFormat = Ellipsis` — 55
  - `PF_BC7`: `PixelFormat = Ellipsis` — 56
  - `PF_D24`: `PixelFormat = Ellipsis` — 20
  - `PF_DEPTH_STENCIL`: `PixelFormat = Ellipsis` — A depth+stencil format with platform-specific implementation, for use with render targets. 11
  - `PF_DXT1`: `PixelFormat = Ellipsis` — 5
  - `PF_DXT3`: `PixelFormat = Ellipsis` — 6
  - `PF_DXT5`: `PixelFormat = Ellipsis` — 7
  - `PF_ETC1`: `PixelFormat = Ellipsis` — 45
  - `PF_ETC2_R11_EAC`: `PixelFormat = Ellipsis` — 69
  - `PF_ETC2_RG11_EAC`: `PixelFormat = Ellipsis` — 70
  - `PF_ETC2_RGB`: `PixelFormat = Ellipsis` — 46
  - `PF_ETC2_RGBA`: `PixelFormat = Ellipsis` — 47
  - `PF_FLOAT_R11G11B10`: `PixelFormat = Ellipsis` — A low precision floating point format, unsigned.  Use FFloat3Packed on the CPU. 26
  - `PF_FLOAT_RGB`: `PixelFormat = Ellipsis` — Same as PF_FloatR11G11B10 9
  - `PF_FLOAT_RGBA`: `PixelFormat = Ellipsis` — RGBA 16 bit signed FP format.  Use FFloat16Color on the CPU. 10
  - `PF_G16`: `PixelFormat = Ellipsis` — 4
  - `PF_G16R16`: `PixelFormat = Ellipsis` — 14
  - `PF_G16R16F`: `PixelFormat = Ellipsis` — 15
  - `PF_G16R16F_FILTER`: `PixelFormat = Ellipsis` — 16
  - `PF_G16R16_SNORM`: `PixelFormat = Ellipsis` — 78
  - `PF_G32R32F`: `PixelFormat = Ellipsis` — 17
  - `PF_G8`: `PixelFormat = Ellipsis` — UNORM red (0..1) 3
  - `PF_L8`: `PixelFormat = Ellipsis` — 58
  - `PF_NV12`: `PixelFormat = Ellipsis` — 67
  - `PF_P010`: `PixelFormat = Ellipsis` — 86
  - `PF_PLATFORM_HDR_0`: `PixelFormat = Ellipsis` — 64
  - `PF_PLATFORM_HDR_1`: `PixelFormat = Ellipsis` — 65
  - `PF_PLATFORM_HDR_2`: `PixelFormat = Ellipsis` — 66
  - `PF_PVRTC2`: `PixelFormat = Ellipsis` — 30
  - `PF_PVRTC4`: `PixelFormat = Ellipsis` — 31
  - `PF_R16F`: `PixelFormat = Ellipsis` — 21
  - `PF_R16F_FILTER`: `PixelFormat = Ellipsis` — 22
  - `PF_R16G16B16A16_SINT`: `PixelFormat = Ellipsis` — 35
  - `PF_R16G16B16A16_SNORM`: `PixelFormat = Ellipsis` — 63
  - `PF_R16G16B16A16_UINT`: `PixelFormat = Ellipsis` — 34
  - `PF_R16G16B16A16_UNORM`: `PixelFormat = Ellipsis` — 62
  - `PF_R16G16_SINT`: `PixelFormat = Ellipsis` — 92
  - `PF_R16G16_UINT`: `PixelFormat = Ellipsis` — 49
  - `PF_R16_SINT`: `PixelFormat = Ellipsis` — 33
  - `PF_R16_UINT`: `PixelFormat = Ellipsis` — 32
  - `PF_R32G32B32A32_UINT`: `PixelFormat = Ellipsis` — 48
  - `PF_R32G32B32F`: `PixelFormat = Ellipsis` — 82
  - `PF_R32G32B32_SINT`: `PixelFormat = Ellipsis` — 81
  - `PF_R32G32B32_UINT`: `PixelFormat = Ellipsis` — 80
  - `PF_R32G32_UINT`: `PixelFormat = Ellipsis` — 68
  - `PF_R32_FLOAT`: `PixelFormat = Ellipsis` — 13
  - `PF_R32_SINT`: `PixelFormat = Ellipsis` — 29
  - `PF_R32_UINT`: `PixelFormat = Ellipsis` — 28
  - `PF_R5G6B5_UNORM`: `PixelFormat = Ellipsis` — 36
  - `PF_R64_UINT`: `PixelFormat = Ellipsis` — 84
  - `PF_R8`: `PixelFormat = Ellipsis` — 71
  - `PF_R8G8`: `PixelFormat = Ellipsis` — UNORM red, green (0..1). 40
  - `PF_R8G8B8A8`: `PixelFormat = Ellipsis` — 37
  - `PF_R8G8B8A8_SNORM`: `PixelFormat = Ellipsis` — SNORM (-1..1), corresponds to FFixedRGBASigned8. 61
  - `PF_R8G8B8A8_UINT`: `PixelFormat = Ellipsis` — 60
  - `PF_R8G8_UINT`: `PixelFormat = Ellipsis` — 79
  - `PF_R8_SINT`: `PixelFormat = Ellipsis` — 83
  - `PF_R8_UINT`: `PixelFormat = Ellipsis` — 57
  - `PF_R9G9B9EXP5`: `PixelFormat = Ellipsis` — 85
  - `PF_SHADOW_DEPTH`: `PixelFormat = Ellipsis` — A depth format with platform-specific implementation, for use with render targets. 12
  - `PF_UNKNOWN`: `PixelFormat = Ellipsis` — 0
  - `PF_UYVY`: `PixelFormat = Ellipsis` — 8
  - `PF_V8U8`: `PixelFormat = Ellipsis` — SNORM red, green (-1..1). Not supported on all RHI e.g. Metal 24
  - `PF_X24_G8`: `PixelFormat = Ellipsis` — Used for creating SRVs to alias a DepthStencil buffer to read Stencil.  Donât use for creating tex...
  - `PF_XGXR8`: `PixelFormat = Ellipsis` — 59

### `unreal.PropertyAccessChangeNotifyMode`
Inherits: `EnumBase` | Header: `NoExportTypes.h`

Enum controlling when to emit property change notifications when setting a property value. note: Mirrored from PropertyAccessUtil.h

**Properties** (3):
  - `ALWAYS`: `PropertyAccessChangeNotifyMode = Ellipsis` — Always notify that a value change has occurred, even if the value is unchanged 2
  - `DEFAULT`: `PropertyAccessChangeNotifyMode = Ellipsis` — Notify only when a value change has actually occurred 0
  - `NEVER`: `PropertyAccessChangeNotifyMode = Ellipsis` — Never notify that a value change has occurred 1

### `unreal.PropertyBagContainerType`
Inherits: `EnumBase` | Header: `PropertyBag.h`

Property bag property container type.

**Properties** (3):
  - `ARRAY`: `PropertyBagContainerType = Ellipsis` — 1
  - `NONE`: `PropertyBagContainerType = Ellipsis` — 0
  - `SET`: `PropertyBagContainerType = Ellipsis` — 2

### `unreal.PropertyBagPropertyType`
Inherits: `EnumBase` | Header: `PropertyBag.h`

Property bag property type, loosely based on BluePrint pin types.

**Properties** (11):
  - `BOOL`: `PropertyBagPropertyType = Ellipsis` — 1
  - `BYTE`: `PropertyBagPropertyType = Ellipsis` — 2
  - `DOUBLE`: `PropertyBagPropertyType = Ellipsis` — 6
  - `FLOAT`: `PropertyBagPropertyType = Ellipsis` — 5
  - `INT32`: `PropertyBagPropertyType = Ellipsis` — 3
  - `INT64`: `PropertyBagPropertyType = Ellipsis` — 4
  - `NAME`: `PropertyBagPropertyType = Ellipsis` — 7
  - `STRING`: `PropertyBagPropertyType = Ellipsis` — 8
  - `TEXT`: `PropertyBagPropertyType = Ellipsis` — 9
  - `U_INT32`: `PropertyBagPropertyType = Ellipsis` — 16
  - `U_INT64`: `PropertyBagPropertyType = Ellipsis` — Type not fully supported at UI, will work with restrictions to type editing 17

### `unreal.RangeBoundTypes`
Inherits: `EnumBase` | Header: `NoExportTypes.h`

Enumerates the valid types of range bounds (mirrored from RangeBound.h)

**Properties** (3):
  - `EXCLUSIVE`: `RangeBoundTypes = Ellipsis` — The range excludes the bound. 0
  - `INCLUSIVE`: `RangeBoundTypes = Ellipsis` — The range includes the bound. 1
  - `OPEN`: `RangeBoundTypes = Ellipsis` — The bound is open. 2

### `unreal.SearchCase`
Inherits: `EnumBase` | Header: `NoExportTypes.h`

Determines case sensitivity options for string comparisons. note: Mirrored from EngineSourceRuntimeCorePublicContainersUnrealString.h

**Properties** (2):
  - `CASE_SENSITIVE`: `SearchCase = Ellipsis` — 0
  - `IGNORE_CASE`: `SearchCase = Ellipsis` — 1

### `unreal.SearchDir`
Inherits: `EnumBase` | Header: `NoExportTypes.h`

Determines search direction for string operations. note: Mirrored from EngineSourceRuntimeCorePublicContainersUnrealString.h

**Properties** (2):
  - `FROM_END`: `SearchDir = Ellipsis` — 1
  - `FROM_START`: `SearchDir = Ellipsis` — 0

### `unreal.Unit`
Inherits: `EnumBase` | Header: `NoExportTypes.h`

A set of numerical unit types supported by the engine. Mirrored from UnitConversion.h

**Properties** (76):
  - `BYTES`: `Unit = Ellipsis` — Data Size unit. 49
  - `CANDELA`: `Unit = Ellipsis` — Luminous intensity unit. 55
  - `CANDELA_PER_METER2`: `Unit = Ellipsis` — Luminance unit. 57
  - `CELSIUS`: `Unit = Ellipsis` — Temperature unit. 20
  - `CENTIMETERS`: `Unit = Ellipsis` — 2
  - `CENTIMETERS_PER_SECOND`: `Unit = Ellipsis` — Speed unit. 12
  - `CENTIMETERS_PER_SECOND_SQUARED`: `Unit = Ellipsis` — Acceleration unit. 18
  - `DAYS`: `Unit = Ellipsis` — 66
  - `DEGREES`: `Unit = Ellipsis` — Angular unit. 10
  - `DEGREES_PER_SECOND`: `Unit = Ellipsis` — Angular speed unit. 16
  - `EXPOSURE_VALUE`: `Unit = Ellipsis` — Exposure value unit. 59
  - `FARENHEIT`: `Unit = Ellipsis` — 21
  - `FEET`: `Unit = Ellipsis` — 6
  - `GIGABYTES`: `Unit = Ellipsis` — 52
  - `GIGAHERTZ`: `Unit = Ellipsis` — 47
  - `GIGA_PASCALS`: `Unit = Ellipsis` — 75
  - `GRAMS`: `Unit = Ellipsis` — 25
  - `GRAMS_PER_CUBIC_CENTIMETER`: `Unit = Ellipsis` — Density unit. 31
  - `GRAMS_PER_CUBIC_METER`: `Unit = Ellipsis` — 32
  - `HERTZ`: `Unit = Ellipsis` — Frequency unit. 44
  - `HOURS`: `Unit = Ellipsis` — 65
  - `INCHES`: `Unit = Ellipsis` — 5
  - `KELVIN`: `Unit = Ellipsis` — 22
  - `KILOBYTES`: `Unit = Ellipsis` — 50
  - `KILOGRAMS`: `Unit = Ellipsis` — 26
  - `KILOGRAMS_FORCE`: `Unit = Ellipsis` — 37
  - `KILOGRAMS_PER_CUBIC_CENTIMETER`: `Unit = Ellipsis` — 33
  - `KILOGRAMS_PER_CUBIC_METER`: `Unit = Ellipsis` — 34
  - `KILOGRAM_CENTIMETERS`: `Unit = Ellipsis` — 42
  - `KILOGRAM_CENTIMETERS_PER_SECOND_SQUARED`: `Unit = Ellipsis` — 38
  - `KILOGRAM_CENTIMETERS_SQUARED_PER_SECOND_SQUARED`: `Unit = Ellipsis` — 40
  - `KILOGRAM_METERS`: `Unit = Ellipsis` — 43
  - `KILOHERTZ`: `Unit = Ellipsis` — 45
  - `KILOMETERS`: `Unit = Ellipsis` — 4
  - `KILOMETERS_PER_HOUR`: `Unit = Ellipsis` — 14
  - `KILO_PASCALS`: `Unit = Ellipsis` — 73
  - `LIGHTYEARS`: `Unit = Ellipsis` — 9
  - `LUMENS`: `Unit = Ellipsis` — Luminous flux unit. 54
  - `LUX`: `Unit = Ellipsis` — Illuminance unit. 56
  - `MEGABYTES`: `Unit = Ellipsis` — 51
  - `MEGAHERTZ`: `Unit = Ellipsis` — 46
  - `MEGA_PASCALS`: `Unit = Ellipsis` — 74
  - `METERS`: `Unit = Ellipsis` — 3
  - `METERS_PER_SECOND`: `Unit = Ellipsis` — 13
  - `METERS_PER_SECOND_SQUARED`: `Unit = Ellipsis` — 19
  - `METRIC_TONS`: `Unit = Ellipsis` — 27
  - `MICROGRAMS`: `Unit = Ellipsis` — Mass unit. 23
  - `MICROMETERS`: `Unit = Ellipsis` — Scalar distance/length unit. 0
  - `MICROSECONDS`: `Unit = Ellipsis` — 61
  - `MILES`: `Unit = Ellipsis` — 8
  - `MILES_PER_HOUR`: `Unit = Ellipsis` — 15
  - `MILLIGRAMS`: `Unit = Ellipsis` — 24
  - `MILLIMETERS`: `Unit = Ellipsis` — 1
  - `MILLISECONDS`: `Unit = Ellipsis` — 62
  - `MINUTES`: `Unit = Ellipsis` — 64
  - `MONTHS`: `Unit = Ellipsis` — 67
  - `MULTIPLIER`: `Unit = Ellipsis` — Arbitrary multiplier. 71
  - `NANOSECONDS`: `Unit = Ellipsis` — Time unit. 60
  - `NEWTONS`: `Unit = Ellipsis` — Force unit. 35
  - `NEWTON_METERS`: `Unit = Ellipsis` — Torque unit. 39
  - `NEWTON_SECONDS`: `Unit = Ellipsis` — Impulse unit. 41
  - `OUNCES`: `Unit = Ellipsis` — 28
  - `PASCALS`: `Unit = Ellipsis` — Stress unit. 72
  - `PERCENTAGE`: `Unit = Ellipsis` — Percentage. 70
  - `PIXELS_PER_INCH`: `Unit = Ellipsis` — Pixel density unit. 69
  - `POUNDS`: `Unit = Ellipsis` — 29
  - `POUNDS_FORCE`: `Unit = Ellipsis` — 36
  - `RADIANS`: `Unit = Ellipsis` — 11
  - `RADIANS_PER_SECOND`: `Unit = Ellipsis` — 17
  - `REVOLUTIONS_PER_MINUTE`: `Unit = Ellipsis` — 48
  - `SECONDS`: `Unit = Ellipsis` — 63
  - `STONES`: `Unit = Ellipsis` — 30
  - `TERABYTES`: `Unit = Ellipsis` — 53
  - `UNSPECIFIED`: `Unit = Ellipsis` — Symbolic entry, not specifiable on meta data. 76
  - `YARDS`: `Unit = Ellipsis` — 7
  - `YEARS`: `Unit = Ellipsis` — 68
