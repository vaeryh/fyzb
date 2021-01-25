-- 矩形区域结构
local mt = {}

-- 类型
mt.type = 'rect'

-- 4个数值
mt.minX = 0
mt.minY = 0
mt.maxX = 0
mt.maxY = 0

-- 获取4个值
function mt:get()
    return self.minX, self.minY, self.maxX, self.maxY
end

-- 获取矩形中心坐标
function mt.getCenter(rect)
    return GetRectCenterX(rect), GetRectCenterY(rect)
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

return mt
