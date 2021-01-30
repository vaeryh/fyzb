local mt = {}
-- 技能位置
mt.Buttonpos = "E"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'QsE0'

-- 技能名称
mt.name = "霜寒抱月"

-- 技能介绍
mt.tip = [[
    霜寒抱月：每次触发天霜气，都会回复自身智力*2的生命值和法力值
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
