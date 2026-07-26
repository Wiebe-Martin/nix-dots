foreground = "#ddc7a1"
background = "#1d2021"

color0 = "#141617"
color1 = "#d16e5e"
color2 = "#64b65b"
color3 = "#e3d166"
color4 = "#9cac50"
color5 = "#48540f"
color6 = "#a8b665"
color7 = "#bdbfb3"
color8 = "#7a7c73"
color9 = "#f5a699"
color10 = "#95da8d"
color11 = "#fff1a5"
color12 = "#bbc87c"
color13 = "#dfeca2"
color14 = "#f5fecb"
color15 = "#fdfff8"


def setup(c):
    c.colors.statusbar.normal.bg = "#00000000"
    c.colors.statusbar.command.bg = "#00000000"
    c.colors.statusbar.insert.bg = color4
    # c.colors.statusbar.normal.bg = background
    # c.colors.statusbar.command.bg = background
    c.colors.statusbar.command.fg = foreground
    c.colors.statusbar.normal.fg = color14
    c.colors.statusbar.passthrough.fg = color14
    c.colors.statusbar.url.fg = color13
    c.colors.statusbar.url.success.https.fg = color13
    c.colors.statusbar.url.hover.fg = color12
    # c.statusbar.show = "always"
    c.colors.tabs.even.bg = "#00000000"  # transparent tabs!!
    c.colors.tabs.odd.bg = "#00000000"
    c.colors.tabs.bar.bg = "#00000000"
    # c.colors.tabs.even.bg = background
    # c.colors.tabs.odd.bg = background
    c.colors.tabs.even.fg = foreground
    c.colors.tabs.odd.fg = foreground
    c.colors.tabs.selected.even.bg = foreground
    c.colors.tabs.selected.odd.bg = foreground
    c.colors.tabs.selected.even.fg = background
    c.colors.tabs.selected.odd.fg = background
    c.colors.hints.bg = background
    c.colors.hints.fg = foreground
    # c.tabs.show = "multiple"

    c.colors.completion.item.selected.match.fg = color6
    c.colors.completion.match.fg = color6

    c.colors.tabs.indicator.start = color10
    c.colors.tabs.indicator.stop = color8
    c.colors.completion.odd.bg = background
    c.colors.completion.even.bg = background
    c.colors.completion.fg = foreground
    c.colors.completion.category.bg = background
    c.colors.completion.category.fg = foreground
    c.colors.completion.item.selected.bg = background
    c.colors.completion.item.selected.fg = foreground

    c.colors.messages.info.bg = background
    c.colors.messages.info.fg = foreground
    c.colors.messages.error.bg = background
    c.colors.messages.error.fg = foreground
    c.colors.downloads.error.bg = background
    c.colors.downloads.error.fg = foreground

    c.colors.downloads.bar.bg = background
    c.colors.downloads.start.bg = color10
    c.colors.downloads.start.fg = foreground
    c.colors.downloads.stop.bg = color8
    c.colors.downloads.stop.fg = foreground

    c.colors.tooltip.bg = background
    c.colors.webpage.bg = background
    c.hints.border = foreground
