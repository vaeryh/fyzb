local mt = {}
-- 技能位置
mt.Buttonpos = "D"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'DlD0'

-- 技能名称
mt.name = "蚀日剑法"

-- 技能介绍
mt.tip = [[
    "每过5秒，段浪的攻击就会触发火麒麟魂魄，对目标300码内造成力量*3的伤害。
    每100智力减少0.5秒的触发时间。"
]]

-- D动作
function mt.Actions(hero, enemy)
    local Dlev, agi = gAbi.getLevel(hero, mt.id), gH.getAgi(hero)
    local t = GetHeroInt(hero, true) * 0.001
    -- 删除火焰标记
    gAbi.remove(hero, 'DlD1')
    gEff.remove(gEff.addXY("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", gU.getXY(enemy)))

    local dwz = gGroup.getUnitInRange(gU.getX(enemy), gU.getY(enemy), 300)

    for i, unit in ipairs(dwz) do
        if gU.isEnemy(unit, gP.getOwner(hero)) and gU.is_alive(unit) and not IsUnitType(unit, UNIT_TYPE_STRUCTURE) then
            local harm = GetHeroStr(hero, true) * 3
            UnitDamageTarget(hero, unit, harm, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_DEMOLITION,
                WEAPON_TYPE_WHOKNOWS)
        end
    end

    -- 判断一下智力大于1000的时候，避免时间为负数
    t = math.min(4.999, t)

    TimerStart(gT.create(), 5 - t, false, function()
        gAbi.add(hero, 'DlD1') -- 添加火焰标记
        gT.remove()
    end)
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
        if gAbi.isHave(source, 'DlD1') then
            mt.Actions(source, trgU)
        end
    end
end)

return mt
