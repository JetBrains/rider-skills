# UE Python API — ObjectMixerEditor Module

**8 types** from the `ObjectMixerEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ObjectMixerWidgetUserConfig`, `ObjectMixerBlueprintFilterFactory`, `ObjectMixerBlueprintObjectFilter`, `ObjectMixerEditorUWidget`, `ObjectMixerObjectFilter`, `ObjectMixerHybridMode`, `ObjectMixerInheritanceInclusionOptions`, `ObjectMixerTreeViewMode`

---

## Classes

### `unreal.ObjectMixerWidgetUserConfig`
Inherits: `StructBase` | Header: `ObjectMixerEditorUWidget.h`

User Configurable Variables

**Properties** (1):
  - `default_filter_class`: `Class` — [Read-Write] Sets the default filter class to determine what objects and properties to display in th...

### `unreal.ObjectMixerBlueprintFilterFactory`
Inherits: `Factory` | Header: `ObjectMixerFilterFactory.h`

Object Mixer Blueprint Filter Factory

### `unreal.ObjectMixerBlueprintObjectFilter`
Inherits: `ObjectMixerObjectFilter` | Header: `ObjectMixerEditorObjectFilter.h`

Script class for filtering object types to Object Mixer. Blueprint classes should inherit directly from this class.

**Methods** (10):
  - `get_columns_to_exclude()` -> `Set [ Name ]` — Specify a list of property names corresponding to columns you donât want to ever show. For example, you can specify â...
  - `get_columns_to_show_by_default()` -> `Set [ Name ]` — Specify a list of property names corresponding to columns you want to show by default. For example, you can specify âI...
  - `get_force_added_columns()` -> `Set [ Name ]` — Specify a list of property names found in parent classes you want to show that arenât in the specified classes. Note t...
  - `get_object_classes_to_filter()` -> `Set [ type ( Class ) ]` — Return the basic object types you want to filter for in your level. For example, if you want to work with Lights, return...
  - `get_object_classes_to_place()` -> `Set [ type ( Class ) ]` — Return the basic actor types you want to be able to place using the Add button. Note that only subclasses of AActor are ...
  - `get_object_mixer_placement_class_inclusion_options()` -> `ObjectMixerInheritanceInclusionOptions` — Specify whether we should return only the specified classes or the parent and child classes in placement mode. Defaults ...
  - `get_object_mixer_property_inheritance_inclusion_options()` -> `ObjectMixerInheritanceInclusionOptions` — Specify whether we should return only the properties of the specified classes or the properties of parent and child clas...
  - `get_properties_that_require_list_refresh()` -> `Set [ Name ]` — If a property is changed that has a name found in this set, the panel will be refreshed. Add a property name to this lis...
  - `get_show_transient_objects()` -> `bool` — Determines if transient objects (such as Sequencer Spawnables) should be shown in the list. False by default.
  - `should_include_unsupported_properties()` -> `bool` — If true, properties that are not visible in the details panel and properties not supported by SSingleProperty will be se...

### `unreal.ObjectMixerEditorUWidget`
Inherits: `Widget` | Header: `ObjectMixerEditorUWidget.h`

A UMG widget wrapper for the Object Mixer widget. Uses the same data as the Generic Object Mixer Instance. Only useful in the editor. It is not compatible at runtime.

**Properties** (1):
  - `object_mixer_widget_user_config`: `ObjectMixerWidgetUserConfig` — [Read-Write] End of UWidget (ObjectMixerWidgetUserConfig)

### `unreal.ObjectMixerObjectFilter`
Inherits: `Object` | Header: `ObjectMixerEditorObjectFilter.h`

Native class for filtering object types to Object Mixer. Native C++ classes should inherit directly from this class.

### `unreal.ObjectMixerHybridMode`
Inherits: `EnumBase` | Header: `ObjectMixerEditorSettings.h`

EObject Mixer Hybrid Mode

**Properties** (3):
  - `HYBRID_ACTOR`: `ObjectMixerHybridMode = Ellipsis` — Makes hybrid rows and selects the actor in the Scene Outliner when an actor with a single matching c...
  - `HYBRID_COMPONENT`: `ObjectMixerHybridMode = Ellipsis` — Makes hybrid rows and selects the component in the Scene Outliner when an actor with a single matchi...
  - `HYBRID_NONE`: `ObjectMixerHybridMode = Ellipsis` — Does not make hybrid rows when an actor with a single matching component is selected. Actor and comp...

### `unreal.ObjectMixerInheritanceInclusionOptions`
Inherits: `EnumBase` | Header: `ObjectMixerEditorObjectFilter.h`

EObject Mixer Inheritance Inclusion Options

**Properties** (9):
  - `INCLUDE_ALL_CHILDREN`: `ObjectMixerInheritanceInclusionOptions = Ellipsis` — Get properties from all derived classes recursively + Specified Classes 5
  - `INCLUDE_ALL_PARENTS`: `ObjectMixerInheritanceInclusionOptions = Ellipsis` — Go up the chain of parent classes to get all properties in the specified classesâ ancestries + Spe...
  - `INCLUDE_ALL_PARENTS_AND_CHILDREN`: `ObjectMixerInheritanceInclusionOptions = Ellipsis` — IncludeAllParents + IncludeAllChildren + Specified Classes 6
  - `INCLUDE_ALL_PARENTS_AND_ONLY_IMMEDIATE_CHILDREN`: `ObjectMixerInheritanceInclusionOptions = Ellipsis` — IncludeAllParents + IncludeOnlyImmediateChildren + Specified Classes 7
  - `INCLUDE_ONLY_IMMEDIATE_CHILDREN`: `ObjectMixerInheritanceInclusionOptions = Ellipsis` — Get properties from child classes but not child classes of child classes + Specified Classes 2
  - `INCLUDE_ONLY_IMMEDIATE_PARENT`: `ObjectMixerInheritanceInclusionOptions = Ellipsis` — Get properties from the class that the specified classes immediately derive from, but not the parent...
  - `INCLUDE_ONLY_IMMEDIATE_PARENT_AND_ALL_CHILDREN`: `ObjectMixerInheritanceInclusionOptions = Ellipsis` — IncludeOnlyImmediateParent + IncludeAllChildren + Specified Classes 8
  - `INCLUDE_ONLY_IMMEDIATE_PARENT_AND_CHILDREN`: `ObjectMixerInheritanceInclusionOptions = Ellipsis` — IncludeOnlyImmediateParent + IncludeOnlyImmediateChildren + Specified Classes 3
  - `NONE`: `ObjectMixerInheritanceInclusionOptions = Ellipsis` — Get only the properties in the specified classes without considering parent or child classes 0

### `unreal.ObjectMixerTreeViewMode`
Inherits: `EnumBase` | Header: `ObjectMixerEditorObjectFilter.h`

EObject Mixer Tree View Mode

**Properties** (2):
  - `FOLDERS`: `ObjectMixerTreeViewMode = Ellipsis` — Display objects in a hierarchy with folders 1
  - `NO_FOLDERS`: `ObjectMixerTreeViewMode = Ellipsis` — Show all matching objects without folders 0
