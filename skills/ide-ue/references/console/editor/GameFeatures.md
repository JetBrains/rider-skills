# UE Python API — GameFeatures Module

**3 types** from the `GameFeatures` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `GameFeatureAction`, `GameFeatureData`, `GameFeatureTargetState`

---

## Classes

### `unreal.GameFeatureAction`
Inherits: `Object` | Header: `GameFeatureAction.h`

Represents an action to be taken when a game feature is activated

### `unreal.GameFeatureData`
Inherits: `PrimaryDataAsset` | Header: `GameFeatureData.h`

Data related to a game feature, a collection of code and content that adds a separable discrete feature to the game

**Methods** (1):
  - `get_plugin_name(gfd)` -> `str` [classmethod] — Get Plugin Name

### `unreal.GameFeatureTargetState`
Inherits: `EnumBase` | Header: `GameFeaturesSubsystem.h`

EGame Feature Target State

**Properties** (4):
  - `ACTIVE`: `GameFeatureTargetState = Ellipsis` — 3
  - `INSTALLED`: `GameFeatureTargetState = Ellipsis` — 0
  - `LOADED`: `GameFeatureTargetState = Ellipsis` — 2
  - `REGISTERED`: `GameFeatureTargetState = Ellipsis` — 1
