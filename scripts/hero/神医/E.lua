local mt = {}
-- 技能位置
mt.Buttonpos = "E"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'SyE0'

-- 技能名称
mt.name = "药王神经-培育"

-- 技能介绍
mt.tip = [[
    神医培育的专属丢并且范围内的敌人/友军受到此时附魔的圣物/毒物的效果。
]]

-- E
function mt.Actions(hero)
    local spellX, spellY = GetSpellTargetX(), GetSpellTargetY()
    local Elev = gAbi.getLevel(hero, mt.id)
    local mj = gU.create(gU.getOwner(hero), 'ohwd', spellX, spellY, gU.getFacing(hero))
    local path = "Units\\Orc\\HealingWard\\PlaceAncestralGuardian.wav"
    local sound = gSound.create(path, false, true, true, 10, 10, "SpellsEAX")
    gSound.setPosition(sound, gU.getXY(mj))
    gSound.StartSound(sound)

    gU.setLifeTime(mj, 15 + Elev * 3)
    gAbi.add(mj, 'Aloc')
    gAbi.add(mj, 'SyE1') -- 添加光环技能
    gAbi.setDataReal(mj, 'SyE1', nil, ABILITY_DATA.AREA, 300 + Elev * 100)
    gAbi.remove(mj, 'Aoar') -- 删除治疗守卫光环
end

-- 触发+条件
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.SPELL_EFFECT, function()
    if gTrg.isMatchAbiId(mt.id) then
        mt.Actions(GetTriggerUnit())
    end
end)

return mt
