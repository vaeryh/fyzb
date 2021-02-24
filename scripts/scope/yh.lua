local mt = {}

----------------------------------------------------------------------------------------
-- 当数量级达1000000时，才会有0.01毫秒的效率差距
-- 转换256进制整数

-- id 转 字符串
function mt.id2s(a)
    local r = ('>I4'):pack(a)
    return r
end
-- 字符串 转 id
function mt.s2id(a)
    local r = ('>I4'):unpack(a)
    return r
end

-- 自动转换为id(id直接返回,字符串返回id)
function mt.switchId(value)
    if type(value) == 'number' then
        return value
    elseif type(value) == 'string' then
        return mt.s2id(value)
    else
        log.warn(value, '值不正常')
    end
end

----------------------------------------------------------------------------------------

-- 计算两坐标距离
function mt.distanceXY(x0, y0, x1, y1)
    return math.sqrt((x0 - x1) ^ 2 + (y0 - y1) ^ 2)
end

-- 计算两单位距离
function mt.distanceUnitToUnit(ua, ub)
    return mt.distanceXY(GetUnitX(ua), GetUnitY(ua), GetUnitX(ub), GetUnitY(ub))
end

-- 计算单位和物品距离
function mt.distanceUnitToItem(unit, item)
    return mt.distanceXY(GetUnitX(unit), GetUnitY(unit), GetItemX(item), GetItemY(item))
end
----------------------------------------------------------------------------------------

-- 计算两坐标角度
function mt.angleXY(x0, y0, x1, y1)
    return math.deg(math.atan(y1 - y0, x1 - x0))
end

-- 计算两单位角度
function mt.angleByUnit(ua, ub)
    return mt.angleXY(GetUnitX(ua), GetUnitY(ua), GetUnitX(ub), GetUnitY(ub))
end

----------------------------------------------------------------------------------------

-- 获取极坐标
function mt.getPolar(x, y, dist, angle)
    local x = x + dist * Cos(angle * math.pi / 180.0)
    local y = y + dist * Sin(angle * math.pi / 180.0)
    return x, y
end

-- 极坐标单位
function mt.getPolarUnit(source, dist, angle)
    return mt.getPolar(GetUnitX(source), GetUnitY(source), dist, angle)
end

----------------------------------------------------------------------------------------

-- 平移镜头+移动单位（坐标，免排泄）
function mt.MoveAndCamera(hero, x, y)
    if not hero then
        log.warn("移动单位为空", hero)
        return
    end
    local abi = mt.s2id('AHmt')
    -- 开始特效
    --- 施法者
    DestroyEffect(AddSpellEffectTargetById(abi, EFFECT_TYPE_CASTER, hero, "origin"))
    --- 区域
    DestroyEffect(AddSpellEffectTargetById(abi, EFFECT_TYPE_AREA_EFFECT, hero, "origin"))
    -- 开启计时器
    TimerStart(CreateTimer(), 0.77, false, function()
        -- 设置单位坐标
        SetUnitPosition(hero, x, y)
        -- 结束特效
        ---- 特殊效果
        DestroyEffect(AddSpellEffectTargetById(abi, EFFECT_TYPE_SPECIAL, hero, "origin"))
        -- 移动镜头
        if gP.isLocalPlayer(hero) then
            PanCameraToTimed(x, y, 0.33)
            SelectUnit(hero, true) -- 细节：移动镜头后玩家选择一下单位
        end
        DestroyTimer(GetExpiredTimer())
    end)
end

-- 查找表中是否存在某一个值
function mt.IsInTable(tab, vaule)
    for i, v in pairs(tab) do
        if vaule == v then
            return true
        end
    end
    return false
end

-- 遍历表
function mt.pairs(tab)
    for k, v in pairs(tab) do
        print(k, v)
        if type(v) == 'table' then
            mt.pairs(v)
        end
    end
end

return mt
