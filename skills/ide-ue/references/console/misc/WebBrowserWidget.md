# UE Python API — WebBrowserWidget Module

**4 types** from the `WebBrowserWidget` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `WebBrowser`, `WebBrowser_OnBeforePopup`, `WebBrowser_OnConsoleMessage`, `WebBrowser_OnUrlChanged`

---

## Classes

### `unreal.WebBrowser`
Inherits: `Widget` | Header: `WebBrowser.h`

Web Browser

**Methods** (5):
  - `execute_javascript(script_text)` -> `None` — Executes a JavaScript string in the context of the web page
  - `get_title_text()` -> `Text` — Get the current title of the web page
  - `get_url()` -> `str` — Gets the currently loaded URL.
  - `load_string(contents, dummy_url)` -> `None` — Load a string as data to create a web page
  - `load_url(new_url)` -> `None` — Load the specified URL

**Properties** (3):
  - `on_before_popup`: `OnBeforePopup` — [Read-Write] Called when a popup is about to spawn. (OnBeforePopup)
  - `on_console_message`: `OnConsoleMessage` — [Read-Write] Called when the browser has console spew to print (OnConsoleMessage)
  - `on_url_changed`: `OnUrlChanged` — [Read-Write] Called when the Url changes. (OnUrlChanged)

### `unreal.WebBrowser_OnBeforePopup`
Inherits: `MulticastDelegateBase` | Header: `WebBrowser.h`

On Before Popup Delegate Signature

### `unreal.WebBrowser_OnConsoleMessage`
Inherits: `MulticastDelegateBase` | Header: `WebBrowser.h`

On Console Message Delegate Signature

### `unreal.WebBrowser_OnUrlChanged`
Inherits: `MulticastDelegateBase` | Header: `WebBrowser.h`

On Url Changed Delegate Signature
