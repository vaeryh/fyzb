local mt = {}

-- 玩家状态
PLAYER_STATE = {
    -- 游戏得分
    GAME_RESULT = PLAYER_STATE_GAME_RESULT,

    -- 当前资源水平current resource levels

    -- 现有黄金
    RESOURCE_GOLD = PLAYER_STATE_RESOURCE_GOLD,
    -- 现有木头
    RESOURCE_LUMBER = PLAYER_STATE_RESOURCE_LUMBER,
    -- 剩余可用英雄
    RESOURCE_HERO_TOKENS = PLAYER_STATE_RESOURCE_HERO_TOKENS,
    -- 可用人口数
    RESOURCE_FOOD_CAP = PLAYER_STATE_RESOURCE_FOOD_CAP,
    -- 已使用人口数
    RESOURCE_FOOD_USED = PLAYER_STATE_RESOURCE_FOOD_USED,
    -- 最大人口上限
    FOOD_CAP_CEILING = PLAYER_STATE_FOOD_CAP_CEILING,
    -- 给予奖励
    GIVES_BOUNTY = PLAYER_STATE_GIVES_BOUNTY,
    -- 联盟胜利
    ALLIED_VICTORY = PLAYER_STATE_ALLIED_VICTORY,
    --
    PLACED = PLAYER_STATE_PLACED,
    --
    OBSERVER_ON_DEATH = PLAYER_STATE_OBSERVER_ON_DEATH,
    --
    OBSERVER = PLAYER_STATE_OBSERVER,
    -- 不可跟随
    UNFOLLOWABLE = PLAYER_STATE_UNFOLLOWABLE,

    -- 每种资源的税率taxation rate for each resource
    -- 金钱维修费率
    GOLD_UPKEEP_RATE = PLAYER_STATE_GOLD_UPKEEP_RATE,
    -- 木材维修费率
    LUMBER_UPKEEP_RATE = PLAYER_STATE_LUMBER_UPKEEP_RATE,

    -- 玩家在任务期间收集的累积资源cumulative resources collected by the player during the mission
    -- 总黄金采集量
    GOLD_GATHERED = PLAYER_STATE_GOLD_GATHERED,
    -- 总木材采集量
    LUMBER_GATHERED = PLAYER_STATE_LUMBER_GATHERED,

    NO_CREEP_SLEEP = PLAYER_STATE_NO_CREEP_SLEEP
}

-- 获取玩家状态
function mt.getState(whichPlayer, whichPlayerState)
    return GetPlayerState(whichPlayer, whichPlayerState)
end

-- 设置玩家状态
function mt.setState(whichPlayer, whichPlayerState, delta)
    SetPlayerState(whichPlayer, whichPlayerState, delta)
end

-- 调整玩家状态
function mt.adjustStateSimple(whichPlayer, whichPlayerState, delta)
    local newstate = mt.getState(whichPlayer, whichPlayerState) + delta
    if newstate < 0 then
        log.debug('异常：设置玩家状态：', whichPlayerState, newstate)
    end
    mt.setState(whichPlayer, whichPlayerState, newstate)
end
-- 调整玩家状态
function mt.adjustState(whichPlayer, whichPlayerState, delta)
    -- If the change was positive, apply the difference to the player's
    -- gathered resources property as well.
    -- 如果变化为正，则将差异应用于玩家收集的资源和财产。
    if delta > 0 then
        if whichPlayerState == PLAYER_STATE_RESOURCE_GOLD then
            mt.adjustStateSimple(whichPlayer, PLAYER_STATE_GOLD_GATHERED, delta)
        elseif whichPlayerState == PLAYER_STATE_RESOURCE_LUMBER then
            mt.adjustStateSimple(whichPlayer, PLAYER_STATE_LUMBER_GATHERED, delta)
        end
    end

    mt.adjustStateSimple(whichPlayer, whichPlayerState, delta)
end

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> +* 是否 *+ <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

-- 是否用户玩家
function mt.isUserPlayer(p)
    local bolA = GetPlayerController(p) == MAP_CONTROL_USER
    local bolB = GetPlayerSlotState(p) == PLAYER_SLOT_STATE_PLAYING
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

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> +* ?? *+ <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

-- 显示聊天信息计时
function mt.disTimedText(p, timeout, str)
    DisplayTimedTextToPlayer(p, 0, 0, timeout, str)
end

-- 获取玩家名字
function mt.getName(p)
    return GetPlayerName(p)
end
return mt
