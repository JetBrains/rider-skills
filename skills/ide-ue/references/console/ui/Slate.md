# UE Python API — Slate Module

**25 types** from the `Slate` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `Anchors`, `CustomizedToolMenu`, `InputChord`, `ToolMenuProfile`, `VirtualKeyboardOptions`, `ButtonWidgetStyle`, `ProgressWidgetStyle`, `ToolMenuBase`, `DescendantScrollDestination`, `ListItemAlignment`, `MultiBlockType`, `MultiBoxType`, `ProgressBarFillStyle`, `ProgressBarFillType`, `ScrollIntoViewAlignment`, `ScrollWhenFocusChanges`, `SelectionMode`, `Stretch`, `StretchDirection`, `TextFlowDirection`, ... (25 total)

---

## Classes

### `unreal.Anchors`
Inherits: `StructBase` | Header: `Anchors.h`

Describes how a widget is anchored.

**Properties** (2):
  - `maximum`: `Vector2D` — [Read-Write] Holds the maximum anchors, right + bottom. (Vector2D)
  - `minimum`: `Vector2D` — [Read-Write] Holds the minimum anchors, left + top. (Vector2D)

### `unreal.CustomizedToolMenu`
Inherits: `ToolMenuProfile` | Header: `ToolMenuBase.h`

A menu customization is a specialization of menu profiles - that allows for advanced behavior such as modifying the order of sections/entries A menu can only have one customization active at a time

### `unreal.InputChord`
Inherits: `StructBase` | Header: `InputChord.h`

An Input Chord is a key and the modifier keys that are to be held with it.

**Properties** (5):
  - `alt`: `bool` — [Read-Write] Whether the alt key is part of the chord. (bool)
  - `cmd`: `bool` — [Read-Write] Whether the command key is part of the chord. (bool)
  - `ctrl`: `bool` — [Read-Write] Whether the control key is part of the chord. (bool)
  - `key`: `Key` — [Read-Write] The Key is the core of the chord. (Key)
  - `shift`: `bool` — [Read-Write] Whether the shift key is part of the chord. (bool)

### `unreal.ToolMenuProfile`
Inherits: `StructBase` | Header: `ToolMenuBase.h`

A menu profile is a way for systems to modify instances of a menu by showing/hiding specific items. You can have multiple profiles active on a single menu at the same time.

### `unreal.VirtualKeyboardOptions`
Inherits: `StructBase` | Header: `IVirtualKeyboardEntry.h`

Virtual Keyboard Options

### `unreal.ButtonWidgetStyle`
Inherits: `SlateWidgetStyleContainerBase` | Header: `ButtonWidgetStyle.h`

Button Widget Style

**Properties** (1):
  - `button_style`: `ButtonStyle` — [Read-Write] The actual data describing the buttonâs appearance. (ButtonStyle)

### `unreal.ProgressWidgetStyle`
Inherits: `SlateWidgetStyleContainerBase` | Header: `ProgressWidgetStyle.h`

Progress Widget Style

**Properties** (1):
  - `progress_bar_style`: `ProgressBarStyle` — [Read-Write] The actual data describing the buttonâs appearance. (ProgressBarStyle)

### `unreal.ToolMenuBase`
Inherits: `Object` | Header: `ToolMenuBase.h`

Tool Menu Base

### `unreal.DescendantScrollDestination`
Inherits: `EnumBase` | Header: `SScrollBox.h`

Where to scroll the descendant to

**Properties** (4):
  - `BOTTOM_OR_RIGHT`: `DescendantScrollDestination = Ellipsis` — Always scroll the widget so it appears at the bottom/Right of the scrollable area. 3
  - `CENTER`: `DescendantScrollDestination = Ellipsis` — Always scroll the widget so it appears at the center of the scrollable area, if possible.
This wonâ...
  - `INTO_VIEW`: `DescendantScrollDestination = Ellipsis` — Scroll the widget into view using the least amount of energy possible.  So if the new item
is above ...
  - `TOP_OR_LEFT`: `DescendantScrollDestination = Ellipsis` — Always scroll the widget so it appears at the top/Left of the scrollable area. 1

### `unreal.ListItemAlignment`
Inherits: `EnumBase` | Header: `STableViewBase.h`

If the list panel is arranging items as tiles, this enum dictates how the items should be aligned (basically, where any extra space is placed)

**Properties** (7):
  - `CENTER_ALIGNED`: `ListItemAlignment = Ellipsis` — Items are center aligned on the line (any extra space is halved and added to the left of the items) ...
  - `EVENLY_DISTRIBUTED`: `ListItemAlignment = Ellipsis` — Items are distributed evenly along the line (any extra space is added as padding between the items) ...
  - `EVENLY_SIZE`: `ListItemAlignment = Ellipsis` — Items are distributed evenly along the line (any extra space is used to scale up the size of the ite...
  - `EVENLY_WIDE`: `ListItemAlignment = Ellipsis` — Items are distributed evenly along the line, any extra space is used to scale up width of the items ...
  - `FILL`: `ListItemAlignment = Ellipsis` — Items are evenly stretched to distribute any extra space on the line 6
  - `LEFT_ALIGNED`: `ListItemAlignment = Ellipsis` — Items are left aligned on the line (any extra space is added to the right of the items) 3
  - `RIGHT_ALIGNED`: `ListItemAlignment = Ellipsis` — Items are right aligned on the line (any extra space is added to the left of the items) 4

### `unreal.MultiBlockType`
Inherits: `EnumBase` | Header: `MultiBoxDefs.h`

Types of MultiBlocks

**Properties** (9):
  - `BUTTON_ROW`: `MultiBlockType = Ellipsis` — 1
  - `EDITABLE_TEXT`: `MultiBlockType = Ellipsis` — 2
  - `HEADING`: `MultiBlockType = Ellipsis` — 3
  - `MENU_ENTRY`: `MultiBlockType = Ellipsis` — 4
  - `NONE`: `MultiBlockType = Ellipsis` — 0
  - `SEPARATOR`: `MultiBlockType = Ellipsis` — 5
  - `TOOL_BAR_BUTTON`: `MultiBlockType = Ellipsis` — 6
  - `TOOL_BAR_COMBO_BUTTON`: `MultiBlockType = Ellipsis` — 7
  - `WIDGET`: `MultiBlockType = Ellipsis` — 8

### `unreal.MultiBoxType`
Inherits: `EnumBase` | Header: `MultiBoxDefs.h`

Types of MultiBoxes

**Properties** (9):
  - `BUTTON_ROW`: `MultiBoxType = Ellipsis` — Buttons arranged in rows, with a maximum number of buttons per row, like a toolbar but can have mult...
  - `MENU`: `MultiBoxType = Ellipsis` — Vertical menu (pull-down menu, or context menu) 5
  - `MENU_BAR`: `MultiBoxType = Ellipsis` — Horizontal menu bar 0
  - `SLIM_HORIZONTAL_TOOL_BAR`: `MultiBoxType = Ellipsis` — Toolbar which is a slim version of the toolbar that aligns an icon and a text element horizontally 3
  - `SLIM_HORIZONTAL_UNIFORM_TOOL_BAR`: `MultiBoxType = Ellipsis` — A toolbar with horizontally-oriented buttons that tries to arrange all toolbar items uniformly 7
  - `SLIM_WRAPPING_TOOL_BAR`: `MultiBoxType = Ellipsis` — Horizontal tool bar that can (optionally) wrap to subsequent rows 8
  - `TOOL_BAR`: `MultiBoxType = Ellipsis` — Horizontal tool bar 1
  - `UNIFORM_TOOL_BAR`: `MultiBoxType = Ellipsis` — A toolbar that tries to arrange all toolbar items uniformly (supports only horizontal toolbars for n...
  - `VERTICAL_TOOL_BAR`: `MultiBoxType = Ellipsis` — Vertical tool bar 2

### `unreal.ProgressBarFillStyle`
Inherits: `EnumBase` | Header: `SProgressBar.h`

SProgressBar Fill Style

**Properties** (2):
  - `MASK`: `ProgressBarFillStyle = Ellipsis` — a mask is used to paint the fill image 0
  - `SCALE`: `ProgressBarFillStyle = Ellipsis` — the fill image is scaled to the fill percentage 1

### `unreal.ProgressBarFillType`
Inherits: `EnumBase` | Header: `SProgressBar.h`

SProgressBar Fill Type

**Properties** (7):
  - `BOTTOM_TO_TOP`: `ProgressBarFillType = Ellipsis` — will fill up from the bottom to the the top 6
  - `FILL_FROM_CENTER`: `ProgressBarFillType = Ellipsis` — will scale up from the midpoint to the outer edges both vertically and horizontally 2
  - `FILL_FROM_CENTER_HORIZONTAL`: `ProgressBarFillType = Ellipsis` — will fill up from the centerline to the outer edges horizontally 3
  - `FILL_FROM_CENTER_VERTICAL`: `ProgressBarFillType = Ellipsis` — will fill up from the centerline to the outer edges vertically 4
  - `LEFT_TO_RIGHT`: `ProgressBarFillType = Ellipsis` — will fill up from the left side to the right 0
  - `RIGHT_TO_LEFT`: `ProgressBarFillType = Ellipsis` — will fill up from the right side to the left side 1
  - `TOP_TO_BOTTOM`: `ProgressBarFillType = Ellipsis` — will fill up from the top to the the bottom 5

### `unreal.ScrollIntoViewAlignment`
Inherits: `EnumBase` | Header: `STableViewBase.h`

How the list panel scrolls an offscreen item into view

**Properties** (4):
  - `BOTTOM_OR_RIGHT`: `ScrollIntoViewAlignment = Ellipsis` — Always scroll the widget so it appears at the bottom/Right of the scrollable area. 3
  - `CENTER_ALIGNED`: `ScrollIntoViewAlignment = Ellipsis` — Item will be aligned to the center of the view 2
  - `INTO_VIEW`: `ScrollIntoViewAlignment = Ellipsis` — Item will only be scrolled enough to be brought into view 0
  - `TOP_OR_LEFT`: `ScrollIntoViewAlignment = Ellipsis` — Always scroll the widget so it appears at the top/Left of the scrollable area. 1

### `unreal.ScrollWhenFocusChanges`
Inherits: `EnumBase` | Header: `SScrollBox.h`

Set behavior when user focus changes inside this scroll box

**Properties** (3):
  - `ANIMATED_SCROLL`: `ScrollWhenFocusChanges = Ellipsis` — Use animation to scroll using NavigationDestination rule 2
  - `INSTANT_SCROLL`: `ScrollWhenFocusChanges = Ellipsis` — Instantly scroll using NavigationDestination rule 1
  - `NO_SCROLL`: `ScrollWhenFocusChanges = Ellipsis` — Donât automatically scroll, navigation or child widget will handle this 0

### `unreal.SelectionMode`
Inherits: `EnumBase` | Header: `ITypedTableView.h`

ESelection Mode

**Properties** (4):
  - `MULTI`: `SelectionMode = Ellipsis` — Multiple items can be selected at the same time. 3
  - `NONE`: `SelectionMode = Ellipsis` — Nothing can be selected and there is no hover cue for selection.  You can still handle mouse button ...
  - `SINGLE`: `SelectionMode = Ellipsis` — A single item can be selected at once, or no item may be selected. 1
  - `SINGLE_TOGGLE`: `SelectionMode = Ellipsis` — A single item can be selected at once, or no item may be selected.  You can click the item to toggle...

### `unreal.Stretch`
Inherits: `EnumBase` | Header: `SScaleBox.h`

EStretch

**Properties** (9):
  - `FILL`: `Stretch = Ellipsis` — Scales the content non-uniformly filling the entire space of the area. 1
  - `NONE`: `Stretch = Ellipsis` — Does not scale the content. 0
  - `SCALE_BY_SAFE_ZONE`: `Stretch = Ellipsis` — Scales the content according to the size of the safe zone currently applied to the viewport. 6
  - `SCALE_TO_FILL`: `Stretch = Ellipsis` — Scales the content uniformly (preserving aspect ratio), until all sides meet
or exceed the size of t...
  - `SCALE_TO_FIT`: `Stretch = Ellipsis` — Scales the content uniformly (preserving aspect ratio)
until it can no longer scale the content with...
  - `SCALE_TO_FIT_X`: `Stretch = Ellipsis` — Scales the content uniformly (preserving aspect ratio)
until it can no longer scale the content with...
  - `SCALE_TO_FIT_Y`: `Stretch = Ellipsis` — Scales the content uniformly (preserving aspect ratio)
until it can no longer scale the content with...
  - `USER_SPECIFIED`: `Stretch = Ellipsis` — Scales the content by the scale specified by the user. 7
  - `USER_SPECIFIED_WITH_CLIPPING`: `Stretch = Ellipsis` — Scales the content by the scale specified by the user and also clips. 8

### `unreal.StretchDirection`
Inherits: `EnumBase` | Header: `SScaleBox.h`

EStretch Direction

**Properties** (3):
  - `BOTH`: `StretchDirection = Ellipsis` — Will scale the content up or down. 0
  - `DOWN_ONLY`: `StretchDirection = Ellipsis` — Will only make the content smaller, will never scale it larger than the contentâs desired size. 1
  - `UP_ONLY`: `StretchDirection = Ellipsis` — Will only make the content larger, will never scale it smaller than the contentâs desired size. 2

### `unreal.TextFlowDirection`
Inherits: `EnumBase` | Header: `TextLayout.h`

The different directions that text can flow within a paragraph of text. note: If you change this enum, make sure and update CVarDefaultTextFlowDirection and GetDefaultTextFlowDirection.

**Properties** (4):
  - `AUTO`: `TextFlowDirection = Ellipsis` — Automatically detect the flow direction for each paragraph from its text 0
  - `CULTURE`: `TextFlowDirection = Ellipsis` — Uses the set culture to determine if text should flow left-to-right or right-to-left.  By comparison...
  - `LEFT_TO_RIGHT`: `TextFlowDirection = Ellipsis` — Force text to be flowed left-to-right 1
  - `RIGHT_TO_LEFT`: `TextFlowDirection = Ellipsis` — Force text to be flowed right-to-left 2

### `unreal.TextJustify`
Inherits: `EnumBase` | Header: `TextLayout.h`

EText Justify

**Properties** (5):
  - `CENTER`: `TextJustify = Ellipsis` — Justify the text in the center.
Text flow direction has no impact on this justification mode. 1
  - `INVARIANT_LEFT`: `TextJustify = Ellipsis` — Always justify the text to the left, regardless of the flow direction of the current culture. 3
  - `INVARIANT_RIGHT`: `TextJustify = Ellipsis` — Always justify the text to the right, regardless of the flow direction of the current culture. 4
  - `LEFT`: `TextJustify = Ellipsis` — Justify the text logically to the left.
When text is flowing left-to-right, this will align text vis...
  - `RIGHT`: `TextJustify = Ellipsis` — Justify the text logically to the right.
When text is flowing left-to-right, this will align text vi...

### `unreal.TextWrappingPolicy`
Inherits: `EnumBase` | Header: `TextLayout.h`

The different methods that can be used if a word is too long to be broken by the default line-break iterator.

**Properties** (2):
  - `ALLOW_PER_CHARACTER_WRAPPING`: `TextWrappingPolicy = Ellipsis` — Fallback to per-character wrapping if a word is too long 1
  - `DEFAULT_WRAPPING`: `TextWrappingPolicy = Ellipsis` — No fallback, just use the given line-break iterator 0

### `unreal.UserInterfaceActionType`
Inherits: `EnumBase` | Header: `UICommandInfo.h`

Types of user interfaces that can be associated with a user interface action

**Properties** (6):
  - `BUTTON`: `UserInterfaceActionType = Ellipsis` — Momentary buttons or menu items.  These support enable state, and execute a delegate when clicked. 1
  - `CHECK`: `UserInterfaceActionType = Ellipsis` — Similar to Button but will display a readonly checkbox next to the item. 4
  - `COLLAPSED_BUTTON`: `UserInterfaceActionType = Ellipsis` — Similar to Button but has the checkbox area collapsed 5
  - `NONE`: `UserInterfaceActionType = Ellipsis` — An action which should not be associated with a user interface action 0
  - `RADIO_BUTTON`: `UserInterfaceActionType = Ellipsis` — Radio buttons are similar to toggle buttons in that they are for menu items that store on/off state....
  - `TOGGLE_BUTTON`: `UserInterfaceActionType = Ellipsis` — Toggleable buttons or menu items that store on/off state.  These support enable state, and execute a...

### `unreal.VirtualKeyboardDismissAction`
Inherits: `EnumBase` | Header: `ISlateEditableTextWidget.h`

EVirtual Keyboard Dismiss Action

**Properties** (3):
  - `TEXT_CHANGE_ON_DISMISS`: `VirtualKeyboardDismissAction = Ellipsis` — Sends a text changed message when the virtual keyboard is dismissed by the user. 0
  - `TEXT_COMMIT_ON_ACCEPT`: `VirtualKeyboardDismissAction = Ellipsis` — Send a text commit message if the user dismisses the keyboard by accepting text. Send a text changed...
  - `TEXT_COMMIT_ON_DISMISS`: `VirtualKeyboardDismissAction = Ellipsis` — Send a text commit message when the virtual keyboard is dismissed by the user. 2

### `unreal.VirtualKeyboardTrigger`
Inherits: `EnumBase` | Header: `ISlateEditableTextWidget.h`

EVirtual Keyboard Trigger

**Properties** (2):
  - `ON_ALL_FOCUS_EVENTS`: `VirtualKeyboardTrigger = Ellipsis` — Display the virtual keyboard when the widget gains keyboard focus by any means. 1
  - `ON_FOCUS_BY_POINTER`: `VirtualKeyboardTrigger = Ellipsis` — Display the virtual keyboard when the widget gains keyboard focus by a pointer action. 0
