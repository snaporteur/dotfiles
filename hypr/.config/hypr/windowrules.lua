local programs = require("programs")

-- Ignore maximize requests from all apps.
-- Without this, apps (e.g. kitty) open maximized and cover the whole
-- workspace instead of tiling next to the existing window.
hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "browser-pip",
    match = { title = "(?i)picture[- ]?in[- ]?picture" },
    float = true,
    pin   = true,
    size  = "560 315",
    move  = {1354, 48},
})

hl.window_rule({
    name = "browser-workspace",
    match = { class = programs.browser_class },
    workspace="2 silent"
})

if programs.discord_installed then
    hl.window_rule({
        name = "discord-workspace",
        match = { class = "discord"},
        workspace="4 silent"
    })
end
