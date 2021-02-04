-- 性别限制
function Sex_Limit_Actions(whichHero, whichItem)
    if GetObjItemInt(whichItem, "oldLevel") == 1 and GetUnitTypeId(whichHero) == 'Fw00' then -- 男
        DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 5,
            "虽然" + GetUnitName(whichHero) + "你是美女，也不可以穿男装哦~~~~")
        return false
    end
    -- 女
    if GetObjItemInt(whichItem, "oldLevel") == 0 and GetUnitTypeId(whichHero) ~= 'Fw00' then
        DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 5, "莫非你是女装大佬？？？~~~~")
        return false
    end
    return true
end
-- 数量限制
function Num_Limit_Actions(whichHero, whichItem, class)
    local classnum = GetItemBarSameClassNum(whichHero, class)

    if classnum > 1 then
        if DP_IsItemClass(whichItem, "武器") then
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 15, class + "只能携带一件")
            return false -- 丢弃物品
        end

        if class == "鞋子" then
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 15, "鞋子不可以穿两双哦")
            return false -- 丢弃物品
        end

        if DP_IsItemClass(whichItem, "饰品") then
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 15, class + "佩戴不能超过一件")
            return false -- 丢弃物品
        end
    end

    if class == "防具" then
        if classnum > 1 then
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 15, "防具只能穿戴一件")
            return false -- 丢弃物品
        else
            return Sex_Limit_Actions(whichHero, whichItem)
        end
    end
    return true
end
-- 等级限制
function Level_Limit_Actions(whichHero, whichItem, class)
    local integer
    ItemLevel = GetObjItemInt(whichItem, "Level")
    if ItemLevel ~= 1 then
        if GetUnitLevel(whichHero) >= (ItemLevel - 1) * 10 then
            return Num_Limit_Actions(whichHero, whichItem, class)
        else
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 5,
                "您的英雄等级还不足以穿戴" + GetItemName(whichItem) + "。")
            return false
        end
    else
        return Num_Limit_Actions(whichHero, whichItem, class)
    end
    return true
end
--
function Hero_Limit_Actions(whichHero, whichItem, class)

    -- ! textmacro ItemClass takes class,heroId
    if class == "$class$" then
        if GetUnitTypeId(whichHero) == '$heroId$' then
            return Level_Limit_Actions(whichHero, whichItem, class)
        else
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 15, "你不擅长" + class + "类武器，不能携带！")
            return false
        end
    end
    -- ! endtextmacro

    -- ! runtextmacro ItemClass("刀","Nf00")
    -- ! runtextmacro ItemClass("枪","Nf00")
    -- ! runtextmacro ItemClass("扇","Qs00")
    -- ! runtextmacro ItemClass("弓","Fw00")
    -- ! runtextmacro ItemClass("机关","Nf00")

    if class == "剑" then
        if GetUnitTypeId(whichHero) == 'Bjy0' or GetUnitTypeId(whichHero) == 'Dl00' then
            return Level_Limit_Actions(whichHero, whichItem, class)
        else
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 15, "你不擅长剑类武器，不能穿戴！")
            return false
        end
    end

    if class == "防具" or class == "鞋子" then
        return Level_Limit_Actions(whichHero, whichItem, class)
    end

    if DP_IsItemClass(whichItem, "饰品") then
        return Level_Limit_Actions(whichHero, whichItem, class)
    end
    return true
end
-- 接口:物品是否可以被单位携带
function Interface(whichHero, whichItem)
    local class = gSlk.getDataItem(whichItem, "class")
    return Hero_Limit_Actions(whichHero, whichItem, class)
end
-- 触发+条件
gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.PICKUP_ITEM, function()
    if gU.isType(GetTriggerUnit(), UNIT_TYPE.HERO) then
        if Interface(GetTriggerUnit(), GetManipulatedItem()) == false then
            gIt.drop(GetTriggerUnit(), GetManipulatedItem())
        end
    end
end)
