"""Search assets using the Asset Registry (fast, no loading required).

Params:
  __query__       — search term: matches asset name, path, or class (case-insensitive)
  __class__       — exact class filter via ARFilter, e.g. "StaticMesh", "Material",
                    "Blueprint", "NiagaraSystem", "Texture2D", "SoundWave" (default: all)
  __path__        — restrict to content path(s), comma-separated (default: "/Game/")
  __recursive__   — search subdirectories (default: "true")
  __max_results__ — max results to print (default: 50)
  __show_class__  — show asset class in output (default: "true")
  __show_loaded__ — show whether asset is in memory (default: "false")
  __show_refs__   — show hard dependency count (default: "false")
  __blueprints__  — if "true", search Blueprint parent classes instead of asset classes

Usage:
  # Find all materials matching "wood"
  ue-exec.sh --script '__query__="wood"; __class__="Material"; exec(open("...search-assets.py").read())'

  # Find all static meshes in /Game/Environment/
  ue-exec.sh --script '__class__="StaticMesh"; __path__="/Game/Environment/"; exec(open("...search-assets.py").read())'

  # Find any asset with "hero" in the name
  ue-exec.sh --script '__query__="hero"; exec(open("...search-assets.py").read())'

  # Find Blueprints whose parent class is "Character"
  ue-exec.sh --script '__class__="Character"; __blueprints__="true"; exec(open("...search-assets.py").read())'
"""
import unreal

g = globals()
query = g.get('__query__', '').lower()
class_filter = g.get('__class__', '')
paths = g.get('__path__', '/Game/').split(',')
recursive = g.get('__recursive__', 'true').lower() != 'false'
max_results = int(g.get('__max_results__', 50))
show_class = g.get('__show_class__', 'true').lower() != 'false'
show_loaded = g.get('__show_loaded__', 'false').lower() == 'true'
show_refs = g.get('__show_refs__', 'false').lower() == 'true'
blueprints = g.get('__blueprints__', 'false').lower() == 'true'

registry = unreal.AssetRegistryHelpers.get_asset_registry()

# Build ARFilter
ar_filter = unreal.ARFilter()
ar_filter.package_paths = [p.strip() for p in paths if p.strip()]
ar_filter.recursive_paths = recursive

if class_filter and not blueprints:
    ar_filter.class_paths = [unreal.TopLevelAssetPath('/Script/Engine', class_filter)]
    ar_filter.recursive_classes = True

# Query assets
if blueprints and class_filter:
    assets = unreal.AssetRegistryHelpers.get_blueprint_assets(ar_filter)
else:
    assets = registry.get_assets(ar_filter)

if assets is None:
    assets = []

# Apply text query filter
if query:
    filtered = []
    for ad in assets:
        name = str(ad.asset_name).lower()
        pkg = str(ad.package_name).lower()
        cls = str(ad.asset_class_path).lower() if show_class else ''
        if query in name or query in pkg or query in cls:
            filtered.append(ad)
    assets = filtered

total = len(assets)

# Optional: get dependency counts
dep_counts = {}
if show_refs and assets:
    dep_opts = unreal.AssetRegistryDependencyOptions()
    dep_opts.include_hard_package_references = True
    dep_opts.include_soft_package_references = False
    for ad in assets[:max_results]:
        deps = registry.get_dependencies(ad.package_name, dep_opts)
        dep_counts[str(ad.package_name)] = len(deps) if deps else 0

# Print results
print('Found {} assets'.format(total))
for ad in assets[:max_results]:
    parts = [str(ad.package_name)]
    if show_class:
        # Extract short class name from TopLevelAssetPath
        cls_path = str(ad.asset_class_path)
        short_cls = cls_path.split('.')[-1] if '.' in cls_path else cls_path
        parts.append('[{}]'.format(short_cls))
    if show_loaded:
        parts.append('(loaded)' if ad.is_asset_loaded() else '(on-disk)')
    if show_refs:
        count = dep_counts.get(str(ad.package_name), 0)
        parts.append('deps:{}'.format(count))
    print('  {}'.format(' '.join(parts)))

if total > max_results:
    print('  ... {} more (increase __max_results__ to see all)'.format(total - max_results))
