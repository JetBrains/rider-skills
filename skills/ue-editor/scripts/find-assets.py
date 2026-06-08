"""Search for assets by type and/or keyword.

Params:
  __asset_type__ — class name filter, e.g. "NiagaraSystem", "Material" (default: all)
  __keyword__    — substring filter on asset path (default: "")
  __search_dirs__ — comma-separated dirs to search (default: "/Game/")
  __max_results__ — max results to print (default: 50)

Usage:
  ue-exec.sh --script '__asset_type__="NiagaraSystem"; exec(open("...find-assets.py").read())'
  ue-exec.sh --script '__keyword__="spark"; exec(open("...find-assets.py").read())'
"""
import unreal

g = globals()
asset_type = g.get("__asset_type__", "")
keyword = g.get("__keyword__", "").lower()
search_dirs = g.get("__search_dirs__", "/Game/").split(",")
max_results = int(g.get("__max_results__", 50))

eal = unreal.EditorAssetLibrary
found = []

for folder in search_dirs:
    folder = folder.strip()
    if not eal.does_directory_exist(folder):
        continue
    assets = eal.list_assets(folder, recursive=True)
    for a in assets:
        path = str(a)
        if keyword and keyword not in path.lower():
            continue
        if asset_type:
            obj = eal.load_asset(path)
            if obj and asset_type in type(obj).__name__:
                found.append((path, type(obj).__name__))
        else:
            found.append((path, ""))

print("Found {} assets".format(len(found)))
for path, cls in found[:max_results]:
    if cls:
        print("  {} [{}]".format(path, cls))
    else:
        print("  {}".format(path))

if len(found) > max_results:
    print("  ... {} more".format(len(found) - max_results))
