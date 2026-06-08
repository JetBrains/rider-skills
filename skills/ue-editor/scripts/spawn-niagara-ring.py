"""Spawn Niagara actors in a ring pattern around a center point.
Uses an existing NiagaraSystem asset — does NOT try to configure emitter internals.

Params:
  __system_path__  — asset path to NiagaraSystem (required)
  __center_x/y/z__ — ring center (default: 0, 0, 0)
  __radius__       — ring radius in cm (default: 200)
  __count__        — number of emitters around ring (default: 6)
  __label_prefix__ — actor label prefix (default: "FX")

Usage:
  ue-exec.sh --script '__system_path__="/Game/Effects/Particles/Impacts/NS_ImactSparksCharacter"; __center_x__=1500; __radius__=173; __count__=8; __label_prefix__="ShieldSpark"; exec(open("...spawn-niagara-ring.py").read())'
"""
import unreal
import math

g = globals()
system_path = g.get("__system_path__", "")
cx = float(g.get("__center_x__", 0))
cy = float(g.get("__center_y__", 0))
cz = float(g.get("__center_z__", 0))
radius = float(g.get("__radius__", 200))
count = int(g.get("__count__", 6))
label_prefix = g.get("__label_prefix__", "FX")

if not system_path:
    print("ERROR: __system_path__ is required")
else:
    eal = unreal.EditorAssetLibrary
    system = eal.load_asset(system_path)
    if not system:
        print("ERROR: NiagaraSystem not found at {}".format(system_path))
    else:
        subsys = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
        for i in range(count):
            angle = (2 * math.pi * i) / count
            x = cx + radius * math.cos(angle)
            y = cy + radius * math.sin(angle)
            yaw = math.degrees(angle)

            loc = unreal.Vector(x, y, cz)
            rot = unreal.Rotator()
            rot.yaw = yaw

            actor = subsys.spawn_actor_from_class(unreal.NiagaraActor, loc, rot)
            actor.set_actor_label("{}_{}".format(label_prefix, i))

            comp = actor.get_component_by_class(unreal.NiagaraComponent)
            comp.set_asset(system)
            comp.set_editor_property("auto_activate", True)

        print("Spawned {} x {} in ring r={:.0f} at ({:.0f}, {:.0f}, {:.0f})".format(
            count, system.get_name(), radius, cx, cy, cz))
