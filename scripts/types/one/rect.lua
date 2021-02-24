-- 矩形区域结构
local mt = {}

-- 类型
mt.type = 'rect'

--------------------------------------------------------------------------------------------------

-- 新建区域 [R]
function mt.regionCreate()
    return CreateRegion()
end
-- 删除不规则区域 [R]
function mt.regionRemove(region)
    RemoveRegion(RemoveRegion)
end
-- 添加区域 [R]
function mt.regionAddRect(region, rect)
    RegionAddRect(region, rect)
end
-- 移除区域 [R]
function mt.regionClearRect(region, rect)
    RegionClearRect(region, rect)
end

--------------------------------------------------------------------------------------------------

-- 获取矩形中心坐标
function mt.getCenter(rect)
    return GetRectCenterX(rect), GetRectCenterY(rect)
end

-- 获取矩形随机坐标
function mt.getRandom(rect)
    return GetRandomReal(GetRectMinX(rect), GetRectMaxX(rect)), GetRandomReal(GetRectMinY(rect), GetRectMaxY(rect))
end

-- 获取矩形MaxX
function mt.getMaxX(rect)
    return GetRectMaxX(rect)
end

-- 获取矩形MaxY
function mt.getMaxY(rect)
    return GetRectMaxY(rect)
end

-- 获取矩形MinX
function mt.getMinX(rect)
    return GetRectMinX(rect)
end

-- 获取矩形MinY
function mt.getMinY(rect)
    return GetRectMinY(rect)
end

-- 完整地图区域
mt.getWorldBounds = GetWorldBounds()

-- 可用地图区域(这样写矩形是唯一的)
-- CAMERA_MARGIN_LEFT=0 CAMERA_MARGIN_RIGHT=1 CAMERA_MARGIN_TOP=2 CAMERA_MARGIN_BOTTOM=3
mt.getAbleArea = Rect(GetCameraBoundMinX() - GetCameraMargin(0), GetCameraBoundMinY() - GetCameraMargin(3),
                     GetCameraBoundMaxX() + GetCameraMargin(1), GetCameraBoundMaxY() + GetCameraMargin(2))

-- 创建一个矩形
function mt.create(minX, minY, maxX, maxY)
    return Rect(minX, minY, maxX, maxY)
end

local yd_MapMinX = GetCameraBoundMinX() - GetCameraMargin(CAMERA_MARGIN_LEFT)
local yd_MapMinY = GetCameraBoundMinY() - GetCameraMargin(CAMERA_MARGIN_BOTTOM)
local yd_MapMaxX = GetCameraBoundMaxX() + GetCameraMargin(CAMERA_MARGIN_RIGHT)
local yd_MapMaxY = GetCameraBoundMaxY() + GetCameraMargin(CAMERA_MARGIN_TOP)

-- 地图边界判断
function mt.CoordinateXY(x, y)
    local x = math.min(math.max(x, yd_MapMinX), yd_MapMaxX)
    local y = math.min(math.max(y, yd_MapMinY), yd_MapMaxY)
    return x, y
end
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> +* 是否 *+ <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- 矩形是否包含坐标
function mt.isContainsCoords(r, x, y)
    return GetRectMinX(r) <= x and x <= GetRectMaxX(r) and GetRectMinY(r) <= y and y <= GetRectMaxY(r)
end

-- 矩形是否包含点
function mt.isContainsLoc(r, loc)
    return mt.isContainsCoords(r, GetLocationX(loc), GetLocationY(loc))
end

-- 矩形是否包含单位
function mt.isContainsUnit(r, unit)
    return mt.isContainsCoords(r, GetUnitX(whichUnit), GetUnitY(whichUnit))
end

return mt
