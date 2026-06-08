#!/usr/bin/env bash
# Resize or crop an image using Python/Pillow.
# Usage:
#   resize-image.sh INPUT [OPTIONS]
#
# Options:
#   --resize WxH       Resize to width x height (e.g. 800x600)
#   --max-width W      Scale down if wider than W, keep aspect ratio
#   --max-height H     Scale down if taller than H, keep aspect ratio
#   --crop L,T,R,B     Crop to box (left, top, right, bottom pixels)
#   --output PATH      Output path (default: overwrite input)
#   --quality N        JPEG quality 1-95 (default: 85, ignored for PNG)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TOOLKIT_ROOT="$(cd "${SCRIPT_DIR}/../../.." && pwd)"
# shellcheck source=/dev/null
source "${TOOLKIT_ROOT}/scripts/common/ue-env.sh"

INPUT=""
RESIZE=""
MAX_WIDTH=""
MAX_HEIGHT=""
CROP=""
OUTPUT=""
QUALITY=85

while [[ $# -gt 0 ]]; do
  case "$1" in
    --resize)     RESIZE="$2";     shift 2 ;;
    --max-width)  MAX_WIDTH="$2";  shift 2 ;;
    --max-height) MAX_HEIGHT="$2"; shift 2 ;;
    --crop)       CROP="$2";       shift 2 ;;
    --output)     OUTPUT="$2";     shift 2 ;;
    --quality)    QUALITY="$2";    shift 2 ;;
    -h|--help)
      sed -n '2,/^$/s/^# //p' "$0"
      exit 0 ;;
    *)
      if [[ -z "$INPUT" ]]; then
        INPUT="$1"; shift
      else
        echo "Unknown argument: $1" >&2; exit 1
      fi ;;
  esac
done

if [[ -z "$INPUT" ]]; then
  echo "ERROR: No input file specified" >&2
  exit 1
fi

if [[ ! -f "$INPUT" ]]; then
  echo "ERROR: File not found: $INPUT" >&2
  exit 1
fi

[[ -z "$OUTPUT" ]] && OUTPUT="$INPUT"

PYTHON_BIN=$(ue_python_bin || true)
if [[ -z "$PYTHON_BIN" ]]; then
  echo "ERROR: python3/python is required" >&2
  exit 1
fi

"$PYTHON_BIN" -c "
from PIL import Image
import sys

img = Image.open('$INPUT')
original = f'{img.width}x{img.height}'

crop = '$CROP'
if crop:
    l, t, r, b = [int(x) for x in crop.split(',')]
    img = img.crop((l, t, r, b))

resize = '$RESIZE'
max_w = '$MAX_WIDTH'
max_h = '$MAX_HEIGHT'

if resize:
    w, h = [int(x) for x in resize.split('x')]
    img = img.resize((w, h), Image.LANCZOS)
elif max_w or max_h:
    w, h = img.size
    mw = int(max_w) if max_w else w
    mh = int(max_h) if max_h else h
    if w > mw or h > mh:
        ratio = min(mw / w, mh / h)
        img = img.resize((int(w * ratio), int(h * ratio)), Image.LANCZOS)

out = '$OUTPUT'
save_kwargs = {}
if out.lower().endswith(('.jpg', '.jpeg')):
    save_kwargs['quality'] = int('$QUALITY')
    save_kwargs['optimize'] = True

img.save(out, **save_kwargs)
print(f'{original} -> {img.width}x{img.height} -> {out}')
"
