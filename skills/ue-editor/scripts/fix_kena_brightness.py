"""Balance: dark sky kept, but boost environment + lanterns + text visibility."""
import unreal

subsys = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
actors = subsys.get_all_level_actors()

for a in actors:
    label = a.get_actor_label()

    if label == "MainMenu_MoonLight":
        lc = a.light_component
        lc.set_editor_property("intensity", 5.0)
        lc.set_editor_property("light_color", unreal.Color(150, 170, 210, 255))
        print("MoonLight: intensity=5.0")

    elif label == "MainMenu_SkyLight":
        slc = a.light_component
        slc.set_editor_property("intensity", 1.5)
        slc.recapture_sky()
        print("SkyLight: intensity=1.5, recaptured")

    elif label == "MainMenu_PostProcess":
        s = a.settings
        s.override_auto_exposure_bias = True
        s.auto_exposure_bias = 1.0
        s.override_bloom_intensity = True
        s.bloom_intensity = 0.8
        s.override_vignette_intensity = True
        s.vignette_intensity = 0.5
        s.override_color_gain = True
        s.color_gain = unreal.Vector4(0.8, 0.85, 1.0, 1.0)
        a.settings = s
        print("PostProcess: exposure=1.0")

    elif label == "MainMenu_Fog":
        fc = a.component
        fc.set_editor_property("fog_density", 0.06)
        fc.set_editor_property("fog_height_falloff", 0.1)
        fc.set_fog_inscattering_color(unreal.LinearColor(0.005, 0.012, 0.008, 1.0))
        fc.set_editor_property("volumetric_fog_extinction_scale", 1.5)
        print("Fog: moderate density")

    elif "Lantern" in label and "Light" in label:
        plc = a.point_light_component
        plc.set_editor_property("intensity", 15000.0)
        plc.set_editor_property("attenuation_radius", 600.0)
        plc.set_editor_property("light_color", unreal.Color(255, 160, 60, 255))
        print(label + ": bright 15000")

    elif label == "Ambient_Fill_1":
        plc = a.point_light_component
        plc.set_editor_property("intensity", 2000.0)
        plc.set_editor_property("attenuation_radius", 2500.0)
        plc.set_editor_property("light_color", unreal.Color(60, 80, 130, 255))
        print("Ambient_Fill_1: 2000")

    elif label == "Ambient_Fill_2":
        plc = a.point_light_component
        plc.set_editor_property("intensity", 1500.0)
        plc.set_editor_property("attenuation_radius", 2000.0)
        plc.set_editor_property("light_color", unreal.Color(50, 70, 110, 255))
        print("Ambient_Fill_2: 1500")

    # Make text emissive by setting unlit material or just bright color
    elif label.startswith("Menu_"):
        tc = a.text_render
        tc.set_editor_property("text_render_color", unreal.Color(255, 248, 230, 255))
        print(label + ": bright white")

unreal.EditorAssetLibrary.save_asset("/Game/Maps/KenaMainMenu")
print("Brightness balance saved")
