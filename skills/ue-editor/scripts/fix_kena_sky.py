"""Add dark sky background and fix remaining brightness issues."""
import unreal

el = unreal.EditorLevelLibrary
subsys = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
actors = subsys.get_all_level_actors()

# 1) Create a large dark sphere as sky dome backdrop
# Use a large inverted sphere (engine basic shape sphere, scaled huge)
sky_dome = el.spawn_actor_from_class(
    unreal.StaticMeshActor, unreal.Vector(0, 0, 0)
)
sky_dome.set_actor_label("SkyDome_Dark")
sky_dome.set_actor_scale3d(unreal.Vector(100, 100, 100))

# Set mesh to sphere
mesh_comp = sky_dome.static_mesh_component
sphere_mesh = unreal.EditorAssetLibrary.load_asset("/Engine/BasicShapes/Sphere")
mesh_comp.set_static_mesh(sphere_mesh)

# Create a very dark material for the sky dome
# Load the dark ground material and use it (it's the darkest we have)
dark_mat = unreal.EditorAssetLibrary.load_asset("/Game/Materials/MainMenu/M_Ground_Forest")
mesh_comp.set_material(0, dark_mat)
print("Sky dome placed with dark material")

# 2) Fix SkyLight to not recapture bright sky
for a in actors:
    label = a.get_actor_label()
    if label == "MainMenu_SkyLight":
        slc = a.light_component
        slc.set_editor_property("intensity", 0.05)
        slc.set_editor_property("source_type", unreal.SkyLightSourceType.SLS_SPECIFIED_CUBEMAP)
        print("SkyLight: cubemap mode, intensity 0.05")

    # 3) Even darker post-process
    elif label == "MainMenu_PostProcess":
        s = a.settings
        s.override_auto_exposure_bias = True
        s.auto_exposure_bias = -3.5
        # Override sky/background to black
        s.override_scene_fringes_intensity = True
        a.settings = s
        print("PostProcess: exposure=-3.5")

# Save
unreal.EditorAssetLibrary.save_asset("/Game/Maps/KenaMainMenu")
print("Sky and exposure fixes saved")
