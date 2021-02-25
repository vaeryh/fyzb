local mt = {}

-- 宽度
mt.width = 0.20

-- 创建1个多面板
function mt:act_A()
    -- 多面板
    gTrg.RegTimerEvent(0.00, false, function()
        mt.dmb = gDmb.new(4, 1, 0.20, '当前信息')
        gDmb.setItemsStyle(mt.dmb, true, false)
        gDmb.setItemsValue(mt.dmb, '0')
        gDmb.setMinimize(mt.dmb, false)
    end)
end

-- 更新文本
function mt:act_E(row, col, tab)
    -- 文本串联
    local text = ''
    for i, v in ipairs(tab) do
        local str = string.format("%s  ", v)
        text = text .. str
    end
    gDmb.setItemValue(mt.dmb, row, col, text)
    -- 长度记录
    if #text * 0.0023 > mt.width then
        mt.width = #text * 0.0023
        gDmb.setItemsWidth(mt.dmb, mt.width)
        gDmb.setMinimize(mt.dmb, true)
        gDmb.setMinimize(mt.dmb, false)
    end
end

-- 施放技能
function mt:act_B()
    gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.SPELL_CAST, function()
        local trgU, trgP = GetTriggerUnit(), GetTriggerPlayer()
        local abiId = GetSpellAbilityId()
        local str = {}
        str[1] = "施法技能"
        str[2] = '施法玩家:' .. GetPlayerName(trgP)
        str[3] = '施法单位:' .. GetUnitName(trgU)
        str[4] = '技能名字:' .. GetObjectName(abiId)
        str[5] = '技能ID:' .. gYh.id2s(abiId)
        mt:act_E(0, 0, str)
    end)
end
-- 伤害
function mt:act_C()
    gTrg.RegAnyUnitDamageEvent(function()
        local trgU, trgP = GetTriggerUnit(), GetTriggerPlayer()
        local source = GetEventDamageSource()
        local str = {}
        str[1] = '受伤玩家:' .. GetPlayerName(trgP)
        str[2] = '受伤单位:' .. GetUnitName(trgU)
        str[3] = '伤害玩家:' .. GetPlayerName(gU.getOwner(source))
        str[4] = '伤害来源:' .. GetUnitName(source)
        str[5] = '伤害值:' .. string.format('%.3f', GetEventDamage())
        mt:act_E(1, 0, str)
    end)
end

-- 选择
function mt:act_D()
    gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.SELECTED, function()
        local trgU, trgP = GetTriggerUnit(), GetTriggerPlayer()
        local str = {}
        str[1] = '触发玩家:' .. GetPlayerName(trgP)
        str[2] = '选择单位:' .. GetUnitName(trgU)
        str[3] = '选择所属:' .. GetPlayerName(gU.getOwner(trgU))
        str[4] = '坐标X:' .. GetUnitX(trgU)
        str[5] = '坐标Y:' .. GetUnitY(trgU)
        mt:act_E(2, 0, str)
    end)
end

function mt:act_F()
    local mouse = require 'library.bags.mouse'
    local op = require 'library.bags.operation'
    gDz.TriggerRegisterMouseMoveEvent(true, function()
        local str = {}
        str[1] = gDz.GetMouseFocus()
        str[2] = mouse.pos
        str[3] = tostring(mouse.solt)
        str[4] = tostring(mouse.item)
        str[5] = tostring(op.adsorb_item)
        str[6] = tostring(op.adsorb_pos)
        str[7] = tostring(op.adsorb_solt)
        mt:act_E(3, 0, str)
    end)
end

-- 初始化
function mt:init()
    mt:act_A()
    mt:act_B()
    mt:act_C()
    mt:act_D()
    --mt:act_F()
end

mt:init()

return mt
