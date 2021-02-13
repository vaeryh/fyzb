local mt = {}
setmetatable(mt, oIt)
mt.__index = mt

-- 等级
mt.level = 0

-- 类别
mt.class = "装备"

-- 获取属性颜色
mt.color = {'|cFFFFFFFF', '|cFFFFFF00', '|cFFF1A4E0', '|cFFFF0000'}

-- 黄属性
mt.yellowPro = {{'招式', 100, 300}, {'身法', 100, 300}, {'心法', 100, 300}}

-- 红属性
mt.redPro = {{'风相性', 1, 9}, {'云相性', 1, 9}, {'火相性', 1, 9}, {'地相性', 1, 9}, {'雷相性', 1, 9},
             {'全属性', 1, 9}}

-- 持有者(英雄)
mt.holder = 0

-- 所属玩家
mt.owner = Player(15)

-- 数量是否超限
function mt.holdlimit_PickNum()
    gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.PICKUP_ITEM, function()
        local hero, item = GetTriggerUnit(), GetManipulatedItem()
        local class = gSlk.getItemString(item, "class")
        local classnum = gIt.getSameClassNum(hero, class)

        if mt:isItemClass(item, mt.class) and classnum > 1 then
            --print('数量', classnum, mt.class, mt:inherit(item).class)
            local text = class .. "只能携带一件"
            gP.disTimedText(gU.getOwner(hero), 15.00, text)
            gIt.drop(hero, item)
        end
    end)
end

-- 持有等级限制 英雄等级>=物品等级
function mt.holdlimit_HeroLevel()
    gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.PICKUP_ITEM, function()
        local hero, item = GetTriggerUnit(), GetManipulatedItem()
        if mt:isItemClass(item, mt.class) then
            local ItemLevel = gSlk.getItemInt(item, "Level")

            if gH.getLevel(hero) < (ItemLevel - 1) * 10 then
                --print('持有等级限制', (ItemLevel - 1) * 10, gH.getLevel(hero))
                local text = "您的英雄等级还不足以穿戴" .. GetItemName(item)
                gP.disTimedText(gU.getOwner(hero), 15.00, text)
                gIt.drop(hero, item)
            end
        end
    end)
end

-- 判断物品类别
function mt:isItemClass(item, name)
    local class = gSlk.getItemString(item, "class")
    if name == "武器" then
        local wq = {"枪", "扇", "弓", "刀", "剑", "机关"}
        for k, v in ipairs(wq) do
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
    elseif name == "装备" then
        local equip = {"枪", "扇", "弓", "刀", "剑", "机关", "防具", "鞋子", "手镯", "项链", "玉佩"}
        for k, v in pairs(equip) do
            if v == class then
                return true
            end
        end
    end
    return false
end
-- -- 来源:商店
-- function mt:source_shop()
--     gTrg.RegPlayerUnitEvent(Player(15), EVENT_PLAYER_UNIT.SELL_ITEM, function()
--         local class = gSlk.getItemString(GetSoldItem(), "class")
--         if class == self.class then
--             self:inherit(GetSoldItem())
--             print('来源：商店', self.class, self:inherit(GetSoldItem()), mt:inherit(GetSoldItem()))
--         end
--     end)
-- end

-- -- 继承：哪里用就继承谁
-- function mt:inherit(item)
--     if not mt[item] then
--         mt[item] = {}
--         setmetatable(mt[item], self)
--     end
--     return mt[item]
-- end

-- -- 搜索父类是否存在
-- function mt:isHaveFather(class)
--     local father = getmetatable(self)
--     while father do
--         if father.class == class then
--             return true
--         end
--         father = getmetatable(father)
--     end
--     return false
-- end

-- -- 打印类别和父类
-- function mt:printParentClass()
--     local text = {}
--     text[1] = self.class
--     local father = getmetatable(self)
--     while father do
--         table.insert(text, father.class)
--         father = getmetatable(father)
--     end
--     local str = ""
--     for i = #text, 1, -1 do
--         str = str .. string.format("%s ", text[i])
--     end
--     print(str)
-- end

-- 自身初始化
function mt.selfInit()
    -- 打印
    mt:printParentClass()
    --
    mt.holdlimit_HeroLevel()
    mt.holdlimit_PickNum()
end

return mt
