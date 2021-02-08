local mt = {}

-- 序号
mt.index = {}



---------------------------------------------------------------------------------------------------
-- 左键点击：动作
function DropAdsorb_Actions()
    -- 单位死亡，不能丢弃
    if IsUnitDeadBJ(Hero[pid]) == true then
        Adsorb_Item = nil
    else -- 单位存活，可以丢弃
        gDz.SyncData("DropItem", I2S(GetHandleId(Adsorb_Item)))
        Adsorb_Item = nil
        Bag1_BarItem[UI_Adsorb_Num] = nil
    end
end
-- 左键点击：条件
function DropAdsorb_Conditions()
    if GetLocalPlayer() == GetLocalPlayer() then
        if Adsorb_Item ~= nil and gDz.GetMouseFocus() == 0 then
            DropAdsorb_Actions()
        end
    end
end
-- 鼠标左键点击
function Init_D_Actions()
    TriggerAddAction(Trig_MouseLeftClick, DropAdsorb_Conditions) -- 左键点击：丢弃
end
---------------------------------------------------------------------------------------------------
-- 双击使用
function BagUse_Actions()
    if UnitInventoryCount(Hero[pid]) == 6 then
        DisplayTimedTextToPlayer(gDz.GetTriggerUIEventPlayer(), 0, 0, 5, "|cfffd5724物品栏已满，无法给予！|r")
    else
        Bag1_BarItem[UI_Num] = nil
        gDz.SyncData("GiveItem", I2S(GetHandleId(UI_Item))) -- 同步给予物品
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
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------


return mt
