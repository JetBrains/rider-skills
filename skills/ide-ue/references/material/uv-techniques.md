# UV Manipulation Techniques for UE Materials

## UV Coordinate Basics
- **TexCoord** node: outputs 0-1 UV coordinates per mesh UV channel
- UV Channel index: 0 = primary, 1 = lightmap (typically), 2+ = custom
- UVs tile naturally when multiplied, repeat with Frac

## Tiling & Offset
- **Scale**: `Multiply(TexCoord, ScalarParameter)` — controls pattern density
- **Offset**: `Add(TexCoord, VectorParameter)` — shifts pattern position
- **Combined**: `(UV + Offset) * Tiling` — standard order for material instances
- **Non-uniform**: `Multiply(TexCoord, float2(TileX, TileY))` via AppendVector

## Panning (Scrolling UVs)
- **Panner** node: built-in UV scroll with SpeedX/SpeedY
- Manual: `Add(UV, Time * Speed * Direction)`
- **Two-layer panning**: blend two textures at different speeds/angles for complex flow (water, clouds)
- Panner is cheaper than manual Time math — prefer it

## Rotation
- **CustomRotator** node: rotates UVs around pivot
- Inputs: UV, Rotation Center (default 0.5, 0.5), Rotation Angle (radians)
- Animated: `Time * RotationSpeed` → Angle input
- Use for: spinning effects, radar sweeps, loading indicators

## Polar Coordinates
- Convert Cartesian UV to polar:
  - Angle: `Atan2(UV.y - 0.5, UV.x - 0.5)` — remap to 0-1 for texture lookup
  - Radius: `Length(UV - float2(0.5, 0.5))`
- No built-in node — use Custom expression or manual math with Atan2 + Length
- Use cases: radial effects, clock faces, tunnel effects, vortex
- Tip: `Frac(Angle / (2*PI) + Time)` creates spinning radial pattern

## Triplanar Mapping (World-Space Projection)
- Projects texture from 3 axes and blends by surface normal
- **WorldAlignedTexture** node: built-in, easiest approach
- Manual method:
  1. Sample texture 3x: `Tex(WorldPos.yz)`, `Tex(WorldPos.xz)`, `Tex(WorldPos.xy)`
  2. Blend weights: `Abs(VertexNormal)` components, raise to power for sharpness
  3. Normalize weights so they sum to 1
  4. Weighted blend of 3 samples
- Scale: `WorldPosition / TextureSizeInWorldUnits`
- **WARNING**: Does NOT work for line/grid/hex patterns — lines appear as dots on perpendicular faces
- Use for: terrain, rocks, objects without proper UV unwrap
- Cost: 3x texture samples — use only when needed

## Flipbook / Sprite Sheet
- **FlipBook** node: animates through sprite sheet cells
- Inputs: UV, Rows, Columns, Frame = `Time * FPS`
- Use Floor on frame for discrete steps, or leave continuous for blending
- Use cases: animated fire/smoke/explosions, sprite effects, UI animations

## Parallax / Bump Offset
- **BumpOffset** node: offsets UVs based on height map + view angle
- Creates depth illusion without extra geometry
- Inputs: Height (texture), HeightRatio (strength), ReferencePlane (0.5 default)
- Use cases: brick walls, cobblestone, adding depth to flat surfaces
- Cheap alternative to tessellation/displacement

## Screen-Space UVs
- **ScreenPosition** node: pixel position in screen space (0-1)
- Use for: screen-space effects, refraction, post-process materials
- Aspect correction: `ScreenPosition.xy * float2(AspectRatio, 1)`
- Requires Translucent material or Post Process domain to access scene textures

## Object-Space UVs
- **ObjectPosition** + **WorldPosition**: effects relative to object center
- `Normalize(WorldPosition - ObjectPosition)` = direction from center
- Use for: radial gradients per-object, force fields, proximity glow
- `Length(WorldPosition - ObjectPosition)` = distance from center

## UV Distortion / Warping
- Add noise or texture sample to UV before sampling main texture
- **Amount control**: `Lerp(UV, UV + NoiseOffset, DistortionAmount)`
- Common pattern: `Panner(Noise)` as distortion source → animated warping
- Use for: heat haze, underwater, magical effects, organic feel
- Keep distortion small (0.01-0.1) to avoid extreme stretching

## Common UV Patterns

| Effect | Technique |
|--------|-----------|
| Flowing water | Panner on noise texture, two layers crossing |
| Spinning vortex | Polar coords + Panner on angle axis |
| Growing circle | Radial gradient + animated threshold parameter |
| Scanlines | `Frac(UV.y * LineCount)` → Step for hard lines |
| Kaleidoscope | Polar coords + `Fmod(Angle, SegmentSize)` + mirror |
| Rain on window | UV distortion with downward-panning noise |
| Tiled random | `Floor(UV * GridSize)` as seed → per-tile random value |
| Scrolling text | Panner on U only, mask with gradient on edges |

## Rules
1. **Scale UV first** before any other transforms — wrong order creates inconsistent tiling
2. **Triplanar costs 3x** texture samples — use only on meshes without proper UVs
3. **Panner is cheaper** than manual `Time + Add` — always prefer built-in node
4. **Frac creates repetition** from any continuous value — core tool for tiling patterns
5. **ScreenPosition UVs** require Translucent or Post Process domain to read scene color/depth
6. **Polar coordinates** need center offset (subtract 0.5) before Atan2 for correct rotation center
7. **BumpOffset/Parallax**: 1 layer = cheap, multiple layers (POM) = expensive — start with 1
