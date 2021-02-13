local zb = require 'equip.common.zb'

local mt = {}
setmetatable(mt, zb)
mt.__index = mt

-- 类别
mt.class = "武器"

--
mt.white = {{'外功', 1, 100}, {'内功', 1, 100}, {'出招速度', 1, 100}, {'会心加成', 1, 100},
            {'招式', 1, 100}, {'身法', 1, 100}, {'心法', 1, 100}}
--
mt.yellow = {'外功', '内功', '出招速度', '会心加成', '招式', '身法', '心法'}
--
mt.pink = {'会心率', '吸血率', '眩晕率', '减速率', '沉默率'}
--
mt.red = {'风相性', '云相性', '火相性', '地相性', '雷相性', '全属性', '多重数', '固定破甲',
          '增伤率', '分裂比例'}

-- 存属性
function mt:setProValue(it, index, name, min, max)

    if it[index] == true then

        local numR = GetRandomReal(min, max)
        -- 存储数值
        it.value = numR
        -- 存储最大值
        it.max = max
        -- 存储描述
        it.tip = self:GetColor(index) + self:GetName(name, numR)
        -- 存储属性名
        it.name = name
    end
end
-- 设置武器属性值
function mt:Wq_SetWhiteValue(it)
    local lev = GetItemLevel(it)
    local white = {}
    white[1] = {'外功', lev * 100, lev * 300}
    white[2] = {'内功', lev * 100, lev * 300}
    white[3] = {'出招速度', 10, lev * 10}
    white[4] = {'会心加成', 10, lev * 10}
    white[5] = {'招式', lev * 25, lev * 100}
    white[6] = {'身法', lev * 25, lev * 100}
    white[7] = {'心法', lev * 25, lev * 100}
    --
    local tab = self:inherit(it)

    local v = white[GetRandomInt(1, 2)]
    tab[v[1]] = GetRandomInt(v[2], v[3])

    local v = white[GetRandomInt(3, 7)]
    tab[v[1]] = GetRandomInt(v[2], v[3])

    for k, v in pairs(tab) do
        print(k, v)
    end
end

-- 商店购买，有白属性
function mt:Shop()
    gTrg.RegPlayerUnitEvent(Player(15), EVENT_PLAYER_UNIT.SELL_ITEM, function()
        local hero, item = GetBuyingUnit(), GetSoldItem()
        local class = gSlk.getItemString(item, "class")
        if mt:isItemClass(item, mt.class) then
            gP.disTimedText(gU.getOwner(hero), 10.00, GetUnitName(hero) .. "购买了" .. GetItemName(item))
            self:Wq_SetWhiteValue(item)
        end
    end)
end

-- 持有限制 英雄是否擅长
function mt:holdlimit_HeroGood()
    gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.PICKUP_ITEM, function()
        local hero, item = GetTriggerUnit(), GetManipulatedItem()
        local class = gSlk.getItemString(item, "class")
        if class == self.class then
            local good
            for i, v in ipairs(self.goodHero) do -- 步惊云，断浪
                print("good", i, v, gU.isTypeId(hero, v))
                if gU.isTypeId(hero, v) then
                    good = true
                    break
                end
            end
            -- 如果不为空，说明此人不擅长
            if not good then
                gP.disTimedText(gU.getOwner(hero), 15.00, "你不擅长" .. GetItemName(item) .. "，不能穿戴！")
                gIt.drop(hero, item)
            end
        end
    end)
end

-- 类初始化
function mt:classInit()
    -- 打印
    self:printParentClass()
    --
    self:holdlimit_HeroGood()
    --
    self:Shop()
end

-- 自身初始化
function mt.selfInit()
    mt:printParentClass()
end

return mt
