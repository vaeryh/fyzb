-- 调用
-- local std_require = require
-- function require(...)
--     if package.loaded[...] == nil then
--         print(..., 'load success!!')
--     end
--     local bol = std_require(...)
--     return bol
-- end
-----------------------------------------------------------------------------------------
-- types类型库
require 'types.init'
-- scope库
require 'scope.init'
-- 测试
require 'test.init'
-- 本地图库
require 'map.init'
-- 英雄
require 'hero.init'
-- 装备
--require 'equip.init'
-- -----------------------------------------------------------------------------------------
-- local function main()
--     print 'YH:Hello Word!'
--     -- 本地图库
--     require 'map.init'
--     -- 英雄
--     require 'hero.init'

-- end

-- main()
-- local japi = require 'jass.japi'
-- for k, v in pairs(japi) do
--         print(k,v)
-- end
