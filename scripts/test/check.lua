local mapg = require 'map.global'
local mt = {}

-- local frame = gDz.CreateFrameByTagName("BACKDROP", nil, nil)
-- gDz.FrameSetSize(frame, 0.03, 0.04)
-- gDz.FrameSetAbsolutePoint(frame, 0, 0.516, 0.111)
-- gDz.FrameSetTexture(frame,'ReplaceableTextures\\CommandButtons\\BTNRingGreen.blp',0)

gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.SELECTED, function()
    local unit = GetTriggerUnit()
    print()
    -- local frame = oUI:createByTag("GLUETEXTBUTTON", nil, "ProButton_Add")
    -- local frame = oUI:createByTag("TEXT", nil, nil)
    -- oUI:setAbsolute(4, 0.1, 0.5):setText("nihaoha")
    -- oUI:setSize(0.05, 0.01)
    -- gDz.TriggerRegisterUIEvent(frame, 1, function()
    --     printF("鼠标点击", gDz.GetTriggerUIEventFrame(), gDz.GetTriggerUIEventPlayer())
    -- end)
    -- gDz.TriggerRegisterUIEvent(frame, 2, function()
    --     printF("鼠标进入", gDz.GetTriggerUIEventFrame(), gDz.GetTriggerUIEventPlayer())
    -- end)
    -- gDz.TriggerRegisterUIEvent(frame, 3, function()
    --     printF("鼠标离开", gDz.GetTriggerUIEventFrame(), gDz.GetTriggerUIEventPlayer())
    -- end)
    -- gDz.TriggerRegisterUIEvent(frame, 4, function()
    --     printF("鼠标释放", gDz.GetTriggerUIEventFrame(), gDz.GetTriggerUIEventPlayer())
    -- end)
    -- gDz.TriggerRegisterUIEvent(frame, 5, function()
    --     printF("鼠标按下", gDz.GetTriggerUIEventFrame(), gDz.GetTriggerUIEventPlayer())
    -- end)
    -- gDz.TriggerRegisterUIEvent(frame, 6, function()

    --     printF("鼠标滑轮", gDz.GetWheelDelta())
    -- end)
end)


-- oUI:createByTag("GLUETEXTBUTTON", nil, "ProButton_Sub")
-- oUI:setAbsolute(4, 0.1, 0.45)

-- oUI:createByTag("GLUETEXTBUTTON", nil, "ProButton_proText")
-- oUI:setAbsolute(4, 0.1, 0.40)
-- local frame = gDz.CreateFrameByTagName("BUTTON", nil, nil, "BagButton")
-- gDz.FrameSetAbsolutePoint(frame, 0, 0.2, 0.4)
-- -- local back = gDz.CreateFrameByTagName("BACKDROP")
-- -- gDz.FrameSetAllPoints(back, frame)
-- gDz.TriggerRegisterUIEvent(frame, 2, mt.act())

-- function mt.act()
--     printF("进入", gDz.GetTriggerUIEventFrame())
-- end
