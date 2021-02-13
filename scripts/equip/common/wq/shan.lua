local wq = require 'equip.common.wq'

local mt = {}
setmetatable(mt, wq)
mt.__index = mt

-- 类别
mt.class = "扇"

-- 擅长英雄
mt.goodHero = {'Qs00'}

mt:printParentClass()

return mt
