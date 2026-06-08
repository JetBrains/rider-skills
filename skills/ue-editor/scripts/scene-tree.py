"""Print the scene tree: all actors with class, location, and parent-child hierarchy."""
import unreal

actor_subsys = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
actors = actor_subsys.get_all_level_actors()

# Build parent->children map
children_map = {}
root_actors = []
for a in actors:
    parent = a.get_attach_parent_actor()
    if parent:
        parent_name = parent.get_actor_label()
        children_map.setdefault(parent_name, []).append(a)
    else:
        root_actors.append(a)

def print_actor(actor, indent=0):
    prefix = "  " * indent
    label = actor.get_actor_label()
    cls = actor.get_class().get_name()
    loc = actor.get_actor_location()
    print(f"{prefix}{label} [{cls}] ({loc.x:.0f}, {loc.y:.0f}, {loc.z:.0f})")
    for child in children_map.get(label, []):
        print_actor(child, indent + 1)

world = unreal.get_editor_subsystem(unreal.UnrealEditorSubsystem).get_editor_world()
print(f"Level: {world.get_name()}")
print(f"Actors: {len(actors)}")
print("---")
for a in sorted(root_actors, key=lambda x: x.get_actor_label()):
    print_actor(a)
