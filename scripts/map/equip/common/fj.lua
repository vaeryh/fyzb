local zb = require 'map.equip.common.zb'

local mt = {}
setmetatable(mt, zb)
mt.__index = mt

-- 类别
mt.class = "防具"

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
    pro[7] = {'固定减伤', 25 * lev, 100 * lev}
    pro[8] = {'减伤率', 25 * lev, 100 * lev}
    --
    local tab = zb:inherit(it)

    local v = pro[GetRandomInt(1, 10)]
    tab[v[1]] = math.random(v[2], v[3])
end

-- 设置属性值-紫
function mt:setProValue_Pink(it)
    local lev = GetItemLevel(it)
    local pro = {}
    pro[1] = {'免疫中毒', 1, 1}
    pro[2] = {'免疫减攻速', 1, 1}
    pro[3] = {'免疫减移速', 1, 1}
    pro[4] = {'免疫破甲', 1, 1}
    pro[5] = {'免疫沉默', 1, 1}
    pro[6] = {'免疫眩晕', 1, 1}
    pro[7] = {'免疫闪避', 1, 1}
    pro[8] = {'免疫减攻击', 1, 1}
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
    pro[1] = {'护甲', 100 * lev, 300 * lev}
    pro[2] = {'气血', 100 * lev, 300 * lev}
    pro[3] = {'内力', 10, 10 * lev}
    pro[4] = {'招式', 25 * lev, 100 * lev}
    pro[5] = {'身法', 25 * lev, 100 * lev}
    pro[6] = {'心法', 25 * lev, 100 * lev}
    --
    local tab = zb:inherit(it)

    local v = pro[GetRandomInt(1, 7)]
    tab[v[1]] = math.random(v[2], v[3])
end

-- 设置属性值-白
function mt:setProValue_White(it)
    local lev = GetItemLevel(it)
    local pro = {}
    pro[1] = {'护甲', 100 * lev, 300 * lev}
    pro[2] = {'气血', 100 * lev, 300 * lev}
    pro[3] = {'内力', 10, 10 * lev}
    pro[4] = {'招式', 25 * lev, 100 * lev}
    pro[5] = {'身法', 25 * lev, 100 * lev}
    pro[6] = {'心法', 25 * lev, 100 * lev}
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
-- 性别是否不满足
function mt.holdlimit_Sex()
    gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.PICKUP_ITEM, function()
        local hero, item = GetTriggerUnit(), GetManipulatedItem()
        --
        print('sex', mt:inherit(item), mt.class, mt:inherit(item).class)
        if zb:isItemClass(item, mt.class) then
            local oldLevel = gSlk.getItemInt(item, "oldLevel")
            print('性别', oldLevel, gU.isTypeId(hero, 'Fw00'))
            -- 男
            if oldLevel == 1 and gU.isTypeId(hero, 'Fw00') then -- 男
                local text = "虽然" .. GetUnitName(hero) .. "你是美女，也不可以穿男装哦~~~~"
                gP.disTimedText(gU.getOwner(hero), 15.00, text)
                gIt.drop(hero, item)
            end
            -- 女
            if oldLevel == 0 and not gU.isTypeId(hero, 'Fw00') then
                gP.disTimedText(gU.getOwner(hero), 15.00, "莫非你是女装大佬？？？~~~~")
                gIt.drop(hero, item)
            end
        end
    end)
end

-- 自身初始化
function mt.selfInit()

end

mt:printParentClass()
-- mt:source_shop()
mt.holdlimit_Sex()

return mt
