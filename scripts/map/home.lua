local trg = require 'types.trigger'
local p = require 'types.player'
local yh = require 'types.yh'
local game = require 'types.game'

local mt = {}
-- 主基地id
mt.id = 'bas1'
--

-- 基地死亡，游戏失败
function mt.game_fail()
    local trig = trg.createTrigger(function()
        -- 条件
        if GetUnitTypeId(GetTriggerUnit()) == mt.id then
            game.CustomVictory(Player(11), true, false) -- 设置游戏失败
        end
    end)
    -- 触发
    trg.regPlayerEvent(trig, Player(9), trg.EVENT_PLAYER_UNIT_DEATH)
end

-- victory condition
function mt.game_victory()

end

-- 启用游戏失败触发
mt.game_fail()
