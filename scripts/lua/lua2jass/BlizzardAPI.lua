local g = require 'jass.globals'

local mt = {}
-----------------------------------------------------------------------------
-- tag创建Frame,名称可重复
-- set yh_frame1 = DzCreateFrameByTagName(yh_string1, "name", DzGetGameUI(), "template", 0)
function mt.CreateFrameByTagName(type)
    g.yh_string1 = type
    ExecuteFunc("yh_CreateFrameByTagName")
    return g.yh_frame1
end
-- 根据fdf文件创建Frame
-- call DzCreateFrame(yh_string1, DzGetGameUI(), 0)
function mt.CreateFrame(name)
    g.yh_string1 = name
    ExecuteFunc("yh_CreateFrame")
end
-- Frame设置尺寸
-- call DzFrameSetSize(yh_frame1, yh_real1, yh_real2)
function mt.FrameSetSize(frame, with, hight)
    g.yh_frame1 = frame
    g.yh_real1 = with
    g.yh_real2 = hight
    ExecuteFunc("yh_FrameSetSize")
end
-- Frame设置绝对位置锚点
-- call DzFrameSetAbsolutePoint(yh_frame1, yh_integer1, yh_real1, yh_real2)
function mt.FrameSetAbsolutePoint(frame, point, x, y)
    g.yh_frame1 = frame
    g.yh_integer1 = point
    g.yh_real1 = x
    g.yh_real2 = y
    ExecuteFunc("yh_FrameSetAbsolutePoint")
end
-- Frame设置相对位置锚点
-- call DzFrameSetPoint(yh_frame1, yh_integer1, yh_frame2, yh_integer2, yh_real1, yh_real2)
function mt.FrameSetPoint(frame1, point1, frame2, point2, x, y)
    g.yh_frame1 = frame1
    g.yh_integer1 = point1
    g.yh_frame2 = frame2
    g.yh_integer2 = point2
    g.yh_real1 = x
    g.yh_real2 = y
    ExecuteFunc("yh_FrameSetPoint")
end
-- Frame设置文字内容
-- call DzFrameSetText(yh_frame1, yh_string1)
function mt.FrameSetText(frame, text)
    g.yh_frame1 = frame
    g.yh_string1 = text
    ExecuteFunc("yh_FrameSetText")
end
-- Frame显示隐藏
-- call DzFrameShow(yh_frame1, yh_boolean1)
function mt.FrameShow(frame, bol)
    g.yh_frame1 = frame
    g.yh_boolean1 = bol
    ExecuteFunc("yh_FrameShow")
end
-- 获取物品栏按钮
-- set yh_frame1 = DzFrameGetItemBarButton(yh_integer1)
function mt.FrameGetItemBarButton(buttonId)
    g.yh_integer1 = buttonId
    ExecuteFunc("yh_FrameGetItemBarButton")
    return g.yh_frame1
end
-- 获取小地图按钮
-- set yh_frame1 = DzFrameGetMinimapButton(yh_integer1)
function mt.FrameGetMinimapButton(buttonId)
    g.yh_integer1 = buttonId
    ExecuteFunc("yh_FrameGetMinimapButton")
    return g.yh_frame1
end
-- 获取小地图frame
-- set yh_frame1 = DzFrameGetMinimap()
function mt.FrameGetMinimap()
    ExecuteFunc("yh_FrameGetMinimap")
    return g.yh_frame1
end
-- 设置frame透明度
-- call DzFrameSetAlpha(yh_frame1,yh_integer1)
function mt.FrameSetAlpha(frame, alpha)
    g.yh_frame1 = frame
    g.yh_integer1 = alpha
    ExecuteFunc("yh_FrameSetAlpha")
end
-- 根据名称寻找Frame
-- call DzFrameFindByName(yh_string1, 0)
function mt.FrameFindByName(name)
    g.yh_string1 = name
    ExecuteFunc("yh_FrameFindByName")
end
-- Frame设置按钮是否启用
-- call DzFrameSetEnable(yh_frame1, yh_boolean1)
function mt.FrameSetEnable(frame, bol)
    g.yh_frame1 = frame
    g.yh_boolean1 = bol
    ExecuteFunc("yh_FrameSetEnable")
end
-- 设置frame放大倍数
-- call DzFrameSetScale(yh_frame1, yh_real1)
function mt.FrameSetScale(frame, real)
    g.yh_frame1 = frame
    g.yh_real1 = real
    ExecuteFunc("yh_FrameSetScale")
end

-- 注册键盘key事件
-- call DzTriggerRegisterKeyEventByCode(yh_trigger,yh_integer1,yh_integer2,yh_boolean1,yh_code)
function mt.TriggerRegisterKeyEventByCode(trig, key, status, sync, action)
    log.debug('注册key：', key)
    g.yh_trigger = trig
    g.yh_integer1 = key
    g.yh_integer2 = status
    g.yh_boolean1 = sync
    g.yh_code = action
    ExecuteFunc("yh_TriggerRegisterKeyEventByCode")
end

-- 获取触发按键玩家
function mt.GetTriggerKeyPlayer(frame, real)
    ExecuteFunc("yh_GetTriggerKeyPlayer")
    return yh_player
end
-----------------------------单位属性-------------------------------------
-- 获取单位属性
function mt.GetUnitState(u, unitsate)
    g.yh_unit = u
    g.yh_unitstate = unitsate
    ExecuteFunc("yh_getUnitState")
    return g.yh_real1
end
-- 设置单位属性
function mt.SetUnitState(u, unitsate, delta)
    g.yh_unit = u
    g.yh_unitstate = unitsate
    g.yh_real1 = delta
    ExecuteFunc("yh_setUnitState")
end

return mt
