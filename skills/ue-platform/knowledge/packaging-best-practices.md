# Packaging Best Practices

## Pre-Packaging Checklist

1. **Validate asset references** — Right-click assets > Validate, or use Asset Audit tool. Broken references = cook failures.
2. **Fix map check warnings** — `Window > Developer > Message Log > Map Check`. Resolve before packaging.
3. **No editor-only references in runtime code** — Guard with `#if WITH_EDITOR`. Runtime Blueprints must not reference editor-only assets.
4. **Test Development cook first** — Always verify Development packaging works before attempting Shipping.
5. **Check DefaultEditor.ini** — If using `-allmaps`, ensure `[AllMaps]` section lists all maps: `+Map=/Game/Maps/MapName`.
6. **Save all assets** — Unsaved changes in the editor will NOT be included in the cook.
7. **Sufficient disk space** — Full cook+package needs 2-5x project size in temp space.
8. **Close the editor** — Some platforms lock files; close the editor or at minimum save everything.
9. **Apple platforms (Mac/iOS)** — Verify `bUseModernXcode=True` and `CodeSigningTeam` are set in `[/Script/MacTargetPlatform.XcodeProjectSettings]`. Without these, Mac builds crash on launch (missing dylibs) and iOS builds fail (no signing team).
10. **Disable unused plugins that link external dylibs** — e.g., `NNERuntimeORT` links `libonnxruntime` which is not staged on Mac and unavailable on iOS.

## Common Pitfalls

### Missing assets at runtime
Assets loaded via `DynamicLoadObject()` or string path (`FSoftObjectPath`) are NOT followed by the cooker automatically. Fix:
- Add parent directory to **Project Settings > Packaging > Additional Asset Directories to Cook**
- Or reference them from a cooked Blueprint/DataTable/map
- Or add to **Primary Asset Types** in Asset Manager settings

### Blueprint-only projects
The `-build` flag is only needed for C++ projects. Blueprint-only projects should use `-NoCompile` or `--no-build` to skip compilation.

### Iterative cook corruption
If iterative cook (`-iterate`) produces bad results (missing textures, wrong shaders):
- Delete `Saved/Cooked/` folder
- Re-run with `--clean` for a full cook
- This happens when the dependency graph gets out of sync

### Shader compilation on first cook
First cook for a new platform compiles ALL shaders — this can take **hours** on large projects. Mitigations:
- Use **Shared Derived Data Cache (DDC)** across team: `[DerivedDataBackendGraph]` in `DefaultEngine.ini`
- Pre-populate DDC with `DerivedDataCacheUtils` command
- Use `-iterate` for subsequent cooks

### Pak signing
- `.sig` files must match `.pak` filenames exactly
- If signing is enabled, ALL pak files must be signed
- Unsigned pak tampering can be detected at runtime via `-signedpak`

### IoStore considerations
- IoStore (`.ucas`/`.utoc`) is the modern UE5 format — faster I/O, better streaming
- Harder to mod than traditional `.pak` — consider modding community impact
- Required for some platforms (consoles)
- Produces both `.pak` (compatibility) and `.ucas`/`.utoc` files

### Disk space
- `Saved/Cooked/` — full cooked data (can be project-sized)
- `Saved/StagedBuilds/` — staged output
- Archive directory — final copy
- Total: 2-5x project size depending on platform

### Apple platform dylib/signing pitfalls (Mac + iOS)

**Missing dylibs on Mac (crash on launch)**:
Without `bUseModernXcode=True`, the following dylibs are NOT staged into the `.app` bundle, causing `Library not loaded: @rpath/lib*.dylib` crashes:
- `libtbb.12.dylib` (Intel TBB threading)
- `libtbbmalloc.2.dylib` (TBB memory allocator)
- `libmetalirconverter.dylib` (Metal shader converter)
- `libogg.dylib` (Ogg audio codec)
- `libvorbis.dylib` (Vorbis audio codec)
- `libonnxruntime.1.20.1.dylib` (ONNX Runtime — from NNERuntimeORT, weak link)

Fix: Add `bUseModernXcode=True` to `[/Script/MacTargetPlatform.XcodeProjectSettings]`.

**Mac archive vs staged build mismatch**:
The `-archive` step copies from `Binaries/Mac/`, which may NOT contain the `.app` with properly bundled dylibs from the Stage step. The staged build at `Saved/StagedBuilds/Mac/<Game>.app` is the correctly assembled bundle. Verify the archive output includes all dylibs, or use the staged build directly.

**iOS signing team not found**:
UE 5.3+ Modern Xcode workflow reads `DEVELOPMENT_TEAM` from `CodeSigningTeam` in `[/Script/MacTargetPlatform.XcodeProjectSettings]`. The `IOSTeamID` in `[/Script/IOSRuntimeSettings.IOSRuntimeSettings]` is NOT used for this purpose — it only feeds the legacy provisioning profile lookup. If only `IOSTeamID` is set, the xcconfig `DEVELOPMENT_TEAM` remains empty and Xcode fails with "Signing requires a development team."

**NNERuntimeORT plugin**:
This engine plugin links `libonnxruntime` as a weak dependency. Even with Modern Xcode, this library is not staged into the Mac app bundle. On iOS, it's unavailable entirely. Disable in `.uproject` if not needed:
```json
{ "Name": "NNERuntimeORT", "Enabled": false }
```

**macOS `timeout` command not available**:
The `timeout` command (GNU coreutils) does not exist on macOS by default. The ue-package.sh and ue-deploy.sh scripts handle this by running RunUAT without a timeout wrapper on macOS. RunUAT has its own internal timeouts.

**iOS/mobile black screen — cook-time vs runtime settings**:
Platform config overrides (`Config/IOS/IOSEngine.ini`) can ONLY safely override runtime-toggleable settings. Cook-time settings like `r.Substrate`, `r.Mobile.ShadingPath`, `r.DynamicGlobalIlluminationMethod`, `r.ReflectionMethod`, and `r.MobileHDR` determine which shader permutations are compiled during cooking. If you override these in a platform config, the cooked shaders won't match the runtime expectation, and ALL materials render black. Only override: `r.RayTracing`, `r.Shadow.Virtual.Enable`, `r.GenerateMeshDistanceFields`, and other genuinely runtime-toggleable features. If different shading models are needed per platform, set them in `DefaultEngine.ini` before cooking.

## Optimization Tips

### Development iteration
- Use `--iterate` to only re-cook changed assets (~70% time savings in UE5.3+)
- Use `--map` to cook only maps you're testing
- Use `--no-build` if binaries haven't changed
- Use `-SkipCookingEditorContent` to skip editor assets
- Cook-on-the-fly (`-cookonthefly`) for rapid local iteration without any packaging

### Shipping optimization
- `--compressed` — Oodle compression reduces download/disk size
- `--iostore` — faster loading, better streaming performance
- `--nodebuginfo` — excludes .pdb files (can save gigabytes)
- `--distribution` — marks as store-ready, strips internal tools
- `-unversionedcookedcontent` — removes version signatures

### Build times
- Shader compilation dominates first cook time. Use Shared DDC.
- C++ compilation can be parallelized with XGE/IncrediBuild
- Consider `-ForceUnity` for faster compilation (fewer translation units)
- Set appropriate `--timeout` for large projects (2+ hours)

## Build Configurations Guide

| Config | Optimization | Console | Debug Symbols | Use Case |
|--------|-------------|---------|---------------|----------|
| **Debug** | None | Yes | Full | Engine debugging, very slow |
| **DebugGame** | Engine optimized | Yes | Game only | Game C++ debugging |
| **Development** | Moderate | Yes | Yes | Day-to-day dev, playtesting |
| **Test** | Full | Limited | Minimal | QA before release |
| **Shipping** | Full | No | None | Final distribution |

### When to use each:
- **Development**: Default for all internal testing. Has console, stat commands, visual debug tools.
- **Test**: Pre-release QA. Like Shipping but retains some diagnostics. Use for performance testing.
- **Shipping**: Store/release only. Strips ALL debug tools, console, logging. Smallest and fastest.
- **DebugGame**: When you need to step through game C++ in a debugger but don't want engine slowdown.

## Patching Workflow

1. **Create release baseline** — Package with `--release 1.0`. This saves asset metadata for diffing.
2. **Make changes** — Modify content, fix bugs.
3. **Generate patch** — Package with `--patch 1.0`. Produces a pak containing ONLY changed assets.
4. **Distribute patch** — The patch pak is loaded alongside the original (higher priority).

Patch paks are typically much smaller than full builds — only changed/added assets are included.

## Dedicated Server Packaging

```bash
# Server only (no client assets — textures, audio, etc. stripped)
ue-package.sh --server --platform Linux --config Development

# Client + Server together
ue-package.sh --config Development --extra "-dedicatedserver -client"
```

Server builds exclude:
- Client-only textures and materials
- Audio assets (unless needed server-side)
- UI/HUD assets
- Particle effects

This significantly reduces server package size.
