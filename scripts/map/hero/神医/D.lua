local mt = {}
-- 技能位置
mt.Buttonpos = "D"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'SyD0'

-- 技能名称
mt.name = "药王神经-蛊毒"

-- 技能介绍
mt.tip = [[
    各种医药毒物圣物都是神医的专属，
    神医能根据持有的专属来让自己的攻击附带毒性伤害，
    在5秒内造成专属等级*0.5*智力的伤害。
    （专属等级以图录最高等级为准）
]]

-- D动作
function mt.Actions(hero, enemy)
    local int = gH.getInt(hero)
    gAbi.setDataReal(hero, mt.id, nil, ABILITY_DATA.DATA_A, int * 0.1) -- D技能普攻附加毒性伤害
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
