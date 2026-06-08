# UE Python API — ToolMenus Module

**30 types** from the `ToolMenus` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ScriptSlateIcon`, `ToolDynamicUIAction`, `ToolMenuContext`, `ToolMenuEntry`, `ToolMenuEntryScriptData`, `ToolMenuEntryScriptDataAdvanced`, `ToolMenuInsert`, `ToolMenuOwner`, `ToolMenuProfileMap`, `ToolMenuSection`, `ToolMenuStringCommand`, `SlateTabManagerContext`, `ToolMenu`, `ToolMenuContextBase`, `ToolMenuContextExtensions`, `ToolMenuEntryExtensions`, `ToolMenuEntryScript`, `ToolMenuProfileContext`, `ToolMenus`, `ToolMenuSectionDynamic`, ... (30 total)

---

## Classes

### `unreal.ScriptSlateIcon`
Inherits: `StructBase` | Header: `ToolMenuEntryScript.h`

Script Slate Icon

**Properties** (3):
  - `small_style_name`: `Name` — [Read-Write] (Name)
  - `style_name`: `Name` — [Read-Write] (Name)
  - `style_set_name`: `Name` — [Read-Write] (Name)

### `unreal.ToolDynamicUIAction`
Inherits: `StructBase` | Header: `ToolMenuDelegates.h`

Tool Dynamic UIAction

**Properties** (4):
  - `can_execute_action`: `ToolMenuDynamicCanExecuteAction` — [Read-Write] (ToolMenuDynamicCanExecuteAction)
  - `execute_action`: `ToolMenuDynamicExecuteAction` — [Read-Write] (ToolMenuDynamicExecuteAction)
  - `get_action_check_state`: `ToolMenuDynamicGetActionCheckState` — [Read-Write] (ToolMenuDynamicGetActionCheckState)
  - `is_action_visible_delegate`: `ToolMenuDynamicIsActionButtonVisible` — [Read-Write] (ToolMenuDynamicIsActionButtonVisible)

### `unreal.ToolMenuContext`
Inherits: `StructBase` | Header: `ToolMenuContext.h`

Tool Menu Context

**Methods** (2):
  - `debug_log_context_object_classes()` -> `None` — Debug Log Context Object Classes
  - `find_by_class(class_)` -> `Object` — Find by Class

### `unreal.ToolMenuEntry`
Inherits: `StructBase` | Header: `ToolMenuEntry.h`

Represents entries in menus such as buttons, checkboxes, and sub-menus.

**Methods** (6):
  - `get_label()` -> `Text` — Get Label
  - `get_tool_tip()` -> `Text` — Get Tool Tip
  - `set_icon(style_set_name, style_name = 'None', small_style_name = 'None')` -> `None` — Set Icon
  - `set_label(label)` -> `None` — Set Label
  - `set_string_command(type, custom_type, string)` -> `None` — Set String Command
  - `set_tool_tip(tool_tip)` -> `None` — Set Tool Tip

**Properties** (9):
  - `insert_position`: `ToolMenuInsert` — [Read-Write] (ToolMenuInsert)
  - `name`: `Name` — [Read-Write] (Name)
  - `owner`: `ToolMenuOwner` — [Read-Write] (ToolMenuOwner)
  - `script_object`: `ToolMenuEntryScript` — [Read-Write] (ToolMenuEntryScript)
  - `should_close_window_after_menu_selection`: `bool` — [Read-Write] (bool)
  - `style_name_override`: `Name` — [Read-Write] (Name)
  - `tutorial_highlight_name`: `Name` — [Read-Write] (Name)
  - `type`: `MultiBlockType` — [Read-Write] (MultiBlockType)
  - `user_interface_action_type`: `UserInterfaceActionType` — [Read-Write] (UserInterfaceActionType)

### `unreal.ToolMenuEntryScriptData`
Inherits: `StructBase` | Header: `ToolMenuEntryScript.h`

Tool Menu Entry Script Data

**Properties** (9):
  - `advanced`: `ToolMenuEntryScriptDataAdvanced` — [Read-Write] (ToolMenuEntryScriptDataAdvanced)
  - `icon`: `ScriptSlateIcon` — [Read-Write] (ScriptSlateIcon)
  - `insert_position`: `ToolMenuInsert` — [Read-Write] (ToolMenuInsert)
  - `label`: `Text` — [Read-Write] (Text)
  - `menu`: `Name` — [Read-Write] (Name)
  - `name`: `Name` — [Read-Write] (Name)
  - `owner_name`: `Name` — [Read-Write] Optional identifier used for unregistering a group of menu items (Name)
  - `section`: `Name` — [Read-Write] (Name)
  - `tool_tip`: `Text` — [Read-Write] (Text)

### `unreal.ToolMenuEntryScriptDataAdvanced`
Inherits: `StructBase` | Header: `ToolMenuEntryScript.h`

Tool Menu Entry Script Data Advanced

**Properties** (8):
  - `entry_type`: `MultiBlockType` — [Read-Write] (MultiBlockType)
  - `is_sub_menu`: `bool` — [Read-Write] (bool)
  - `open_sub_menu_on_click`: `bool` — [Read-Write] (bool)
  - `should_close_window_after_menu_selection`: `bool` — [Read-Write] (bool)
  - `simple_combo_box`: `bool` — [Read-Write] (bool)
  - `style_name_override`: `Name` — [Read-Write] (Name)
  - `tutorial_highlight`: `Name` — [Read-Write] (Name)
  - `user_interface_action_type`: `UserInterfaceActionType` — [Read-Write] (UserInterfaceActionType)

### `unreal.ToolMenuInsert`
Inherits: `StructBase` | Header: `ToolMenuMisc.h`

Tool Menu Insert

**Properties** (2):
  - `name`: `Name` — [Read-Write] Where to insert (Name)
  - `position`: `ToolMenuInsertType` — [Read-Write] How to insert (ToolMenuInsertType)

### `unreal.ToolMenuOwner`
Inherits: `StructBase` | Header: `ToolMenuOwner.h`

Represents the owner of a menu. Can be used when registering menus to later unregistering all menus created by a specified owner.

### `unreal.ToolMenuProfileMap`
Inherits: `StructBase` | Header: `ToolMenus.h`

Struct to store all the profiles for a menu for serialization

### `unreal.ToolMenuSection`
Inherits: `StructBase` | Header: `ToolMenuSection.h`

Tool Menu Section

**Methods** (4):
  - `add_entry(args)` -> `None` — Add Entry
  - `add_entry_object(object)` -> `None` — Add Entry Object
  - `get_label()` -> `Text` — Get Label
  - `set_label(label)` -> `None` — Set Label

**Properties** (6):
  - `blocks`: `None` — [Read-Write] (Array[ToolMenuEntry])
  - `context`: `ToolMenuContext` — [Read-Write] (ToolMenuContext)
  - `insert_position`: `ToolMenuInsert` — [Read-Write] (ToolMenuInsert)
  - `name`: `Name` — [Read-Write] (Name)
  - `owner`: `ToolMenuOwner` — [Read-Write] (ToolMenuOwner)
  - `tool_menu_section_dynamic`: `ToolMenuSectionDynamic` — [Read-Write] (ToolMenuSectionDynamic)

### `unreal.ToolMenuStringCommand`
Inherits: `StructBase` | Header: `ToolMenuMisc.h`

Tool Menu String Command

**Properties** (3):
  - `custom_type`: `Name` — [Read-Write] Which command handler to use when type is custom (Name)
  - `string`: `str` — [Read-Write] String to pass to command handler (str)
  - `type`: `ToolMenuStringCommandType` — [Read-Write] Which command handler to use (ToolMenuStringCommandType)

### `unreal.SlateTabManagerContext`
Inherits: `ToolMenuContextBase` | Header: `ToolMenuContext.h`

Slate Tab Manager Context

### `unreal.ToolMenu`
Inherits: `ToolMenuBase` | Header: `ToolMenu.h`

Represents a menu in the ToolMenus system.

**Methods** (7):
  - `add_dynamic_section(section_name, object)` -> `None` — Add Dynamic Section Script
  - `add_menu_entry(section_name, args)` -> `None` — Add Menu Entry
  - `add_menu_entry_object(object)` -> `None` — Add Menu Entry Object
  - `add_section(section_name, label = '', insert_name = 'None', insert_type = ToolMenuInsertType.DEFAULT, alignment = ToolMenuSectionAlign.DEFAULT)` -> `None` — Add Section Script
  - `add_sub_menu(owner, section_name, name, label, tool_tip = '')` -> `ToolMenu` — Add Sub Menu Script
  - `init_menu(owner, name, parent = 'None', type = MultiBoxType.MENU)` -> `None` — Init Menu
  - `remove_menu_entry_object(object)` -> `None` — Remove Menu Entry Object

**Properties** (14):
  - `allow_tool_bar_wrap_button`: `type` — [Read-Write] Whether to (ever) allow the wrap button/overflow menu. Defauls to the style. (âundefi...
  - `close_self_only`: `bool` — [Read-Write] (bool)
  - `menu_name`: `Name` — [Read-Write] (Name)
  - `menu_owner`: `ToolMenuOwner` — [Read-Write] (ToolMenuOwner)
  - `menu_parent`: `Name` — [Read-Write] (Name)
  - `menu_type`: `MultiBoxType` — [Read-Write] (MultiBoxType)
  - `prevent_customization`: `bool` — [Read-Write] Prevent menu from being customized (bool)
  - `searchable`: `bool` — [Read-Write] (bool)
  - `separate_sections`: `bool` — [Read-Write] Whether different sections should have separators automatically added between them. (bo...
  - `should_close_window_after_menu_selection`: `bool` — [Read-Write] (bool)
  - `style_name`: `Name` — [Read-Write] (Name)
  - `tool_bar_force_small_icons`: `bool` — [Read-Write] (bool)
  - `tool_bar_is_focusable`: `bool` — [Read-Write] (bool)
  - `tutorial_highlight_name`: `Name` — [Read-Write] (Name)

### `unreal.ToolMenuContextBase`
Inherits: `Object` | Header: `ToolMenuContext.h`

Tool Menu Context Base

### `unreal.ToolMenuContextExtensions`
Inherits: `Object` | Header: `ToolMenusBlueprintLibrary.h`

Tool Menu Context Extensions

**Methods** (2):
  - `debug_log_context_object_classes(context)` -> `None` [classmethod] — Debug Log Context Object Classes
  - `find_by_class(context, class_)` -> `Object` [classmethod] — Find by Class

### `unreal.ToolMenuEntryExtensions`
Inherits: `Object` | Header: `ToolMenusBlueprintLibrary.h`

Tool Menu Entry Extensions

**Methods** (7):
  - `get_label(target)` -> `Text` [classmethod] — Get Label
  - `get_tool_tip(target)` -> `Text` [classmethod] — Get Tool Tip
  - `init_menu_entry(owner, name, label, tool_tip, command_type, custom_command_type, command_string)` -> `ToolMenuEntry` [classmethod] — Init Menu Entry
  - `set_icon(target, style_set_name, style_name = 'None', small_style_name = 'None')` -> `ToolMenuEntry` [classmethod] — Set Icon
  - `set_label(target, label)` -> `ToolMenuEntry` [classmethod] — Set Label
  - `set_string_command(target, type, custom_type, string)` -> `ToolMenuEntry` [classmethod] — Set String Command
  - `set_tool_tip(target, tool_tip)` -> `ToolMenuEntry` [classmethod] — Set Tool Tip

### `unreal.ToolMenuEntryScript`
Inherits: `Object` | Header: `ToolMenuEntryScript.h`

Tool Menu Entry Script

**Methods** (12):
  - `can_execute(context)` -> `bool` — Can Execute
  - `construct_menu_entry(menu, section_name, context)` -> `None` — Construct Menu Entry
  - `execute(context)` -> `None` — Execute
  - `get_check_state(context)` -> `CheckBoxState` — Get Check State
  - `get_icon(context)` -> `ScriptSlateIcon` — Get Icon
  - `get_label(context)` -> `Text` — Get Label
  - `get_tool_tip(context)` -> `Text` — Get Tool Tip
  - `init_entry(owner_name, menu, section, name, label = '', tool_tip = '')` -> `None` — Init Entry
  - `is_visible(context)` -> `bool` — Is Visible
  - `register_menu_entry()` -> `None` — Register Menu Entry
  - `show_in_toolbar_top_level(context)` -> `bool` — Show in Toolbar Top Level
  - `unregister_menu_entry()` -> `None` — Unregister Menu Entry

**Properties** (1):
  - `data`: `ToolMenuEntryScriptData` — [Read-Write] (ToolMenuEntryScriptData)

### `unreal.ToolMenuProfileContext`
Inherits: `ToolMenuContextBase` | Header: `ToolMenus.h`

A global context that any menu can add/modify to specify which profiles are currently active

### `unreal.ToolMenus`
Inherits: `Object` | Header: `ToolMenus.h`

Tool Menus

**Methods** (16):
  - `add_menu_entry_object(menu_entry_object)` -> `bool` [classmethod] — Registers menu entry object from blueprint/script
  - `extend_menu(name)` -> `ToolMenu` — Extends a menu without registering the menu or claiming ownership of it. Ok to call even if menu does not exist yet.
  - `find_context(context, class_)` -> `Object` [classmethod] — Finds a context object of a given class if it exists
  - `find_menu(name)` -> `ToolMenu` — Finds an existing menu that has been registered or extended.
  - `get()` -> `ToolMenus` [classmethod] — Get
  - `is_menu_registered(name)` -> `bool` — Determines if a menu has already been registered.
  - `refresh_all_widgets()` -> `None` — Rebuilds all currently generated widgets next tick.
  - `refresh_menu_widget(name)` -> `bool` — Rebuilds all widgets generated from a specific menu.
  - `register_menu(name, parent = 'None', type = MultiBoxType.MENU, warn_if_already_registered = True)` -> `ToolMenu` — Registers a menu by name
  - `remove_entry(menu_name, section, name)` -> `None` — Removes a menu entry from a given menu and section
  - `remove_menu(menu_name)` -> `None` — Unregisters a menu by name
  - `remove_menu_entry_object(menu_entry_object)` -> `bool` [classmethod] — Unregisters menu entry object from blueprint/script
  - `remove_section(menu_name, section)` -> `None` — Removes a section from a given menu
  - `set_section_label(menu_name, section_name, label)` -> `None` — Sets a sectionâs displayed label text.
  - `set_section_position(menu_name, section_name, other_section_name, position_type)` -> `None` — Sets where to insert a section into a menu when generating relative to other section names.
  - `unregister_owner_by_name(owner_name)` -> `None` — Removes all entries that were registered under a specific owner name

### `unreal.ToolMenuSectionDynamic`
Inherits: `Object` | Header: `ToolMenuSection.h`

Tool Menu Section Dynamic

**Methods** (1):
  - `construct_sections(menu, context)` -> `None` — Construct Sections

### `unreal.ToolMenuSectionExtensions`
Inherits: `Object` | Header: `ToolMenusBlueprintLibrary.h`

Tool Menu Section Extensions

**Methods** (4):
  - `add_entry(section, args)` -> `ToolMenuSection` [classmethod] — Add Entry
  - `add_entry_object(section, object)` -> `ToolMenuSection` [classmethod] — Add Entry Object
  - `get_label(section)` -> `Text` [classmethod] — Get Label
  - `set_label(section, label)` -> `ToolMenuSection` [classmethod] — Set Label

### `unreal.ToolMenuWidgetCollectionContext`
Inherits: `ToolMenuContextBase` | Header: `ToolMenuWidgetCollectionContext.h`

Context class containing a collection of widgets that can be added for later retrieval. see: FToolMenuContext

### `unreal.ToolMenuInsertType`
Inherits: `EnumBase` | Header: `ToolMenuMisc.h`

ETool Menu Insert Type

**Properties** (5):
  - `AFTER`: `ToolMenuInsertType = Ellipsis` — 2
  - `BEFORE`: `ToolMenuInsertType = Ellipsis` — 1
  - `DEFAULT`: `ToolMenuInsertType = Ellipsis` — 0
  - `FIRST`: `ToolMenuInsertType = Ellipsis` — 3
  - `LAST`: `ToolMenuInsertType = Ellipsis` — 4

### `unreal.ToolMenuSectionAlign`
Inherits: `EnumBase` | Header: `ToolMenuSection.h`

ETool Menu Section Align

**Properties** (4):
  - `DEFAULT`: `ToolMenuSectionAlign = Ellipsis` — 0
  - `FIRST`: `ToolMenuSectionAlign = Ellipsis` — 1
  - `LAST`: `ToolMenuSectionAlign = Ellipsis` — 3
  - `MIDDLE`: `ToolMenuSectionAlign = Ellipsis` — 2

### `unreal.ToolMenuStringCommandType`
Inherits: `EnumBase` | Header: `ToolMenuMisc.h`

ETool Menu String Command Type

**Properties** (3):
  - `COMMAND`: `ToolMenuStringCommandType = Ellipsis` — 0
  - `CUSTOM`: `ToolMenuStringCommandType = Ellipsis` — 2
  - `PYTHON`: `ToolMenuStringCommandType = Ellipsis` — 1

### `unreal.ToolMenuDynamicCanExecuteAction`
Inherits: `DelegateBase` | Header: `ToolMenuDelegates.h`

Tool Menu Dynamic Can Execute Action Delegate Signature

### `unreal.ToolMenuDynamicExecuteAction`
Inherits: `DelegateBase` | Header: `ToolMenuDelegates.h`

Tool Menu Dynamic Execute Action Delegate Signature

### `unreal.ToolMenuDynamicGetActionCheckState`
Inherits: `DelegateBase` | Header: `ToolMenuDelegates.h`

Tool Menu Dynamic Get Action Check State Delegate Signature

### `unreal.ToolMenuDynamicIsActionButtonVisible`
Inherits: `DelegateBase` | Header: `ToolMenuDelegates.h`

Tool Menu Dynamic Is Action Button Visible Delegate Signature

### `unreal.ToolMenuDynamicIsActionChecked`
Inherits: `DelegateBase` | Header: `ToolMenuDelegates.h`

Tool Menu Dynamic Is Action Checked Delegate Signature
