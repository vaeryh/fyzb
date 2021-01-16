local yh = require 'types.yh'

local mt = {}

-- 类型
mt.unit = "unit"

-- 单位类型
mt.unit_type = 'unit'

-- 句柄
mt.handle = 0

-- 所有者
mt.owner = nil

-- 存活
mt._is_alive = true

-- 物编Id
mt.id = "hfoo"

-- 名称
mt.name = "步兵"

-- 生命值
mt.hp = 100
-- 生命恢复 每0.2s

-- 魔法值
mt.mana = 100
-- 魔法恢复 每0.2s

-- 删除单位
function mt.remove(handle)
    return RemoveUnit(handle)
end

-- 单位是否存活
function mt.is_alive(handle)
    return GetUnitState(handle, UNIT_STATE_LIFE) > 0
end

-- 创建单位
function mt.create(p, id, x, y, face)
    log.info(id)
    return CreateUnit(p, yh.s2id(id), x, y, face)
end

-- 返回单位坐标
function mt.getXY(u)
    return GetUnitX(u), GetUnitY(u)
end
-- 获取单位X坐标
function mt.getX(u)
    return GetUnitX(u)
end
-- 获取单位Y坐标
function mt.getY(u)
    return GetUnitY(u)
end

-- 设置单位坐标
function mt.setUnitXY(u, x, y)
    SetUnitPosition( u, x, y )
end

return mt
