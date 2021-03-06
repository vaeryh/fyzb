local dz = require 'library.BlizzardAPI'

-- 结构
local mt = {}

-- 结构类型
mt.type = 'frame'

mt.handle = 0 -- handle
mt.parent = nil -- 父亲 默认其实是游戏UI

mt.frameType = 'BACKDROP' -- 类型
mt.name = "name" -- 名字
mt.template = "template" -- 模板

mt.with = 0.01 -- 尺寸:宽
mt.hight = 0.01 -- 尺寸：高

mt.enable = false -- 启用 默认false
mt.show = false -- 显示 默认false

-- 相对位置
mt.relative = {
    point = 4, -- 锚点
    relativehandle = 0, -- 相对frame
    relativePoint = 4, -- 相对锚点
    x = 0, -- 相对偏移X
    y = 0 -- 相对偏移Y
}
-- 绝对位置
mt.absolute = {
    point = 4, -- 锚点
    x = 0.4, -- 绝对偏移X
    y = 0.4 -- 绝对偏移X
}

-- 'BACKDROP'
-- 'TEXT'
-- 'BUTTON' 'TEXTBUTTON' 'GLUETEXTBUTTON'

-- 创建UI tag
function mt:createByTag(frameType, parent, template)
    self.handle = dz.CreateFrameByTagName(frameType, nil, parent, template)
    return self.handle
end

-- 设置尺寸
function mt:setSize(with, hight)
    dz.FrameSetSize(self.handle, with or self.with, hight or self.hight)
    return self
end

-- 设置显示
function mt:setShow(show)
    dz.FrameShow(self.handle, show or self.show)
    return self
end

-- 设置绝对位置
function mt:setAbsolute(point, x, y)
    point = point or self.absolute.point
    dz.FrameSetAbsolutePoint(self.handle, point, x or self.absolute.x, y or self.absolute.y)
    return self
end
-- 设置相对位置
function mt:setRelative(point, relativehandle, relativePoint, x, y)
    point = point or self.relative.point
    relativehandle = relativehandle or self.relative.relativehandle
    relativePoint = relativePoint or self.relative.relativePoint
    x = x or self.relative.x
    y = y or self.relative.y
    dz.FrameSetPoint(self.handle, point, relativehandle, relativePoint, x, y)
    return self
end

-- 设置启用 背景不适用(已经测试)
function mt:setEnable(enable)
    dz.FrameSetEnable(self.handle, enable or self.enable)
    return self
end
-- 获取启用
function mt:getEnable()
    return dz.FrameGetEnable(self.handle)
end

-- 设置鼠标高亮
function mt:setMouseHighlight()
    local tooltip = mt:createByTag("BACKDROP", nil, self.handle)
    mt:setTexture(tooltip, "UI\\Widgets\\EscMenu\\Human\\quest-button-highlight.blp")
    dz.FrameSetAllPoints(tooltip, self.handle)
    dz.FrameSetTooltip(self.handle, tooltip)
end

return mt
