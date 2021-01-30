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
