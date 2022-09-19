-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
  naughty.notify({ preset = naughty.config.presets.critical,
    title = "Oops, there were errors during startup!",
    text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
  local in_error = false
  awesome.connect_signal("debug::error", function(err)
    -- Make sure we don't go into an endless error loop
    if in_error then return end
    in_error = true

    naughty.notify({ preset = naughty.config.presets.critical,
      title = "Oops, an error happened!",
      text = tostring(err) })
    in_error = false
  end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

local themes = {
  "default", -- 1
  "gtk", --2
  "sky", -- 3
  "xresources", -- 4
  "zenburn", -- 5
  "custom", -- 6
}
local chose_theme = themes[6]
local theme_path = string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chose_theme)
beautiful.init(theme_path)

terminal = "alacritty"
browser = "firefox-developer-edition"
-- browser = "brave"
-- locker = "light-locker-command -l"
locker = "betterlockscreen -l dimblur"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"
altkey = "Mod1"
shiftkey = "Shift"
controlkey = "Control"
mouse_left = 1
mouse_middle = 2
mouse_right = 3
mouse_up = 4
mouse_down = 5

-- Localization
os.setlocale(os.getenv("LANG"))

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.floating,
  -- awful.layout.suit.tile.left,
  -- awful.layout.suit.tile.bottom,
  -- awful.layout.suit.tile.top,
  -- awful.layout.suit.fair,
  -- awful.layout.suit.fair.horizontal,
  -- awful.layout.suit.spiral,
  -- awful.layout.suit.spiral.dwindle,
  awful.layout.suit.max,
  -- awful.layout.suit.max.fullscreen,
  awful.layout.suit.magnifier,
  -- awful.layout.suit.corner.nw,
  -- awful.layout.suit.corner.ne,
  -- awful.layout.suit.corner.sw,
  -- awful.layout.suit.corner.se,
}
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
  { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { "manual", terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awesome.conffile },
  { "restart", awesome.restart },
  { "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({
  items = {
    { "awesome", myawesomemenu, beautiful.awesome_icon },
    { "open terminal", terminal }
  }
})

-- mylauncher = awful.widget.launcher({
--   image = beautiful.awesome_icon,
--   menu = mymainmenu
-- })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
-- mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Checkupdates
-- local function checkupdates()
--   awful.spawn.easy_async("checkupdates", function(stdout)
--     local n = 0
--     for i in stdout:gmatch("\n") do
--       n = n + 1
--     end
--     naughty.notify({ title = n .. " updates available:", text = "\n" .. stdout })
--   end)
-- end

-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
  awful.button({}, mouse_left, function(t)
    t:view_only()
  end),
  awful.button({ modkey }, mouse_left, function(t)
    if client.focus then
      client.focus:move_to_tag(t)
    end
  end),
  awful.button({}, mouse_right, awful.tag.viewtoggle),
  awful.button({ modkey }, mouse_right, function(t)
    if client.focus then
      client.focus:toggle_tag(t)
    end
  end),
  awful.button({}, mouse_up, function(t)
    awful.tag.viewnext(t.screen)
  end),
  awful.button({}, mouse_down, function(t)
    awful.tag.viewprev(t.screen)
  end)
)

-- local tasklist_buttons = gears.table.join(
--   awful.button({}, 1, function(c)
--     if c == client.focus then
--       c.minimized = true
--     else
--       c:emit_signal(
--         "request::activate",
--         "tasklist",
--         { raise = true }
--       )
--     end
--   end),
--   awful.button({}, 3, function()
--     awful.menu.client_list({ theme = { width = 250 } })
--   end),
--   awful.button({}, 4, function()
--     awful.client.focus.byidx(1)
--   end),
--   awful.button({}, 5, function()
--     awful.client.focus.byidx(-1)
--   end)
-- )

local function set_wallpaper(s)
  -- Wallpaper
  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    -- If wallpaper is a function, call it with the screen
    if type(wallpaper) == "function" then
      wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)
  end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

-- awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)

local lain = require("lain")
local markup = lain.util.markup
-- local separators = lain.util.separators
-- local arrow = separators.arrow_left

-- Textclock
local clockicon = wibox.widget.imagebox(beautiful.widget_clock)
local clock = awful.widget.watch(
  "date +'%A %D %R'", 60,
  function(widget, stdout)
    widget:set_markup(markup.font(beautiful.font, stdout))
  end
)

-- Calendar
beautiful.cal = lain.widget.cal({
  attach_to = { clock },
  week_start = 1,
  notification_preset = {
    -- font = "JetBrains Mono 11",
    font = "FiraCode Nerd Font Mono 11",
    fg   = beautiful.fg_normal,
    bg   = beautiful.bg_normal
  }
})

-- MEM
local memicon = wibox.widget.imagebox(beautiful.widget_mem)
local mem = lain.widget.mem({
  settings = function()
    widget:set_markup(markup.font(beautiful.font, mem_now.used .. "MB"))
  end
})

-- CPU
local cpuicon = wibox.widget.imagebox(beautiful.widget_cpu)
local cpu = lain.widget.cpu({
  settings = function()
    widget:set_markup(markup.font(beautiful.font, cpu_now.usage .. "% "))
  end
})

-- Coretemp (lain, average)
local tempicon = wibox.widget.imagebox(beautiful.widget_temp)
local temp = lain.widget.temp({
  settings = function()
    widget:set_markup(markup.font(beautiful.font, coretemp_now .. "°C "))
  end
})

--  fs
local fsicon = wibox.widget.imagebox(beautiful.widget_hdd)
local fs = lain.widget.fs({
  notification_preset = { fg = beautiful.fg_normal, bg = beautiful.bg_normal, font = beautiful.font },
  settings = function()
    local fsp = string.format("%3.2f%s", fs_now["/"].free, fs_now["/"].units)
    widget:set_markup(markup.font(beautiful.font, fsp))
  end
})

-- Net
local neticon = wibox.widget.imagebox(beautiful.widget_net)
local net = lain.widget.net({
  settings = function()
    widget:set_markup(markup.font(beautiful.font, "↓" .. net_now.received .. " ↑" .. net_now.sent))
  end
})

local function at_screen_connect(s)
  -- Wallpaper
  set_wallpaper(s)

  local names = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }
  local l = awful.layout.suit
  local layouts = { l.tile, l.tile, l.tile, l.tile, l.tile, l.tile, l.tile, l.tile, l.tile }
  awful.tag(names, s, layouts)

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()
  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({}, mouse_left, function() awful.layout.inc(1) end),
    awful.button({}, mouse_right, function() awful.layout.inc(-1) end),
    awful.button({}, mouse_up, function() awful.layout.inc(1) end),
    awful.button({}, mouse_down, function() awful.layout.inc(-1) end)))
  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = taglist_buttons,
  }

  -- Create a tasklist widget
  -- s.mytasklist = awful.widget.tasklist {
  --   screen = s,
  --   filter = awful.widget.tasklist.filter.currenttags,
  --   buttons = tasklist_buttons
  -- }

  -- Create the wibox
  s.mywibox = awful.wibar({ position = "top", screen = s, bg = beautiful.bg_normal })

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      -- mylauncher,
      -- mytextclock,
      wibox.container.background(wibox.container.margin(clock, 4, 8), beautiful.bg_normal),
      s.mytaglist,
      s.mypromptbox,
    },
    s.mytasklist, -- Middle widget
    { -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      -- mykeyboardlayout,
      wibox.container.background(wibox.container.margin(wibox.widget { nil, neticon, net.widget,
        layout = wibox.layout.align.horizontal }, 2, 2), beautiful.bg_normal),
      wibox.container.background(wibox.container.margin(wibox.widget { tempicon, temp.widget,
        layout = wibox.layout.align.horizontal }, 2, 2), beautiful.bg_normal),
      wibox.container.background(wibox.container.margin(wibox.widget { cpuicon, cpu.widget,
        layout = wibox.layout.align.horizontal }, 2, 2), beautiful.bg_normal),
      wibox.container.background(wibox.container.margin(wibox.widget { memicon, mem.widget,
        layout = wibox.layout.align.horizontal }, 2, 2), beautiful.bg_normal),
      wibox.container.background(wibox.container.margin(wibox.widget { fsicon, fs.widget,
        layout = wibox.layout.align.horizontal }, 2, 2), beautiful.bg_normal),
      wibox.widget.systray(),
      s.mylayoutbox,
    },
  }
end

awful.screen.connect_for_each_screen(at_screen_connect)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
  awful.button({}, mouse_right, function()
    mymainmenu:toggle()
  end),
  awful.button({}, mouse_up, awful.tag.viewnext),
  awful.button({}, mouse_down, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
  awful.key({ modkey, }, "/", hotkeys_popup.show_help,
    { description = "show help", group = "awesome" }),
  awful.key({ modkey, }, "Left", awful.tag.viewprev,
    { description = "view previous", group = "tag" }),
  awful.key({ modkey, }, "Right", awful.tag.viewnext,
    { description = "view next", group = "tag" }),
  awful.key({ modkey, }, "Escape", awful.tag.history.restore,
    { description = "go back", group = "tag" }),

  awful.key({ modkey, }, "j",
    function() awful.client.focus.byidx(1) end,
    { description = "focus next by index", group = "client" }),
  awful.key({ modkey, }, "k",
    function() awful.client.focus.byidx(-1) end,
    { description = "focus previous by index", group = "client" }),

  awful.key({ modkey, }, "w", function() mymainmenu:show() end,
    { description = "show main menu", group = "awesome" }),

  -- Layout manipulation
  awful.key({ modkey, shiftkey }, "j",
    function() awful.client.swap.byidx(1) end,
    { description = "swap with next client by index", group = "client" }),
  awful.key({ modkey, shiftkey }, "k",
    function() awful.client.swap.byidx(-1) end,
    { description = "swap with previous client by index", group = "client" }),

  awful.key({ modkey, controlkey }, "j",
    function() awful.screen.focus_relative(1) end,
    { description = "focus the next screen", group = "screen" }),
  awful.key({ modkey, controlkey }, "k",
    function() awful.screen.focus_relative(-1) end,
    { description = "focus the previous screen", group = "screen" }),

  awful.key({ modkey, }, "u",
    awful.client.urgent.jumpto,
    { description = "jump to urgent client", group = "client" }),
  awful.key({ modkey, }, "Tab",
    function()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end,
    { description = "go back", group = "client" }),

  -- Standard program
  awful.key({ modkey, }, "a",
    function() awful.spawn(terminal) end,
    { description = "open a terminal", group = "launcher" }),
  awful.key({ modkey, }, "b",
    function() awful.spawn(browser) end,
    { description = "open a browser", group = "launcher" }),
  awful.key({ modkey, altkey }, "r",
    awesome.restart,
    { description = "reload awesome", group = "awesome" }),
  awful.key({ modkey, altkey }, "q",
    awesome.quit,
    { description = "quit awesome", group = "awesome" }),
  awful.key({ modkey, }, "x",
    function() awful.spawn(locker) end,
    { description = "lock the screen", group = "awesome" }),
  awful.key({ modkey, }, "l",
    function() awful.tag.incmwfact(0.05) end,
    { description = "increase master width factor", group = "layout" }),
  awful.key({ modkey, }, "h",
    function() awful.tag.incmwfact(-0.05) end,
    { description = "decrease master width factor", group = "layout" }),
  awful.key({ modkey, shiftkey }, "h", function() awful.tag.incnmaster(1, nil, true) end,
    { description = "increase the number of master clients", group = "layout" }),
  awful.key({ modkey, shiftkey }, "l", function() awful.tag.incnmaster(-1, nil, true) end,
    { description = "decrease the number of master clients", group = "layout" }),
  awful.key({ modkey, controlkey }, "h", function() awful.tag.incncol(1, nil, true) end,
    { description = "increase the number of columns", group = "layout" }),
  awful.key({ modkey, controlkey }, "l", function() awful.tag.incncol(-1, nil, true) end,
    { description = "decrease the number of columns", group = "layout" }),
  -- awful.key({ modkey, }, "Return", function() awful.layout.inc(1) end,
  --   { description = "select next", group = "layout" }),
  awful.key({ modkey, shiftkey }, "space", function() awful.layout.inc(-1) end,
    { description = "select previous", group = "layout" }),

  awful.key({ modkey, controlkey }, "n",
    function()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        c:emit_signal(
          "request::activate", "key.unminimize", { raise = true }
        )
      end
    end,
    { description = "restore minimized", group = "client" }),

  -- Prompt
  awful.key({ modkey }, "space", function() awful.screen.focused().mypromptbox:run() end,
    { description = "run prompt", group = "launcher" }),

  -- awful.key({ modkey }, "x",
  --   function()
  --     awful.prompt.run {
  --       prompt       = "Run Lua code: ",
  --       textbox      = awful.screen.focused().mypromptbox.widget,
  --       exe_callback = awful.util.eval,
  --       history_path = awful.util.get_cache_dir() .. "/history_eval"
  --     }
  --   end,
  --   { description = "lua execute prompt", group = "awesome" }),
  -- Menubar
  awful.key({ modkey }, "p", function() menubar.show() end,
    { description = "show the menubar", group = "launcher" })
)

clientkeys = gears.table.join(
  awful.key({ modkey }, "q", function(c) c:kill() end,
    { description = "close", group = "client" }),
  awful.key({ modkey, }, "f",
    function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    { description = "toggle fullscreen", group = "client" }),
  awful.key({ modkey, shiftkey }, "space",
    function(c)
      c.floating = not c.floating
    end,
    { description = "toggle floating", group = "client" }),
  awful.key({ modkey }, "Return",
    function(c) c:swap(awful.client.getmaster()) end,
    { description = "move to master", group = "client" }),
  awful.key({ modkey, }, "o",
    function(c) c:move_to_screen() end,
    { description = "move to screen", group = "client" }),
  -- awful.key({ modkey, }, "t", function(c) c.ontop = not c.ontop end,
  --   { description = "toggle keep on top", group = "client" }),
  awful.key({ modkey, }, "n",
    function(c) c.minimized = true end,
    { description = "minimize", group = "client" }),
  awful.key({ modkey, }, "m",
    function(c)
      c.maximized = not c.maximized
      c:raise()
    end,
    { description = "(un)maximize", group = "client" }),
  awful.key({ modkey, controlkey }, "m",
    function(c)
      c.maximized_vertical = not c.maximized_vertical
      c:raise()
    end,
    { description = "(un)maximize vertically", group = "client" }),
  awful.key({ modkey, shiftkey }, "m",
    function(c)
      c.maximized_horizontal = not c.maximized_horizontal
      c:raise()
    end,
    { description = "(un)maximize horizontally", group = "client" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  globalkeys = gears.table.join(globalkeys,
    -- View tag only.
    awful.key({ modkey }, "#" .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          tag:view_only()
        end
      end,
      { description = "view tag #" .. i, group = "tag" }),
    -- Toggle tag display.
    awful.key({ modkey, controlkey }, "#" .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end,
      { description = "toggle tag #" .. i, group = "tag" }),
    -- Move client to tag.
    awful.key({ modkey, "Shift" }, "#" .. i + 9,
      function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
          end
        end
      end,
      { description = "move focused client to tag #" .. i, group = "tag" }),
    -- Toggle tag on focused client.
    awful.key({ modkey, controlkey, "Shift" }, "#" .. i + 9,
      function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:toggle_tag(tag)
          end
        end
      end,
      { description = "toggle focused client on tag #" .. i, group = "tag" })
  )
end

clientbuttons = gears.table.join(
  awful.button({}, mouse_left, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
  end),
  awful.button({ modkey }, mouse_left, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.move(c)
  end),
  awful.button({ modkey }, mouse_right, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.resize(c)
  end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
  -- All clients will match this rule.
  { rule = {},
    properties = { border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = clientkeys,
      buttons = clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen
    }
  },

  -- Floating clients.
  { rule_any = {
    instance = {
      "DTA", -- Firefox addon DownThemAll.
      "copyq", -- Includes session name in class.
      "pinentry",
    },
    class = {
      "Arandr",
      "Blueman-manager",
      "Gpick",
      "Kruler",
      "MessageWin", -- kalarm.
      "Sxiv",
      "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
      "Wpa_gui",
      "veromix",
      "xtightvncviewer"
    },

    -- Note that the name property shown in xprop might be set slightly after creation of the client
    -- and the name shown there might not match defined rules here.
    name = {
      "Event Tester", -- xev.
    },
    role = {
      "AlarmWindow", -- Thunderbird's calendar.
      "ConfigManager", -- Thunderbird's about:config.
      "pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
    }
  }, properties = { floating = true } },

  -- Add titlebars to normal clients and dialogs
  { rule_any = { type = { "normal", "dialog" } },
    properties = { titlebars_enabled = false }
  },

  -- Set Firefox to always map on the tag named "2" on screen 1.
  { rule_any = { class = { "firefox-developer-edition", "Brave-browser" }, },
    properties = { screen = 1, tag = "1" } },

  { rule = { class = "Code" },
    properties = { screen = 1, tag = "3" } },

  { rule_any = { class = { "wps", "et", "wpp", "pdf" }, },
    properties = { screen = 1, tag = "4" } },

  { rule_any = { class = { "netease-cloud-music", "listen1" } },
    properties = { screen = 1, tag = "6" } },

  { rule = { class = "Clash for Windows" },
    properties = { screen = 1, tag = "7" } },

  { rule_any = { class = { "Steam", "citra" }, },
    properties = { screen = 1, tag = "8" } },

  { rule = { class = "dota2" },
    properties = { screen = 1, tag = "9", fullscreen = true } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
  -- Set the windows at the slave,
  -- i.e. put it at the end of others instead of setting it master.
  -- if not awesome.startup then awful.client.setslave(c) end

  if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
    -- Prevent clients from being unreachable after screen count changes.
    awful.placement.no_offscreen(c)
  end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
  -- buttons for the titlebar
  local buttons = gears.table.join(
    awful.button({}, 1, function()
      c:emit_signal("request::activate", "titlebar", { raise = true })
      awful.mouse.client.move(c)
    end),
    awful.button({}, 3, function()
      c:emit_signal("request::activate", "titlebar", { raise = true })
      awful.mouse.client.resize(c)
    end)
  )

  awful.titlebar(c):setup {
    { -- Left
      awful.titlebar.widget.iconwidget(c),
      buttons = buttons,
      layout  = wibox.layout.fixed.horizontal
    },
    { -- Middle
      { -- Title
        align  = "center",
        widget = awful.titlebar.widget.titlewidget(c)
      },
      buttons = buttons,
      layout  = wibox.layout.flex.horizontal
    },
    { -- Right
      awful.titlebar.widget.floatingbutton(c),
      awful.titlebar.widget.maximizedbutton(c),
      awful.titlebar.widget.stickybutton(c),
      awful.titlebar.widget.ontopbutton(c),
      awful.titlebar.widget.closebutton(c),
      layout = wibox.layout.fixed.horizontal()
    },
    layout = wibox.layout.align.horizontal
  }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
  c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- Autostart
awful.spawn.with_shell("~/.config/awesome/autorun.sh")