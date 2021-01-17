local jass = require 'jass.common'
local g = require 'jass.globals'
local unit = require 'types.unit'
local timer = require 'types.timer'
local rect = require 'types.rect'
local trg = require 'types.trigger'
local yh = require 'types.yh'

local mt = {}

-- 当前波数
mt.bs = 1

-- 每波最大数量
mt.countMax = 10

-- 当前计数
mt.count = 0

-- 发兵区域
mt.atkRect = jass.gg_rct_AttackLine1

-- 每波间隔时间
mt.delay = 10.00

-- 准备时间
mt.ready = 10.00

-- 1游戏开始0秒，开始游戏倒计时60秒（即游戏准备时间）
trg.regTimeEvent(0.00, false, function()
    local t, tw = timer.new("准备时间倒计时", true)
    TimerStart(t, mt.ready, false, function()
        mt.AtkDelay()
        timer.remove(t, tw)
    end)
    trg.remove()
end)

-- 2倒计时60秒到期，开始第一波倒计时120秒（每波固定时间）
function mt.AtkDelay()
    local t, tw = timer.new("第1波进攻倒计时", true)
    -- 3第N波倒计时到期
    TimerStart(t, mt.delay, true, function()
        timer.setTitle(tw, "第" .. tostring(mt.bs) .. "波进攻倒计时")
        -- Player(11)玩家12,忽略玩家单位警戒点，不想家
        RemoveAllGuardPositions(Player(11))
        mt.BrushUp()
        timer.remove(t, tw)
    end)
end

-- 刷bs波的兵
function mt.BrushUp()
    local x, y = rect.getCenter(mt.atkRect)
    local id = string.format('at' .. "%02d", mt.bs)
    TimerStart(timer.create(), 3.00, true, function()
        local g = {}
        local t = timer.create()
        g[t] = {}
        g[t][1] = unit.create(Player(11), id, x, y, 270)
        -- 发布进攻命令
        IssuePointOrder(g[t][1], "attack", 0, 0)
        -- 单位绑定计时器
        TimerStart(t, 3.00, true, function()
            local t = GetExpiredTimer()
            local u1 = g[t][1]
            local distance = g[t][2] or 0
            -- 单位死亡，清除数据
            if unit:is_alive(u1) then
                timer.remove()
            end
            -- 初次赋值
            -- 单位远离基地，发布攻击命令
            if distance <= yh.distanceXY(unit.getX(u1), unit.getX(u1), 0, 0) then
                IssuePointOrder(u1, "attack", 0, 0)
            else
                g[t][2] = yh.distanceXY(unit.getX(u1), unit.getX(u1), 0, 0)
            end
        end)
        -- 计算刷兵数量
        if mt.count >= mt.countMax then
            mt.bs = mt.bs + 1 -- 波数增加1
            mt.count = 0 -- 重置计数
            timer.remove()
            mt.AtkDelay()
        end
        mt.count = mt.count + 1
    end)
end
