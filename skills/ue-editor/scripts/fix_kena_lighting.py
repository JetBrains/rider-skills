"""Fix KenaMainMenu lighting to match dark mystical forest reference.
The scene is currently way too bright/overexposed."""
import unreal

subsys = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
actors = subsys.get_all_level_actors()

for a in actors:
    label = a.get_actor_label()

    # 1) Directional light — dim moonlight, not sun
    if label == "MainMenu_MoonLight":
        lc = a.light_component
        lc.set_editor_property("intensity", 2.0)
        # Cooler moonlight color
        lc.set_editor_property("light_color", unreal.Color(180, 200, 255, 255))
        print("Fixed MoonLight: intensity=2.0, cool blue")

    # 2) SkyLight — very low for dark atmosphere
    elif label == "MainMenu_SkyLight":
        slc = a.light_component
        slc.set_editor_property("intensity", 0.3)
        print("Fixed SkyLight: intensity=0.3")

    # 3) PostProcess — dark moody exposure, cool grading
    elif label == "MainMenu_PostProcess":
        s = a.settings
        s.override_auto_exposure_bias = True
        s.auto_exposure_bias = -1.0
        s.override_bloom_intensity = True
        s.bloom_intensity = 0.8
        s.override_vignette_intensity = True
        s.vignette_intensity = 0.5
        # Cool shadows, warm highlights
        s.override_color_gain = True
        s.color_gain = unreal.Vector4(0.85, 0.9, 1.0, 1.0)
        s.override_color_saturation = True
        s.color_saturation = unreal.Vector4(1.0, 1.0, 1.0, 1.1)
        a.settings = s
        print("Fixed PostProcess: exposure=-1.0, cool grading")

    # 4) Fog — denser, blue-green tint
    elif label == "MainMenu_Fog":
        fc = a.component
        fc.set_editor_property("fog_density", 0.08)
        fc.set_editor_property("fog_height_falloff", 0.15)
        fc.set_fog_inscattering_color(unreal.LinearColor(0.01, 0.03, 0.02, 1.0))
        fc.set_editor_property("enable_volumetric_fog", True)
        fc.set_editor_property("volumetric_fog_scattering_distribution", 0.5)
        fc.set_editor_property("volumetric_fog_extinction_scale", 1.5)
        print("Fixed Fog: denser, darker green tint")

    # 5) Ambient fill lights — much dimmer
    elif label == "Ambient_Fill_1":
        plc = a.point_light_component
        plc.set_editor_property("intensity", 500.0)
        plc.set_editor_property("light_color", unreal.Color(80, 120, 150, 255))
        print("Fixed Ambient_Fill_1: dimmed to 500")

    elif label == "Ambient_Fill_2":
        plc = a.point_light_component
        plc.set_editor_property("intensity", 300.0)
        plc.set_editor_property("light_color", unreal.Color(60, 100, 130, 255))
        print("Fixed Ambient_Fill_2: dimmed to 300")

    # 6) Lantern lights — keep warm but moderate
    elif "Lantern" in label and "Light" in label:
        plc = a.point_light_component
        plc.set_editor_property("intensity", 8000.0)
        plc.set_editor_property("attenuation_radius", 400.0)
        plc.set_editor_property("light_color", unreal.Color(255, 160, 60, 255))
        print("Fixed " + label + ": warm glow 8000")

unreal.EditorAssetLibrary.save_asset("/Game/Maps/KenaMainMenu")
print("Lighting fixes saved")
