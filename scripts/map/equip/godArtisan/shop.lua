local shop = require 'types.oop.shop'

local mt = {}
setmetatable(mt, mt)
mt.__index = shop

-- 打造:神匠
mt.tz_sj = {
    id = 'zz01',
    xy = {-4100, -10800}
}
-- 打造:材料1
mt.tz_cl1 = {
    id = 'zz02',
    xy = {-4500, -10800}
}
-- 打造:材料2
mt.tz_cl2 = {
    id = 'zz03',
    xy = {-3800, -10800}
}

mt:initPool()

return mt
