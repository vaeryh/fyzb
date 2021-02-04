local map = require 'map.global'

-- 英雄载入
local mt = {
    id = 'hfoo',
    player = Player(15),
    life = 10000,
    mana = 1000,
    xy = {-526.4677734375, -9151.2509765625}
}

-- 选择英雄矩形
mt.rect_choose = map.rect['选择英雄矩形']

-- 选择英雄音乐
mt.sound_choose = map.sound['选择英雄音乐']

-- 基地附近音乐
mt.sound_home = map.sound['基地附近音乐']

function mt:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end
-- 魔法师
local dfs = {
    id = 'Hamg',
    player = Player(12),
    life = 20000,
    mana = 1000,
    xy = {-526.4677734375, -9151.2509765625}
}

--
function mt:createStake()
    local u = gU.create(self.player, self.id, self.xy[1], self.xy[2])
    gU.setState(u, UNIT_STATE.MAX_LIFE, self.life)
    gU.setState(u, UNIT_STATE.LIFE, self.life)
    gU.setState(u, UNIT_STATE.MAX_MANA, self.mana)
    gU.setState(u, UNIT_STATE.MANA, self.mana)
end

-- 初始化
function mt.init()
    -- 大法师
    local dfs = mt:new(dfs)
    dfs:createStake()
end

mt.init()

return mt
