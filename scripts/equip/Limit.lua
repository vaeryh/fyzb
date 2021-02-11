local mt = {}

-- 判断限制的物品
mt.item = nil
-- 判断限制的单位
mt.hero = nil
-- 判断物品类别
function mt:IsItemClass(item, name)
    local class = gSlk.getItemString(item, "class")
    if name == "武器" then
        local wq = {"枪", "扇", "弓", "刀", "剑", "机关"}
        for k, v in pairs(wq) do
            if v == class then
                return true
            end
        end
    elseif name == "防具" then
        if class == "防具" then
            return true
        end
    elseif name == "鞋子" then
        if class == "鞋子" then
            return true
        end
    elseif name == "饰品" then
        if class == "手镯" or class == "项链" or class == "玉佩" then
            return true
        end
    end
    return false
end

-- 性别是否不满足
function mt:Limit_Sex(hero, item)
    if self:IsItemClass(item, "防具") then
        -- 男
        if gSlk.getItemInt(item, "oldLevel") == 1 and gU.isTypeId(hero, 'Fw00') then -- 男
            local text = "虽然" .. GetUnitName(hero) .. "你是美女，也不可以穿男装哦~~~~"
            gP.disTimedText(gU.getOwner(hero), 5.00, text)
            return true
        end
        -- 女
        if gSlk.getItemInt(item, "oldLevel") == 0 and not gU.isTypeId(hero, 'Fw00') then
            gP.disTimedText(gU.getOwner(hero), 5.00, "莫非你是女装大佬？？？~~~~")
            return true
        end
    end
end
-- 数量是否超限
function mt:Limit_PickNum(hero, item)
    local class = gSlk.getItemString(item, "class")
    local classnum = gIt.getSameClassNum(hero, class)

    if classnum > 1 then
        if self:IsItemClass(item, "武器") then
            gP.disTimedText(gU.getOwner(hero), 15, class .. "只能携带一件")
            return true -- 丢弃物品
        end

        if class == "防具" then
            gP.disTimedText(gU.getOwner(hero), 15, "防具只能穿戴一件")
            return true -- 丢弃物品
        end

        if class == "鞋子" then
            gP.disTimedText(gU.getOwner(hero), 15, "鞋子不可以穿两双哦")
            return true -- 丢弃物品
        end

        if self:IsItemClass(item, "饰品") then
            gP.disTimedText(gU.getOwner(hero), 15, class .. "佩戴不能超过一件")
            return true -- 丢弃物品
        end
    end
end
-- 等级限制
function mt:Limit_HeroLevel(hero, item)
    local ItemLevel = gSlk.getItemInt(item, "Level")
    print(ItemLevel)
    if ItemLevel ~= 1 then
        if gH.getLevel(hero) >= (ItemLevel - 1) * 10 then
            return true
        else
            gP.disTimedText(gU.getOwner(hero), 5.00, "您的英雄等级还不足以穿戴" .. GetItemName(item))
            return false
        end
    end
end

-- 是否不满足等级
function mt:Limit_HeroGood(hero, item)
    local class = gSlk.getItemString(item, "class")
    local wq = {{'刀', 'Nf00'}, {'枪', 'asdf'}, {'扇', 'Qs00'}, {'弓', 'Fw00'}, {'剑', 'Bjy0', 'Dl00'}}

    for i, good in ipairs(wq) do
        for j = 2, #good do
            if class == good[1] then
                if gU.isTypeId(hero, good[j]) then
                    return false
                else
                    gP.disTimedText(gU.getOwner(hero), 15, "你不擅长" .. class .. "类武器，不能穿戴！")
                    return true
                end
            end
        end
    end
end
-- 接口:物品是否可以被单位携带
function mt:Interface(hero, item)
    -- 是否不擅长武器
    local bola = self:Limit_HeroGood(hero, item)
    -- 是否不满足等级
    local bolb = self:Limit_HeroLevel(hero, item)
    -- 是否数量超限
    local bolc = self:Limit_PickNum(hero, item)
    -- 是否性别不满足
    local bold = self:Limit_Sex(hero, item)
    printF(bola, bolb, bolc, bold)
    if bola or bolb or bolc or bold then
        gIt.drop(hero, item)
    end
end
-- 注册拾取触发
function mt:Limit_Trg()
    gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.PICKUP_ITEM, function()
        if gU.isType(GetTriggerUnit(), UNIT_TYPE.HERO) then
            self:Interface(GetTriggerUnit(), GetManipulatedItem())
        end
    end)
end

-- 触发+条件
function mt:init()
    --
    self:Limit_Trg()

end

mt:init()

return mt
