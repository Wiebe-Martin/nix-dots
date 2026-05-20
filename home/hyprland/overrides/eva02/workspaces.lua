hl.workspace_rule({ workspace = "1", monitor = "DP-1", default = true })
for i = 2, 5 do
    hl.workspace_rule({ workspace = tostring(i), monitor = "DP-1" })
end

for i = 6, 10 do
    local key = i % 10
    hl.workspace_rule({ workspace = tostring(key), monitor = "HDMI-A-1" })
end
