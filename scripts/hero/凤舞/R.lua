local mt = {}

-- 技能位置
mt.Buttonpos = "R"

-- 技能等级
mt.abiLevel = 3

-- 技能id
mt.id = 'FwR0'

-- 技能名称
mt.name = "凤舞九天"

-- 技能介绍
mt.tip =
    "凤回闪的触发次数减少1/2/3；凤魂的加成增加30%/60%/100%；轻舞成双的几率增加10%/20%/30%"

-- R
function mt.Actions(hero)
    -- 增加攻击范围
    gU.adjustState(hero, UNIT_STATE.ATK_RANGE, 50)
    -- 增加攻击力
    gU.adjustState(hero, UNIT_STATE.BASIC_DAMAGE, 50)

    local RLev = gAbi.getLevel(hero, mt.id)

    if RLev == 1 then
        gEff.addTarget("Abilities\\Spells\\Items\\AIob\\AIobTarget.mdl", hero, "hand,right")
    elseif RLev == 2 then
        gEff.addTarget("Abilities\\Spells\\Items\\AIlb\\AIlbTarget.mdl", hero, "chest")
    elseif RLev == 3 then
        gEff.addTarget("Abilities\\Spells\\Items\\AIfb\\AIfbTarget.mdl", hero, "head")
    end
end

-- 触发+条件
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.HERO_SKILL, function()
    if GetLearnedSkill() == gYh.s2id(mt.id) then
        mt.Actions(GetTriggerUnit())
    end
end)

return mt
