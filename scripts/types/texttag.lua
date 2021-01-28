-- 漂浮文字
local mt = {}

-- 句柄
mt.handle = 0
-- 创建漂浮文字
function mt.create()
    mt.handle = CreateTextTag()
    return mt.handle
end

-- 设置文本内容，字体大小
function mt.setText(tag, str, size)
    SetTextTagText(tag, str, size)
end

-- 设置文字位置，Z轴高度
function mt.setPosUnit(tag, u, zOffset)
    SetTextTagPosUnit(tag, u, zOffset)
end

-- 设置文字颜色
function mt.setColor(tag, red, green, blue, alpha)
    SetTextTagColor(tag, red, green, blue, alpha)
end

-- 设置是否永久显示
function mt.setPermanent(tag, bol)
    SetTextTagPermanent(tag, bol)
end

-- 设置显示时间
function mt.setLifespan(tag, lifespan)
    SetTextTagLifespan(tag, lifespan)
end

-- 设置淡入点(消逝时间)
function mt.setFadepoint(tag, fadepoint)
    SetTextTagFadepoint(tag, fadepoint)
end

-- 设置漂浮文字移动速率、角度
function mt.setVelocity(speed, angle)
    local vel = speed * 0.071 / 128
    local xvel = vel * math.cos(angle * math.pi / 180.0)
    local yvel = vel * math.sin(angle * math.pi / 180.0)

    SetTextTagVelocity(mt.handle, xvel, yvel)
end

-- 新建漂浮文字
function mt.new(str, size, unit, showt)
    local tag = mt.create()
    mt.setText(tag, str, size)
    mt.setPosUnit(tag, unit, 0.00)
    mt.setPermanent(tag, false)
    mt.setLifespan(tag, showt)
    mt.setFadepoint(tag, showt * 0.66)
end

return mt
