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

-- 设置属性方法
function mt.setPro(item, proTab, color)
    local itTab = oIt:inherit(item)
    itTab[proTab[1]] = {
        color = color,
        value = GetRandomReal(proTab[2], proTab[3])
    }
end

-- 设置属性值-红
function mt:setProValue_Red(it)
    local lev = GetItemLevel(it)
    local pro = {}
    pro[1] = {'风相性', 1, lev}
    pro[2] = {'云相性', 1, lev}
    pro[3] = {'火相性', 1, lev}
    pro[4] = {'地相性', 1, lev}
    pro[5] = {'雷相性', 1, lev}
    pro[6] = {'全属性', 25 * lev, 100 * lev}
    pro[7] = {'多重数', 25 * lev, 100 * lev}
    pro[8] = {'固定破甲', 25 * lev, 100 * lev}
    pro[9] = {'增伤率', 25 * lev, 100 * lev}
    pro[10] = {'分裂比例', 25 * lev, 100 * lev}
    --
    mt.setPro(it, pro[GetRandomInt(1, 10)], "白色")
end
-- 设置属性值-紫
function mt:setProValue_Pink(it)
    local lev = GetItemLevel(it)
    local pro = {}
    pro[1] = {'会心率', 2, 2 * lev}
    pro[2] = {'吸血率', 2, 2 * lev}
    pro[3] = {'眩晕率', 2, 2 * lev}
    pro[4] = {'减速率', 2, 2 * lev}
    pro[5] = {'沉默率', 2, 2 * lev}
    --
    mt.setPro(it, pro[GetRandomInt(1, 5)], "紫色")
end
-- 设置属性值-黄
function mt:setProValue_Yellow(it)
    local lev = GetItemLevel(it)
    local pro = {}
    pro[1] = {'外功', 100 * lev, 300 * lev}
    pro[2] = {'内功', 100 * lev, 300 * lev}
    pro[3] = {'出招速度', 10, 10 * lev}
    pro[4] = {'会心加成', 10, 10 * lev}
    pro[5] = {'招式', 25 * lev, 100 * lev}
    pro[6] = {'身法', 25 * lev, 100 * lev}
    pro[7] = {'心法', 25 * lev, 100 * lev}
    --
    mt.setPro(it, pro[GetRandomInt(1, 7)], "黄色")
end
-- 设置属性值-白
function mt:setProValue_White(it)
    local lev = GetItemLevel(it)
    local pro = {}
    pro[1] = {'外功', 100 * lev, 300 * lev}
    pro[2] = {'内功', 100 * lev, 300 * lev}
    pro[3] = {'出招速度', 10, 10 * lev}
    pro[4] = {'会心加成', 10, 10 * lev}
    pro[5] = {'招式', 25 * lev, 100 * lev}
    pro[6] = {'身法', 25 * lev, 100 * lev}
    pro[7] = {'心法', 25 * lev, 100 * lev}
    --
    mt.setPro(it, pro[GetRandomInt(1, 2)], "白色")
    mt.setPro(it, pro[GetRandomInt(3, 7)], "白色")
end

-- 商店购买，有白属性
function mt:Shop()
    gTrg.RegPlayerUnitEvent(Player(15), EVENT_PLAYER_UNIT.SELL_ITEM, function()
        local hero, item = GetBuyingUnit(), GetSoldItem()
        -- local class = gSlk.getItemString(item, "class")
        if zb:isItemClass(item, mt.class) then
            gP.disTimedText(gU.getOwner(hero), 10.00, GetUnitName(hero) .. "购买了" .. GetItemName(item))
            mt:setProValue_White(item)
            mt:setProValue_Yellow(item)
            mt:setProValue_Pink(item)
            mt:setProValue_Red(item)
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
end

-- 自身初始化
function mt.selfInit()
    mt:printParentClass()
    --
    mt:Shop()
end

return mt
