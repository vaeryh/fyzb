map = require 'map.global'

-- 时间
require 'scope.time'
-- 鼠标提示
--require 'map.tip.init'
-- 地图初始化
local function map_main()
    gP.setState(Player(0), PLAYER_STATE.RESOURCE_GOLD, 100000)
    gP.setState(Player(0), PLAYER_STATE.RESOURCE_LUMBER, 100)
    -- 打开 玩家12 给予奖励
    gP.setState(Player(11), PLAYER_STATE.GIVES_BOUNTY, 1)
    -- 选择难度
    require 'map.select_difficulty'
    -- 载入地图功能
    require 'map.function.init'
    --载入英雄
    require 'map.hero.init'
    --载入装备
    require 'map.equip.init'
end

map_main()
