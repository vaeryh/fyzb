local op = require 'map.bag.operation'

local mt = {}

-- 英雄满格拾取
function mt.Init_A()
    --  单位发布右键物品命令
    gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.ISSUED_TARGET_ORDER, function()
        local trgu, tarit = GetTriggerUnit(), GetOrderTargetItem()
        -- 条件
        if not OrderId2String(GetIssuedOrderId()) == "smart" or tarit == 0 then -- 命令ID不为 smart
            return
        elseif not gU.isType(trgu, UNIT_TYPE.HERO) or gIt.getBarNum(trgu) < 6 then
            return -- 不是英雄-- 英雄物品栏已满
        elseif gIt.isPowerup(tarit) then
            return
        elseif not gIt.isVisible(tarit) then
            return
        end
        -- 命令单位走向物品
        gU.issueOrderXY(trgu, "move", gIt.getXY(tarit))
        --
        local distance = 0
        gT.loop(0.10, function()
            local thisDistance = gYh.distanceXY(GetUnitX(trgu), GetUnitY(trgu), GetItemX(tarit), GetItemY(tarit))
            -- 单位远离物品
            if distance <= thisDistance and distance ~= 0 then
                gT.remove()
            else
                distance = thisDistance
            end
            -- 靠近物品马上拾取
            if distance <= 100 and distance ~= 0 then
                gIt.setVisible(tarit, false) -- 隐藏
                op.PickEnterBag(tarit, gU.getOwner(trgu))
                gT.remove()
            end
        end)
    end)
end

-- 初始化
function mt.Init()
    mt.Init_A()
end

mt.Init()

return mt
