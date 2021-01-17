-- 地图初始化
local function map_main()
    -- 选择难度
    require 'map.select_difficulty'
    -- 准备倒计时
    require 'map.mapInit'
    require 'map.atk'
    -- 选择英雄+复活英雄
    require 'map.choose_hero'
    -- 开启home事件
    require 'map.home'
end

map_main()
