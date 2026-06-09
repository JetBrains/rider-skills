# UE Python API — ModelingOperators Module

**6 types** from the `ModelingOperators` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `FlattenCurveMethod`, `OffsetClosedCurvesMethod`, `OffsetJoinMethod`, `OffsetOpenCurvesMethod`, `OpenCurveEndShapes`, `RemeshType`

---

## Classes

### `unreal.FlattenCurveMethod`
Inherits: `EnumBase` | Header: `TriangulateCurvesOp.h`

EFlatten Curve Method

**Properties** (5):
  - `ALONG_X`: `FlattenCurveMethod = Ellipsis` — Flatten by projection along the X axis 2
  - `ALONG_Y`: `FlattenCurveMethod = Ellipsis` — Flatten by projection along the Y axis 3
  - `ALONG_Z`: `FlattenCurveMethod = Ellipsis` — Flatten by projection along the Z axis 4
  - `DO_NOT_FLATTEN`: `FlattenCurveMethod = Ellipsis` — Do not flatten the curves before triangulations 0
  - `TO_BEST_FIT_PLANE`: `FlattenCurveMethod = Ellipsis` — Fit planes to the curves, and flatten the curves by projection to their plane 1

### `unreal.OffsetClosedCurvesMethod`
Inherits: `EnumBase` | Header: `TriangulateCurvesOp.h`

EOffset Closed Curves Method

**Properties** (3):
  - `DO_NOT_OFFSET`: `OffsetClosedCurvesMethod = Ellipsis` — Do not offset the closed curves 0
  - `OFFSET_BOTH_SIDES`: `OffsetClosedCurvesMethod = Ellipsis` — Offset both sides of the closed curves â creating hollow shapes that follow the curves with Curve ...
  - `OFFSET_OUTER_SIDE`: `OffsetClosedCurvesMethod = Ellipsis` — Offset the outside of the closed curves â growing or shrinking the solid shape 1

### `unreal.OffsetJoinMethod`
Inherits: `EnumBase` | Header: `TriangulateCurvesOp.h`

EOffset Join Method

**Properties** (3):
  - `MITER`: `OffsetJoinMethod = Ellipsis` — Miter corners between offset edges, extending the neighboring curve edges straight to their intersec...
  - `ROUND`: `OffsetJoinMethod = Ellipsis` — Smoothly join corners between offset edges with circular paths 2
  - `SQUARE`: `OffsetJoinMethod = Ellipsis` — Cut off corners between offset edges with square shapes 0

### `unreal.OffsetOpenCurvesMethod`
Inherits: `EnumBase` | Header: `TriangulateCurvesOp.h`

EOffset Open Curves Method

**Properties** (2):
  - `OFFSET`: `OffsetOpenCurvesMethod = Ellipsis` — Offset the open curves, creating shapes following the curves with Curve Offset width 1
  - `TREAT_AS_CLOSED`: `OffsetOpenCurvesMethod = Ellipsis` — Treat open curves as if they were closed â connecting the last point back to the first 0

### `unreal.OpenCurveEndShapes`
Inherits: `EnumBase` | Header: `TriangulateCurvesOp.h`

EOpen Curve End Shapes

**Properties** (3):
  - `BUTT`: `OpenCurveEndShapes = Ellipsis` — Close the ends of open paths abruptly with no end caps 2
  - `ROUND`: `OpenCurveEndShapes = Ellipsis` — Close the ends of open paths with round end caps 1
  - `SQUARE`: `OpenCurveEndShapes = Ellipsis` — Close the ends of open paths with square end caps 0

### `unreal.RemeshType`
Inherits: `EnumBase` | Header: `RemeshMeshOp.h`

Remeshing modes

**Properties** (3):
  - `FULL_PASS`: `RemeshType = Ellipsis` — Multiple full passes over the entire mesh 1
  - `NORMAL_FLOW`: `RemeshType = Ellipsis` — One pass over the entire mesh, then remesh only changed edges. Use Normal flow to align triangles wi...
  - `STANDARD`: `RemeshType = Ellipsis` — One pass over the entire mesh, then remesh only changed edges 0
