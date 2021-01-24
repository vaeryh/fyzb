local mt = {}

mt.type = "group"

--单位数量
mt.count = 0

-- 选取矩形内所有单位
function mt.getUnitInRect(r)
    local g = CreateGroup()
    GroupEnumUnitsInRect(g, r, nil)
    -- DestroyBoolExpr(filter)
    return g
end

--
function mt.CountEnum()
    mt.count = mt.count + 1
end

-- 获取单位组单位数量
function mt.getCount(g)
    mt.count = 0
    ForGroup(g, mt.CountEnum)

    return mt.count
end

return mt
