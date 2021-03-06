local map = require 'map.global'

local mt = {}

-- 发兵矩形
mt.brushRect = map.rect['发兵矩形1']

-- 当前波数
mt.bs = 1

-- 每波最大数量
mt.countMax = 10

-- 当前计数
mt.count = 0

-- 刷兵计时器
mt.brushT = gT.create()

-- 刷兵计时器窗口
mt.brushTw = gT.createDialog(mt.brushT)

-- 每波间隔时间
mt.delay = 15.00

-- 准备时间
mt.ready = 10.00

-- 1游戏开始0秒，开始游戏倒计时60秒（即游戏准备时间）
gTrg.RegTimerEvent(0.00, false, function()
    gT.setTitle(mt.brushTw, "准备时间倒计时")
    gT.setDisplay(mt.brushTw, true)

    TimerStart(mt.brushT, mt.ready, false, function()
        mt.AtkDelay()
    end)
    gTrg.remove()
end)

-- 2倒计时60秒到期，开始第一波倒计时120秒（每波固定时间）
function mt.AtkDelay()
    gT.setTitle(mt.brushTw, "第1波进攻倒计时")
    -- 3第N波倒计时到期
    TimerStart(mt.brushT, mt.delay, true, function()
        gT.setTitle(mt.brushTw, "第" .. tostring(mt.bs) .. "波进攻倒计时")
        -- Player(11)玩家12,忽略玩家单位警戒点，不想家
        RemoveAllGuardPositions(Player(11))
        mt.BrushStart()
    end)
end

-- 刷bs波的兵
function mt.BrushStart()
    local x, y = gRect.getCenter(mt.brushRect)
    local id = string.format('at' .. "%02d", mt.bs)
    TimerStart(gT.create(), 1.00, true, function()
        local g = {}
        local t = gT.create()
        g[t] = {}
        g[t][1] = gU.create(Player(11), id, x, y, 270)
        -- 发布进攻命令
        IssuePointOrder(g[t][1], "attack", 0, 0)
        -- 单位绑定计时器
        TimerStart(t, 3.00, true, function()
            local t = GetExpiredTimer()
            local u1 = g[t][1]
            local distance = g[t][2] or 0
            -- 单位死亡，清除数据
            if gU:is_alive(u1) then
                gT.remove()
            end
            -- 单位远离基地，发布攻击命令
            if distance <= gYh.distanceXY(gU.getX(u1), gU.getY(u1), 0, 0) then
                IssuePointOrder(u1, "attack", 0, 0)
            else
                g[t][2] = gYh.distanceXY(gU.getX(u1), gU.getY(u1), 0, 0)
            end
        end)
        -- 计算刷兵数量
        if mt.count >= mt.countMax then
            mt.bs = mt.bs + 1 -- 波数增加1
            mt.count = 0 -- 重置计数
            gT.remove()
        end
        mt.count = mt.count + 1
    end)
end

-- 暂停刷兵计时器
function mt.Pause_Actions()
    local t, tw = gT.new("停怪倒计时", true)
    gT.setPause(mt.brushT)
    TimerStart(t, 180.00, false, function()
        gT.setResume(mt.brushT)
        gT.remove(t, tw)
    end)
end

return mt
