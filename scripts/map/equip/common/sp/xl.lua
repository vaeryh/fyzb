local sp = require 'map.equip.common.sp'

local mt = {}
setmetatable(mt, sp)
mt.__index = mt

-- -- 父类
-- mt.parent = "饰品"
-- 类别
mt.class = "项链"

mt:printParentClass()

return mt
