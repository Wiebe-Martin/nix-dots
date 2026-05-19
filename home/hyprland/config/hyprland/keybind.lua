local mainMod = "SUPER"

local terminal = "kitty"
local fileManager = "lauch-yazi"
local browser = "qutebrowser"

local menu = os.getenv("APP_LAUNCHER")
local lock_screen = os.getenv("LOCK_SCREEN")
local power_menu = os.getenv("POWER_MENU")

-- 1. Applications
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd(terminal .. " --execute btop"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(terminal .. " --execute tmux-sessionizer"))

-- 2. Window Management
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F11", hl.dsp.window.fullscreen({ action = "toggle" }))

-- 3. Move focus
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

-- 4. Switch and move workspaces
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- 5. Move windows
hl.bind(mainMod .. " + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.window.move({ direction = "down" }))

-- 6. Resize windows
hl.bind(mainMod .. " + ALT + H", hl.dsp.window.resize({ x = -20, y = 0 }))
hl.bind(mainMod .. " + ALT + L", hl.dsp.window.resize({ x = 20, y = 0 }))
hl.bind(mainMod .. " + ALT + K", hl.dsp.window.resize({ x = 0, y = -20 }))
hl.bind(mainMod .. " + ALT + J", hl.dsp.window.resize({ x = 0, y = 20 }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- 7. Shell
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd(lock_screen))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd(power_menu))

-- 8. Media Control
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- 9. Screenshots
hl.bind("PRINT", hl.dsp.exec_cmd("grimblast copysave area"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("grimblast copysave output"))
