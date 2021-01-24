-- 地图初始化
local function map_main()
    gP.setState(Player(0), gP.PLAYER_STATE.RESOURCE_GOLD,100000 )
    gP.setState(Player(0), gP.PLAYER_STATE.RESOURCE_LUMBER,100)
    -- 选择难度 
    require 'map.select_difficulty'
    -- 准备倒计时
    require 'map.mapInit'
    require 'map.atk'
    -- 选择英雄+复活英雄
    require 'map.choose_hero'
    -- 开启home事件
    require 'map.home'
    -- 开启练功房
    require 'map.lgf'
end

map_main()
