local mt = {}

-- 宽度
mt.width = 0.20
-- 创建1个多面板
function mt:act_A()
    -- 多面板
    gTrg.RegTimerEvent(0.00, false, function()
        self.dmb = gDmb.new(4, 1, 0.20, '当前信息')
        gDmb.setItemsStyle(self.dmb, true, false)
        gDmb.setItemsValue(self.dmb, '0')
        gDmb.setMinimize(self.dmb, false)
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
    gDmb.setItemValue(self.dmb, row, col, text)
    -- 长度记录
    if #text * 0.0023 > self.width then
        self.width = #text * 0.0023
        gDmb.setItemsWidth(self.dmb, self.width)
        gDmb.setMinimize(self.dmb, true)
        gDmb.setMinimize(self.dmb, false)
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
        self:act_E(0, 0, str)
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
        self:act_E(1, 0, str)
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
        self:act_E(2, 0, str)
    end)
end

function mt:act_F()
    local str = {}
    gDz.TriggerRegisterMouseMoveEvent(true, function()
        if gDz.GetMouseFocus() ~= 0 then
            str[1] = gDz.GetMouseFocus()
            self:act_E(3, 0, str)
        end
    end)
    gDz.RegMouseItemBarAction("进入", function()
        local p = gDz.GetTriggerUIEventPlayer()
        str[2] = "进入"..gDz.getItemBarIndex(p)
    end)

    gDz.RegMouseItemBarAction("离开", function()
        local p = gDz.GetTriggerUIEventPlayer()
        str[3] = "离开"..gDz.getItemBarIndex(p)
    end)
end

-- 初始化
function mt:init()
    self:act_A()
    self:act_B()
    self:act_C()
    self:act_D()
    self:act_F()
end

mt:init()

return mt
