"""Take a viewport screenshot.
Output: Saved/Screenshots/viewport.png (or custom path).
Supports .png, .jpg, .bmp, .exr.

Params (set as globals before exec):
  __screenshot_path__ — output file path (default: Saved/Screenshots/viewport.png)
  __screenshot_with_ui__ — capture full editor window including UI (default: False)

IMPORTANT: Always use AgentBridge viewport screenshot. Never use system screencapture.
"""
import unreal
import os

default_path = os.path.join(unreal.Paths.project_saved_dir(), "Screenshots", "viewport.png")
out_path = globals().get("__screenshot_path__", default_path)
width = globals().get("__screenshot_width__", 1920)
height = globals().get("__screenshot_height__", 1080)

os.makedirs(os.path.dirname(out_path), exist_ok=True)

# try AgentBridgeLibrary first, fall back to AutomationLibrary
try:
    bridge = getattr(unreal, "AgentBridgeLibrary", None)
    if bridge:
        with_ui = globals().get("__screenshot_with_ui__", False)
        if with_ui:
            bridge.take_screenshot_with_ui(out_path)
        else:
            bridge.take_viewport_screenshot(out_path)
    else:
        raise AttributeError("AgentBridgeLibrary not available in Python")
except (AttributeError, Exception):
    unreal.AutomationLibrary.take_high_res_screenshot(width, height, out_path)

print(out_path)
