# UE Python API — ScreenReader Module

**4 types** from the `ScreenReader` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `ScreenReaderAnnouncement`, `ScreenReaderAnnouncementInfo`, `ScreenReaderReply`, `ScreenReaderAnnouncementPriority`

---

## Classes

### `unreal.ScreenReaderAnnouncement`
Inherits: `StructBase` | Header: `ScreenReaderAnnouncement.h`

A screen reader announcement represents a localized message that a user wants to speak to an end user. This class is used to request announcements to be spoken to an end user via the FScreenReaderUser...

**Properties** (2):
  - `announcement_info`: `ScreenReaderAnnouncementInfo` — [Read-Write] The announcement info associated with the announcement which controls how the announcem...
  - `announcement_string`: `str` — [Read-Write] A localized string that represents the message to be spoken to a end user (str)

### `unreal.ScreenReaderAnnouncementInfo`
Inherits: `StructBase` | Header: `ScreenReaderAnnouncement.h`

A struct that contains information about how a screen reader announcement should behave when the announcement is requested to be spoken. This struct holds information to determine an announcementâs ...

**Properties** (3):
  - `interruptable`: `bool` — [Read-Write] True if the associazted announcement can be intrrupted by another announcement. Else fa...
  - `priority`: `ScreenReaderAnnouncementPriority` — [Read-Write] The priority level of the associated announcement. (ScreenReaderAnnouncementPriority)
  - `should_queue`: `bool` — [Read-Write] True if the associated announcement should be queued if it cannot be spoken immediately...

### `unreal.ScreenReaderReply`
Inherits: `StructBase` | Header: `ScreenReaderReply.h`

A struct passed around the the screen reader framework to indicate if a request has been successfully handled. Use this class to determine if a request to the screen reader user was successfully handl...

**Properties** (1):
  - `handled`: `bool` [Read-Only] — [Read-Only] (bool)

### `unreal.ScreenReaderAnnouncementPriority`
Inherits: `EnumBase` | Header: `ScreenReaderAnnouncement.h`

The priority level associated with a screen reader announcement. The priority of an announcement could be used to determine if an announcement A could interrupt announcement B or to help order the ann...

**Properties** (3):
  - `HIGH`: `ScreenReaderAnnouncementPriority = Ellipsis` — 0
  - `LOW`: `ScreenReaderAnnouncementPriority = Ellipsis` — 2
  - `MEDIUM`: `ScreenReaderAnnouncementPriority = Ellipsis` — 1
