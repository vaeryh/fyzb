local wq = require 'map.equip.common.wq'

local mt = {}
setmetatable(mt, wq)
mt.__index = mt

-- 类别
mt.class = "弓"

-- 擅长英雄
mt.goodHero = {'Fw00'}

-- 初始化
mt:classInit()

return mt
