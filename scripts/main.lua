local std_print = print
-- 打印输出时间
function print(...)
    std_print(('[%.3f]'):format(os.clock()), ...)
end
-- -- 测试打印
-- function debug(...)
--     std_print(("debug"..'[%.3f]'):format(os.clock()), ...)
-- end
-- 调用
local std_require = require

function require(...)
    if package.loaded[...] == nil then
        print(..., 'load success!!')
    end
    local bol = std_require(...)

    return bol
end

-----------------------------------------------------------------------------------------
-- 类型库
do
    gYh = require 'types.yh'
    gTrg = require 'types.trigger'
    gP = require 'types.player'
    gU = require 'types.unit'
    gH = require 'types.hero'
    gT = require 'types.timer'
    gRect = require 'types.rect'
    gCamera = require 'types.camera'
    gFog = require 'types.fogmodifier'
    gSound = require 'types.sound'
    gDia = require 'types.dialog'
    gGame = require 'types.game'
    gGroup = require 'types.group'
end
-- 外置库
do
    gDz = require 'lua.lua2jass.BlizzardAPI'
end
-- 测试库
do
    -- 测试
    require 'test.init'
    -- 日志
    require 'util.log'
    require 'util.error'
end
-----------------------------------------------------------------------------------------
-- local function main()
--     print 'YH:Hello Word!'
--     -- 本地图库
--     require 'map.init'
--     -- 英雄
--     require 'hero.init'

-- end

--main()
