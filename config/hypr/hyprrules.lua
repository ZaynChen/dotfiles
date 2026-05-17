--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- Example window rules that are useful
local hl = hl

hl.window_rule({
  match = { class = "mihomo-party" },
  workspace = "special:vpn silent",
})
hl.window_rule({
  match = { class = ".*music.*" },
  workspace = "special:media silent",
})
hl.window_rule({
  name = "browser",
  match = { class = "firefox-developer-edition" },
  monitor = 0,
  workspace = "1 silent",
})
hl.window_rule({
  match = { class = "wps|et|wpp|pdf|Termius" },
  monitor = 0,
  workspace = "4 silent",
})
hl.window_rule({
  name = "chat",
  match = { class = "QQ|[s|S]lack|wechat" },
  monitor = 0,
  workspace = "5 silent",
})
hl.window_rule({
  name = "steam",
  match = { class = "steam" },
  monitor = 0,
  workspace = "9 silent",
})
hl.window_rule({
  name = "dota2",
  match = { class = "dota2" },
  monitor = 1,
  workspace = "10 silent",
  move = { 0, 0 },
  border_size = 0,
  rounding = 0,
  decorate = false,
})

hl.window_rule({
  -- Ignore maximize requests from all apps. You'll probably like this.
  name           = "suppress-maximize-events",
  match          = { class = ".*" },

  suppress_event = "maximize",
})

hl.window_rule({
  -- Fix some dragging issues with XWayland
  name     = "fix-xwayland-drags",
  match    = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },

  no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
  name  = "move-hyprland-run",
  match = { class = "hyprland-run" },

  move  = "20 monitor_h-120",
  float = true,
})
