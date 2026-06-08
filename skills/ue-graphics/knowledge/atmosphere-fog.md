# Atmospheric Rendering in Unreal Engine

## UE Atmospheric Systems

### Sky Atmosphere
- Component: **SkyAtmosphereComponent** (standalone actor or in level)
- **Rayleigh scattering**: short wavelengths scatter more → blue sky, red sunset
- **Mie scattering**: larger particles → haze, sun disk glow
- Key properties:
  - Ground Albedo: surface color reflected into atmosphere
  - Atmosphere Height: scale of atmosphere (km)
  - Rayleigh/Mie Scale Height: vertical distribution
- Sun disk: controlled by Directional Light with **"Atmosphere Sun Light"** enabled
- Multi-scattering: enabled by default in UE5, improves brightness accuracy
- Aerial perspective: distance-based atmospheric tinting (automatic with Sky Atmosphere)

### Exponential Height Fog
Primary fog system in UE5:
- **Fog Density** + **Fog Height Falloff**: thickness and vertical distribution
- **Second fog layer**: Fog Density 2 + Fog Height Falloff 2 — use for ground mist
- **Fog Inscattering Color**: base fog color
- **Directional Inscattering**: colored scattering toward light source (sun glow through fog)
- **Start Distance**: offset fog start from camera (keep nearby objects clear)
- **Fog Cutoff Distance**: maximum fog effect range

### Volumetric Fog
Enable via `Volumetric Fog = true` on ExponentialHeightFog:
- Raymarched 3D fog using frustum-aligned volume (froxels)
- **Scattering Distribution** (-0.9 to 0.9): phase function, controls forward/back scatter
- **Albedo**: fog particle color
- **Extinction Scale**: how quickly fog absorbs light
- **View Distance**: how far volumetric fog extends from camera
- Per-light interaction: **Volumetric Scattering Intensity** on each light
- Resolution: `r.VolumetricFog.GridPixelSize` (default 8, lower = better but costlier)
- Temporal reprojection: `r.VolumetricFog.HistoryWeight` (0.9 default)

### Local Fog Volumes (UE 5.1+)
- **FogVolume** actor with material for shaped/artistic fog
- Material domain: Volume — uses 3D noise for density
- Use for: localized mist, smoke, ground fog patches without affecting whole scene

### Volumetric Clouds
- **VolumetricCloud** actor
- Layer-based: Bottom/Top altitude, density from cloud material (3D noise)
- Cloud shadow on ground: Shadow Map option
- Performance: expensive — consider static skybox for distant clouds
- CVars: `r.VolumetricCloud.*`

---

## Common Atmospheric Effects

### Depth Fog (In Materials)
- `PixelDepth`: distance camera → current pixel
- `SceneDepth`: distance camera → scene behind pixel
- Manual fog: `Lerp(ObjectColor, FogColor, Saturate(PixelDepth / MaxDistance))`
- Use for: per-material custom attenuation, underwater tinting

### Heat Haze / Distortion
- **Translucent material**: use Refraction pin (IOR-based distortion)
- **Post-process**: offset SceneColor UVs by panning noise texture
  - Noise amplitude controls distortion strength
  - Animate with Panner for shimmer effect
- Use for: fire, desert, engine exhaust, magical portals

### God Rays / Light Shafts
- **Light Shaft Bloom**: on Directional Light (screen-space, cheaper)
- **Volumetric fog + strong directional**: physically-based shafts through fog
- **Light Shaft Occlusion**: darken areas occluded from sun

### Underwater
Post-process volume approach:
- Blue/green color grading (Scene Color Tint)
- Depth-based fog (exponential, blue-green)
- Chromatic aberration (slight)
- UV distortion for refraction (panning noise)
- Caustics: animated texture projected on surfaces via light function or material

---

## CVars Reference

| CVar | Description | Default |
|------|-------------|---------|
| r.VolumetricFog | Enable volumetric fog | 1 |
| r.VolumetricFog.GridPixelSize | Resolution — lower = better quality | 8 |
| r.VolumetricFog.GridSizeZ | Depth slices | 128 |
| r.VolumetricFog.HistoryWeight | Temporal smoothing (higher = smoother, more ghosting) | 0.9 |
| r.VolumetricFog.Jitter | Temporal dithering | 1 |
| r.SkyAtmosphere.AerialPerspectiveLUT | Enable aerial perspective | 1 |
| r.SkyAtmosphere.FastSkyLUT | Fast sky lookup table | 1 |
| r.SkyAtmosphere.SampleCountMax | Max ray samples for sky | 32 |
| r.VolumetricCloud.ShadowMap | Cloud shadow on ground | 1 |
| r.VolumetricCloud.SkyAO | Cloud ambient occlusion | 1 |
| r.Fog.MaxPixelsPerVoxel | Fog voxel resolution | 8 |

## Python Automation

```python
import unreal

# Spawn and configure Exponential Height Fog
fog = unreal.EditorLevelLibrary.spawn_actor_from_class(
    unreal.ExponentialHeightFog, unreal.Vector(0, 0, 0))
comp = fog.get_component_by_class(unreal.ExponentialHeightFogComponent)
comp.set_editor_property('fog_density', 0.02)
comp.set_editor_property('fog_height_falloff', 0.2)
comp.set_editor_property('fog_inscattering_color', unreal.LinearColor(0.5, 0.6, 0.7, 1.0))
comp.set_editor_property('volumetric_fog', True)
comp.set_editor_property('volumetric_fog_scattering_distribution', 0.2)
comp.set_editor_property('volumetric_fog_albedo', unreal.Color(200, 200, 200, 255))
comp.set_editor_property('volumetric_fog_extinction_scale', 1.0)

# Spawn Sky Atmosphere
sky = unreal.EditorLevelLibrary.spawn_actor_from_class(
    unreal.SkyAtmosphere, unreal.Vector(0, 0, 0))
```

## Best Practices

1. **Exponential Height Fog** for most projects — best quality/performance ratio
2. **Volumetric Fog** only when needed — significant GPU cost (5-15% frame time)
3. **Sky Atmosphere + Directional Light** = physically correct sky; always enable "Atmosphere Sun Light" on the directional light
4. **Volumetric Clouds** are expensive — use skybox cubemap for distant/static clouds
5. Lower `r.VolumetricFog.GridPixelSize` for better quality but watch GPU budget
6. Use fog **Start Distance** to keep near objects clear (avoid foggy character)
7. **Volumetric Scattering Intensity** per-light controls fog interaction — set to 0 on lights that shouldn't scatter
8. **Local Fog Volumes** (UE 5.1+) for artistic fog shapes without global impact
9. Height fog + sky atmosphere = most common production combo (Fortnite, etc.)
