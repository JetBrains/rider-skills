# UE Python API — VCamExtensions Module

**17 types** from the `VCamExtensions` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `PerModifierClassWidgetSytleData`, `TargettedModifierStyleConfig`, `VCamModifierConnectionBinding`, `WidgetStyleDataArray`, `WidgetStyleDataConfig`, `BaseModifierGroup`, `ButtonWidgetStyleData`, `ClassBasedWidgetStyleDefinitions`, `ModifierBoundWidgetStyleDefinitions`, `ModifierBoundWidgetStylesAsset`, `ModifierHierarchyAsset`, `ModifierHierarchyRules`, `SingleModifierPerNodeWithTargetSettings`, `TargetBasedWidgetStyleDefinitions`, `TargetModifierPerNodeHierarchyRules`, `VCamBaseActorWithPreset`, `WidgetStyleData`

---

## Classes

### `unreal.PerModifierClassWidgetSytleData`
Inherits: `StructBase` | Header: `ClassBasedWidgetStyleDefinitions.h`

Per Modifier Class Widget Sytle Data

### `unreal.TargettedModifierStyleConfig`
Inherits: `StructBase` | Header: `TargetBasedWidgetStyleDefinitions.h`

Targetted Modifier Style Config

### `unreal.VCamModifierConnectionBinding`
Inherits: `StructBase` | Header: `ModifierHierarchyRules.h`

VCam Modifier Connection Binding

**Properties** (2):
  - `connection_point`: `Name` — [Read-Write] (Name)
  - `modifier`: `VCamModifier` — [Read-Write] (VCamModifier)

### `unreal.WidgetStyleDataArray`
Inherits: `StructBase` | Header: `WidgetStyleDataArray.h`

Widget Style Data Array

### `unreal.WidgetStyleDataConfig`
Inherits: `StructBase` | Header: `ClassBasedWidgetStyleDefinitions.h`

Widget Style Data Config

### `unreal.BaseModifierGroup`
Inherits: `Object` | Header: `BaseModifierGroup.h`

Implements base logic to keep group names unique within a hierachy

### `unreal.ButtonWidgetStyleData`
Inherits: `WidgetStyleData` | Header: `ButtonWidgetStyleData.h`

Associates a button style for widgets that want to display a button for a modifier / connection point.

**Properties** (1):
  - `button_style`: `ButtonStyle` — [Read-Write] (ButtonStyle)

### `unreal.ClassBasedWidgetStyleDefinitions`
Inherits: `ModifierBoundWidgetStyleDefinitions` | Header: `ClassBasedWidgetStyleDefinitions.h`

Assigns meta data based on modifier class. To every modifier class you can assign meta data.

### `unreal.ModifierBoundWidgetStyleDefinitions`
Inherits: `Object` | Header: `ModifierBoundWidgetStyleDefinitions.h`

Associates information with modifiers and their connection points. You can use it to retrieve custom information assigned to a modifier and / or its connections, such as what icon a button representin...

**Methods** (6):
  - `get_style_for_connection_point_by_class(modifier, connection_point, class_)` -> `WidgetStyleData` — Get Style for Connection Point by Class
  - `get_style_for_modifier_by_class(modifier, class_)` -> `WidgetStyleData` — Get Style for Modifier by Class
  - `get_style_for_name_by_class(category="VirtualCamera", class_)` -> `WidgetStyleData` — Get Style for Name by Class
  - `get_styles_for_connection_point(modifier, connection_point)` -> `Array [ WidgetStyleData ]` — Retrieves all meta data that is associated for a given modifier and a sub-category name.
  - `get_styles_for_modifier(modifier)` -> `Array [ WidgetStyleData ]` — Retrieves all meta data that is associated for a given modifier.
  - `get_styles_for_name(category = 'VirtualCamera')` -> `Array [ WidgetStyleData ]` — Retrieves all meta data that is associated with a given a category name; this data is not associated with any kind of mo...

### `unreal.ModifierBoundWidgetStylesAsset`
Inherits: `Object` | Header: `ModifierBoundWidgetStylesAsset.h`

An asset intended to be referenced by Slate widgets.

**Methods** (6):
  - `get_style_for_connection_point_by_class(modifier, connection_point, class_)` -> `WidgetStyleData` — Get Style for Connection Point by Class
  - `get_style_for_modifier_by_class(modifier, class_)` -> `WidgetStyleData` — Get Style for Modifier by Class
  - `get_style_for_name_by_class(name, class_)` -> `WidgetStyleData` — Get Style for Name by Class
  - `get_styles_for_connection_point(modifier, connection_point)` -> `Array [ WidgetStyleData ]` — Retrieves all meta data that is associated for a given modifier and a sub-category name.
  - `get_styles_for_modifier(modifier)` -> `Array [ WidgetStyleData ]` — Retrieves all meta data that is associated for a given modifier.
  - `get_styles_for_name(category = 'VirtualCamera')` -> `Array [ WidgetStyleData ]` — Retrieves all meta data that is associated with a given a category name; this data is not associated with any kind of mo...

**Properties** (1):
  - `rules`: `ModifierBoundWidgetStyleDefinitions` [Read-Only] — [Read-Only] (ModifierBoundWidgetStyleDefinitions)

### `unreal.ModifierHierarchyAsset`
Inherits: `Object` | Header: `ModifierHierarchyAsset.h`

An asset intended to be referenced by Slate widgets.

**Methods** (6):
  - `get_child_nodes(parent_group)` -> `Set [ Name ]` — Gets the child groups of the given group.
  - `get_connection_point_target_for_node(group_name, component)` -> `VCamModifierConnectionBinding or None` — Gets the connection point the modifier is configured to be bound to. This function is optional to implement; it is valid...
  - `get_groups_containing_modifier(modifier)` -> `Set [ Name ]` — Utility function to get all groups which contain this modifier.
  - `get_modifier_in_node(component, group_name)` -> `VCamModifier` — Gets all the modifiers on the component that belong in the given group.
  - `get_parent_node(child_node)` -> `Name or None` — Gets the parent of this given group. Fails if called on the root node.
  - `get_root_node()` -> `Name` — Gets the root of the tree.

**Properties** (1):
  - `rules`: `ModifierHierarchyRules` [Read-Only] — [Read-Only] (ModifierHierarchyRules)

### `unreal.ModifierHierarchyRules`
Inherits: `Object` | Header: `ModifierHierarchyRules.h`

Defines a tree hierarchy. Each node is called a group. A group consists of connections and (sub) groups. A connection is a modifier and a corresponding connection point.

**Methods** (6):
  - `get_child_nodes(node)` -> `Set [ Name ]` — Gets the child groups of the given group.
  - `get_connection_point_target_for_node(group_name, component)` -> `VCamModifierConnectionBinding or None` — Gets the connection point the modifier is configured to be bound to, if any. This function is optional to implement; it ...
  - `get_modifier_in_node(component, node_name)` -> `VCamModifier` — Gets all the modifiers on the component that belong in the given group.
  - `get_nodes_containing_modifier(modifier)` -> `Set [ Name ]` — Utility function to get all groups which contain this modifier.
  - `get_parent_node(child_node)` -> `Name or None` — Gets the parent of this given group. Fails if called on the root node.
  - `get_root_node()` -> `Name` — Gets the root of the tree.

### `unreal.SingleModifierPerNodeWithTargetSettings`
Inherits: `BaseModifierGroup` | Header: `TargetModifierPerNodeHierarchyRules.h`

Single Modifier Per Node with Target Settings

### `unreal.TargetBasedWidgetStyleDefinitions`
Inherits: `ModifierBoundWidgetStyleDefinitions` | Header: `TargetBasedWidgetStyleDefinitions.h`

Target Based Widget Style Definitions

### `unreal.TargetModifierPerNodeHierarchyRules`
Inherits: `ModifierHierarchyRules` | Header: `TargetModifierPerNodeHierarchyRules.h`

Target Modifier Per Node Hierarchy Rules

### `unreal.VCamBaseActorWithPreset`
Inherits: `VCamBaseActor` | Header: `VCamBaseActorWithPreset.h`

Base class for the VCamActor preset Blueprint.

### `unreal.WidgetStyleData`
Inherits: `Object` | Header: `WidgetStyleData.h`

Base class for data that can be associated with modifiers / their connection points.
