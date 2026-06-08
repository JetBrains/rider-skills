# Shader Math Foundations for Unreal Engine

Practical math reference for HLSL shader authoring in UE. Focused on what you actually use, not theory.

---

## Vector Operations

### Dot Product — `dot(A, B)`
Returns scalar measuring alignment between two vectors. Range [-1, 1] for unit vectors.

| Pattern | Formula | Use |
|---------|---------|-----|
| Diffuse lighting (Lambert) | `max(0, dot(N, L))` | How much surface faces the light |
| Rim / Fresnel mask | `1 - dot(N, V)` | 0 at center, 1 at edges |
| Projection / masking | `dot(WorldPos, MaskDirection)` | Project position onto axis for gradients |
| Backface test | `dot(N, V) < 0` | Detect geometry facing away from camera |

`N` = surface normal, `L` = light direction, `V` = view direction (all normalized).

### Cross Product — `cross(A, B)`
Returns vector perpendicular to both inputs. Order matters (left-hand rule in UE's coordinate system).

- **TBN matrix construction**: `T` (tangent), `B = cross(N, T) * TangentSign`, `N` (normal)
- **Surface orientation**: `cross(dFdx(WorldPos), dFdy(WorldPos))` gives face normal from position
- **Winding / area**: Sign indicates front vs back face

### Normalize — `normalize(V)`
Scales vector to unit length (magnitude 1). **Critical rule**: any vector used as a direction must be normalized before dot/cross products. Interpolated normals from vertex shader are NOT unit length — always renormalize in pixel shader.

Skip normalize only when you explicitly need the magnitude (e.g., distance falloff).

### Reflect / Refract
```hlsl
reflect(I, N)    // I - 2 * dot(I, N) * N — mirror direction around normal
refract(I, N, eta) // Snell's law — eta is ratio of indices of refraction
```
- **Reflect**: Specular highlights, environment/cubemap sampling, planar reflections
- **Refract**: Glass, water, ice. `eta` for air-to-glass ~ 0.67 (1/1.5)

---

## Coordinate Spaces in UE

### Transform Pipeline
```
Local/Object → World → View/Camera → Clip → NDC → Screen
   Model        View      Projection    /w     Viewport
```

| Space | Range | Use for |
|-------|-------|---------|
| Local (Object) | Model-relative | Procedural effects anchored to mesh |
| World | Scene units (cm) | Lighting, distance calculations, world-aligned textures |
| View (Camera) | Camera-relative | Depth-based effects, fog |
| Clip | After projection | Vertex shader output (`SV_Position`) |
| NDC | [-1,1] XY, [0,1] Z | Post-process UV math |
| Screen | Pixel coordinates | Screen-space effects, sampling screen textures |

### UE Transform Functions (Material Graph / USF)
```hlsl
// Position transforms
TransformLocalPositionToWorld(LocalPos)
TransformWorldToView(WorldPos)
LWCToFloat(GetWorldPosition())           // current pixel world position

// Direction transforms (no translation)
TransformLocalVectorToWorld(LocalDir)
TransformWorldToViewDir(WorldDir)

// Normal transforms (inverse transpose for non-uniform scale)
TransformLocalNormalToWorld(MaterialParameters, LocalNormal)
```

### Tangent Space
Normal maps store offsets relative to the surface, not world. The **TBN matrix** converts tangent-space normals to world space:
```hlsl
float3 WorldNormal = TangentToWorld(TangentNormal, TBN);
// TBN = float3x3(Tangent, Bitangent, Normal) — each row is a world-space axis
```

**When to use which space**:
- **Lighting**: World space (light and normal both in world)
- **Normal maps**: Author in tangent space, transform to world for shading
- **Screen effects**: NDC or screen UV
- **Distance/proximity**: World space
- **Procedural noise on mesh**: Local space (moves with object)

---

## Matrix Essentials for Shaders

### Core Transforms
| Matrix | What it does | UE accessor |
|--------|-------------|-------------|
| Model (LocalToWorld) | Object → World | `GetPrimitiveData(Parameters).LocalToWorld` |
| View | World → Camera | `ResolvedView.WorldToView` (LWC) |
| Projection | View → Clip (perspective divide) | `ResolvedView.ViewToClip` |
| ViewProjection | World → Clip (combined) | `ResolvedView.WorldToClip` (LWC) |

### Inverse Transforms (Screen-to-World Reconstruction)
```hlsl
ResolvedView.ClipToWorld        // Reconstruct world position from depth
ResolvedView.ScreenToWorld      // Screen UV + depth → world position
ResolvedView.ViewToWorld        // View-space → world (camera placement)
```

Common pattern — reconstruct world position from depth buffer:
```hlsl
float DeviceZ = SceneDepthTexture.Load(PixelPos);
float4 ClipPos = float4(UV * 2 - 1, DeviceZ, 1);
float4 WorldPos4 = mul(ClipPos, ResolvedView.ClipToWorld);
float3 WorldPos = WorldPos4.xyz / WorldPos4.w;
```

### UE Specifics
- UE uses **left-handed** coordinate system: X = forward, Y = right, Z = up
- Projection maps Z to **[0, 1]** (reversed-Z by default for better precision)
- `ResolvedView.ViewSizeAndInvSize` — screen dimensions for UV calculations

---

## Practical Formulas

### Fresnel (Edge Glow / Rim Lighting)
```hlsl
float Fresnel = pow(1 - saturate(dot(N, V)), Exponent);
// Exponent 1 = broad, 5 = tight edge, 0.5 = wide soft glow
// Schlick approximation for PBR: F0 + (1 - F0) * pow(1 - dot(H, V), 5)
```

### Lambert Diffuse
```hlsl
float Diffuse = max(0, dot(N, L));
// Or: saturate(dot(N, L)) — same thing, saturate clamps [0,1]
// Half-Lambert (softer): Diffuse * 0.5 + 0.5 (Valve trick, non-physical)
```

### Blinn-Phong Specular
```hlsl
float3 H = normalize(L + V);              // half-vector
float Spec = pow(max(0, dot(N, H)), Shininess);
// Shininess 16 = broad, 256 = tight pinpoint
// Multiply by (Shininess + 2) / (2 * PI) for energy conservation
```

### Smoothstep (Soft Threshold)
```hlsl
smoothstep(edge0, edge1, x)  // Hermite interpolation, returns 0→1
// Use for: soft masks, distance-based fades, anti-aliased cutoffs
// AVOID for steep steps — use step() instead
// Custom: smootherstep = x*x*x*(x*(x*6-15)+10) — less banding
```

### Remap (Range Conversion)
```hlsl
float Remap(float x, float inMin, float inMax, float outMin, float outMax) {
    return (x - inMin) / (inMax - inMin) * (outMax - outMin) + outMin;
}
// Example: remap depth [100, 5000] → opacity [0, 1]
```

### Posterize (Cel Shading / Banding)
```hlsl
float Posterize = floor(x * Steps) / Steps;
// Steps=3 gives 4 bands (0, 0.33, 0.67, 1.0)
// Combine with smoothstep on band edges for anti-aliased toon shading
```

### Polar Coordinates
```hlsl
float2 centered = UV - 0.5;
float angle = atan2(centered.y, centered.x);  // [-PI, PI]
float radius = length(centered);
float2 polar = float2(angle / (2 * PI) + 0.5, radius);
// Use for: radial effects, spiral patterns, circular wipes
```

### Noise-Derived Normals
```hlsl
// From a noise height value, compute normal via partial derivatives:
float h = NoiseFunction(UV);
float3 Normal;
Normal.x = ddx(h);
Normal.y = ddy(h);
Normal.z = 1.0;          // controls bump strength (smaller = stronger)
Normal = normalize(Normal);
// Or sample noise at 3 offset points and cross-product for better quality
```

---

## Quick Reference: HLSL Intrinsics for Shaders

| Intrinsic | Signature | Shader Use |
|-----------|-----------|------------|
| `saturate(x)` | Clamp to [0,1] | Safe dot products, color clamping. Free on GPU (modifier, not instruction) |
| `lerp(a, b, t)` | `a + t * (b - a)` | Blend anything — colors, positions, normals. `t` outside [0,1] extrapolates |
| `step(edge, x)` | `x >= edge ? 1 : 0` | Hard cutoff, cheaper than branch. No anti-aliasing |
| `smoothstep(e0, e1, x)` | Hermite [0,1] | Soft transitions, anti-aliased masks |
| `frac(x)` | Fractional part | Tiling UVs, sawtooth waves, scrolling textures |
| `fmod(x, y)` | Remainder | Repeating patterns. Careful: preserves sign unlike `frac` |
| `abs(x)` | Absolute value | Symmetry, distance. Free on GPU (modifier) |
| `sign(x)` | -1, 0, or 1 | Direction without magnitude, conditional flip |
| `pow(x, y)` | `x^y` | Falloff curves, gamma, specular power. `x` must be >= 0 |
| `exp(x)` / `exp2(x)` | `e^x` / `2^x` | Fog density, exponential falloff. `exp2` is faster |
| `log(x)` / `log2(x)` | Natural/base-2 log | Mip level calculation, perceptual remapping |
| `sin(x)` / `cos(x)` | Trig | Waves, rotation, oscillation. Radians, not degrees |
| `atan2(y, x)` | Angle from components | Polar coords, direction angle. Returns [-PI, PI] |
| `ddx(x)` / `ddy(x)` | Screen-space derivatives | Procedural normals, mip selection, edge detection |
| `fwidth(x)` | `abs(ddx(x)) + abs(ddy(x))` | Anti-aliasing: pixel-size-relative thresholds |
| `mul(M, v)` | Matrix multiply | Transform between spaces. Order matters: `mul(v, M)` transposes |
| `clamp(x, lo, hi)` | Clamp to range | Constrain values. Use `saturate` for [0,1] (it's free) |
| `min(a, b)` / `max(a, b)` | Component-wise | Threshold without branch. `max(0, x)` = ReLU |
| `rsqrt(x)` | `1 / sqrt(x)` | Fast normalize alternative: `v * rsqrt(dot(v,v))` |
| `rcp(x)` | `1 / x` | Faster than division on GPU |
| `asfloat` / `asuint` | Bit reinterpret | Packing data into buffers, bit tricks |
