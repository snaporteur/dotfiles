-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

local programs = require("programs")

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function ()
  hl.exec_cmd(programs.terminal)
  hl.exec_cmd("waybar")
  hl.exec_cmd("systemctl --user start xdg-desktop-portal-hyprland.service")
end)
