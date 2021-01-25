local mt = {}

mt.type = "group"

-- 单位组列表
mt.listGroup = {}

-- 创建单位组
function mt.create()
    local g = CreateGroup()
    table.insert(mt.listGroup, g)
    return g
end

-- 选取矩形内所有单位
function mt.getUnitInRect(r)
    local g = mt.create()
    GroupEnumUnitsInRect(g, r, nil)
    -- DestroyBoolExpr(filter)
    return g
end

-- 获取单位组单位数量
function mt.getCount(g)
    local count = 0
    ForGroup(g, function()
        count = count + 1
    end)

    return count
end

-- 单位组移除单位
function mt.removeUnit(g, unit)
    GroupRemoveUnit(g, unit)
end

-- 删除单位组
function mt.remove(g)
    DestroyGroup(g)
end

return mt
