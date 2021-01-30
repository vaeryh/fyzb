local mt = {}

-- 技能位置
mt.Buttonpos = "Q"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'QsQ0'

-- 技能名称
mt.name = "霜冷长河"

-- 技能介绍
mt.tip = [[
    霜冷长河：用霜气凝结前方长方形（500*200）区域，
    造成智力*5的伤害，减少20%移动速度，持续2秒。冷却5秒。
]]

-- 动作
function mt.Actions(hero, enemy)
    local agi, Qlev = gH.getAgi(hero), gAbi.getLevel(hero, mt.id)
    -- 减少护甲。数据C
    gAbi.getDataReal(hero, mt.id, Qlev, ABILITY_DATA.DATA_C, Qlev * 3)
    -- 目标伤害.数据D
    gAbi.getDataReal(hero, mt.id, Qlev, ABILITY_DATA.DATA_D, agi * Qlev * 0.3)
    -- 周围伤害.数据E
    gAbi.getDataReal(hero, mt.id, Qlev, ABILITY_DATA.DATA_E, agi * Qlev * 0.2)
end

-- 触发+动作
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.SPELL_EFFECT, function()
    if gTrg.isMatchAbiId(mt.id) then
        mt.Actions(GetTriggerUnit())
    end
end)

return mt
