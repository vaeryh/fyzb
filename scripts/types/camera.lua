
-- 矩形区域结构
local mt = {}
-- 类型
mt.type = '镜头'

-- 设置玩家镜头矩形区域边界
function mt.setCameraBounds(rect)
    local minX, minY = GetRectMinX(rect), GetRectMinY(rect)
    local maxX, maxY = GetRectMaxX(rect), GetRectMaxY(rect)
    SetCameraBounds(minX, minY, minX, maxY, maxX, maxY, maxX, minY)
end

return mt
