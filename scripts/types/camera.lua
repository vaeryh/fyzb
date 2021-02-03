-- 镜头
local mt = {}
-- 类型
mt.type = '镜头'

-- 设置玩家镜头矩形区域边界
function mt.setCameraBounds(rect, player)
    local minX, minY = GetRectMinX(rect), GetRectMinY(rect)
    local maxX, maxY = GetRectMaxX(rect), GetRectMaxY(rect)
    if player then
        if gP.isLocalPlayer(player) then
            SetCameraBounds(minX, minY, minX, maxY, maxX, maxY, maxX, minY)
        end
    else
        SetCameraBounds(minX, minY, minX, maxY, maxX, maxY, maxX, minY)
    end
end

return mt
