local mt = {}
-- 技能位置
mt.Buttonpos = "E"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'FwE0'

-- 技能名称
mt.name = "轻舞成双"

-- 技能介绍
mt.tip = "凤舞的攻击有5%/10%/15%/20%/25%的几率追加一次攻击"

-- E动作
function mt.Actions(hero, enemy)
    local chance = gAbi.getLevel(hero, mt.id) * 5.00 + gAbi.getLevel(hero, 'FwR0') * 10
    local r1 = gU.getState(hero, UNIT_STATE.ATK_INTERVAL)
    local r2 = gU.getState(hero, UNIT_STATE.ATK_RANGE)
    local r3 = gU.getState(hero, UNIT_STATE.ATK_SPEED)
    local r4 = gU.getState(hero, UNIT_STATE.DICE_MNUM) * gU.getState(hero, UNIT_STATE.DICE_NUM)
    local r5 = gU.getState(hero, UNIT_STATE.BASIC_DAMAGE) + r4

    if GetRandomReal(1, 100) <= chance then
        gTag.newUnit("|cffcee029" .. "轻舞成双", 0.020, hero, 0.50, 70, 315)

        local mj = gU.create(GetOwningPlayer(hero), 'Fw01', GetUnitX(hero), GetUnitY(hero), GetUnitFacing(hero))
        gU.setLifeTime(mj, 2.00)
        ShowUnit(mj, false)
        gU.setState(mj, UNIT_STATE.ATK_INTERVAL, r1)
        gU.setState(mj, UNIT_STATE.ATK_RANGE, r2)
        gU.setState(mj, UNIT_STATE.ATK_SPEED, r3)
        gU.setState(mj, UNIT_STATE.BASIC_DAMAGE, r5)
        IssueTargetOrder(mj, "attackonce", enemy)
    end
end

-- 触发+条件
gTrg.RegAnyUnitDamageEvent(function()
    if not gU.isEnemy(GetEventDamageSource(), GetTriggerPlayer()) then
        return
    end

    local trgU, trgP = GetTriggerUnit(), GetTriggerPlayer()
    local source = GetEventDamageSource()

    if gDam.isAttackDamage() then -- 普攻
        -- 伤害来源拥有技能
        if gAbi.isHave(source, mt.id) then
            mt.Actions(source, trgU)
        end
        -- 马甲
        if gU.isTypeId(source, 'Fw01') then
            mt.Actions(source, trgU)
        end
    end
end)

return mt
