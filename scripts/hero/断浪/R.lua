local mt = {}

-- 技能位置
mt.Buttonpos = "R"

-- 技能等级
mt.abiLevel = 3

-- 技能id
mt.id = 'DlR0'

-- 技能名称
mt.name = "火麟蚀日"

-- 技能介绍
mt.tip = [[
    可以将火麟剑里的魂魄吞噬，选择一个属性提升（魂魄数量*0.1/0.2/0.3点），
    也可消耗50/100/150魂魄引动火麒麟
    对指定范围造成5000/10000/15000+全属性*10/20/30的伤害
]]
-- R
function mt.Actions(hero)
    local spellX, spellY = GetSpellTargetX(), GetSpellTargetY()
    local str, agi, int = gH.getStr(hero), gH.getAgi(hero), gH.getInt(hero)
    local Rlev = gAbi.getLevel(hero, mt.id)

    gAbi.setDataReal(hero, 'DlR1', nil, ABILITY_DATA.DATA_A, (str + agi + int) * Rlev * 10)
    -- 文字
    gTag.newXY("|cffe4140d" .. "火 麟 蚀 日", 0.03, spellX, spellY, 2.00, 64, 90)
    -- 复活
    gEff.removeTimer(0.01, gEff.addXY("Abilities\\Spells\\Orc\\Reincarnation\\ReincarnationTarget.mdl", spellX, spellY))
    -- 战争践踏
    local eft = gEff.addXY("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl", spellX, spellY)
    gEff.setSpeed(eft, 0.5)
    gEff.setScale(eft, 3.00)

    for i = 1, 3 do
        local r = i * 150
        for i = 1, 5 do
            local x, y = gYh.getPolar(spellX, spellY, r, i * 72)
            -- 地震效果
            eft = gEff.addXY("Abilities\\Spells\\Orc\\EarthQuake\\EarthQuakeTarget.mdl", x, y)
            gEff.setScale(eft, 0.70, 0.70, 0.10)
            gEff.removeTimer(1.66, eft)
        end
    end

    for i = 1, 3 do
        local r = i * 133.33
        for i = 1, 10 do
            local x, y = gYh.getPolar(spellX, spellY, r, i * 36)
            -- 凤凰坠落
            eft = gEff.addXY("Abilities\\Spells\\Human\\MarkOfChaos\\MarkOfChaosTarget.mdl", x, y)
            gEff.setSpeed(eft, 0.5)
            gEff.removeTimer(1.30, eft)
            -- 爆炸
            gEff.addXY("Objects\\Spawnmodels\\Other\\NeutralBuildingExplosion\\NeutralBuildingExplosion.mdl", x, y)
        end
    end

end

-- 触发+动作
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.SPELL_EFFECT, function()
    local hero = GetTriggerUnit()
    if gTrg.isMatchAbiId(mt.id) then
        print(gTrg.isMatchAbiId('DlR2'))
    elseif gTrg.isMatchAbiId('DlR1') then
        mt.Actions(hero)
    elseif gTrg.isMatchAbiId('DlR2') then
        SetHeroStr(Hero, GetHeroStr(trgU, true) + gAbi.getLevel(trgU, mt.id) * 10, true)
    elseif gTrg.isMatchAbiId('DlR3') then
        SetHeroAgi(Hero, GetHeroAgi(trgU, true) + gAbi.getLevel(trgU, mt.id) * 10, true)
    elseif gTrg.isMatchAbiId('DlR4') then
        SetHeroInt(Hero, GetHeroInt(trgU, true) + gAbi.getLevel(trgU, mt.id) * 10, true)
    end
end)

return mt
