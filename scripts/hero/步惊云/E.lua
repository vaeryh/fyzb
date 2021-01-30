local mt = {}
-- 技能位置
mt.Buttonpos = "E"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'BjyE'

-- 技能名称
mt.name = "不哭死神"

-- 技能介绍
mt.tip = [[
    减少周围敌军30%的攻击力和护甲
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
