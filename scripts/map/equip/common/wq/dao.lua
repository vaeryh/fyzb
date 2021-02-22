local wq = require 'map.equip.common.wq'

local mt = {}
setmetatable(mt, wq)
mt.__index = mt

-- 类别
mt.class = "刀"

-- 擅长英雄
mt.goodHero = {'Nf00'}

-- 初始化
function mt:init()
    -- 打印
    self:printParentClass()
end

return mt
