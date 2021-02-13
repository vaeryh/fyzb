local mt = {}

gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.SELECTED, function()
    local trgU = GetTriggerUnit()

end)

gDz.RegMouseItemBarAction("进入", function()
    local p = gDz.GetTriggerUIEventPlayer()
    printF("进入", gDz.getItemBarIndex(p), GetPlayerName(p))
end)

gDz.RegMouseItemBarAction("离开", function()
    local p = gDz.GetTriggerUIEventPlayer()
    printF("离开", gDz.getItemBarIndex(p), GetPlayerName(p))
end)
