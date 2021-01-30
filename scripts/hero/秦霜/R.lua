local mt = {}

-- 技能位置
mt.Buttonpos = "R"

-- 技能等级
mt.abiLevel = 3

-- 技能id
mt.id = 'QsR0'

-- 技能名称
mt.name = "霜绝天下"

-- 技能介绍
mt.tip = [[
    霜绝天下：将霜气瞬间全部爆发，造成智力*30的伤害，并冻结范围内所有敌人。
    3秒后，所有冻结的敌人冰块爆裂，对周围300码再次造成智力*9的伤害。
]]
-- R
function mt.Actions(hero)
    local agi, Rlev = gH.getAgi(hero), gAbi.getLevel(hero, mt.id)
    local heroDur = gAbi.getDataReal(hero, mt.id, Rlev, ABILITY_DATA.HERODUR)

end

-- 触发+动作
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.SPELL_EFFECT, function()
    if gTrg.isMatchAbiId(mt.id) then
        mt.Actions(GetTriggerUnit())
    end
end)

return mt
