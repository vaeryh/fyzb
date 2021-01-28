local mt = {}

-- 技能位置
mt.Buttonpos = "Q"

-- 技能等级
mt.abiLevel = 5

-- 技能名称
mt.name = "凤回闪"

-- 技能id
mt.id = 'FwQ0'

-- 技能介绍
mt.tip =
    "凤舞每7次攻击便会触发凤回闪，发射一只凤凰对面前(700*150)距离造成敏捷*0.4/0.8/0.12/1.6/2的伤害"

-- 凤回闪计数
mt.count = 0

-- 动作一计数
function mt.Actions(hero, enemy)
    local Rlev = gU.getAbiLev(hero, 'FwR0')
    local Qlev = gU.getAbiLev(hero, mt.id)
    -- 凤回闪计数+1
    mt.count = mt.count + 1

    gTag.new("|cff0223df+" .. mt.count, 0.024, hero, 0.5)
    log.debug(mt.count)
    if mt.count >= 7 - Rlev then
        mt.count = 0 -- 凤回闪计数重置

        gTag.new("|cffe40d0d" .. "凤回闪", 0.020, hero, 0.6)
        gTag.setVelocity(70, 45)
        -- print(GetUnitX(hero), GetUnitY(hero))
        -- print(gYh.angleByUnit(hero, enemy))
        -- print(gYh.PolarProjection(hero, -100, gYh.angleByUnit(hero, enemy)))
        -- print(GetUnitState(hero, UNIT_STATE.ATK_Range))
        local x, y = gYh.PolarProjection(hero, -100, gYh.angleByUnit(hero, enemy))
        local mj = gU.create(gP.getOwner(hero), 'yhmj', x, y, gYh.angleByUnit(hero, enemy))

        SetUnitScale(mj, 1 + 0.1 * Qlev, 1 + 0.1 * Qlev, 1 + 0.1 * Qlev)
        gU.addAbi(mj, 'FwQ1')
        -- A伤害值
        local Harm = GetHeroAgi(hero, true) * Qlev
        gAbi.setAbiDataReal(mj, 'FwQ1', 1, ABILITY_DATA.DATA_A, Harm)
        -- C距离
        local range = gU.getState(hero, UNIT_STATE.ATK_RANGE)
        gAbi.setAbiDataReal(mj, 'FwQ1', 1, ABILITY_DATA.DATA_C, range)
        -- D最终范围
        gAbi.setAbiDataReal(mj, 'FwQ1', 1, ABILITY_DATA.DATA_D, 50 * Qlev + 150)
        IssuePointOrderLoc(mj, "shockwave", GetUnitLoc(hero))
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
