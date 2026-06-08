"""Spawn a static mesh actor in the level.

Params:
  __mesh_path__  — static mesh asset path (default: /Engine/BasicShapes/Sphere)
  __label__      — actor label (default: "MeshActor")
  __x/y/z__      — position (default: auto — camera-forward trace + snap-to-floor)
  __scale__      — uniform scale (default: 1.0)
  __material__   — material asset path to apply (optional)
  __max_dist__   — max trace distance in cm (default: 5000)

When no explicit x/y/z is provided, the actor is placed by tracing forward
from the viewport camera. If the forward trace hits geometry, the actor is
placed at the impact point. If not, it falls back to a downward trace from
the projected point. If neither trace hits, the actor is placed at the max
distance in front of the camera.

Usage:
  ue-exec.sh --script '__mesh_path__="/Engine/BasicShapes/Sphere"; __label__="ShieldSphere"; __scale__=4; __material__="/Game/Materials/M_HexShield"; exec(open("...spawn-mesh-actor.py").read())'
"""
import unreal
import re

# --- World context (required for line traces) --------------------------------

_world = unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem).get_editor_world()

# --- Helpers ----------------------------------------------------------------

def parse_hit_vector(hit_result, field="ImpactPoint"):
    """Extract a vector from HitResult.export_text() since properties are
    protected in UE 5.7 Python and cannot be read via get_editor_property()."""
    txt = hit_result.export_text()
    m = re.search(
        r"{}=\(X=([-\d.]+),Y=([-\d.]+),Z=([-\d.]+)\)".format(field), txt
    )
    if m:
        return unreal.Vector(float(m.group(1)), float(m.group(2)), float(m.group(3)))
    return None


def trace_forward(origin, direction, max_dist):
    """Line-trace from origin along direction up to max_dist. Returns
    impact point Vector or None."""
    end = origin + direction * max_dist
    hit = unreal.SystemLibrary.line_trace_single(
        _world, origin, end,
        unreal.TraceTypeQuery.TRACE_TYPE_QUERY1,
        False, [], unreal.DrawDebugTrace.NONE,
        ignore_self=True
    )
    if hit is not None:
        return parse_hit_vector(hit, "ImpactPoint")
    return None


def trace_down(point):
    """Line-trace downward from point to find the floor. Returns impact
    point Vector or None."""
    start = unreal.Vector(point.x, point.y, point.z + 5000.0)
    end = unreal.Vector(point.x, point.y, point.z - 50000.0)
    hit = unreal.SystemLibrary.line_trace_single(
        _world, start, end,
        unreal.TraceTypeQuery.TRACE_TYPE_QUERY1,
        False, [], unreal.DrawDebugTrace.NONE,
        ignore_self=True
    )
    if hit is not None:
        return parse_hit_vector(hit, "ImpactPoint")
    return None


# --- Parameters -------------------------------------------------------------

g = globals()
mesh_path = g.get("__mesh_path__", "/Engine/BasicShapes/Sphere")
label = g.get("__label__", "MeshActor")
scale = float(g.get("__scale__", 1.0))
mat_path = g.get("__material__", "")
max_dist = float(g.get("__max_dist__", 5000.0))

has_explicit_pos = "__x__" in g or "__y__" in g or "__z__" in g

# --- Determine spawn location -----------------------------------------------

if has_explicit_pos:
    x = float(g.get("__x__", 0))
    y = float(g.get("__y__", 0))
    z = float(g.get("__z__", 0))
    loc = unreal.Vector(x, y, z)
    placement = "explicit"
else:
    cam_loc = unreal.AgentBridgeLibrary.get_viewport_camera_location()
    cam_rot = unreal.AgentBridgeLibrary.get_viewport_camera_rotation()
    fwd = cam_rot.get_forward_vector()

    # 1) Trace forward from camera — hits walls, floors, objects in view
    hit_loc = trace_forward(cam_loc, fwd, max_dist)
    if hit_loc is not None:
        loc = hit_loc
        placement = "camera-forward trace hit"
    else:
        # 2) No forward hit — project point at max_dist, then trace down
        projected = cam_loc + fwd * max_dist
        floor_loc = trace_down(projected)
        if floor_loc is not None:
            loc = floor_loc
            placement = "camera-forward + snap-to-floor"
        else:
            # 3) No geometry at all — place at max_dist in front of camera
            loc = cam_loc + fwd * max_dist
            placement = "camera-forward (no geometry, max distance)"
            print("Warning: no geometry found, placing at max distance ({:.0f} cm) from camera".format(max_dist))

# --- Spawn actor -------------------------------------------------------------

subsys = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)

actor = subsys.spawn_actor_from_class(unreal.StaticMeshActor, loc)
actor.set_actor_label(label)
actor.set_actor_scale3d(unreal.Vector(scale, scale, scale))

mesh_comp = actor.get_component_by_class(unreal.StaticMeshComponent)
mesh = unreal.load_asset(mesh_path)
mesh_comp.set_static_mesh(mesh)

if mat_path:
    mat = unreal.EditorAssetLibrary.load_asset(mat_path)
    if mat:
        mesh_comp.set_material(0, mat)
        print("Applied material: {}".format(mat_path))

# --- Snap actor on top of surface (offset by half-height so it doesn't clip) -

_origin, _extent = actor.get_actor_bounds(False)
half_z = _extent.z  # half-height of bounding box
loc = unreal.Vector(loc.x, loc.y, loc.z + half_z)
actor.set_actor_location(loc, False, False)

print("Spawned '{}' at ({:.0f}, {:.0f}, {:.0f}) scale={} mesh={} placement={}".format(
    label, loc.x, loc.y, loc.z, scale, mesh_path, placement))
