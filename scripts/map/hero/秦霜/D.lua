local mt = {}
-- 技能位置
mt.Buttonpos = "D"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'QsD0'

-- 技能名称
mt.name = "天霜气"

-- 技能介绍
mt.tip = [[
    天霜气：天霜拳的内功心法，所有天霜拳的技能都有（20+霜绝天下技能等级*10）%的几率触发天霜气的加持，
    对目标周围（200）造成额外智力*5的伤害
]]

-- D动作
function mt.Actions(hero, enemy)
    local Rlev, agi = gAbi.getLevel(hero, mt.id), gH.getAgi(hero)
    if GetRandomReal(1, 100) <= GetUnitAbilityLevel(hero, 'QsD0') * 10 + 100 then
        ForGroup(Qs_dwz, function()
            local eft = AddSpecialEffectTarget("Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdl",
                            GetEnumUnit(), "origin")
            UnitDamageTarget(hero, GetEnumUnit(), int * 5, false, false, ATTACK_TYPE_MAGIC, DAMAGE_TYPE_COLD,
                WEAPON_TYPE_WHOKNOWS)
            CreateTextTagUnit("天霜气", 0.023, GetEnumUnit(), 0, 2, 100, 100, 255, 255)
            SetTextTagVelocityBJ(bj_lastCreatedTextTag, 64, 75)
        end)
    end
    Abi_E_Actions()
    GroupClear(Qs_dwz)
end

-- 触发+条件


return mt
