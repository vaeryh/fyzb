function Set_Actions()
    gP.disTimedText(Player(0), 5.00, "击杀" .. GetUnitName(GetTriggerUnit()) .. "成功！！！")

    if GetUnitTypeId(GetTriggerUnit()) == 'nwlt' then
        SyAddR = SyAddR + 0.01
        SBuer[1] = 1
        gP.disTimedText(Player(0), 5.00, (R2S(SyAddR) .. "！！！"))
        return
    end
end

gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.USE_ITEM, function()
    local trgU, trgIt = GetTriggerUnit(), GetManipulatedItem()
    if gSlk.getItemString(trgIt, "class") == "神医专属" then

        if GetTriggerUnit() == Sy_Hero then
            gP.disTimedText(gU.getOwner(trgU), 5.00,
                "恭喜神医获得专属图录-·-" .. GetItemName(trgIt) .. "！！！！")
        else
            gP.disTimedText(gU.getOwner(trgU), 5.00, "这是神医的专属图录！！！")
            gIt.create(trgIt, GetUnitX(trgU, GetUnitY(trgU)))
        end
    end
end)

-- 使用：动作
gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.USE_ITEM, function()
    local trgU, trgIt = GetTriggerUnit(), GetManipulatedItem()
    local x, y = gYh.getPolarUnit(trgU, 400.00, -gU.getFacing(trgU))

    gP.disTimedText(Player(0), 5.00, "召唤出一只邪恶的" + GetItemName(trgIt) + "！！！！")

    if (true) then
        gU.createNum(1, Player(12), 'nwlt', x, y)
        UnitAddSleep(GetLastCreatedUnit(), false)
        -- TriggerRegisterUnitEvent(gg_trg_SY_Set, GetLastCreatedUnit(), EVENT_UNIT_DEATH)
    end

end)
