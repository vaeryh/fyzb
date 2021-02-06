-- ***************************************************************************************************************************
-- * 背包栏
-- ******************************************************************
local mt = {}
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
        if UI_Adsorb_Num == -1 and UI_State == "背包栏" then
            Adsorb_Actions() -- 背包栏操作
        end
    end
end
-- 右键吸附
function Init_F_Actions()
    TriggerAddAction(Trig_MouseRightClick, Adsorb_Conditions) -- 右键
end
-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
-- 交换物品位置：来自背包
function SwapBagBar_Actions()
    Bag1_BarItem[UI_Num] = BagBar_Adsorb_Item
    Bag1_BarItem[UI_Adsorb_Num] = UI_Item
    UI_Item = BagBar_Adsorb_Item --
    
    BagBar_Adsorb_Item = nil
end
-- 交换物品位置:来自物品栏
function SwapItemBar_Actions()
    UnitRemoveItem(Hero[pid], whichItem) -- 丢弃
    SetItemVisible(whichItem, false) -- 隐藏
    Bag1_BarItem[UI_Num] = whichItem
    Bag1_Add_Conditions(whichItem, UI_Num) -- 判断是否可以叠加

    UnitAddItem(Hero[pid], UI_Item) -- 给予物品
    UnitDropItemSlot(Hero[pid], UI_Item, UI_Adsorb_Num) -- 移动物品到指定序号
    UI_Item = whichItem -- 刷新提示
    
    ItemBar_Adsorb_Item = nil -- 还原
end
-- 左键点击：动作
function SwapAdsorb_Actions()
    -- 交换：来自背包栏
    if BagBar_Adsorb_Item ~= nil then
        SwapBagBar_Actions(BagBar_Adsorb_Item)
    end
    -- 交换：来自物品栏
    if ItemBar_Adsorb_Item ~= nil then
        SwapItemBar_Actions(ItemBar_Adsorb_Item)
    end
end
-- 左键点击：条件
function SwapAdsorb_Conditions()
    if GetLocalPlayer() == GetLocalPlayer() then
        if UI_State == "背包栏" then
            SwapAdsorb_Actions()
        end
    end
end
-- 鼠标左键点击
function Init_E_Actions()
    TriggerAddAction(Trig_MouseLeftClick, SwapAdsorb_Conditions) -- 左键点击：替换
end
-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
-- 左键点击：动作
function DropAdsorb_Actions()
    -- 单位死亡，不能丢弃
    if IsUnitDeadBJ(Hero[pid]) == true then
        Adsorb_Item = nil
    else -- 单位存活，可以丢弃
        DzSyncData("DropItem", I2S(GetHandleId(Adsorb_Item)))
        Adsorb_Item = nil
        Bag1_BarItem[UI_Adsorb_Num] = nil
    end
end
-- 左键点击：条件
function DropAdsorb_Conditions()
    if GetLocalPlayer() == GetLocalPlayer() then
        if Adsorb_Item ~= nil and DzGetMouseFocus() == 0 then
            DropAdsorb_Actions()
        end
    end
end
-- 鼠标左键点击
function Init_D_Actions()
    TriggerAddAction(Trig_MouseLeftClick, DropAdsorb_Conditions) -- 左键点击：丢弃
end
-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
-- 双击使用
function BagUse_Actions()
    if UnitInventoryCount(Hero[pid]) == 6 then
        DisplayTimedTextToPlayer(DzGetTriggerUIEventPlayer(), 0, 0, 5, "|cfffd5724物品栏已满，无法给予！|r")
    else
        Bag1_BarItem[UI_Num] = nil
        DzSyncData("GiveItem", I2S(GetHandleId(UI_Item))) -- 同步给予物品
        UI_Item = nil
    end
end
-- 判断使用类型：鼠标处于背包内双击
function BagUse_Conditions()
    if UI_Adsorb_Num == -1 and UI_Item ~= nil then
        BagUse_Actions()
    end
end
--
function Init_C_Actions()
    TriggerAddAction(DoubleClick, BagUse_Conditions) -- 左键
end
-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
function BagUseEffect_Timer_Actions()
    if Mouse_State_Left == true or Mouse_State_Right == true then
        DzFrameSetScale(ClickFrame, 0.96)
    else
        DzFrameSetScale(ClickFrame, 1.00)
        DestroyTimer(GetExpiredTimer())
    end
end
-- 动作
function MouseLeftClick_Actions()
    local integer
    father = S2I(SubString(DzFrameGetName(DzGetMouseFocus()), 12, 13))
    local integer
    child = S2I(SubString(DzFrameGetName(DzGetMouseFocus()), 13, 14))
    ClickFrame = DzFrameFindByName("BagGridNum" + I2S(father) + I2S(child), 0)
    DzFrameSetScale(ClickFrame, 0.96)
    TimerStart(CreateTimer(), 0.1, true, BagUseEffect_Timer_Actions)
end
-- 鼠标左键点击：条件
function MouseLeftClick_Conditions()
    if GetLocalPlayer() == GetLocalPlayer() and UI_State == "背包栏" then
        if UI_Item ~= nil and UI_Adsorb_Num == -1 then
            MouseLeftClick_Actions()
        end
    end
end
-- 鼠标按下使用微缩效果
function Init_B_Actions()
    TriggerAddAction(Trig_MouseLeftClick, MouseLeftClick_Conditions)
    -- TriggerAddAction(Trig_MouseRightClick, function MouseLeftClick_Conditions)
end
-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
-- 双击
function DoubleClick_Actions()
    TriggerExecute(DoubleClick)
end
-- 点击
function Click_Actions()
    -- TriggerExecute(Click)
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
    UI_State = "背包栏"
    UI_Num = LoadInteger(UI_Hash, DzF2I(DzGetTriggerUIEventFrame()), 0)
    UI_Item = Bag1_BarItem[UI_Num]
    if UI_Item ~= nil then
        TriggerExecute(UI_Enter)
        DzFrameClearAllPoints(DzFrameGetTooltip())
        DzFrameSetPoint(DzFrameGetTooltip(), 8, DzGetGameUI(), 8, 0.8, 0.6)
    end
end
---------------------------------------------------------------------------------------
function Init_A_Actions()
    local frame

    for i = 1, 7 do
        for i = 1, 6 do
            if GetLocalPlayer() == GetLocalPlayer() then
                frame = DzFrameFindByName("BagButtonNum" + I2S(lopA) + I2S(lopB), 0)
                SaveInteger(UI_Hash, DzF2I(frame), 0, 6 * lopA + lopB - 6) -- 关联序号
                -- DzFrameSetScriptByCode(frame, 1, function Click_Actions, false)--鼠标点击
                DzFrameSetScriptByCode(frame, 2, Enter_Actions, false) -- 鼠标进入
                DzFrameSetScriptByCode(frame, 3, Leave_Actions, false) -- 鼠标离开
                DzFrameSetScriptByCode(frame, 12, DoubleClick_Actions, false) -- 鼠标双击
            end
        end
    end
end
