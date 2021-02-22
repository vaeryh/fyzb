local zb = require 'map.equip.common.zb'

local mt = {}
setmetatable(mt, zb)
mt.__index = mt

-- 类别
mt.class = "鞋子"

----------------------------------------------------------------------------------------
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
    pro[7] = {'出招间隔', 25 * lev, 100 * lev}
    pro[8] = {'固定减伤', 25 * lev, 100 * lev}
    pro[9] = {'减伤率', 25 * lev, 100 * lev}
    --
    local tab = zb:inherit(it)

    local v = pro[GetRandomInt(1, 10)]
    tab[v[1]] = math.random(v[2], v[3])
end

-- 设置属性值-紫
function mt:setProValue_Pink(it)
    local lev = GetItemLevel(it)
    local pro = {}
    pro[1] = {'出招速度', 1, 1}
    pro[2] = {'会心加成', 1, 1}
    pro[3] = {'会心率', 1, 1}
    --
    local tab = zb:inherit(it)

    local v = pro[GetRandomInt(1, 5)]
    printF(v[1], v[2], v[3])
    tab[v[1]] = math.random(v[2], v[3])
end

-- 设置属性值-黄
function mt:setProValue_Yellow(it)
    local lev = GetItemLevel(it)
    local pro = {}
    pro[1] = {'移动速度', 100 * lev, 300 * lev}
    pro[2] = {'气血', 100 * lev, 300 * lev}
    pro[3] = {'内力', 10, 10 * lev}
    pro[1] = {'招式', 100 * lev, 300 * lev}
    pro[2] = {'身法', 100 * lev, 300 * lev}
    pro[3] = {'心法', 10, 10 * lev}
    --
    local tab = zb:inherit(it)

    local v = pro[GetRandomInt(1, 7)]
    tab[v[1]] = math.random(v[2], v[3])
end

-- 设置属性值-白
function mt:setProValue_White(it)
    local lev = GetItemLevel(it)
    local pro = {}
    pro[1] = {'移动速度', 100 * lev, 300 * lev}
    pro[2] = {'气血', 100 * lev, 300 * lev}
    pro[3] = {'内力', 10, 10 * lev}
    pro[1] = {'招式', 100 * lev, 300 * lev}
    pro[2] = {'身法', 100 * lev, 300 * lev}
    pro[3] = {'心法', 10, 10 * lev}
    --
    local tab = zb:inherit(it)

    local v = pro[GetRandomInt(1, 2)]
    tab[v[1]] = GetRandomInt(v[2], v[3])

    local v = pro[GetRandomInt(3, 7)]
    tab[v[1]] = GetRandomInt(v[2], v[3])
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
----------------------------------------------------------------------------------------

mt:printParentClass()

return mt
