# PCG Pitfalls — Hard-Won Debugging Knowledge

## Pitfall 1: Debug Object Not Set
**Symptom**: Node inspection shows "no data available" even though graph has generated content.
**Cause**: The PCG Debug Object is not set to the active PCG Volume/Actor.
**Fix**: In the editor, select the PCG Volume, then set it as the Debug Object in the PCG Graph Editor toolbar.

## Pitfall 2: CreatePointsGrid at Non-Zero Origin
**Symptom**: `Create Points Grid` node produces no points or wrong positions.
**Cause**: Known engine bug — CreatePointsGrid can malfunction when the PCG Volume is not at world origin.
**Fix**: Keep the volume at (0,0,0) and use grid offset parameters instead. Or use `Surface Sampler` which works at any position.

## Pitfall 3: Floating Meshes After Transform
**Symptom**: Spawned meshes float above or clip below the landscape.
**Cause**: `Transform Points` with random Z offset or scale changes moves points off the surface.
**Fix**: ALWAYS add a `Projection` node after Transform Points to snap points back to the landscape/surface.

## Pitfall 4: No Cull Distances = Instant Performance Death
**Symptom**: Extreme lag or crash when PCG generates across a large area.
**Cause**: All instances render at all distances — millions of draw calls.
**Fix**: Set `CullDistanceMin` and `CullDistanceMax` on every Static Mesh Spawner entry. Small objects: 3000-5000, large: 15000-50000.

## Pitfall 5: Attribute Partition Performance Cliff
**Symptom**: PCG graph that was fast suddenly takes 10-100x longer.
**Cause**: `Attribute Partition` splits points into separate processing buckets. Each bucket runs the downstream graph independently.
**Fix**: Union partitioned results as early as possible after per-group processing. Don't chain expensive operations on partitioned data.

## Pitfall 6: Mutating Input Data in Custom Nodes
**Symptom**: Non-deterministic results, upstream nodes producing wrong output on regeneration.
**Cause**: Custom `FPCGElement` modifies input point data directly instead of creating copies.
**Fix**: Always create new `UPCGPointData` output objects: `NewObject<UPCGPointData>()` + `InitializeFromData()`.

## Pitfall 7: Missing PCG Module in Build.cs
**Symptom**: Cryptic linker errors mentioning `UPCGSettings`, `FPCGElement`, `EPCGDataType`.
**Cause**: `"PCG"` not added to module dependencies.
**Fix**: Add `PrivateDependencyModuleNames.Add("PCG");` to your module's `Build.cs`.

## Pitfall 8: Settings::CreateElement() Not Overridden
**Symptom**: Custom node appears in graph editor but does nothing when executed.
**Cause**: `UPCGSettings::CreateElement()` wasn't overridden to return your custom element.
**Fix**: Override `CreateElement()` and return `MakeShared<FMyPCGElement>()`.

## Pitfall 9: Wrong Pin Types Causing Silent Disconnection
**Symptom**: Pins connect in the editor but no data flows through.
**Cause**: Input pin type doesn't match the output pin type of the connected node.
**Fix**: Check `EPCGDataType` on both sides. Use `EPCGDataType::Spatial` for broad compatibility, `EPCGDataType::Point` only when you specifically need point data.

## Pitfall 10: Overlapping PCG Volumes
**Symptom**: Double-density spawning in some areas, correct in others.
**Cause**: Multiple PCG Volumes overlap, each generating independently.
**Fix**: Either: (a) plan non-overlapping volumes, (b) use `Difference` node to subtract other volumes' bounds, or (c) use a single volume with Attribute Partition for different zones.

## Pitfall 11: Surface Sampler Ignoring Landscape Holes
**Symptom**: Meshes spawn inside landscape holes (caves, tunnels).
**Cause**: Surface Sampler samples the heightfield without checking visibility flags.
**Fix**: Use a Bounds Filter or manual exclusion volumes to mask out hole areas. Check if your UE version supports landscape hole detection in PCG.

## Pitfall 12: Seed Changes Not Propagating
**Symptom**: Changing the PCG Component seed doesn't change the output.
**Cause**: Per-node seed overrides are set, breaking hierarchical propagation.
**Fix**: Clear per-node seed overrides (set to -1 or "Use Parent Seed") to restore hierarchical seed propagation from the component.

## Pitfall 13: Runtime Generation Freezing Game
**Symptom**: Game freezes for 0.5-5 seconds when PCG generates at runtime.
**Cause**: PCG generation runs on the game thread by default.
**Fix**: (a) Pre-generate at edit time instead of runtime, (b) Use time-slicing to spread generation across frames, (c) Reduce point counts aggressively for runtime graphs, (d) Use GPU compute (UE 5.5+).

## Pitfall 14: PCG Plugin Not Enabled
**Symptom**: PCG nodes not available in graph editor, UPCGComponent not found.
**Cause**: PCG plugin not enabled in the `.uproject` file.
**Fix**: Add to `.uproject` Plugins array: `{"Name": "PCG", "Enabled": true}`. Or enable via Edit → Plugins → Search "PCG".

## Pitfall 15: Self Pruning Removing Too Many/Few Points
**Symptom**: Self Pruning removes all points or doesn't remove enough.
**Cause**: Incorrect pruning radius — either too large (removes everything) or too small (keeps overlaps).
**Fix**: Set `RadiusMultiplier` based on the spawned mesh's actual bounds. For a 100cm-wide tree, use 100-150cm radius. For grass, 10-20cm.

## Pitfall 16: World Partition Streaming Gaps
**Symptom**: Visible gaps/seams between PCG-generated areas when streaming.
**Cause**: PCG Partition Actors at cell boundaries don't overlap, creating visible edges.
**Fix**: (a) Set partition grid size to match WP cell size, (b) Add overlap margin via `PartitionOverlap` on the PCG Component, (c) Use hierarchical generation for smoother transitions.

## Pitfall 17: Normal To Density Wrong Axis
**Symptom**: Slope filter keeps steep areas instead of flat areas (or vice versa).
**Cause**: Normal To Density maps angle to density — flat (normal pointing up) = high density by default.
**Fix**: Understand the mapping: flat surface (normal ~ Z-up) → density near 1.0. Steep surface (normal ~ horizontal) → density near 0.0. Use Density Filter (> 0.9) for flat areas, (< 0.3) for cliffs.

## Pitfall 18: PCGEx Nodes Missing
**Symptom**: Nodes from PCGEx tutorials don't appear in the graph editor.
**Cause**: PCGEx plugin not installed or not the correct version.
**Fix**: Install PCGEx from GitHub or Fab. Ensure version matches your UE version (5.3-5.7). Restart editor after installation.

## Pitfall 19: Subgraph Input/Output Mismatch
**Symptom**: Subgraph node shows error pins or passes no data.
**Cause**: Parent graph's subgraph node pins don't match the subgraph's actual input/output definitions.
**Fix**: Open the subgraph, verify input/output node pin names and types. In the parent graph, refresh the subgraph node (right-click → Refresh).

## Pitfall 20: Density Filter Removing Everything
**Symptom**: Density Filter outputs zero points.
**Cause**: Input points all have density outside the filter range (common after Normal To Density with unexpected terrain).
**Fix**: Debug by pressing 'D' on the node BEFORE the filter to visualize point density. Adjust filter bounds to match actual density distribution. Common mistake: filtering > 0.9 when most points are at 0.5-0.7.
