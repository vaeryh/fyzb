local mt = {}

-- 技能位置
mt.Buttonpos = "R"

-- 技能等级
mt.abiLevel = 3

-- 技能id
mt.id = 'BjyR'

-- 技能名称
mt.name = "麒麟臂"

-- 技能介绍
mt.tip = [[
    增加300点力量，攻击附带力量*技能等级的额外伤害
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
