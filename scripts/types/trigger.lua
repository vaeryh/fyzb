-- 触发器相关
local mt = {}

-- 事件
mt.EVENT = {}

-- 玩家单位事件
mt.EVENT.PLAYER = {
    -- 玩家单位死亡事件
    UNIT_DEATH = EVENT_PLAYER_UNIT_DEATH,
    -- 玩家单位选择事件
    UNIT_SELECTED = EVENT_PLAYER_UNIT_SELECTED,
    -- 玩家单位取消选择事件
    UNIT_DESELECTED = EVENT_PLAYER_UNIT_DESELECTED,
    -- 准备施放技能
    SPELL_CHANNEL = EVENT_PLAYER_UNIT_SPELL_CHANNEL,
    -- 开始施放技能
    SPELL_CAST = EVENT_PLAYER_UNIT_SPELL_CAST,
    -- 停止施放技能
    SPELL_ENDCAST = EVENT_PLAYER_UNIT_SPELL_ENDCAST,
    -- 发动技能效果
    SPELL_EFFECT = EVENT_PLAYER_UNIT_SPELL_EFFECT,
    -- 施放技能结束
    SPELL_FINISH = EVENT_PLAYER_UNIT_SPELL_FINISH
}

-- 单位事件
mt.EVENT.UNIT = {
    -- 单位死亡事件
    DEATH = EVENT_UNIT_DEATH,
    -- 准备施放技能
    SPELL_CHANNEL = EVENT_UNIT_SPELL_CHANNEL,
    -- 开始施放技能
    SPELL_CAST = EVENT_UNIT_SPELL_CAST,
    -- 停止施放技能
    SPELL_ENDCAST = EVENT_UNIT_SPELL_ENDCAST,
    -- 发动技能效果
    SPELL_EFFECT = EVENT_UNIT_SPELL_EFFECT,
    -- 施放技能结束
    SPELL_FINISH = EVENT_UNIT_SPELL_FINISH
}

-- 创建触发器
function mt.createTrigger(call_back)
    local trg = CreateTrigger()
    TriggerAddAction(trg, call_back)
    return trg
end

-- 运行触发器（无视条件）
function mt.call(trg)
    if trg == nil then
        log.error('触发器为空')
    end
    TriggerExecute(trg)
end

-- 删除触发器
function mt.remove(trg)
    local trg = trg or GetTriggeringTrigger()
    DestroyTrigger(trg)
end

-- 添加
mt.add = {
    -- 动作
    Actions = function(trg, code)
        TriggerAddAction(trg, code)
    end,
    -- 条件
    Contions = function(trg, code)
        TriggerAddCondition(trg, Condition(code))
    end
}
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

-- 注册玩家事件
function mt.regPlayerEvent(trg, player, event)
    TriggerRegisterPlayerUnitEvent(trg, player, event, nil)
end

-- 注册对话框事件
function mt.regDialogEvent(dialog, code)
    if dialog == nil then
        return log.error("注册对话框为空")
    end
    local trg = CreateTrigger()
    TriggerRegisterDialogEvent(trg, dialog)
    TriggerAddAction(trg, code)
    return trg
end

-- 注册对话框按钮事件
function mt.regDialogButtonEvent(dialogButton, code)
    if dialogButton == nil then
        return log.error("注册对话框按钮为空")
    end
    local trg = CreateTrigger()
    TriggerRegisterDialogButtonEvent(trg, dialogButton)
    TriggerAddAction(trg, code)
    return trg
end

-- 注册
mt.reg = {
    -- 时间事件
    TimerEvent = function(trg, timeout, isloop)
        TriggerRegisterTimerEvent(trg, timeout, isloop)
    end,
    -- 对话框点击事件
    DialogEvent = function(trg, dialog)
        TriggerRegisterDialogEvent(trg, dialog)
    end,
    -- 对话框按钮点击事件
    DialogButtonEvent = function(trg, dialogButton)
        TriggerRegisterDialogButtonEvent(trg, dialogButton)
    end,
    -- 注册玩家事件
    PlayerEvent = function(trg, player, event)
        TriggerRegisterPlayerUnitEvent(trg, player, event, nil)
    end
}

return mt
