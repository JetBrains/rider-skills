"""Final position and darkness adjustments."""
import unreal
import math

subsys = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
actors = subsys.get_all_level_actors()

cam_pos = unreal.Vector(-800, -200, 100)
length = math.sqrt(1000**2 + 200**2 + 50**2)
fwd_x, fwd_y, fwd_z = 1000/length, 200/length, 50/length

right_x = fwd_y
right_y = -fwd_x
right_len = math.sqrt(right_x**2 + right_y**2)
right_x /= right_len
right_y /= right_len
right_z = 0

up_x = right_y * fwd_z - right_z * fwd_y
up_y = right_z * fwd_x - right_x * fwd_z
up_z = right_x * fwd_y - right_y * fwd_x

text_distance = 250  # a bit further for wider framing
center = unreal.Vector(
    cam_pos.x + fwd_x * text_distance,
    cam_pos.y + fwd_y * text_distance,
    cam_pos.z + fwd_z * text_distance
)

def s2w(h, v):
    return unreal.Vector(
        center.x + right_x * h + up_x * v,
        center.y + right_y * h + up_y * v,
        center.z + right_z * h + up_z * v)

look_rot = unreal.MathLibrary.find_look_at_rotation(center, cam_pos)
text_rot = unreal.Rotator(pitch=look_rot.pitch, yaw=look_rot.yaw, roll=0)

# Layout: wider framing, text more to the left, matching reference
placements = {
    "Menu_Title_KENA":  {"pos": s2w(-130, 70), "size": 45.0},
    "Menu_Subtitle":    {"pos": s2w(-130, 48), "size": 14.0},
    "Menu_NewGame":     {"pos": s2w(-130, -5), "size": 18.0},
    "Menu_LoadGame":    {"pos": s2w(-130, -26), "size": 18.0},
    "Menu_Options":     {"pos": s2w(-130, -47), "size": 18.0},
    "Menu_Version":     {"pos": s2w(140, -85), "size": 8.0},
}

for a in actors:
    label = a.get_actor_label()
    if label in placements:
        info = placements[label]
        a.set_actor_location(info["pos"], False, False)
        a.set_actor_rotation(text_rot, False)
        tc = a.text_render
        tc.set_world_size(info["size"])
        tc.set_editor_property("text_render_color", unreal.Color(235, 228, 210, 255))
        tc.set_editor_property("horizontal_alignment", unreal.HorizTextAligment.EHTA_LEFT)
        print("Positioned: " + label)

    elif label == "MainMenu_PostProcess":
        s = a.settings
        s.override_auto_exposure_bias = True
        s.auto_exposure_bias = -2.0
        a.settings = s
        print("PostProcess exposure=-2.0")

unreal.EditorAssetLibrary.save_asset("/Game/Maps/KenaMainMenu")
print("Final positions saved")
