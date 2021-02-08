local mt = {}
gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.SELECTED, function()
    local trgU = GetTriggerUnit()
    -- local mj = gU.create(Player(0), 'yhmj', gU.getXY(trgU))
    -- local abiId = 'AUfa'
    -- gAbi.add(mj, abiId)
    -- gAbi.setDataReal(mj, abiId, 1, ABILITY_DATA.DATA_B, 10.00)
    -- gAbi.setDataReal(mj, abiId, 1, ABILITY_DATA.DATA_A, 5.00)
    -- gU.issueOrderTar(mj, 'frostarmor', trgU)
    -- printF(gU.getMoveSpeed(trgU),gU.getDefaultMoveSpeed(trgU))
end)

-- gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.ISSUED_TARGET_ORDER, function()
--     local trgu, tarit = GetTriggerUnit(), GetOrderTargetItem()
--     -- 物品不为 状态-捡取时自动使用powerup
--     local pow = gSlk.getItemString(tarit, "class")
--     printF(pow, GetUnitName(trgu), GetItemName(tarit))
--     printF(tarit, GetItemTypeId(tarit))

-- end)
-- function mt.a()
--     printF(1)
-- end

-- local but = gDz.CreateFrameByTagName("BUTTON")
-- -- gDz.CreateFrameByTagName("BUTTON", nil, mt.back_main, "BagButtonTemplate")
-- gDz.FrameSetAbsolutePoint(but, 0, 0.3, 0.4)
-- gDz.FrameSetSize(but, 0.03, 0.04)
-- local back = gDz.CreateFrameByTagName("BACKDROP")
-- gDz.FrameSetAllPoints(back, but)
-- gDz.FrameSetTexture(back, 'ReplaceableTextures\\CommandButtons\\BTNHelmOfValor.blp')

-- local back = gDz.CreateFrameByTagName("BACKDROP")
-- gDz.FrameSetAbsolutePoint(back, 0, 0.35, 0.4)
-- gDz.FrameSetSize(back, 0.03, 0.04)
-- gDz.FrameShow(back, true)
-- gDz.FrameSetTexture(back, 'ReplaceableTextures\\CommandButtons\\BTNClawsOfAttack.blp')

-- local text = gDz.CreateFrameByTagName("TEXT")
-- gDz.FrameSetAbsolutePoint(text, 0, 0.35, 0.3)
-- gDz.FrameSetSize(text, 0.09, 0.05)
-- gDz.FrameSetText(text, "123dsasadsadsadsadsadsadasdas")
-- gDz.FrameShow(text, true)

-- gDz.FrameSetTooltip(but, text)


-- local but = gDz.FrameGetItemBarButton(0)
-- gDz.FrameSetTooltip(but, text)

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
