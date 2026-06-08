"""Remove actors from the level matching a label pattern.

Params:
  __label_contains__ — remove actors whose label contains this string (required)
  __dry_run__        — if True, only list matches without deleting (default: False)

Usage:
  ue-exec.sh --script '__label_contains__="ShieldSpark"; exec(open("...cleanup-actors.py").read())'
  ue-exec.sh --script '__label_contains__="ShieldSpark"; __dry_run__=True; exec(open("...cleanup-actors.py").read())'
"""
import unreal

g = globals()
label_pattern = g.get("__label_contains__", "")
dry_run = g.get("__dry_run__", False)

if not label_pattern:
    print("ERROR: __label_contains__ is required")
else:
    subsys = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
    matches = []
    for a in subsys.get_all_level_actors():
        label = a.get_actor_label()
        if label and label_pattern in label:
            matches.append(a)

    if dry_run:
        print("DRY RUN — would remove {} actors:".format(len(matches)))
        for a in matches:
            loc = a.get_actor_location()
            print("  {} [{}] at ({:.0f}, {:.0f}, {:.0f})".format(
                a.get_actor_label(), a.get_class().get_name(), loc.x, loc.y, loc.z))
    else:
        for a in matches:
            label = a.get_actor_label()
            subsys.destroy_actor(a)
        print("Removed {} actors matching '{}'".format(len(matches), label_pattern))
