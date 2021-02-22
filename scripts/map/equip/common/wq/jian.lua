local wq = require 'map.equip.common.wq'

local mt = {}
setmetatable(mt, wq)
mt.__index = mt

-- 类别
mt.class = "剑"

-- 擅长英雄
mt.goodHero = {'Bjy0', 'Dl00'}

-- 初始化
mt:classInit()

return mt
