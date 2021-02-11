local mt = {}

mt.type = 'item'

mt.handle = 0 --句柄

-- 获取物品坐标
function mt:getXY(item)
    return GetItemX(item or self.handle), GetItemY(item or self.handle)
end

return mt
