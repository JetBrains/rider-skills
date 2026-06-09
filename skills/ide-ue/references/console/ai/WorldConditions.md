# UE Python API — WorldConditions Module

**3 types** from the `WorldConditions` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `WorldConditionEditable`, `WorldConditionQueryDefinition`, `WorldConditionOperator`

---

## Classes

### `unreal.WorldConditionEditable`
Inherits: `StructBase` | Header: `WorldConditionQuery.h`

Struct used to store a world condition in editor. Used internally. Note that the Operator and ExpressionDepth are stored here separately from the World Condition to make sure they are not reset if the...

### `unreal.WorldConditionQueryDefinition`
Inherits: `StructBase` | Header: `WorldConditionQuery.h`

Definition of a world condition. The mutable state of the world condition is stored in FWorldConditionQueryState. This allows to reuse the definitions and minimize the runtime memory needed to run que...

### `unreal.WorldConditionOperator`
Inherits: `EnumBase` | Header: `WorldConditionTypes.h`

Boolean operator between conditions in a expression.

**Properties** (2):
  - `AND`: `WorldConditionOperator = Ellipsis` — Boolean And 0
  - `OR`: `WorldConditionOperator = Ellipsis` — Boolean Or 1
