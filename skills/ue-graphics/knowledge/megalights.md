# MegaLights — Stochastic Direct Lighting

## Overview

MegaLights is a stochastic direct lighting system introduced in UE 5.5 (Experimental), moved to Beta in UE 5.7. It enables many dynamic shadow-casting area lights in a scene with good performance — often called "the Nanite of lights."

## Status

| UE Version | Status |
|------------|--------|
| 5.5 | Experimental |
| 5.6 | Experimental (continued R&D) |
| 5.7 | **Beta** |

## How to Enable

### Project-Wide
1. **Edit → Project Settings → Engine → Rendering → Direct Lighting**
2. Enable the **MegaLights** checkbox
3. Requires ray-tracing platform support (DX12 with RT)

### Per-Volume
- Enable MegaLights within a **Post-Processing Volume** — search for "MegaLights" in the Details panel

### Per-Light
Once enabled globally, individual lights gain MegaLights options in their Details panel:
- **Shadow Method**: Default, Ray Tracing, or Virtual Shadow Map
- Option to disable MegaLights for specific lights

> **Note (5.7+)**: MegaLights now requires ray tracing platform support. On unsupported hardware, all MegaLights shader compilation is skipped entirely.

## Supported Light Types

- Point lights
- Spotlights
- Rect lights (area lights)
- Directional lights (5.7+)

## Key Features

- Realistic soft shadows from complex light sources (area lights)
- Shadow-casting Niagara particles (5.7+)
- Translucency shading/shadowing (5.7+)
- Hair strands shading/shadowing (5.7+)
- Noise and performance tuning controls

## CVars

### Core
| CVar | Description | Default |
|------|-------------|---------|
| `r.MegaLights.Supported` | Compile-time platform support (read-only) | true |
| `r.MegaLights.EnableForProject` | Enable by default (can be overridden per PPV) | 0 |
| `r.MegaLights.Allowed` | Allow by device/scalability profile | 1 |

### Sampling & Quality
| CVar | Description | Default |
|------|-------------|---------|
| `r.MegaLights.DownsampleMode` | 0=disabled(1x1), 1=checkerboard(2x1), 2=half-res(2x2) | 2 |
| `r.MegaLights.NumSamplesPerPixel` | Ray samples per downsampled pixel (1, 2, or 4) | 4 |
| `r.MegaLights.GuideByHistory` | 0=off, 1=toward visible lights, 2=toward visible light parts | 2 |
| `r.MegaLights.LightAttenuationFalloff` | Base color luminance for early light culling (0=disabled) | 0.18 |
| `r.MegaLights.MinSampleWeight` | Minimum sample influence threshold | 0.001 |

### Data Format
| CVar | Description | Default |
|------|-------------|---------|
| `r.MegaLights.LightingDataFormat` | 0=R11G11B10 (fast), 1=Float16, 2=Float32 (reference) | 0 |

### Performance
| CVar | Description | Default |
|------|-------------|---------|
| `r.MegaLights.WaveOps` | Use wave operations | 1 |
| `r.MegaLights.FastClear` | Skip empty tiles (off for opaque by default) | false |
| `r.MegaLights.HairStrands.FastClear` | Fast clear for hair strands | true |
| `r.MegaLights.HardwareRayTracing.ForceTwoSided` | Force two-sided for raster matching | 5.7+ |
| `r.MegaLights.DefaultShadowMethod` | Default shadow method | — |

### Debug
| CVar | Description | Default |
|------|-------------|---------|
| `r.MegaLights.Debug` | 0=off, 1=opaque, 2=volume, 3=translucency, 4=hair, 5=front layer translucency | 0 |
| `r.MegaLights.Debug.LightId` | Debug specific light ID | -1 |
| `r.MegaLights.Debug.VisualizeTraces` | 0=off, 1=rays, 2=samples | 1 |
| `r.MegaLights.Debug.VisualizeLightLoopIterations` | Visualize light loop count per pixel | 0 |
| `r.MegaLights.Reset` | Reset history | — |

## Performance

- Always vectorize shading samples (~0.1-0.2ms savings on current-gen consoles, 5.7+)
- MegaLights-driven VSM page marking reduces shadow overhead
- Merged identical rays to eliminate duplicate trace overhead
- Downsampled neighborhood temporal accumulation

## Best Practices

1. **Best for dense indoor scenes** — many lights in enclosed spaces benefit most
2. **Requires HWRT support** — DX12 with ray tracing capable GPU
3. **Combine with Lumen** — MegaLights handles direct lighting, Lumen handles GI/reflections
4. **Use per-light controls** to disable MegaLights on lights that don't need soft shadows
5. **Profile with `stat GPU`** — watch direct lighting cost
6. **Start with default settings** — tune `r.MegaLights.DownsampleFactor` for quality/performance trade-off
