# Blueprint Development (via ue-scripter)

Execute all Blueprint operations via ue-scripter:
```bash
bash ${CLAUDE_SKILL_DIR}/../ue-scripter/scripts/ue-exec.sh --script '...'
```

## Create a Blueprint asset
```python
import unreal

factory = unreal.BlueprintFactory()
factory.set_editor_property("parent_class", unreal.Actor)

asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
bp = asset_tools.create_asset("BP_MyActor", "/Game/Blueprints", None, factory)
print(f"Created: {bp.get_path_name()}")
```

## Create a Blueprint from a C++ class
```python
import unreal

factory = unreal.BlueprintFactory()
parent = unreal.load_class(None, "/Script/MyModule.MyActor")
factory.set_editor_property("parent_class", parent)

asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
bp = asset_tools.create_asset("BP_MyActor", "/Game/Blueprints", None, factory)
print(f"Created: {bp.get_path_name()}")
```

## Set default property values on a Blueprint
```python
import unreal

bp = unreal.load_asset("/Game/Blueprints/BP_MyActor")
cdo = unreal.get_default_object(bp.generated_class())
cdo.set_editor_property("MaxHealth", 200.0)
unreal.EditorAssetLibrary.save_loaded_asset(bp)
print("Defaults updated")
```

## Add a component to a Blueprint
```python
import unreal

bp = unreal.load_asset("/Game/Blueprints/BP_MyActor")
subsys = unreal.get_editor_subsystem(unreal.SubobjectDataSubsystem)
# Use the subobject subsystem to add components programmatically
# (complex operation — prefer setting up components in C++ base class)
```

## Create a DataAsset
```python
import unreal

factory = unreal.DataAssetFactory()
asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
da = asset_tools.create_asset("DA_Config", "/Game/Data", unreal.PrimaryDataAsset, factory)
print(f"Created: {da.get_path_name()}")
```

## Create a Widget Blueprint
```python
import unreal

factory = unreal.WidgetBlueprintFactory()
asset_tools = unreal.AssetToolsHelpers.get_asset_tools()
widget = asset_tools.create_asset("WBP_HUD", "/Game/UI", None, factory)
print(f"Created: {widget.get_path_name()}")
```
