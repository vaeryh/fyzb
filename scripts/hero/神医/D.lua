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
    local Rlev, agi = gAbi.getLevel(hero, mt.id), gH.getAgi(hero)

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
        if gAbi.isHave(source, mt.id) then
            mt.Actions(source, trgU)
        end
    end
end)

return mt
