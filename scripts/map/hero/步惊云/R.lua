local mt = {}

-- 技能位置
mt.Buttonpos = "R"

-- 技能等级
mt.abiLevel = 3

-- 技能id
mt.id = 'BjyR'

-- 技能名称
mt.name = "麒麟臂"

-- 技能介绍
mt.tip = [[
    增加300点力量，攻击附带力量*技能等级的额外伤害
]]
-- R
function mt.Actions(hero, enemy)
    local str, Rlev = gH.getStr(hero), gAbi.getLevel(hero, mt.id)
    -- UnitDamageTarget(hero, enemy, str * 1.5, false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_FORCE, WEAPON_TYPE_WHOKNOWS)
    gDam.target(hero, enemy, str * 1.5, true)
end

-- 触发+条件
gTrg.RegAnyUnitDamageEvent(function()
    if gU.isEnemy(GetEventDamageSource(), GetTriggerPlayer()) then
        if gDam.isAttackDamage() then -- 普攻
            -- 伤害来源拥有技能
            if gAbi.isHave(GetEventDamageSource(), mt.id) then
                mt.Actions(GetEventDamageSource(), GetTriggerUnit())
            end
        end
    end
end)

return mt
