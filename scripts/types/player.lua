local mt = {}

-- 玩家 现有黄金
mt.PLAYER_STATE_RESOURCE_GOLD = PLAYER_STATE_RESOURCE_GOLD
-- 玩家 现有木头
mt.PLAYER_STATE_RESOURCE_LUMBER = PLAYER_STATE_RESOURCE_LUMBER

-- 获取玩家状态
function mt.getPlayerState(whichPlayer, whichPlayerState)
    return GetPlayerState(whichPlayer, whichPlayerState)
end

-- 设置玩家状态
function mt.setPlayerState(whichPlayer, whichPlayerState, delta)
    local oldState = GetPlayerState(whichPlayer, whichPlayerState)
    if oldState + delta < 0 then
        log.debug('异常：设置玩家状态：', oldState + delta)
    end

    SetPlayerState(whichPlayer, whichPlayerState, oldState + delta)
end

-- 调整玩家状态
function mt.adjustPlayerState(delta, whichPlayer, whichPlayerState)
    -- If the change was positive, apply the difference to the player's
    -- gathered resources property as well.
    -- 如果变化为正，则将差异应用于玩家收集的资源和财产。
    if delta > 0 then
        if whichPlayerState == PLAYER_STATE_RESOURCE_GOLD then
            AdjustPlayerStateSimpleBJ(whichPlayer, PLAYER_STATE_GOLD_GATHERED, delta)
        elseif whichPlayerState == PLAYER_STATE_RESOURCE_LUMBER then
            AdjustPlayerStateSimpleBJ(whichPlayer, PLAYER_STATE_LUMBER_GATHERED, delta)
        end
    end

    AdjustPlayerStateSimpleBJ(whichPlayer, whichPlayerState, delta)
end

-- 是否用户玩家
function mt.isUserPlayer(i)
    local bolA = GetPlayerController(Player(i)) == MAP_CONTROL_USER
    local bolB = GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING
    return bolA and bolB
end

-- 是否本地玩家
function mt.isLocalPlayer(key)
    for i = 0, 15 do
        if key == Player(i) then
            return GetLocalPlayer() == key
        end
    end
    return GetLocalPlayer() == GetOwningPlayer(key)
end

-- 获取单位所有者
function mt.getOwning(unit)
    return GetOwningPlayer(unit)
end

return mt
