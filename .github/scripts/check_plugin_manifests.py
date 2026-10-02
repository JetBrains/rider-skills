#!/usr/bin/env python3
"""Check that each marketplace plugin has the same name and version in every manifest.

Claude Code reads the version from .claude-plugin/marketplace.json and the plugin's
.claude-plugin/plugin.json, Codex from its .codex-plugin/plugin.json; a bump that misses
one of them leaves that client on the old version.
"""
import json
import sys
from pathlib import Path

MARKETPLACE = Path(".claude-plugin/marketplace.json")
PLUGIN_MANIFESTS = (".claude-plugin/plugin.json", ".codex-plugin/plugin.json")


def main() -> int:
    errors = []
    plugins = json.loads(MARKETPLACE.read_text(encoding="utf-8")).get("plugins", [])
    if not plugins:
        errors.append(f"{MARKETPLACE}: no plugins listed")

    for entry in plugins:
        source = Path(entry.get("source", ""))
        if not (source / PLUGIN_MANIFESTS[0]).is_file():
            errors.append(f"{MARKETPLACE}: plugin {entry.get('name')!r} has no {source / PLUGIN_MANIFESTS[0]}")
        for manifest_path in (source / m for m in PLUGIN_MANIFESTS):
            if not manifest_path.is_file():
                continue
            manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
            for field in ("name", "version"):
                if manifest.get(field) != entry.get(field):
                    errors.append(
                        f"{manifest_path}: {field} {manifest.get(field)!r}, "
                        f"but {MARKETPLACE} lists {entry.get(field)!r}"
                    )

    for error in errors:
        print(f"ERROR: {error}", file=sys.stderr)
    if errors:
        return 1
    print(f"{len(plugins)} plugins: manifests agree on name and version")
    return 0


if __name__ == "__main__":
    sys.exit(main())
