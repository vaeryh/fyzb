local zb = require 'equip.common.zb'

local mt = {}
setmetatable(mt, zb)
mt.__index = mt

-- -- 父类
-- mt.parent = "装备"
-- 类别
mt.class = "饰品"

mt:printParentClass()

return mt
