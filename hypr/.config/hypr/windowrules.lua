local programs = require("programs")

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
