local mt = {}
mt.__index = mt

mt.type = 'item'

mt.handle = 0 -- 句柄

-- 类别
mt.class = "物品"

-- 所属玩家
mt.owner = Player(15)

-- 获取物品坐标
function mt:getXY(item)
    return GetItemX(item or self.handle), GetItemY(item or self.handle)
end

return mt
