"""Fix KenaMainMenu to be dark mystical forest — remove bright sky, darken everything."""
import unreal
import math

subsys = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
actors = subsys.get_all_level_actors()
el = unreal.EditorLevelLibrary

for a in actors:
    label = a.get_actor_label()

    # 1) Remove SkyAtmosphere — it creates bright daytime sky
    if label == "MainMenu_SkyAtmosphere":
        a.destroy_actor()
        print("Removed SkyAtmosphere (was causing bright blue sky)")

    # 2) Directional light — very dim, steep angle for moonlight from above-right
    elif label == "MainMenu_MoonLight":
        lc = a.light_component
        lc.set_editor_property("intensity", 1.5)
        lc.set_editor_property("light_color", unreal.Color(140, 160, 200, 255))
        a.set_actor_rotation(unreal.Rotator(-60, 45, 0), False)
        print("Fixed MoonLight: very dim, steep moonlight angle")

    # 3) SkyLight — minimal, dark blue ambient
    elif label == "MainMenu_SkyLight":
        slc = a.light_component
        slc.set_editor_property("intensity", 0.15)
        slc.set_editor_property("source_type", unreal.SkyLightSourceType.SLS_SPECIFIED_CUBEMAP)
        print("Fixed SkyLight: very low 0.15")

    # 4) PostProcess — very dark exposure
    elif label == "MainMenu_PostProcess":
        s = a.settings
        s.override_auto_exposure_bias = True
        s.auto_exposure_bias = -2.5
        s.override_bloom_intensity = True
        s.bloom_intensity = 0.6
        s.override_vignette_intensity = True
        s.vignette_intensity = 0.6
        # Cool dark atmosphere
        s.override_color_gain = True
        s.color_gain = unreal.Vector4(0.7, 0.8, 0.95, 1.0)
        s.override_color_saturation = True
        s.color_saturation = unreal.Vector4(1.0, 1.0, 1.0, 0.85)
        # Darker shadows
        s.override_color_gamma = True
        s.color_gamma = unreal.Vector4(1.0, 1.0, 1.0, 1.1)
        a.settings = s
        print("Fixed PostProcess: exposure=-2.5, dark moody grading")

    # 5) Fog — very dense, dark
    elif label == "MainMenu_Fog":
        fc = a.component
        fc.set_editor_property("fog_density", 0.12)
        fc.set_editor_property("fog_height_falloff", 0.1)
        fc.set_fog_inscattering_color(unreal.LinearColor(0.005, 0.015, 0.01, 1.0))
        fc.set_editor_property("enable_volumetric_fog", True)
        fc.set_editor_property("volumetric_fog_scattering_distribution", 0.6)
        fc.set_editor_property("volumetric_fog_extinction_scale", 2.0)
        print("Fixed Fog: very dense and dark")

    # 6) Ambient fills — very dim blue
    elif label == "Ambient_Fill_1":
        plc = a.point_light_component
        plc.set_editor_property("intensity", 200.0)
        plc.set_editor_property("light_color", unreal.Color(40, 60, 100, 255))
        print("Fixed Ambient_Fill_1: very dim 200")

    elif label == "Ambient_Fill_2":
        plc = a.point_light_component
        plc.set_editor_property("intensity", 150.0)
        plc.set_editor_property("light_color", unreal.Color(30, 50, 80, 255))
        print("Fixed Ambient_Fill_2: very dim 150")

    # 7) Fix text rotation to face camera at (-800, -200, 100)
    elif label.startswith("Menu_"):
        # Get actor position
        pos = a.get_actor_location()
        # Calculate direction to camera
        cam = unreal.Vector(-800, -200, 100)
        direction = cam - pos
        # Use find_look_at_rotation
        look_rot = unreal.MathLibrary.find_look_at_rotation(pos, cam)
        a.set_actor_rotation(look_rot, False)
        print("Fixed text rotation: " + label)

unreal.EditorAssetLibrary.save_asset("/Game/Maps/KenaMainMenu")
print("All atmosphere fixes applied and saved")
