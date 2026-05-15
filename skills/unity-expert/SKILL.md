---
name: unity:expert
description: "Universal Unity expert. Use for ANY Unity work: C# scripting & MonoBehaviour lifecycle (unity:coder), ScriptableObjects, prefabs & scenes, Input System, UGUI/UI Toolkit, animation/Animator/Timeline, physics & colliders, networking (Netcode for GameObjects), DOTS/ECS/Burst/Jobs, Addressables & asset pipeline, URP/HDRP/Shader Graph/HLSL, editor scripting, profiling, testing (Unity Test Framework), build & player packaging, audio, VFX Graph, debugging. Single entry point for all Unity domains — coordinates Rider's Unity integration (Attach to Unity Editor & Play, pausepoints, mixed-mode debug)."
---

# Unity Expert

One skill for all Unity work. Use the routing table to find your domain, read the relevant knowledge files, then implement. The skill assumes Rider is the editor — coordinate IDE actions through the `ide` skill (run configs, debugger, inspections, search).

## Checklist

1. **Route** — identify domain, find knowledge files in the table below
2. **Read** — read domain guide + reference files before writing anything
3. **Pre-flight** — confirm Unity version (`ProjectSettings/ProjectVersion.txt`), render pipeline (`GraphicsSettings`), asmdef layout; grep existing source for patterns
4. **Implement** — write code matching project conventions; respect asmdef boundaries
5. **Compile** — let Unity recompile (Rider auto-refreshes the project); resolve every console error before proceeding
6. **Verify** — enter Play Mode (or run Edit/Play tests); watch Console for warnings/exceptions; use Profiler if perf-sensitive

---

## Universal Rules (apply to ALL Unity work)

1. **NEVER call Unity API off the main thread** — `Transform`, `GameObject`, `Object`, `Camera.main`, most `*.instance` accessors throw `UnityException: <api> can only be called from the main thread`. Use `Awaitable`, `UniTask`, or marshal back via `SynchronizationContext`/main-thread dispatcher.
2. **NEVER `new MonoBehaviour()` or `new ScriptableObject()`** — instantiate via `AddComponent<T>()` / `ScriptableObject.CreateInstance<T>()`. Direct `new` produces a zombie object that bypasses Unity's lifecycle and serialization.
3. **NEVER store references to destroyed Objects** — Unity overloads `==` so destroyed objects compare equal to `null`, but the C# reference is non-null; the trap is async/`await` resuming after `OnDestroy`. Re-check `obj == null` (Unity-aware) after any await/coroutine yield.
4. **Cache `GetComponent`, `Camera.main`, `transform`** — every access is an internal lookup. Cache in `Awake()`; never call in `Update`. `Camera.main` does a tag scan each call.
5. **Serialized fields**: `[SerializeField] private` is the Unity-idiomatic form. Public fields work but leak API. `readonly`, properties, and `static` are **not** serialized. Reference types need `[Serializable]` on the class.
6. **Awake vs Start vs OnEnable** — `Awake` runs once when the component is created (even if disabled); `OnEnable` every time it becomes active; `Start` only on the first enable before the first `Update`. Cross-component refs in `Awake` aren't safe — use `Start`.
7. **Time**: `Time.deltaTime` in `Update`, `Time.fixedDeltaTime` in `FixedUpdate`. Physics changes belong in `FixedUpdate`. `Time.timeScale = 0` pauses `Update` (deltaTime → 0) but `unscaledDeltaTime` keeps running.
8. **Coroutines die with the GameObject** — `StartCoroutine` is bound to the MonoBehaviour. Disabling the object stops it; destroying it cancels it. For lifetime independent of object state use `async`/`Awaitable` (Unity 2023+) with explicit cancellation.
9. **Editor-only code must be `#if UNITY_EDITOR` or in an `Editor/` folder** — `UnityEditor.*` references in a runtime asmdef break player builds.
10. **Match asmdef boundaries** — adding a `using` from an asmdef not referenced by yours produces `The type or namespace could not be found`. Add the reference to the asmdef, not just the file.

---

## Domain Routing Table

| Domain | When to use | Knowledge files |
|--------|-------------|-----------------|
| **Scripting / MonoBehaviour** | Component lifecycle, execution order, serialization, MessageReceiver patterns, attributes | `script-lifecycle.md`, `script-serialization.md`, `script-execution-order.md`, `script-attributes.md` |
| **ScriptableObject** | Data containers, runtime sets, event channels, settings assets | `so-data-containers.md`, `so-event-channels.md`, `so-pitfalls.md` |
| **Prefabs & Scenes** | Prefab variants, nested prefabs, scene additive loading, cross-scene references | `prefab-variants.md`, `prefab-overrides.md`, `scene-management.md`, `scene-streaming.md` |
| **Input System** | Action maps, control schemes, bindings, rebinding, devices, PlayerInput vs C# class | `input-action-asset.md`, `input-playerinput.md`, `input-rebinding.md`, `input-multiplayer.md` |
| **UI — UGUI** | Canvas, RectTransform, layout groups, TextMeshPro, raycasters, EventSystem | `ui-ugui-layout.md`, `ui-canvas-perf.md`, `ui-tmp.md`, `ui-events.md` |
| **UI — UI Toolkit** | UXML, USS, runtime UI, editor UI, data binding, custom controls | `uitk-uxml-uss.md`, `uitk-runtime.md`, `uitk-editor.md`, `uitk-data-binding.md` |
| **Animation** | Animator, state machines, blend trees, Mecanim parameters, Timeline, animation events, Humanoid IK | `anim-controller.md`, `anim-blend-trees.md`, `anim-events.md`, `anim-timeline.md`, `anim-ik-humanoid.md` |
| **Physics 3D / 2D** | Rigidbody, colliders, layers & matrix, queries (Raycast/Overlap), joints, character controller | `physics-rigidbody.md`, `physics-colliders-layers.md`, `physics-queries.md`, `physics-joints.md`, `physics-2d.md` |
| **Rendering — URP** | URP asset, Renderer Features, scriptable render passes, shadows, post-processing | `urp-pipeline.md`, `urp-renderer-features.md`, `urp-postfx.md` |
| **Rendering — HDRP** | HDRP volumes, path tracing, ray tracing, custom passes | `hdrp-volumes.md`, `hdrp-passes.md`, `hdrp-pathtrace.md` |
| **Shaders** | Shader Graph, HLSL, ShaderLab, Standard/URP/HDRP variants, shader keywords/variants | `shader-shadergraph.md`, `shader-hlsl-urp.md`, `shader-variants.md`, `shader-srp-batcher.md` |
| **Networking — NGO** | NetworkBehaviour, NetworkVariable, RPCs, NetworkObject, transport, lobby & matchmaking | `net-ngo-fundamentals.md`, `net-ngo-rpcs.md`, `net-ngo-spawning.md`, `net-ngo-transport.md`, `net-multiplayer-services.md` |
| **DOTS / ECS** | Entities 1.x, SystemBase/ISystem, IJobEntity, Burst, NativeArray, Aspects, BakingSystem | `ecs-entities.md`, `ecs-systems.md`, `ecs-jobs-burst.md`, `ecs-baking.md`, `ecs-physics.md` |
| **Asset Pipeline** | Importers, AssetPostprocessor, GUID/meta, AssetDatabase v2, asset variants | `asset-import.md`, `asset-postprocessor.md`, `asset-database.md`, `asset-meta-guid.md` |
| **Addressables** | Groups, labels, async load/release, content catalogs, remote builds | `addr-groups.md`, `addr-loading.md`, `addr-remote-catalogs.md`, `addr-memory.md` |
| **Editor Scripting** | Custom inspectors, EditorWindow, PropertyDrawer, SceneView gizmos, IMGUI vs UI Toolkit | `editor-inspectors.md`, `editor-window.md`, `editor-property-drawers.md`, `editor-handles-gizmos.md` |
| **Profiling** | Unity Profiler markers, Memory Profiler, Frame Debugger, Deep Profile, Profile Analyzer | `profile-cpu.md`, `profile-gpu.md`, `profile-memory.md`, `profile-frame-debugger.md` |
| **Testing** | Unity Test Framework, EditMode vs PlayMode tests, Test Runner, NSubstitute, asmdef test refs | `test-framework.md`, `test-editmode.md`, `test-playmode.md`, `test-asmdef.md` |
| **Build** | `BuildPipeline.BuildPlayer`, Build Profiles (Unity 6), platform settings, IL2CPP, scripting backend | `build-pipeline.md`, `build-profiles.md`, `build-il2cpp.md`, `build-platforms.md` — use `scripts/unity-build.sh` |
| **Audio** | AudioSource, AudioMixer, snapshots, spatializer plugins, AudioClip streaming | `audio-mixer.md`, `audio-spatial.md`, `audio-streaming.md` |
| **VFX** | Particle System, VFX Graph, GPU events, exposed properties from C# | `vfx-particle-system.md`, `vfx-graph.md`, `vfx-exposed.md` |
| **Debugging** | Console exceptions, missing script refs, build/player crashes, IL2CPP stripping, native stack traces | `debug-console.md`, `debug-missing-refs.md`, `debug-il2cpp-stripping.md`, `debug-player-logs.md` |
| **Packages** | UPM (Package Manager), git/scoped registries, local packages, embedded packages | `pkg-upm.md`, `pkg-git.md`, `pkg-local-embedded.md` |
| **Assembly Definitions** | asmdef, asmref, define constraints, version defines, precompiled refs | `asmdef-structure.md`, `asmdef-defines.md`, `asmdef-test-refs.md` |

---

## Domain Critical Rules

### Scripting / MonoBehaviour
1. **Lifecycle order**: `Awake` → `OnEnable` → `Start` → (`FixedUpdate` × N) → `Update` → `LateUpdate` → `OnDisable` → `OnDestroy`. Cross-component setup belongs in `Start`, not `Awake`.
2. **`[SerializeField] private` over `public`** — exposes to Inspector without leaking API. Add `[field: SerializeField]` to serialize auto-properties.
3. **Don't `Destroy(this)` from `Awake`** — leaves the object in a half-initialized state; use `DestroyImmediate` only in editor scripts, never in runtime.
4. **`OnValidate` runs in editor every Inspector change AND on script reload** — keep it cheap; never instantiate or `Destroy` from it (logs a warning and is unsafe).
5. **`ExecutionOrder` attribute** vs Script Execution Order project setting — attribute travels with code, project setting wins on conflict.
6. **`[RequireComponent]` only adds, never enforces at runtime** — removing the required component later is silently allowed in code.
7. **`DontDestroyOnLoad` only works on root GameObjects** — child objects raise a warning and are not preserved.

### ScriptableObject
1. **SO instances persist across Play Mode in the editor** — runtime mutations leak into Edit Mode and serialize back to disk. Reset state in `OnEnable` or use a runtime copy.
2. **`CreateInstance<T>()` — never `new T()`** — `new` bypasses Unity's object system; the asset will not serialize or appear in inspector.
3. **Don't store scene refs on shared SOs** — the reference is invalidated on scene unload and serialization will lose it on domain reload.
4. **Use `OnEnable` for SO init, not constructor** — constructor runs before Unity has wired the object.
5. **SubAsset SOs (`AssetDatabase.AddObjectToAsset`)** — must call `AssetDatabase.SaveAssets()` and mark dirty; otherwise they vanish on editor restart.

### Prefabs & Scenes
1. **Prefab variants inherit overrides** — applying changes on a variant only writes that variant; the base is untouched.
2. **Nested prefabs reference by GUID, not path** — moving the inner prefab does not break the outer; deleting it leaves a "Missing Prefab" entry.
3. **`PrefabUtility.InstantiatePrefab` preserves the prefab link**; `Object.Instantiate` produces a runtime clone with no prefab connection.
4. **Cross-scene references are not supported** in serialized fields — Unity silently nulls them. Use `LoadSceneMode.Additive` + runtime lookup or Addressables.
5. **`SceneManager.LoadSceneAsync` is single-frame-deferred** — newly loaded objects are not available until the next frame after `allowSceneActivation` completes.
6. **`DontDestroyOnLoad` objects accumulate across scene loads** — guard singletons with an instance check and `Destroy(gameObject)` on duplicate.

### Input System (new)
1. **`PlayerInput.actions` is a shared asset** — modifying it (e.g., rebinding) affects every PlayerInput. Clone with `actions = Instantiate(actions)` for per-player bindings.
2. **`InputAction.performed` fires at the trigger threshold; `started`/`canceled` for gesture boundaries** — using `performed` for "key down" misses hold-style interactions.
3. **Disable actions you're not listening to** — every enabled action consumes processing each frame, even with no callbacks.
4. **Composite bindings (WASD, 2D vector) require all parts in the same control scheme** — mixing keyboard and gamepad bindings inside one composite silently breaks scheme detection.
5. **`InputSystem.onAfterUpdate` not `Update`** for low-latency input — `Update` reads input from the previous frame's poll on some platforms.
6. **Rebinding with `PerformInteractiveRebinding` blocks the action** — you must `Disable()` before, `Enable()` after.
7. **Old Input Manager (`Input.GetKey`) and new Input System are mutually exclusive by default** — flip "Active Input Handling" to *Both* if you must interop.

### UI — UGUI
1. **Canvases are the rebuild unit** — any change to a child rebuilds the whole canvas mesh. Split static and dynamic UI into separate canvases.
2. **`SetActive(false)` triggers a canvas rebuild on re-enable** — use `CanvasGroup.alpha = 0` + `interactable = false` to hide cheaply.
3. **Layout Groups force a layout rebuild every change** — disable `Layout Group` after final layout if children are static (`enabled = false`).
4. **`GraphicRaycaster` raycasts every child Graphic each frame** — set `raycastTarget = false` on non-interactive Images/Text; this is the #1 UGUI hotspot.
5. **TextMeshPro fallback fonts cause Atlas regeneration** — runtime characters added to a Dynamic atlas regen the texture; pre-bake glyphs for performance.
6. **`Canvas.pixelPerfect` and `Screen Space - Overlay` ignore camera** — overlay canvases render on top of everything regardless of camera stack.

### UI — UI Toolkit
1. **UI Toolkit uses USS, not CSS** — looks similar but lacks pseudo-elements, animations limited to transitions, no media queries (use `MediaQueryList` substitute via runtime checks).
2. **`UQueryBuilder` caches selectors but `Q<T>()` does not** — repeated `rootVisualElement.Q<Button>("btn")` is a tree walk every call; cache the reference.
3. **PanelSettings scale mode affects layout** — `ScaleWithScreenSize` vs `ConstantPixelSize` cascade differently to children.
4. **DataBinding (Unity 6+) requires `INotifyBindablePropertyChanged`** — POCOs without it bind once and never update.
5. **VisualTreeAsset clones, not instances** — `tree.Instantiate()` produces a fresh hierarchy each call; cache instantiated subtrees if reused.

### Animation
1. **Animator parameters set via `SetTrigger` queue across frames** — calling `ResetTrigger` is required if you set a trigger that won't be consumed.
2. **Root motion requires `Apply Root Motion` on the Animator AND the controller must drive root** — mismatched config produces sliding feet or zero movement.
3. **State machine transitions evaluate in order** — first matching wins; ordering matters when multiple conditions overlap.
4. **`Animator.Update(0)` forces a sample** — needed when teleporting to avoid the old pose blending for a frame.
5. **Animation Events fire at frame boundaries on the Animator's update mode** — `UpdateMode = AnimatePhysics` fires in `FixedUpdate`, not `Update`.
6. **Timeline signals require a SignalReceiver on the bound GameObject** — silently no-op without it.
7. **Humanoid retargeting works only if Avatar Definition matches** — Generic clips on a Humanoid rig produce T-pose at runtime.

### Physics 3D / 2D
1. **Set Rigidbody state in `FixedUpdate`** — `Update` writes are overwritten by the physics step; use `MovePosition`/`MoveRotation`, never `transform.position`.
2. **Layer Collision Matrix is project-wide** — overrides via `Physics.IgnoreCollision` are NOT serialized; reset on scene reload.
3. **`OnTriggerEnter` requires `isTrigger` on ONE collider AND a Rigidbody on at least one side** — missing Rigidbody = no events even with both triggers.
4. **`Raycast` against trigger colliders is off by default** — `Physics.queriesHitTriggers` is project-wide; pass `QueryTriggerInteraction` explicitly per call.
5. **Compound colliders need ONE Rigidbody on the root** — children with their own Rigidbody behave as independent bodies, breaking the compound.
6. **`Physics2D` and `Physics` are separate engines** — 2D colliders don't interact with 3D Rigidbodies; check Physics2D-specific overloads.
7. **Continuous collision is asymmetric** — set `collisionDetectionMode` on the FAST body; the slow body can stay Discrete.
8. **`CharacterController.Move` is the only correct mover for it** — setting `transform.position` desyncs internal collision state.

### Rendering — URP / HDRP / Shaders
1. **One render pipeline per project** — switching URP↔HDRP requires re-authoring all materials; URP shaders are pink in HDRP and vice versa.
2. **SRP Batcher requires `CBUFFER_START(UnityPerMaterial)`** in custom shaders — missing it disables batching for every material using the shader, tanking draw call count.
3. **Shader variants explode by keyword count** — every `#pragma multi_compile` doubles variants; use `shader_feature` for variants that ship per-material.
4. **Shader Graph and HLSL coexist via Custom Function nodes** — but `#include` paths must be relative to the `.shadergraph`, not the Asset root.
5. **URP Renderer Features inject ScriptableRenderPasses at specified events** — wrong injection point = wrong target (e.g., post-tonemapping draws over UI).
6. **`Camera.main` does a `FindGameObjectWithTag("MainCamera")` scan every call** — cache it; multiple cameras with the tag pick non-deterministically.
7. **HDRP requires Linear color space and Forward+ (Unity 6) or Deferred** — Gamma color space silently breaks lighting math.

### Networking — Netcode for GameObjects (NGO)
1. **`NetworkObject` must be on the prefab root** — non-root spawns and child-only NetworkBehaviours are not allowed.
2. **`NetworkVariable<T>` writes must happen on the owner (`OwnerOnly` permission) or server (`Server` permission)** — wrong-side writes are silently dropped.
3. **RPCs require `[Rpc(SendTo.*)]` in Unity 6 / NGO 2.x** — old `[ServerRpc]`/`[ClientRpc]` still work but the new attribute is the documented path.
4. **`OnNetworkSpawn` replaces `Start` for network objects** — `Start` may run before the object has its NetworkObject ID assigned.
5. **Scene management runs through `NetworkSceneManager`** — calling `SceneManager.LoadScene` directly while NGO is active desyncs clients.
6. **Connection approval is opt-in** — without it, anyone connecting to the listen port joins; enable `ConnectionApproval = true` and provide a callback.
7. **NetworkTransform interpolation is enabled by default** — disable for non-smoothed objects (instant teleport), or jitter masks real bugs.

### DOTS / ECS / Burst
1. **Burst-compiled jobs cannot access managed objects** — no `GameObject`, no `string`, no managed arrays. Pass `NativeArray<T>`, blittable structs only.
2. **`SystemBase` runs on the main thread by default; use `Entities.ForEach.Schedule()` or `IJobEntity` for parallel** — `Run()` is main-thread, `Schedule()` is the worker pool, `ScheduleParallel()` parallelizes per chunk.
3. **`EntityCommandBuffer` is required to create/destroy entities inside a job** — direct `EntityManager` calls are main-thread-only and structurally invalidate iteration.
4. **Authoring → Baking → Runtime** — GameObject conversion runs in Baking systems; `IComponentData` you add at runtime is separate from baked components.
5. **`SystemAPI.Query<>` only works inside `OnUpdate`** — outside it, the source generator hasn't wired the cache.
6. **Burst requires `[BurstCompile]` on BOTH the type and the method** — missing on either falls back to Mono with no warning unless Synchronous Compilation is on.
7. **Native containers leak unless disposed** — `NativeArray` with `Allocator.TempJob` must be disposed within 4 frames or Unity logs a leak error.
8. **DOTS Physics and built-in Physics are different** — `Unity.Physics` vs `UnityEngine.Physics`; collider components, queries, and units are not interchangeable.

### Asset Pipeline & Addressables
1. **`.meta` files are source of truth for GUIDs** — never gitignore them; deleting a .meta randomizes the GUID and breaks every reference.
2. **`AssetPostprocessor` callbacks run for ALL assets matching the type** — guard by path or extension early or you'll slow every import.
3. **`AssetDatabase.Refresh()` blocks the editor for a full reimport scan** — call only after batch operations; use `AssetDatabase.StartAssetEditing()`/`StopAssetEditing()` to batch.
4. **Addressables `LoadAssetAsync` increments a ref-count** — every load needs a matching `Release` or the asset stays in memory forever.
5. **Catalog loads at startup** — remote catalogs need network on first run; pre-cache the catalog or ship a local fallback.
6. **`AssetReference` vs direct `[SerializeField]`** — direct refs include the asset in the build via dependency tracking; `AssetReference` defers loading via Addressables groups.
7. **Streaming Assets is NOT writable on most platforms** — use `Application.persistentDataPath` for runtime writes.

### Editor Scripting
1. **`UnityEditor.*` types must live under an `Editor/` folder or an editor-only asmdef** — referencing them from a runtime asmdef breaks player builds with cryptic errors.
2. **`EditorWindow` instances persist across domain reloads via `[SerializeField]`** — non-serialized fields are wiped; rebuild them in `OnEnable`.
3. **`SerializedProperty.serializedObject.ApplyModifiedProperties()` is required** — direct field writes via `SerializedProperty` don't persist without `Apply`.
4. **`OnInspectorGUI` runs MANY times per frame** — never instantiate objects or run expensive work; cache aggressively.
5. **`MenuItem` paths use `/` as separator; second-arg `priority` controls grouping (separators every 50 between adjacent items)**.
6. **`EditorApplication.update` runs in edit mode and play mode** — subscribe selectively or unhook in `OnDisable`.
7. **`AssetDatabase` calls during `OnPostprocessAllAssets` can re-enter the import pipeline** — guard against recursion.

### Profiling
1. **Profile a Development Build on the target device** — Editor profiles include editor overhead and Mono JIT, not IL2CPP runtime characteristics.
2. **Deep Profile slows the game 10–100x** — use only to find which method, then disable.
3. **`Profiler.BeginSample`/`EndSample` must be paired** — unpaired samples corrupt the marker tree.
4. **GC alloc is reported per-frame in the Profiler** — chase the call site via `GC.Alloc` markers; common culprits: `foreach` over interfaces, `string` concatenation, closures, boxed enum dictionary keys.
5. **Frame Debugger only shows the editor's last frame** — capture in Play Mode and pause; do not navigate menus before capture.
6. **Memory Profiler snapshots are large** — store outside the project or they get versioned.

### Testing
1. **EditMode tests run on the main thread with no scene loaded** — `Object.Instantiate(MonoBehaviour)` works but `Awake`/`Start` don't run until the test scene is set up.
2. **PlayMode tests need `[UnityTest]` and `IEnumerator`** — `[Test]` runs synchronously; use `yield return null` to wait one frame.
3. **Test asmdef must reference `nunit.framework.dll`, `UnityEngine.TestRunner`, `UnityEditor.TestRunner` (EditMode), and the asmdefs of code under test**.
4. **`[UnityPlatform]` restricts where a test runs** — useful for editor-only or platform-specific tests; without it, runs everywhere.
5. **`LogAssert.Expect` consumes one log message** — un-expected errors fail the test; expect them or filter via `LogAssert.ignoreFailingMessages`.
6. **Coverage requires the Code Coverage package and a fresh editor restart** — coverage flags are CLI-level.

### Build
1. **Use `BuildPipeline.BuildPlayer` from an editor script invoked via `-executeMethod`** — direct `-buildTarget` flags are legacy and ignore Build Profiles (Unity 6).
2. **Build Profiles (Unity 6) replace Build Settings for per-platform variants** — `BuildProfile.GetActiveBuildProfile()` is the runtime entry point.
3. **IL2CPP code stripping breaks reflection** — annotate types with `[Preserve]` or list in `link.xml`; `JsonUtility`/`Newtonsoft.Json` on stripped types silently produces empty objects.
4. **`Application.targetFrameRate` is `-1` (vsync) by default in player, `30` on mobile** — set explicitly per-platform.
5. **`-batchmode -nographics` skips graphics device init** — many shaders/assets fail to import; use `-batchmode` alone for builds that touch graphics.
6. **`-quit` is required to terminate batchmode** — without it the editor stays alive after the build method returns.
7. **Player log location**: macOS `~/Library/Logs/<Company>/<Product>/Player.log`, Windows `%USERPROFILE%\AppData\LocalLow\<Company>\<Product>\Player.log`, Linux `~/.config/unity3d/<Company>/<Product>/Player.log`.

### Debugging
1. **"MissingReferenceException: The object of type X has been destroyed"** — code is holding a stale reference past `Destroy`; guard with the Unity null check (`if (obj == null)`) which respects fake-null.
2. **"The associated script can not be loaded"** — class renamed/moved without an asmdef refresh; restore via GUID mapping in the .unity/.prefab text dump.
3. **IL2CPP build crashes on first frame** — usually code stripping removed a type used via reflection; `link.xml` is the fix.
4. **`DllNotFoundException` in editor but works in player (or vice versa)** — native plugin Platform Settings are misconfigured; check Plugin Inspector's CPU/OS matrix.
5. **Console hides duplicate exceptions** — toggle "Collapse" off; one error message can mask a flood.
6. **"All compiler errors have to be fixed before you can enter playmode"** — never disable; the underlying error is in another asmdef. Check `Editor.log` for the full chain.

### Packages / asmdef
1. **`asmdef` file name = assembly name** — renaming the file renames the DLL; references break until reimport.
2. **`Define Constraints` on asmdef** — assembly compiles ONLY when ALL defines are present; useful for platform-only modules.
3. **`Version Defines` map package versions to scripting defines** — for cross-version compatibility without `#if UNITY_2022_3_OR_NEWER` strings.
4. **A `using` to a non-referenced asmdef** produces `CS0234` — fix by adding the reference, not by using the fully-qualified type.
5. **`asmref` extends an existing asmdef** with extra source folders — useful for editor utilities living next to runtime code.
6. **Embedded packages (`Packages/<name>` with full source)** override registry packages of the same name — common pitfall when a fork is forgotten.
7. **Git packages pin via `#<sha>` or `#<tag>`** in `manifest.json`; without it you get HEAD on every refresh.

---

## Rider × Unity workflow (use the `ide` skill)

| Need | How |
|------|-----|
| Run Play Mode | `ide:runner` → execute the auto-generated **Attach to Unity Editor & Play** configuration |
| Debug a script during Play Mode | `ide:debugger` → start session on **Attach to Unity Editor & Play**; set breakpoints; Rider attaches over the Unity debugging protocol |
| Debug a built Player | Build with **Development Build** AND **Script Debugging** ticked; in Rider attach via **Attach to Unity Process** (`ide:debugger` → start by config name) |
| Run a test | `ide:runner` on the test method's gutter line — Unity Test Framework configurations are discovered |
| Find a MonoBehaviour by type | `ide:search` → `search_symbol` (semantic, declaration-aware); `search_file` for `*.unity`/`*.prefab` |
| Lint / find performance warnings | `ide:quality` → `get_file_problems` (Rider's Unity inspections flag `Camera.main` in `Update`, `string` to `Animator.SetTrigger`, etc.) |
| Apply Rider's Unity quick-fix (cache `GetComponent`, use `CompareTag`) | `ide:quality` → `apply_quick_fix` with the exact fixName |
| Pausepoint (pause Unity at end-of-frame, inspect via Editor Inspector) | Set via Rider gutter as a "Unity Pausepoint"; control via `ide:debugger` `xdebug_set_breakpoint` with `suspendPolicy=NONE` and the pausepoint marker |
| Mixed-mode debug (managed + native) | Enabled in the run config; managed-only is faster — only enable when chasing native plugin crashes |

**Rider 2026.1+ Unity Profiler integration** — Rider can attach to the Unity Profiler and surface frame data inline; use it before reaching for Unity's standalone Profiler window for quick checks.

**Script refresh** — Rider triggers Unity's Asset Refresh on save by default (Rider Unity plugin setting). If you edit files outside Rider, focus the Unity Editor to force a recompile (or call `AssetDatabase.Refresh()` from menu/script). Never bypass this — running in Play Mode against stale assemblies silently runs old code.

---

## Build script

```bash
# Headless build invoking an editor method (Build Profiles in Unity 6)
bash ${CLAUDE_SKILL_DIR}/scripts/unity-build.sh \
  --project "/path/to/UnityProject" \
  --method "BuildScripts.CI.BuildMac" \
  --log /tmp/unity-build.log
```

The editor method (a `[MenuItem]` or any `public static` method in an `Editor/` asmdef) is expected to call `BuildPipeline.BuildPlayer(...)` — Unity 6 also exposes `BuildPipeline.BuildPlayer(BuildPlayerWithProfileOptions)` for Build Profile workflows.

Minimal editor-side helper to put in the project's `Editor/` asmdef:

```csharp
public static class BuildScripts
{
    public static void BuildMac()
    {
        var opts = new BuildPlayerOptions
        {
            scenes = EditorBuildSettings.scenes
                .Where(s => s.enabled).Select(s => s.path).ToArray(),
            locationPathName = Environment.GetEnvironmentVariable("BUILD_OUT")
                               ?? "Builds/Mac/Game.app",
            target = BuildTarget.StandaloneOSX,
            options = BuildOptions.None
        };
        var report = BuildPipeline.BuildPlayer(opts);
        if (report.summary.result != BuildResult.Succeeded)
            EditorApplication.Exit(1);
    }
}
```

Common batchmode flags: `-batchmode -quit -nographics -projectPath <path> -executeMethod <Type.Method> -logFile <path> -buildTarget <Target>`. Omit `-nographics` if the build path touches shaders / asset import that requires a GPU device.

---

## Long-running operations (build / asset import / library rebuild)

Unity builds and full asset reimports routinely take 5–60+ minutes (longer on first-open / cache miss / IL2CPP). NEVER run them in the foreground. Same protocol as the UE skill:

1. **Launch in background**, redirecting all output to a log file. Call `Bash` with `run_in_background: true`. Capture the shell ID.
2. **Monitor**: pick ONE.
   - `Monitor` tool with an `until` loop watching for terminal markers:
     ```bash
     until grep -qE "(Build succeeded|Build [Ff]ailed|error CS[0-9]+|UnityException|Exiting batchmode successfully|Failed to compile player scripts)" /tmp/unity-build.log; do sleep 30; done
     ```
   - `ScheduleWakeup` at 270s (cache-warm) or 1200s+ (cache-miss) intervals.
3. **Report only what is true** — PID, log path, monitor state.
4. **On completion**, tail ~100 lines, confirm success marker, report output path + elapsed time.
5. **On failure**, grep the log for `error CS`, `UnityException`, `Failed to`, `Exception:` near the tail; show the relevant excerpt.

Useful log markers:
- Compile errors: `error CS####:`
- Test failure: `Test failed:`
- IL2CPP failure: `IL2CPP error`
- Asset import failure: `Failed to import`, `ImportFBXErrors`
- Native crash in batchmode: `Receiving unhandled NULL exception`
- Successful exit: `Exiting batchmode successfully`

---

## Knowledge Files (to be authored alongside the skill)

Each row in the routing table names the markdown files that should live under `reference/`. They are not yet generated — when adding deep knowledge for a domain, create the files there and keep the routing table up to date. Start by reading whatever exists; if a domain's file is missing, fall back to web docs and the live project, then capture what you learned into a new reference file so future work doesn't repeat the research.
