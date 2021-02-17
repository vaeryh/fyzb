local mt = {}

gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.SELECTED, function()
    local unit = GetTriggerUnit()
    -- gUnitdata.adjustPro("攻击值", unit, 10)
    -- gUnitdata.adjustPro("护甲值", unit, 10)
    -- gUnitdata.adjustPro("生命值再生", unit, 1)
    -- gUnitdata.adjustPro("魔法值再生", unit, 1)
    -- gUnitdata.adjustPro("全属性", unit, 10)
end)
