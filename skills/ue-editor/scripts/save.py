"""Save the current level, specific assets, or all dirty packages.

Params:
  __save_mode__ — "level" (default), "asset", "all", or "directory"
  __asset_path__ — asset or directory path (for "asset" and "directory" modes)

Usage:
  # Save current level
  ue-exec.sh --file ${CLAUDE_SKILL_DIR}/scripts/save.py

  # Save current level (explicit)
  ue-exec.sh --script '__save_mode__="level"; exec(open("...save.py").read())'

  # Save a specific asset
  ue-exec.sh --script '__save_mode__="asset"; __asset_path__="/Game/Blueprints/BP_MyActor"; exec(open("...save.py").read())'

  # Save all assets in a directory
  ue-exec.sh --script '__save_mode__="directory"; __asset_path__="/Game/Blueprints/"; exec(open("...save.py").read())'

  # Save all dirty (modified) packages
  ue-exec.sh --script '__save_mode__="all"; exec(open("...save.py").read())'
"""
import unreal

g = globals()
save_mode = g.get("__save_mode__", "level")
asset_path = g.get("__asset_path__", "")

eal = unreal.EditorLoadingAndSavingUtils

if save_mode == "level":
    dirty_maps = eal.get_dirty_map_packages()
    if not dirty_maps:
        print("Current level is already saved (no dirty map packages)")
    else:
        for pkg in dirty_maps:
            print("Dirty map: {}".format(pkg.get_name()))
        success = eal.save_packages(dirty_maps, True)
        if success:
            print("Saved {} map package(s)".format(len(dirty_maps)))
        else:
            print("ERROR: Failed to save map packages")

elif save_mode == "asset":
    if not asset_path:
        print("ERROR: __asset_path__ is required for asset mode")
    else:
        # Try dirty-only first; if not dirty, verify asset exists
        success = unreal.EditorAssetLibrary.save_asset(asset_path, only_if_is_dirty=True)
        if success:
            print("Saved asset: {}".format(asset_path))
        else:
            # save_asset returns false for non-dirty assets — verify it exists
            asset = unreal.load_asset(asset_path)
            if asset:
                print("Asset is already saved (not dirty): {}".format(asset_path))
            else:
                print("ERROR: Asset not found: {}".format(asset_path))

elif save_mode == "directory":
    if not asset_path:
        print("ERROR: __asset_path__ is required for directory mode")
    else:
        success = unreal.EditorAssetLibrary.save_directory(asset_path)
        if success:
            print("Saved all assets in: {}".format(asset_path))
        else:
            print("ERROR: Failed to save directory: {}".format(asset_path))

elif save_mode == "all":
    dirty_maps = eal.get_dirty_map_packages()
    dirty_content = eal.get_dirty_content_packages()
    total = len(dirty_maps) + len(dirty_content)
    if total == 0:
        print("No dirty packages to save")
    else:
        print("Found {} dirty package(s):".format(total))
        for pkg in dirty_maps:
            print("  [map] {}".format(pkg.get_name()))
        for pkg in dirty_content:
            print("  [content] {}".format(pkg.get_name()))
        success = eal.save_dirty_packages(save_map_packages=True, save_content_packages=True)
        if success:
            print("Saved all {} dirty package(s)".format(total))
        else:
            print("ERROR: Save may have been cancelled or failed")

else:
    print("ERROR: Unknown save_mode '{}'. Use: level, asset, directory, or all".format(save_mode))
