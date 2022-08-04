local theme_assets = require("beautiful.theme_assets")
local dpi = require("beautiful.xresources").apply_dpi

-- local gfs = require("gears.filesystem")
-- local theme_dir = gfs.get_themes_dir()

local themes_path = string.format("%s/.config/awesome/themes/", os.getenv("HOME"))
local theme_dir = themes_path .. "custom/"

-- theme template
local theme = {}

-- default variables
theme.font = "FiraCode Nerd Font Mono 10"
-- theme.wallpaper = "/usr/share/backgrounds/archlinux/awesome.png"
theme.wallpaper = theme_dir .. "wallpaper/purple-space-light.jpg"

-- arcchart
-- theme.arcchart_border_color = nil
-- theme.arcchart_color = nil
-- theme.arcchart_border_width = nil
-- theme.arcchart_paddings = nil
-- theme.arcchart_thickness = nil

theme.bg_transparent = "50"

-- bg
theme.bg_normal = "#1f1f1f" .. theme.bg_transparent
theme.bg_focus = "#535d6c" .. theme.bg_transparent
theme.bg_urgent = "#e53935" .. theme.bg_transparent
theme.bg_minimize = nil
theme.bg_systray = theme.bg_normal

-- fg
theme.fg_normal = "#fefefe"
theme.fg_focus = "#ffffff"
theme.fg_urgent = "#ffffff"
theme.fg_minimize = nil

-- border
theme.border_width = dpi(3)
theme.border_normal = "#222222"
theme.border_focus = "#535d6c" -- "#31004a" "#4c00a4" "#f4511e" "#8300c4"
theme.border_marked = "#91231c"

-- taglist
theme.taglist_fg_focus = theme.fg_focus
theme.taglist_bg_focus = theme.bg_focus
theme.taglist_fg_urgent = theme.fg_urgent
theme.taglist_bg_urgent = theme.bg_urgent
theme.taglist_bg_occupied = theme.bg_normal
theme.taglist_fg_occupied = "#f4511e"
theme.taglist_bg_empty = theme.bg_normal
theme.taglist_fg_empty = "#8f8f8f"
-- theme.taglist_bg_volatile = nil
-- theme.taglist_fg_volatile = nil
-- theme.taglist_squares_sel = nil
-- theme.taglist_squares_unsel = nil
-- theme.taglist_squares_sel_empty = nil
-- theme.taglist_squares_unsel_empty = nil
-- theme.taglist_squares_resize = nil
theme.taglist_disable_icon = false
theme.taglist_font = theme.font
theme.taglist_spacing = dpi(2)
-- theme.taglist_shape = nil
-- theme.taglist_shape_border_width = nil
-- theme.taglist_shape_border_color = nil
-- theme.taglist_shape_empty = nil
-- theme.taglist_shape_border_width_empty = nil
-- theme.taglist_shape_border_color_empty = nil
-- theme.taglist_shape_focus = nil
-- theme.taglist_shape_border_width_focus = nil
-- theme.taglist_shape_border_color_focus = nil
-- theme.taglist_shape_urgent = nil
-- theme.taglist_shape_border_width_urgent = nil
-- theme.taglist_shape_border_color_urgent = nil
-- theme.taglist_shape_volatile = nil
-- theme.taglist_shape_border_width_volatile = nil
-- theme.taglist_shape_border_color_volatile = nil

-- calendar
-- theme.calendar_style = nil
theme.calendar_font = theme.font
-- theme.calendar_spacing = nil
-- theme.calendar_week_numbers = nil
-- theme.calendar_start_sunday = nil
-- theme.calendar_long_weekdays = nil

-- checkbox
-- theme.checkbox_border_width = nil
-- theme.checkbox_bg = nil
-- theme.checkbox_border_color = nil
-- theme.checkbox_check_border_color = nil
-- theme.checkbox_check_border_width = nil
-- theme.checkbox_check_color = nil
-- theme.checkbox_shape = nil
-- theme.checkbox_check_shape = nil
-- theme.checkbox_paddings = nil
-- theme.checkbox_color = nil

-- column
-- theme.column_count = nil

-- cursor
-- theme.cursor_mouse_resize = nil
-- theme.cursor_mouse_move = nil

-- enable
-- theme.enable_spawn_cursor = nil

-- fullscreen
theme.fullscreen_hide_border = true

-- gap
theme.gap_single_client = true

-- graph
-- theme.graph_bg = nil
-- theme.graph_fg = nil
-- theme.graph_border_color = nil

-- hotkeys
-- theme.hotkeys_bg = nil
-- theme.hotkeys_fg = nil
-- theme.hotkeys_border_width = nil
-- theme.hotkeys_border_color = nil
-- theme.hotkeys_shape = nil
-- theme.hotkeys_modifiers_fg = nil
-- theme.hotkeys_label_bg = nil
-- theme.hotkeys_label_fg = nil
theme.hotkeys_font = theme.font
theme.hotkeys_description_font = theme.font
-- theme.hotkeys_group_margin = nil

-- icon
-- theme.icon_theme = nil

-- layout
theme.layout_fairh      = theme_dir .. "layouts/fairhw.png"
theme.layout_fairv      = theme_dir .. "layouts/fairvw.png"
theme.layout_floating   = theme_dir .. "layouts/floatingw.png"
theme.layout_magnifier  = theme_dir .. "layouts/magnifierw.png"
theme.layout_max        = theme_dir .. "layouts/maxw.png"
theme.layout_fullscreen = theme_dir .. "layouts/fullscreenw.png"
theme.layout_tilebottom = theme_dir .. "layouts/tilebottomw.png"
theme.layout_tileleft   = theme_dir .. "layouts/tileleftw.png"
theme.layout_tile       = theme_dir .. "layouts/tilew.png"
theme.layout_tiletop    = theme_dir .. "layouts/tiletopw.png"
theme.layout_spiral     = theme_dir .. "layouts/spiralw.png"
theme.layout_dwindle    = theme_dir .. "layouts/dwindlew.png"
theme.layout_cornernw   = theme_dir .. "layouts/cornernww.png"
theme.layout_cornerne   = theme_dir .. "layouts/cornernew.png"
theme.layout_cornersw   = theme_dir .. "layouts/cornersww.png"
theme.layout_cornerse   = theme_dir .. "layouts/cornersew.png"

-- layoutlist
-- theme.layoutlist_fg_normal = nil
-- theme.layoutlist_bg_normal = nil
-- theme.layoutlist_fg_selected = nil
-- theme.layoutlist_bg_selected = nil
-- theme.layoutlist_disable_icon = nil
-- theme.layoutlist_disable_name = nil
theme.layoutlist_font = theme.font
-- theme.layoutlist_align = nil
theme.layoutlist_font_selected = theme.font
-- theme.layoutlist_spacing = nil
-- theme.layoutlist_shape = nil
-- theme.layoutlist_shape_border_width = nil
-- theme.layoutlist_shape_border_color = nil
-- theme.layoutlist_shape_selected = nil
-- theme.layoutlist_shape_border_width_selected = nil
-- theme.layoutlist_shape_border_color_selected = nil

-- master
-- theme.master_width_factor = nil
-- theme.master_fill_policy = nil
-- theme.master_count = nil

-- maximized
-- theme.maximized_honor_padding = nil
-- theme.maximized_hide_border = nil

-- menu
theme.menu_font = theme.font
theme.menu_height = dpi(16)
theme.menu_width = dpi(140)
-- theme.menu_border_color = nil
-- theme.menu_border_width = nil
-- theme.menu_fg_focus = nil
-- theme.menu_bg_focus = nil
-- theme.menu_fg_normal = nil
-- theme.menu_bg_normal = nil
-- theme.menu_submenu_icon = nil
-- theme.menu_submenu = nil

-- menubar
-- theme.menubar_fg_normal = nil
-- theme.menubar_bg_normal = nil
-- theme.menubar_border_width = nil
-- theme.menubar_border_color = nil
-- theme.menubar_fg_normal = nil
-- theme.menubar_bg_normal = nil

-- notification\
theme.notification_font = theme.font
-- theme.notification_bg = nil
-- theme.notification_fg = nil
-- theme.notification_border_width = nil
-- theme.notification_border_color = nil
-- theme.notification_shape = nil
-- theme.notification_opacity = nil
-- theme.notification_margin = nil
-- theme.notification_width = nil
-- theme.notification_height = nil
-- theme.notification_max_width = nil
-- theme.notification_max_height = nil
-- theme.notification_icon_size = nil

-- piechart
-- theme.piechart_border_color = nil
-- theme.piechart_border_width = nil
-- theme.piechart_colors = nil

-- progressbar
-- theme.progressbar_bg = nil
-- theme.progressbar_fg = nil
-- theme.progressbar_shape = nil
-- theme.progressbar_border_color = nil
-- theme.progressbar_border_width = nil
-- theme.progressbar_bar_shape = nil
-- theme.progressbar_bar_border_width = nil
-- theme.progressbar_bar_border_color = nil
-- theme.progressbar_margins = nil
-- theme.progressbar_paddings = nil

-- prompt
-- theme.prompt_fg_cursor = nil
-- theme.prompt_bg_cursor = nil
theme.prompt_font = theme.font
-- theme.prompt_fg = nil
-- theme.prompt_bg = nil

-- radialprogressbar
-- theme.radialprogressbar_border_color = nil
-- theme.radialprogressbar_color = nil
-- theme.radialprogressbar_border_width = nil
-- theme.radialprogressbar_paddings = nil

-- separator
-- theme.separator_thickness = nil
-- theme.separator_border_color = nil
-- theme.separator_border_width = nil
-- theme.separator_span_ratio = nil
-- theme.separator_color = nil
-- theme.separator_shape = nil

-- slider
-- theme.slider_bar_border_width = nil
-- theme.slider_bar_border_color = nil
-- theme.slider_handle_border_color = nil
-- theme.slider_handle_border_width = nil
-- theme.slider_handle_width = nil
-- theme.slider_handle_color = nil
-- theme.slider_handle_shape = nil
-- theme.slider_bar_shape = nil
-- theme.slider_bar_height = nil
-- theme.slider_bar_margins = nil
-- theme.slider_handle_margins = nil
-- theme.slider_bar_color = nil

-- snap
-- theme.snap_bg = nil
-- theme.snap_border_width = nil
-- theme.snap_shape = nil

-- snapper
-- theme.snapper_gap = nil

-- systray
theme.systray_icon_spacing = dpi(5)

-- tasklist
-- theme.tasklist_fg_normal = nil
-- theme.tasklist_bg_normal = nil
-- theme.tasklist_fg_focus = nil
-- theme.tasklist_bg_focus = nil
-- theme.tasklist_fg_urgent = nil
-- theme.tasklist_bg_urgent = nil
-- theme.tasklist_fg_minimize = nil
-- theme.tasklist_bg_minimize = nil
-- theme.tasklist_bg_image_normal = nil
-- theme.tasklist_bg_image_focus = nil
-- theme.tasklist_bg_image_urgent = nil
-- theme.tasklist_bg_image_minimize = nil
-- theme.tasklist_disable_icon = nil
-- theme.tasklist_disable_task_name = nil
-- theme.tasklist_plain_task_name = nil
-- theme.tasklist_font = nil
-- theme.tasklist_align = nil
-- theme.tasklist_font_focus = nil
-- theme.tasklist_font_minimized = nil
-- theme.tasklist_font_urgent = nil
-- theme.tasklist_spacing = nil
-- theme.tasklist_shape = nil
-- theme.tasklist_shape_border_width = nil
-- theme.tasklist_shape_border_color = nil
-- theme.tasklist_shape_focus = nil
-- theme.tasklist_shape_border_width_focus = nil
-- theme.tasklist_shape_border_color_focus = nil
-- theme.tasklist_shape_minimized = nil
-- theme.tasklist_shape_border_width_minimized = nil
-- theme.tasklist_shape_border_color_minimized = nil
-- theme.tasklist_shape_urgent = nil
-- theme.tasklist_shape_border_width_urgent = nil
-- theme.tasklist_shape_border_color_urgent = nil

-- titlebar
-- theme.titlebar_fg_normal = nil
-- theme.titlebar_bg_normal = nil
-- theme.titlebar_bgimage_normal = nil
-- theme.titlebar_fg = nil
-- theme.titlebar_bg = nil
-- theme.titlebar_bgimage = nil
-- theme.titlebar_fg_focus = nil
-- theme.titlebar_bg_focus = nil
-- theme.titlebar_bgimage_focus = nil
-- theme.titlebar_floating_button_normal = nil
-- theme.titlebar_maximized_button_normal = nil
-- theme.titlebar_minimize_button_normal = nil
-- theme.titlebar_minimize_button_normal_hover = nil
-- theme.titlebar_minimize_button_normal_press = nil
-- theme.titlebar_close_button_normal = nil
-- theme.titlebar_close_button_normal_hover = nil
-- theme.titlebar_close_button_normal_press = nil
-- theme.titlebar_ontop_button_normal = nil
-- theme.titlebar_sticky_button_normal = nil
-- theme.titlebar_floating_button_focus = nil
-- theme.titlebar_maximized_button_focus = nil
-- theme.titlebar_minimize_button_focus = nil
-- theme.titlebar_minimize_button_focus_hover = nil
-- theme.titlebar_minimize_button_focus_press = nil
-- theme.titlebar_close_button_focus = nil
-- theme.titlebar_close_button_focus_hover = nil
-- theme.titlebar_close_button_focus_press = nil
-- theme.titlebar_ontop_button_focus = nil
-- theme.titlebar_sticky_button_focus = nil
-- theme.titlebar_floating_button_normal_active = nil
-- theme.titlebar_floating_button_normal_active_hover = nil
-- theme.titlebar_floating_button_normal_active_press = nil
-- theme.titlebar_maximized_button_normal_active = nil
-- theme.titlebar_maximized_button_normal_active_hover = nil
-- theme.titlebar_maximized_button_normal_active_press = nil
-- theme.titlebar_ontop_button_normal_active = nil
-- theme.titlebar_ontop_button_normal_active_hover = nil
-- theme.titlebar_ontop_button_normal_active_press = nil
-- theme.titlebar_sticky_button_normal_active = nil
-- theme.titlebar_sticky_button_normal_active_hover = nil
-- theme.titlebar_sticky_button_normal_active_press = nil
-- theme.titlebar_floating_button_focus_active = nil
-- theme.titlebar_floating_button_focus_active_hover = nil
-- theme.titlebar_floating_button_focus_active_press = nil
-- theme.titlebar_maximized_button_focus_active = nil
-- theme.titlebar_maximized_button_focus_active_hover = nil
-- theme.titlebar_maximized_button_focus_active_press = nil
-- theme.titlebar_ontop_button_focus_active = nil
-- theme.titlebar_ontop_button_focus_active_hover = nil
-- theme.titlebar_ontop_button_focus_active_press = nil
-- theme.titlebar_sticky_button_focus_active = nil
-- theme.titlebar_sticky_button_focus_active_hover = nil
-- theme.titlebar_sticky_button_focus_active_press = nil
-- theme.titlebar_floating_button_normal_inactive = nil
-- theme.titlebar_floating_button_normal_inactive_hover = nil
-- theme.titlebar_floating_button_normal_inactive_press = nil
-- theme.titlebar_maximized_button_normal_inactive = nil
-- theme.titlebar_maximized_button_normal_inactive_hover = nil
-- theme.titlebar_maximized_button_normal_inactive_press = nil
-- theme.titlebar_ontop_button_normal_inactive = nil
-- theme.titlebar_ontop_button_normal_inactive_hover = nil
-- theme.titlebar_ontop_button_normal_inactive_press = nil
-- theme.titlebar_sticky_button_normal_inactive = nil
-- theme.titlebar_sticky_button_normal_inactive_hover = nil
-- theme.titlebar_sticky_button_normal_inactive_press = nil
-- theme.titlebar_floating_button_focus_inactive = nil
-- theme.titlebar_floating_button_focus_inactive_hover = nil
-- theme.titlebar_floating_button_focus_inactive_press = nil
-- theme.titlebar_maximized_button_focus_inactive = nil
-- theme.titlebar_maximized_button_focus_inactive_hover = nil
-- theme.titlebar_maximized_button_focus_inactive_press = nil
-- theme.titlebar_ontop_button_focus_inactive = nil
-- theme.titlebar_ontop_button_focus_inactive_hover = nil
-- theme.titlebar_ontop_button_focus_inactive_press = nil
-- theme.titlebar_sticky_button_focus_inactive = nil
-- theme.titlebar_sticky_button_focus_inactive_hover = nil
-- theme.titlebar_sticky_button_focus_inactive_press = nil

-- tooltip
-- theme.tooltip_border_color = nil
-- theme.tooltip_bg = nil
-- theme.tooltip_fg = nil
theme.tooltip_font = theme.font
-- theme.tooltip_border_width = nil
-- theme.tooltip_opacity = nil
-- theme.tooltip_shape = nil
-- theme.tooltip_align = nil

-- useless
theme.useless_gap = dpi(5)

-- wibar
-- theme.wibar_stretch = nil
-- theme.wibar_border_width = nil
-- theme.wibar_border_color = nil
-- theme.wibar_ontop = nil
-- theme.wibar_cursor = nil
-- theme.wibar_opacity = nil
-- theme.wibar_type = nil
-- theme.wibar_width = nil
-- theme.wibar_height = nil
-- theme.wibar_bg = nil
-- theme.wibar_bgimage = nil
-- theme.wibar_fg = nil
-- theme.wibar_shape = nil

-- awesome
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

theme.widget_ac          = theme_dir .. "/icons/ac.png"
theme.widget_mem         = theme_dir .. "/icons/mem.png"
theme.widget_cpu         = theme_dir .. "/icons/cpu.png"
theme.widget_temp        = theme_dir .. "/icons/temp.png"
theme.widget_net         = theme_dir .. "/icons/net.png"
theme.widget_hdd         = theme_dir .. "/icons/hdd.png"
theme.widget_music       = theme_dir .. "/icons/note.png"
theme.widget_music_on    = theme_dir .. "/icons/note.png"
theme.widget_music_pause = theme_dir .. "/icons/pause.png"
theme.widget_music_stop  = theme_dir .. "/icons/stop.png"
theme.widget_vol         = theme_dir .. "/icons/vol.png"
theme.widget_vol_low     = theme_dir .. "/icons/vol_low.png"
theme.widget_vol_no      = theme_dir .. "/icons/vol_no.png"
theme.widget_vol_mute    = theme_dir .. "/icons/vol_mute.png"
theme.widget_mail        = theme_dir .. "/icons/mail.png"
theme.widget_mail_on     = theme_dir .. "/icons/mail_on.png"
theme.widget_task        = theme_dir .. "/icons/task.png"
theme.widget_scissors    = theme_dir .. "/icons/scissors.png"
theme.widget_weather     = theme_dir .. "/icons/dish.png"

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
