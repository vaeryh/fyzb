local mapg = require 'map.global'
local mt = {}

-- local frame = gDz.CreateFrameByTagName("BACKDROP", nil, nil)
-- gDz.FrameSetSize(frame, 0.03, 0.04)
-- gDz.FrameSetAbsolutePoint(frame, 0, 0.516, 0.111)
-- gDz.FrameSetTexture(frame,'ReplaceableTextures\\CommandButtons\\BTNRingGreen.blp',0)

gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.SELECTED, function()
    local unit = GetTriggerUnit()

end)
oUI:createByTag("GLUETEXTBUTTON", nil, "ProButton_Add")
oUI:setAbsolute(4, 0.1, 0.5)

oUI:createByTag("GLUETEXTBUTTON", nil, "ProButton_Sub")
oUI:setAbsolute(4, 0.1, 0.45)

oUI:createByTag("GLUETEXTBUTTON", nil, "ProButton_proText")
oUI:setAbsolute(4, 0.1, 0.40)
-- local frame = gDz.CreateFrameByTagName("BUTTON", nil, nil, "BagButton")
-- gDz.FrameSetAbsolutePoint(frame, 0, 0.2, 0.4)
-- -- local back = gDz.CreateFrameByTagName("BACKDROP")
-- -- gDz.FrameSetAllPoints(back, frame)
-- gDz.TriggerRegisterUIEvent(frame, 2, mt.act())

-- function mt.act()
--     printF("进入", gDz.GetTriggerUIEventFrame())
-- end
