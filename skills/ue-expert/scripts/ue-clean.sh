#!/usr/bin/env bash
# Clean Unreal Engine build artifacts for a project.
# Removes: Binaries/, Intermediate/, Saved/, DerivedDataCache/
# Usage: ./ue-clean.sh --project <path.uproject> [--all]

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TOOLKIT_ROOT="$(cd "${SCRIPT_DIR}/../../.." && pwd)"
# shellcheck source=/dev/null
source "${TOOLKIT_ROOT}/scripts/common/ue-env.sh"

PROJECT=""
CLEAN_ALL=false
DRY_RUN=false

# ─── parse args ──────────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
  case "$1" in
    --project)  PROJECT="$2";     shift 2 ;;
    --all)      CLEAN_ALL=true;   shift ;;
    --dry-run)  DRY_RUN=true;     shift ;;
    -h|--help)
      echo "Usage: $0 --project <path.uproject> [options]"
      echo ""
      echo "Options:"
      echo "  --project PATH   Path to .uproject file (auto-detected if omitted)"
      echo "  --all            Also remove DerivedDataCache and Saved/ShaderDebugInfo"
      echo "  --dry-run        Show what would be deleted without deleting"
      echo ""
      echo "Removes:"
      echo "  Binaries/        Compiled binaries"
      echo "  Intermediate/    Build intermediates (PCH, obj files)"
      echo "  Plugins/*/Binaries/     Plugin binaries"
      echo "  Plugins/*/Intermediate/ Plugin intermediates"
      echo ""
      echo "With --all:"
      echo "  DerivedDataCache/        Derived data (shaders, textures)"
      echo "  Saved/ShaderDebugInfo/   Shader debug info"
      exit 0
      ;;
    *) echo "Unknown argument: $1"; exit 1 ;;
  esac
done

if [[ -z "$PROJECT" ]]; then
  PROJECT="${UE_PROJECT:-}"
fi

if [[ -z "$PROJECT" ]]; then
  PROJECT=$(ue_find_uproject "$(pwd)") || true
fi

if [[ -z "$PROJECT" || ! -f "$PROJECT" ]]; then
  echo "ERROR: No .uproject file found."
  echo "  Provide --project <path> or set UE_PROJECT, or run from within a UE project directory."
  exit 1
fi

PROJECT=$(cd "$(dirname "$PROJECT")" && pwd)/$(basename "$PROJECT")
PROJECT_DIR=$(dirname "$PROJECT")
PROJECT_NAME=$(basename "$PROJECT" .uproject)

echo "Project: ${PROJECT_NAME} (${PROJECT_DIR})"
echo ""

# ─── collect directories to clean ───────────────────────────────────
DIRS_TO_CLEAN=()

# Core build artifacts
for dir in "Binaries" "Intermediate"; do
  target="${PROJECT_DIR}/${dir}"
  if [[ -d "$target" ]]; then
    DIRS_TO_CLEAN+=("$target")
  fi
done

# Plugin build artifacts
if [[ -d "${PROJECT_DIR}/Plugins" ]]; then
  for plugin_dir in "${PROJECT_DIR}/Plugins"/*/; do
    [[ -d "$plugin_dir" ]] || continue
    for dir in "Binaries" "Intermediate"; do
      target="${plugin_dir}${dir}"
      if [[ -d "$target" ]]; then
        DIRS_TO_CLEAN+=("$target")
      fi
    done
  done
fi

# Extended clean
if [[ "$CLEAN_ALL" == true ]]; then
  for dir in "DerivedDataCache" "Saved/ShaderDebugInfo"; do
    target="${PROJECT_DIR}/${dir}"
    if [[ -d "$target" ]]; then
      DIRS_TO_CLEAN+=("$target")
    fi
  done
fi

# ─── report and clean ───────────────────────────────────────────────
if [[ ${#DIRS_TO_CLEAN[@]} -eq 0 ]]; then
  echo "Nothing to clean — no build artifacts found."
  exit 0
fi

TOTAL_SIZE=0
echo "Directories to remove:"
for dir in "${DIRS_TO_CLEAN[@]}"; do
  # Get size (cross-platform)
  SIZE=$(du -sh "$dir" 2>/dev/null | cut -f1 || echo "?")
  REL=$(echo "$dir" | sed "s|${PROJECT_DIR}/||")
  echo "  ${REL}/ (${SIZE})"
done

echo ""

if [[ "$DRY_RUN" == true ]]; then
  echo "DRY RUN — no files deleted."
  exit 0
fi

for dir in "${DIRS_TO_CLEAN[@]}"; do
  REL=$(echo "$dir" | sed "s|${PROJECT_DIR}/||")
  echo "Removing ${REL}/..."
  rm -rf "$dir"
done

echo ""
echo "Clean complete for ${PROJECT_NAME}."
