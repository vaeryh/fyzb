local mt = {}

-- 转换256进制整数
function mt.s2id(a) -- 转为id
    local n1 = string.byte(a, 1) or 0
    local n2 = string.byte(a, 2) or 0
    local n3 = string.byte(a, 3) or 0
    local n4 = string.byte(a, 4) or 0
    local r = n1 * 256 * 256 * 256 + n2 * 256 * 256 + n3 * 256 + n4
    return r
end

-- 转为string
function mt.id2s(a)
    local s1 = math.floor(a / 256 / 256 / 256) % 256
    local s2 = math.floor(a / 256 / 256) % 256
    local s3 = math.floor(a / 256) % 256
    local s4 = a % 256
    local r = string.char(s1, s2, s3, s4)
    return r
end
-- 自动转换为id(id直接返回,字符串返回id)
function mt.switch(value)
    if type(value) == 'number' then
        return value
    elseif type(value) == 'string' then
        return mt.s2id(value)
    else
        log.warn(value,'值不正常')
    end
end
----------------------------------------------------------------------------------------

-- 计算两坐标距离
function mt.distanceXY(x0, y0, x1, y1)
    return math.sqrt((x0 - x1) ^ 2 + (y0 - y1) ^ 2)
end

-- 计算两单位距离
function mt.distanceByUnit(ua, ub)
    return mt.distanceXY(GetUnitX(ua), GetUnitY(ua), GetUnitX(ub), GetUnitY(ub))
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
function mt.MoveAndCamera(whichHero, x, y)
    local abi = mt.s2id('AHmt')
    -- 开始特效
    --- 施法者
    DestroyEffect(AddSpellEffectTargetById(abi, EFFECT_TYPE_CASTER, whichHero, "origin"))
    --- 区域
    DestroyEffect(AddSpellEffectTargetById(abi, EFFECT_TYPE_AREA_EFFECT, whichHero, "origin"))
    -- 开启计时器
    TimerStart(CreateTimer(), 0.77, false, function()
        -- 设置单位坐标
        SetUnitPosition(whichHero, x, y)
        -- 结束特效
        ---- 特殊效果
        DestroyEffect(AddSpellEffectTargetById(abi, EFFECT_TYPE_SPECIAL, whichHero, "origin"))
        -- 移动镜头
        if gP.isLocalPlayer(whichHero) then
            PanCameraToTimed(x, y, 0.33)
            SelectUnit(whichHero, true) -- 细节：移动镜头后玩家选择一下单位
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

return mt
