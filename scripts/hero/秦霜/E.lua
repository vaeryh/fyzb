local mt = {}
-- 技能位置
mt.Buttonpos = "E"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'QsE0'

-- 技能名称
mt.name = "霜寒抱月"

-- 技能介绍
mt.tip = [[
    霜寒抱月：每次触发天霜气，都会回复自身智力*2的生命值和法力值
]]

-- E
function mt.Actions(hero)
    local int = gH.getInt(hero)
    local Elev = gAbi.getLevel(hero, mt.id)
    --
    if GetUnitAbilityLevel(hero, 'QsE0') == 0 then
        return
    end

    if GetUnitState(hero, UNIT_STATE_LIFE) ~= GetUnitState(hero, UNIT_STATE_MAX_LIFE) then
        SetUnitLifeBJ(hero, GetUnitState(hero, UNIT_STATE_LIFE) + int * 2)
        CreateTextTagUnit("生命值+" + I2S(int * 2), 0.023, hero, 0, 1, 0, 255, 0, 255)
        SetTextTagVelocityBJ(bj_lastCreatedTextTag, 64, 110)
    end
    if GetUnitState(hero, UNIT_STATE_MANA) ~= GetUnitState(hero, UNIT_STATE_MAX_MANA) then
        SetUnitManaBJ(hero, GetUnitState(hero, UNIT_STATE_MANA) + int * 2)
        CreateTextTagUnit("魔法值+" + I2S(int * 2), 0.023, hero, 0, 1, 0, 0, 255, 255)
        SetTextTagVelocityBJ(bj_lastCreatedTextTag, 64, 70)
    end
end

-- 触发+条件

return mt
