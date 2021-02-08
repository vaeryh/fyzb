local map = require 'map.global'

-- 载入
local mt = {
    id = 'stel',
    num = 1
}
-- 设置区域
mt.rect_create = gRect.create(-1526.46, -9151.25, -2000, -10000)

-- 创建并继承
function mt:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

--
function mt:create()
    for i = 1, self.num do
        local x, y = gRect.getRandom(mt.rect_create)
        local item = gIt.create(self.id, x, y)
    end
end

local list = {}

list.a = {
    id = 'I004',
    num = 9
}
list.b = {
    id = 'qh11',
    num = 9
}
list.c = {
    id = 'qh02',
    num = 9
}
list.d = {
    id = 'tz11',
    num = 9
}
list.e = {
    id = 'ankh',
    num = 9
}
-- 初始化
for k, v in pairs(list) do
    if type(v) == 'table' then
        mt:new(v):create()
    end
end

return mt
