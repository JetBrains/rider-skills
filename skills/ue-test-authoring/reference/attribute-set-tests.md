# Attribute Set Tests

Read this only when the unit under test is an Unreal `UAttributeSet` or an attribute-change hook.

- Check whether the accessor under test routes through `GetOwningAbilitySystemComponent()`.
- When constructing the attribute set directly, seed backing values with `InitXxx` or raw attribute data before invoking the hook.
- Call `SetXxx` only when the test also creates a minimal owning actor and ability-system component, initializes actor info, and registers the attribute set with that component.
- For a clamp, call the actual hook declared in source, widening access narrowly if necessary. Seed the relevant upper-bound attribute, assert a high outlier clamps to that bound, and assert a negative input clamps to zero.
- Do not substitute a helper or infer the hook from a call site.
