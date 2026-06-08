---
name: ue:platform
description: "Use when user asks about ini config files, platform-specific settings, packaging a build, deploying to device, turnkey SDKs, mobile deployment, iOS/Android signing, code signing certificates, provisioning profiles, or release automation. DO NOT TRIGGER for compiling C++ (use ue:builder), writing game code (use ue:coder), or graphics configuration CVars (use ue:graphics)."
allowed-tools: Read, Bash, Edit, Glob, Grep
argument-hint: "[config|package|deploy] [--platform Win64|IOS|Android] [--config Shipping]"
---

See [Reference Image Handling](../_shared/reference-image-handling.md)

## Knowledge Retrieval

Before answering:
1. Resolve the `unrealengine` library in Context7 (see `../_shared/context7-protocol.md`)
2. Fetch the section relevant to this query
3. Merge with local knowledge files — Context7 wins on version-specific details, local knowledge wins on workflow/patterns

# UE Platform

Single skill for the full build-to-device pipeline: ini configuration, platform targeting, packaging/cooking, and deployment.

## Checklist

Call `TaskCreate` for each item below before starting, then mark each `in_progress` / `completed` as you go:

1. **Clarify** — target platform, build configuration, deployment destination
2. **Configure** — ini files, platform-specific settings, SDK/toolchain check
3. **Package** — run packaging script; monitor for cook or compile errors
4. **Deploy** — install to device or distribute build artifact; verify launch

---

## 1. Configuration (.ini Files)

### CRITICAL — Mistakes That Waste Hours

1. **Config hierarchy: Engine < Project < Platform < Saved — later overrides earlier.** Always verify which layer you need before editing.
2. **Section headers are CASE-SENSITIVE** — `[/Script/Engine.RendererSettings]` ≠ `[/script/engine.renderersettings]`. Copy-paste from engine source; never type from memory.
3. **`+Array` appends, `=` replaces** — using `=` on an array wipes inherited values.
4. **`Saved/` configs override everything** — delete `Saved/Config/` and restart editor if changes don't appear.
5. **Platform dirs: `Windows/` not `Win64/`** — platform override directories are `Windows`, `Mac`, `Linux`, `IOS`, `Android`.
6. **Cook-time renderer settings CANNOT be overridden per-platform at runtime — causes black screen.** Never put `r.Substrate`, `r.Mobile.ShadingPath`, `r.DynamicGlobalIlluminationMethod`, or `r.ReflectionMethod` in platform override configs.

### Config Hierarchy

```
Priority (lowest → highest):
  Engine/Config/Base*.ini          ← Engine defaults (DO NOT EDIT)
  Engine/Config/Base<Platform>*.ini
  Project/Config/Default*.ini      ← MOST COMMON TO EDIT
  Project/Config/<Platform>/*      ← Platform overrides
  Project/Saved/Config/<Platform>/ ← User/runtime (highest priority, not in packaged builds)
  Command-line: -ini:Key=Value
```

### Workflow

1. Identify the correct config layer
2. Verify section header (copy-paste from engine source)
3. Use correct syntax (`+` for arrays, `=` for scalars)
4. For mobile/platform: check `knowledge/mobile-platform-config.md` FIRST
5. Delete `Saved/Config/` if testing — stale saved configs hide changes
6. Validate in editor console or Settings UI

---

## 2. Packaging

### Available Options

```
PLATFORMS:     Win64, Linux, LinuxArm64, Mac, Android, IOS
CONFIGS:       Development, Shipping, DebugGame, Test
COOK MODES:    Full, Iterative, Maps-only, Cook-on-the-fly
PAK FORMATS:   pak, pak+iostore, unpackaged
EXTRAS:        --compressed, --encrypted, --distribution, --server, --patch
```

### Run Packaging

```bash
# macOS/Linux
bash ${CLAUDE_SKILL_DIR}/scripts/ue-package.sh \
  --project "/path/to/Game.uproject" \
  --platform Win64 --config Shipping

# Windows PowerShell
powershell -ExecutionPolicy Bypass -File "${CLAUDE_SKILL_DIR}\scripts\ue-package.ps1" `
  --project "C:\Projects\Game.uproject" `
  --platform Win64 --config Shipping
```

Common options: `--iterative` (faster incremental cook), `--compressed`, `--encrypted`, `--distribution`, `--patch`.

Check `knowledge/buildcookrun-reference.md` for the full RunUAT BuildCookRun flag reference.

---

## 3. Deployment

### Determine the Target

| Target | Description |
|--------|-------------|
| `local` | Run packaged build on dev machine |
| `device` | Deploy to connected device (phone, tablet, devkit) |
| `remote` | Deploy to remote PC or network target |
| `list` | List connected/available devices |
| `check` | Verify deployment prerequisites for a platform |

### List Devices

```bash
bash ${CLAUDE_SKILL_DIR}/scripts/ue-deploy.sh list --platform Android
bash ${CLAUDE_SKILL_DIR}/scripts/ue-deploy.sh list --platform IOS
```

### Deploy and Run

```bash
bash ${CLAUDE_SKILL_DIR}/scripts/ue-deploy.sh \
  --project "/path/to/Game.uproject" \
  --platform Android --config Development \
  --device <device-id>
```

---

## Knowledge Files

| File | Contents |
|------|----------|
| `knowledge/config-hierarchy.md` | Config loading order, per-platform directories, GConfig, array syntax, C++ reading/writing |
| `knowledge/common-configs.md` | DefaultEngine.ini, DefaultGame.ini, DefaultInput.ini, DefaultEditor.ini, platform overrides, CVars |
| `knowledge/project-settings.md` | .uproject format, plugin references, module descriptors, target platforms, packaging settings |
| `knowledge/device-profiles.md` | DefaultDeviceProfiles.ini, GPU-based matching, quality tiers, per-device CVars, iOS/Android/desktop |
| `knowledge/mobile-platform-config.md` | iOS & Android config — cook-time vs runtime rules, signing, texture compression, performance |
| `knowledge/buildcookrun-reference.md` | Full RunUAT BuildCookRun flag reference |
| `knowledge/packaging-best-practices.md` | Packaging checklist, common failures, patch workflow |
| `knowledge/platform-guide.md` | Per-platform setup: Win64, Mac, Linux, iOS, Android |
| `knowledge/deployment-automation.md` | Automated deployment pipelines |
| `knowledge/local-deployment.md` | Running packaged builds locally |
| `knowledge/mobile-deployment.md` | iOS/Android device deployment |
| `knowledge/remote-deployment.md` | Remote PC and network deployment |
| `knowledge/turnkey-and-sdks.md` | Turnkey SDK setup per platform |
