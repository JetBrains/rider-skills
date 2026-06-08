# UE Python API — VPRoles Module

**2 types** from the `VPRoles` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `VirtualProductionRolesSubsystem`, `VirtualProductionRolesSubsystem_OnRolesChanged`

---

## Classes

### `unreal.VirtualProductionRolesSubsystem`
Inherits: `EngineSubsystem` | Header: `VPRolesSubsystem.h`

Subsystem for common Virtual Production roles operations. The machine role(s) in a virtual production context read from the command line. ie. â-VPRole=[Role.SubRole1|Role.SubRole2]â

**Methods** (7):
  - `add_role(role_name)` -> `bool` — Add a new virtual production role. note: This will attempt to modify the underlying VProles.ini file so it must be check...
  - `get_active_roles()` -> `Array [ str ]` — Get the currently active Virtual Production roles.
  - `get_active_roles_string()` -> `str`
  - `get_all_roles()` -> `Array [ str ]` — Get all available roles that can be set as current.
  - `has_active_role(role)` -> `bool`
  - `remove_role(role_name)` -> `bool` — Remove a virtual production role. note: This will attempt to modify the underlying VProles.ini file so it must be checke...
  - `set_active_roles(roles)` -> `None` — Set the current Virtual Production roles. note: The roles must already have been added either through the UI or through ...

**Properties** (1):
  - `on_roles_changed`: `OnRolesChanged` — [Read-Write] Delegate called when the roles are modified, ie. role is added, current roles are repla...

### `unreal.VirtualProductionRolesSubsystem_OnRolesChanged`
Inherits: `MulticastDelegateBase` | Header: `VPRolesSubsystem.h`

On Roles Changed Delegate Signature
