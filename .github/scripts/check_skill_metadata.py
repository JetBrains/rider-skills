#!/usr/bin/env python3
"""Check that every skill's metadata.json records the skill's current content.

The hash is BundledSkillDirectoryHash, the value RiderMirrorSkillsTest checks when the
skills are imported into the Rider monorepo: SHA-256 over the skill's files sorted by
ordinal relative path, the root metadata.json excluded; each entry is the UTF-8 path,
a zero byte, and the SHA-256 of the file bytes.

With --base-ref, a skill whose content changed since that commit must also raise its
version, so installed clients pick up the change.
"""
import argparse
import hashlib
import json
import re
import subprocess
import sys
from pathlib import Path

SKILLS = Path("skills")
VERSION = re.compile(r"^(\d+)\.(\d+)\.(\d+)$")


def git(*args: str) -> str:
    return subprocess.run(["git", *args], check=True, capture_output=True, text=True).stdout


def skill_files(skill: Path) -> list[str]:
    # The files a commit would contain: ignored files such as .DS_Store stay out of the hash.
    listed = git("ls-files", "-z", "--cached", "--others", "--exclude-standard", "--", skill.as_posix())
    paths = (Path(p) for p in listed.split("\0") if p)
    relative = (p.relative_to(skill).as_posix() for p in paths if p.is_file())
    return [p for p in relative if p != "metadata.json"]


def directory_hash(skill: Path) -> str:
    digest = hashlib.sha256()
    # Ordinal order compares UTF-16 code units, as .NET does.
    for path in sorted(skill_files(skill), key=lambda p: p.encode("utf-16-be")):
        digest.update(path.encode("utf-8") + b"\0")
        digest.update(hashlib.sha256((skill / path).read_bytes()).digest())
    return "sha256:" + digest.hexdigest()


def parse_version(value: object) -> tuple[int, ...] | None:
    match = VERSION.match(value) if isinstance(value, str) else None
    return tuple(int(part) for part in match.groups()) if match else None


def base_metadata(base_ref: str, metadata_path: Path) -> dict | None:
    try:
        return json.loads(git("show", f"{base_ref}:{metadata_path.as_posix()}"))
    except subprocess.CalledProcessError:
        return None  # The skill is new.


def check_skill(skill: Path, base_ref: str | None) -> list[str]:
    metadata_path = skill / "metadata.json"
    try:
        metadata = json.loads(metadata_path.read_text(encoding="utf-8"))
    except (OSError, ValueError) as e:
        return [f"{metadata_path}: cannot read: {e}"]

    errors = []
    version = parse_version(metadata.get("version"))
    if version is None:
        errors.append(f"{metadata_path}: version {metadata.get('version')!r} is not MAJOR.MINOR.PATCH")

    actual_hash = directory_hash(skill)
    if metadata.get("hash") != actual_hash:
        errors.append(f'{metadata_path}: hash does not match the skill files, set "hash": "{actual_hash}"')

    base = base_metadata(base_ref, metadata_path) if base_ref else None
    if base and version and base.get("hash") != actual_hash:
        base_version = parse_version(base.get("version"))
        if base_version and version <= base_version:
            errors.append(f"{metadata_path}: the skill changed, raise version above {base['version']}")
    return errors


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--base-ref", help="require a version increase for skills changed since this commit")
    args = parser.parse_args()

    skills = sorted(p.parent for p in SKILLS.glob("*/SKILL.md"))
    if not skills:
        print(f"ERROR: no skills found under {SKILLS}/", file=sys.stderr)
        return 1

    errors = [error for skill in skills for error in check_skill(skill, args.base_ref)]
    for error in errors:
        print(f"ERROR: {error}", file=sys.stderr)
    if errors:
        return 1
    print(f"{len(skills)} skills: metadata.json matches the content")
    return 0


if __name__ == "__main__":
    sys.exit(main())
