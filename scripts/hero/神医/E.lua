local mt = {}
-- 技能位置
mt.Buttonpos = "E"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'QsE0'

-- 技能名称
mt.name = "药王神经-培育"

-- 技能介绍
mt.tip = [[
    神医培育的专属丢并且范围内的敌人/友军受到此时附魔的圣物/毒物的效果。
]]

-- E
function mt.Actions(hero)
    local Elev = gAbi.getLevel(hero, mt.id)
    --

end

-- 触发+条件
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.HERO_SKILL, function()
    if GetLearnedSkill() == gYh.s2id(mt.id) then
        mt.Actions(GetTriggerUnit())
    end
end)

return mt
