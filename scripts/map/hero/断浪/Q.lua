local dl = require 'map.hero.断浪.init'

local mt = {}

-- 技能位置
mt.Buttonpos = "Q"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'DlQ0'

-- 技能名称
mt.name = "火麟剑"

-- 技能介绍
mt.tip = [[
    击杀敌人会吞噬敌人的魂魄封印至火麟剑中。
    每个魂魄增加0.1/0.2/0.3/0.4/0.5防御、0.2/0.4/0.6/0.8/1点攻击力
]]

-- 魂魄数量
mt.soul = 0

-- 魂魄上一次数量
mt.soulLast = 0

-- 固定魔法值
gTrg.RegTimerEvent(0.02, true, function()
    local hero = dl.hero
    gU.setState(hero, UNIT_STATE.MAX_MANA, gAbi.getLevel(hero, 'DlR0') * 50 + 50)
    gU.setState(hero, UNIT_STATE.MANA, mt.soul)
end)

-- 杀敌增加魂魄
gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.DEATH, function()
    local hero = GetKillingUnit()
    if gAbi.isHave(hero, mt.id) then
        if mt.soul < gU.getState(hero, UNIT_STATE.MAX_MANA) then
            local Qlev = gAbi.getLevel(hero, mt.id)
            mt.soul = mt.soul + Qlev
            --
            gUnitdata.adjustAtk(hero, Qlev * 2)
            gUnitdata.adjustDef(hero, Qlev / 8)
        end
    end
end)

-- 施放技能减少魂魄
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.SPELL_CAST, function()
    if not gU.isTypeId(GetTriggerUnit(), 'Dl00') then
        return
    end
    local abiId, trgU = GetSpellAbilityId(), GetTriggerUnit()
    local costMana = gAbi.getDataInteger(trgU, gYh.id2s(abiId), nil, ABILITY_DATA.COST)
    -- print(costMana)
    mt.soul = mt.soul - costMana
    --
    gUnitdata.adjustAtk(trgU, -costMana * 2)
    gUnitdata.adjustDef(trgU, -costMana / 8)
end)

return mt
