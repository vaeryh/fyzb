local g = require 'jass.globals'
local message = require 'jass.message'

local mt = {}

-- 攻击力
mt.atk = 0

-- 护甲
mt.def = 0

-- 力量
mt.str = 0

-- 敏捷
mt.agi = 0

-- 智力
mt.int = 0

-- 获取一个表，存数据
function mt:getDataBase(unit)
    if not self[unit] then
        self[unit] = {}
        setmetatable(self[unit], self[unit])
        self[unit].__index = self
    end
    return self[unit]
end

-------------------------------------------------------------------

-- 设置护甲
function mt.setDef(unit, vui)
    vui = math.max(0, vui)
    vui = math.min(16777215, vui)
    for i = 1, 24 do
        if math.floor(vui) % 2 == 1 and vui >= 1 then
            UnitAddAbility(unit, g.Armor_Id[i])
        else
            UnitRemoveAbility(unit, g.Armor_Id[i])
        end
        vui = math.floor(vui / 2)
    end
end

-- 调整护甲
function mt.adjustDef(unit, value)
    local tab = mt:getDataBase(unit)
    tab.def = tab.def + value
    if tab.def >= 0 then
        mt.setDef(unit, tab.def)
        UnitRemoveAbility(unit, g.Armor_Id[25])
    elseif tab.def < 0 then
        local int = 16777216 + tab.def
        mt.setDef(unit, int)
        UnitAddAbility(unit, g.Armor_Id[25])
    end
end

-------------------------------------------------------------------

-- 设置攻击力
function mt.setAtk(unit, value)
    value = math.max(0, value)
    value = math.min(16777215, value)
    for i = 1, 24 do
        if math.floor(value) % 2 == 1 and value >= 1 then
            UnitAddAbility(unit, g.Attack_Id[i])
        else
            UnitRemoveAbility(unit, g.Attack_Id[i])
        end
        value = math.floor(value / 2)
    end
end

-- 调整攻击力
function mt.adjustAtk(unit, value)
    local tab = mt:getDataBase(unit)
    tab.atk = tab.atk + value
    if tab.atk >= 0 then
        mt.setAtk(unit, tab.atk)
        UnitRemoveAbility(unit, g.Attack_Id[25])
    elseif tab.atk < 0 then
        UnitAddAbility(unit, g.Attack_Id[25])
        local int = 16777216 + tab.atk
        mt.setAtk(unit, int)
    end
end

-------------------------------------------------------------------

-- 力量、敏捷、智力sai
local sai = function(unit, value, min, max)
    value = math.max(0, value)
    value = math.min(1073741823, value)
    for i = min, max do
        if math.floor(value) % 2 == 1 and value >= 1 then
            UnitAddAbility(unit, g.StrAgiInt_Id[i])
        else
            UnitRemoveAbility(unit, g.StrAgiInt_Id[i])
        end
        value = math.floor(value / 2)
    end
end

-- 力量
function mt.setStr(unit, value)
    sai(unit, value, 1, 30)
end

-- 敏捷
function mt.setAgi(unit, value)
    sai(unit, value, 31, 60)
end

-- 智力
function mt.setInt(unit, value)
    sai(unit, value, 61, 90)
end

-- 调整力量
function mt.adjustStr(unit, value)
    local tab = mt:getDataBase(unit)
    tab.str = tab.str + value
    if tab.str >= 0 then
        mt.setStr(unit, tab.str)
        UnitRemoveAbility(unit, g.StrAgiInt_Id[91])
    elseif tab.str < 0 then
        local int = 1073741824 + tab.str
        mt.setStr(unit, int)
        UnitAddAbility(unit, g.StrAgiInt_Id[91])
    end
end

-- 调整敏捷
function mt.adjustAgi(unit, value)
    local tab = mt:getDataBase(unit)
    tab.agi = tab.agi + value
    if tab.agi >= 0 then
        mt.setAgi(unit, tab.agi)
        UnitRemoveAbility(unit, g.StrAgiInt_Id[92])
    elseif tab.agi < 0 then
        local int = 1073741824 + tab.agi
        mt.setAgi(unit, int)
        UnitAddAbility(unit, g.StrAgiInt_Id[92])
    end
end

-- 调整智力
function mt.adjustInt(unit, value)
    local tab = mt:getDataBase(unit)
    tab.int = tab.int + value
    if tab.int >= 0 then
        mt.setInt(unit, tab.int)
        UnitRemoveAbility(unit, g.StrAgiInt_Id[93])
    elseif tab.int < 0 then
        local int = 1073741824 + tab.int
        mt.setInt(unit, int)
        UnitAddAbility(unit, g.StrAgiInt_Id[93])
    end
end

-------------------------------------------------------------------
-- 绿色属性
GREEN_DATA = {
    -- 攻击
    ATK = GREEN_DATA_ATK,
    -- 防御
    DEF = GREEN_DATA_DEF,
    -- 力量
    STR = GREEN_DATA_STR,
    -- 敏捷
    AGI = GREEN_DATA_AGI,
    -- 智力
    INT = GREEN_DATA_INT
}
-- --绑定计时器
-- local function DataTimer()

-- end
-- -- 设置计时数据
-- function mt.setTimerData(unit, data_type, vaule)
--     if data_type == GREEN_DATA_ATK then
--         mt.adjustAtk(unit, vaule)
--     elseif data_type == GREEN_DATA_DEF then

--     elseif data_type == GREEN_DATA_STR then

--     elseif data_type == GREEN_DATA_AGI then

--     elseif data_type == GREEN_DATA_INT then

--     end
-- end

return mt
