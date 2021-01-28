local mt = {}

-- 技能位置
mt.Buttonpos = "W"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'FwW0'

-- 技能名称
mt.name = "凤魂"

-- 技能介绍
mt.tip = "凤舞的攻击与攻击距离增加50/100/150/200/250点"

-- W
function mt.Actions(hero)
    -- 增加攻击范围
    gU.adjustState(hero, UNIT_STATE.ATK_RANGE, 50)
    -- 增加攻击力
    gU.adjustState(hero, UNIT_STATE.BASIC_DAMAGE, 50)
end

-- 触发+条件
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.HERO_SKILL, function()
    if GetLearnedSkill() == gYh.s2id(mt.id) then
        mt.Actions(GetTriggerUnit())
    end
end)

return mt
