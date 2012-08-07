-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")

-- Widget and layout library
-- require("wibox") -- Not necessary anymore

-- Widgets library
require("vicious")

-- Theme handling library
require("beautiful")

-- Notification library
require("naughty")
require("menubar")

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
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init("/home/hsp/.config/awesome/my_themes/mine/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "urxvtc"
editor = "subl"
-- editor = "vim"
-- editor_cmd = terminal .. " -e " .. editor
editor_cmd = "subl"

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    -- awful.layout.suit.max,
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.fair,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.magnifier
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {} for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ "term", "web", "code", "off", "extr", "vbox" }, s, layouts[1])
end
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
-- myawesomemenu = {
--    { "manual", terminal .. " -e man awesome" },
--    { "edit config", editor_cmd .. " " .. awesome.conffile },
--    { "restart", awesome.restart },
--    { "quit", awesome.quit }
-- }

mymainmenu = awful.menu({ items = {
                  -- { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "Terminal", terminal },
                                    { "Thunar", "thunar" },
                                    { "Sublime Text 2", "subl" },
                                    { "Google Chrome", "google-chrome" }
                  }
                        })

-- mylauncher = awful.widget.launcher({ menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Widgets

-- --------
-- Pictures
-- --------
    -- Arch Icon
    arch_pic = wibox.widget.imagebox()
    arch_pic:set_image(beautiful.arch_icon)

    -- CPU Icon
    cpu_pic = wibox.widget.imagebox()
    cpu_pic:set_image(beautiful.cpu_icon)

    -- Bat Icon
    bat_pic = wibox.widget.imagebox()
    bat_pic:set_image(beautiful.bat_icon)

    -- Mem Icon
    mem_pic = wibox.widget.imagebox()
    mem_pic:set_image(beautiful.mem_icon)

    -- Wifi Icon
    wifi_pic = wibox.widget.imagebox()
    wifi_pic:set_image(beautiful.wifi_icon)

    -- Vol Icon
    vol_pic = wibox.widget.imagebox()
    vol_pic:set_image(beautiful.vol_icon)

    -- Disk Icon
    disk_pic = wibox.widget.imagebox()
    disk_pic:set_image(beautiful.disk_icon)

    -- Time Icon
    time_pic = wibox.widget.imagebox()
    time_pic:set_image(beautiful.time_icon)

    -- Root Icon
    root_pic = wibox.widget.imagebox()
    root_pic:set_image(beautiful.root_icon)

    -- net_dn Icon
    net_dn_pic = wibox.widget.imagebox()
    net_dn_pic:set_image(beautiful.net_dn_icon)

    -- net_up Icon
    net_up_pic = wibox.widget.imagebox()
    net_up_pic:set_image(beautiful.net_up_icon)

-- ----
-- Text
-- ----
    -- Spacer
    space_widget = wibox.widget.textbox()
    space_widget:set_text("         ")
    space_widget_one = wibox.widget.textbox()
    space_widget_one:set_text(" ")

    vert_line_widget = wibox.widget.textbox()
    vert_line_widget:set_text('||')

-- ---------------
-- Vicious Widgets
-- ---------------
    mem_widget = wibox.widget.textbox()
    vicious.register(mem_widget, vicious.widgets.mem, '<span color="#ffffff">$9%</span>', 59)

    wifi_dn_widget = wibox.widget.textbox()
    vicious.register(wifi_dn_widget, vicious.widgets.net, '<span color="#ffffff">${wlan0 down_kb}</span>kb', 3)

    wifi_up_widget = wibox.widget.textbox()
    vicious.register(wifi_up_widget, vicious.widgets.net, '<span color="#ffffff">${wlan0 up_kb}</span>kb', 4)

    cpu_widget = wibox.widget.textbox()
    vicious.register(cpu_widget, vicious.widgets.cpu, '<span color="#ffffff">$1%</span>', 2)

    wifi_label = wibox.widget.textbox()
    vicious.register(wifi_label, vicious.widgets.wifi,
        function (widget, args)
            if args["{ssid}"] == "N/A" then
                return '<span color="#f9266b">' .. "No Wifi" .. '</span>'
            elseif args["{link}"] < 35 then
                return '<span color="#f9266b">' .. args["{ssid}"] .. '</span>'
            elseif args["{link}"] > 55 then
                return '<span color="#a6e22e">' .. args["{ssid}"] .. '</span>'
            else
                return args["{ssid}"]
            end
        end,
    17, "wlan0")

    root_widget = wibox.widget.textbox()
    vicious.register(root_widget, vicious.widgets.fs,
        function (widget, args)
            if args["{/ used_p}"] < 50 then
                return '<span color="#a6e22e">' .. args["{/ used_p}"] .. '</span>%'
            else
                return '<span color="#f9266b">' .. args["{/ used_p}"] .. '</span>%'
            end
        end,
    237)

    bat_widget = wibox.widget.textbox()
    vicious.register(bat_widget, vicious.widgets.bat,
        function (widget, args)
            if args[1] == "+" then
                bat_pic:set_image(beautiful.bat_icon)
                return 'Charging: <span color="#ffffff">' .. args[2] .. "</span>%"
            elseif args[1] == "-" then
                if args[2] < 15 then
                    naughty.notify({ preset = naughty.config.presets.critical,
                                     title = "Battery Warning!",
                                     text = "Battery less than 15% Left" })

                    bat_pic:set_image(beautiful.low_icon)
                    return 'Low Battery! <span color="#f9266b">' .. args[2] .. "</span>%"
                else
                    bat_pic:set_image(beautiful.bat_icon)
                    return 'Discharging: <span color="#ffffff">' .. args[2] .. "</span>%"
                end
            else
                bat_pic:set_image(beautiful.plug_icon)
                return 'Plugged In: <span color="#a6e22e">' .. args[2] .. "</span>%"
            end
        end,
    79, "BAT0")

-- temp_widget = wibox.widget.textbox()
-- vicious.register(temp_widget, vicious.widgets.thermal,
--     function (widget, args)
--         awful.util.spawn("fanspeed " .. args[1])
--         return args[1]
--     end,
-- 11, "thermal_zone0")

-- }}}

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock()


-- Create a wibox for each screen and add it
mywibox = {}
mywibox_bot = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  -- instance = awful.menu.clients({ width=600 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()

    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))

    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wiboxes
    mywibox[s] = awful.wibox({ position = "top", height = "18", screen = s })

    -- -------
    -- Top Bar
    -- -------
        -- Left aligned widgets
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(mytaglist[s])
        left_layout:add(mypromptbox[s])
        if s == 1 then left_layout:add(wibox.widget.systray()) end
        if s == 1 then left_layout:add(space_widget_one) end
        -- if s == 1 then left_layout:add(vert_line_widget) end
        left_layout:add(arch_pic)
        if s == 1 then left_layout:add(space_widget_one) end
        if s == 1 then left_layout:add(space_widget_one) end

        -- middle aligned widgets
        local middle_layout = wibox.layout.fixed.horizontal()
        middle_layout:add(mytasklist[s])

        -- Right aligned widgets
        local right_layout = wibox.layout.fixed.horizontal()
        if s == 1 then right_layout:add(bat_pic) end
        if s == 1 then right_layout:add(bat_widget) end
        if s == 1 then right_layout:add(space_widget) end
        if s == 1 then right_layout:add(wifi_pic) end
        if s == 1 then right_layout:add(wifi_label) end
        if s == 1 then right_layout:add(net_dn_pic) end
        if s == 1 then right_layout:add(wifi_dn_widget) end
        if s == 1 then right_layout:add(net_up_pic) end
        if s == 1 then right_layout:add(wifi_up_widget) end
        if s == 1 then right_layout:add(space_widget) end
        if s == 1 then right_layout:add(cpu_pic) end
        if s == 1 then right_layout:add(cpu_widget) end
        if s == 1 then right_layout:add(space_widget) end
        if s == 1 then right_layout:add(mem_pic) end
        if s == 1 then right_layout:add(mem_widget) end
        if s == 1 then right_layout:add(space_widget) end
        if s == 1 then right_layout:add(root_pic) end
        if s == 1 then right_layout:add(root_widget) end
        if s == 1 then right_layout:add(space_widget) end
        right_layout:add(time_pic)
        right_layout:add(mytextclock)
        if s == 1 then right_layout:add(space_widget_one) end
        if s == 1 then right_layout:add(mylayoutbox[s]) end

        -- if s == 1 then right_layout:add(space_widget) end
        -- right_layout:add(temp_widget)

        -- Top wibox config
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_middle(middle_layout)
        layout:set_right(right_layout)

        -- Set all layouts
        mywibox[s]:set_widget(layout)
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev),

    awful.button({ }, 1, function () mymainmenu:hide() end)
))
-- }}}

globalkeys = awful.util.table.join(
    -- awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    -- awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    -- awful.key({ modkey,           }, "w", function () mymainmenu:show() end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey,           }, ".", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey,           }, ",", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey, "Shift"   }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    -- awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey, "Control" }, "space", function () awful.layout.inc(layouts,  1) end),
    -- awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    -- awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt
    -- awful.key({ modkey            }, "r",     function () mypromptbox[mouse.screen]:run() end),

    -- awful.key({ modkey }, "x",
    --           function ()
    --               awful.prompt.run({ prompt = "Run Lua code: " },
    --               mypromptbox[mouse.screen].widget,
    --               awful.util.eval, nil,
    --               awful.util.getdir("cache") .. "/history_eval")
    --           end),

    -- My Keys
    awful.key({ modkey },            "p",     function ()
    awful.util.spawn("dmenu_run -i -p 'Run command:' -nb '" .. beautiful.bg_normal .. "' -nf '" .. beautiful.fg_normal ..
        "' -sb '" .. beautiful.bg_focus ..
        "' -fn '" .. "-*-arial-*-r-*-*-16-*-*-*-*-*-*-*"  ..
        "' -sf '" .. beautiful.fg_focus .. "'")
    end),

    awful.key({ modkey            }, "g",       function () awful.util.spawn("google-chrome --disk-cache-dir=/tmp") end),
    awful.key({ modkey            }, "d",       function () awful.util.spawn("subl") end),
    awful.key({ modkey            }, "w",       function () awful.util.spawn("libreoffice") end),
    awful.key({ modkey            }, "e",       function () awful.util.spawn("thunar") end),
    awful.key({ modkey            }, "v",       function () awful.util.spawn("virtualbox") end),
    awful.key({ modkey            }, "s",       function () awful.util.spawn("urxvtc -name scratchpad") end),

    awful.key({ modkey            }, "b",       function () mywibox[mouse.screen].visible = not mywibox[mouse.screen].visible end),

    -- Laptop Keys
    awful.key({}, "XF86ScreenSaver",            function () awful.util.spawn("slock") end),
    awful.key({}, "XF86Display",                function () awful.util.spawn("mymonitor") end),
    awful.key({}, "XF86MonBrightnessDown",      function () awful.util.spawn("backlight") end),
    awful.key({}, "XF86MonBrightnessUp",        function () awful.util.spawn("backlight") end),
    awful.key({}, "XF86AudioLowerVolume",       function () awful.util.spawn("vol") end),
    awful.key({}, "XF86AudioRaiseVolume",       function () awful.util.spawn("vol") end),
    awful.key({}, "XF86AudioMute",              function () awful.util.spawn("volnoti-show -m") end),

    -- Mpd keys
    awful.key({ modkey, "Control" }, ".",       function () awful.util.spawn("mpc next") end),
    awful.key({ modkey, "Control" }, ",",       function () awful.util.spawn("mpc prev") end),
    awful.key({ modkey, "Control" }, "s",       function () awful.util.spawn("mpc stop") end),
    awful.key({ modkey, "Control" }, "p",       function () awful.util.spawn("mpc toggle") end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey,           }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey,           }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            if not c.isvisible then
                -- awful.client.restore
                -- c.minimized = false
            else
                -- The client currently has the input focus, so it cannot be
                -- minimized, since minimized clients can't have the focus.
                c.minimized = true
            end
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- if c.floating.get() then
    -- awful.placement.centered(c, c.transient_for)
-- end

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({        }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)

-- {{{ Rules
awful.rules.rules = {
 -- WM_CLASS(STRING) = "smplayer", "Smplayer"
 --                     |           |
 --                     |           |--- class
 --                     |
 --                     |--- instance

 -- WM_NAME(STRING) = "SMPlayer"
 --                    |
 --                    |--- name

    -- All clients will match this rule.
    { rule = { },
      properties = { size_hints_honor = false,
                     border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "Vlc" },
      properties = { floating = true } },
    { rule = { class = "Thunar" },
      properties = { floating = true } },
    { rule = { instance = "gimp" },
      properties = { tag = tags[1][5], floating = true } },
    { rule = { class = "Exe" },
      properties = { floating = true, } },
    { rule = { instance = "plugin-container" },
      properties = { floating = true, } },
    { rule = { instance = "vlc" },
      properties = { floating = true, } },
    { rule = { class = "Google-chrome" },
      properties = { tag = tags[1][2] } },
    { rule = { class = "sublime_text" },
      properties = { tag = tags[1][3] } },
    { rule = { class = "libreoffice" },
      properties = { tag = tags[1][4] } },
    { rule = { class = "VirtualBox" },
      properties = { tag = tags[1][6], floating = true } },
    { rule = { instance = "Steam.exe" },
      properties = { tag = tags[1][5], floating = true } },
    { rule = { instance = "scratchpad" },
      properties = { floating = true } },
    { rule = { instance = "wine" },
      properties = { floating = true } },
    { rule = { instance = "pavucontrol" },
      properties = { floating = true } },
    { rule = { instance = "sonata" },
      properties = { floating = true } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    -- if c.floating.get then
    --     awful.placement.center_horizontal(c)
    --     awful.placement.center_vertical(c)
    -- end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- disable startup-notification globally
local oldspawn = awful.util.spawn
awful.util.spawn = function (s)
    oldspawn(s, false)
end
