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
            -- print(i, vui)
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
    mt.setDef(unit, tab.def)
end

-------------------------------------------------------------------

-- 设置攻击力
function mt.setAtk(unit, value)
    value = math.max(0, value)
    value = math.min(16777215, value)
    -- print(GetUnitName(unit), value)
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
    mt.setAtk(unit, tab.atk)
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
    mt.setStr(unit, tab.str)
end

-- 调整敏捷
function mt.adjustAgi(unit, value)
    local tab = mt:getDataBase(unit)
    tab.agi = tab.agi + value
    mt.setAgi(unit, tab.agi)
end

-- 调整智力
function mt.adjustInt(unit, value)
    local tab = mt:getDataBase(unit)
    tab.int = tab.int + value
    mt.setInt(unit, tab.int)
end

-------------------------------------------------------------------

return mt
