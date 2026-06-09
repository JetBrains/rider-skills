# UE Python API — HairStrandsCore Module

**88 types** from the `HairStrandsCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `FollicleMaskOptions`, `GoomBindingGroupInfo`, `GroomAnimationInfo`, `GroomBuildSettings`, `GroomCacheImportSettings`, `GroomCacheInfo`, `GroomConversionSettings`, `GroomDataflowSettings`, `GroomHairGroupPreview`, `HairAdvancedRenderingSettings`, `HairBendConstraint`, `HairCollisionConstraint`, `HairDecimationSettings`, `HairDeformationSettings`, `HairExternalForces`, `HairGeometrySettings`, `HairGroupCardsInfo`, `HairGroupCardsTextures`, `HairGroupDesc`, `HairGroupInfo`, ... (88 total)

---

## Classes

### `unreal.FollicleMaskOptions`
Inherits: `StructBase` | Header: `GroomCreateFollicleMaskOptions.h`

Follicle Mask Options

**Properties** (2):
  - `channel`: `FollicleMaskChannel` — [Read-Write] Texture channel in which the groomâs roots mask will be writtent to. (FollicleMaskCha...
  - `groom`: `GroomAsset` [Read-Only] — [Read-Only] Groom asset (GroomAsset)

### `unreal.GoomBindingGroupInfo`
Inherits: `StructBase` | Header: `GroomBindingAsset.h`

Goom Binding Group Info

### `unreal.GroomAnimationInfo`
Inherits: `StructBase` | Header: `GroomCacheData.h`

Relevant information about a groom animation

### `unreal.GroomBuildSettings`
Inherits: `StructBase` | Header: `GroomSettings.h`

Groom Build Settings

**Properties** (6):
  - `hair_to_guide_density`: `float` — [Read-Write] Density factor for converting hair into guide curve if no guides are provided. (float)
  - `interpolation_distance`: `GroomInterpolationWeight` — [Read-Write] Interpolation distance metric. (GroomInterpolationWeight)
  - `interpolation_quality`: `GroomInterpolationQuality` — [Read-Write] Interpolation data quality. (GroomInterpolationQuality)
  - `override_guides`: `bool` — [Read-Write] If checked, override imported guides with generated ones. (bool)
  - `randomize_guide`: `bool` — [Read-Write] Randomize which guides affect a given hair strand. (bool)
  - `use_unique_guide`: `bool` — [Read-Write] Force a hair strand to be affected by a unique guide. (bool)

### `unreal.GroomCacheImportSettings`
Inherits: `StructBase` | Header: `GroomCacheImportOptions.h`

Groom Cache Import Settings

**Properties** (10):
  - `conversion_settings`: `GroomConversionSettings` — [Read-Write] Conversion settings to apply to the groom cache import when override is enabled (GroomC...
  - `frame_end`: `int` — [Read-Write] Ending index to stop sampling the animation at (int32)
  - `frame_start`: `int` — [Read-Write] Starting index to start sampling the animation from (int32)
  - `groom_asset`: `SoftObjectPath` — [Read-Write] The groom asset the groom cache will be built from (must be compatible) (SoftObjectPath...
  - `hair_strands_asset`: `SoftObjectPath` — âhair_strands_assetâ was renamed to âgroom_assetâ. deprecated
  - `import_groom_asset`: `bool` — [Read-Write] Import or re-import the groom asset from this file (bool)
  - `import_groom_cache`: `bool` — [Read-Write] Import the animated groom that was detected in this file (bool)
  - `import_type`: `GroomCacheImportType` — [Read-Write] Groom Cache types to import (GroomCacheImportType)
  - `override_conversion_settings`: `bool` — [Read-Write] Set to true to override the groom conversion settings. Otherwise, use the settings from...
  - `skip_empty_frames`: `bool` — [Read-Write] Skip empty (pre-roll) frames and start importing at the frame which actually contains d...

### `unreal.GroomCacheInfo`
Inherits: `StructBase` | Header: `GroomCacheData.h`

Information about the GroomCache itself

### `unreal.GroomConversionSettings`
Inherits: `StructBase` | Header: `GroomSettings.h`

Groom Conversion Settings

**Properties** (2):
  - `rotation`: `Vector` — [Read-Write] Rotation in Euler angles in degrees to fix up or front axes (Vector)
  - `scale`: `Vector` — [Read-Write] Scale value to convert file unit into centimeters (Vector)

### `unreal.GroomDataflowSettings`
Inherits: `StructBase` | Header: `GroomAssetDataflow.h`

Groom Dataflow Settings

### `unreal.GroomHairGroupPreview`
Inherits: `StructBase` | Header: `GroomImportOptions.h`

Groom Hair Group Preview

**Properties** (6):
  - `curve_count`: `int` [Read-Only] — [Read-Only] (int32)
  - `group_id`: `int` [Read-Only] — [Read-Only] (int32)
  - `group_index`: `int` [Read-Only] — [Read-Only] (int32)
  - `group_name`: `Name` [Read-Only] — [Read-Only] (Name)
  - `guide_count`: `int` [Read-Only] — [Read-Only] (int32)
  - `interpolation_settings`: `HairGroupsInterpolation` — [Read-Write] (HairGroupsInterpolation)

### `unreal.HairAdvancedRenderingSettings`
Inherits: `StructBase` | Header: `GroomAssetRendering.h`

Hair Advanced Rendering Settings

**Properties** (2):
  - `scatter_scene_lighting`: `bool` [Read-Only] — [Read-Only] Light hair with the scene color. This is used for vellus/short hair to bring light from ...
  - `use_stable_rasterization`: `bool` [Read-Only] — [Read-Only] Insure the hair does not alias. When enable, group of hairs might appear thicker. Isolat...

### `unreal.HairBendConstraint`
Inherits: `StructBase` | Header: `GroomAssetPhysics.h`

Hair Bend Constraint

### `unreal.HairCollisionConstraint`
Inherits: `StructBase` | Header: `GroomAssetPhysics.h`

Hair Collision Constraint

### `unreal.HairDecimationSettings`
Inherits: `StructBase` | Header: `GroomAssetInterpolation.h`

Hair Decimation Settings

### `unreal.HairDeformationSettings`
Inherits: `StructBase` | Header: `GroomAssetInterpolation.h`

Hair Deformation Settings

### `unreal.HairExternalForces`
Inherits: `StructBase` | Header: `GroomAssetPhysics.h`

Hair External Forces

### `unreal.HairGeometrySettings`
Inherits: `StructBase` | Header: `GroomAssetRendering.h`

Hair Geometry Settings

**Properties** (4):
  - `hair_root_scale`: `float` — [Read-Write] Scale the hair width at the root (float)
  - `hair_tip_scale`: `float` — [Read-Write] Scale the hair width at the tip (float)
  - `hair_width`: `float` — [Read-Write] Hair width (in centimeters) (float)
  - `hair_width_override`: `bool` — [Read-Write] (bool)

### `unreal.HairGroupCardsInfo`
Inherits: `StructBase` | Header: `GroomAssetCards.h`

Hair Group Cards Info

### `unreal.HairGroupCardsTextures`
Inherits: `StructBase` | Header: `GroomAssetCards.h`

Hair Group Cards Textures

### `unreal.HairGroupDesc`
Inherits: `StructBase` | Header: `GroomDesc.h`

Note: If a new field is added to this struct, think to update GroomComponentDestailsCustomization.cpp to handle override flags

**Properties** (19):
  - `hair_length_scale`: `float` — [Read-Write] When enabled, Length Scale allow to scale the length of the hair. (float)
  - `hair_length_scale_override`: `bool` — [Read-Write] (bool)
  - `hair_raytracing_radius_scale`: `float` — [Read-Write] Scale the hair geometry radius for ray tracing effects (e.g. shadow) (float)
  - `hair_raytracing_radius_scale_override`: `bool` — [Read-Write] (bool)
  - `hair_root_scale`: `float` — [Read-Write] Scale the hair width at the root (float)
  - `hair_root_scale_override`: `bool` — [Read-Write] (bool)
  - `hair_shadow_density`: `float` — [Read-Write] Override the hair shadow density factor (unit less). (float)
  - `hair_shadow_density_override`: `bool` — [Read-Write] (bool)
  - `hair_tip_scale`: `float` — [Read-Write] Scale the hair width at the tip (float)
  - `hair_tip_scale_override`: `bool` — [Read-Write] (bool)
  - `hair_width`: `float` — [Read-Write] Hair width (in centimeters) (float)
  - `hair_width_override`: `bool` — [Read-Write] (bool)
  - `lod_bias`: `float` — [Read-Write] Bias the selected LOD. A value >0 will progressively select lower detailed lods. Used w...
  - `scatter_scene_lighting`: `bool` [Read-Only] — [Read-Only] Light hair with the scene color. This is used for vellus/short hair to bring light from ...
  - `scatter_scene_lighting_override`: `bool` — [Read-Write] (bool)
  - `use_hair_raytracing_geometry`: `bool` — [Read-Write] Enable hair strands geomtry for raytracing (bool)
  - `use_hair_raytracing_geometry_override`: `bool` — [Read-Write] (bool)
  - `use_stable_rasterization`: `bool` [Read-Only] — [Read-Only] Insure the hair does not alias. When enable, group of hairs might appear thicker. Isolat...
  - `use_stable_rasterization_override`: `bool` — [Read-Write] (bool)

### `unreal.HairGroupInfo`
Inherits: `StructBase` | Header: `GroomAsset.h`

Hair Group Info

### `unreal.HairGroupInfoWithVisibility`
Inherits: `HairGroupInfo` | Header: `GroomAsset.h`

Hair Group Info with Visibility

### `unreal.HairGroupLODInfo`
Inherits: `StructBase` | Header: `GroomAsset.h`

Hair Group LODInfo

### `unreal.HairGroupsCardsSourceDescription`
Inherits: `StructBase` | Header: `GroomAssetCards.h`

Hair Groups Cards Source Description

### `unreal.HairGroupsInterpolation`
Inherits: `StructBase` | Header: `GroomAssetInterpolation.h`

Hair Groups Interpolation

### `unreal.HairGroupsLOD`
Inherits: `StructBase` | Header: `GroomAssetInterpolation.h`

Hair Groups LOD

### `unreal.HairGroupsMaterial`
Inherits: `StructBase` | Header: `GroomAsset.h`

Hair Groups Material

### `unreal.HairGroupsMeshesSourceDescription`
Inherits: `StructBase` | Header: `GroomAssetMeshes.h`

Hair Groups Meshes Source Description

### `unreal.HairGroupsPhysics`
Inherits: `StructBase` | Header: `GroomAssetPhysics.h`

Hair Groups Physics

### `unreal.HairGroupsRendering`
Inherits: `StructBase` | Header: `GroomAssetRendering.h`

Hair Groups Rendering

### `unreal.HairInterpolationSettings`
Inherits: `StructBase` | Header: `GroomAssetInterpolation.h`

Hair Interpolation Settings

**Properties** (8):
  - `guide_type`: `GroomGuideType` — [Read-Write] Type of guides:
- Imported: use imported guides
- Generated: generate guides from stran...
  - `hair_to_guide_density`: `float` — [Read-Write] Density factor for converting hair into guide curve if no guides are provided. The valu...
  - `interpolation_distance`: `HairInterpolationWeight` — [Read-Write] Interpolation distance metric. (HairInterpolationWeight)
  - `interpolation_quality`: `HairInterpolationQuality` — [Read-Write] Interpolation data quality. (HairInterpolationQuality)
  - `randomize_guide`: `bool` — [Read-Write] Randomize which guides affect a given hair strand. (bool)
  - `rigged_guide_num_curves`: `int` [Read-Only] — [Read-Only] Number of guides that will be generated on the groom and the skeletal mesh (int32)
  - `rigged_guide_num_points`: `int` [Read-Only] — [Read-Only] Number of points/bones per generated guide (int32)
  - `use_unique_guide`: `bool` — [Read-Write] Force a hair strand to be affected by a unique guide. (bool)

### `unreal.HairLODSettings`
Inherits: `StructBase` | Header: `GroomAssetInterpolation.h`

Hair LODSettings

### `unreal.HairMaterialConstraints`
Inherits: `StructBase` | Header: `GroomAssetPhysics.h`

Hair Material Constraints

### `unreal.HairShadowSettings`
Inherits: `StructBase` | Header: `GroomAssetRendering.h`

Hair Shadow Settings

**Properties** (4):
  - `hair_raytracing_radius_scale`: `float` — [Read-Write] Scale the hair geometry radius for ray tracing effects (e.g. shadow) (float)
  - `hair_shadow_density`: `float` — [Read-Write] Override the hair shadow density factor (unit less). (float)
  - `use_hair_raytracing_geometry`: `bool` — [Read-Write] Enable hair strands geomtry for raytracing (bool)
  - `voxelize`: `bool` — [Read-Write] Enable stands voxelize for casting shadow and environment occlusion (bool)

### `unreal.HairSimulationConstraints`
Inherits: `StructBase` | Header: `GroomAssetPhysics.h`

Hair Simulation Constraints

**Properties** (8):
  - `bend_damping`: `float` — [Read-Write] Damping for the bend constraint between 0 and 1 (float)
  - `bend_stiffness`: `float` — [Read-Write] Stiffness for the bend constraint in GPa (float)
  - `collision_radius`: `float` — [Read-Write] Radius that will be used for the collision detection against the physics asset (float)
  - `kinetic_friction`: `float` — [Read-Write] Kinetic friction used for collision against the physics asset (float)
  - `static_friction`: `float` — [Read-Write] Static friction used for collision against the physics asset (float)
  - `strands_viscosity`: `float` — [Read-Write] Viscosity parameter between 0 and 1 that will be used for self collision (float)
  - `stretch_damping`: `float` — [Read-Write] Damping for the stretch constraint between 0 and 1 (float)
  - `stretch_stiffness`: `float` — [Read-Write] Stiffness for the stretch constraint in GPa (float)

### `unreal.HairSimulationForces`
Inherits: `StructBase` | Header: `GroomAssetPhysics.h`

Hair Simulation Forces

**Properties** (3):
  - `air_drag`: `float` — [Read-Write] Coefficient between 0 and 1 to be used for the air drag (float)
  - `air_velocity`: `Vector` — [Read-Write] Velocity of the surrounding air in cm/s (Vector)
  - `gravity_vector`: `Vector` — [Read-Write] Acceleration vector in cm/s2 to be used for the gravity (Vector)

### `unreal.HairSimulationSettings`
Inherits: `StructBase` | Header: `GroomAssetPhysics.h`

Hair Simulation Settings

**Properties** (5):
  - `external_forces`: `HairSimulationForces` — [Read-Write] External Forces for the hair physics (HairSimulationForces)
  - `material_constraints`: `HairSimulationConstraints` — [Read-Write] Material Constraints for the hair physics (HairSimulationConstraints)
  - `override_settings`: `bool` — [Read-Write] Boolean to control if we are going to override the groom asset physics settings (bool)
  - `simulation_setup`: `HairSimulationSetup` — [Read-Write] Solver Settings for the hair physics (HairSimulationSetup)
  - `solver_settings`: `HairSimulationSolver` — [Read-Write] Solver Settings for the hair physics (HairSimulationSolver)

### `unreal.HairSimulationSetup`
Inherits: `StructBase` | Header: `GroomAssetPhysics.h`

Hair Simulation Setup

**Properties** (7):
  - `angular_velocity_scale`: `float` — [Read-Write] The amount of angular velocities sent to the local groom space from the reference bone ...
  - `debug_simulation`: `bool` — [Read-Write] Boolean to make the simulation strands visible (bool)
  - `linear_velocity_scale`: `float` — [Read-Write] The amount of linear velocities sent to the local groom space from the reference bone (...
  - `local_bone`: `str` — [Read-Write] Bone used for the simulation local space (str)
  - `local_simulation`: `bool` — [Read-Write] Strands simulation is done in local space (bool)
  - `reset_simulation`: `bool` — [Read-Write] Boolean to control if we want to reset trhe simulation at some point in time (bool)
  - `teleport_distance`: `float` — [Read-Write] Teleport distance threshold to reset the simulation (float)

### `unreal.HairSimulationSolver`
Inherits: `StructBase` | Header: `GroomAssetPhysics.h`

Hair Simulation Solver

**Properties** (1):
  - `enable_simulation`: `bool` — [Read-Write] Enable the simulation of the groom groups/LODs if both this boolean and the one in the ...

### `unreal.HairSolverSettings`
Inherits: `StructBase` | Header: `GroomAssetPhysics.h`

Hair Solver Settings

### `unreal.HairStrandsParameters`
Inherits: `StructBase` | Header: `GroomAssetPhysics.h`

Hair Strands Parameters

### `unreal.HairStretchConstraint`
Inherits: `StructBase` | Header: `GroomAssetPhysics.h`

Hair Stretch Constraint

### `unreal.MovieSceneGroomCacheParams`
Inherits: `StructBase` | Header: `MovieSceneGroomCacheSection.h`

Movie Scene Groom Cache Params

### `unreal.GroomActor`
Inherits: `Actor` | Header: `GroomActor.h`

An actor that renders a simulated hair

**Properties** (1):
  - `groom_component`: `GroomComponent` [Read-Only] — [Read-Only] Strand hair component that performs simulation and rendering (GroomComponent)

### `unreal.GroomAsset`
Inherits: `Object` | Header: `GroomAsset.h`

Implements an asset that can be used to store hair strands

**Methods** (3):
  - `add_asset_user_data_of_class(user_data_class)` -> `bool` — Creates and adds an instance of the provided AssetUserData class to the target asset.
  - `get_asset_user_data_of_class(user_data_class)` -> `AssetUserData` — Returns an instance of the provided AssetUserData class if itâs contained in the target asset.
  - `has_asset_user_data_of_class(user_data_class)` -> `bool` — Checks whether or not an instance of the provided AssetUserData class is contained.

**Properties** (12):
  - `deformed_skeletal_mesh`: `SkeletalMesh` — âdeformed_skeletal_meshâ was renamed to ârigged_skeletal_meshâ. deprecated
  - `enable_global_interpolation`: `bool` — [Read-Write] Enable radial basis function interpolation to be used instead of the local skin rigid t...
  - `enable_simulation_cache`: `bool` — [Read-Write] Enable guide-cache support. This allows to attach a simulation-cache dynamically at run...
  - `hair_groups_cards`: `None` — [Read-Write] (Array[HairGroupsCardsSourceDescription])
  - `hair_groups_interpolation`: `None` — [Read-Write] (Array[HairGroupsInterpolation])
  - `hair_groups_lod`: `None` — [Read-Write] (Array[HairGroupsLOD])
  - `hair_groups_materials`: `None` — [Read-Write] (Array[HairGroupsMaterial])
  - `hair_groups_meshes`: `None` — [Read-Write] (Array[HairGroupsMeshesSourceDescription])
  - `hair_groups_physics`: `None` — [Read-Write] (Array[HairGroupsPhysics])
  - `hair_groups_rendering`: `None` — [Read-Write] (Array[HairGroupsRendering])
  - `hair_interpolation_type`: `GroomInterpolationType` — [Read-Write] Type of interpolation used (WIP) (GroomInterpolationType)
  - `rigged_skeletal_mesh`: `SkeletalMesh` [Read-Only] — [Read-Only] (SkeletalMesh)

### `unreal.GroomAssetImportData`
Inherits: `AssetImportData` | Header: `GroomAssetImportData.h`

Groom Asset Import Data

### `unreal.GroomBindingAsset`
Inherits: `Object` | Header: `GroomBindingAsset.h`

Implements an asset that can be used to store binding information between a groom and a skeletal mesh

**Methods** (1):
  - `build(completion_delegate)` -> `None` — Build/rebuild a binding asset. Avoid calling Build again while a build is already in progress on this asset, as this wil...

**Properties** (14):
  - `groom`: `GroomAsset` — [Read-Write] (GroomAsset)
  - `groom_binding_type`: `GroomBindingMeshType` [Read-Only] — [Read-Only] (GroomBindingMeshType)
  - `group_infos`: `None` — [Read-Write] (Array[GoomBindingGroupInfo])
  - `matching_section`: `int` [Read-Only] — [Read-Only] (int32)
  - `num_interpolation_points`: `int` [Read-Only] — [Read-Only] (int32)
  - `source_geometry_cache`: `GeometryCache` [Read-Only] — [Read-Only] (GeometryCache)
  - `source_mesh_requested_lod`: `int` — [Read-Write] (int32)
  - `source_mesh_used_lod`: `int` [Read-Only] — [Read-Only] (int32)
  - `source_skeletal_mesh`: `SkeletalMesh` — [Read-Write] (SkeletalMesh)
  - `target_binding_attribute`: `Name` — [Read-Write] (Name)
  - `target_geometry_cache`: `GeometryCache` [Read-Only] — [Read-Only] (GeometryCache)
  - `target_mesh_requested_min_lod`: `int` — [Read-Write] (int32)
  - `target_mesh_used_min_lod`: `int` [Read-Only] — [Read-Only] (int32)
  - `target_skeletal_mesh`: `SkeletalMesh` — [Read-Write] (SkeletalMesh)

### `unreal.GroomBindingAssetList`
Inherits: `Object` | Header: `GroomBindingAsset.h`

Groom Binding Asset List

### `unreal.GroomCache`
Inherits: `Object` | Header: `GroomCache.h`

Implements an asset that is used to store an animated groom

**Methods** (3):
  - `add_asset_user_data_of_class(user_data_class)` -> `bool` — Creates and adds an instance of the provided AssetUserData class to the target asset.
  - `get_asset_user_data_of_class(user_data_class)` -> `AssetUserData` — Returns an instance of the provided AssetUserData class if itâs contained in the target asset.
  - `has_asset_user_data_of_class(user_data_class)` -> `bool` — Checks whether or not an instance of the provided AssetUserData class is contained.

### `unreal.GroomCacheImportData`
Inherits: `AssetImportData` | Header: `GroomCacheImportOptions.h`

The asset import data to store the import settings within the GroomCache asset

### `unreal.GroomCacheImportOptions`
Inherits: `Object` | Header: `GroomCacheImportOptions.h`

Groom Cache Import Options

**Properties** (1):
  - `import_settings`: `GroomCacheImportSettings` — [Read-Write] (GroomCacheImportSettings)

### `unreal.GroomComponent`
Inherits: `MeshComponent` | Header: `GroomComponent.h`

Groom Component

**Methods** (13):
  - `add_collision_component(skeletal_mesh_component)` -> `None` — Add a skeletal mesh to the collision components
  - `get_is_hair_length_scale_enabled()` -> `bool` — Get Is Hair Length Scale Enabled
  - `get_niagara_component(group_index)` -> `NiagaraComponent` — Given the group index return the matching niagara component
  - `reset_collision_components()` -> `None` — Reset the collision components
  - `reset_simulation()` -> `None` — Reset the simulation, if enabled
  - `set_binding_asset(binding)` -> `None` — Accessor function for changing Groom binding asset from blueprint/sequencer
  - `set_enable_simulation(enable_simulation)` -> `None` — Accessor function for changing the enable simulation flag from blueprint/sequencer
  - `set_groom_asset(asset)` -> `None` — Accessor function for changing Groom asset from blueprint/sequencer
  - `set_groom_cache(groom_cache)` -> `None` — Accessor function for changing GroomCache asset from blueprint/sequencer
  - `set_hair_length_scale(scale)` -> `None` — Accessor function for changing hair length scale from blueprint/sequencer
  - `set_hair_length_scale_enable(enable)` -> `None` — Set Hair Length Scale Enable
  - `set_mesh_deformer(mesh_deformer)` -> `None` — Change the MeshDeformer that is used for this Component.
  - `set_physics_asset(physics_asset)` -> `None` — Accessor function for changing Groom physics asset from blueprint/sequencer

**Properties** (12):
  - `attachment_name`: `str` — [Read-Write] Optional socket name, where the groom component should be attached at, when parented wi...
  - `binding_asset`: `GroomBindingAsset` [Read-Only] — [Read-Only] Optional binding asset for binding a groom onto a skeletal mesh. If the binding asset is...
  - `groom_asset`: `GroomAsset` — [Read-Write] Groom asset . (GroomAsset)
  - `groom_cache`: `GroomCache` — [Read-Write] (GroomCache)
  - `groom_groups_desc`: `None` — [Read-Write] Groomâs groups info. (Array[HairGroupDesc])
  - `hair_strands_asset`: `GroomAsset` — âhair_strands_assetâ was renamed to âgroom_assetâ. deprecated
  - `mesh_deformer`: `MeshDeformer` [Read-Only] — [Read-Only] Mesh deformer that will be applied on groom instance for deformation. Enable the groom a...
  - `mesh_deformer_instance`: `MeshDeformerInstance` [Read-Only] — [Read-Only] Object containing state for the bound MeshDeformer. (MeshDeformerInstance)
  - `mesh_deformer_instance_settings`: `MeshDeformerInstanceSettings` [Read-Only] — [Read-Only] Object containing instance settings for the bound MeshDeformer. (MeshDeformerInstanceSet...
  - `physics_asset`: `PhysicsAsset` — [Read-Write] Physics asset to be used for hair simulation (PhysicsAsset)
  - `simulation_settings`: `HairSimulationSettings` — [Read-Write] Groomâs simulation settings (HairSimulationSettings)
  - `use_cards`: `bool` — [Read-Write] Force the groom to use cards/meshes geometry instead of strands. (bool)

### `unreal.GroomCreateBindingOptions`
Inherits: `Object` | Header: `GroomCreateBindingOptions.h`

Groom Create Binding Options

**Properties** (8):
  - `groom_binding_type`: `GroomBindingMeshType` — [Read-Write] Type of mesh to create groom binding for (GroomBindingMeshType)
  - `matching_section`: `int` — [Read-Write] Section to pick to transfer the position (int32)
  - `num_interpolation_points`: `int` — [Read-Write] Number of points used for the rbf interpolation (int32)
  - `source_geometry_cache`: `GeometryCache` — [Read-Write] GeometryCache on which the groom has been authored (GeometryCache)
  - `source_skeletal_mesh`: `SkeletalMesh` — [Read-Write] Skeletal mesh on which the groom has been authored. This is optional, and used only if ...
  - `target_binding_attribute`: `Name` — [Read-Write] Optional mesh attribute used to filter triangles to bind groom to (Name)
  - `target_geometry_cache`: `GeometryCache` — [Read-Write] GeometryCache on which the groom is attached to. (GeometryCache)
  - `target_skeletal_mesh`: `SkeletalMesh` — [Read-Write] Skeletal mesh on which the groom is attached to. (SkeletalMesh)

### `unreal.GroomCreateFollicleMaskOptions`
Inherits: `Object` | Header: `GroomCreateFollicleMaskOptions.h`

Groom Create Follicle Mask Options

**Properties** (3):
  - `grooms`: `None` — [Read-Write] Grooms which will be use to create the follicle texture (Array[FollicleMaskOptions])
  - `resolution`: `int` — [Read-Write] Follicle mask texture resolution. The resolution will be rounded to the closest power o...
  - `root_radius`: `int` — [Read-Write] Size of the root in the follicle mask (in pixels) (int32)

### `unreal.GroomCreateStrandsTexturesOptions`
Inherits: `Object` | Header: `GroomCreateStrandsTexturesOptions.h`

Groom Create Strands Textures Options

**Properties** (13):
  - `dilation`: `int` — [Read-Write] Number pixels expanded by the post-process dilation (0..64). (int32)
  - `generated_textures`: `None` — [Read-Write] Generated texure. (Array[Texture2D])
  - `group_index`: `None` — [Read-Write] Groom index which should be baked into the textures. When the array is empty, all group...
  - `layout`: `HairTextureLayout` — [Read-Write] Resolution of the output texture maps (tangent, coverage, â¦) (HairTextureLayout)
  - `lod_index`: `int` — [Read-Write] LOD of the mesh, on which the texture projection is done (int32)
  - `mesh_type`: `StrandsTexturesMeshType` — [Read-Write] Select which mesh should be used for tracing (StrandsTexturesMeshType)
  - `resolution`: `int` — [Read-Write] Resolution of the output texture maps (tangent, coverage, â¦) (int32)
  - `section_index`: `int` — [Read-Write] Section of the mesh, on which the texture projection is done (int32)
  - `skeletal_mesh`: `SkeletalMesh` — [Read-Write] Mesh on which the groom strands will be projected on. If non empty, the skeletal mesh w...
  - `static_mesh`: `StaticMesh` — [Read-Write] Mesh on which the groom strands will be projected on. If non empty and if the skeletal ...
  - `trace_distance`: `float` — [Read-Write] Distance from the mesh surface until hair are projected onto the mesh. (float)
  - `trace_type`: `StrandsTexturesTraceType` — either from the meshâs surface to the outside, or from the meshâs surface to the inside. (Strand...
  - `uv_channel_index`: `int` — [Read-Write] UV channel to use (int32)

### `unreal.GroomHairGroupsMapping`
Inherits: `Object` | Header: `GroomImportOptions.h`

Groom Hair Groups Mapping

**Properties** (4):
  - `new_group_names`: `None` — [Read-Write] (Array[Name])
  - `new_to_old_group_index_mapping`: `None` — [Read-Write] (Array[int32])
  - `old_group_names`: `None` — [Read-Write] (Array[Name])
  - `old_to_new_group_index_mapping`: `None` — [Read-Write] (Array[int32])

### `unreal.GroomHairGroupsPreview`
Inherits: `Object` | Header: `GroomImportOptions.h`

Groom Hair Groups Preview

**Properties** (1):
  - `groups`: `None` — [Read-Write] (Array[GroomHairGroupPreview])

### `unreal.GroomImportOptions`
Inherits: `Object` | Header: `GroomImportOptions.h`

Groom Import Options

**Properties** (2):
  - `conversion_settings`: `GroomConversionSettings` — [Read-Write] (GroomConversionSettings)
  - `interpolation_settings`: `None` [Read-Only] — [Read-Only] Interpolation settings per group (Array[HairGroupsInterpolation])

### `unreal.GroomLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `GroomBlueprintLibrary.h`

Groom Blueprint Library

**Methods** (5):
  - `create_new_geometry_cache_groom_binding_asset(groom_asset, geometry_cache, num_interpolation_points = 100, source_geometry_cache_for_transfer = None, matching_section = 0)` -> `GroomBindingAsset` [classmethod] — Create a new groom binding asset within the contents space of the project. The asset name will be auto generated based o...
  - `create_new_geometry_cache_groom_binding_asset_with_path(desired_package_path, groom_asset, geometry_cache, num_interpolation_points = 100, source_geometry_cache_for_transfer = None, matching_section = 0)` -> `GroomBindingAsset` [classmethod] — Create a new groom binding asset within the contents space of the project.
  - `create_new_groom_binding_asset(groom_asset, skeletal_mesh, num_interpolation_points = 100, source_skeletal_mesh_for_transfer = None, matching_section = 0)` -> `GroomBindingAsset` [classmethod] — Create a new groom binding asset within the contents space of the project. The asset name will be auto generated based o...
  - `create_new_groom_binding_asset_with_path(desired_package_path, groom_asset, skeletal_mesh, num_interpolation_points = 100, source_skeletal_mesh_for_transfer = None, matching_section = 0)` -> `GroomBindingAsset` [classmethod] — Create a new groom binding asset within the contents space of the project.
  - `is_hair_strands_supported_in_world(world_context_object)` -> `bool` [classmethod] — Check for strands support in the world of a given Actor Component

### `unreal.HairCardGenerationSettings`
Inherits: `Object` | Header: `GroomAssetCards.h`

Since hair-card generation can be controlled external to this plugin, this provides a way for those external generators a way to store their own generation data along with the groom/cards-entry.

### `unreal.MovieSceneGroomCacheSection`
Inherits: `MovieSceneSection` | Header: `MovieSceneGroomCacheSection.h`

Movie scene section that control GroomCache playback

### `unreal.MovieSceneGroomCacheTrack`
Inherits: `MovieSceneNameableTrack` | Header: `MovieSceneGroomCacheTrack.h`

Handles animation of GroomCache

### `unreal.FollicleMaskChannel`
Inherits: `EnumBase` | Header: `GroomCreateFollicleMaskOptions.h`

List of channel

**Properties** (4):
  - `A`: `FollicleMaskChannel = Ellipsis` — 3
  - `B`: `FollicleMaskChannel = Ellipsis` — 2
  - `G`: `FollicleMaskChannel = Ellipsis` — 1
  - `R`: `FollicleMaskChannel = Ellipsis` — 0

### `unreal.GroomBasisType`
Inherits: `EnumBase` | Header: `GroomCacheData.h`

EGroom Basis Type

**Properties** (6):
  - `BEZIER_BASIS`: `GroomBasisType = Ellipsis` — 1
  - `BSPLINE_BASIS`: `GroomBasisType = Ellipsis` — 2
  - `CATMULLROM_BASIS`: `GroomBasisType = Ellipsis` — 3
  - `HERMITE_BASIS`: `GroomBasisType = Ellipsis` — 4
  - `NO_BASIS`: `GroomBasisType = Ellipsis` — 0
  - `POWER_BASIS`: `GroomBasisType = Ellipsis` — 5

### `unreal.GroomBindingAssetBuildResult`
Inherits: `EnumBase` | Header: `GroomBindingAsset.h`

EGroom Binding Asset Build Result

**Properties** (2):
  - `FAILED`: `GroomBindingAssetBuildResult = Ellipsis` — 1
  - `SUCCEEDED`: `GroomBindingAssetBuildResult = Ellipsis` — 0

### `unreal.GroomBindingMeshType`
Inherits: `EnumBase` | Header: `GroomBindingAsset.h`

Enum that describes the type of mesh to bind to

**Properties** (2):
  - `GEOMETRY_CACHE`: `GroomBindingMeshType = Ellipsis` — 1
  - `SKELETAL_MESH`: `GroomBindingMeshType = Ellipsis` — 0

### `unreal.GroomBindingType`
Inherits: `EnumBase` | Header: `GroomAssetInterpolation.h`

EGroom Binding Type

**Properties** (2):
  - `RIGID`: `GroomBindingType = Ellipsis` — When attached to a skeltal mesh, the hair follow the provided attachement name 1
  - `SKINNING`: `GroomBindingType = Ellipsis` — When attached to a skeltal mesh, the hair follow the skin surface 2

### `unreal.GroomCacheAttributes`
Inherits: `EnumBase` | Header: `GroomCacheData.h`

Attributes in groom that can be animated

**Properties** (8):
  - `COLOR`: `GroomCacheAttributes = Ellipsis` — 4
  - `NONE`: `GroomCacheAttributes = Ellipsis` — 0
  - `POSITION`: `GroomCacheAttributes = Ellipsis` — 1
  - `POSITION_COLOR`: `GroomCacheAttributes = Ellipsis` — 5
  - `POSITION_WIDTH`: `GroomCacheAttributes = Ellipsis` — For display names 3
  - `POSITION_WIDTH_COLOR`: `GroomCacheAttributes = Ellipsis` — 7
  - `WIDTH`: `GroomCacheAttributes = Ellipsis` — 2
  - `WIDTH_COLOR`: `GroomCacheAttributes = Ellipsis` — 5

### `unreal.GroomCacheImportType`
Inherits: `EnumBase` | Header: `GroomCacheImportOptions.h`

EGroom Cache Import Type

**Properties** (3):
  - `ALL`: `GroomCacheImportType = Ellipsis` — 3
  - `GUIDES`: `GroomCacheImportType = Ellipsis` — 2
  - `STRANDS`: `GroomCacheImportType = Ellipsis` — 1

### `unreal.GroomCacheType`
Inherits: `EnumBase` | Header: `GroomCacheData.h`

Types of GroomCache Strands: animated render strands (including animatable hair attributes) Guides: animated guides that require in-engine simulation (position only)

**Properties** (3):
  - `GUIDES`: `GroomCacheType = Ellipsis` — 2
  - `NONE`: `GroomCacheType = Ellipsis` — 0
  - `STRANDS`: `GroomCacheType = Ellipsis` — 1

### `unreal.GroomCurveType`
Inherits: `EnumBase` | Header: `GroomCacheData.h`

EGroom Curve Type

**Properties** (3):
  - `CUBIC`: `GroomCurveType = Ellipsis` — 0
  - `LINEAR`: `GroomCurveType = Ellipsis` — 1
  - `VARIABLE_ORDER`: `GroomCurveType = Ellipsis` — 2

### `unreal.GroomGeometryType`
Inherits: `EnumBase` | Header: `GroomAssetInterpolation.h`

EGroom Geometry Type

**Properties** (3):
  - `CARDS`: `GroomGeometryType = Ellipsis` — 1
  - `MESHES`: `GroomGeometryType = Ellipsis` — 2
  - `STRANDS`: `GroomGeometryType = Ellipsis` — 0

### `unreal.GroomGuideType`
Inherits: `EnumBase` | Header: `GroomAssetInterpolation.h`

EGroom Guide Type

**Properties** (3):
  - `GENERATED`: `GroomGuideType = Ellipsis` — Generate guides from imported strands 1
  - `IMPORTED`: `GroomGuideType = Ellipsis` — Use imported asset guides. 0
  - `RIGGED`: `GroomGuideType = Ellipsis` — Generated rigged guides from imported strands 2

### `unreal.GroomInterpolationQuality`
Inherits: `EnumBase` | Header: `GroomSettings.h`

EGroom Interpolation Quality

**Properties** (3):
  - `HIGH`: `GroomInterpolationQuality = Ellipsis` — Build interpolation data using curve shape matching search. This result in high quality interpolatio...
  - `LOW`: `GroomInterpolationQuality = Ellipsis` — Build interpolation data based on nearst neighbor search. Low quality interpolation data, but fast t...
  - `MEDIUM`: `GroomInterpolationQuality = Ellipsis` — Build interpolation data using curve shape matching search but within a limited spatial range. This ...

### `unreal.GroomInterpolationType`
Inherits: `EnumBase` | Header: `GroomAssetPhysics.h`

List of interpolation type

**Properties** (4):
  - `NONE`: `GroomInterpolationType = Ellipsis` — 0
  - `OFFSET_TRANSFORM`: `GroomInterpolationType = Ellipsis` — 4
  - `RIGID_TRANSFORM`: `GroomInterpolationType = Ellipsis` — 2
  - `SMOOTH_TRANSFORM`: `GroomInterpolationType = Ellipsis` — 8

### `unreal.GroomInterpolationWeight`
Inherits: `EnumBase` | Header: `GroomSettings.h`

EGroom Interpolation Weight

**Properties** (3):
  - `INDEX`: `GroomInterpolationWeight = Ellipsis` — Build interpolation data based on guide and strands vertex indices 2
  - `PARAMETRIC`: `GroomInterpolationWeight = Ellipsis` — Build interpolation data based on curve parametric distance 0
  - `ROOT`: `GroomInterpolationWeight = Ellipsis` — Build interpolation data based on distance between guideâs root and strandsâs root 1

### `unreal.GroomLODMode`
Inherits: `EnumBase` | Header: `GroomAssetInterpolation.h`

EGroom LODMode

**Properties** (3):
  - `AUTO`: `GroomLODMode = Ellipsis` — Hair strands curves & points automatically adapt based on screen coverage. LOD settings are ignored....
  - `DEFAULT`: `GroomLODMode = Ellipsis` — Hair strands curves & points adapt based on project settings LOD mode. (See âUse Auto LODâ in pr...
  - `MANUAL`: `GroomLODMode = Ellipsis` — Hair strands curves & points adapt based on LOD settings 1

### `unreal.GroomNiagaraSolvers`
Inherits: `EnumBase` | Header: `GroomAssetPhysics.h`

List of niagara solvers

**Properties** (3):
  - `ANGULAR_SPRINGS`: `GroomNiagaraSolvers = Ellipsis` — 4
  - `COSSERAT_RODS`: `GroomNiagaraSolvers = Ellipsis` — 2
  - `CUSTOM_SOLVER`: `GroomNiagaraSolvers = Ellipsis` — 8

### `unreal.GroomOverrideType`
Inherits: `EnumBase` | Header: `GroomAssetInterpolation.h`

EGroom Override Type

**Properties** (3):
  - `AUTO`: `GroomOverrideType = Ellipsis` — Use the asset value 0
  - `DISABLE`: `GroomOverrideType = Ellipsis` — Override the asset value, and force disabled 2
  - `ENABLE`: `GroomOverrideType = Ellipsis` — Override the asset value, and force enabled 1

### `unreal.GroomStrandsSize`
Inherits: `EnumBase` | Header: `GroomAssetPhysics.h`

Size of each strands

**Properties** (5):
  - `SIZE16`: `GroomStrandsSize = Ellipsis` — 16
  - `SIZE2`: `GroomStrandsSize = Ellipsis` — 2
  - `SIZE32`: `GroomStrandsSize = Ellipsis` — 32
  - `SIZE4`: `GroomStrandsSize = Ellipsis` — 4
  - `SIZE8`: `GroomStrandsSize = Ellipsis` — 8

### `unreal.HairAtlasTextureType`
Inherits: `EnumBase` | Header: `GroomAsset.h`

EHair Atlas Texture Type

**Properties** (6):
  - `ATTRIBUTE`: `HairAtlasTextureType = Ellipsis` — 2
  - `AUXILARY_DATA`: `HairAtlasTextureType = Ellipsis` — 4
  - `COVERAGE`: `HairAtlasTextureType = Ellipsis` — 3
  - `DEPTH`: `HairAtlasTextureType = Ellipsis` — 0
  - `MATERIAL`: `HairAtlasTextureType = Ellipsis` — 5
  - `TANGENT`: `HairAtlasTextureType = Ellipsis` — 1

### `unreal.HairCardsGuideType`
Inherits: `EnumBase` | Header: `GroomAssetCards.h`

EHair Cards Guide Type

**Properties** (2):
  - `GENERATED`: `HairCardsGuideType = Ellipsis` — 0
  - `GUIDE_BASED`: `HairCardsGuideType = Ellipsis` — 1

### `unreal.HairCardsSourceType`
Inherits: `EnumBase` | Header: `GroomAssetCards.h`

EHair Cards Source Type

**Properties** (2):
  - `IMPORTED`: `HairCardsSourceType = Ellipsis` — 1
  - `PROCEDURAL`: `HairCardsSourceType = Ellipsis` — 0

### `unreal.HairInterpolationQuality`
Inherits: `EnumBase` | Header: `GroomAssetInterpolation.h`

EHair Interpolation Quality

**Properties** (3):
  - `HIGH`: `HairInterpolationQuality = Ellipsis` — Build interpolation data using curve shape matching search. This result in high quality interpolatio...
  - `LOW`: `HairInterpolationQuality = Ellipsis` — Build interpolation data based on nearst neighbor search. Low quality interpolation data, but fast t...
  - `MEDIUM`: `HairInterpolationQuality = Ellipsis` — Build interpolation data using curve shape matching search but within a limited spatial range. This ...

### `unreal.HairInterpolationWeight`
Inherits: `EnumBase` | Header: `GroomAssetInterpolation.h`

EHair Interpolation Weight

**Properties** (4):
  - `DISTANCE`: `HairInterpolationWeight = Ellipsis` — Build interpolation data based on curve euclidean distance 3
  - `INDEX`: `HairInterpolationWeight = Ellipsis` — Build interpolation data based on guide and strands vertex indices 2
  - `PARAMETRIC`: `HairInterpolationWeight = Ellipsis` — Build interpolation data based on curve parametric distance 0
  - `ROOT`: `HairInterpolationWeight = Ellipsis` — Build interpolation data based on distance between guideâs root and strandsâs root 1

### `unreal.HairTextureLayout`
Inherits: `EnumBase` | Header: `GroomAssetCards.h`

EHair Texture Layout

**Properties** (4):
  - `LAYOUT0`: `HairTextureLayout = Ellipsis` — 0
  - `LAYOUT1`: `HairTextureLayout = Ellipsis` — 1
  - `LAYOUT2`: `HairTextureLayout = Ellipsis` — 2
  - `LAYOUT3`: `HairTextureLayout = Ellipsis` — 3

### `unreal.StrandsTexturesMeshType`
Inherits: `EnumBase` | Header: `GroomCreateStrandsTexturesOptions.h`

Size of each strands

**Properties** (2):
  - `SKELETAL`: `StrandsTexturesMeshType = Ellipsis` — 1
  - `STATIC`: `StrandsTexturesMeshType = Ellipsis` — 0

### `unreal.StrandsTexturesTraceType`
Inherits: `EnumBase` | Header: `GroomCreateStrandsTexturesOptions.h`

Size of each strands

**Properties** (3):
  - `TRACE_BIDIRECTIONAL`: `StrandsTexturesTraceType = Ellipsis` — 2
  - `TRACE_INSIDE`: `StrandsTexturesTraceType = Ellipsis` — 0
  - `TRACE_OUSIDE`: `StrandsTexturesTraceType = Ellipsis` — 1

### `unreal.OnGroomBindingAssetBuildComplete`
Inherits: `DelegateBase` | Header: `GroomBindingAsset.h`

On Groom Binding Asset Build Complete Delegate Signature
