#!/usr/bin/env python3
"""Check that local links and reference paths in the Markdown files resolve.

Covers [text](path) links in every tracked Markdown file, `reference/...md` paths that
skill files quote (resolved from the skill root, as agents read them), and that every
tool contract under reference/tools/ is linked from the reference/tools.md index.
"""
import os
import re
import subprocess
import sys
from pathlib import Path

FENCED_CODE = re.compile(r"^(```|~~~).*?^\1", re.MULTILINE | re.DOTALL)
INLINE_CODE = re.compile(r"`[^`\n]*`")
LINK = re.compile(r"\]\(([^)\s]+)\)")
URL = re.compile(r"^[a-z][a-z0-9+.-]*:", re.IGNORECASE)
REFERENCE_PATH = re.compile(r"`(reference/[^`\s<>*]+\.md)`")


def tracked_markdown() -> list[Path]:
    listed = subprocess.run(
        ["git", "ls-files", "-z", "*.md"], check=True, capture_output=True, text=True
    ).stdout
    return [Path(p) for p in listed.split("\0") if p]


def local_links(path: Path, text: str) -> list[Path]:
    prose = INLINE_CODE.sub("", FENCED_CODE.sub("", text))
    targets = (m.group(1).split("#", 1)[0] for m in LINK.finditer(prose))
    return [Path(os.path.normpath(path.parent / t)) for t in targets if t and not URL.match(t)]


def main() -> int:
    errors = []
    files = tracked_markdown()
    if not files:
        errors.append("no Markdown files found")

    for path in files:
        text = path.read_text(encoding="utf-8")
        for target in local_links(path, text):
            if not target.exists():
                errors.append(f"{path}: broken link to {target}")

        if path.parts[0] == "skills" and len(path.parts) > 2:
            skill = Path(*path.parts[:2])
            for quoted in REFERENCE_PATH.findall(FENCED_CODE.sub("", text)):
                if not (skill / quoted).exists() and not (path.parent / quoted).exists():
                    errors.append(f"{path}: {quoted} does not exist in {skill}")

    for index in Path("skills").glob("*/reference/tools.md"):
        linked = set(local_links(index, index.read_text(encoding="utf-8")))
        for contract in sorted(index.parent.glob("tools/*.md")):
            if contract not in linked:
                errors.append(f"{index}: does not link {contract.relative_to(index.parent).as_posix()}")

    for error in errors:
        print(f"ERROR: {error}", file=sys.stderr)
    if errors:
        return 1
    print(f"{len(files)} Markdown files: local links resolve")
    return 0


if __name__ == "__main__":
    sys.exit(main())
