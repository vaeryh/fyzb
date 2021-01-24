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

-- 新建计时器
function mt.create()
    mt.handle = CreateTimer()
    return mt.handle
end

-- 新建计时器窗口
function mt.createDialog(timer)
    local timer = timer or mt.handle
    mt.dia_handle = CreateTimerDialog(timer)
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

-- 运行计时器 默认:new、1.00、不循环
function mt.start(timer, timeout, bol, code)
    TimerStart(timer, timeout, bol, code)
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
