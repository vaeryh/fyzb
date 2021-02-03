local mt = {}

-- 技能位置
mt.Buttonpos = "R"

-- 技能等级
mt.abiLevel = 3

-- 技能id
mt.id = 'SyR0'

-- 技能名称
mt.name = "药王神经-附魔"

-- 技能介绍
mt.tip = [[
    被动：神医能根据药王图录内的专属点亮程度，
    使自己的被动伤害加成（专属等级）%。
]]
-- R
-- function mt.Actions(hero)
--     local agi, Rlev = gH.getAgi(hero), gAbi.getLevel(hero, mt.id)
--     local heroDur = gAbi.getDataReal(hero, mt.id, Rlev, ABILITY_DATA.HERODUR)

-- end

-- -- 触发+动作
-- gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.SPELL_EFFECT, function()
--     if gTrg.isMatchAbiId(mt.id) then
--         mt.Actions(GetTriggerUnit())
--     end
-- end)

return mt
