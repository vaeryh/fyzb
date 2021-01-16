local g = require 'jass.globals'
local message = require 'jass.message'

local mt = {}
-- 添加护甲
function mt.def(whichUnit, vui)
    vui = math.max(0, vui)
    vui = math.min(16777215, vui)
    for i = 1, 24 do
        if math.floor(vui) % 2 == 1 and vui >= 1 then
            UnitAddAbility(whichUnit, g.Armor_Id[i])
            print(i, vui)
        else
            UnitRemoveAbility(whichUnit, g.Armor_Id[i])
        end
        vui = math.floor(vui / 2)
    end
end
-- 添加攻击力
function mt.atk(whichUnit, value)
    value = math.max(0, value)
    value = math.min(16777215, value)
    for i = 1, 24 do
        if math.floor(value) % 2 == 1 and value >= 1 then
            UnitAddAbility(whichUnit, g.Attack_Id[i])
        else
            UnitRemoveAbility(whichUnit, g.Attack_Id[i])
        end
        value = math.floor(value / 2)
    end
end
-- 力量、敏捷、智力sai
local sai = function(whichUnit, value, min, max)
    value = math.max(0, value)
    value = math.min(1073741823, value)
    for i = min, max do
        if math.floor(value) % 2 == 1 and value >= 1 then
            UnitAddAbility(whichUnit, g.StrAgiInt_Id[i])
        else
            UnitRemoveAbility(whichUnit, g.StrAgiInt_Id[i])
        end
        value = math.floor(value / 2)
    end
end
-- 力量
function mt.str(whichUnit, value)
    sai(whichUnit, value, 1, 30)
end
-- 敏捷
function mt.agi(whichUnit, value)
    sai(whichUnit, value, 31, 60)
end
-- 智力
function mt.int(whichUnit, value)
    sai(whichUnit, value, 61, 90)
end

return mt
-- 测试
-- local trig = yh.createTrigger(function()
--     local r = tonumber(console_read)
--     local r = math.random(100000)
--     local unit = GetTriggerUnit()
--     printF(r)

--     mt.str(unit, r)
--     -- mt.agi(unit, r)
--     -- mt.int(unit, r)

--     mt.def(unit, r)
--     mt.atk(unit, r)

--     -- for i = 1, 24 do
--     --     local str = yh.id2s(g.Armor_Id[i])
--     --     print(str)
--     --     print(GetObjectName(g.Armor_Id[i]))
--     -- end
-- end)
-- TriggerRegisterPlayerUnitEvent(trig, Player(0), EVENT_PLAYER_UNIT_SELECTED, nil)
