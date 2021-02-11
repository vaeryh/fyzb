local mt = {}

gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.SELECTED, function()
    local trgU = GetTriggerUnit()
    -- printF(gTrg.getExecCount(), gTrg.getExecCount() % 2)
    -- str = UnitId2String(GetUnitTypeId(trgU))
    -- printF(str, UnitId('Fw00'),UnitId(str))
    -- UnitId2String()
end)

-- -- 创建按钮
-- frame1 = oUI:createByTag("BUTTON", nil, "BagButton")
-- oUI:setAbsolute(0,0.3,0.4):setShow(true)
-- -- 创建按钮背景
-- frame2 = oUI:createByTag("BACKDROP", frame1, "BagButtonBackdrop")
-- oUI:setRelative(4, frame1, 4, 0.0, 0.0)
-- -- -- 创建物品使用次数背景
-- frame3 = oUI:createByTag("BACKDROP", frame2, "BagChargesBackdrop")
-- oUI:setRelative(8, frame2, 8, -0.004, 0.004)
-- -- -- 创建物品使用次数文本
-- frame4 = oUI:createByTag("TEXT", frame3, "BagChargesText")
-- oUI:setRelative(4, frame3, 4, 0.0, 0.0)
-- printF(1)
-- local but = gDz.CreateFrameByTagName("BUTTON")
-- -- gDz.CreateFrameByTagName("BUTTON", nil, mt.back_main, "BagButtonTemplate")
-- gDz.FrameSetAbsolutePoint(but, 0, 0.3, 0.4)
-- gDz.FrameSetSize(but, 0.03, 0.04)
-- local back = gDz.CreateFrameByTagName("BACKDROP")
-- gDz.FrameSetTexture(back, 'ReplaceableTextures\\CommandButtons\\BTNHelmOfValor.blp')
-- gDz.FrameSetAllPoints(back, but)

-- -- gDz.FrameSetAbsolutePoint(back, 0, 0.35, 0.4)
-- -- gDz.FrameSetSize(back, 0.03, 0.04)
-- -- gDz.FrameShow(back, true)
-- -- gDz.FrameSetTexture(back, 'ReplaceableTextures\\CommandButtons\\BTNClawsOfAttack.blp')

-- local text = gDz.CreateFrameByTagName("TEXT")
-- gDz.FrameSetAbsolutePoint(text, 0, 0.35, 0.3)
-- gDz.FrameSetSize(text, 0.09, 0.05)
-- gDz.FrameSetText(text, "123dsasadsadsadsadsadsadasdas")
-- gDz.FrameShow(text, true)

-- gDz.FrameSetTooltip(but, text)

-- local back = gDz.FrameFindByName("BackdropTemplate")
-- local back = gDz.CreateFrameByTagName("BACKDROP", nil, nil, "BagChargesBackdrop")
-- gDz.FrameSetAbsolutePoint(back, 0, 0.35, 0.4)
-- local back = gDz.CreateFrameByTagName("BUTTON", nil, nil, "BagButton")
-- gDz.FrameSetAbsolutePoint(back, 0, 0.35, 0.35)
-- local back = gDz.CreateFrameByTagName("TEXT", nil, nil, "BagChargesText")
-- gDz.FrameSetText(back, "123dsasadsadsadsadsadsadasdas")
-- gDz.FrameSetAbsolutePoint(back, 0, 0.35, 0.30)
-- gDz.FrameSetSize(back, 0.03, 0.04)
-- gDz.FrameShow(back, true)
-- gDz.FrameSetTexture(back, 'ReplaceableTextures\\CommandButtons\\BTNClawsOfAttack.blp')

-- local trg1 = gTrg.create(function()
--     printF(1,gDz.GetMouseFocus(), gDz.GetTriggerKeyPlayer())
-- end)
-- local trg2 = gTrg.create(function()
--     printF(2,gDz.GetMouseFocus(), gDz.GetTriggerKeyPlayer())
-- end)
-- gDz.TriggerRegisterMouseEvent(trg1, 2, 0, true, nil)
-- gDz.TriggerRegisterMouseEvent(trg2, 2, 0, true, nil)

-- gDz.TriggerRegisterMouseEventByCode(trg, 1, 1, true, nil)
-- gDz.TriggerRegisterMouseEventByCode(trg, 1, 2, true, nil)
