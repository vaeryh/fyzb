local mt = {}

-- 获取序号
function mt.getKey(frame)
    for i, v in ipairs(mt.but) do
        if v == frame then
            return i
        end
    end
    return false
end

-- 显示提示
function mt.Init_C()
    -- 创建UI待用
    -- tip背景
    mt.showBack = oUI:createByTag("BACKDROP", nil, "BackdropTemplate")
    gDz.FrameSetPoint(mt.showBack, 8, mt.mainBack, 6, 0.0, 0.0)
    oUI:setSize(0.18, 0.166)
    oUI:setShow(false)
    -- 标题
    mt.title = oUI:createByTag("TEXT", mt.showBack, "ProTextTemplate")
    gDz.FrameSetSize(mt.title, 0.14, 0.01)
    gDz.FrameSetText(mt.title, "|cff31e40d英雄属性")
    gDz.FrameSetPoint(mt.title, 1, mt.showBack, 1, 0.00, -0.01)
    -- 第一行
    mt.showText1 = oUI:createByTag("TEXT", mt.showBack, "ProText")
    gDz.FrameSetSize(mt.showText1, 0.09, 0.01)
    gDz.FrameSetText(mt.showText1, "|cff1cdad0属性：|r")
    gDz.FrameSetPoint(mt.showText1, 0, mt.showBack, 0, 0.01, -0.02)
    -- 第二行
    mt.showText2 = oUI:createByTag("TEXT", mt.showBack, "ProText")
    gDz.FrameSetSize(mt.showText2, 0.14, 0.06)
    gDz.FrameSetText(mt.showText2, "防御+10")
    gDz.FrameSetPoint(mt.showText2, 0, mt.showText1, 6, 0.01, -0.01)
    -- 第三行
    mt.showText3 = oUI:createByTag("TEXT", mt.showBack, "ProText")
    gDz.FrameSetSize(mt.showText3, 0.09, 0.01)
    gDz.FrameSetText(mt.showText3, "|cff1cdad0描述：|r")
    gDz.FrameSetPoint(mt.showText3, 0, mt.showText2, 6, -0.01, -0.01)
    -- 第四行
    mt.showText4 = oUI:createByTag("TEXT", mt.showBack, "ProText")
    gDz.FrameSetSize(mt.showText4, 0.155, 0.08)
    gDz.FrameSetText(mt.showText4, "防御+10")
    gDz.FrameSetPoint(mt.showText4, 0, mt.showText3, 6, 0.01, -0.01)
    -- 注册
    for i = 1, 42 do
        -- 显示提示
        gDz.TriggerRegisterUIEvent(mt.but[i], 2, function()
            local index = mt.getKey(gDz.GetTriggerUIEventFrame())
            local p = gDz.GetTriggerUIEventPlayer()
            local item = mt[p][index]
            if not index or not item then
                return
            end
            mt.bagTip(item)
        end)
        -- 关闭提示
        gDz.TriggerRegisterUIEvent(mt.but[i], 3, function()
            gDz.FrameShow(mt.showBack, false)
        end)
    end
    -- 设置背包提示
    function mt.bagTip(item)
        local zb = require 'map.equip.common.zb'
        local tab = zb:inherit(item)
        local text = ''
        for k, v in pairs(tab) do
            text = text .. v.tip .. '\n'
        end
        gDz.FrameSetText(mt.title, GetItemName(item))
        gDz.FrameSetText(mt.showText2, text)
        gDz.FrameSetText(mt.showText4, gIt.getDataString(item, ITEM_DATA.UBERTIP))
        gDz.FrameShow(mt.showBack, true)
    end
end

-- 创建UI待用
function mt.Init_A()
    -- 背包背景
    mt.mainBack = oUI:createByTag("BACKDROP", nil, "BackdropTemplate")
    oUI:setAbsolute(0, 0.614, 0.45):setSize(0.186, 0.29):setShow(false)

    mt.but, mt.but_back = {}, {} -- 按钮 按钮背景
    mt.charges_back, mt.charges_text = {}, {} -- 使用次数背景 使用次数
    for i = 1, 42 do
        -- 创建按钮
        mt.but[i] = oUI:createByTag("BUTTON", mt.mainBack, "BagButton")
        -- 创建按钮背景
        mt.but_back[i] = oUI:createByTag("BACKDROP", mt.but[i], "BagButtonBackdrop")
        oUI:setRelative(4, mt.but[i], 4, 0.0, 0.0)
        -- 创建物品使用次数背景
        mt.charges_back[i] = oUI:createByTag("BACKDROP", mt.but_back[i], "BagChargesBackdrop")
        oUI:setRelative(8, mt.but_back[i], 8, -0.004, 0.004)
        -- 创建物品使用次数文本
        mt.charges_text[i] = oUI:createByTag("TEXT", mt.charges_back[i], "BagChargesText")
        oUI:setRelative(4, mt.charges_back[i], 4, 0.0, 0.0)
    end
    -- 后续格子位置
    for i = 1, 42 - 1 do
        if i == 1 then
            gDz.FrameSetPoint(mt.but[1], 0, mt.mainBack, 0, 0.003, -0.01)
        end
        if i % 6 == 0 then
            gDz.FrameSetPoint(mt.but[i + 1], 1, mt.but[i - 5], 7, 0.0, 0.0)
        else
            gDz.FrameSetPoint(mt.but[i + 1], 3, mt.but[i], 5, 0.0, 0.0)
        end
    end
    -- 按下图标微缩
    gDz.TriggerRegisterMouseEvent(1, 1, true, function()
        local index = mt.getKey(gDz.GetMouseFocus())
        if not index then
            return
        end
        local frame = mt.but_back[index]
        gDz.FrameSetScale(frame, 0.96)
        gT.loop(0.1, function()
            if gDz.IsKeyDown(1) then
                gDz.FrameSetScale(frame, 0.96)
            else
                gDz.FrameSetScale(frame, 1.00)
                gT.remove()
            end
        end)
    end)
end

-- F4 打开 刷新
function mt.Bag_OpenClose()
    local timer
    gDz.TriggerRegisterKeyEvent(115, 0, true, function()
        local p = gDz.GetTriggerKeyPlayer()
        if gTrg.getExecCount() % 2 == 1 then
            print(#mt[p], gTrg.getExecCount() % 2)
            gDz.FrameShow(mt.mainBack, true)
            timer = gT.loop(0.01, function()
                mt.Bag_Refresh(p)
            end)
        else
            gDz.FrameShow(mt.mainBack, false)
            gT.remove(timer)
        end
    end)
    -- 刷新动作
    function mt.Bag_Refresh(p)
        for i = 1, 42 do
            local item = mt[p][i]
            -- 刷新格子是否有物品存在，存在即显示图标
            if item == nil then
                gDz.FrameShow(mt.but_back[i], false)
            else
                gDz.FrameShow(mt.but_back[i], true)
                local path = gSlk.getItemString(item, "Art")
                if path then
                    gDz.FrameSetTexture(mt.but_back[i], path, 0)
                end
            end
            -- 刷新格子是否有可叠加物品存在（如：药水，材料）
            if gIt.getCharges(item) >= 1 then -- s叠加数量最大为99，限制再拾取时设置
                gDz.FrameShow(mt.charges_back[i], true)
                gDz.FrameSetText(mt.charges_text[i], gIt.getCharges(item))
            else
                gDz.FrameShow(mt.charges_back[i], false)
            end
        end
    end
end

--  吸附操作 当 鼠标右键释放 时
function mt.Init_B()
    mt.adsort_back = oUI:createByTag("BACKDROP") -- 吸附背景
    oUI:setSize(0.024, 0.028):setShow(false)
    -- 鼠标右键 释放
    gDz.TriggerRegisterMouseEvent(2, 0, true, function()
        local p = gDz.GetTriggerKeyPlayer()
        local index = mt.getKey(gDz.GetMouseFocus())
        if not index then
            return
        end
        -- 保存吸附物品
        mt.adsorb_item = mt[p][index]
        -- 吸附序号
        mt.adsorb_index = index

        gT.loop(0.01, function()
            local x = 0.80 * (gDz.GetMouseXRelative() / gDz.GetWindowWidth())
            local y = 0.60 - (0.60 * (gDz.GetMouseYRelative() / gDz.GetWindowHeight()))

            -- 是否持续吸附判断
            if mt.adsorb_item == nil then
                mt.adsorb_index = nil -- 还原
                gDz.FrameShow(mt.adsort_back, false)
                gT.remove()
            else
                gDz.FrameShow(mt.adsort_back, true)
                local path = gSlk.getItemString(mt.adsorb_item, "Art")
                gDz.FrameSetTexture(mt.adsort_back, path, 0)
                gDz.FrameSetAbsolutePoint(mt.adsort_back, 2, x + 0.006, y)
            end
        end)
    end)
end

-- 获取玩家的背包区域
function mt.getPlayerBag(p)
    if mt[p] == nil then
        mt[p] = {}
    end
    return mt[p]
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
end

-- 英雄满格拾取
-- 单位发布右键物品命令
function mt.Bag_FullPick()
    -- 条件
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
            if distance <= 200 and distance ~= 0 then
                gIt.setVisible(tarit, false) -- 隐藏
                mt.PickEnterBag(tarit, gU.getOwner(trgu))
                gT.remove()
            end
        end)
    end)
end

-- 物品交换
function mt.Init_D()

    -- 交换物品位置：来自背包
    gDz.TriggerRegisterMouseEvent(1, 0, true, function()
        local p = gDz.GetTriggerKeyPlayer()
        local index = mt.getKey(gDz.GetMouseFocus())
        if not index then
            return
        end
        -- 交换物品
        if mt.adsorb_item then
            mt.adsorb_item = nil
            mt[p][mt.adsorb_index], mt[p][index] = mt[p][index], mt[p][mt.adsorb_index]
        end
    end)
    -- 交换物品位置：来自物品栏
    gDz.TriggerRegisterMouseEvent(1, 0, true, function()
        local p = gDz.GetTriggerKeyPlayer()
        local index = mt.getKey(gDz.GetMouseFocus())
        if not index then
            return
        end
        local itemBar = require "library.bags.ItemBar"
        -- 物品栏吸附物品不为nil
        if itemBar.adsorb_item then
            -- 吸附物品与当前背包交换
            gIt.drop(Hero[p], itemBar.adsorb_item)
            itemBar.adsorb_item, mt[p][index] = mt[p][index], itemBar.adsorb_item
            itemBar.adsorb_item = nil
        end
    end)
end

-- 初始化背包系统
function mt.init()
    for i = 0, 11 do
        if gP.isUserPlayer(Player(i)) then
            mt[Player(i)] = {}
        end
    end
    mt.Init_A() -- 初始化
    mt.Bag_OpenClose()
    mt.Init_B() -- 吸附操作
    mt.Bag_FullPick()
    mt.Init_D()
    mt.Init_C() -- 显示提示
end

mt.init()

return mt
