# UE Python API — OnlineSubsystemEOS Module

**2 types** from the `OnlineSubsystemEOS` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ArtifactSettings`, `EOSSettings`

---

## Classes

### `unreal.ArtifactSettings`
Inherits: `StructBase` | Header: `EOSSettings.h`

Artifact Settings

**Properties** (8):
  - `artifact_name`: `str` [Read-Only] — [Read-Only] This needs to match what the launcher passes in the -epicapp command line arg (str)
  - `client_encryption_key`: `str` [Read-Only] — [Read-Only] Config key renamed to ClientEncryptionKey as EncryptionKey gets removed from packaged bu...
  - `client_id`: `str` [Read-Only] — [Read-Only] (str)
  - `client_secret`: `str` [Read-Only] — [Read-Only] (str)
  - `deployment_id`: `str` [Read-Only] — [Read-Only] (str)
  - `encryption_key`: `str` — âencryption_keyâ was renamed to âclient_encryption_keyâ. deprecated
  - `product_id`: `str` [Read-Only] — [Read-Only] (str)
  - `sandbox_id`: `str` [Read-Only] — [Read-Only] (str)

### `unreal.EOSSettings`
Inherits: `RuntimeOptionsBase` | Header: `EOSSettings.h`

**Properties** (21):
  - `artifacts`: `None` [Read-Only] — [Read-Only] Per artifact SDK settings. A game might have a FooStaging, FooQA, and public Foo artifac...
  - `auth_scope_flags`: `None` [Read-Only] — [Read-Only] Auth scopes to request during login (Array[str])
  - `cache_dir`: `str` [Read-Only] — [Read-Only] The directory any PDS/TDS files are cached into. This is per artifact e.g.: <UserDir>/<A...
  - `default_artifact_name`: `str` [Read-Only] — [Read-Only] Used when launched from a store other than EGS or when the specified artifact name was n...
  - `enable_editor_overlay`: `bool` [Read-Only] — [Read-Only] Set to true to enable the overlay when running in the editor (bool)
  - `enable_overlay`: `bool` [Read-Only] — [Read-Only] Set to true to enable the overlay (ecom features) (bool)
  - `enable_social_overlay`: `bool` [Read-Only] — [Read-Only] Set to true to enable the social overlay (friends, invites, etc.) (bool)
  - `mirror_achievements_to_eos`: `bool` [Read-Only] — [Read-Only] (bool)
  - `mirror_presence_to_eas`: `bool` [Read-Only] — [Read-Only] (bool)
  - `mirror_stats_to_eos`: `bool` [Read-Only] — [Read-Only] (bool)
  - `nintendo_token_type`: `str` [Read-Only] — [Read-Only] When running with Nintendo, defines what ExternalType will be used during ExternalAuth L...
  - `prefer_persistent_auth`: `bool` [Read-Only] — [Read-Only] Set to true to prefer persistent auth over external authentication during Login (bool)
  - `rtc_background_mode`: `str` [Read-Only] — [Read-Only] The preferred background mode to be used by RTC services (str)
  - `steam_token_type`: `str` [Read-Only] — [Read-Only] When running with Steam, defines what TokenType OSSEOS will request from OSSSteam to log...
  - `tick_budget_in_milliseconds`: `int` [Read-Only] — [Read-Only] Used to throttle how much time EOS ticking can take (int32)
  - `title_storage_read_chunk_length`: `int` [Read-Only] — [Read-Only] Chunk size used when reading a title file (int32)
  - `title_storage_tags`: `None` [Read-Only] — [Read-Only] Tag combinations for paged queries in title file enumerations, separate tags within grou...
  - `use_eas`: `bool` [Read-Only] — [Read-Only] Set to true to login to EOS_Auth (required to use Epic Account Services) (bool)
  - `use_eos_connect`: `bool` [Read-Only] — [Read-Only] Set to true to login to EOS_Connect (required to use Epic Game Services) (bool)
  - `use_eos_sessions`: `bool` [Read-Only] — [Read-Only] Set to true to use EOS for session registration with data mirrored to the default platfo...
  - `use_new_login_flow`: `bool` [Read-Only] — [Read-Only] Set to true to use new EOS login flow (bool)
