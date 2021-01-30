local jump = require 'scope.jump'
local mt = {}

-- 技能位置
mt.Buttonpos = "W"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'QsW0'

-- 技能名称
mt.name = "霜雪纷飞"

-- 技能介绍
mt.tip = [[
    霜雪纷飞：将霜气凝结成雪花撒向目标范围，共5阵，持续施法5秒。
    共造成智力*5的伤害。每阵雪花都有几率触发天霜气。
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
