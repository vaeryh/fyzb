local frame = require 'library.bags.frame'
local mouse = require 'library.bags.mouse'

local mt = {}

-- 获取玩家的背包区域
function mt.getPlayerBag(p)
    if mt[p] == nil then
        mt[p] = {}
    end
    return mt[p]
end

-- 按下图标微缩
function mt.Init_A()
    gDz.TriggerRegisterMouseEvent(1, 1, true, function()
        local UI = 0
        if mouse.pos == "背包栏" then
            UI = frame.but_back[mouse.solt]
        elseif mouse.pos == "虚拟物品栏" then
            UI = frame.xnBut_back[mouse.solt]
        else
            return
        end
        gDz.FrameSetScale(UI, 0.96)
        gT.loop(0.1, function()
            if gDz.IsKeyDown(1) then
                gDz.FrameSetScale(UI, 0.96)
            else
                gDz.FrameSetScale(UI, 1.00)
                gT.remove()
            end
        end)
    end)
end

-- 按键F4打开背包和虚拟物品栏、刷新UI
function mt.Init_C()
    local timer
    gDz.TriggerRegisterKeyEvent(115, 0, true, function()
        local p = gDz.GetTriggerKeyPlayer()
        if gTrg.getExecCount() % 2 == 1 then
            print(#mt[p], gTrg.getExecCount() % 2)
            gDz.FrameShow(frame.mainBack, true)
            mt.Init_E_A(-0.3)
            timer = gT.loop(0.01, function()
                mt.Bag_Refresh(p)
                mt.Init_E_B(p)
            end)
        else
            mt.Init_E_A(0)
            gDz.FrameShow(frame.mainBack, false)
            gT.remove(timer)
        end
    end)
    -- 刷新动作
    function mt.Bag_Refresh(p)
        for i = 1, 42 do
            local item = mt[p][i]
            -- 刷新格子是否有物品存在，存在即显示图标
            local back = frame.but_back[i]
            if item == nil then
                gDz.FrameShow(back, false)
            else
                gDz.FrameShow(back, true)
                local path = gSlk.getItemString(item, "Art")
                if path then
                    gDz.FrameSetTexture(back, path, 0)
                end
            end
            -- 刷新格子是否有可叠加物品存在（如：药水，材料）
            back = frame.charges_back[i]
            if gIt.getCharges(item) >= 1 then -- s叠加数量最大为99，限制再拾取时设置
                gDz.FrameShow(back, true)
                gDz.FrameSetText(frame.charges_text[i], gIt.getCharges(item))
            else
                gDz.FrameShow(back, false)
            end
        end
    end
end

-- 吸附类操作
function mt.Init_B()
    mt.adsort_back = oUI:createByTag("BACKDROP") -- 吸附背景
    oUI:setSize(0.024, 0.028):setShow(false)

    -- 背包栏吸附操作
    gDz.TriggerRegisterMouseEvent(2, 0, true, function()
        local p = gDz.GetTriggerKeyPlayer()
        -- 是否可以吸附
        if not mt.adsorb_item and mouse.pos == '背包栏' then
            -- 保存吸附物品 吸附序号 记录吸附位置
            mt.adsorb_item, mt.adsorb_solt, mt.adsorb_pos = mouse.item, mouse.solt, mouse.pos

            gT.loop(0.01, function()
                local x = 0.80 * (gDz.GetMouseXRelative() / gDz.GetWindowWidth())
                local y = 0.60 - (0.60 * (gDz.GetMouseYRelative() / gDz.GetWindowHeight()))
                local back = mt.adsort_back
                -- 是否持续吸附判断
                if mt.adsorb_item == nil then
                    mt.adsorb_solt, mt.adsorb_pos = nil, nil
                    gDz.FrameShow(back, false)
                    gT.remove()
                else
                    gDz.FrameShow(back, true)
                    local path = gSlk.getItemString(mt.adsorb_item, "Art")
                    gDz.FrameSetTexture(back, path, 0)
                    gDz.FrameSetAbsolutePoint(back, 4, x, y)
                end
            end)
        end
    end)
    -- 虚拟物品栏吸附操作
    gDz.TriggerRegisterMouseEvent(2, 0, true, function()
        local p = gDz.GetTriggerKeyPlayer()
        -- 是否可以吸附
        if not mt.adsorb_item and mouse.pos == '虚拟物品栏' then
            -- 保存吸附物品 吸附序号 记录吸附位置
            mt.adsorb_item, mt.adsorb_solt, mt.adsorb_pos = mouse.item, mouse.solt, mouse.pos

            gT.loop(0.01, function()
                local x = 0.80 * (gDz.GetMouseXRelative() / gDz.GetWindowWidth())
                local y = 0.60 - (0.60 * (gDz.GetMouseYRelative() / gDz.GetWindowHeight()))
                local back = mt.adsort_back
                -- 是否持续吸附判断
                if mt.adsorb_item == nil then
                    mt.adsorb_solt, mt.adsorb_pos = nil, nil
                    gDz.FrameShow(back, false)
                    gT.remove()
                else
                    gDz.FrameShow(back, true)
                    local path = gSlk.getItemString(mt.adsorb_item, "Art")
                    gDz.FrameSetTexture(back, path, 0)
                    gDz.FrameSetAbsolutePoint(back, 4, x, y)
                end
            end)
        end
    end)
    -- 物品栏吸附操作
    gDz.TriggerRegisterMouseEvent(2, 0, true, function()
        local p = gDz.GetTriggerKeyPlayer()
        -- 是否可以吸附
        if not mt.adsorb_item and mouse.pos == '物品栏' then
            -- 保存吸附物品 吸附序号 记录吸附位置
            mt.adsorb_item, mt.adsorb_solt, mt.adsorb_pos = mouse.item, mouse.solt, mouse.pos
            -- 还原
            gT.loop(0.01, function()
                if mt.adsorb_item == nil then
                    mt.adsorb_solt, mt.adsorb_pos = nil, nil
                    gT.remove()
                end
            end)
        end
    end)
    -- 重置吸附
    gDz.TriggerRegisterMouseEvent(2, 1, true, function()
        local p = gDz.GetTriggerKeyPlayer()
        -- 是否可以重置
        if mt.adsorb_item and gDz.GetMouseFocus() == 0 then
            gU.issueOrder(Hero[p], "holdposition") -- 命令单位停止
            gU.issueNeutralOrder(Player(0),Hero[p], "stop")
            mt.adsorb_item = nil
            print("重置吸附")
        end
    end)
end

-- 背包保存动作
function mt.PickEnterBag(whichItem, p)
    -- 检查背包是否有相同物品
    for i = 1, 42 do
        if mt[p][i] == whichItem then
            printF(GetItemName(whichItem), "存入相同物品,退出")
            return
        end
    end
    -- 保存到背包空格
    for i = 1, 42 do
        if mt[p][i] == nil then
            mt[p][i] = whichItem
            mt.AddCharges(whichItem, i, p)
            break
        end
    end
    --
    if #mt[p] == 42 then
        gP.disTimedText(p, 10.00, "背包已满，请先清理背包！")
        gIt.drop(whichItem)
    end

end

-- 叠加：动作
function mt.AddCharges(newItem, index, p)
    -- 判断是否叠加
    local class = gSlk.getItemString(newItem, "class")
    if class == "Charged" then
        for i = 1, 42 do
            local item = mt[p][i]
            if GetItemTypeId(item) == GetItemTypeId(newItem) and item ~= newItem then
                gIt.setCharges(item, gIt.getCharges(item) + gIt.getCharges(newItem))
                mt[p][index] = nil
                gIt.remove(newItem)
                break
            end
        end
    end
end

-- 物品操作
function mt.Init_D()

    -- 处于背包交换物品
    gDz.TriggerRegisterMouseEvent(1, 0, true, function()
        if mouse.pos ~= "背包栏" then
            return
        end
        local p = gDz.GetTriggerKeyPlayer()
        -- 吸附物品来自：背包栏
        if mt.adsorb_pos == "背包栏" and mt.adsorb_item then
            mt[p][mt.adsorb_solt], mt[p][mouse.solt] = mt[p][mouse.solt], mt[p][mt.adsorb_solt]
            mouse.item = mt.adsorb_item
            mt.adsorb_item = nil
        end
        -- 吸附物品来自：物品栏 或者 虚拟物品栏
        if (mt.adsorb_pos == "物品栏" or mt.adsorb_pos == "虚拟物品栏") and mt.adsorb_item then
            -- step1:丢弃物品栏物品
            gIt.drop(Hero[p], mt.adsorb_item)
            gIt.setVisible(mt.adsorb_item,false)
            -- step2: 鼠标指向是否有物品
            local temp = mt[p][mouse.solt]
            if temp then
                mt[p][mouse.solt] = mt.adsorb_item
                gIt.addUnit(Hero[p], temp)
                gIt.moveUnitSlot(Hero[p], temp, mt.adsorb_solt)
            else
                mt[p][mouse.solt] = mt.adsorb_item
            end
            mouse.item = mt.adsorb_item
            mt.adsorb_item = nil
        end
    end)

    -- 处于虚拟物品栏 交换物品
    gDz.TriggerRegisterMouseEvent(1, 0, true, function()
        if mouse.pos ~= "虚拟物品栏" then
            return
        end
        local p = gDz.GetTriggerKeyPlayer()
        -- 吸附物品来自：虚拟物品栏
        if (mt.adsorb_pos == "物品栏" or mt.adsorb_pos == "虚拟物品栏") and mt.adsorb_item then
            local temp = mouse.item
            -- 移动吸附物品到鼠标槽位
            gIt.moveUnitSlot(Hero[p], mt.adsorb_item, mouse.solt)
            -- 如果槽位有物品
            -- gIt.moveUnitSlot(Hero[p], temp, mt.adsorb_solt)
            mouse.item = mt.adsorb_item
            mt.adsorb_item = nil
        end
        -- 吸附物品来自：背包栏
        if mt.adsorb_pos == "背包栏" and mt.adsorb_item then
            -- 鼠标指向是否有物品
            if mouse.item then
                local temp = mouse.item
                -- 腾位置
                gIt.drop(Hero[p], temp)
                gIt.setVisible(temp, false)
                mt[p][mt.adsorb_solt] = temp
                -- 背包物品交给单位
                gIt.addUnit(Hero[p], mt.adsorb_item)
                gIt.moveUnitSlot(Hero[p], mt.adsorb_item, mouse.solt)
            else
                mt[p][mt.adsorb_solt] = nil
                -- 背包物品交给单位
                gIt.addUnit(Hero[p], mt.adsorb_item)
                gIt.moveUnitSlot(Hero[p], mt.adsorb_item, mouse.solt)
            end
            mouse.item = mt.adsorb_item
            mt.adsorb_item = nil
        end
    end)
end

-- 丢弃操作
function mt.Init_F()
    -- 虚拟物品栏丢弃
    gDz.TriggerRegisterMouseEvent(1, 1, true, function()
        local p = gDz.GetTriggerKeyPlayer()
        if mt.adsorb_item and gDz.GetMouseFocus() == 0 and mt.adsorb_pos == "虚拟物品栏" then
            gIt.dropXY(Hero[p], mt.adsorb_item, gDz.GetMouseTerrainX(), gDz.GetMouseTerrainY())
            mt.adsorb_item = nil
        end
    end)
    -- 背包丢弃
    gDz.TriggerRegisterMouseEvent(1, 1, true, function()
        local p = gDz.GetTriggerKeyPlayer()
        if mt.adsorb_item and gDz.GetMouseFocus() == 0 and mt.adsorb_pos == "背包栏" then
            local unit, item, solt = Hero[p], mt.adsorb_item, mt.adsorb_solt
            mt.adsorb_item = nil

            local x, y = gDz.GetMouseTerrainX(), gDz.GetMouseTerrainY()
            -- 命令单位走向物品
            gU.issueOrderXY(unit, "move", x, y)
            --
            local distance = 0
            gT.loop(0.10, function()
                local thisDistance = gYh.distanceXY(GetUnitX(unit), GetUnitY(unit), x, y)
                -- 单位远离物品
                if distance <= thisDistance and distance ~= 0 then
                    gT.remove()
                else
                    distance = thisDistance
                end
                -- 靠近物品马上拾取
                if distance <= 100 and distance ~= 0 then
                    gU.issueOrder(unit, "stop") -- 命令单位停止
                    gIt.setPosition(item, x, y)
                    mt[p][solt] = nil
                    gT.remove()
                end
            end)
        end
    end)
    -- 物品栏丢弃
    gDz.TriggerRegisterMouseEvent(1, 1, true, function()
        local p = gDz.GetTriggerKeyPlayer()
        if mt.adsorb_item and gDz.GetMouseFocus() == 0 and mt.adsorb_pos == "物品栏" then
            mt.adsorb_item = nil
        end
    end)
end

-- 虚拟物品栏：刷新UI
function mt.Init_E()
    -- 刷新提示
    function mt.Init_E_B(p)
        for i = 0, 5 do
            local item = gIt.getUnitInSlot(Hero[p], i)
            local back = frame.xnBut_back[i]
            -- 刷新格子是否有物品存在，存在即显示图标
            if item == nil then
                gDz.FrameShow(back, false)
            else
                gDz.FrameShow(back, true)
                local path = gSlk.getItemString(item, "Art")
                if path then
                    gDz.FrameSetTexture(back, path, 0)
                end
            end
            -- 刷新格子是否有可叠加物品存在（如：药水，材料）
            local back = frame.xnBut_charges_back[i]
            if gIt.getCharges(item) >= 1 then -- s叠加数量最大为99，限制再拾取时设置
                gDz.FrameShow(back, true)
                gDz.FrameSetText(frame.xnBut_charges_text[i], gIt.getCharges(item))
            else
                gDz.FrameShow(back, false)
            end
        end
    end
    -- 调整原生物品栏位置
    function mt.Init_E_A(numR)
        gDz.FrameSetAbsolutePoint(gDz.FrameGetItemBarButton(0), 0, 0.516, 0.111 + numR)
        gDz.FrameSetAbsolutePoint(gDz.FrameGetItemBarButton(1), 0, 0.556, 0.111 + numR)
        gDz.FrameSetAbsolutePoint(gDz.FrameGetItemBarButton(2), 0, 0.516, 0.073 + numR)
        gDz.FrameSetAbsolutePoint(gDz.FrameGetItemBarButton(3), 0, 0.556, 0.073 + numR)
        gDz.FrameSetAbsolutePoint(gDz.FrameGetItemBarButton(4), 0, 0.516, 0.035 + numR)
        gDz.FrameSetAbsolutePoint(gDz.FrameGetItemBarButton(5), 0, 0.556, 0.035 + numR)
    end
end

local mapg = require 'map.global'
--丢弃音效
function mt.playDropItem()
    gSound.PlaySoundUI(mapg.sound.HeroDropItem1, 127)
end
--拾取音效
function mt.playPickupItem()
    gSound.PlaySoundUI(mapg.sound.PickUpItem, 127)
end
-- 右键音效
function mt.playClick()
    gSound.PlaySoundUI(mapg.sound.MouseClick1, 127)
end

-- 初始化背包系统
function mt.Init()
    for i = 0, 11 do
        if gP.isUserPlayer(Player(i)) then
            mt[Player(i)] = {}
        end
    end
    mt.Init_A() -- 初始化
    mt.Init_B() -- 吸附操作
    mt.Init_C()
    mt.Init_D()
    mt.Init_E()
    mt.Init_F()
end

mt.Init()

return mt
