# UE Python API — InterchangeTests Module

**8 types** from the `InterchangeTests` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `InterchangeTestFunction`, `InterchangeTestPlanPipelineSettings`, `InterchangeTestScreenshotParameters`, `InterchangeImportTestPlan`, `InterchangeImportTestStepBase`, `InterchangeImportTestStepImport`, `InterchangeImportTestStepReimport`, `InterchangeTestsBlueprintFunctionLibrary`

---

## Classes

### `unreal.InterchangeTestFunction`
Inherits: `StructBase` | Header: `InterchangeTestFunction.h`

Interchange Test Function

### `unreal.InterchangeTestPlanPipelineSettings`
Inherits: `StructBase` | Header: `InterchangeTestPlanPipelineSettings.h`

Interchange Test Plan Pipeline Settings

### `unreal.InterchangeTestScreenshotParameters`
Inherits: `StructBase` | Header: `InterchangeImportTestStepBase.h`

Interchange Test Screenshot Parameters

### `unreal.InterchangeImportTestPlan`
Inherits: `Object` | Header: `InterchangeImportTestPlan.h`

Define a test plan

**Methods** (1):
  - `run_this_test()` -> `None` — Click here to immediately run this single test through the automation framework

**Properties** (1):
  - `steps`: `None` — [Read-Write] Set of steps to perform to carry out this test plan
deprecated: Use the import and reim...

### `unreal.InterchangeImportTestStepBase`
Inherits: `Object` | Header: `InterchangeImportTestStepBase.h`

Interchange Import Test Step Base

### `unreal.InterchangeImportTestStepImport`
Inherits: `InterchangeImportTestStepBase` | Header: `InterchangeImportTestStepImport.h`

Interchange Import Test Step Import

### `unreal.InterchangeImportTestStepReimport`
Inherits: `InterchangeImportTestStepBase` | Header: `InterchangeImportTestStepReimport.h`

Interchange Import Test Step Reimport

### `unreal.InterchangeTestsBlueprintFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `InterchangeTestsBlueprintFunctionLibrary.h`

Interchange Tests Blueprint Function Library

**Methods** (1):
  - `get_pipeline_properties_as_json(pipeline)` -> `str` [classmethod] — Get Pipeline Properties as JSON
