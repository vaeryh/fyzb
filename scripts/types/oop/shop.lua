local mt = {}

-- 物编id
mt.id = 'ngme'

-- 坐标
mt.xy = {-526.467, -9151.250}

-- 所属
mt.owner = Player(15)

-- 生命值
mt.life = 100000

-- 继承商店类
function mt:new(o)
    o = o or {}
    setmetatable(o, o)
    o.__index = self
    return o
end

-- 创建市场
function mt:createStock(tab)
    local u = gU.create(self.owner or tab.owner, self.id, self.xy[1], self.xy[2])
    gU.setState(u, UNIT_STATE.MAX_LIFE, self.life)
    gU.setState(u, UNIT_STATE.LIFE, self.life)
end

-- 初始化池中单位
function mt:initPool()
    for k, v in pairs(self) do
        if type(v) == 'table' and v ~= mt then
            self:new(v):createStock(self)
        end
    end
end

return mt
