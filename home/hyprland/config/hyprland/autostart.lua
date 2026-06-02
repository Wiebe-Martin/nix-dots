-- Auto start

local shell = os.getenv("DESKTOP_SHELL_COMMAND")

hl.on("hyprland.start", function()
    if shell ~= nil then
        hl.exec_cmd(shell)
    end
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)
