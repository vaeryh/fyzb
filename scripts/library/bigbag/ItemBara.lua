-- ***************************************************************************************************************************
-- * 物品栏
-- ******************************************************************
local mt = {}
-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
-- 吸附计时器:背包
function Adsorb_Timer_Actions()
    local x = 0.80 * (I2R(DzGetMouseXRelative()) / I2R(DzGetWindowWidth()))
    local y = 0.60 - (0.60 * (I2R(DzGetMouseYRelative()) / I2R(DzGetWindowHeight())))
    local AdsorbFrame = DzFrameFindByName("BagAdsorbBackdrop", 0)
    -- 是否持续吸附判断
    if Adsorb_Item == nil then
        UI_Adsorb_Num = -1 -- 还原
        DzFrameShow(AdsorbFrame, false)
        DestroyTimer(GetExpiredTimer())
    else
        DzFrameShow(AdsorbFrame, true)
        DzFrameSetTexture(AdsorbFrame, GetObjItemStr(Adsorb_Item, "Art"), 0)
        DzFrameSetAbsolutePoint(AdsorbFrame, 4, x, y)
    end
end
-- 鼠标右键点击：动作
function Adsorb_Actions()
    if UI_Item ~= nil then
        Adsorb_Item = UI_Item -- 中间暂时保存

        UI_Adsorb_Num = UI_Num -- 记录背包序号

        TimerStart(CreateTimer(), 0.01, true, Adsorb_Timer_Actions)
    end
end
-- 鼠标右键点击：条件
function Adsorb_Conditions()
    if DzGetTriggerKeyPlayer() == GetLocalPlayer() then
        -- 在空白处右键，会结束吸附状态
        if DzGetMouseFocus() == 0 then
            Adsorb_Item = nil
        end
        -- 不处于吸附状态，且鼠标处于背包
        if UI_Adsorb_Num == -1 and UI_State == "物品栏" then
            Adsorb_Actions() -- 背包栏操作
        end
    end
end
-- 右键吸附
function Init_D_Actions()
    TriggerAddAction(Trig_MouseRightDisClick, Adsorb_Conditions) -- 右键
end
-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
-- 交换物品位置：来自背包
function SwapBagBar_Actions(whichItem)
    UnitRemoveItem(Hero[pid], whichItem) -- 丢弃
    SetItemVisible(whichItem, false) -- 隐藏
    Bag1_BarItem[UI_Adsorb_Num] = whichItem
    Bag1_Add_Conditions(whichItem, UI_Adsorb_Num) -- 判断是否可以叠加

    UnitAddItem(Hero[pid], BagBar_Adsorb_Item) -- 给予物品
    UnitDropItemSlot(Hero[pid], BagBar_Adsorb_Item, UI_Num) -- 移动物品到当前序号

    UI_Item = BagBar_Adsorb_Item -- 刷新提示

    BagBar_Adsorb_Item = nil -- 还原
end
-- 交换物品位置:来自物品栏
function SwapItemBar_Actions(whichItem)
    UnitDropItemSlot(Hero[pid], whichItem, UI_Num)
    UnitDropItemSlot(Hero[pid], UI_Item, UI_Adsorb_Num) -- 移动物品到指定序号
    UI_Item = whichItem -- 刷新提示

    ItemBar_Adsorb_Item = nil -- 还原
end
-- 左键点击：动作
function SwapAdsorb_Actions()
    -- 交换：来自物品栏
    if ItemBar_Adsorb_Item ~= nil then
        SwapItemBar_Actions(ItemBar_Adsorb_Item)
    end
    -- 交换：来自背包栏
    if BagBar_Adsorb_Item ~= nil then
        SwapBagBar_Actions(UI_Item)
    end
end
-- 左键点击：条件
function Swap_Conditions()
    if GetLocalPlayer() == GetLocalPlayer() then
        if UI_State == "物品栏" then
            SwapAdsorb_Actions()
        end
    end
end
-- 鼠标左键点击：交换
function Init_C_Actions()
    TriggerAddAction(Trig_MouseLeftDisClick, Swap_Conditions)
end
-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
-- 指定物体命令：动作
function MoveItem_Actions()
    -- 只要发生移动物品栏事件，就重置吸附
    if GetTriggerPlayer() == GetLocalPlayer() then
        UI_Item = GetOrderTargetItem()
        Adsorb_Item = nil
    end
end
-- 指定物体命令：条件
function MoveItem_Conditions()
    return GetIssuedOrderId() >= YDWEIOrderId2OrderId(852002) and GetIssuedOrderId() <= YDWEIOrderId2OrderId(852007)
end
-- 指定物体命令：触发
function Init_B_Actions()
    RegUserPlayerUnitEvent(Condition(MoveItem_Conditions), MoveItem_Actions, EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER)
end
---------------------------------------------------------------------------------------
-- 点击：抬起生效
function Click_Actions()
    if DzK2I(DzGetTriggerKey()) == 2 then -- 右键
        -- Adsorb_Conditions( )
    end
end
-- 离开
function Leave_Actions()
    UI_State = "离开"
    UI_Num = -1
    UI_Item = nil
    TriggerExecute(UI_Leave)
    DzFrameClearAllPoints(DzFrameGetTooltip())
    DzFrameSetPoint(DzFrameGetTooltip(), 7, DzGetGameUI(), 4, 0.28, -0.13)
end
-- 进入
function Enter_Actions()
    UI_State = "物品栏"
    UI_Num = LoadInteger(UI_Hash, DzF2I(DzGetTriggerUIEventFrame()), 0)
    UI_Item = UnitItemInSlot(UI_Unit, UI_Num)

    if UnitItemInSlot(UI_Unit, UI_Num) ~= nil then
        TriggerExecute(UI_Enter)
    end
    DzFrameClearAllPoints(DzFrameGetTooltip())
    DzFrameSetPoint(DzFrameGetTooltip(), 8, DzGetGameUI(), 8, 0.8, 0.6)
end
-- 注册
function Init_A_Actions()
    local frame
    -- 设置物品栏
    for i = 0, 5 do
        frame = DzFrameGetItemBarButton(lopA)
        SaveInteger(UI_Hash, DzF2I(frame), 0, lopA) -- 关联序号

        if GetLocalPlayer() == GetLocalPlayer() then
            DzFrameSetScriptByCode(frame, 1, Click_Actions, false) -- 鼠标点击
            DzFrameSetScriptByCode(frame, 2, Enter_Actions, false) -- 鼠标进入
            DzFrameSetScriptByCode(frame, 3, Leave_Actions, false) -- 鼠标离开
            -- DzFrameSetScriptByCode(frame, 12, function DoubleClick_Actions, false)--鼠标双击
        end
    end

    -- 设置模拟物品栏
    for i = 1, 6 do
        frame = DzFrameFindByName("BagButtonNum0" + I2S(lopA), 0)
        SaveInteger(UI_Hash, DzF2I(frame), 0, lopA - 1) -- 关联序号

        if GetLocalPlayer() == GetLocalPlayer() then
            DzFrameSetScriptByCode(frame, 2, Enter_Actions, false) -- 鼠标进入
            DzFrameSetScriptByCode(frame, 3, Leave_Actions, false) -- 鼠标离开
        end
    end
end

return mt
