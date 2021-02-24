map = require 'map.global'

-- 时间
require 'scope.time'
-- 鼠标提示
--require 'map.tip.init'
-- 地图初始化
local function map_main()
    gFog.setBlackShadow(false)
    gFog.setWarDenseFog(false)
    gP.setState(Player(0), PLAYER_STATE.RESOURCE_GOLD, 100000)
    gP.setState(Player(0), PLAYER_STATE.RESOURCE_LUMBER, 100)
    --载入英雄
    require 'map.hero.init'
    require 'map.bag.init'
end

map_main()
