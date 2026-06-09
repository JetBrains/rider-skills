# Game Algorithms: RNG, Tournaments, and Anti-Cheat

Engine-specific patterns from *Algorithms and Networking for Computer Games* (Smed & Hakonen, 2006) applied to Unreal Engine.

---

## Random Number Generation

### FRandomStream (Recommended)
```cpp
FRandomStream Stream(Seed);
float Value = Stream.FRand();        // [0, 1)
int32 Int = Stream.RandRange(0, 99); // [0, 99]
FVector Dir = Stream.VRandCone(Forward, ConeAngle);
```
- Deterministic given same seed — essential for replays and networked lockstep
- Each system should own its own stream to avoid coupling
- Seed with `Stream.Initialize(Seed)` or `Stream.Reset()`

### UE API Quick Reference

| Need | UE API |
|------|--------|
| Uniform int [a,b] | `FRandomStream::RandRange` |
| Uniform float [0,1) | `FRandomStream::FRand` |
| Weighted selection | `FRandomStream` + cumulative weight table |
| Normal/Gaussian | `FMath::FRandRange` + Box-Muller transform |
| Shuffle | `FRandomStream` + swap loop (Fisher-Yates) |

### Weighted Random Selection
```cpp
// Weights: [10, 30, 60] -> CDF: [10, 40, 100]
float Roll = Stream.FRand() * TotalWeight;
for (int32 i = 0; i < Items.Num(); ++i)
{
    if (Roll < CumulativeWeights[i]) return Items[i];
}
```
- Precompute cumulative weights; binary search for large tables
- UE DataTables work well for designer-editable loot tables

### Fisher-Yates Shuffle with FRandomStream
```cpp
for (int32 i = Array.Num() - 1; i > 0; --i)
{
    int32 j = Stream.RandRange(0, i);
    Array.Swap(i, j);
}
```

### Networked RNG Synchronization
1. Server generates seed, replicates to all clients at match start
2. Each system (loot, AI, spawning) uses its own `FRandomStream` with derived seed
3. Never mix streams — one desync cascades through everything
4. Log stream state checksums periodically; mismatch = desync detection

---

## Tournament — UE-Specific

### Bracket Storage
- Store bracket as array of `2^rounds` slots; advance winners by halving index
- If n not power of 2: first round has `2^ceil(log2(n)) - n` byes
- Implement rating system as `UGameInstanceSubsystem` for persistence across maps

---

## Anti-Cheat Patterns

### Packet Integrity
- UE NetDriver supports encryption via `EncryptionComponent`
- `PacketHandler` pipeline supports custom encryption/authentication handlers
- Anti-replay: include sequence number or nonce; reject duplicates

### Look-Ahead Cheating Prevention (P2P)
**Pipelined lockstep commitment protocol** (book's Algorithm 10.1):
1. Each player sends hash(action) as commitment
2. Wait for all commitments
3. Reveal actions; verify against commitments
4. Pipeline p commitments ahead to reduce perceived latency (adds 1 RTT per turn otherwise)

**Active Objects** (book): Delegate code runs on opponent's machine as trusted intermediary. Useful for P2P card/board games.

### Information Exposure Prevention
- Only replicate what the player should know (AOI filtering)
- Override `IsNetRelevantFor()` to check visibility/fog-of-war
- Use `COND_SkipOwner` / `COND_OwnerOnly` for per-client data
- Never replicate hidden enemy positions; compute visibility server-side

### Reflex Augmentation Detection
- Statistical analysis: track accuracy over time; flag superhuman patterns
- Input analysis: natural mouse movement has jitter/curves; aimbot snaps are detectable
- UE: Log hit data in `GameMode`, run analysis offline or real-time

### Client Validation
- Network version mismatch check is built-in; extend with custom validation in `PreLogin`
- EasyAntiCheat and BattlEye integrate with UE
- Memory integrity: encrypt critical variables; UE does not provide this natively

---

## Common Gotchas

- **`FMath::Rand()` for gameplay**: Uses global CRT state, not reproducible. Always use `FRandomStream`.
- **Shared RNG stream**: One stream for everything causes butterfly-effect desync. Separate streams per system.
- **Trusting client hit detection**: Client reports "I hit player X" — server must validate line-of-sight, distance, timing.
- **Deterministic lockstep with floats**: IEEE 754 is implementation-defined for edge cases. Use fixed-point or quantized integers.
- **Tournament bracket with non-power-of-2**: Forgetting byes produces unbalanced brackets. Always pad to next power of 2.

---

## References

- Smed, J. & Hakonen, H. (2006). *Algorithms and Networking for Computer Games*. Chapters 2, 3, 10.
- Knuth, D.E. (1998). *The Art of Computer Programming*, Vol. 2, Ch. 3.
- Park, S.K. & Miller, K.W. (1988). "Random Number Generators: Good Ones Are Hard To Find."

---

## MCP tools

| Tool | Purpose | Scenario |
|------|---------|----------|
| `ue_execute_python` | Run algorithm validation in the editor | Implement a seeded PRNG test or ELO batch-update in Python and execute directly in the running editor |
| `ue_play` | Exercise network-sensitive algorithms in PIE | Start a multiplayer PIE session to validate that lockstep-sensitive algorithms produce the same result on both clients |
| `xdebug_set_breakpoint` | Step through an algorithm at a key decision point | Conditional breakpoint on a random roll or A* node expansion to inspect intermediate state |
