local Hash = {} -- 库哈希表
local BarItem = {} -- 记录背包所有物品数据
-- 物品栏定位
local ItemBar_Postion = function(numR)
    DzFrameAbsolutePoint(DzFrameGetItemBarButton(0), 0, 0.516, 0.111 + numR)
    DzFrameAbsolutePoint(DzFrameGetItemBarButton(1), 0, 0.556, 0.111 + numR)
    DzFrameAbsolutePoint(DzFrameGetItemBarButton(2), 0, 0.516, 0.073 + numR)
    DzFrameAbsolutePoint(DzFrameGetItemBarButton(3), 0, 0.556, 0.073 + numR)
    DzFrameAbsolutePoint(DzFrameGetItemBarButton(4), 0, 0.516, 0.035 + numR)
    DzFrameAbsolutePoint(DzFrameGetItemBarButton(5), 0, 0.556, 0.035 + numR)
end
-- 键盘F4控制背包
local trig = yh.createTrigger(function()
    if DzGetTriggerKeyPlayer() == GetLocalPlayer() then
        if DzFrameGetEnable(DzFrameFindByName("BagButtonX", 0)) == false then
            DzFrameEnable(DzFrameFindByName("BagButtonX", 0), true)
            DzFrameShow(DzFrameFindByName("BagBackdrop", 0), true)
            -- 开启计时器--刷新物品栏每一格的物品数据
            TimerStart(CreateTimer(), 0.01, true, function()
                local frame
                local whichItem

                if DzFrameGetEnable(DzFrameFindByName("BagButtonX", 0)) == false then
                    DestroyTimer(GetExpiredTimer())
                end

                for i = 1, 42 do
                    if i > 42 then
                        BarItem[i] = UnitItemInSlot(UI_Unit, i - 43)
                    end

                    frame = DzFrameFindByName("BagGridNum" + I2S(i), 0)
                    -- 刷新格子是否有物品存在，存在即显示图标
                    if BarItem[i] == nil then
                        DzFrameShow(frame, false)
                    else
                        DzFrameShow(frame, true)
                        DzFrameTexture(frame, GetObjItemStr(BarItem[i], "Art"), 0)
                    end

                    -- 刷新格子是否有可叠加物品存在（如：药水，材料
                    frame = DzFrameFindByName("BagMinGridNum" + I2S(i), 0)
                    -- s叠加数量最大为99，限制再拾取时设置
                    if GetItemCharges(BarItem[i]) >= 1 then
                        DzFrameShow(frame, true)
                        DzFrameText(DzFrameFindByName("BagMinGridTextNum" + I2S(i), 0), I2S(GetItemCharges(BarItem[i])))
                    else
                        DzFrameShow(frame, false)
                    end
                end

                if UI_Item == nil then
                    TriggerExecute(UI_Leave) -- 运行离开背包的触发
                else
                    TriggerExecute(UI_Enter) -- 运行进入背包的触发
                end
            end)
            --
            TimerStart(CreateTimer(), 0.01, true, function()
                local whichUnit = LoadUnitHandle(Hash_TY, GetHandleId(GetExpiredTimer()), 0)

                if UI_Unit == whichUnit then
                    ItemBar_Postion(-0.3)
                    DzFrameShow(DzFrameFindByName("BagFrameXuNi", 0), true)
                else
                    DzFrameShow(DzFrameFindByName("BagFrameXuNi", 0), false)
                    ItemBar_Postion(0)
                end

                if DzFrameGetEnable(DzFrameFindByName("BagButtonX", 0)) == false then
                    DzFrameShow(DzFrameFindByName("BagFrameXuNi", 0), false) -- 还原
                    ItemBar_Postion(0)
                    DestroyTimer(GetExpiredTimer()) -- 清除
                end
            end)
        else
            DzFrameEnable(DzFrameFindByName("BagButtonX", 0), false)
            DzFrameShow(DzFrameFindByName("BagBackdrop", 0), false)
            BagBar_Adsorb_Item = nil
        end
    end
end)
-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
---------------------------------------------------------------------------------------
-- 叠加：动作
local Add_Actions = function(whichItem, lopA)
    local num

    for i = 1, 42 do
        if GetItemTypeId(BarItem[i]) == GetItemTypeId(whichItem) and i ~= lopA then
            num = GetItemCharges(BarItem[i]) + GetItemCharges(whichItem)
            DzSyncData("Item", I2S(GetHandleId(BarItem[i]))) -- 同步设置物品
            DzSyncData("ItemCharges", I2S(num)) -- 同步设置物品使用次数
            DzSyncData("RemoveItem", I2S(GetHandleId(whichItem))) -- 同步删除物品
            BarItem[i] = nil
            break
        end
    end

end
-- 叠加：条件
local Add_Conditions = function(whichItem, i)
    local class = GetObjItemStr(whichItem, "class")
    if class == "Charged" then
        Add_Actions(whichItem, i)
    end
    SaveItemHandle(Hash, GetHandleId(whichItem), 0, whichItem) -- 保存该物品到Hash表
end
---------------------------------------------------------------------------------------
local Pick_Save_Actions = function(whichItem)
    local i
    local i
    -- 检查物品重复信息
    for i = 1, 42 do
        if whichItem == BarItem[i] then
            return
        end
    end

    -- 保存到背包空格
    for i = 1, 10 do
        if BarItem[i] == nil then
            Debug(GetItemName(whichItem) + "放入了背包！")
            Debug("Index:" + I2S(i))
            BarItem[i] = whichItem
            Add_Conditions(whichItem, i) -- 判断是否可以叠加
            break
        end
    end

end
-- 动作
local Pick_Enter_Actions = function(whichUnit, whichItem)
    local numI = 0
    SaveItemHandle(Hash, GetHandleId(whichItem), 0, whichItem) -- 保存该物品到Hash表
    for i = 1, 10 do
        if BarItem[i] == nil then
            numI = numI + 1
        end
    end

    if numI == 0 then
        DisplayTimedTextToPlayer(GetLocalPlayer(), 0.0, 0.0, 5, "|cfffd5724您的背包已满！|r")
        UnitRemoveItem(whichUnit, whichItem)
    else
        ItemPosition(whichItem, 0, 0) -- 为了少写一条函数，单位上丢弃物品
        ItemVisible(whichItem, false) -- 隐藏
        if GetOwningPlayer(whichUnit) == GetLocalPlayer() then
            Pick_Save_Actions(whichItem)
            PlaySoundOnUnitBJ(gg_snd_PickUpItem, 80, whichUnit) -- 拾取音效
        end
    end
end
-- start
local trig = yh.createTrigger(function()
    -- 条件
    if OrderId2String(GetIssuedOrderId()) == "smart" and GetObjItemInt(GetOrderTargetItem(), "powerup") == 0 then

    else
        return
    end
    -- 条件
    if UnitInventoryCount(GetTriggerUnit()) == 6 then

    else
        if EquipLimit_Interface(GetTriggerUnit(), GetOrderTargetItem()) then
            return
        end
    end
    -- 命令单位走向物品
    IssuePointOrder(GetTriggerUnit(), "move", GetItemX(GetOrderTargetItem()), GetItemY(GetOrderTargetItem()))
    -- 计时器绑定单位和物品
    TimerStart(CreateTimer(), 0.01, true, function()
        local whichUnit = LoadUnitHandle(Hash_TY, GetHandleId(GetExpiredTimer()), 0)
        local whichItem = LoadItemHandle(Hash_TY, GetHandleId(GetExpiredTimer()), 1)
        local distance = LoadReal(Hash_TY, GetHandleId(GetExpiredTimer()), 0)
        local thisDistance = YhDistanceCoordinate(GetUnitX(whichUnit), GetUnitY(whichUnit), GetItemX(whichItem),
                                 GetItemY(whichItem))
        -- 单位远离物品
        if distance <= thisDistance and distance ~= 0 then
            FlushChildHashtable(Hash_TY, GetHandleId(GetExpiredTimer()))
            DestroyTimer(GetExpiredTimer())
        else
            SaveReal(Hash_TY, GetHandleId(GetExpiredTimer()), 0, thisDistance)
        end
        -- 靠近物品马上拾取
        if distance <= 200 and distance ~= 0 then
            Pick_Enter_Actions(whichUnit, whichItem)
            IssueImmediateOrder(whichUnit, "stop")

            FlushChildHashtable(Hash_TY, GetHandleId(GetExpiredTimer()))
            DestroyTimer(GetExpiredTimer())
        end
    end)
end)
for i = 0, 11 do
    TriggerRegisterPlayerUnitEvent(trig, Player(i), EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER, nil)
end
-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
-- frame初始化
local Init_A_Actions = function()
    -- 虚拟物品栏
    DzCreateFrame("BagFrameXuNi", DzGetGameUI(), 0)
    DzFrameShow(DzFrameFindByName("BagFrameXuNi", 0), false)
    DzFrameAbsolutePoint(DzFrameFindByName("BagButtonNum43", 0), 0, 0.516, 0.111)
    ----创建框架
    DzCreateFrame("BagFrame", DzGetGameUI(), 0)
    -- 隐藏背包相关背景
    DzFrameShow(DzFrameFindByName("BagBackdrop", 0), false)
    DzFrameAbsolutePoint(DzFrameFindByName("BagBackdrop", 0), 0, 0.6, 0.50) -- 设置绝对位置
    -- 吸附UI
    DzFrameShow(DzCreateFrame("BagAdsorbBackdrop", DzGetGameUI(), 0), false)
    DzFrameScale(DzFrameFindByName("BagAdsorbBackdrop", 0), 0.87)
    -- 关闭按钮禁用
    DzFrameEnable(DzFrameFindByName("BagButtonX", 0), false)
    -- X按钮 按键触发
    -- DzFrameScriptByCode(DzFrameFindByName("BagButtonX", 0), 1, function OnOff_Keyboard_Actions, false)
    --
    DzFrameAbsolutePoint(DzFrameGetItemBarButton(0), 0, 0.516, 0.111)
    DzFrameAbsolutePoint(DzFrameGetItemBarButton(1), 0, 0.556, 0.111)
    DzFrameAbsolutePoint(DzFrameGetItemBarButton(2), 0, 0.516, 0.073)
    DzFrameAbsolutePoint(DzFrameGetItemBarButton(3), 0, 0.556, 0.073)
    DzFrameAbsolutePoint(DzFrameGetItemBarButton(4), 0, 0.516, 0.035)
    DzFrameAbsolutePoint(DzFrameGetItemBarButton(5), 0, 0.556, 0.035)
end
