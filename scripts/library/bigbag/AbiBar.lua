-- ***************************************************************************************************************************
-- * 技能栏
-- ******************************************************************
local mt = {}
-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
-- 动作
function FullBuyClick_Actions(whichUnit, whichItem)
    local Sellitems = SubString(GetObjUnitStr(UI_Unit, "Makeitems"), 5 * UI_Num - 5, 5 * UI_Num - 1)
    local tempItem
    UnitRemoveItem(whichUnit, whichItem) -- 丢弃
    IssueNeutralImmediateOrderById(Player(pid), UI_Unit, YDWES2ItemId(Sellitems)) -- 购买物品
    tempItem = UnitItemInSlot(whichUnit, 5)
    UnitRemoveItem(whichUnit, tempItem) -- 丢弃
    Bag1_Pick_Enter_Actions(tempItem) -- 添加进背包
    UnitAddItem(whichUnit, whichItem) -- 给予物品
    -- 刷新UI
    SelectUnit(UI_Unit, false)
    SelectUnit(UI_Unit, true)
    Sellitems = nil
end
-- 鼠标点击：条件
function FullBuyClick_Conditions()
    if UnitInventoryCount(Hero[pid]) == 6 and GetOwningPlayer(UI_Unit) == Player(9) then
        FullBuyClick_Actions(Hero[pid], UnitItemInSlot(Hero[pid], 5))
    end
end
-- 鼠标点击：满格购买
function Init_B_Actions()
    TriggerAddAction(Click, FullBuyClick_Conditions) -- 左键
end
-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
-- 点击
function Click_Actions()
    TriggerExecute(Click)
end
-- 离开
function Leave_Actions()
    UI_Num = -1
end
-- 进入
function Enter_Actions()
    UI_State = "技能栏"
    UI_Num = LoadInteger(UI_Hash, DzF2I(DzGetTriggerUIEventFrame()), 0)
    ActionFrame = DzGetTriggerUIEventFrame()
end

function Init_A_Actions()
    local frame

    for i = 0, 3 do
        for i = 0, 3 do
            if GetLocalPlayer() == GetLocalPlayer() then
                frame = DzFrameGetCommandBarButton(lopA, lopB)
                SaveInteger(UI_Hash, DzF2I(frame), 0, 4 * lopA + lopB + 1) -- 关联序号
                DzFrameSetScriptByCode(frame, 1, Click_Actions, false) -- 鼠标点击
                DzFrameSetScriptByCode(frame, 2, Enter_Actions, false) -- 鼠标进入
                DzFrameSetScriptByCode(frame, 3, Leave_Actions, false) -- 鼠标离开
            end
        end
    end
end
