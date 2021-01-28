local mt = {}

-- 技能位置
mt.Buttonpos = "D"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'FwD0'

-- 技能名称
mt.name = "凤舞箭"

-- 技能介绍
mt.tip = "凤舞的攻击有((凤舞与被攻击者距离/100)*5)%的几率无视护甲。"

-- D动作
function mt.Actions(hero, enemy)
    if GetRandomReal(1, 100) <= gYh.distanceByUnit(hero, enemy) / 20 then
        gEff.remove(gEff.addEffTar("Abilities\\Weapons\\Blood\\BloodImpact.mdl", enemy, "chest"))

        SetEventDamage(0.00)
        local harm = gU.getState(hero, UNIT_STATE.BASIC_DAMAGE)
        UnitDamageTarget(hero, enemy, harm, false, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_DEFENSIVE, WEAPON_TYPE_WHOKNOWS)

        gTag.new("|cffdd0de4" .. "凤舞箭", 0.020, hero, 0.70)
        gTag.setVelocity(70, 135)
    end
end

-- 触发+条件
gTrg.RegAnyUnitDamageEvent(function()
    if not gU.isEnemy(GetEventDamageSource(), GetTriggerPlayer()) then
        return
    end

    local trgU, trgP = GetTriggerUnit(), GetTriggerPlayer()
    local source = GetEventDamageSource()

    if IsEventAttackDamage() then -- 普攻
        -- 伤害来源拥有技能
        if gU.isHaveAbi(source, mt.id) then
            mt.Actions(source, trgU)
        end
        -- 马甲
        if gU.isTypeId(source, 'Fw01') then
            mt.Actions(source, trgU)
        end
    end
end)

return mt
