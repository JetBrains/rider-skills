# UE Python API — CustomizableObjectPopulation Module

**8 types** from the `CustomizableObjectPopulation` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ClassWeightPair`, `ConstraintRanges`, `CustomizableObjectPopulationCharacteristic`, `CustomizableObjectPopulationConstraint`, `CustomizableObjectPopulation`, `CustomizableObjectPopulationClass`, `CurveColor`, `PopulationConstraintType`

---

## Classes

### `unreal.ClassWeightPair`
Inherits: `StructBase` | Header: `CustomizableObjectPopulation.h`

Class Weight Pair

### `unreal.ConstraintRanges`
Inherits: `StructBase` | Header: `CustomizableObjectPopulationConstraint.h`

Constraint Ranges

### `unreal.CustomizableObjectPopulationCharacteristic`
Inherits: `StructBase` | Header: `CustomizableObjectPopulationCharacteristic.h`

Customizable Object Population Characteristic

### `unreal.CustomizableObjectPopulationConstraint`
Inherits: `StructBase` | Header: `CustomizableObjectPopulationConstraint.h`

Customizable Object Population Constraint

### `unreal.CustomizableObjectPopulation`
Inherits: `Object` | Header: `CustomizableObjectPopulation.h`

Customizable Object Population

**Methods** (2):
  - `generate_population()` — Create a number of instances of the target population.
  - `regenerate_population(seed, num_instances_to_generate = 1)` -> `Array[CustomizableObjectInstance] or None` — Update the instances in the array with new parameter values for the target population.

**Properties** (1):
  - `name`: `str` [Read-Only] — [Read-Only] Name of the customizable object population. (str)

### `unreal.CustomizableObjectPopulationClass`
Inherits: `Object` | Header: `CustomizableObjectPopulationClass.h`

Customizable Object Population Class

### `unreal.CurveColor`
Inherits: `EnumBase` | Header: `CustomizableObjectPopulationConstraint.h`

ECurve Color

**Properties** (4):
  - `ALPHA`: `CurveColor = Ellipsis` — 3
  - `BLUE`: `CurveColor = Ellipsis` — 2
  - `GREEN`: `CurveColor = Ellipsis` — 1
  - `RED`: `CurveColor = Ellipsis` — 0

### `unreal.PopulationConstraintType`
Inherits: `EnumBase` | Header: `CustomizableObjectPopulationConstraint.h`

EPopulation Constraint Type

**Properties** (9):
  - `BOOL`: `PopulationConstraintType = Ellipsis` — 1
  - `CURVE`: `PopulationConstraintType = Ellipsis` — 7
  - `CURVE_COLOR`: `PopulationConstraintType = Ellipsis` — 8
  - `DISCRETE`: `PopulationConstraintType = Ellipsis` — 2
  - `DISCRETE_COLOR`: `PopulationConstraintType = Ellipsis` — 4
  - `DISCRETE_FLOAT`: `PopulationConstraintType = Ellipsis` — 3
  - `NONE`: `PopulationConstraintType = Ellipsis` — 0
  - `RANGE`: `PopulationConstraintType = Ellipsis` — 6
  - `TAG`: `PopulationConstraintType = Ellipsis` — 5
