"""Final fix: reposition text to camera's frustum, darken scene significantly."""
import unreal
import math

subsys = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
actors = subsys.get_all_level_actors()
el = unreal.EditorLevelLibrary

# Camera at (-800, -200, 100) looking toward (200, 0, 150)
cam_pos = unreal.Vector(-800, -200, 100)
cam_target = unreal.Vector(200, 0, 150)
cam_dir = cam_target - cam_pos  # (1000, 200, 50)

# Normalize direction
length = math.sqrt(1000**2 + 200**2 + 50**2)
fwd_x = 1000 / length
fwd_y = 200 / length
fwd_z = 50 / length

# Right vector (cross with world up approximately)
# fwd x up = right
right_x = fwd_y * 0 - fwd_z * 0  # This is wrong, let me use proper cross
# Actually: fwd cross up(0,0,1) = (fwd_y*1 - fwd_z*0, fwd_z*0 - fwd_x*1, fwd_x*0 - fwd_y*0)
right_x = fwd_y
right_y = -fwd_x
right_z = 0
right_len = math.sqrt(right_x**2 + right_y**2)
right_x /= right_len
right_y /= right_len

# Up vector
up_x = fwd_y * right_z - fwd_z * right_y
up_y = fwd_z * right_x - fwd_x * right_z
up_z = fwd_x * right_y - fwd_y * right_x

# Place text 200 units in front of camera, positioned in screen space
text_distance = 200
center = unreal.Vector(
    cam_pos.x + fwd_x * text_distance,
    cam_pos.y + fwd_y * text_distance,
    cam_pos.z + fwd_z * text_distance
)

# Text positions relative to center (screen coords):
# Title "KENA" - top-left: -60% right, +40% up
# Subtitle - below title
# Menu items - left side, middle height
# Version - bottom-right

def screen_to_world(h_offset, v_offset):
    """h_offset: negative=left, positive=right. v_offset: positive=up, negative=down."""
    x = center.x + right_x * h_offset + up_x * v_offset
    y = center.y + right_y * h_offset + up_y * v_offset
    z = center.z + right_z * h_offset + up_z * v_offset
    return unreal.Vector(x, y, z)

# Calculate look-at rotation for text facing camera (with 180 flip for TextRenderActor)
look_rot = unreal.MathLibrary.find_look_at_rotation(center, cam_pos)
text_rot = unreal.Rotator(pitch=look_rot.pitch, yaw=look_rot.yaw + 180, roll=0)

text_placements = {
    "Menu_Title_KENA": {"pos": screen_to_world(-120, 60), "size": 40.0},
    "Menu_Subtitle": {"pos": screen_to_world(-120, 38), "size": 12.0},
    "Menu_NewGame": {"pos": screen_to_world(-120, -10), "size": 16.0},
    "Menu_LoadGame": {"pos": screen_to_world(-120, -28), "size": 16.0},
    "Menu_Options": {"pos": screen_to_world(-120, -46), "size": 16.0},
    "Menu_Version": {"pos": screen_to_world(130, -70), "size": 7.0},
}

for a in actors:
    label = a.get_actor_label()

    if label in text_placements:
        info = text_placements[label]
        a.set_actor_location(info["pos"], False, False)
        a.set_actor_rotation(text_rot, False)
        tc = a.text_render
        tc.set_world_size(info["size"])
        print("Repositioned " + label + " at ({:.0f},{:.0f},{:.0f})".format(
            info["pos"].x, info["pos"].y, info["pos"].z))

    elif label == "MainMenu_PostProcess":
        s = a.settings
        s.override_auto_exposure_bias = True
        s.auto_exposure_bias = -1.0
        s.override_bloom_intensity = True
        s.bloom_intensity = 0.4
        s.override_vignette_intensity = True
        s.vignette_intensity = 0.6
        s.override_color_gain = True
        s.color_gain = unreal.Vector4(0.75, 0.82, 1.0, 1.0)
        a.settings = s
        print("PostProcess: exposure=-1.0")

    elif label == "MainMenu_Fog":
        fc = a.component
        fc.set_editor_property("fog_density", 0.2)
        fc.set_editor_property("fog_height_falloff", 0.05)
        fc.set_fog_inscattering_color(unreal.LinearColor(0.003, 0.008, 0.005, 1.0))
        fc.set_editor_property("volumetric_fog_extinction_scale", 5.0)
        print("Fog: extremely dense")

unreal.EditorAssetLibrary.save_asset("/Game/Maps/KenaMainMenu")
print("Final fixes saved")
