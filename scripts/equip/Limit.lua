local dp = require 'equip.DropPick'

local mt = {}
-- 性别限制
function mt.Sex_Actions(whichHero, whichItem)
    if gSlk.getItemInt(whichItem, "oldLevel") == 1 and GetUnitTypeId(whichHero) == 'Fw00' then -- 男
        gP.disTimedText(GetLocalPlayer(), 5,
            "虽然" .. GetUnitName(whichHero) .. "你是美女，也不可以穿男装哦~~~~")
        return false
    end
    -- 女
    if gSlk.getItemInt(whichItem, "oldLevel") == 0 and GetUnitTypeId(whichHero) ~= 'Fw00' then
        gP.disTimedText(GetLocalPlayer(), 5, "莫非你是女装大佬？？？~~~~")
        return false
    end
    return true
end
-- 数量限制
function mt.Num_Actions(whichHero, whichItem, class)
    local classnum = gIt.getSameClassNum(whichHero, class)

    if classnum > 1 then
        if dp.IsItemClass(whichItem, "武器") then
            gP.disTimedText(GetLocalPlayer(), 15, class + "只能携带一件")
            return false -- 丢弃物品
        end

        if class == "鞋子" then
            gP.disTimedText(GetLocalPlayer(), 15, "鞋子不可以穿两双哦")
            return false -- 丢弃物品
        end

        if dp.IsItemClass(whichItem, "饰品") then
            gP.disTimedText(GetLocalPlayer(), 15, class + "佩戴不能超过一件")
            return false -- 丢弃物品
        end
    end

    if class == "防具" then
        if classnum > 1 then
            gP.disTimedText(GetLocalPlayer(), 15, "防具只能穿戴一件")
            return false -- 丢弃物品
        else
            return mt.Sex_Actions(whichHero, whichItem)
        end
    end
    return true
end
-- 等级限制
function mt.Level_Actions(whichHero, whichItem, class)
    local ItemLevel = gSlk.getItemInt(whichItem, "Level")
    if ItemLevel ~= 1 then
        if gH.getLevel(whichHero) >= (ItemLevel - 1) * 10 then
            return mt.Num_Actions(whichHero, whichItem, class)
        else
            gP.disTimedText(GetLocalPlayer(), 5, "您的英雄等级还不足以穿戴" .. GetItemName(whichItem))
            return false
        end
    else
        return mt.Num_Actions(whichHero, whichItem, class)
    end
    return true
end
-- 擅长
function mt.isGood(whichHero, whichItem, class, wqtype, heroid)
    if class == wqtype then
        if gU.isTypeId(whichHero, heroid) then
            return mt.Level_Actions(whichHero, whichItem, class)
        else
            gP.disTimedText(GetLocalPlayer(), 15, "你不擅长" .. class .. "类武器，不能携带！")
            return false
        end
    end
end
--
function mt.Hero_Actions(whichHero, whichItem, class)
    mt.isGood(whichHero, whichItem, class, "刀", "Nf00")
    mt.isGood(whichHero, whichItem, class, "枪", "Nf00")
    mt.isGood(whichHero, whichItem, class, "扇", "Qs00")
    mt.isGood(whichHero, whichItem, class, "弓", "Fw00")
    mt.isGood(whichHero, whichItem, class, "机关", "Nf00")

    if class == "剑" then
        if gU.isTypeId(whichHero,'Bjy0')  or gU.isTypeId(whichHero,'Dl00') then
            return mt.Level_Actions(whichHero, whichItem, class)
        else
            gP.disTimedText(GetLocalPlayer(), 15, "你不擅长剑类武器，不能穿戴！")
            return false
        end
    end

    if class == "防具" or class == "鞋子" then
        return mt.Level_Actions(whichHero, whichItem, class)
    end

    if dp.IsItemClass(whichItem, "饰品") then
        return mt.Level_Actions(whichHero, whichItem, class)
    end
    return true
end
-- 接口:物品是否可以被单位携带
function mt.Interface(whichHero, whichItem)
    local class = gSlk.getItemString(whichItem, "class")
    return mt.Hero_Actions(whichHero, whichItem, class)
end
-- 触发+条件
gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.PICKUP_ITEM, function()
    if gU.isType(GetTriggerUnit(), UNIT_TYPE.HERO) then
        if not mt.Interface(GetTriggerUnit(), GetManipulatedItem()) then
            gIt.drop(GetTriggerUnit(), GetManipulatedItem())
        end
    end
end)

return mt
