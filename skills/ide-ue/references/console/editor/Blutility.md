# UE Python API — Blutility Module

**57 types** from the `Blutility` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AssetActionSupportCondition`, `ActorActionUtility`, `AssetActionUtility`, `AsyncCaptureScene`, `AsyncEditorDelay`, `AsyncEditorOpenMapAndFocusActor`, `AsyncEditorWaitForGameWorld`, `AsyncImageExport`, `AsyncRegisterAndExecuteTask`, `EditorFunctionLibrary`, `EditorUtilityActor`, `EditorUtilityActorComponent`, `EditorUtilityBlueprint`, `EditorUtilityBlueprintAsyncActionBase`, `EditorUtilityBlueprintFactory`, `EditorUtilityButton`, `EditorUtilityCamera`, `EditorUtilityCheckBox`, `EditorUtilityCircularThrobber`, `EditorUtilityComboBoxKey`, ... (57 total)

---

## Classes

### `unreal.AssetActionSupportCondition`
Inherits: `StructBase` | Header: `AssetActionUtility.h`

Asset Action Support Condition

### `unreal.ActorActionUtility`
Inherits: `EditorUtilityObject` | Header: `ActorActionUtility.h`

Base class for all actor action-related utilities Any functions/events that are exposed on derived classes that have the correct signature will be included as menu options when right-clicking on a gro...

**Methods** (2):
  - `get_supported_class()` — Get Supported Class deprecated: If you were just returning a single class add it to the SupportedClasses array (you can ...
  - `get_supported_classes()` -> `Array [ Class ]` — Gets the statically determined supported classes, these classes are used as a first pass filter when determining if we c...

### `unreal.AssetActionUtility`
Inherits: `EditorUtilityObject` | Header: `AssetActionUtility.h`

Base class for all asset action-related utilities Any functions/events that are exposed on derived classes that have the correct signature will be included as menu options when right-clicking on a gro...

**Methods** (3):
  - `get_supported_class()` — Get Supported Class deprecated: If you were just returning a single class add it to the SupportedClasses array (you can ...
  - `get_supported_classes()` -> `Array [ Class ]` — Gets the statically determined supported classes, these classes are used as a first pass filter when determining if we c...
  - `is_action_for_blueprints()` -> `bool` — Returns whether or not this action is designed to work specifically on Blueprints (true) or on all assets (false). If tr...

### `unreal.AsyncCaptureScene`
Inherits: `BlueprintAsyncActionBase` | Header: `AsyncCaptureScene.h`

Async Capture Scene

**Properties** (1):
  - `complete`: `OnAsyncCaptureSceneComplete` — [Read-Write] (OnAsyncCaptureSceneComplete)

### `unreal.AsyncEditorDelay`
Inherits: `EditorUtilityBlueprintAsyncActionBase` | Header: `EditorUtilityLibrary.h`

Async Editor Delay

**Properties** (1):
  - `complete`: `AsyncDelayComplete` — [Read-Write] (AsyncDelayComplete)

### `unreal.AsyncEditorOpenMapAndFocusActor`
Inherits: `EditorUtilityBlueprintAsyncActionBase` | Header: `EditorUtilityLibrary.h`

Async Editor Open Map and Focus Actor

**Properties** (1):
  - `complete`: `AsyncDelayComplete` — [Read-Write] (AsyncDelayComplete)

### `unreal.AsyncEditorWaitForGameWorld`
Inherits: `EditorUtilityBlueprintAsyncActionBase` | Header: `EditorUtilityLibrary.h`

Async Editor Wait for Game World

**Properties** (1):
  - `complete`: `AsyncEditorWaitForGameWorldEvent` — [Read-Write] (AsyncEditorWaitForGameWorldEvent)

### `unreal.AsyncImageExport`
Inherits: `BlueprintAsyncActionBase` | Header: `AsyncImageExport.h`

Async Image Export

**Properties** (1):
  - `complete`: `OnExportImageAsyncComplete` — [Read-Write] (OnExportImageAsyncComplete)

### `unreal.AsyncRegisterAndExecuteTask`
Inherits: `BlueprintAsyncActionBase` | Header: `AsyncRegisterAndExecuteTask.h`

Async Register and Execute Task

**Properties** (1):
  - `on_finished`: `OnEditorUtilityTaskDynamicDelegate` — [Read-Write] (OnEditorUtilityTaskDynamicDelegate)

### `unreal.EditorFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `EditorFunctionLibrary.h`

Library of static functions that can use the editor APIs

### `unreal.EditorUtilityActor`
Inherits: `Actor` | Header: `EditorUtilityActor.h`

Editor Utility Actor

**Methods** (2):
  - `get_input_component()` -> `InputComponent` — Returns the current InputComponent on this utility actor. This will be NULL unless bReceivesEditorInput is set to true.
  - `run()` -> `None` — Standard function to execute

**Properties** (1):
  - `receives_editor_input`: `bool` — [Read-Write] If set to true, then this actor will be able to recieve input delegate callbacks when i...

### `unreal.EditorUtilityActorComponent`
Inherits: `ActorComponent` | Header: `EditorUtilityActorComponent.h`

Editor Utility Actor Component

### `unreal.EditorUtilityBlueprint`
Inherits: `Blueprint` | Header: `EditorUtilityBlueprint.h`

Editor Utility Blueprint

### `unreal.EditorUtilityBlueprintAsyncActionBase`
Inherits: `BlueprintAsyncActionBase` | Header: `EditorUtilityLibrary.h`

Editor Utility Blueprint Async Action Base

### `unreal.EditorUtilityBlueprintFactory`
Inherits: `Factory` | Header: `EditorUtilityBlueprintFactory.h`

Editor Utility Blueprint Factory

### `unreal.EditorUtilityButton`
Inherits: `Button` | Header: `EditorUtilityWidgetComponents.h`

Editor Utility Button

### `unreal.EditorUtilityCamera`
Inherits: `CameraActor` | Header: `EditorUtilityCamera.h`

Editor Utility Camera

### `unreal.EditorUtilityCheckBox`
Inherits: `CheckBox` | Header: `EditorUtilityWidgetComponents.h`

Editor Utility Check Box

### `unreal.EditorUtilityCircularThrobber`
Inherits: `CircularThrobber` | Header: `EditorUtilityWidgetComponents.h`

Editor Utility Circular Throbber

### `unreal.EditorUtilityComboBoxKey`
Inherits: `ComboBoxKey` | Header: `EditorUtilityWidgetComponents.h`

Editor Utility Combo Box Key

### `unreal.EditorUtilityComboBoxString`
Inherits: `ComboBoxString` | Header: `EditorUtilityWidgetComponents.h`

Editor Utility Combo Box String

### `unreal.EditorUtilityEditableText`
Inherits: `EditableText` | Header: `EditorUtilityWidgetComponents.h`

Editor Utility Editable Text

### `unreal.EditorUtilityEditableTextBox`
Inherits: `EditableTextBox` | Header: `EditorUtilityWidgetComponents.h`

Editor Utility Editable Text Box

### `unreal.EditorUtilityExpandableArea`
Inherits: `ExpandableArea` | Header: `EditorUtilityWidgetComponents.h`

Editor Utility Expandable Area

### `unreal.EditorUtilityExtension`
Inherits: `Interface` | Header: `IEditorUtilityExtension.h`

Editor Utility Extension

### `unreal.EditorUtilityInputKeySelector`
Inherits: `InputKeySelector` | Header: `EditorUtilityWidgetComponents.h`

Editor Utility Input Key Selector

### `unreal.EditorUtilityLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `EditorUtilityLibrary.h`

Expose editor utility functions to Blutilities

**Methods** (17):
  - `add_source_widget(widget_blueprint, widget_class, widget_name, widget_parent_name)` -> `Widget` [classmethod] — Create a new widget and add to the specific widget blueprintâs widget tree
  - `cast_to_widget_blueprint(as_widget_blueprint=WidgetBlueprint)` [classmethod] — Cast to Widget Blueprint
  - `convert_to_editor_utility_widget(widget_bp)` -> `None` [classmethod] — Convert to Editor Utility Widget
  - `find_source_widget_by_name(widget_blueprint, widget_name)` -> `Widget` [classmethod] — Searches the blueprintâs widget hierarchy for a widget with the specified name
  - `get_actor_reference(path_to_actor)` -> `Actor` — Attempts to find the actor specified by PathToActor in the current editor world
  - `get_current_content_browser_item_path()` -> `ContentBrowserItemPath` [classmethod] — Gets the current content browser path if one is open, whether it is internal or virtual.
  - `get_current_content_browser_path()` -> `str or None` [classmethod] — Attempts to get the path for the active content browser, returns false if there is no active content browser or if it wa...
  - `get_selected_asset_data()` -> `Array [ AssetData ]` [classmethod] — Gets the set of currently selected asset data
  - `get_selected_assets()` -> `Array [ Object ]` [classmethod] — Gets the set of currently selected assets
  - `get_selected_assets_of_class(asset_class)` -> `Array [ Object ]` [classmethod] — Get Selected Assets Of Class
  - `get_selected_blueprint_classes()` -> `Array [ type ( Class ) ]` [classmethod] — Gets the set of currently selected classes
  - `get_selected_folder_paths()` -> `Array [ str ]` [classmethod] — Gets the path to the currently selected folder in the content browser
  - `get_selected_path_view_folder_paths()` -> `Array [ str ]` [classmethod] — Returns the folders that are selected in the path view for the content browser
  - `get_selection_bounds(box_extent=Vector, sphere_radius=float)` [classmethod] — Get Selection Bounds
  - `get_selection_set()` -> `Array [ Actor ]` [classmethod] — Get Selection Set
  - `rename_asset(asset, new_name)` -> `None` [classmethod] — Renames an asset (cannot move folders)
  - `sync_browser_to_folders(folder_list)` -> `None` [classmethod] — Sync the Content Browser to the given folder(s)

### `unreal.EditorUtilityListView`
Inherits: `ListView` | Header: `EditorUtilityWidgetComponents.h`

Editor Utility List View

### `unreal.EditorUtilityMultiLineEditableText`
Inherits: `MultiLineEditableText` | Header: `EditorUtilityWidgetComponents.h`

Editor Utility Multi Line Editable Text

### `unreal.EditorUtilityMultiLineEditableTextBox`
Inherits: `MultiLineEditableTextBox` | Header: `EditorUtilityWidgetComponents.h`

Editor Utility Multi Line Editable Text Box

### `unreal.EditorUtilityObject`
Inherits: `Object` | Header: `EditorUtilityObject.h`

Editor Utility Object

**Methods** (1):
  - `run()` -> `None` — Standard function to execute

### `unreal.EditorUtilityProgressBar`
Inherits: `ProgressBar` | Header: `EditorUtilityWidgetComponents.h`

Editor Utility Progress Bar

### `unreal.EditorUtilityScrollBar`
Inherits: `ScrollBar` | Header: `EditorUtilityWidgetComponents.h`

Editor Utility Scroll Bar

### `unreal.EditorUtilityScrollBox`
Inherits: `ScrollBox` | Header: `EditorUtilityWidgetComponents.h`

Editor Utility Scroll Box

### `unreal.EditorUtilitySlider`
Inherits: `Slider` | Header: `EditorUtilityWidgetComponents.h`

Editor Utility Slider

### `unreal.EditorUtilitySpinBox`
Inherits: `SpinBox` | Header: `EditorUtilityWidgetComponents.h`

Editor Utility Spin Box

### `unreal.EditorUtilitySubsystem`
Inherits: `EditorSubsystem` | Header: `EditorUtilitySubsystem.h`

Editor Utility Subsystem

**Methods** (18):
  - `can_run(asset)` -> `bool` — Can Run
  - `close_tab_by_id(new_tab_id)` -> `bool` — Given an ID for a tab, try to find and close an existing tab. Returns true if it found a tab to close.
  - `does_tab_exist(new_tab_id)` -> `bool` — Given an ID for a tab, try to find an existing tab. Returns true if it found a tab.
  - `find_utility_widget_from_blueprint(blueprint)` -> `EditorUtilityWidget` — Given an editor utility widget blueprint, get the widget it creates. This will return a null pointer if the widget is no...
  - `register_and_execute_task(new_task, optional_parent_task = None)` -> `None` — Register and Execute Task
  - `register_tab_and_get_id(blueprint)` -> `Name` — Register Tab and Get ID
  - `register_tab_and_get_id_generated_class(generated_widget_blueprint)` -> `Name` — Register Tab and Get IDGenerated Class
  - `release_instance_of_asset(asset)` -> `None` — Allow startup object to be garbage collected
  - `spawn_and_register_tab(blueprint)` -> `EditorUtilityWidget` — Spawn and Register Tab
  - `spawn_and_register_tab_and_get_id(new_tab_id=Name)` — Spawn and Register Tab and Get ID
  - `spawn_and_register_tab_and_get_id_generated_class(new_tab_id=Name)` — Spawn and Register Tab and Get IDGenerated Class
  - `spawn_and_register_tab_generated_class(generated_widget_blueprint)` -> `EditorUtilityWidget` — Spawn and Register Tab Generated Class
  - `spawn_and_register_tab_with_id(blueprint, tab_id)` -> `EditorUtilityWidget` — Unlike SpawnAndRegisterTabAndGetID allows spawn tab while providing TabID from Python scripts or BP
  - `spawn_and_register_tab_with_id_generated_class(generated_widget_blueprint, tab_id)` -> `EditorUtilityWidget` — Unlike SpawnAndRegisterTabAndGetID allows spawn tab while providing TabID from Python scripts or BP
  - `spawn_registered_tab_by_id(new_tab_id)` -> `bool` — Given an ID for a tab, try to find a tab spawner that matches, and then spawn a tab. Returns true if it was able to find...
  - `try_run(asset)` -> `bool` — Try Run
  - `try_run_class(object_class)` -> `bool` — Try Run Class
  - `unregister_tab_by_id(tab_id)` -> `bool` — Given an ID for a tab, try to close and unregister a tab that was registered through this subsystem

**Properties** (2):
  - `on_begin_pie`: `OnEditorUtilityPIEEvent` — [Read-Write] Expose Begin PIE to blueprints. (OnEditorUtilityPIEEvent)
  - `on_end_pie`: `OnEditorUtilityPIEEvent` — [Read-Write] Expose End PIE to blueprints. (OnEditorUtilityPIEEvent)

### `unreal.EditorUtilityTask`
Inherits: `Object` | Header: `EditorUtilityTask.h`

Editor Utility Task

**Methods** (6):
  - `finish_executing_task(success = True)` -> `None` — Finish Executing Task
  - `get_task_title_override()` -> `Text` — Get Task Title Override
  - `receive_begin_execution()` -> `None` — Receive Begin Execution
  - `receive_cancel_requested()` -> `None` — Receive Cancel Requested
  - `set_task_notification_text(text)` -> `None` — Set Task Notification Text
  - `was_cancel_requested()` -> `bool` — Was Cancel Requested

### `unreal.EditorUtilityThrobber`
Inherits: `Throbber` | Header: `EditorUtilityWidgetComponents.h`

Editor Utility Throbber

### `unreal.EditorUtilityToolMenuEntry`
Inherits: `ToolMenuEntryScript` | Header: `EditorUtilityToolMenu.h`

Editor Utility Tool Menu Entry

### `unreal.EditorUtilityToolMenuSection`
Inherits: `ToolMenuSectionDynamic` | Header: `EditorUtilityToolMenu.h`

Editor Utility Tool Menu Section

### `unreal.EditorUtilityTreeView`
Inherits: `TreeView` | Header: `EditorUtilityWidgetComponents.h`

Editor Utility Tree View

### `unreal.EditorUtilityWidget`
Inherits: `UserWidget` | Header: `EditorUtilityWidget.h`

Editor Utility Widget

**Methods** (3):
  - `find_child_widget_by_name(widget_name)` -> `Widget` — Find Child Widget by Name
  - `on_default_action_clicked()` -> `None` — deprecated: âon_default_action_clickedâ was renamed to ârunâ.
  - `run()` -> `None` — The default action called when the widget is invoked if bAutoRunDefaultAction=true (it is never called otherwise)

**Properties** (3):
  - `auto_run_default_action`: `bool` [Read-Only] — [Read-Only] Should this blueprint automatically run OnDefaultActionClicked, or should it open up a d...
  - `help_text`: `str` — [Read-Write] (str)
  - `tab_display_name`: `Text` — [Read-Write] The display name for tabs spawned with this widget (Text)

### `unreal.EditorUtilityWidgetBlueprint`
Inherits: `WidgetBlueprint` | Header: `EditorUtilityWidgetBlueprint.h`

Editor Utility Widget Blueprint

### `unreal.EditorUtilityWidgetBlueprintFactory`
Inherits: `Factory` | Header: `EditorUtilityWidgetBlueprintFactory.h`

Editor Utility Widget Blueprint Factory

### `unreal.GlobalEditorUtilityBase`
Inherits: `Object` | Header: `GlobalEditorUtilityBase.h`

Global Editor Utility Base

**Methods** (12):
  - `clear_actor_selection_set()` -> `None` — Remove all actors from the selection set
  - `for_each_selected_actor()` -> `None` — Calls OnEachSelectedActor for each selected actor
  - `for_each_selected_asset()` -> `None` — Calls OnEachSelectedAsset for each selected asset
  - `get_actor_reference(path_to_actor)` -> `Actor` — Attempts to find the actor specified by PathToActor in the current editor world
  - `get_editor_user_settings()` -> `EditorPerProjectUserSettings` — Get Editor User Settings
  - `get_selected_assets()` -> `Array [ Object ]` — Gets the set of currently selected assets
  - `get_selection_bounds(box_extent=Vector, sphere_radius=float)` — Get Selection Bounds
  - `get_selection_set()` -> `Array [ Actor ]` — Get Selection Set
  - `on_default_action_clicked()` -> `None` — The default action called when the blutility is invoked if bAutoRunDefaultAction=true (it is never called otherwise)
  - `rename_asset(asset, new_name)` -> `None` — Renames an asset (cannot move folders)
  - `select_nothing()` -> `None` — Selects nothing in the editor (another way to clear the selection)
  - `set_actor_selection_state(actor, should_be_selected)` -> `None` — Set the selection state for the selected actor

**Properties** (4):
  - `auto_run_default_action`: `bool` [Read-Only] — [Read-Only] Should this blueprint automatically run OnDefaultActionClicked, or should it open up a d...
  - `help_text`: `str` — [Read-Write] (str)
  - `on_each_selected_actor`: `ForEachActorIteratorSignature` — [Read-Write] The method called for each selected actor when ForEachSelectedActor is called (ForEachA...
  - `on_each_selected_asset`: `ForEachAssetIteratorSignature` — [Read-Write] The method called for each selected asset when ForEachSelectedAsset is called (ForEachA...

### `unreal.PlacedEditorUtilityBase`
Inherits: `Actor` | Header: `PlacedEditorUtilityBase.h`

Placed Editor Utility Base

**Methods** (7):
  - `clear_actor_selection_set()` -> `None` — Remove all actors from the selection set
  - `get_actor_reference(path_to_actor)` -> `Actor` — Attempts to find the actor specified by PathToActor in the current editor world
  - `get_level_viewport_camera_info()` -> `(camera_location=Vector, camera_rotation=Rotator) or None` — Gets information about the camera position for the primary level editor viewport. In non-editor builds, these will be ze...
  - `get_selection_set()` -> `Array [ Actor ]` — Returns the current selection set in the editor. Note that for non-editor builds, this will return an empty array
  - `select_nothing()` -> `None` — Selects nothing in the editor (another way to clear the selection)
  - `set_actor_selection_state(actor, should_be_selected)` -> `None` — Set the selection state for the selected actor
  - `set_level_viewport_camera_info(camera_location, camera_rotation)` -> `None` — Sets information about the camera position for the primary level editor viewport.

**Properties** (1):
  - `help_text`: `str` — [Read-Write] (str)

### `unreal.ToolMenuWidget`
Inherits: `Widget` | Header: `ToolMenuWidget.h`

A base ToolMenu widget that can support Menus and Toolbars.

**Properties** (3):
  - `full_menu_name`: `Name` [Read-Only] — [Read-Only] The final usable name that can be retrieved by Python/Blueprint.
Use this value when try...
  - `menu_name`: `str` [Read-Only] — [Read-Only] Name of toolbar for registering with ToolMenus.
This has the editor utility widget pre-p...
  - `menu_type`: `MultiBoxType` [Read-Only] — [Read-Only] (MultiBoxType)

### `unreal.CastToWidgetBlueprintCases`
Inherits: `EnumBase` | Header: `EditorUtilityLibrary.h`

ECast to Widget Blueprint Cases

**Properties** (2):
  - `CAST_FAILED`: `CastToWidgetBlueprintCases = Ellipsis` — 1
  - `CAST_SUCCEEDED`: `CastToWidgetBlueprintCases = Ellipsis` — 0

### `unreal.AsyncDelayComplete`
Inherits: `MulticastDelegateBase` | Header: `EditorUtilityLibrary.h`

Async Delay Complete Delegate Signature

### `unreal.AsyncEditorWaitForGameWorldEvent`
Inherits: `MulticastDelegateBase` | Header: `EditorUtilityLibrary.h`

Async Editor Wait for Game World Event Delegate Signature

### `unreal.ForEachActorIteratorSignature`
Inherits: `MulticastDelegateBase` | Header: `GlobalEditorUtilityBase.h`

For Each Actor Iterator Signature Delegate Signature

### `unreal.ForEachAssetIteratorSignature`
Inherits: `MulticastDelegateBase` | Header: `GlobalEditorUtilityBase.h`

For Each Asset Iterator Signature Delegate Signature

### `unreal.OnAsyncCaptureSceneComplete`
Inherits: `MulticastDelegateBase` | Header: `AsyncCaptureScene.h`

On Async Capture Scene Complete Delegate Signature

### `unreal.OnEditorUtilityPIEEvent`
Inherits: `MulticastDelegateBase` | Header: `EditorUtilitySubsystem.h`

Delegate for a PIE event exposed via Editor Utility (begin, end, pause/resume, etc)

### `unreal.OnEditorUtilityTaskDynamicDelegate`
Inherits: `MulticastDelegateBase` | Header: `EditorUtilityTask.h`

On Editor Utility Task Dynamic Delegate Delegate Signature

### `unreal.OnExportImageAsyncComplete`
Inherits: `MulticastDelegateBase` | Header: `AsyncImageExport.h`

On Export Image Async Complete Delegate Signature
