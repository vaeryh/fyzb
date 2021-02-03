local mt = {}

-- 技能位置
mt.Buttonpos = "R"

-- 技能等级
mt.abiLevel = 3

-- 技能id
mt.id = 'QsR0'

-- 技能名称
mt.name = "霜绝天下"

-- 技能介绍
mt.tip = [[
    霜绝天下：将霜气瞬间全部爆发，造成智力*30的伤害，并冻结范围内所有敌人。
    3秒后，所有冻结的敌人冰块爆裂，对周围300码再次造成智力*9的伤害。
]]
-- R
function mt.Actions(hero)
    local spellX, spellY = GetSpellTargetX(), GetSpellTargetY()
    local x, y = gU.getXY(hero)
    local distance = gYh.distanceXY(x, y, spellX, spellY)
    local angle = gYh.angleXY(x, y, spellX, spellY)
    local agi, Rlev = gH.getAgi(hero), gAbi.getLevel(hero, mt.id)
    local heroDur = gAbi.getDataReal(hero, mt.id, Rlev, ABILITY_DATA.HERODUR)
    local A = GetUnitLoc(GetSpellAbilityUnit())
    local B
    local T
    local dwz

    EXSetEffectSpeed(bj_lastCreatedEffect, 0.50)
    for i = 1, 10 do
        B = PolarProjectionBJ(A, 300.00, 36 * lopA)
        T = AddSpecialEffectLoc("war3mapImported\\snowflake.mdx", B)
        EXSetEffectSpeed(T, 0.50)
        RemoveLocation(B)
    end

    dwz = GetUnitsInRangeOfLocMatching(800.00, A, nil)
    ForGroup(dwz, function()
        UnitDamageTarget(hero, GetEnumUnit(), int * 30, false, false, ATTACK_TYPE_MAGIC, DAMAGE_TYPE_COLD,
            WEAPON_TYPE_WHOKNOWS)
        CreateTextTagUnit("霜绝天下第一段", 0.025, GetEnumUnit(), 0, 1, 255, 0, 255, 255)
        SetTextTagVelocityBJ(bj_lastCreatedTextTag, 64, 75)
    end)
    Abi_E_Actions()

    TriggerSleepAction(3.00)

    ForGroup(dwz, function()
        local C = GetUnitLoc(GetEnumUnit())
        local T2 = AddSpecialEffectLoc("Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdl", C)
        EXSetEffectSpeed(T2, 0.50)
        UnitDamageTarget(hero, GetEnumUnit(), int * 9, false, false, ATTACK_TYPE_MAGIC, DAMAGE_TYPE_COLD,
            WEAPON_TYPE_WHOKNOWS)
        CreateTextTagUnit("霜绝天下第二段", 0.025, GetEnumUnit(), 0, 1, 255, 0, 255, 255)
        SetTextTagVelocityBJ(bj_lastCreatedTextTag, 64, 75)
        RemoveLocation(C)
    end)
    Abi_E_Actions()
    DestroyGroup(dwz)
end

-- 触发+动作
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.SPELL_EFFECT, function()
    if gTrg.isMatchAbiId(mt.id) then
        mt.Actions(GetTriggerUnit())
    end
end)

return mt
