"""Position viewport camera to look at a target point or actor.

UE Coordinate System (left-handed):
  X = Forward (Red axis)
  Y = Right   (Green axis)
  Z = Up      (Blue axis)
  All units in centimeters.

Params (set as globals before exec, or uses defaults):
  __target_actor__              — actor label to look at (overrides target xyz)
  __target_x__, __target_y__, __target_z__ — look-at target (default: 0, 0, 0)
  __cam_x__, __cam_y__, __cam_z__          — explicit camera position (overrides distance/elevation)
  __distance__                  — distance from target in cm (default: 800)
  __azimuth__                   — horizontal angle in degrees, 0=+X, 90=+Y (default: -45)
  __elevation__                 — vertical angle in degrees above horizon (default: 25)
  __fov__                       — field of view override in degrees (optional)

Modes:
  1. Explicit camera position: set __cam_x/y/z__ directly
  2. Orbit mode (default): camera orbits target at __distance__, __azimuth__, __elevation__

Usage:
  # Look at actor from default orbit:
  ue-exec.sh --script '__target_actor__="MyActor"; exec(open("...camera-look-at.py").read())'

  # Look at point from specific orbit:
  ue-exec.sh --script '__target_x__=0; __target_y__=0; __target_z__=100; __distance__=1200; __azimuth__=90; exec(open("...camera-look-at.py").read())'

  # Explicit camera position:
  ue-exec.sh --script '__cam_x__=500.0; __cam_y__=0.0; __cam_z__=300.0; __target_actor__="MyActor"; exec(open("...camera-look-at.py").read())'
"""
import unreal
import math

# Build a clean param dict from only the variables set in the caller's exec() line.
# The UE Python interpreter persists globals between calls, so we must distinguish
# "set in this invocation" from "leftover from a previous run".
# Convention: caller sets vars via  __key__=val; exec(open(...).read())
# We snapshot the caller's globals and use _PARAMS as the single source of truth.
_PARAMS = {}
_g = globals()
for _k in list(_g.keys()):
    if _k.startswith("__") and _k.endswith("__") and _k not in (
        "__builtins__", "__name__", "__doc__", "__file__",
        "__loader__", "__spec__", "__cached__", "__package__",
    ):
        _PARAMS[_k] = _g[_k]
        del _g[_k]  # clean up so next invocation starts fresh

# --- Resolve target ---
target_label = _PARAMS.get("__target_actor__", "")
tx, ty, tz = 0.0, 0.0, 0.0

if target_label:
    subsys = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
    found = False
    for a in subsys.get_all_level_actors():
        if a.get_actor_label() == target_label:
            loc = a.get_actor_location()
            tx, ty, tz = loc.x, loc.y, loc.z
            found = True
            break
    if not found:
        print("ERROR: Actor '{}' not found in level".format(target_label))
else:
    tx = float(_PARAMS.get("__target_x__", 0.0))
    ty = float(_PARAMS.get("__target_y__", 0.0))
    tz = float(_PARAMS.get("__target_z__", 0.0))

target = unreal.Vector(tx, ty, tz)

# --- Resolve camera position ---
has_explicit_cam = "__cam_x__" in _PARAMS or "__cam_y__" in _PARAMS or "__cam_z__" in _PARAMS

if has_explicit_cam:
    cx = float(_PARAMS.get("__cam_x__", tx + 500.0))
    cy = float(_PARAMS.get("__cam_y__", ty))
    cz = float(_PARAMS.get("__cam_z__", tz + 300.0))
else:
    # Orbit mode: position camera at distance/azimuth/elevation from target
    distance  = float(_PARAMS.get("__distance__", 800.0))
    azimuth   = float(_PARAMS.get("__azimuth__", -45.0))   # degrees, 0=+X, 90=+Y
    elevation = float(_PARAMS.get("__elevation__", 25.0))    # degrees above horizon

    az_rad  = math.radians(azimuth)
    el_rad  = math.radians(elevation)
    horiz   = distance * math.cos(el_rad)

    # UE coords: X=Forward, Y=Right, Z=Up
    cx = tx + horiz * math.cos(az_rad)
    cy = ty + horiz * math.sin(az_rad)
    cz = tz + distance * math.sin(el_rad)

cam_pos = unreal.Vector(cx, cy, cz)

# --- Set camera ---
rot = unreal.MathLibrary.find_look_at_rotation(cam_pos, target)

ues = unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem)
ues.set_level_viewport_camera_info(cam_pos, rot)

# Optional FOV override
fov = _PARAMS.get("__fov__", None)
if fov is not None:
    unreal.AgentBridgeLibrary.set_viewport_camera_fov(float(fov))

mode = "explicit" if has_explicit_cam else "orbit"
print("Camera [{}]: ({:.0f}, {:.0f}, {:.0f}) -> ({:.0f}, {:.0f}, {:.0f}) pitch={:.1f} yaw={:.1f}".format(
    mode, cx, cy, cz, tx, ty, tz, rot.pitch, rot.yaw))
