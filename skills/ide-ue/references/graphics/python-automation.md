# Python Automation for Graphics

## Setting Console Variables (CVars)

```python
import unreal

# Get world reference (required for execute_console_command)
world = unreal.EditorLevelLibrary.get_editor_world()

# Set a CVar
unreal.SystemLibrary.execute_console_command(world, "r.Nanite.MaxPixelsPerEdge 2")
unreal.SystemLibrary.execute_console_command(world, "r.Lumen.HardwareRayTracing 1")
unreal.SystemLibrary.execute_console_command(world, "r.ScreenPercentage 75")

# Read a CVar value (requires parsing output or using IConsoleVariable)
# There's no direct Python API for reading CVars — use console command output
```

## Scalability Settings

```python
import unreal

# Apply a scalability preset
# Use console commands for scalability groups:
world = unreal.EditorLevelLibrary.get_editor_world()

# Set overall quality (0=Low, 1=Medium, 2=High, 3=Epic, 4=Cinematic)
unreal.SystemLibrary.execute_console_command(world, "sg.ResolutionQuality 3")
unreal.SystemLibrary.execute_console_command(world, "sg.ViewDistanceQuality 3")
unreal.SystemLibrary.execute_console_command(world, "sg.AntiAliasingQuality 3")
unreal.SystemLibrary.execute_console_command(world, "sg.ShadowQuality 3")
unreal.SystemLibrary.execute_console_command(world, "sg.GlobalIlluminationQuality 3")
unreal.SystemLibrary.execute_console_command(world, "sg.ReflectionQuality 3")
unreal.SystemLibrary.execute_console_command(world, "sg.PostProcessQuality 3")
unreal.SystemLibrary.execute_console_command(world, "sg.TextureQuality 3")
unreal.SystemLibrary.execute_console_command(world, "sg.EffectsQuality 3")
unreal.SystemLibrary.execute_console_command(world, "sg.FoliageQuality 3")
unreal.SystemLibrary.execute_console_command(world, "sg.ShadingQuality 3")
```

## Material Validation

### Check All Materials Compile
```python
import unreal

registry = unreal.AssetRegistryHelpers.get_asset_registry()
ar_filter = unreal.ARFilter()
ar_filter.class_paths = [
    unreal.TopLevelAssetPath('/Script/Engine', 'Material'),
]
ar_filter.package_paths = ['/Game']
ar_filter.recursive_paths = True

materials = registry.get_assets(ar_filter)
count = len(materials) if materials else 0
print('Total materials: {}'.format(count))

# Use DataValidation for compilation check
subsystem = unreal.get_editor_subsystem(unreal.EditorValidatorSubsystem)
settings = unreal.ValidateAssetsSettings()
settings.load_assets_for_validation = True
settings.collect_per_asset_details = True

results = unreal.ValidateAssetsResults()
subsystem.validate_assets_with_settings(materials, results)

print('Valid: {}'.format(results.num_valid))
print('Invalid: {}'.format(results.num_invalid))
print('Warnings: {}'.format(results.num_warnings))
```

### Find Materials with High Instruction Count
```python
import unreal

mel = unreal.MaterialEditingLibrary

registry = unreal.AssetRegistryHelpers.get_asset_registry()
ar_filter = unreal.ARFilter()
ar_filter.class_paths = [unreal.TopLevelAssetPath('/Script/Engine', 'Material')]
ar_filter.package_paths = ['/Game']
ar_filter.recursive_paths = True

materials = registry.get_assets(ar_filter)
if materials:
    for mat_data in materials[:100]:  # cap for performance
        mat = mat_data.get_asset()
        if mat:
            stats = mel.get_statistics(mat)
            # stats contains instruction counts, texture samples, etc.
            num_exprs = mel.get_num_material_expressions(mat)
            if num_exprs > 50:
                print('Complex: {} ({} expressions)'.format(
                    mat_data.package_name, num_exprs))
```

## Post-Process Volume Configuration

```python
import unreal

# Find or create a post-process volume
eas = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
ppvs = eas.get_all_level_actors_of_class(unreal.PostProcessVolume)

if ppvs:
    ppv = ppvs[0]
else:
    # Spawn a new one
    ppv = eas.spawn_actor_from_class(
        unreal.PostProcessVolume,
        unreal.Vector(0, 0, 0)
    )

# Configure as global (infinite extent)
ppv.set_editor_property('unbound', True)
ppv.set_editor_property('priority', 1.0)

# Access settings
settings = ppv.get_editor_property('settings')

# Enable and set bloom
settings.set_editor_property('override_bloom_intensity', True)
settings.set_editor_property('bloom_intensity', 0.5)

settings.set_editor_property('override_bloom_threshold', True)
settings.set_editor_property('bloom_threshold', 1.0)

# Enable and set auto-exposure
settings.set_editor_property('override_auto_exposure_method', True)
settings.set_editor_property('auto_exposure_method', unreal.AutoExposureMethod.AEM_HISTOGRAM)

settings.set_editor_property('override_auto_exposure_min_brightness', True)
settings.set_editor_property('auto_exposure_min_brightness', 0.5)

settings.set_editor_property('override_auto_exposure_max_brightness', True)
settings.set_editor_property('auto_exposure_max_brightness', 2.0)

# Apply settings back
ppv.set_editor_property('settings', settings)
print('Post-process volume configured')
```

## Lighting Configuration

```python
import unreal

eas = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)

# Find directional light
lights = eas.get_all_level_actors_of_class(unreal.DirectionalLight)
if lights:
    sun = lights[0]
    light_comp = sun.get_component_by_class(unreal.DirectionalLightComponent)

    # Configure for Lumen
    light_comp.set_editor_property('intensity', 10.0)  # lux
    light_comp.set_editor_property('light_color', unreal.Color(255, 244, 230, 255))  # warm white
    light_comp.set_editor_property('cast_shadows', True)
    light_comp.set_editor_property('use_temperature', True)
    light_comp.set_editor_property('temperature', 5500.0)

    print('Directional light configured')
```

## Stat Command Automation

```python
import unreal

world = unreal.EditorLevelLibrary.get_editor_world()

# Enable stat overlays
unreal.SystemLibrary.execute_console_command(world, "stat GPU")
unreal.SystemLibrary.execute_console_command(world, "stat unit")
unreal.SystemLibrary.execute_console_command(world, "stat RHI")

# Nanite stats (needs ShaderPrint)
unreal.SystemLibrary.execute_console_command(world, "r.ShaderPrint 1")
unreal.SystemLibrary.execute_console_command(world, "NaniteStats primary")

# GPU profiler
unreal.SystemLibrary.execute_console_command(world, "ProfileGPU")

# Start Unreal Insights trace
unreal.SystemLibrary.execute_console_command(world, "trace.start gpu,rendering,bookmark")
# ... do work ...
# unreal.SystemLibrary.execute_console_command(world, "trace.stop")
```

## Render Feature Validation

```python
import unreal

world = unreal.EditorLevelLibrary.get_editor_world()

# Check current rendering settings by toggling visualization modes
checks = [
    ('Nanite enabled', 'r.Nanite'),
    ('Lumen GI', 'r.DynamicGlobalIlluminationMethod'),
    ('Lumen Reflections', 'r.ReflectionMethod'),
    ('VSM', 'r.Shadow.Virtual.Enable'),
    ('TSR', 'r.AntiAliasingMethod'),
    ('Hardware RT', 'r.Lumen.HardwareRayTracing'),
]

# Note: Python cannot directly read CVar values
# Use ue-exec.sh --script to run this and parse output from logs
for name, cvar in checks:
    print('Feature: {} (CVar: {})'.format(name, cvar))
```

## Screenshot with Render Settings

```python
import unreal

# Configure for high-quality screenshot
world = unreal.EditorLevelLibrary.get_editor_world()

# Set high quality
unreal.SystemLibrary.execute_console_command(world, "r.ScreenPercentage 100")
unreal.SystemLibrary.execute_console_command(world, "r.TSR.History.ScreenPercentage 200")

# Take high-res screenshot
unreal.AutomationLibrary.take_high_res_screenshot(
    1920, 1080,
    '/tmp/ue_screenshot.png'
)

print('Screenshot saved')
```

## Batch CVar Configuration

```python
import unreal

def apply_render_preset(preset_name):
    """Apply a named rendering preset via CVars."""
    world = unreal.EditorLevelLibrary.get_editor_world()
    cmd = lambda c: unreal.SystemLibrary.execute_console_command(world, c)

    presets = {
        'cinematic': [
            'r.ScreenPercentage 100',
            'r.TSR.History.ScreenPercentage 200',
            'r.Lumen.HardwareRayTracing 1',
            'r.Lumen.ScreenProbeGather.Temporal.MaxFramesAccumulated 32',
            'r.Lumen.Reflections.Temporal.StabilityMultiplier 3',
            'r.Lumen.ScreenProbeGather.MaxRayIntensity 10',
            'r.BloomQuality 5',
            'r.DepthOfFieldQuality 4',
            'r.MotionBlurQuality 4',
            'r.Shadow.Virtual.Enable 1',
        ],
        'performance': [
            'r.ScreenPercentage 50',
            'r.TSR.History.ScreenPercentage 100',
            'r.TSR.ThinGeometryDetection 1',
            'r.Lumen.HardwareRayTracing 0',
            'r.Lumen.ScreenProbeGather.DownsampleFactor 32',
            'r.LumenScene.FarField.OcclusionOnly 1',
            'r.BloomQuality 3',
            'r.DepthOfFieldQuality 1',
            'r.MotionBlurQuality 0',
            'r.AmbientOcclusionLevels 1',
        ],
        'debug': [
            'r.ShaderPrint 1',
            'r.RDG.Debug 1',
            'r.GPUCrashDebugging 1',
            'r.Shaders.KeepDebugInfo 1',
        ],
    }

    if preset_name in presets:
        for cvar in presets[preset_name]:
            cmd(cvar)
        print('Applied preset: {}'.format(preset_name))
    else:
        print('Unknown preset: {}. Available: {}'.format(
            preset_name, list(presets.keys())))

# Usage:
# apply_render_preset('cinematic')
# apply_render_preset('performance')
# apply_render_preset('debug')
```

## Important Notes

1. **CVars set via Python are session-only** — they reset when the editor restarts. For persistent settings, modify `DefaultEngine.ini`.
2. **CVar read/write via AgentBridgeLibrary** — use `unreal.AgentBridgeLibrary.read_c_var('r.Shadow.MaxResolution')` to read and `unreal.AgentBridgeLibrary.write_c_var('r.Shadow.MaxResolution', '2048')` to set. For metadata: `unreal.AgentBridgeLibrary.get_c_var_info('r.Shadow.MaxResolution')` returns JSON with type, help text, flags. Also available via REST: `GET /agent/cvar?name=...` and `POST /agent/cvar`.
3. **Use `.format()` not f-strings** when scripts are embedded in JSON payloads (AgentBridge).
4. **World reference required** for `execute_console_command` — always get it first.
5. **Cap asset iterations** to 100-500 to avoid editor hangs on large projects.
