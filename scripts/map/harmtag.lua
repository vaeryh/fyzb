local mt = {}

-- 触发+条件
gTrg.RegAnyUnitDamageEvent(function()
    if not gU.isEnemy(GetEventDamageSource(), GetTriggerPlayer()) then
        return
    end

    local trgU, trgP = GetTriggerUnit(), GetTriggerPlayer()
    local source = GetEventDamageSource()
    local harm = string.format('%.f', GetEventDamage())

    gTag.newUnit("|cffff0000" ..harm , 0.027, trgU, 1.66, 190, GetRandomInt(0, 180))
end)

return mt
