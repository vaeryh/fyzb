local mt = {}

mt.type = 'unit'

-- 句柄
mt.handle = 0

-- 所有者
mt.owner = nil

-- 单位列表
mt.listUnit = {}

-- 重载动作
function mt:reload()
    for k, v in ipairs(self.listUnit) do
        -- log.debug("unit", k, v)
        gU.remove(v)
    end
    log.debug("unit", #gU.listUnit)
    mt.listUnit = nil
end

-- 创建单位
function mt:create(ower, id, x, y, face)
    self.handle = CreateUnit(ower or self.owner, gYh.switchId(id), x, y, face)
    table.insert(mt.listUnit, u)
    return u
end

return mt
