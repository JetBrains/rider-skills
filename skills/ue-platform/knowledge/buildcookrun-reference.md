# BuildCookRun Complete Flag Reference

RunUAT location:
- **Windows**: `<UE_ROOT>/Engine/Build/BatchFiles/RunUAT.bat`
- **Linux/Mac**: `<UE_ROOT>/Engine/Build/BatchFiles/RunUAT.sh`

Source of truth for all parameters: `Engine/Source/Programs/AutomationTool/AutomationUtils/ProjectParams.cs`

## AutomationTool Global Flags

| Flag | Description |
|------|-------------|
| `-verbose` | Verbose logging |
| `-nop4` | Disable Perforce (default if not on build machine) |
| `-compile` | Dynamically compile all commands |
| `-forcelocal` | Force local execution |
| `-help` | Display help |
| `-list` | List all available commands |
| `-nokill` | Don't kill spawned processes on exit |
| `-ignorejunk` | Prevent UBT from cleaning junk files |
| `-utf8output` | Force UTF-8 stdout encoding |

## Project & Platform

| Flag | Description |
|------|-------------|
| `-project=<Path>` | Path to .uproject (required) |
| `-targetplatform=<Name>` | Target: `Win64`, `Linux`, `LinuxArm64`, `Mac`, `Android`, `IOS` |
| `-servertargetplatform=<Name>` | Server target platform |
| `-platform=<Name>` | Alias for `-targetplatform` |
| `-clientconfig=<Config>` | Client config: `Debug`, `DebugGame`, `Development`, `Test`, `Shipping` |
| `-serverconfig=<Config>` | Server build configuration |

Multiple platforms: `-targetplatform=Win64+Linux`

## Build Flags

| Flag | Description |
|------|-------------|
| `-build` | Execute build (compile) step |
| `-skipbuild` / `-NoCompile` | Skip compilation |
| `-NoCompileEditor` | Skip editor target compilation |
| `-clean` | Delete intermediates and previous cooked/staged output |
| `-noxge` | Disable XGE (IncrediBuild) |
| `-ForceMonolithic` | Single executable |
| `-ForceDebugInfo` | Force debug info in Development |
| `-ForceNonUnity` | Disable unity build |
| `-ForceUnity` | Force unity build |
| `-CrashReporter` | Build crash reporter |
| `-NoSign` | Skip code signing |
| `-UbtArgs="..."` | Pass extra options to UnrealBuildTool |

## Cook Flags

| Flag | Description |
|------|-------------|
| `-cook` | Enable cooking |
| `-skipcook` | Skip cook (assume data is up-to-date) |
| `-cookonthefly` | Start cook-on-the-fly server |
| `-Cookontheflystreaming` | Stream without local caching |
| `-iterativecooking` / `-iterate` | Only re-cook changed assets |
| `-CookAll` | Cook ALL content in project |
| `-CookMapsOnly` | With `-CookAll`, only maps |
| `-allmaps` | Cook all maps (needs `[AllMaps]` in DefaultEditor.ini) |
| `-map=Map1+Map2+Map3` | Cook specific maps |
| `-SkipCookingEditorContent` | Skip `/Engine/Editor` content |
| `-CookInEditor` | Use editor cooker instead of UAT |
| `-IgnoreCookErrors` | Continue despite cook errors |
| `-FastCook` | Fast cook path if supported |
| `-CookPartialgc` | GC packages during cooking |
| `-unversionedcookedcontent` | Remove version signatures (harder to mod) |
| `-CookCultures=en+fr+de` | Specific cultures/locales |

## Packaging & Distribution Flags

| Flag | Description |
|------|-------------|
| `-package` | Package for platform-native format |
| `-pak` | Store cooked content in .pak files |
| `-iostore` | IoStore format (.ucas/.utoc) — modern UE5, faster I/O |
| `-compressed` | Compress pak (smaller, slower load) |
| `-signpak=<keys>` | Sign pak with encryption keys |
| `-signed` | Expect signed paks |
| `-skippak` | Skip pak creation |
| `-prereqs` | Include prerequisite installers (DirectX, VC++ redist) |
| `-distribution` | Store-ready distribution build |
| `-nodebuginfo` | Exclude .pdb from staging |
| `-separatedebuginfo` | Debug info to separate directory |
| `-MapFile` | Generate .map file |
| `-encryptinifiles` | Encrypt .ini in pak |
| `-manifests` | Generate streaming install manifests |
| `-createchunkinstall` | Chunk-based install data |

## Staging & Archiving

| Flag | Description |
|------|-------------|
| `-stage` | Copy build to staging directory |
| `-skipstage` | Skip staging |
| `-nocleanstage` | Don't clean staging first |
| `-stagingdirectory=<Path>` | Custom staging path |
| `-archive` | Copy to archive directory |
| `-archivedirectory=<Path>` | Archive output path |
| `-archivemetadata` | Include metadata |
| `-createappbundle` | macOS .app bundle |

## Deploy & Run

| Flag | Description |
|------|-------------|
| `-deploy` | Deploy to target device |
| `-run` | Launch game after packaging |
| `-device=<Id>` | Device to deploy/run on |
| `-serverdevice=<Id>` | Server device |
| `-dedicatedserver` / `-server` | Dedicated server build |
| `-noclient` | Server only |
| `-client` | Build both client and server |
| `-numclients=N` | Launch N extra clients |
| `-nullrhi` | Headless rendering |
| `-unattended` | No operator, auto-terminate |
| `-RunAutomationTests` | Run tests after launch |
| `-RunTimeoutSeconds=N` | Game launch timeout |

## Command Line Passthrough

| Flag | Description |
|------|-------------|
| `-cmdline="..."` | Written to UE4CommandLine.txt |
| `-addcmdline="..."` | Additional program arguments |
| `-servercmdline="..."` | Additional server arguments |
| `-clientcmdline="..."` | Override client arguments |

## Patching & DLC

| Flag | Description |
|------|-------------|
| `-createreleaseversion=<Ver>` | Create release baseline for future patches |
| `-basedonreleaseversion=<Ver>` | Generate patch based on this version |
| `-generatepatch` | Produce patch pak with only changed content |
| `-generatechunks` | Chunk-based content for streaming install |

## Pipeline Stages

| Stage | What Happens |
|-------|-------------|
| **Build** | Compile C++ into executables for target platform |
| **Cook** | Convert .uasset/.umap to platform-optimized runtime format. Strip editor data. Compile shaders. |
| **Stage** | Copy cooked content + binaries + configs to staging layout |
| **Package** | Bundle into platform-native format (pak/IoStore, APK, IPA) |
| **Archive** | Copy final build to output directory |
| **Deploy** | Push to target device |
| **Run** | Launch on device |

Cook is content transformation; Package is content bundling. You can cook without packaging, but not package without cooking.
