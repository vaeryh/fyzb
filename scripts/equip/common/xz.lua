local zb = require 'equip.common.zb'

local mt = {}
setmetatable(mt, zb)
mt.__index = mt

-- 类别
mt.class = "鞋子"

mt:printParentClass()

return mt
