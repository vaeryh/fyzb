local jump = require 'scope.jump'
local mt = {}

-- 技能位置
mt.Buttonpos = "W"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'SyW0'

-- 技能名称
mt.name = "药王神经-治疗"

-- 技能介绍
mt.tip = [[
    在5秒内恢复目标500/1000/1500/2000/2500+智力*0.5*专属等级的生命值。
]]

-- W
function mt.Actions(hero)
    local int = gH.getInt(hero)
    local target = GetSpellTargetUnit()
    gAbi.setDataReal(hero, mt.id, nil, ABILITY_DATA.DATA_A, int * 5)
    local count = 0
    gT.loop(1.00, function()
        gTag.newUnit('|cff4ffa00+' .. int, 0.024, target, 0.77, 25.00, 90.00)
        count = count + 1
        if count == 5 then
            gT.remove()
        end
    end)
end

-- 触发+动作
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.SPELL_CAST, function()
    if gTrg.isMatchAbiId(mt.id) then
        mt.Actions(GetTriggerUnit())
    end
end)

return mt
