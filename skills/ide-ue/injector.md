# Unreal Engine project — use `ide-ue`

This is an Unreal Engine codebase. `ide-ue` is the **single skill** for all UE work — Rider MCP driver plus full domain expertise.

**Editor automation** (live editor via `ue_*` tools):
- PIE lifecycle, log streaming, editor health
- Asset search, GameplayTag index, class hierarchy
- Screenshots, viewport camera
- Place/spawn actors on level
- Simulate player input (primitive, action-sequence, Enhanced Input)
- Editor Python scripting (game thread)
- Canonical end-to-end pipelines P1–P10
- Live Coding, UBT rebuild, RunUAT cook/package

**Knowledge domains** (no editor required):
- C++, Blueprint, Architecture, AI/BT/EQS, Animation
- GAS, GameplayCues, Networking, Physics
- Graphics/Rendering, Materials, Level Design, Data, PCG
- Cinematics/Sequencer, UI (UMG/Blueprint), UI C++
- Builder/UBT, Platform/Packaging, Plugin, Profiler, Testing
- Console variables / UE Python API

**Rules:**

1. Invoke `ide-ue` for all UE work — editor automation, asset queries, code, architecture, AI, animation, build, packaging.
2. For IDE-only tasks (build .NET solutions, run configurations, debug C# code, search files in non-UE repos): use `ide` skill — `ide-ue` is the UE-specific layer on top.
3. Resolve the Rider MCP prefix via the GATE in `SKILL.md` before calling any `ue_*` tool.
4. If the project has no `.uproject` file: treat it as a normal engineering task — do not invoke UE automation.
