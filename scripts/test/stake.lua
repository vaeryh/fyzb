local map = require 'map.global'

-- 英雄载入
local mt = {
    id = 'hfoo',
    num = 1,
    player = Player(13),
    life = 10000,
    mana = 1000,
    xy = {-526.4677734375, -9151.2509765625},
    atk = 100,
    def = 3
}

-- 选择英雄矩形
mt.rect_choose = map.rect['选择英雄矩形']

-- 创建并继承
function mt:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

local list={}
-- 魔法师
list.dfs = {
    id = 'Hamg',
    player = Player(12),
    life = 20000,
    mana = 1000,
    xy = {-526.4677734375, -9151.2509765625}
}
-- 骑士
list.qs = {
    id = 'hkni',
    life = 20000,
    xy = {363.86315917969, -8838.078125}
}
-- 火枪手
list.hqs = {
    id = 'hrif',
    player = Player(12),
    life = 20000,
    xy = {1022.3068847656, -10621.6953125},
    atk = 10000
}
-- 女巫
list.vw = {
    id = 'hsor',
    num = 3,
    player = Player(12),
    life = 20000,
    xy = {122.3068847656, -10621.6953125},
    atk = 100
}
-- 女巫
list.vw1 = {
    id = 'hsor',
    num = 3,
    player = Player(0),
    life = 1000,
    xy = {122.3068847656, -10621.6953125},
    atk = 100
}
--
function mt:createStake()
    for i = 1, self.num do
        local u = gU.create(self.player, self.id, self.xy[1], self.xy[2])
        gU.setState(u, UNIT_STATE.MAX_LIFE, self.life)
        gU.setState(u, UNIT_STATE.LIFE, self.life)
        gU.setState(u, UNIT_STATE.MAX_MANA, self.mana)
        gU.setState(u, UNIT_STATE.MANA, self.mana)
        gU.setState(u, UNIT_STATE.BASIC_DAMAGE, self.atk)
        gU.setState(u, UNIT_STATE.ARMOR, self.def)
    end
end

-- 初始化
for k, v in pairs(list) do
    if type(v) == 'table' then
        mt:new(v):createStake()
    end
end

return mt
