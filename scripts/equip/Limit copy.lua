local mt = {}

--判断限制的物品
mt.item = nil
-- 判断限制的单位
mt.hero = nil
-- 判断物品类别
function mt:IsItemClass(name)
    local class = class
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

-- 性别限制
function mt:Limit_Sex()
    -- 男
    if gSlk.getItemInt(self.item, "oldLevel") == 1 and gU.isTypeId(self.hero, 'Fw00') then -- 男
        local text = "虽然" .. GetUnitName(self.hero) .. "你是美女，也不可以穿男装哦~~~~"
        gP.disTimedText(gU.getOwner(self.hero), 5.00, text)
        return false
    end
    -- 女
    if gSlk.getItemInt(self.item, "oldLevel") == 0 and not gU.isTypeId(self.hero, 'Fw00') then
        gP.disTimedText(gU.getOwner(self.hero), 5.00, "莫非你是女装大佬？？？~~~~")
        return false
    end
    return true
end
-- 数量限制
function mt:Limit_PickNum()
    local class = gSlk.getItemString(self.item, "class")
    local classnum = gIt.getSameClassNum(self.hero, class)

    if classnum > 1 then
        if self:IsItemClass("武器") then
            gP.disTimedText(gU.getOwner(self.hero), 15, class .. "只能携带一件")
            return false -- 丢弃物品
        end

        if class == "鞋子" then
            gP.disTimedText(gU.getOwner(self.hero), 15, "鞋子不可以穿两双哦")
            return false -- 丢弃物品
        end

        if self:IsItemClass("饰品") then
            gP.disTimedText(gU.getOwner(self.hero), 15, class .. "佩戴不能超过一件")
            return false -- 丢弃物品
        end
    end

    if class == "防具" then
        if classnum > 1 then
            gP.disTimedText(gU.getOwner(self.hero), 15, "防具只能穿戴一件")
            return false -- 丢弃物品
        else
            return mt:Limit_Sex()
        end
    end
    return true
end
-- 等级限制
function mt:Limit_HeroLevel()
    local ItemLevel = gSlk.getItemInt(self.item, "Level")
    if ItemLevel ~= 1 then
        if gH.getLevel(self.hero) >= (ItemLevel - 1) * 10 then
            return self:Limit_PickNum()
        else
            gP.disTimedText(gU.getOwner(self.hero), 5, "您的英雄等级还不足以穿戴" .. GetItemName(self.item))
            return false
        end
    else
        return mt:Limit_PickNum()
    end
    return true
end
-- 擅长
function mt:isGood(wqtype, heroid)
    if class == wqtype then
        printF(gU.isTypeId(self.hero, heroid))
        if gU.isTypeId(self.hero, heroid) then
            return self:Limit_HeroLevel()
        else
            gP.disTimedText(gU.getOwner(self.hero), 15, "你不擅长" .. class .. "类武器，不能携带！")
            return false
        end
    end
end
-- 判断英雄是否擅长
function mt:Limit_HeroGood()
    local class = gSlk.getItemString(self.item, "class")
    self:isGood(self.hero, self.item, class, "刀", "Nf00")
    self:isGood(self.hero, self.item, class, "枪", "Nf00")
    self:isGood(self.hero, self.item, class, "扇", "Qs00")
    self:isGood(self.hero, self.item, class, "弓", "Fw00")
    self:isGood(self.hero, self.item, class, "机关", "Nf00")

    if class == "剑" then
        if gU.isTypeId(self.hero, 'Bjy0') or gU.isTypeId(self.hero, 'Dl00') then
            return self:Limit_HeroLevel()
        else
            gP.disTimedText(gU.getOwner(self.hero), 15, "你不擅长剑类武器，不能穿戴！")
            return false
        end
    end

    if class == "防具" or class == "鞋子" then
        return self:Limit_HeroLevel()
    end

    if self:IsItemClass("饰品") then
        return self:Limit_HeroLevel()
    end
    return true
end
-- 接口:物品是否可以被单位携带
function mt:Interface(hero, item)
    self.hero = hero
    self.item = item
    --
    local bola = self:Limit_HeroGood()
    local bolb = self:Limit_HeroLevel()
    local bolc = self:Limit_PickNum()
    local bold = self:Limit_Sex()
end
-- 注册拾取触发
function mt:Limit_Trg()
    gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.PICKUP_ITEM, function()
        if gU.isType(GetTriggerUnit(), UNIT_TYPE.HERO) then
            if not self:Interface(GetTriggerUnit(), GetManipulatedItem()) then
                gIt.drop(GetTriggerUnit(), GetManipulatedItem())
            end
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
