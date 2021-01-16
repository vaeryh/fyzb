-- 触发器相关
local mt = {}

-- 创建触发器
function mt.createTrigger(call_back)
    local trg = CreateTrigger()
    TriggerAddAction(trg, call_back)
    return trg
end

--运行触发器（无视条件）
function mt.call(trg)
    TriggerExecute( trg )
end


-- 删除触发器
function mt.remove(trg)
    local trg = trg or GetTriggeringTrigger()
    DestroyTrigger(trg)
end

-- 添加触发器动作
function mt.addActions(trg, code)
    TriggerAddAction(trg, code)
end

-- 添加触发器条件
function mt.addContions(trg, code)
    TriggerAddCondition(trg, Condition(code))
end

-- 时间-当游戏逝去0.00秒,可循环
function mt.regTimeEvent(timeout, isloop, code)
    local trg = CreateTrigger()
    TriggerRegisterTimerEvent(trg, timeout, isloop)
    TriggerAddAction(trg, code)
    return trg
end

local debug = require 'jass.debug'
-- 注册对话框事件
function mt.regDialogEvent(dialog, code)
    debug.handle_ref(dialog)
    if dialog == nil then
        return log.error("注册对话框为空")
    end
    local trg = CreateTrigger()
    TriggerRegisterDialogEvent(trg, dialog)
    TriggerAddAction(trg, code)
    return trg
end

return mt
