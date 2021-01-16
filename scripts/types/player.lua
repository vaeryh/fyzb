local jass = require 'jass.common'

local mt = {}

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

--获取单位所有者
function mt.getOwning(unit)
    return GetOwningPlayer(unit)
end


return mt
