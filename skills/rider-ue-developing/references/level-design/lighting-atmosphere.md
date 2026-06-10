# Lighting and Atmosphere

Complete reference for Unreal Engine lighting, atmosphere, fog, sky, and post-processing systems for level design automation.

---

## Directional Light (Sun) Setup

The directional light represents the sun (or moon) and is the primary light source for outdoor levels.

### Spawning and Configuring

```python
import unreal
el = unreal.EditorLevelLibrary

sun = el.spawn_actor_from_class(unreal.DirectionalLight, unreal.Vector(0, 0, 1000))

# Set rotation for typical afternoon sun
# Pitch controls elevation (-90 = noon overhead, -20 = near horizon)
# Yaw controls compass direction
sun.set_actor_rotation(unreal.Rotator(-50, -30, 0), False)

# Access light component
light_comp = sun.light_component
light_comp.set_editor_property("intensity", 10.0)  # Lux units
light_comp.set_editor_property("light_color", unreal.Color(255, 245, 235, 255))
light_comp.set_editor_property("atmosphere_sun_light", True)  # Link to sky atmosphere
light_comp.set_editor_property("atmosphere_sun_light_index", 0)  # Sun = 0, Moon = 1
```

### Key Properties

| Property | Description | Typical Value |
|----------|-------------|---------------|
| `Intensity` | Brightness in Lux | 10.0 (outdoor sun) |
| `Light Color` | Color temperature | Warm white (255, 245, 235) |
| `Atmosphere Sun Light` | Link to sky atmosphere | True for outdoor |
| `Atmosphere Sun Light Index` | 0 = primary (sun), 1 = secondary (moon) | 0 |
| `Cast Shadows` | Enable shadow casting | True |
| `Source Angle` | Angular size, affects shadow softness | 0.5353 (real sun) |
| `Shadow Cascades` | Number of cascaded shadow maps | 3-5 for open world |
| `Dynamic Shadow Distance` | Max distance for dynamic shadows | 20000-50000 |
| `Volumetric Scattering Intensity` | God ray strength | 1.0 |

### Shadow Configuration

For large open worlds, configure cascaded shadow maps:
- `Dynamic Shadow Distance StationaryLight`: controls max shadow distance
- `Cascade Distribution Exponent`: 1.0 = even, higher = more detail near camera
- `Num Dynamic Shadow Cascades`: 3 for medium, 5 for high quality
- `Far Shadow Distance`: for ultra-distance shadows (mountains)

---

## Sky Atmosphere

The `SkyAtmosphere` actor provides physically-based atmospheric scattering.

### Setup

```python
import unreal
el = unreal.EditorLevelLibrary

sky_atmos = el.spawn_actor_from_class(unreal.SkyAtmosphere, unreal.Vector(0, 0, 0))
# Sky Atmosphere has no meaningful position -- place at origin
```

### Key Properties

| Property | Description | Effect |
|----------|-------------|--------|
| `Ground Radius` | Planet radius in km | 6360 (Earth) |
| `Atmosphere Height` | Atmosphere thickness in km | 60 (Earth) |
| `Rayleigh Scattering` | Small particle scattering (blue sky) | RGB vector |
| `Rayleigh Exponential Distribution` | Height falloff for Rayleigh | 8.0 (Earth) |
| `Mie Scattering` | Large particle scattering (haze) | Single float |
| `Mie Absorption` | Light absorption by large particles | Affects sunset color |
| `Mie Exponential Distribution` | Height falloff for Mie | 1.2 |
| `Mie Anisotropy` | Directionality of Mie scattering | 0.8 (forward scatter) |
| `Art Direction` | Ground albedo override | Use for alien sky colors |

### Alien/Stylized Atmospheres

Override scattering values for non-Earth atmospheres:
- Red sky: increase red Rayleigh, decrease blue
- Thick atmosphere: increase Mie scattering and reduce exponential distribution
- Thin atmosphere: decrease atmosphere height, reduce all scattering
- Multiple suns: use two directional lights with `Atmosphere Sun Light Index` 0 and 1

---

## Volumetric Clouds

The `VolumetricCloud` actor renders realistic 3D clouds.

### Setup

```python
import unreal
el = unreal.EditorLevelLibrary

clouds = el.spawn_actor_from_class(unreal.VolumetricCloud, unreal.Vector(0, 0, 0))
```

### Key Properties

| Property | Description | Typical Value |
|----------|-------------|---------------|
| `Layer Bottom Altitude` | Cloud base height in km | 5.0 |
| `Layer Height` | Cloud layer thickness in km | 10.0 |
| `Tracing Start Max Distance` | Max render distance in km | 350 |
| `Tracing Max Distance` | Ray march max distance | 50 |
| `Material` | Cloud volume material | Default or custom |

### Cloud Material

The default cloud material uses noise textures for shape. For custom clouds:
1. Create a material with `Volume` domain
2. Use `CloudLayer` material function for basic setup
3. Combine 3D noise textures at different scales for detail
4. Reference weather map textures for regional cloud coverage control

### Performance

- Volumetric clouds are expensive; budget 1-3 ms GPU
- Reduce `Tracing Max Distance` for better performance
- Use temporal reprojection (enabled by default) to amortize cost
- Half-resolution tracing helps on lower-end hardware

---

## Exponential Height Fog

Adds distance-based and height-based atmospheric fog.

### Setup

```python
import unreal
el = unreal.EditorLevelLibrary

fog = el.spawn_actor_from_class(unreal.ExponentialHeightFog, unreal.Vector(0, 0, 200))

fog_comp = fog.component
fog_comp.set_editor_property("fog_density", 0.02)
fog_comp.set_editor_property("fog_height_falloff", 0.2)
fog_comp.set_fog_inscattering_color(unreal.LinearColor(0.45, 0.55, 0.7, 1.0))
fog_comp.set_editor_property("enable_volumetric_fog", True)
```

### Key Properties

| Property | Description | Typical Value |
|----------|-------------|---------------|
| `Fog Density` | Overall fog thickness | 0.02 |
| `Fog Height Falloff` | Vertical density decay rate | 0.2 |
| `Fog Max Opacity` | Maximum fog alpha | 1.0 |
| `Start Distance` | Distance before fog begins | 0 |
| `Fog Inscattering Color` | Fog color | Slight blue tint |
| `Directional Inscattering` | Sun glow through fog | Enable for god rays |
| `Volumetric Fog` | Enable 3D volumetric fog | True for modern projects |
| `Volumetric Fog Scattering Distribution` | Anisotropy of volumetric fog | 0.2 |
| `Volumetric Fog View Distance` | Max distance for volumetric effects | 6000 |

### Second Fog Layer

Enable a second fog layer for ground-level mist:
- `Second Fog Density`: lower density for ground haze
- `Second Fog Height Falloff`: higher falloff to keep mist low
- `Second Fog Height Offset`: Z offset for the second layer

### Volumetric Fog

When `Volumetric Fog` is enabled:
- Local lights contribute to fog (spotlights create visible beams)
- Light shafts from directional light work through the fog volume
- Cost scales with `View Distance` and screen resolution
- Use `Volumetric Fog Albedo` to tint scattered light color

---

## Skylights

Skylights capture or simulate ambient light from the sky dome.

### Captured vs Real-Time

| Mode | Description | Performance | Quality |
|------|-------------|-------------|---------|
| `Captured` | Bakes a cubemap of the sky | Very cheap | Static only |
| `Real-Time Capture` | Updates cubemap every frame | Moderate cost | Dynamic sky support |

### Setup

```python
import unreal
el = unreal.EditorLevelLibrary

skylight = el.spawn_actor_from_class(unreal.SkyLight, unreal.Vector(0, 0, 500))
sl_comp = skylight.light_component
sl_comp.set_editor_property("source_type", unreal.SkyLightSourceType.SLS_CAPTURED_SCENE)
sl_comp.set_editor_property("real_time_capture", True)  # For dynamic sky
sl_comp.set_editor_property("intensity_scale", 1.0)
sl_comp.set_editor_property("lower_hemisphere_is_black", True)
sl_comp.set_editor_property("lower_hemisphere_color", unreal.LinearColor(0.1, 0.08, 0.06, 1.0))
```

### Best Practices

- Always pair Sky Light with Sky Atmosphere for outdoor levels
- Use `Real-Time Capture` if you have dynamic time-of-day
- `lower_hemisphere_is_black` prevents light bleeding from below ground
- Recapture after significant lighting changes: `skylight.recapture_sky()`
- Indoor scenes: use `Specified Cubemap` source type with a custom HDRI

---

## Light Types: Point, Spot, Rect

### Point Lights

```python
import unreal
el = unreal.EditorLevelLibrary

point = el.spawn_actor_from_class(unreal.PointLight, unreal.Vector(1000, 0, 300))
lc = point.point_light_component
lc.set_editor_property("intensity", 5000.0)  # Lumens
lc.set_editor_property("attenuation_radius", 1000.0)
lc.set_editor_property("source_radius", 20.0)  # Soft shadow size
lc.set_editor_property("cast_shadows", True)
```

### Spot Lights

```python
spot = el.spawn_actor_from_class(unreal.SpotLight, unreal.Vector(2000, 0, 500))
sc = spot.spot_light_component
sc.set_editor_property("intensity", 10000.0)
sc.set_editor_property("inner_cone_angle", 25.0)
sc.set_editor_property("outer_cone_angle", 35.0)
sc.set_editor_property("attenuation_radius", 2000.0)
```

### Rect Lights

Best for rectangular emissive surfaces (windows, screens, panels):

```python
rect = el.spawn_actor_from_class(unreal.RectLight, unreal.Vector(3000, 0, 300))
rc = rect.rect_light_component
rc.set_editor_property("intensity", 5000.0)
rc.set_editor_property("source_width", 200.0)
rc.set_editor_property("source_height", 100.0)
rc.set_editor_property("barn_door_angle", 80.0)
rc.set_editor_property("barn_door_length", 20.0)
```

### IES Profiles

All light types support IES profiles for realistic light distribution:

```python
ies = unreal.EditorAssetLibrary.load_asset("/Game/Lighting/IES/FloodLight")
lc.set_editor_property("ies_texture", ies)
```

---

## Lumen GI vs Baked Lighting

### Lumen (Dynamic Global Illumination)

Lumen is the default GI system in UE5. No lightmap baking required.

| Setting | Description | Performance Impact |
|---------|-------------|-------------------|
| `Software Ray Tracing` | Screen traces + mesh SDFs | Moderate |
| `Hardware Ray Tracing` | Full GPU RT (RTX/RDNA2) | High, best quality |
| `Lumen Scene Lighting Quality` | 1-4, controls trace count | Scales linearly |
| `Final Gather Quality` | Denoising quality | Higher = cleaner GI |

Enable in Project Settings > Rendering > Global Illumination > Lumen.

### Baked Lighting (Lightmaps)

For projects targeting lower-end hardware or needing zero runtime GI cost:

1. Set all static geometry to `Static` mobility
2. Set lights to `Stationary` or `Static` mobility
3. Build lighting: `unreal.EditorLevelLibrary.build_lighting()`
4. Lightmap resolution per mesh controls quality vs memory

### Choosing Between Them

| Criteria | Lumen | Baked |
|----------|-------|-------|
| Dynamic time-of-day | Yes | No (needs workarounds) |
| Destructible environments | Yes | Artifacts after destruction |
| Mobile platforms | No | Yes |
| Memory usage | Lower (no lightmaps) | Higher (lightmap textures) |
| Build times | None | Minutes to hours |
| Runtime cost | GPU-heavy | Near zero |

---

## Reflection Captures and Probes

### Reflection Capture Actors

Used for fallback reflections and with baked lighting:

```python
import unreal
el = unreal.EditorLevelLibrary

# Sphere reflection capture
sphere_cap = el.spawn_actor_from_class(
    unreal.SphereReflectionCapture, unreal.Vector(1000, 1000, 200)
)
# Set influence radius via the capture component

# Box reflection capture (for rectangular rooms)
box_cap = el.spawn_actor_from_class(
    unreal.BoxReflectionCapture, unreal.Vector(2000, 2000, 200)
)
```

### Lumen Reflections

With Lumen enabled, reflection captures serve as fallback only. Lumen provides:
- Screen-space reflections (fast, limited to visible surfaces)
- Ray-traced reflections (accurate, higher cost)
- Reflection quality controlled by `Lumen Reflection Quality` in post-process

### Planar Reflections

For flat water surfaces or mirrors, use `PlanarReflection` actors. These render the scene from a mirrored viewpoint and are expensive -- use sparingly.

---

## Post-Process Volumes and Profiles

### Global Post-Process Volume

```python
import unreal
el = unreal.EditorLevelLibrary

ppv = el.spawn_actor_from_class(unreal.PostProcessVolume, unreal.Vector(0, 0, 0))
ppv.set_editor_property("unbound", True)  # Affects entire level

settings = ppv.settings

# Exposure
settings.override_auto_exposure_method = True
settings.auto_exposure_method = unreal.AutoExposureMethod.AEM_MANUAL
settings.override_auto_exposure_bias = True
settings.auto_exposure_bias = 1.0

# Color grading
settings.override_white_temp = True
settings.white_temp = 6500.0
settings.override_color_saturation = True
settings.color_saturation = unreal.Vector4(1.0, 1.0, 1.0, 1.0)

# Bloom
settings.override_bloom_intensity = True
settings.bloom_intensity = 0.675
settings.override_bloom_threshold = True
settings.bloom_threshold = 1.0

# Ambient occlusion
settings.override_ambient_occlusion_intensity = True
settings.ambient_occlusion_intensity = 0.5
```

### Local Post-Process Volumes

Use bounded volumes for area-specific effects:
- Cave interiors: darker exposure, higher contrast
- Underwater: blue tint, blur, reduced saturation
- Toxic zones: green tint, vignette, chromatic aberration
- Indoor warm lighting: higher white temp, slight orange tint

Set `Blend Weight` to control transition smoothness and `Priority` for overlapping volumes.

### Post-Process Materials

Apply custom screen-space effects:

```python
settings.override_weighted_blended_post_process_materials = True
# Add material reference to weighted_blended_post_process_materials array
```

---

## Time-of-Day Setup Pattern

### Architecture

A time-of-day system rotates the sun and updates atmosphere/fog/skylight accordingly.

### Component Setup

1. **Directional Light (Sun):** Rotate pitch from 10 (sunrise) to -90 (noon) to -170 (sunset)
2. **Directional Light (Moon):** Opposite rotation, `Atmosphere Sun Light Index = 1`
3. **Sky Atmosphere:** Responds automatically to directional light rotation
4. **Sky Light:** Set to `Real-Time Capture` to track atmosphere changes
5. **Exponential Height Fog:** Animate inscattering color to match sky
6. **Post-Process Volume:** Animate exposure to handle brightness range

### Python Automation for Time-of-Day Preview

```python
import unreal
el = unreal.EditorLevelLibrary

# Find the directional light (sun)
actors = unreal.GameplayStatics.get_all_actors_of_class(
    el.get_editor_world(), unreal.DirectionalLight
)

if actors:
    sun = actors[0]

    # Set to golden hour (sun near horizon)
    sun.set_actor_rotation(unreal.Rotator(-15, -45, 0), False)

    # Set to high noon
    # sun.set_actor_rotation(unreal.Rotator(-90, 0, 0), False)

    # Set to sunset
    # sun.set_actor_rotation(unreal.Rotator(-5, -90, 0), False)

    # Recapture skylight after changing sun position
    skylights = unreal.GameplayStatics.get_all_actors_of_class(
        el.get_editor_world(), unreal.SkyLight
    )
    for sl in skylights:
        sl.light_component.recapture_sky()
```

### Key Considerations

- Sun pitch of 0 or above = below horizon (night)
- Atmosphere automatically computes sunset/sunrise colors based on sun angle
- Fog inscattering color should transition from warm at sunset to cool blue at night
- Exposure needs animation: noon is much brighter than twilight
- Stars/night sky: use a sky material with emissive star texture, blend based on sun elevation
- Moon light intensity should be roughly 0.01-0.1x sun intensity for realism
