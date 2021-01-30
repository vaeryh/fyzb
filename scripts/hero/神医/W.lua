local jump = require 'scope.jump'
local mt = {}

-- 技能位置
mt.Buttonpos = "W"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'QsW0'

-- 技能名称
mt.name = "药王神经-治疗"

-- 技能介绍
mt.tip = [[
    在5秒内恢复目标500/1000/1500/2000/2500+智力*0.5*专属等级的生命值。
]]

-- W
function mt.Actions(hero)
    local spellX, spellY = GetSpellTargetX(), GetSpellTargetY()
    local x, y = gU.getXY(hero)
    local distance = gYh.distanceXY(x, y, spellX, spellY)
    local angle = gYh.angleXY(x, y, spellX, spellY)

end

-- 触发+动作
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.SPELL_CAST, function()
    if gTrg.isMatchAbiId(mt.id) then
        mt.Actions(GetTriggerUnit())
    end
end)

return mt
