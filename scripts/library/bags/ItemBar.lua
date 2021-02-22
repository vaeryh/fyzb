-- ***************************************************************************************************************************
-- * 物品栏
-- ******************************************************************
local bagBar = require 'library.bags.frame'

local mt = {}

-- 物品栏吸附 获取原生吸附物品、序号
function mt.Init_B()
    -- 吸附物品
    mt.adsorb_item = nil
    -- 吸附序号
    mt.adsorb_index = -1
    -- 右键吸附 释放时
    gDz.TriggerRegisterMouseEvent(2, 0, true, function()
        -- 处于背包才触发
        if mt.state == "离开" then
            return
        end
        -- 在空白处右键，会结束吸附状态
        if gDz.GetMouseFocus() == 0 then
            mt.adsorb_item = nil
            printF("结束吸附状态，吸附物品置于空")
            return
        end
        -- 记录吸附
        mt.adsorb_item = mt.item
        mt.adsorb_index = gDz.getItemBarSolt()
        printF(mt.adsorb_item, mt.adsorb_index)
    end)
    -- 只要发生移动物品栏事件，就重置吸附
    gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.ISSUED_TARGET_ORDER, function()
        if GetIssuedOrderId() >= 852002 and GetIssuedOrderId() <= 852007 then
            local item = GetOrderTargetItem()
            if GetTriggerPlayer() == GetLocalPlayer() then
                mt.adsorb_item = nil
                printF("物品栏内部移动，吸附物品置空")
            end
        end
    end)
end

function mt.Init_C()
    -- 鼠标左键点击：交换
    gDz.TriggerRegisterMouseEvent(1, 0, true, function()
        -- 处于背包才触发
        if mt.state == "离开" then
            return
        end
        local p = gDz.GetTriggerKeyPlayer()
        -- 交换物品位置：来自背包
        if bagBar.adsorb_item then
            -- setp1:丢弃物品栏的物品（如果有）
            gIt.drop(Hero[p], mt.item)
            -- bagBar.PickEnterBag(mt.item, p)
            mt.item = nil
            -- setp2:给与单位背包物品
            gIt.moveUnitSlot(Hero[p], bagBar.adsorb_item, gDz.getItemBarSolt())
            bagBar.adsorb_item, bagBar[p][bagBar.adsorb_index] = bagBar[p][bagBar.adsorb_index], bagBar.adsorb_item
        end
    end)
end

---------------------------------------------------------------------------------------

-- 背包装备提示
function mt.Init_A()
    -- 状态
    mt.state = "离开"
    -- 鼠标指向物品
    mt.item = nil
    -- 鼠标动作
    gDz.RegMouseItemBarAction("进入", function()
        mt.state = "进入"
        local p = gDz.GetTriggerUIEventPlayer()
        mt.item = gIt.getUnitInSlot(Hero[p], gDz.getItemBarSolt())
        if mt.item ~= 0 and mt.item then
            bagBar.bagTip(mt.item)
        end
        -- 隐藏原生提示
        gDz.FrameClearAllPoints(gDz.FrameGetTooltip())
        gDz.FrameSetPoint(gDz.FrameGetTooltip(), 8, gDz.GetGameUI(), 8, 0.8, 0.6)
    end)
    gDz.RegMouseItemBarAction("离开", function()
        mt.state = "离开"
        mt.item = nil
        gDz.FrameShow(bagBar.showBack, false)
        -- 恢复原生提示
        gDz.FrameClearAllPoints(gDz.FrameGetTooltip())
        gDz.FrameSetPoint(gDz.FrameGetTooltip(), 7, gDz.GetGameUI(), 4, 0.28, -0.13)
    end)
end

-- 注册
function mt.Init()
    mt.Init_A()
    mt.Init_B()
    mt.Init_C()
end

mt.Init()

return mt
