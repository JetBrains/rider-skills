# UE Python API — AndroidPermission Module

**3 types** from the `AndroidPermission` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `AndroidPermissionCallbackProxy`, `AndroidPermissionFunctionLibrary`, `AndroidPermissionDynamicDelegate`

---

## Classes

### `unreal.AndroidPermissionCallbackProxy`
Inherits: `Object` | Header: `AndroidPermissionCallbackProxy.h`

Android Permission Callback Proxy

**Properties** (1):
  - `on_permissions_granted_dynamic_delegate`: `AndroidPermissionDynamicDelegate` — [Read-Write] (AndroidPermissionDynamicDelegate)

### `unreal.AndroidPermissionFunctionLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AndroidPermissionFunctionLibrary.h`

Android Permission Function Library

**Methods** (2):
  - `acquire_permissions(permissions)` -> `AndroidPermissionCallbackProxy` [classmethod] — try to acquire permissions and return a singleton callback proxy object containing OnPermissionsGranted delegate
  - `check_permission(permission)` -> `bool` [classmethod] — check if the permission is already granted

### `unreal.AndroidPermissionDynamicDelegate`
Inherits: `MulticastDelegateBase` | Header: `AndroidPermissionCallbackProxy.h`

Android Permission Dynamic Delegate Delegate Signature
