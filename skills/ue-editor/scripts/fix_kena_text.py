"""Fix text: remove 180 flip (was causing mirror), fix vertical positions."""
import unreal
import math

subsys = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
actors = subsys.get_all_level_actors()

# Camera setup
cam_pos = unreal.Vector(-800, -200, 100)
cam_target = unreal.Vector(200, 0, 150)

length = math.sqrt(1000**2 + 200**2 + 50**2)
fwd_x, fwd_y, fwd_z = 1000/length, 200/length, 50/length

# Right vector (fwd cross up)
right_x = fwd_y
right_y = -fwd_x
right_len = math.sqrt(right_x**2 + right_y**2)
right_x /= right_len
right_y /= right_len
right_z = 0

# Up vector (right cross fwd)
up_x = right_y * fwd_z - right_z * fwd_y
up_y = right_z * fwd_x - right_x * fwd_z
up_z = right_x * fwd_y - right_y * fwd_x

text_distance = 200
center = unreal.Vector(
    cam_pos.x + fwd_x * text_distance,
    cam_pos.y + fwd_y * text_distance,
    cam_pos.z + fwd_z * text_distance
)

def screen_to_world(h_offset, v_offset):
    return unreal.Vector(
        center.x + right_x * h_offset + up_x * v_offset,
        center.y + right_y * h_offset + up_y * v_offset,
        center.z + right_z * h_offset + up_z * v_offset
    )

# Look at from text toward camera — no flip this time
look_rot = unreal.MathLibrary.find_look_at_rotation(center, cam_pos)
text_rot = unreal.Rotator(pitch=look_rot.pitch, yaw=look_rot.yaw, roll=0)

# Kena reference layout: title top-left, menu mid-left, version bottom-right
# Positive h = right of center, negative h = left
# Positive v = up, negative v = down
text_placements = {
    "Menu_Title_KENA":  {"pos": screen_to_world(-100, 55), "size": 40.0},
    "Menu_Subtitle":    {"pos": screen_to_world(-100, 35), "size": 12.0},
    "Menu_NewGame":     {"pos": screen_to_world(-100, -15), "size": 16.0},
    "Menu_LoadGame":    {"pos": screen_to_world(-100, -33), "size": 16.0},
    "Menu_Options":     {"pos": screen_to_world(-100, -51), "size": 16.0},
    "Menu_Version":     {"pos": screen_to_world(120, -70), "size": 7.0},
}

for a in actors:
    label = a.get_actor_label()
    if label in text_placements:
        info = text_placements[label]
        a.set_actor_location(info["pos"], False, False)
        a.set_actor_rotation(text_rot, False)
        tc = a.text_render
        tc.set_world_size(info["size"])
        # Make text unlit/emissive so it's visible in dark scene
        tc.set_editor_property("text_render_color", unreal.Color(230, 224, 209, 255))
        print("Fixed " + label)

unreal.EditorAssetLibrary.save_asset("/Game/Maps/KenaMainMenu")
print("Text fixes saved")
