hl.workspace_rule({ workspace = "1", monitor = "DP-1", default = true })
for i = 1, 5 do
    hl.workspace_rule({ workspace = tostring(i), monitor = "DP-1" })
end

for i = 6, 9 do
    hl.workspace_rule({ workspace = tostring(i), monitor = "HDMI-A-1" })
end
hl.workspace_rule({ workspace = tostring(0), monitor = "HDMI-A-1" })
