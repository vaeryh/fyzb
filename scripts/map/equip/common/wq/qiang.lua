local wq = require 'map.equip.common.wq'

local mt = {}
setmetatable(mt, wq)
mt.__index = mt

-- 类别
mt.class = "枪"

-- 擅长英雄
mt.goodHero = {''}

mt:printParentClass()

return mt
