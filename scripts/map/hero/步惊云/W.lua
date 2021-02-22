local jump = require 'scope.jump'
local mt = {}

-- 技能位置
mt.Buttonpos = "W"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'BjyW'

-- 技能名称
mt.name = "霍家剑法"

-- 技能介绍
mt.tip = [[
    在2秒内对敌方单个单位攻击9次
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
