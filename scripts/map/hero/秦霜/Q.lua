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
    local spellX, spellY = GetSpellTargetX(), GetSpellTargetY()
    local x, y = gU.getXY(hero)
    local distance = gYh.distanceXY(x, y, spellX, spellY)
    local angle = gYh.angleXY(x, y, spellX, spellY)
    local agi, Qlev = gH.getAgi(hero), gAbi.getLevel(hero, mt.id)
    
    local A = GetUnitLoc(GetSpellAbilityUnit())
    local B = GetSpellTargetLoc()
    local C
    local AB = AngleBetweenPoints(A, B)
    local Aup = PolarProjectionBJ(A, 120.00, AB + 90)
    local Ado = PolarProjectionBJ(A, 120.00, AB - 90)
    local D
    local T
    local D1
    local T1
    local D2
    local T2

    Abi_E_Actions()
    -- ※※※※※※※※※※※※※
    for i = 1, 5 do
        -- ※※※※※※※※※※※※※
        D = PolarProjectionBJ(A, lopA * 120.00, AB)
        T = AddSpecialEffectLoc("Abilities\\Spells\\Items\\TomeOfRetraining\\TomeOfRetrainingCaster.mdl", A)
        YDWESetEffectLoc(T, D)
        EXEffectMatRotateY(T, 90.00)
        EXEffectMatRotateZ(T, AB)
        EXSetEffectZ(T, 80.00)
        RemoveLocation(D)
        -- ※※※※※※※※※※※※※
        D1 = PolarProjectionBJ(Aup, lopA * 120.00, AB)
        T1 = AddSpecialEffectLoc("Abilities\\Spells\\Items\\TomeOfRetraining\\TomeOfRetrainingCaster.mdl", Aup)
        YDWESetEffectLoc(T1, D1)
        EXEffectMatRotateY(T1, 90.00)
        EXEffectMatRotateZ(T1, AB)
        EXSetEffectZ(T1, 80.00)
        RemoveLocation(D1)
        -- ※※※※※※※※※※※※※
        D2 = PolarProjectionBJ(Ado, lopA * 120.00, AB)
        T2 = AddSpecialEffectLoc("Abilities\\Spells\\Items\\TomeOfRetraining\\TomeOfRetrainingCaster.mdl", Ado)
        YDWESetEffectLoc(T2, D2)
        EXEffectMatRotateY(T2, 90.00)
        EXEffectMatRotateZ(T2, AB)
        EXSetEffectZ(T2, 80.00)
        RemoveLocation(D2)
        -- ※※※※※※※※※※※※※
    end

    -- ※※※※※※※※※※※※※
    for i = 1, 3 do
        C = PolarProjectionBJ(A, lopA * 120.00, AB)
        bj_lastCreatedUnit = CreateUnitAtLoc(GetOwningPlayer(GetTriggerUnit()), 'hpea', C, 0)
        ShowUnit(bj_lastCreatedUnit, false)
        SetUnitPathing(bj_lastCreatedUnit, false)
        UnitApplyTimedLife(bj_lastCreatedUnit, 'BHwe', 2.00)
        YDWEUnitAddStun(bj_lastCreatedUnit)
        UnitAddAbility(bj_lastCreatedUnit, 'A008')
        RemoveLocation(C)
    end
end

-- 触发+动作
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.SPELL_EFFECT, function()
    if gTrg.isMatchAbiId(mt.id) then
        mt.Actions(GetTriggerUnit())
    end
end)

return mt
