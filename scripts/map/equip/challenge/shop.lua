local shop = require 'types.oop.shop'

local mt = {}
setmetatable(mt, mt)
mt.__index = shop

-- 挑战：武器
mt.tz_wq = {
    id = 'tt11',
    xy = {-2900, -10400}
}
-- 挑战：防具
mt.tz_fj = {
    id = 'tt22',
    xy = {-2500, -10400}
}
-- 挑战：饰品
mt.tz_sp = {
    id = 'tt33',
    xy = {-2100, -10400}
}
-- 挑战：鞋子
mt.tz_xz = {
    id = 'tt44',
    xy = {-1700, -10400}
}

-- 挑战：材料1
mt.tz_cl1 = {
    id = 'tzs1',
    xy = {-4500.00, -10400.00}
}
-- 挑战：材料2
mt.tz_cl2 = {
    id = 'tzs2',
    xy = {-4100.00, -10400.00}
}
-- 挑战：材料3
mt.tz_cl3 = {
    id = 'tzs3',
    xy = {-3700.00, -10400.00}
}

mt:initPool()

return mt
