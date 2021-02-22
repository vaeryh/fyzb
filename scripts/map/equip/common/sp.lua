local zb = require 'map.equip.common.zb'

local mt = {}
setmetatable(mt, zb)
mt.__index = mt

-- 类别
mt.class = "饰品"

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
    pro[7] = {'会心率', 25 * lev, 100 * lev}
    pro[8] = {'出招间隔', 25 * lev, 100 * lev}
    --
    local tab = zb:inherit(it)

    local v = pro[GetRandomInt(1, 10)]
    tab[v[1]] = math.random(v[2], v[3])
end

-- 设置属性值-紫
function mt:setProValue_Pink(it)
    local lev = GetItemLevel(it)
    local pro = {}
    pro[1] = {'辉煌光环', 1, 1}
    pro[2] = {'恢复光环', 1, 1}
    pro[3] = {'专注光环', 1, 1}
    pro[4] = {'耐久光环', 1, 1}
    pro[5] = {'吸血光环', 1, 1}
    pro[6] = {'邪恶光环', 1, 1}
    pro[7] = {'荆棘光环', 1, 1}
    pro[8] = {'强击光环', 1, 1}
    pro[7] = {'命令光环', 1, 1}
    pro[8] = {'减速光环', 1, 1}
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
    pro[1] = {'气血恢复', 100 * lev, 300 * lev}
    pro[2] = {'内力恢复', 100 * lev, 300 * lev}
    pro[3] = {'招式', 25 * lev, 100 * lev}
    pro[4] = {'身法', 25 * lev, 100 * lev}
    pro[5] = {'心法', 25 * lev, 100 * lev}
    --
    local tab = zb:inherit(it)

    local v = pro[GetRandomInt(1, 7)]
    tab[v[1]] = math.random(v[2], v[3])
end

-- 设置属性值-白
function mt:setProValue_White(it)
    local lev = GetItemLevel(it)
    local pro = {}
    pro[1] = {'气血恢复', 100 * lev, 300 * lev}
    pro[2] = {'内力恢复', 100 * lev, 300 * lev}
    pro[3] = {'会心率', 10, 10 * lev}
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
