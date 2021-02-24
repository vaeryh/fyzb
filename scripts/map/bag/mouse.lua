local frame = require 'map.bag.frame'

local mt = {}

-- 槽位号
mt.solt = -1
-- 位置
mt.pos = "空"
-- 指向物品
mt.item = nil

-- 原生物品栏
function mt.Init_A()
    local solt = {}
    for i = 0, 5 do
        local v = gDz.FrameGetItemBarButton(i)
        solt[v] = i
        -- 显示提示
        gDz.TriggerRegisterUIEvent(v, 2, function()
            mt.solt = solt[gDz.GetTriggerUIEventFrame()]
            mt.pos = "物品栏"
            --
            local p = gDz.GetTriggerUIEventPlayer()
            mt.item = gIt.getUnitInSlot(Hero[p], mt.solt)
            mt.Init_E(mt.item)
            -- 隐藏原生提示
            gDz.FrameClearAllPoints(gDz.FrameGetTooltip())
            gDz.FrameSetPoint(gDz.FrameGetTooltip(), 8, gDz.GetGameUI(), 8, 0.8, 0.6)
        end)
        -- 关闭提示
        gDz.TriggerRegisterUIEvent(v, 3, function()
            mt.solt = nil
            mt.pos = "离开"
            mt.item = nil
            --
            gDz.FrameShow(frame.showBack, false)
            -- 恢复原生提示
            gDz.FrameClearAllPoints(gDz.FrameGetTooltip())
            gDz.FrameSetPoint(gDz.FrameGetTooltip(), 7, gDz.GetGameUI(), 4, 0.28, -0.13)
        end)
    end
end

-- 原生技能栏
function mt.Init_B()
    local solt = {}
    for i = 0, 2 do
        for j = 0, 3 do
            local v = gDz.FrameGetCommandBarButton(i, j)
            solt[v] = 4 * i + j + 1
            -- 显示提示
            gDz.TriggerRegisterUIEvent(v, 2, function()
                mt.solt = solt[gDz.GetTriggerUIEventFrame()]
                mt.pos = "技能栏"
            end)
            -- 关闭提示
            gDz.TriggerRegisterUIEvent(v, 3, function()
                mt.solt = nil
                mt.pos = "离开"
            end)
        end
    end
end

-- 背包栏
function mt.Init_C()
    local solt = {}
    -- 注册
    for i, v in ipairs(frame.but) do
        solt[v] = i
        -- 显示提示
        gDz.TriggerRegisterUIEvent(v, 2, function()
            mt.solt = solt[gDz.GetTriggerUIEventFrame()]
            mt.pos = "背包栏"
            --
            local op = require 'library.bags.operation'
            local p = gDz.GetTriggerUIEventPlayer()
            mt.item = op[p][mt.solt]
            mt.Init_E(mt.item)
        end)
        -- 关闭提示
        gDz.TriggerRegisterUIEvent(v, 3, function()
            mt.solt = nil
            mt.pos = "离开"
            mt.item = nil
            --
            gDz.FrameShow(frame.showBack, false)
        end)
    end
end

-- 虚拟物品栏
function mt.Init_D()
    local solt = {}
    for i = 0, 5 do
        local v = frame.xnBut[i]
        solt[v] = i
        -- 显示提示
        gDz.TriggerRegisterUIEvent(v, 2, function()
            mt.solt = solt[gDz.GetTriggerUIEventFrame()]
            mt.pos = "虚拟物品栏"
            --
            local p = gDz.GetTriggerUIEventPlayer()
            mt.item = gIt.getUnitInSlot(Hero[p], mt.solt)
            mt.Init_E(mt.item)
        end)
        -- 关闭提示
        gDz.TriggerRegisterUIEvent(v, 3, function()
            mt.solt = nil
            mt.pos = "离开"
            mt.item = nil
            --
            gDz.FrameShow(frame.showBack, false)
        end)
    end
end

-- 设置背包物品提示
function mt.Init_E(item)
    if item then
        local zb = require 'map.equip.common.zb'
        local tab = zb:inherit(item)
        local text = ''
        for k, v in pairs(tab) do
            text = text .. v.tip .. '\n'
        end
        gDz.FrameSetText(frame.title, GetItemName(item))
        gDz.FrameSetText(frame.showText2, text)
        gDz.FrameSetText(frame.showText4, gIt.getDataString(item, ITEM_DATA.UBERTIP))
        gDz.FrameShow(frame.showBack, true)
    end
end

function mt.Init()
    mt.Init_A()
    mt.Init_B()
    mt.Init_C()
    mt.Init_D()
end

mt.Init()

return mt
