"""Safely delete a Blueprint asset, clearing all reference holders first.

Uses a multi-stage approach:
  1. Stop PIE
  2. Close asset editors
  3. Destroy level instances
  4. Unload the package from memory (key step for GCObjectReferencer)
  5. Python + Engine GC
  6. delete_loaded_asset / delete_asset
  7. Fallback: disk deletion

Globals:
  __bp_path__  : str - Asset path (e.g., '/Game/Blueprints/BP_MyActor')
"""
import unreal
import gc
import os

bp_path = globals().get('__bp_path__', '')

if not bp_path:
    print('ERROR: __bp_path__ not set')
else:
    eal = unreal.EditorAssetLibrary
    errors = []

    if not eal.does_asset_exist(bp_path):
        print('SKIP: {} does not exist'.format(bp_path))
    else:
        bp_name = bp_path.split('/')[-1]
        gen_class_path = '{}.{}_C'.format(bp_path, bp_name)

        # ── Step 1: Stop PIE if running ──
        level_sub = unreal.get_editor_subsystem(unreal.LevelEditorSubsystem)
        try:
            if level_sub.is_in_play_in_editor():
                level_sub.editor_request_end_play()
                import time
                time.sleep(0.5)
                print('  Stopped PIE')
        except Exception as e:
            errors.append('PIE stop: {}'.format(e))

        # ── Step 2: Close Blueprint editor if open ──
        asset = None
        try:
            asset_editor = unreal.get_editor_subsystem(unreal.AssetEditorSubsystem)
            asset = eal.load_asset(bp_path)
            if asset:
                asset_editor.close_all_editors_for_asset(asset)
                print('  Closed editors for {}'.format(bp_name))
        except Exception as e:
            errors.append('Close editor: {}'.format(e))

        # ── Step 3: Destroy all level instances ──
        try:
            actor_sub = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
            gen_class = unreal.load_object(None, gen_class_path)
            destroyed = 0
            if gen_class:
                for actor in actor_sub.get_all_level_actors():
                    if actor.get_class() == gen_class:
                        actor.destroy_actor()
                        destroyed += 1
            if destroyed > 0:
                print('  Destroyed {} level instance(s)'.format(destroyed))
            gen_class = None
        except Exception as e:
            errors.append('Destroy instances: {}'.format(e))

        # ── Step 4: Unload the package from memory ──
        # This is the KEY step — EditorLoadingAndSavingUtils.unload_packages()
        # releases the in-memory UPackage which clears GCObjectReferencer holds.
        package = None
        try:
            if asset is None:
                asset = eal.load_asset(bp_path)
            if asset:
                package = asset.get_outermost()
                if package:
                    result = unreal.EditorLoadingAndSavingUtils.unload_packages([package])
                    print('  Unloaded package: success={}, msg={}'.format(result[0], result[1]))
        except Exception as e:
            errors.append('Unload package: {}'.format(e))

        # ── Step 5: Release Python refs + aggressive GC ──
        asset = None
        package = None
        gc.collect()
        # Synchronous full GC via console command (more aggressive than collect_garbage)
        unreal.SystemLibrary.execute_console_command(None, 'obj gc')
        unreal.SystemLibrary.collect_garbage()
        print('  GC complete (Python + obj gc + collect_garbage)')

        # ── Step 6: Try delete_asset (force-delete path, no modal) ──
        deleted = False
        try:
            deleted = eal.delete_asset(bp_path)
        except Exception as e:
            errors.append('delete_asset: {}'.format(e))

        if deleted:
            print('SUCCESS: Deleted {} via delete_asset'.format(bp_path))
        else:
            # ── Step 7: Fallback — try force_delete_asset (AgentBridge) ──
            print('  delete_asset failed, trying force_delete_asset...')
            try:
                deleted = unreal.AgentBridgeLibrary.force_delete_asset(bp_path)
                if deleted:
                    print('SUCCESS: Deleted {} via force_delete_asset'.format(bp_path))
            except Exception as e:
                errors.append('force_delete_asset: {}'.format(e))

        if not deleted:
            # ── Step 8: Last resort — delete .uasset from disk ──
            print('  API deletion failed, falling back to disk deletion...')
            try:
                project_dir = unreal.Paths.project_dir()
                relative = bp_path.replace('/Game/', '', 1)
                uasset_path = os.path.join(project_dir, 'Content', relative + '.uasset')
                uasset_path = os.path.normpath(uasset_path)

                if os.path.exists(uasset_path):
                    os.remove(uasset_path)
                    print('SUCCESS: Deleted {} from disk'.format(uasset_path))
                    print('  NOTE: Restart editor to fully clean up in-memory references.')
                else:
                    print('ERROR: .uasset not found at {}'.format(uasset_path))
            except Exception as e:
                errors.append('disk delete: {}'.format(e))
                print('ERROR: All deletion methods failed: {}'.format(e))

        if errors:
            print('--- Non-fatal errors ---')
            for err in errors:
                print('  - {}'.format(err))
