local mt = {}
-- 技能位置
mt.Buttonpos = "R"

-- 技能等级
mt.abiLevel = 3

-- 技能介绍
mt.tip = "凤回闪的触发次数减少1/2/3；凤魂的加成增加30%/60%/1；轻舞成双的几率增加10%/20%/30%"
-- R
function mt.Actions(hero)
    local abiW = require 'hero.凤舞.凤魂'
    abiW.Actions(mt.hero)

    local abiLev = gU.getAbiLev(hero, 'FwR0')
    if abiLev == 1 then
        AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIob\\AIobTarget.mdl", hero, "hand,right")
    elseif abiLev == 2 then
        AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIlb\\AIlbTarget.mdl", hero, "chest")
    elseif abiLev == 3 then
        AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIfb\\AIfbTarget.mdl", hero, "head")
    end
end

return mt
