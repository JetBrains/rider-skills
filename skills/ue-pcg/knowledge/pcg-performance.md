# PCG Performance Guide

## Point Budget Guidelines

### By Vegetation Density
| Layer | Points/sqm | 1 km² total | Cull Distance | Instancing |
|-------|-----------|-------------|---------------|------------|
| Dense grass/groundcover | 10-20 | 10M-20M | 3000-5000 | ISM |
| Medium grass | 2-5 | 2M-5M | 5000-8000 | ISM |
| Flowers/small plants | 1-3 | 1M-3M | 5000-8000 | ISM |
| Bushes/shrubs | 0.3-0.8 | 300K-800K | 8000-12000 | ISM/HISM |
| Small trees | 0.05-0.2 | 50K-200K | 12000-25000 | HISM |
| Large trees | 0.01-0.05 | 10K-50K | 25000-50000 | HISM |
| Rocks/boulders | 0.05-0.3 | 50K-300K | 10000-20000 | ISM/HISM |
| Buildings/structures | 0.001-0.01 | 1K-10K | 50000+ | Actor Spawner |

### Performance Thresholds
| Metric | Good | Warning | Critical |
|--------|------|---------|----------|
| Total instances per cell | < 50K | 50K-200K | > 200K |
| Unique mesh+material combos | < 20 | 20-50 | > 50 |
| PCG generation time (edit) | < 5s | 5-30s | > 30s |
| PCG generation time (runtime) | < 100ms | 100-500ms | > 500ms |
| Draw calls from PCG content | < 100 | 100-300 | > 300 |

## Instancing Strategy

### ISM (Instanced Static Mesh)
- **How**: All instances share one draw call, one bounding box
- **Good for**: Dense, localized clusters (ground cover, grass patches)
- **Bad for**: Spread-out objects (entire-world forests) — single bounding box means all instances render or none
- **Limit**: Performance degrades beyond ~10K instances per component

### HISM (Hierarchical Instanced Static Mesh)
- **How**: Builds spatial tree (clusters of clusters), culls per-cluster
- **Good for**: Spread-out objects (forests, scattered rocks) — only visible clusters render
- **Bad for**: Very small instances (extra overhead per tree node)
- **When to use**: > 1000 instances spread across > 500m

### Auto-Instancing (UE 5.3+)
- **GPU Scene** can auto-merge similar static mesh actors into instances
- Enable in Project Settings → Rendering → "Support GPU Scene Auto-Instancing"
- Reduces draw calls without manual ISM/HISM setup

### FastGeometry (UE 5.7)
- New component type for PCG that eliminates partition actor overhead
- Creates local PCG components on-the-fly
- Significant game thread cost reduction for high-density spawning
- Enable via PCG Component settings

## Cull Distance Reference

```
Small detail (< 50cm):     CullDistance = 3000-5000
Medium props (50-200cm):   CullDistance = 5000-10000
Large props (200-500cm):   CullDistance = 10000-20000
Very large (> 500cm):      CullDistance = 20000-50000
Landmark/LOD (> 2000cm):   CullDistance = 50000-100000+
```

ALWAYS set cull distances. PCG with unbounded generation and no culling
can spawn millions of instances across the entire landscape — instant crash.

## Graph Optimization Patterns

### Filter Early, Spawn Late
```
GOOD: Sampler → Noise → Filter → Filter → Prune → Transform → Spawn
BAD:  Sampler → Transform → Spawn → Filter  (spawn is wasted on filtered points)
```

### Union After Partition Immediately
```
GOOD: Partition → [per-group process] → Union → [continue graph]
BAD:  Partition → [per-group process] → [long pipeline still partitioned]
```
Partitioned processing is orders of magnitude slower because each group
is processed separately without batching.

### Minimize Spatial Queries
- `Distance` node performs per-point spatial queries — expensive at scale
- `Difference` node does intersection testing — O(N*M) in worst case
- Use these AFTER aggressive filtering, not before
- Prefer attribute-based filtering over spatial queries when possible

### Reduce Point Count Progressively
```
Stage 1: Surface Sampler (100K points on 1km²)
Stage 2: Spatial Noise → Density Filter (→ 40K points, natural thinning)
Stage 3: Normal To Density → Density Filter (→ 25K points, slope removal)
Stage 4: Self Pruning (→ 20K points, overlap removal)
Stage 5: Static Mesh Spawner (20K instances — manageable)
```

## GPU Compute (UE 5.5+)

### When to Use GPU
- Point operations on > 100K points
- Spatial noise generation
- Distance calculations
- Attribute math operations
- NOT suitable: spawning, file I/O, actor manipulation

### Setup
1. Enable PCG GPU Compute in Project Settings
2. On qualifying nodes, enable "Execute on GPU" in node settings
3. Set GPU memory budget in PCG Component settings
4. Monitor with `stat PCG` and `stat GPU`

### Performance Gains
| Operation | CPU (ms) | GPU (ms) | Speedup |
|-----------|----------|----------|---------|
| Spatial Noise (1M points) | 450 | 12 | 37x |
| Distance calc (500K points) | 280 | 8 | 35x |
| Density filter (1M points) | 120 | 5 | 24x |
| Transform (500K points) | 200 | 15 | 13x |

### UE 5.7 GPU Improvements
- Nearly 2x faster than UE 5.5 GPU compute
- GPU parameter overrides for dynamic tuning
- Fine-grained time slicing for dispatch budget control
- Fewer, larger GPU packets improve throughput

## World Partition Integration

### Partitioned Generation
- Enable `Is Partitioned` on PCG Component
- Set `Partition Grid Size` to match or subdivide WP cell size
- PCG creates `APCGPartitionActor` per grid cell
- Content streams in/out with WP cells
- Each cell generates independently → supports streaming

### Grid Size Selection
| Content Type | Recommended Grid Size | Reason |
|-------------|----------------------|--------|
| Dense groundcover | 12800 (WP cell size) | Matches streaming |
| Medium vegetation | 12800 or 6400 | Balance load/streaming |
| Sparse large objects | 25600 or larger | Less overhead |
| Buildings/structures | 25600-51200 | Infrequent generation |

### Hierarchical Generation
- Enable `Use Hierarchical Generation` for nested containers
- Parent generates first, children inherit context
- Useful for coarse→fine: place building pads first, then scatter details within

## Profiling Commands

| Command | What It Shows |
|---------|--------------|
| `stat PCG` | PCG generation time, point counts, node execution times |
| `stat SceneRendering` | Draw calls, instance counts, render time |
| `stat GPU` | GPU time breakdown |
| `stat Memory` | Memory usage |
| `r.VisualizeISMInstances 1` | Visualize instanced mesh boundaries |
| `t.MaxFPS 0` | Uncap framerate for accurate profiling |

## Common Performance Traps

### Trap 1: Unbounded Generation
- PCG Volume with no bounds generates across ENTIRE landscape
- Fix: Set appropriate volume bounds or use Bounds Filter early in graph

### Trap 2: Too Many Unique Meshes
- Every unique mesh+material = separate draw call
- 20 different rock meshes × 3 materials = 60 draw calls per cell
- Fix: Limit to 5-8 mesh variants per layer, share materials

### Trap 3: No LOD on PCG Meshes
- PCG spawns meshes at full LOD regardless of distance
- Fix: Ensure source meshes have LOD levels, set cull distances

### Trap 4: Runtime Generation Without Budget
- Runtime PCG can freeze the game during generation
- Fix: Use time-slicing, pre-generate at edit time, or use async generation

### Trap 5: Overlapping PCG Volumes
- Multiple volumes generating in the same area = double/triple instances
- Fix: Use Difference nodes to exclude overlap zones, or plan non-overlapping volumes

### Trap 6: Attribute Partition Without Union
- Partitioned data processes each bucket independently
- With 100 biome types, that's 100x slower than unified processing
- Fix: Union immediately after per-partition work is done
