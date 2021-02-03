function Set_Actions()
    DisplayTimedTextToPlayer(Player(0), 0, 0, 5.00, "击杀" + GetUnitName(GetTriggerUnit()) + "成功！！！")

    if GetUnitTypeId(GetTriggerUnit()) == 'nwlt' then
        SyAddR = SyAddR + 0.01
        SBuer[1] = 1
        DisplayTimedTextToPlayer(Player(0), 0, 0, 5.00, (R2S(SyAddR) + "！！！"))
        return
    end
end

function Pick_Actions()
    if GetObjItemStr(GetManipulatedItem(), "class") == "神医专属" then

        if GetTriggerUnit() == Sy_Hero then
            DisplayTimedTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, 5.00,
                "恭喜神医获得专属图录-·-" + GetItemName(GetManipulatedItem()) + "！！！！")
        else
            DisplayTimedTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, 5.00,
                "这是神医的专属图录！！！")
            SetItemPosition(GetManipulatedItem(), GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
        end

    end
end

-- 使用：动作
function Use_Actions()
    local locA = GetUnitLoc(GetTriggerUnit())
    local locB = PolarProjectionBJ(locA, 400.00, GetUnitFacing(GetTriggerUnit()))

    DisplayTimedTextToPlayer(Player(0), 0, 0, 5.00,
        "召唤出一只邪恶的" + GetItemName(GetManipulatedItem()) + "！！！！")

    if (true) then
        CreateNUnitsAtLoc(1, 'nwlt', Player(12), locB, AngleBetweenPoints(locB, locA))
        UnitAddSleep(GetLastCreatedUnit(), false)
        -- TriggerRegisterUnitEvent(gg_trg_SY_Set, GetLastCreatedUnit(), EVENT_UNIT_DEATH)
    end

end
-- 使用：条件
function Use_Conditions()
    if GetTriggerUnit() == Sy_Hero then
        Use_Actions()
    end
end
-- 任意单位使用图录物品
