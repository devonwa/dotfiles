hl.monitor({ output = "DP-2",    mode = "3840x2160@144.00", position = "0x0",     scale = 2 })
hl.monitor({ output = "HDMI-A-2", mode = "1920x1080@60.00", position = "0x0",     scale = 1, mirror = "DP-2" })
hl.monitor({ output = "DP-3",    mode = "1920x1080@144.00", position = "1920x0",  scale = 1 })
hl.monitor({ output = "",        mode = "preferred",        position = "auto",    scale = 1 })

return {
    main_monitor = "DP-2",
    side_monitor = "DP-3",
}