hl.monitor({ output = "desc:GIGA-BYTE TECHNOLOGY CO. LTD. M28U 23120B006140", mode = "1920x1080@119.88", position = "0x0",    scale = 1 })
hl.monitor({ output = "desc:Sharp Corporation 0x14AD",                        mode = "3840x2160@60.00",  position = "1920x0", scale = 2 })

hl.monitor({ output = "", mode = "1920x1080", position = "auto", scale = 1 })
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

-- is this killing hyprlock?
-- # trigger when the switch is turning off
-- hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd('hyprctl keyword monitor "desc:Sharp Corporation 0x14AD, 3840x2160@60.00, 1920x0, 2"'), { locked = true })
-- # trigger when the switch is turning on
-- hl.bind("switch:on:Lid Switch",  hl.dsp.exec_cmd('hyprctl keyword monitor "desc:Sharp Corporation 0x14AD, disable"'), { locked = true })

hl.device({ name = "dell08af:00-06cb:76af-touchpad", sensitivity = -0.1 })
hl.device({ name = "keyd-virtual-pointer",           sensitivity = -0.8 })

return {
    main_monitor = "desc:GIGA-BYTE TECHNOLOGY CO. LTD. M28U 23120B006140",
}