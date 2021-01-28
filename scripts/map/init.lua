-- 地图初始化
local function map_main()
    gP.setState(Player(0), PLAYER_STATE.RESOURCE_GOLD, 100000)
    gP.setState(Player(0), PLAYER_STATE.RESOURCE_LUMBER, 100)
    -- 打开 玩家12 给予奖励
    gP.setState(Player(11), PLAYER_STATE.GIVES_BOUNTY, 1)
    -- 选择难度
    require 'map.select_difficulty'
    -- 准备倒计时
    require 'map.atk'
    -- 开启home事件
    require 'map.home'
    -- 开启练功房
    require 'map.lgf'
end

map_main()
