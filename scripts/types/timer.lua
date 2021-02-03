local jass = require 'jass.common'

local mt = {}

-- 类型
mt.type = "timer"

-- 计时器句柄
mt.handle = 0

-- 计时器窗口句柄
mt.dia_handle = 0

-- 计时器窗口当前状态：显示 or 隐藏
mt.state = true

-- 计时器列表
mt.listTimer = {}

-- 计时器窗口列表
mt.listDia = {}

-- 新建计时器
function mt.create()
    mt.handle = CreateTimer()
    table.insert(mt.listTimer, mt.handle)
    return mt.handle
end

-- 新建计时器窗口
function mt.createDialog(timer)
    local timer = timer or mt.handle
    mt.dia_handle = CreateTimerDialog(timer)
    table.insert(mt.listDia, mt.dia_handle)
    return mt.dia_handle
end

-- 暂停计时器
function mt.setPause(timer)
    PauseTimer(timer)
end

-- 恢复计时器
function mt.setResume(timer)
    ResumeTimer(timer)
end

-- 摧毁计时器、窗口
function mt.remove(timer, dialog)
    local timer = timer or GetExpiredTimer()
    DestroyTimerDialog(dialog)
    DestroyTimer(timer)
end

-- 一次性计时器
function mt.wait(timeout, code)
    local timer = mt.create()
    TimerStart(timer, timeout, false, function()
        code()
        mt.remove()
    end)
end

-- 循环计时器
function mt.loop(timeout, code)
    TimerStart(mt.create(), timeout, true, code)
end

-- 设置计时器窗口状态：显示 or 隐藏 ps:不可在地图初始化显示
function mt.setDisplay(dialog, state)
    TimerDialogDisplay(dialog, state)
end

-- 设置计时器窗口标题
function mt.setTitle(dialog, title)
    TimerDialogSetTitle(dialog, title)
end

-- 设置计时器窗口颜色
function mt.setDialogColor(dialog, red, green, bule, alpha)
    local dialog = dialog or mt.dia_handle
    local alpha = alpha or 255
    TimerDialogSetTimeColor(dialog, red, green, bule, alpha)
end

-- 创建计时器，计时器窗口 并返回(参：标题、状态)
function mt.new(title, state)
    local t = mt.create()
    local tw = mt.createDialog()
    mt.setTitle(tw, title)
    mt.setDisplay(tw, state)
    return t, tw
end

return mt
