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
mt.EVENT_PLAYER_UNIT = {
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
    PAWN_ITEM = EVENT_PLAYER_UNIT_PAWN_ITEM,
    -- 升级
    HERO_LEVEL=EVENT_PLAYER_HERO_LEVEL,
}

-- 单位事件
mt.EVENT_UNIT = {
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
    SPELL_FINISH = EVENT_UNIT_SPELL_FINISH,
    --升级
    HERO_LEVEL=EVENT_UNIT_HERO_LEVEL,
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

--------------------------------------------------------------

-- 时间事件
function mt.RegTimerEvent(timeout, isloop, code)
    local trg = CreateTrigger()
    TriggerRegisterTimerEvent(trg, timeout, isloop)
    TriggerAddAction(trg, code)
end

-- 对话框点击事件
function mt.RegDialogEvent(dialog, code)
    if dialog == nil then
        return log.error("注册对话框为空")
    end
    local trg = CreateTrigger()
    TriggerRegisterDialogEvent(trg, dialog)
    TriggerAddAction(trg, code)
end

-- 对话框按钮点击事件
function mt.RegDialogButtonEvent(dialogButton, code)
    if dialogButton == nil then
        return log.error("注册对话框按钮为空")
    end
    local trg = CreateTrigger()
    TriggerRegisterDialogButtonEvent(trg, dialogButton)
    TriggerAddAction(trg, code)
end

-- 玩家输入聊天信息事件(true：完全匹配，false：部分匹配)
function mt.RegPlayerChatEvent(p, message, bol, code)
    local trg = CreateTrigger()
    TriggerRegisterPlayerChatEvent(trg, p, message, bol)
    TriggerAddAction(trg, code)
end

-- 玩家单位事件
function mt.RegPlayerUnitEvent(p, playerunitevent, code)
    local trg = CreateTrigger()
    TriggerRegisterPlayerUnitEvent(trg, p, playerunitevent, nil)
    TriggerAddAction(trg, code)
end

-- 单位事件
function mt.RegUnitEvent(u, unitevent, code)
    local trg = CreateTrigger()
    TriggerRegisterUnitEvent(trg, u, unitevent)
    TriggerAddAction(trg, code)
end

-- 玩家状态事件
function mt.RegPlayerStateEvent(p, playerstate, opcode, limitval, code)
    local trg = CreateTrigger()
    TriggerRegisterPlayerStateEvent(trg, p, playerstate, opcode, limitval)
    TriggerAddAction(trg, code)
end

-- 单位状态事件
function mt.RegUnitStateEvent(u, unitstate, opcode, limitval, code)
    local trg = CreateTrigger()
    TriggerRegisterUnitStateEvent(trg, u, unitstate, opcode, limitval)
    TriggerAddAction(trg, code)
end

-- 注册键盘key事件
function mt.RegKeyEventByCode(btnStr, status, act)
    local key
    if type(btnStr) == 'string' then
        key = require'jass.message'.keyboard[btnStr]
    elseif type(btnStr) == 'number' then
        key = btnStr
    end
    -- sync：运行触发器则true，不运行则false，与同步异步无关
    -- 只能同步，异步不生效，可能是因为message已经本地注册过了
    local trg = CreateTrigger()
    gDz.TriggerRegisterKeyEventByCode(trg, key, status, true, nil)
    TriggerAddAction(trg, act)
end

--------------------------------------------------------------

return mt
