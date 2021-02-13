local mt = {}

-- 获取序号
function mt:getKey(frame)
    for i, v in ipairs(self.but) do
        if v == frame then
            return i
        end
    end
    return false
end

-- 创建UI待用
function mt:Bag_FrameInit()
    -- 背包背景
    self.mainBack = oUI:createByTag("BACKDROP", nil, "BackdropTemplate")
    oUI:setAbsolute(0, 0.5, 0.4):setSize(0.186, 0.326):setShow(false)

    self.but, self.but_back = {}, {} -- 按钮 按钮背景
    self.charges_back, self.charges_text = {}, {} -- 使用次数背景 使用次数
    for i = 1, 42 do
        -- 创建按钮
        self.but[i] = oUI:createByTag("BUTTON", self.mainBack, "BagButton")
        -- 创建按钮背景
        self.but_back[i] = oUI:createByTag("BACKDROP", self.but[i], "BagButtonBackdrop")
        oUI:setRelative(4, self.but[i], 4, 0.0, 0.0)
        -- 创建物品使用次数背景
        self.charges_back[i] = oUI:createByTag("BACKDROP", self.but_back[i], "BagChargesBackdrop")
        oUI:setRelative(8, self.but_back[i], 8, -0.004, 0.004)
        -- 创建物品使用次数文本
        self.charges_text[i] = oUI:createByTag("TEXT", self.charges_back[i], "BagChargesText")
        oUI:setRelative(4, self.charges_back[i], 4, 0.0, 0.0)
    end
    -- 后续格子位置
    for i = 1, 42 - 1 do
        if i == 1 then
            gDz.FrameSetPoint(self.but[1], 0, self.mainBack, 0, 0.003, -0.01)
        end
        if i % 6 == 0 then
            gDz.FrameSetPoint(self.but[i + 1], 1, self.but[i - 5], 7, 0.0, 0.0)
        else
            gDz.FrameSetPoint(self.but[i + 1], 3, self.but[i], 5, 0.0, 0.0)
        end
    end
    print 'zairu1'
end

-- F4 打开 刷新
function mt:Bag_OpenClose()
    local timer
    gDz.TriggerRegisterKeyEvent(115, 0, true, function()
        local p = gDz.GetTriggerKeyPlayer()
        if gTrg.getExecCount() % 2 == 1 then
            gDz.FrameShow(self.mainBack, true)
            timer = gT.loop(1.01, function()
                self:Bag_Refresh(p)
            end)
        else
            gDz.FrameShow(self.mainBack, false)
            gT.remove(timer)
        end
    end)
end

-- 刷新动作
function mt:Bag_Refresh(p)
    for i = 1, 42 do
        -- 刷新格子是否有物品存在，存在即显示图标
        if self[p][i] == nil then
            gDz.FrameShow(self.but_back[i], false)
        else
            gDz.FrameShow(self.but_back[i], true)
            local path = gSlk.getItemString(self[p][i], "Art")
            gDz.FrameSetTexture(self.but_back[i], path, 0)
        end
        -- 刷新格子是否有可叠加物品存在（如：药水，材料）
        if gIt.getCharges(self[p][i]) >= 1 then -- s叠加数量最大为99，限制再拾取时设置
            gDz.FrameShow(self.charges_back[i], true)
            gDz.FrameSetText(self.charges_text[i], gIt.getCharges(self[p][i]))
        else
            gDz.FrameShow(self.charges_back[i], false)
        end
    end
    print(#self[p])
end

--  吸附操作 当 鼠标右键释放 时
function mt:Bag_Adsort()
    self.adsort_back = oUI:createByTag("BACKDROP") -- 吸附背景
    oUI:setSize(0.024, 0.028):setShow(false)
    --
    gDz.TriggerRegisterMouseEvent(2, 0, true, function()
        local p = gDz.GetTriggerKeyPlayer()
        local index = self:getKey(gDz.GetMouseFocus())
        if not index then
            return
        end
        -- 保存吸附物品
        self.adsorb_item = self[p][index]
        -- 吸附序号
        self.adsorb_index = index

        gT.loop(0.01, function()
            local x = 0.80 * (I2R(gDz.GetMouseXRelative()) / I2R(gDz.GetWindowWidth()))
            local y = 0.60 - (0.60 * (I2R(gDz.GetMouseYRelative()) / I2R(gDz.GetWindowHeight())))

            -- 是否持续吸附判断
            if self.adsorb_item == nil then
                self.adsorb_index = nil -- 还原
                gDz.FrameShow(self.adsort_back, false)
                gT.remove()
            else
                gDz.FrameShow(self.adsort_back, true)
                local path = gSlk.getItemString(self.adsorb_item, "Art")
                gDz.FrameSetTexture(self.adsort_back, path, 0)
                gDz.FrameSetAbsolutePoint(self.adsort_back, 4, x, y)
            end
        end)

    end)
end

-- 获取玩家的背包区域
function mt:getPlayerBag(p)
    if self[p] == nil then
        self[p] = {}
    end
    return self[p]
end

-- 叠加：动作
function mt:AddCharges(newItem, index, p)
    -- 判断是否叠加
    local class = gSlk.getItemString(newItem, "class")
    if class == "Charged" then
        for i = 1, 42 do
            local item = self[p][i]
            if GetItemTypeId(item) == GetItemTypeId(newItem) and item ~= newItem then
                gIt.setCharges(item, gIt.getCharges(item) + gIt.getCharges(newItem))
                self[p][index] = nil
                gIt.remove(newItem)
                break
            end
        end
    end
end
-- 背包保存动作
function mt:PickEnterBag(whichItem, p)
    -- 保存到背包空格
    for i = 1, 42 do
        if self[p][i] == nil then
            self[p][i] = whichItem
            self:AddCharges(whichItem, i, p)
            break
        end
    end
    --
    if #self[p] == 42 then
        gP.disTimedText(p, 10.00, "背包已满，请先清理背包！")
        gIt.drop(whichItem)
    end
end

-- 英雄满格拾取
-- 单位发布右键物品命令
function mt:Bag_FullPick()
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
                self:PickEnterBag(tarit, gU.getOwner(trgu))
                gT.remove()
            end
        end)
    end)
end

-- 鼠标按下使用微缩效果
function mt:Bag_DownEffect()
    gDz.TriggerRegisterMouseEvent(1, 1, true, function()
        local index = self:getKey(gDz.GetMouseFocus())
        if not index then
            return
        end
        local frame = self.but_back[index]
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

-- 交换物品位置：来自背包
function mt:Bag_Change()
    gDz.TriggerRegisterMouseEvent(1, 0, true, function()
        local p = gDz.GetTriggerKeyPlayer()
        local index = self:getKey(gDz.GetMouseFocus())
        if not index then
            return
        end
        -- 交换物品
        printF(self[p][index], self.adsorb_item)
        self[p][index], self.adsorb_item = self.adsorb_item, self[p][index]
        self.adsorb_item = nil
        printF(self[p][index], self.adsorb_item)
    end)
end

-- 初始化背包系统
function mt:init()
    for i = 0, 11 do
        if gP.isUserPlayer(Player(i)) then
            self[Player(i)] = {}
        end
    end
    self:Bag_FrameInit() -- 初始化
    self:Bag_OpenClose()
    self:Bag_Adsort() -- 吸附动作
    self:Bag_FullPick()
    self:Bag_DownEffect()
    self:Bag_Change()
end

return mt
