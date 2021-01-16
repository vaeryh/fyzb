local mt = {}

-- 计算两坐标距离
function mt.distanceXY(x0, y0, x1, y1)
    return math.sqrt((x0 - x1) ^ 2 + (y0 - y1) ^ 2)
end

-- 计算两坐标角度
function mt.angleXY(x0, y0, x1, y1)
    return math.deg(math.atan(y1 - y0, x1 - x0))
end

return mt
