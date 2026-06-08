"""List enabled plugins or check if a specific plugin is available.

Params:
  __plugin_name__ — exact plugin name to check, e.g. "AgentBridge" (default: "" = list all enabled)
  __show_all__    — "true" to include disabled plugins (default: "false")

Usage:
  ue-exec.sh --script 'exec(open("...list-plugins.py").read())'
  ue-exec.sh --script '__plugin_name__="AgentBridge"; exec(open("...list-plugins.py").read())'
"""
import unreal

g = globals()
plugin_name = g.get("__plugin_name__", "").strip()
show_all = g.get("__show_all__", "false").lower() == "true"

pm = unreal.PluginBlueprintLibrary if hasattr(unreal, "PluginBlueprintLibrary") else None
ipm = unreal.IPluginManager if hasattr(unreal, "IPluginManager") else None

# Use ProjectPluginUtils or fallback to iterating known methods
plugins_info = []

# Try enumerating via EditorAssetSubsystem / PluginManager
try:
    from pathlib import PurePosixPath
    eas = unreal.get_editor_subsystem(unreal.EditorAssetSubsystem) if hasattr(unreal, "EditorAssetSubsystem") else None
except Exception:
    eas = None

# Primary approach: use unreal.PluginUtils or similar
found = False
try:
    # UE 5.x exposes IPluginManager via Python
    enabled = unreal.PluginManagerLibrary.get_enabled_plugins() if hasattr(unreal, "PluginManagerLibrary") else None
    if enabled is not None:
        if plugin_name:
            is_enabled = plugin_name in enabled
            print(f"Plugin '{plugin_name}': {'ENABLED' if is_enabled else 'NOT FOUND in enabled list'}")
            found = True
        else:
            for p in sorted(enabled):
                print(p)
            print(f"\nTotal enabled plugins: {len(enabled)}")
            found = True
except Exception:
    pass

if not found:
    # Fallback: check .uplugin files on disk via os
    import os
    import json

    engine_dir = unreal.Paths.engine_plugins_dir()
    project_dir = unreal.Paths.project_plugins_dir()
    search_dirs = [engine_dir, project_dir]

    def find_uplugins(base_path):
        """Recursively find .uplugin files using os.listdir (os.walk unreliable in UE Python)."""
        found_files = []
        try:
            entries = os.listdir(base_path)
        except OSError:
            return found_files
        for entry in entries:
            full = os.path.join(base_path, entry)
            if entry.endswith(".uplugin") and os.path.isfile(full):
                found_files.append(full)
            elif os.path.isdir(full) and not entry.startswith("."):
                found_files.extend(find_uplugins(full))
        return found_files

    results = []
    for base_dir in search_dirs:
        resolved = unreal.Paths.convert_relative_path_to_full(base_dir)
        if not os.path.isdir(resolved):
            continue
        location = "Engine" if engine_dir in base_dir else "Project"
        for uplugin_path in find_uplugins(resolved):
            name = os.path.splitext(os.path.basename(uplugin_path))[0]
            try:
                with open(uplugin_path, "r") as fh:
                    data = json.loads(fh.read())
                enabled_by_default = data.get("EnabledByDefault", False)
                friendly_name = data.get("FriendlyName", name)
                category = data.get("Category", "")
            except Exception:
                enabled_by_default = False
                friendly_name = name
                category = ""
            results.append({
                "name": name,
                "friendly_name": friendly_name,
                "category": category,
                "enabled_by_default": enabled_by_default,
                "location": location,
                "path": uplugin_path,
            })

    if plugin_name:
        matches = [r for r in results if r["name"].lower() == plugin_name.lower()]
        if matches:
            m = matches[0]
            print(f"Plugin '{m['name']}' FOUND")
            print(f"  Friendly Name: {m['friendly_name']}")
            print(f"  Category: {m['category']}")
            print(f"  Location: {m['location']}")
            print(f"  Enabled by default: {m['enabled_by_default']}")
            print(f"  Path: {m['path']}")
        else:
            # Partial match
            partial = [r for r in results if plugin_name.lower() in r["name"].lower()]
            if partial:
                print(f"No exact match for '{plugin_name}'. Partial matches:")
                for r in partial:
                    print(f"  {r['name']} ({r['location']})")
            else:
                print(f"Plugin '{plugin_name}' NOT FOUND in engine or project plugins.")
    else:
        if not show_all:
            results = [r for r in results if r["enabled_by_default"]]
        results.sort(key=lambda r: r["name"])
        for r in results:
            flag = "+" if r["enabled_by_default"] else "-"
            print(f"[{flag}] {r['name']:40s} ({r['location']}) {r['category']}")
        print(f"\nTotal: {len(results)} plugins" + (" (enabled by default)" if not show_all else " (all)"))
