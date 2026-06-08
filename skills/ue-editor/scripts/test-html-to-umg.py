"""
HTML-to-UMG Converter Integration Tests
Run in Unreal Editor via AgentBridge: exec(open('path/to/test-html-to-umg.py').read())
"""
import unreal
import json

AB = unreal.AgentBridgeLibrary
passed = 0
failed = 0
errors = []

def check(test_id, description, condition, details=""):
    global passed, failed, errors
    if condition:
        passed += 1
    else:
        failed += 1
        msg = f"FAIL {test_id}: {description}"
        if details:
            msg += f" — {details}"
        errors.append(msg)
        unreal.log_warning(msg)

def parse_json(s):
    try:
        return json.loads(s)
    except:
        return None

# ─── T-C00: Basic conversion ─────────────────────────────────────────────────
result = parse_json(AB.convert_html_to_widget('<text>Hello</text>', '/Game/UI/Test/WBP_HtmlTest_Basic'))
check('T-C00', 'Basic text conversion', result and result.get('success') == True,
      str(result) if result else 'null result')

# Verify widget tree
if result and result.get('success'):
    tree = parse_json(AB.list_widgets_in_tree('/Game/UI/Test/WBP_HtmlTest_Basic'))
    check('T-C00b', 'Basic text — widget tree has 1 widget',
          tree and len(tree) == 1 and tree[0].get('class') == 'TextBlock',
          str(tree))

# ─── T-C01: Parse error ──────────────────────────────────────────────────────
result = parse_json(AB.convert_html_to_widget('not valid xml at all', '/Game/UI/Test/WBP_HtmlTest_Invalid'))
check('T-C01', 'Invalid HTML returns error', result and result.get('success') == False,
      str(result))

# ─── T-C02: Validate valid HTML ──────────────────────────────────────────────
result = parse_json(AB.validate_html('<text>Hello</text>'))
check('T-C02', 'Validate simple text', result and result.get('valid') == True,
      str(result))

# ─── T-C03: Validate unknown tag ─────────────────────────────────────────────
result = parse_json(AB.validate_html('<div>nope</div>'))
check('T-C03', 'Validate rejects <div>', result and result.get('valid') == False,
      str(result))

# ─── T-C04: Check dependencies — missing widget ──────────────────────────────
result = parse_json(AB.check_html_dependencies('<widget class="/Game/UI/WBP_DoesNotExist_12345" />'))
check('T-C04', 'Missing dependency detected',
      result and '/Game/UI/WBP_DoesNotExist_12345' in result.get('missing', []),
      str(result))

# ─── T-C05: Check dependencies — no deps ─────────────────────────────────────
result = parse_json(AB.check_html_dependencies('<text>No deps</text>'))
check('T-C05', 'No dependencies found', result and len(result.get('missing', [])) == 0,
      str(result))

# ─── T-600: Single leaf root ─────────────────────────────────────────────────
result = parse_json(AB.convert_html_to_widget('<text>Hello</text>', '/Game/UI/Test/WBP_HtmlTest_Leaf'))
check('T-600', 'Single text as root', result and result.get('success') == True)

# ─── T-601: VBox with 2 children ─────────────────────────────────────────────
html = '<vbox><text>A</text><text>B</text></vbox>'
result = parse_json(AB.convert_html_to_widget(html, '/Game/UI/Test/WBP_HtmlTest_VBox'))
check('T-601', 'VBox with 2 children', result and result.get('success') == True)

if result and result.get('success'):
    tree = parse_json(AB.list_widgets_in_tree('/Game/UI/Test/WBP_HtmlTest_VBox'))
    # Root VBox + 2 TextBlocks = 3 widgets
    check('T-601b', 'VBox tree has 3 widgets', tree and len(tree) == 3,
          f'got {len(tree) if tree else 0}')

# ─── T-602: Overlay with Image + TextBlock ───────────────────────────────────
html = '<overlay><img /><text>Over</text></overlay>'
result = parse_json(AB.convert_html_to_widget(html, '/Game/UI/Test/WBP_HtmlTest_Overlay'))
check('T-602', 'Overlay with Image+Text', result and result.get('success') == True)

# ─── T-603: Border with TextBlock child ──────────────────────────────────────
html = '<border bg-color="#1A1A2E" padding="20"><text>Wrapped</text></border>'
result = parse_json(AB.convert_html_to_widget(html, '/Game/UI/Test/WBP_HtmlTest_Border'))
check('T-603', 'Border with child', result and result.get('success') == True)

# ─── T-604: Button with TextBlock ────────────────────────────────────────────
html = '<button bg-normal="#336699" corner-radius="8"><text color="#FFFFFF">Click</text></button>'
result = parse_json(AB.convert_html_to_widget(html, '/Game/UI/Test/WBP_HtmlTest_Button'))
check('T-604', 'Button with styled text', result and result.get('success') == True)

# ─── T-605: SizeBox ──────────────────────────────────────────────────────────
html = '<sizebox width="400" height="300"><text>Sized</text></sizebox>'
result = parse_json(AB.convert_html_to_widget(html, '/Game/UI/Test/WBP_HtmlTest_SizeBox'))
check('T-605', 'SizeBox with child', result and result.get('success') == True)

# ─── T-606: Deep nesting ─────────────────────────────────────────────────────
html = '<overlay><border bg-color="#000"><vbox><text>Deep</text></vbox></border></overlay>'
result = parse_json(AB.convert_html_to_widget(html, '/Game/UI/Test/WBP_HtmlTest_Deep'))
check('T-606', '3-level nesting', result and result.get('success') == True)

if result and result.get('success'):
    tree = parse_json(AB.list_widgets_in_tree('/Game/UI/Test/WBP_HtmlTest_Deep'))
    check('T-606b', 'Deep tree has 4 widgets', tree and len(tree) == 4,
          f'got {len(tree) if tree else 0}')

# ─── T-C08: Empty input ──────────────────────────────────────────────────────
result = parse_json(AB.convert_html_to_widget('', '/Game/UI/Test/WBP_HtmlTest_Empty'))
check('T-C08', 'Empty HTML returns error', result and result.get('success') == False)

# ─── T-C09: Empty path ───────────────────────────────────────────────────────
result = parse_json(AB.convert_html_to_widget('<text/>', ''))
check('T-C09', 'Empty path returns error', result and result.get('success') == False)

# ─── T-900: Main menu example (simplified) ───────────────────────────────────
main_menu_html = '''<overlay name="Root">
  <img slot-halign="fill" slot-valign="fill" />
  <border bg-color="#000000CC" corner-radius="16" padding="40"
          slot-halign="center" slot-valign="center">
    <sizebox width="500" max-height="700">
      <vbox>
        <text font-size="48" font-weight="Bold" color="#FFFFFF"
              justification="center" slot-padding="0 0 0 30">
          MY GAME
        </text>
        <button name="BtnPlay" bg-normal="#2266AA" bg-hovered="#3377BB"
                corner-radius="8" slot-padding="0 0 0 8">
          <text font-size="20" color="#FFFFFF" justification="center">PLAY</text>
        </button>
        <button name="BtnSettings" bg-normal="#444444" bg-hovered="#555555"
                corner-radius="8" slot-padding="0 0 0 8">
          <text font-size="20" color="#FFFFFF" justification="center">SETTINGS</text>
        </button>
        <button name="BtnQuit" bg-normal="#AA2222" bg-hovered="#BB3333"
                corner-radius="8" slot-padding="0 0 0 8">
          <text font-size="20" color="#FFFFFF" justification="center">QUIT</text>
        </button>
        <spacer slot-size="fill" />
        <text font-size="12" color="#888888" justification="center">v1.0.0</text>
      </vbox>
    </sizebox>
  </border>
</overlay>'''

result = parse_json(AB.convert_html_to_widget(main_menu_html, '/Game/UI/Test/WBP_HtmlTest_MainMenu'))
check('T-900', 'Main menu converts', result and result.get('success') == True,
      str(result.get('errors', [])) if result else 'null')

if result and result.get('success'):
    tree = parse_json(AB.list_widgets_in_tree('/Game/UI/Test/WBP_HtmlTest_MainMenu'))
    check('T-900b', 'Main menu root is Overlay', tree and len(tree) > 0 and tree[0].get('class') == 'Overlay')
    # Count widgets: overlay(1) + img(1) + border(1) + sizebox(1) + vbox(1) +
    #   title(1) + 3 buttons with text(6) + spacer(1) + version(1) = ~14
    check('T-900c', 'Main menu has 14+ widgets', tree and len(tree) >= 14,
          f'got {len(tree) if tree else 0}')

# ─── T-910: HUD example (simplified) ─────────────────────────────────────────
hud_html = '''<canvas name="HUD_Root">
  <hbox slot-anchor="bottom-left" slot-position="20 -60" slot-size="300 40">
    <img size="32 32" slot-padding="0 0 8 0" />
    <progress value="0.75" fill-color="#00FF00" slot-size="fill" />
  </hbox>
  <text name="AmmoCount" slot-anchor="bottom-right" slot-position="-20 -60"
        font-size="36" font-weight="Bold" color="#FFFFFF"
        shadow-offset="2 2" shadow-color="#00000080">
    30 / 90
  </text>
  <img name="Crosshair" slot-anchor="center" slot-autosize="true"
       slot-alignment="0.5 0.5" />
</canvas>'''

result = parse_json(AB.convert_html_to_widget(hud_html, '/Game/UI/Test/WBP_HtmlTest_HUD'))
check('T-910', 'HUD converts', result and result.get('success') == True,
      str(result.get('errors', [])) if result else 'null')

if result and result.get('success'):
    tree = parse_json(AB.list_widgets_in_tree('/Game/UI/Test/WBP_HtmlTest_HUD'))
    check('T-910b', 'HUD root is CanvasPanel', tree and tree[0].get('class') == 'CanvasPanel')

# ─── T-920: Settings example (simplified) ────────────────────────────────────
settings_html = '''<overlay>
  <border bg-color="#1A1A2E" slot-halign="fill" slot-valign="fill">
    <vbox>
      <border bg-color="#16213E" padding="15">
        <text font-size="24" font-weight="Bold" color="#FFFFFF">Settings</text>
      </border>
      <scroll slot-size="fill" slot-padding="20">
        <vbox>
          <expandable header-text="Graphics" expanded="true">
            <vbox>
              <hbox slot-padding="0 0 0 8">
                <text slot-size="fill" color="#CCCCCC">Resolution</text>
                <combo options="1280x720,1920x1080,2560x1440,3840x2160" selected="1920x1080" />
              </hbox>
              <hbox slot-padding="0 0 0 8">
                <text slot-size="fill" color="#CCCCCC">VSync</text>
                <checkbox checked="true" />
              </hbox>
            </vbox>
          </expandable>
          <expandable header-text="Audio" expanded="true">
            <vbox>
              <hbox slot-padding="0 0 0 8">
                <text slot-size="fill" color="#CCCCCC">Master Volume</text>
                <slider value="0.8" />
              </hbox>
            </vbox>
          </expandable>
        </vbox>
      </scroll>
      <border bg-color="#16213E" padding="10">
        <hbox>
          <spacer slot-size="fill" />
          <button bg-normal="#2266AA" corner-radius="6" slot-padding="0 0 8 0">
            <text color="#FFFFFF">Apply</text>
          </button>
          <button bg-normal="#444444" corner-radius="6">
            <text color="#FFFFFF">Cancel</text>
          </button>
        </hbox>
      </border>
    </vbox>
  </border>
</overlay>'''

result = parse_json(AB.convert_html_to_widget(settings_html, '/Game/UI/Test/WBP_HtmlTest_Settings'))
check('T-920', 'Settings converts', result and result.get('success') == True,
      str(result.get('errors', [])) if result else 'null')

if result and result.get('success'):
    tree = parse_json(AB.list_widgets_in_tree('/Game/UI/Test/WBP_HtmlTest_Settings'))
    check('T-920b', 'Settings has 20+ widgets', tree and len(tree) >= 20,
          f'got {len(tree) if tree else 0}')

# ─── Validate examples ───────────────────────────────────────────────────────
for name, html in [('main_menu', main_menu_html), ('hud', hud_html), ('settings', settings_html)]:
    result = parse_json(AB.validate_html(html))
    check(f'T-81x-{name}', f'Validate {name} is valid', result and result.get('valid') == True,
          str(result.get('errors', [])) if result else 'null')

# ─── Summary ─────────────────────────────────────────────────────────────────
total = passed + failed
summary = f"HTML-to-UMG Tests: {passed}/{total} passed, {failed} failed"
if failed == 0:
    unreal.log(f"SUCCESS: {summary}")
else:
    unreal.log_warning(f"PARTIAL: {summary}")
    for err in errors:
        unreal.log_warning(f"  {err}")

# Clean up test assets
for path in ['/Game/UI/Test']:
    if unreal.EditorAssetLibrary.does_directory_exist(path):
        pass  # Don't auto-delete — let user inspect results
