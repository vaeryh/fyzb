local mt = {}
-- 技能位置
mt.Buttonpos = "D"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'BjyD'

-- 技能名称
mt.name = "圣灵决"

-- 技能介绍
mt.tip = [[
    每次攻击10%+等级*0.3的几率无敌1秒（内置CD2秒）
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
