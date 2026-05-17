---------------------
---- MY PROGRAMS ----
---------------------

local hl         = hl
local dsp        = hl.dsp
local window     = dsp.window
local workspace  = dsp.workspace

-- Set programs that you use

local cmd_prefix = ""
if os.getenv("UWSM_WAIT_VARNAMES") then
  cmd_prefix = "uwsm-app "
end

local terminal    = cmd_prefix .. "alacritty"
local browser     = cmd_prefix .. "firefox-developer-edition"
local editor      = cmd_prefix .. "zeditor"
local fileManager = cmd_prefix .. "pcmanfm"
local menu        = cmd_prefix .. "sherlock"
local exit        = "loginctl terminate-user \"\""
-- local exit        = "loginctl terminate-session \"$XDG_SESSION_ID\""
local reload      = "ironbar reload & hyprctl reload"

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod     = "SUPER" -- Sets "Windows" key as main modifier
local l           = "left"
local d           = "down"
local u           = "up"
local r           = "right"
local bracket_l   = "bracketleft"
local bracket_r   = "bracketright"
local mouse_l     = "mouse:272"
local mouse_r     = "mouse:273"
local mouse_d     = "mouse_down"
local mouse_u     = "mouse_up"

local function keybind(keys) return table.concat(keys, " + ") end

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(keybind({ mainMod, "A" }), dsp.exec_cmd(terminal))
hl.bind(keybind({ mainMod, "B" }), dsp.exec_cmd(browser))
hl.bind(keybind({ mainMod, "E" }), dsp.exec_cmd(fileManager))
hl.bind(keybind({ mainMod, "C" }), dsp.exec_cmd(editor))
hl.bind(keybind({ mainMod, "SPACE" }), dsp.exec_cmd(menu))

hl.bind(keybind({ mainMod, "G" }), window.float())
hl.bind(keybind({ mainMod, "D" }), window.pseudo())
hl.bind(keybind({ mainMod, "T" }), dsp.layout("togglesplit")) -- dwindle only

hl.bind(keybind({ mainMod, "F" }), window.fullscreen({ action = "toggle", mode = "fullscreen" }))
hl.bind(keybind({ mainMod, "M" }), window.fullscreen({ action = "toggle", mode = "maximized" }))
hl.bind(keybind({ mainMod, "Q" }), window.kill())

hl.bind(keybind({ mainMod, "ALT", "Q" }), dsp.exec_cmd(exit))
hl.bind(keybind({ mainMod, "ALT", "R" }), dsp.exec_cmd(reload))

-- Move focus with mainMod + arrow keys
hl.bind(keybind({ mainMod, l }), dsp.focus({ direction = "left" }))
hl.bind(keybind({ mainMod, d }), dsp.focus({ direction = "down" }))
hl.bind(keybind({ mainMod, u }), dsp.focus({ direction = "up" }))
hl.bind(keybind({ mainMod, r }), dsp.focus({ direction = "right" }))

-- Move focus with mainMod + h/j/k/l
hl.bind(keybind({ mainMod, "H" }), dsp.focus({ direction = "left" }))
hl.bind(keybind({ mainMod, "J" }), dsp.focus({ direction = "down" }))
hl.bind(keybind({ mainMod, "K" }), dsp.focus({ direction = "up" }))
hl.bind(keybind({ mainMod, "L" }), dsp.focus({ direction = "right" }))

-- Move focus to next window with mainMod + ]/[
hl.bind(keybind({ mainMod, bracket_r }), window.cycle_next({ next = true, tiled = true }))
hl.bind(keybind({ mainMod, bracket_l }), window.cycle_next({ next = false, tiled = true }))

-- Move window around the stack with mainMod + SHIFT + arrow keys
hl.bind(keybind({ mainMod, "SHIFT", l }), window.move({ direction = "left" }))
hl.bind(keybind({ mainMod, "SHIFT", d }), window.move({ direction = "down" }))
hl.bind(keybind({ mainMod, "SHIFT", u }), window.move({ direction = "up" }))
hl.bind(keybind({ mainMod, "SHIFT", r }), window.move({ direction = "right" }))

-- Swap window with another window in the given direction
--   with mainMod + SHIFT + h/j/k/l
hl.bind(keybind({ mainMod, "SHIFT", "H" }), window.swap({ direction = "left" }))
hl.bind(keybind({ mainMod, "SHIFT", "J" }), window.swap({ direction = "down" }))
hl.bind(keybind({ mainMod, "SHIFT", "K" }), window.swap({ direction = "up" }))
hl.bind(keybind({ mainMod, "SHIFT", "L" }), window.swap({ direction = "right" }))

-- Swap window with next window with mainMod + SHIFT + ]/[
hl.bind(keybind({ mainMod, "SHIFT", bracket_r }), window.swap({ next = true }))
hl.bind(keybind({ mainMod, "SHIFT", bracket_l }), window.swap({ prev = true }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(keybind({ mainMod, key }), dsp.focus({ workspace = i }))
  hl.bind(keybind({ mainMod, "SHIFT", key }), window.move({ workspace = i }))
end

-- move current workspace to previous/next monitor with mainMod + ,/.
hl.bind(keybind({ mainMod, "comma" }), workspace.move({ monitor = "+1" }))
hl.bind(keybind({ mainMod, "period" }), workspace.move({ monitor = "-1" }))

-- Example special workspace (scratchpad)
hl.bind(keybind({ mainMod, "S" }), workspace.toggle_special("media"))
hl.bind(keybind({ mainMod, "SHIFT", "S" }), window.move({ workspace = "special:media" }))
hl.bind(keybind({ mainMod, "V" }), workspace.toggle_special("vpn"))
hl.bind(keybind({ mainMod, "SHIFT", "V" }), window.move({ workspace = "special:vpn" }))
hl.bind(keybind({ mainMod, "X" }), workspace.toggle_special("terminal"))
hl.bind(keybind({ mainMod, "SHIFT", "X" }), window.move({ workspace = "special:terminal" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(keybind({ mainMod, mouse_d }), dsp.focus({ workspace = "e+1" }))
hl.bind(keybind({ mainMod, mouse_u }), dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(keybind({ mainMod, mouse_l }), window.drag(), { mouse = true })
hl.bind(keybind({ mainMod, mouse_r }), window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
  "XF86AudioRaiseVolume",
  dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioLowerVolume",
  dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioMute",
  dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioMicMute",
  dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86MonBrightnessUp",
  dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86MonBrightnessDown",
  dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
  { locked = true, repeating = true }
)

-- Requires playerctl
hl.bind("XF86AudioNext", dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", dsp.exec_cmd("playerctl previous"), { locked = true })

-- Screenshot a window
hl.bind(keybind({ mainMod, "PRINT" }), dsp.exec_cmd("hyprshot -m window"))
-- Screenshot a monitor
hl.bind("PRINT", dsp.exec_cmd("hyprshot -m output"))
-- Screenshot a region
hl.bind(keybind({ mainMod, "SHIFT", "PRINT" }), dsp.exec_cmd("hyprshot -m region"))
