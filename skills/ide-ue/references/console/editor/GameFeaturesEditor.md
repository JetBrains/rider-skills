# UE Python API — GameFeaturesEditor Module

**1 types** from the `GameFeaturesEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `IllegalPluginDependenciesValidator`

---

## Classes

### `unreal.IllegalPluginDependenciesValidator`
Inherits: `EditorValidatorBase` | Header: `IllegalPluginDependenciesValidator.h`

Ensures that non-GameFeaturePlugins do not depend on GameFeaturePlugins. GameFeaturePlugins will load content later than non-GameFeaturePlugins which could cause linker load issues if they do not exis...
