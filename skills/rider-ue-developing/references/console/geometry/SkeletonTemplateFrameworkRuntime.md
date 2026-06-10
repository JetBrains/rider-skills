# UE Python API — SkeletonTemplateFrameworkRuntime Module

**9 types** from the `SkeletonTemplateFrameworkRuntime` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `SkeletonAttributeBinding`, `SkeletonNamedAttribute`, `SkeletonNamedAttributeMapping`, `SkeletonNamedAttributeMappingEntry`, `SkeletonNamedAttributeMappingType`, `SkeletonNamedAttributeSet`, `SkeletonBinding`, `SkeletonTemplate`, `SkeletonTemplateBaseType`

---

## Classes

### `unreal.SkeletonAttributeBinding`
Inherits: `StructBase` | Header: `SkeletonBinding.h`

A skeleton attribute binding

### `unreal.SkeletonNamedAttribute`
Inherits: `StructBase` | Header: `SkeletonTemplate.h`

A skeleton named attribute

### `unreal.SkeletonNamedAttributeMapping`
Inherits: `StructBase` | Header: `SkeletonTemplate.h`

A skeleton named attribute mapping

### `unreal.SkeletonNamedAttributeMappingEntry`
Inherits: `StructBase` | Header: `SkeletonTemplate.h`

A struct stored for each entry in a named attribute mapping

### `unreal.SkeletonNamedAttributeMappingType`
Inherits: `StructBase` | Header: `SkeletonTemplate.h`

A mapping struct for each named attribute mapping to describe what payload type to store for each unique type of named attribute

### `unreal.SkeletonNamedAttributeSet`
Inherits: `StructBase` | Header: `SkeletonTemplate.h`

A skeleton named attribute set

### `unreal.SkeletonBinding`
Inherits: `Object` | Header: `SkeletonBinding.h`

A skeleton binding specifies how a skeleton binds to a template. A binding asset specifies which named attributes bones map to and it can override the named sets/mappings from the source template as n...

### `unreal.SkeletonTemplate`
Inherits: `Object` | Header: `SkeletonTemplate.h`

A skeleton template specifies a list of attributes that skeletons can contain as well as sets and data mappings. A skeleton binding asset can then map each attribute to a skeleton bone/curve/etc as we...

### `unreal.SkeletonTemplateBaseType`
Inherits: `Object` | Header: `NamedElementTypes.h`

Skeleton Template Base Type
