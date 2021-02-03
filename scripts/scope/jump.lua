local MoveMoreLevel_JumpTimer = 3

function YDWEJumpTimer(hero, angle, distance, lasttime, timeout, heightMax)
    local x, y = GetUnitX(hero), GetUnitY(hero)
    local steepsMax = R2I(lasttime / timeout)
    local steeps = 0
    local dist = distance / steepsMax
    local dheig = 1.0 / steepsMax
    local OriginHeight = GetUnitFlyHeight(hero)
    -- local lvUnitMove = YDWEGetIntegerByString(I2S(YDWEH2I(hero)), "lvUnitMove")
    local lvUnitMove = 0
    if MoveMoreLevel_JumpTimer <= lvUnitMove then
        return
    end
    -- YDWESaveIntegerByString(I2S(YDWEH2I(hero)), "lvUnitMove", MoveMoreLevel_JumpTimer)
    gU.setFlyEnable(hero)
    gU.setPathing(hero, false)
    TimerStart(gT.create(), timeout, true, function()
        local x1, y1 = 0, 0
        local height = 0
        local lvJumpTimer = MoveMoreLevel_JumpTimer
        local lvUnitMove = 3
        if steeps < steepsMax and lvJumpTimer >= lvUnitMove then
            x1 = x + steeps * dist * Cos(angle * math.pi / 180.0)
            y1 = y + steeps * dist * Sin(angle * math.pi / 180.0)
            x1 = gRect.CoordinateXY(x1, y1)
            gU.setXY(hero,x1, y1)
            steeps = steeps + 1
            height = (-(2 * I2R(steeps) * dheig - 1) * (2 * I2R(steeps) * dheig - 1) + 1) * heightMax + OriginHeight
            gU.setFlyHeight(hero, height, 99999)
            gU.setFacing(hero, angle)
        else
            gU.setFlyHeight(hero, OriginHeight, 99999)
            gU.setPathing(hero, true)
            gT.remove()
            -- YDWESaveIntegerByString(I2S(YDWEH2I(hero)), "lvUnitMove", 0)
        end
    end)
end
