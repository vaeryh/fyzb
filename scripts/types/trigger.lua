-- 触发器相关
local mt = {}

-- 操作码 or 运算符
mt.opcode = {
    -- 小于
    LESS_THAN = LESS_THAN,
    -- 小于或等于
    LESS_THAN_OR_EQUAL = LESS_THAN_OR_EQUAL,
    -- 相等
    EQUAL = EQUAL,
    -- 大于或等于
    GREATER_THAN_OR_EQUAL = GREATER_THAN_OR_EQUAL,
    -- 大于
    GREATER_THAN = GREATER_THAN,
    -- 不等于
    NOT_EQUAL = NOT_EQUAL
}

-- 注册事件
mt.EVENT = {}

-- 玩家单位事件
mt.EVENT.PLAYER_UNIT = {
    -- 玩家单位死亡事件
    DEATH = EVENT_PLAYER_UNIT_DEATH,
    -- 玩家单位选择事件
    SELECTED = EVENT_PLAYER_UNIT_SELECTED,
    -- 玩家单位取消选择事件
    DESELECTED = EVENT_PLAYER_UNIT_DESELECTED,
    -- 准备施放技能
    SPELL_CHANNEL = EVENT_PLAYER_UNIT_SPELL_CHANNEL,
    -- 开始施放技能
    SPELL_CAST = EVENT_PLAYER_UNIT_SPELL_CAST,
    -- 停止施放技能
    SPELL_ENDCAST = EVENT_PLAYER_UNIT_SPELL_ENDCAST,
    -- 发动技能效果
    SPELL_EFFECT = EVENT_PLAYER_UNIT_SPELL_EFFECT,
    -- 施放技能结束
    SPELL_FINISH = EVENT_PLAYER_UNIT_SPELL_FINISH,
    -- 使用物品
    USE_ITEM = EVENT_PLAYER_UNIT_USE_ITEM,
    -- 获得物品
    PICKUP_ITEM = EVENT_PLAYER_UNIT_PICKUP_ITEM,
    -- 丢弃物品
    DROP_ITEM = EVENT_PLAYER_UNIT_DROP_ITEM,
    -- 出售单位
    SELL_UNIT = EVENT_PLAYER_UNIT_SELL,
    -- 出售物品
    SELL_ITEM = EVENT_PLAYER_UNIT_SELL_ITEM,
    -- 抵押物品
    PAWN_ITEM = EVENT_PLAYER_UNIT_PAWN_ITEM
}

-- 单位事件
mt.EVENT.UNIT = {
    -- 接受伤害
    DAMAGED = EVENT_UNIT_DAMAGED,
    -- 被攻击
    ATTACKED = EVENT_UNIT_ATTACKED,
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

-- 句柄
mt.handle = 0

-- 创建触发器
function mt.CreateTrigger()
    mt.handle = CreateTrigger()
    return mt.handle
end

--------------------------------------------------------------

-- 时间事件
function mt.RegTimerEvent(timeout, isloop, code)
    TriggerRegisterTimerEvent(mt.handle, timeout, isloop)
    TriggerAddAction(mt.handle, code)
end

-- 对话框点击事件
function mt.RegDialogEvent(dialog, code)
    if dialog == nil then
        return log.error("注册对话框为空")
    end
    TriggerRegisterDialogEvent(mt.handle, dialog)
    TriggerAddAction(mt.handle, code)
end

-- 对话框按钮点击事件
function mt.RegDialogButtonEvent(dialogButton, code)
    if dialogButton == nil then
        return log.error("注册对话框按钮为空")
    end
    TriggerRegisterDialogButtonEvent(mt.handle, dialogButton)
    TriggerAddAction(mt.handle, code)
end

-- 玩家输入聊天信息事件(true：完全匹配，false：部分匹配)
function mt.RegPlayerChatEvent(p, bol, code)
    TriggerRegisterPlayerChatEvent(mt.handle, p, bol)
    TriggerAddAction(mt.handle, code)
end

-- 玩家单位事件
function mt.RegPlayerUnitEvent(p, playerunitevent, code)
    TriggerRegisterPlayerUnitEvent(mt.handle, p, playerunitevent, nil)
    TriggerAddAction(mt.handle, code)
end

-- 单位事件
function mt.RegUnitEvent(u, unitevent, code)
    TriggerRegisterUnitEvent(mt.handle, u, unitevent)
    TriggerAddAction(mt.handle, code)
end

-- 玩家状态事件
function mt.RegPlayerStateEvent(p, playerstate, opcode, limitval, code)
    TriggerRegisterPlayerStateEvent(mt.handle, p, playerstate, opcode, limitval)
    TriggerAddAction(mt.handle, code)
end

-- 单位状态事件
function mt.RegUnitStateEvent(u, unitstate, opcode, limitval, code)
    TriggerRegisterUnitStateEvent(mt.handle, u, unitstate, opcode, limitval)
    TriggerAddAction(mt.handle, code)
end

--------------------------------------------------------------

return mt
