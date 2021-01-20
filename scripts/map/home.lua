local trg = require 'types.trigger'
local p = require 'types.player'
local yh = require 'types.yh'
local game = require 'types.game'
local rect = require 'types.rect'
local mt = {}
-- 主基地id
mt.id = 'bas1'

-- 回城
mt['回城矩形'] = gg_rct_HG
-----------------------------------------------------------------------------
-- 游戏失败条件：基地死亡
function mt.game_fail()
    trg.RegPlayerUnitEvent(Player(9), trg.EVENT_PLAYER_UNIT.DEATH, function()
        -- 条件
        if GetUnitTypeId(GetTriggerUnit()) == mt.id then
            game.CustomVictory(Player(11), true, false) -- 设置游戏失败
        end
    end)
end

-- 游戏胜利条件：
function mt.game_victory()

end
-----------------------------------------------------------------------------
-- 输入hg 回城
function mt.ChatHg()
    if string.upper(GetEventPlayerChatString()) == "HG" then
        yh.MoveAndCamera(Hero[GetTriggerPlayer()], rect.getCenter(mt['回城矩形']))
    end
end

for i = 0, 11 do
    gTrg.RegPlayerChatEvent(Player(i), GetEventPlayerChatString(), true, mt.ChatHg)
end
-----------------------------------------------------------------------------

-- 启用游戏失败触发
mt.game_fail()

return mt
