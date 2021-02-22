local mt = {}

gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.SELECTED, function()
    local unit = GetTriggerUnit()

end)

-- local frame = gDz.CreateFrameByTagName("BUTTON", nil, nil, "BagButton")
-- gDz.FrameSetAbsolutePoint(frame, 0, 0.2, 0.4)
-- -- local back = gDz.CreateFrameByTagName("BACKDROP")
-- -- gDz.FrameSetAllPoints(back, frame)
-- gDz.TriggerRegisterUIEvent(frame, 2, mt.act())

-- function mt.act()
--     printF("进入", gDz.GetTriggerUIEventFrame())
-- end
