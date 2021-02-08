local mt = {}

-- 叠加：动作
function Add_Actions(newItem, index, p)
    for i = 1, 42 do
        local item = mt.listItem[p][i]
        if GetItemTypeId(item) == GetItemTypeId(newItem) and item ~= newItem then
            gIt.setCharges(item, gIt.getCharges(item) + gIt.getCharges(newItem))
            mt.listItem[p][index] = nil
            gIt.remove(newItem)
            break
        end
    end
end
-- 叠加入口：条件-本地化
function Add_Conditions(whichItem, index, p)
    local class = gSlk.getItemString(whichItem, "class")
    -- 可叠加
    if class == "Charged" then
        Add_Actions(whichItem, index, p)
    end
end

function Pick_Enter_Actions(whichItem, p)
    local list = mt:getButItemTab(i,p)
    -- 检查物品重复信息
    for i = 1, 42 do
        if list[i] == whichItem then
            return
        end
    end
    -- 保存到背包空格
    for i = 1, 42 do
        if list[i] == nil then
            mt.listItem[p][i] = whichItem
            Add_Conditions(whichItem, i, p) -- 判断是否可以叠加
            break
        end
    end
    --
    if #list == 42 then
        gP.disTimedText(p, 5.00, "背包已满，请先清理背包！")
        gIt.drop(whichItem)
    end
end

-- 单位发布右键物品命令
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.ISSUED_TARGET_ORDER, function()
    local trgu, tarit = GetTriggerUnit(), GetOrderTargetItem()
    -- 条件
    if not OrderId2String(GetIssuedOrderId()) == "smart" or tarit == 0 then -- 命令ID不为 smart
        return
    elseif not gU.isType(trgu, UNIT_TYPE.HERO) or gIt.getBarNum(trgu) < 6 then
        return -- 不是英雄-- 英雄物品栏已满
    elseif gSlk.getItemInt(tarit, "powerup") == 1 then -- 物品不为 状态-捡取时自动使用
        return
    end
    -- 命令单位走向物品
    gU.issueOrderXY(trgu, "move", GetItemX(tarit), GetItemY(tarit))
    -- 计时器绑定单位和物品
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
        if distance <= 200 and distance ~= 0 then
            gIt.setVisible(tarit, false) -- 隐藏
            Pick_Enter_Actions(tarit, gU.getOwner(trgu))
            gT.remove()
        end
    end)
end)

return mt
