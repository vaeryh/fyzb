local mt = {}
-- 技能位置
mt.Buttonpos = "D"

-- 技能等级
mt.abiLevel = 5

-- 技能介绍
mt.tip = "凤舞的攻击有((凤舞与被攻击者距离/100)*5)%的几率无视护甲。"

-- D
function mt.Actions(trgu)
    if GetRandomReal(1, 100) <= DistanceBetweenPoints(GetUnitLoc(Fw_Hero), GetUnitLoc(trgu)) / 20 then
        DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\Blood\\BloodImpact.mdl", trgu, "chest")) -- 溅血特效

        YDWESetEventDamage(0.00)
        UnitDamageTarget(Fw_Hero, trgu, GetUnitState(Fw_Hero, ConvertUnitState(0x15)), false, true, ATTACK_TYPE_HERO,
            DAMAGE_TYPE_DEFENSIVE, WEAPON_TYPE_WHOKNOWS)

        CreateTextTagUnit("凤舞箭", 0.020, Fw_Hero, 0, 0.70, 255, 120, 200, 255)
        SetTextTagVelocityBJ(bj_lastCreatedTextTag, 70, 135)
    end
end

return mt
