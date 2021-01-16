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
-- 载入库
do
    -- 测试
    require 'test.init'
    -- 日志
    require 'util.log'
    require 'util.error'
end
-----------------------------------------------------------------------------------------
local function main()
    print 'YH:Hello Word!'
    -- 本地图库
    require 'map.init'
    -- 英雄
    require 'hero.init'


end

main()
