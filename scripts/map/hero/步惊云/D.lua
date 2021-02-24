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

-- 保持攻击状态
mt.num = 0

-- D动作
function mt.Actions(hero, enemy)
    local Hlev = gH.getLevel(hero)
    if GetRandomReal(1, 100) > 10 + Hlev * 0.3 then
        return
    end
    -- 动作
    local trg = GetTriggeringTrigger()
    gTrg.setClose(trg)
    gU.setInvulnerable(hero, true) -- 设置无敌
    -- 无敌特效
    local eff = gEff.addTarget("Abilities\\Spells\\Human\\DivineShield\\DivineShieldTarget.mdl", hero, "origin")
    --
    gT.wait(1.00, function()
        gU.setInvulnerable(hero, false) -- 解除无敌
        gEff.remove(eff)
    end)
    --
    gT.wait(3.00, function()
        gTrg.setOpen(trg)
    end)
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
