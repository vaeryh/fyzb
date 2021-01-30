local mt = {}

-- 触发+条件
gTrg.RegAnyUnitDamageEvent(function()
    if not gU.isEnemy(GetEventDamageSource(), GetTriggerPlayer()) then
        return
    end

    local trgU, trgP = GetTriggerUnit(), GetTriggerPlayer()
    local source = GetEventDamageSource()
    local harm = GetEventDamage()

    gTag.newUnit("|cffe70a0a" .. string.format('%.f', harm), 0.027, trgU, 1.66, 190, GetRandomInt(30, 60))
end)

return mt
