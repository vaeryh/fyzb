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

-- 继承：哪里用就继承谁
function mt:inherit(item)
    if not mt[item] then
        mt[item] = {}
        setmetatable(mt[item], self)
    end
    return mt[item]
end

-- 搜索父类是否存在
function mt:isHaveFather(class)
    local father = getmetatable(self)
    while father do
        if father.class == class then
            return true
        end
        father = getmetatable(father)
    end
    return false
end

-- 打印类别和父类
function mt:printParentClass()
    local text = {}
    text[1] = self.class
    local father = getmetatable(self)
    while father do
        table.insert(text, father.class)
        father = getmetatable(father)
    end
    local str = ""
    for i = #text, 1, -1 do
        str = str .. string.format("%s ", text[i])
    end
    print(str)
end

return mt
