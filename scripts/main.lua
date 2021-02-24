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
-- library
require 'library.init'
-- scope库
require 'scope.init'
-- 测试
require 'test.init'
-- 地图初始化
require 'map.init'
