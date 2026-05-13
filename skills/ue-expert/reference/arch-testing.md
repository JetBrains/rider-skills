# Testing Strategies in Unreal Engine

## Testing Frameworks (Recommended Order)

### 1. CQTest (Code Quality Test) — Best General Purpose
- Upstream from Sea of Thieves (Rare)
- Supports `BeforeAll`/`AfterAll`/`BeforeEach`/`AfterEach` fixtures
- Excellent latent command handling and PIE helpers
- Used in Lyra's ShooterTests plugin
- Ideal for gameplay tests at all scopes (unit through functional)

### 2. Specs Framework — BDD-Style
- `BEGIN_DEFINE_SPEC`/`END_DEFINE_SPEC` macros with `Describe()`/`It()` blocks
- Supports `BeforeEach`/`AfterEach` (no `BeforeAll`/`AfterAll`)
- Good parametric test support
- Recommended for asset validation and API testing
- Files: `<FeatureName>.spec.cpp`

### 3. Functional Tests — Level-Based
- Blueprint-accessible level-based testing
- Place `AFunctionalTest` actors in test maps
- Suitable for in-world gameplay validation
- Reference: Jessica Baker's Sea of Thieves GDC talk

### 4. Asset Data Validation
- Extends validation to all UObjects; runs on save
- Project-wide asset quality checks
- Lyra uses `ULyraEditorValidator` for custom validation

### 5. Gauntlet
- Orchestrates tests across multiple runs
- Multiplayer and integration testing at scale
- Configuration in `GauntletSettings.xml`

---

## Best Practices

### General Rules
- **Never assume state**: Tests can run in any order
- **Clean up**: Leave disk/world state as you found it
- **Initialize cleanly**: Assume previous test left bad state
- **Wrap in guards**: `#if WITH_AUTOMATION_TESTS` to exclude from Shipping

### Test Organization
```
Source/
  MyModule/
    Private/
      Tests/
        MyFeatureTest.cpp        // CQTest
        MyFeature.spec.cpp       // Specs
```

### Test Categories
| Category | Purpose | CI Use |
|----------|---------|--------|
| Smoke | Quick validation | CI gatekeeping |
| Product | Full gameplay tests | Nightly builds |
| Stress | Load/performance | Weekly |
| Perf | Performance benchmarks | On demand |
| Engine | Engine-level tests | Engine changes only |

### Multiplayer Testing
- Use Gauntlet for multi-client orchestration
- Test with simulated latency (`net PktLag`, `net PktLoss`)
- Validate OnRep callbacks fire correctly
- Test join-in-progress scenarios
- Lyra: `ShooterTests` plugin contains functional test maps

---

## What to Test

### Critical Paths
- **Initialization**: Experience loading, component init state progression
- **Replication**: Property OnRep, FastArraySerializer callbacks, RPC delivery
- **Ability System**: Activation, costs, cooldowns, tag interactions
- **Equipment**: Equip/unequip grants/revokes abilities correctly
- **Team System**: Team assignment, comparison, friendly fire rules
- **Input**: Action → tag → ability chain works end-to-end

### Asset Validation
- References resolve (no broken soft references)
- DataAssets have required fields populated
- GameFeature plugins have correct flags
- Mesh collision settings are correct (Lyra: `ULyraEditorValidator`)

---

## Anti-Patterns
- Writing multi-frame tests with base `IMPLEMENT_SIMPLE_AUTOMATION_TEST` when CQTest/Specs would be simpler
- Not cleaning up between tests (cascading failures)
- Ignoring editor tool testing
- Not testing join-in-progress in multiplayer
- Testing only the happy path (missing error/edge cases)
- Using `Sleep`/`Delay` in tests instead of latent commands
