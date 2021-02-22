local g = require 'jass.globals'
-- 触发器相关
local mt = {}

-- 操作码 or 运算符
OPCODE = {
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
-- mt.EVENT = {}

-- 玩家单位事件
EVENT_PLAYER_UNIT = {
    -- 死亡事件
    DEATH = EVENT_PLAYER_UNIT_DEATH,
    -------------------------------------------
    -- 发布指定物体目标指令
    ISSUED_TARGET_ORDER = EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER,
    -- 发布指定点目标指令
    ISSUED_POINT_ORDER = EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER,
    -- 发布无目标指令
    ISSUED_ORDER = EVENT_PLAYER_UNIT_ISSUED_ORDER,
    -------------------------------------------
    -- 选择事件
    SELECTED = EVENT_PLAYER_UNIT_SELECTED,
    -- 取消选择事件
    DESELECTED = EVENT_PLAYER_UNIT_DESELECTED,
    -------------------------------------------

    -- 学习技能
    HERO_SKILL = EVENT_PLAYER_HERO_SKILL,
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
    -------------------------------------------
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
    -------------------------------------------
    -- 升级
    HERO_LEVEL = EVENT_PLAYER_HERO_LEVEL,
    -- 改变所有者
    CHANGE_OWNER = EVENT_PLAYER_UNIT_CHANGE_OWNER
}

-- 单位事件
EVENT_UNIT = {
    -- 接受伤害
    DAMAGED = EVENT_UNIT_DAMAGED,
    -- 被攻击
    ATTACKED = EVENT_UNIT_ATTACKED,
    -- 单位死亡事件
    DEATH = EVENT_UNIT_DEATH,
    -------------------------------------------
    -- 发布指定物体目标指令
    ISSUED_TARGET_ORDER = EVENT_UNIT_ISSUED_TARGET_ORDER,
    -- 发布指定点目标指令
    ISSUED_POINT_ORDER = EVENT_UNIT_ISSUED_POINT_ORDER,
    -- 发布无目标指令
    ISSUED_ORDER = EVENT_UNIT_ISSUED_ORDER,
    -------------------------------------------
    -- 选择事件
    SELECTED = EVENT_UNIT_SELECTED,
    -- 取消选择事件
    DESELECTED = EVENT_UNIT_DESELECTED,
    -------------------------------------------
    -- 学习技能
    HERO_SKILL = EVENT_UNIT_HERO_SKILL,
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
    -------------------------------------------
    -- 升级
    HERO_LEVEL = EVENT_UNIT_HERO_LEVEL,
    -- 改变所有者
    CHANGE_OWNER = EVENT_UNIT_CHANGE_OWNER
}

-----------------------------------------------------------------------------------------
-- 事件响应
--                                  Unit
-- [GetBuyingUnit]"购买单位"   "响应'出售单位','出售物品'或'抵押物品'单位事件"
-- [GetManipulatingUnit]"操作物品的单位"   "响应'使用/获得/丢失物品'单位事件."
-- [GetSoldUnit]"被贩卖单位"   "响应'出售单位'单位事件."
-- [GetSellingUnit]"贩卖者"  "响应'出售单位','出售物品'或'抵押物品'单位事件."
--                                  item
-- [GetSoldItem] "被售出物品"  "响应'出售物品'或'抵押物品'单位事件."
-- [GetManipulatedItem]"被操作的物品" "响应'使用/得到/丢弃物品'单位事件."
-- [GetOrderTargetItem]"命令发布目标" "响应'发布指定物体目标命令'单位事件并以物品为目标时."
-----------------------------------------------------------------------------------------

-- 触发器列表
mt.listTrigger = {}

-- 重载
function mt:reload()
    for k, v in ipairs(self.listTrigger) do
        mt.listTrigger[k] = nil
        self.remove(v)
    end
    g.yh_Enter = nil
    g.yh_Leave = nil
    log.debug("trg", #self.listTrigger)
end
-- 创建触发器
function mt.create(code)
    local trg = CreateTrigger()
    table.insert(mt.listTrigger, trg)
    if code then
        TriggerAddAction(trg, code)
    end
    return trg
end
-- 获取状态(true:开启)
function mt.getIsEnabled(trg)
    local trg = trg or GetTriggeringTrigger()
    return IsTriggerEnabled(trg)
end

-- 获取触发器运行次数
function mt.getExecCount(trg)
    local trg = trg or GetTriggeringTrigger()
    return GetTriggerExecCount(trg)
end

-- 运行触发器（无视条件）
function mt.call(trg)
    local trg = trg or log.error(trg, '触发器为空')
    TriggerExecute(trg)
end

-- 删除触发器
function mt.remove(trg)
    local trg = trg or GetTriggeringTrigger()
    DestroyTrigger(trg)
end

-- 关闭触发器
function mt.setClose(trg)
    local trg = trg or GetTriggeringTrigger()
    DisableTrigger(trg)
end

-- 开启触发器
function mt.setOpen(trg)
    local trg = trg or GetTriggeringTrigger()
    EnableTrigger(trg)
end
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> +* 注册触发事件 *+ <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

-- 时间事件
function mt.RegTimerEvent(timeout, isloop, code)
    TriggerRegisterTimerEvent(mt.create(code), timeout, isloop)
end

-- 对话框点击事件
function mt.RegDialogEvent(dialog, code)
    local dialog = dialog or orlog.error("注册对话框为空")
    TriggerRegisterDialogEvent(mt.create(code), dialog)
end

-- 对话框按钮点击事件
function mt.RegDialogButtonEvent(dialogButton, code)
    local dialogButton = dialogButton or log.error("注册对话框按钮为空")
    TriggerRegisterDialogButtonEvent(mt.create(code), dialogButton)
end

-- 玩家输入聊天信息事件(true：完全匹配，false：部分匹配)
function mt.RegPlayerChatEvent(p, message, bol, code)
    TriggerRegisterPlayerChatEvent(mt.create(code), p, message, bol)
end

-- 所有玩家输入聊天信息事件
function mt.RegAnyPlayerChatEvent(message, bol, code)
    local trg = mt.create(code)
    for i = 0, 15 do
        TriggerRegisterPlayerChatEvent(trg, Player(i), message, bol)
    end
end
-- 玩家单位事件
function mt.RegPlayerUnitEvent(p, playerunitevent, code)
    TriggerRegisterPlayerUnitEvent(mt.create(code), p, playerunitevent, nil)
end

-- 用户：玩家单位事件
function mt.RegUserPlayerUnitEvent(playerunitevent, code)
    local trg = mt.create(code)
    for i = 0, 11 do
        if gP.isUserPlayer(Player(i)) then
            TriggerRegisterPlayerUnitEvent(trg, Player(i), playerunitevent, nil)
        end
    end
end

-- 任意：玩家单位事件
function mt.RegAnyPlayerUnitEvent(playerunitevent, code)
    local trg = mt.create(code)
    for i = 0, 15 do
        TriggerRegisterPlayerUnitEvent(trg, Player(i), playerunitevent, nil)
    end
    return trg
end

-- 单位事件
function mt.RegUnitEvent(u, unitevent, code)
    TriggerRegisterUnitEvent(mt.create(code), u, unitevent)
end

-- 玩家状态事件
function mt.RegPlayerStateEvent(p, playerstate, opcode, limitval, code)
    TriggerRegisterPlayerStateEvent(mt.create(code), p, playerstate, opcode, limitval)
end

-- 单位状态事件
function mt.RegUnitStateEvent(u, unitstate, opcode, limitval, code)
    TriggerRegisterUnitStateEvent(mt.create(code), u, unitstate, opcode, limitval)
end

-- 注册任意单位进入/离开矩形区域
function mt.RegUnitLeaveOrEnterRegion(string, rect, code)
    local region = CreateRegion()
    -- 添加区域，地区可以看成无数个点和区域的集合体
    gRect.regionAddRect(region, rect)

    if string == "离开区域" then
        TriggerRegisterLeaveRegion(mt.create(code), region, nil)
    end
    if string == "进入区域" then
        TriggerRegisterEnterRegion(mt.create(code), region, nil)
    end
end

-- 进入指定单位范围内
function mt.RegUnitEnterUnitRange(unit, range, code)
    TriggerRegisterUnitInRange(mt.create(code), unit, range, nil)
end

-- 注册任意单位伤害事件
local dam = require 'library.AnyUnitDamagedEvent'
function mt.RegAnyUnitDamageEvent(code)
    dam.SyStemRegistTrigger(mt.create(code))
end
----------------------------------------------------------------------------

-- 是否匹配技能
function mt.isMatchAbiId(id)
    local abi
    if GetSpellAbilityId() ~= 0 then
        abi = GetSpellAbilityId()
    elseif GetLearnedSkill() ~= 0 then
        abi = GetLearnedSkill()
    end
    return abi == gYh.s2id(id)
end

return mt
