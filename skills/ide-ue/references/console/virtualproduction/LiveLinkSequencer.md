# UE Python API — LiveLinkSequencer Module

**6 types** from the `LiveLinkSequencer` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `LiveLinkSubjectProperty`, `LiveLinkSubjectProperties`, `MovieSceneLiveLinkControllerMapTrackRecorder`, `MovieSceneLiveLinkControllerTrackRecorder`, `MovieSceneLiveLinkTrackRecorder`, `TakeRecorderLiveLinkSource`

---

## Classes

### `unreal.LiveLinkSubjectProperty`
Inherits: `StructBase` | Header: `TakeRecorderLiveLinkSource.h`

Live Link Subject Property

**Properties** (2):
  - `enabled`: `bool` — [Read-Write] (bool)
  - `subject_name`: `Name` — [Read-Write] (Name)

### `unreal.LiveLinkSubjectProperties`
Inherits: `Object` | Header: `TakeRecorderLiveLinkSource.h`

Live Link Subject Properties

**Properties** (1):
  - `properties`: `None` — [Read-Write] (Array[LiveLinkSubjectProperty])

### `unreal.MovieSceneLiveLinkControllerMapTrackRecorder`
Inherits: `MovieSceneTrackRecorder` | Header: `MovieSceneLiveLinkControllerMapTrackRecorder.h`

Movie Scene track recorder for LiveLink Componentâs Controller Map

### `unreal.MovieSceneLiveLinkControllerTrackRecorder`
Inherits: `MovieSceneTrackRecorder` | Header: `MovieSceneLiveLinkControllerTrackRecorder.h`

Abstract based for movie scene track recorders that can record LiveLink Controllers

### `unreal.MovieSceneLiveLinkTrackRecorder`
Inherits: `MovieSceneTrackRecorder` | Header: `MovieSceneLiveLinkTrackRecorder.h`

Movie Scene Live Link Track Recorder

### `unreal.TakeRecorderLiveLinkSource`
Inherits: `TakeRecorderSource` | Header: `TakeRecorderLiveLinkSource.h`

A recording source that records LiveLink

**Properties** (5):
  - `discard_samples_before_start`: `bool` — [Read-Write] If true discard livelink samples with timecode that occurs before the start of recordin...
  - `reduce_keys`: `bool` — [Read-Write] Whether to perform key-reduction algorithms as part of the recording (bool)
  - `save_subject_settings`: `bool` — [Read-Write] Whether we should save subject settings in the the live link section. If not, weâll c...
  - `subject_name`: `Name` — [Read-Write] Name of the subject to record (Name)
  - `use_source_timecode`: `bool` — [Read-Write] Whether the livelink subjectâs timecode or the system time should be used for the rec...
