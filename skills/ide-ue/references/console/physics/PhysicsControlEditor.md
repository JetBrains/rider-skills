# UE Python API — PhysicsControlEditor Module

**4 types** from the `PhysicsControlEditor` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `PhysicsControlAssetEditorAnimInstance`, `PhysicsControlAssetEditorPhysicsHandleComponent`, `PhysicsControlAssetEditorSkeletalMeshComponent`, `PhysicsControlAssetFactory`

---

## Classes

### `unreal.PhysicsControlAssetEditorAnimInstance`
Inherits: `AnimPreviewInstance` | Header: `PhysicsControlAssetEditorAnimInstance.h`

Physics Control Asset Editor Anim Instance

### `unreal.PhysicsControlAssetEditorPhysicsHandleComponent`
Inherits: `PhysicsHandleComponent` | Header: `PhysicsControlAssetEditorPhysicsHandleComponent.h`

Extend the Physics Handle for PhAt. This adds support for manipulating the physics if it is running in a RigidBody AnimNode (which is always is with Chaos at the moment).

### `unreal.PhysicsControlAssetEditorSkeletalMeshComponent`
Inherits: `DebugSkelMeshComponent` | Header: `PhysicsControlAssetEditorSkeletalMeshComponent.h`

Physics Control Asset Editor Skeletal Mesh Component

### `unreal.PhysicsControlAssetFactory`
Inherits: `Factory` | Header: `PhysicsControlAssetFactory.h`

Physics Control Asset Factory
