local g = require 'jass.globals'

local mt = {}
-----------------------------------------------------------------------------
mt.listFrame = {}
---------------------------------------------------------------------------------------------------
-- hardware
-- 	   native DzGetMouseTerrainX takes nothing returns real
--     native DzGetMouseTerrainY takes nothing returns real
--     native DzGetMouseTerrainZ takes nothing returns real
--     native DzIsMouseOverUI takes nothing returns boolean
--     native DzGetMouseX takes nothing returns integer
--     native DzGetMouseY takes nothing returns integer
--     native DzGetMouseXRelative takes nothing returns integer
--     native DzGetMouseYRelative takes nothing returns integer
--     native DzSetMousePos takes integer x, integer y returns nothing
--     native DzTriggerRegisterMouseEvent takes trigger trig, integer btn, integer status, boolean sync, string func returns nothing
--     native DzTriggerRegisterMouseEventByCode takes trigger trig, integer btn, integer status, boolean sync, code funcHandle returns nothing
--     native DzTriggerRegisterKeyEvent takes trigger trig, integer key, integer status, boolean sync, string func returns nothing
--     native DzTriggerRegisterKeyEventByCode takes trigger trig, integer key, integer status, boolean sync, code funcHandle returns nothing
-- 注册键盘key事件
function mt.TriggerRegisterKeyEventByCode(trig, key, status, sync, action)
    log.debug('注册key：', key)
    g.yh_trigger = trig
    g.yh_integer1 = key
    g.yh_integer2 = status
    g.yh_boolean1 = sync
    g.yh_code = action
    ExecuteFunc("yh_TriggerRegisterKeyEventByCode")
end
--     native DzTriggerRegisterMouseWheelEvent takes trigger trig, boolean sync, string func returns nothing
--     native DzTriggerRegisterMouseWheelEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
--     native DzTriggerRegisterMouseMoveEvent takes trigger trig, boolean sync, string func returns nothing
--     native DzTriggerRegisterMouseMoveEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
--     native DzGetTriggerKey takes nothing returns integer
--     native DzGetWheelDelta takes nothing returns integer
--     native DzIsKeyDown takes integer iKey returns boolean
--     native DzGetTriggerKeyPlayer takes nothing returns player
-- 获取触发按键玩家
function mt.GetTriggerKeyPlayer(frame, real)
    ExecuteFunc("yh_GetTriggerKeyPlayer")
    return yh_player
end
--     native DzGetWindowWidth takes nothing returns integer
--     native DzGetWindowHeight takes nothing returns integer
--     native DzGetWindowX takes nothing returns integer
--     native DzGetWindowY takes nothing returns integer
--     native DzTriggerRegisterWindowResizeEvent takes trigger trig, boolean sync, string func returns nothing
--     native DzTriggerRegisterWindowResizeEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
--     native DzIsWindowActive takes nothing returns boolean
---------------------------------------------------------------------------------------------------
--     --plus
--     native DzDestructablePosition takes destructable d, real x, real y returns nothing
--     native DzSetUnitPosition takes unit whichUnit, real x, real y returns nothing
--     native DzExecuteFunc takes string funcName returns nothing
--     native DzGetUnitUnderMouse takes nothing returns unit
--     native DzSetUnitTexture takes unit whichUnit, string path, integer texId returns nothing
--     native DzSetMemory takes integer address, real value returns nothing
--     native DzSetUnitID takes unit whichUnit, integer id returns nothing
--     native DzSetUnitModel takes unit whichUnit, string path returns nothing
-- 设置单位模型
function mt.SetUnitModel(u, path)
    g.yh_unit = u
    g.yh_string1 = path
    ExecuteFunc("yh_SetUnitModel")
end
--     native DzSetWar3MapMap takes string map returns nothing
--     native DzGetLocale takes nothing returns string
--     native DzGetUnitNeededXP takes unit whichUnit, integer level returns integer
---------------------------------------------------------------------------------------------------
--     --sync
--     native DzTriggerRegisterSyncData takes trigger trig, string prefix, boolean server returns nothing
--     native DzSyncData takes string prefix, string data returns nothing
--     native DzGetTriggerSyncData takes nothing returns string
--     native DzGetTriggerSyncPlayer takes nothing returns player
---------------------------------------------------------------------------------------------------
--     --gui
--     native DzFrameHideInterface takes nothing returns nothing
--     native DzFrameEditBlackBorders takes real upperHeight, real bottomHeight returns nothing
--     native DzFrameGetPortrait takes nothing returns integer
--     native DzFrameGetMinimap takes nothing returns integer
-- 获取小地图frame
function mt.FrameGetMinimap()
    ExecuteFunc("yh_FrameGetMinimap")
    return g.yh_frame1
end
--     native DzFrameGetCommandBarButton takes integer row, integer column returns integer
--     native DzFrameGetHeroBarButton takes integer buttonId returns integer
--     native DzFrameGetHeroHPBar takes integer buttonId returns integer
--     native DzFrameGetHeroManaBar takes integer buttonId returns integer
--     native DzFrameGetItemBarButton takes integer buttonId returns integer
-- 获取物品栏按钮
function mt.FrameGetItemBarButton(buttonId)
    g.yh_integer1 = buttonId
    ExecuteFunc("yh_FrameGetItemBarButton")
    return g.yh_frame1
end
--     native DzFrameGetMinimapButton takes integer buttonId returns integer
-- 获取小地图按钮
function mt.FrameGetMinimapButton(buttonId)
    g.yh_integer1 = buttonId
    ExecuteFunc("yh_FrameGetMinimapButton")
    return g.yh_frame1
end
--     native DzFrameGetUpperButtonBarButton takes integer buttonId returns integer
--     native DzFrameGetTooltip takes nothing returns integer
--     native DzFrameGetChatMessage takes nothing returns integer
--     native DzFrameGetUnitMessage takes nothing returns integer
--     native DzFrameGetTopMessage takes nothing returns integer
--     native DzGetColor takes integer r, integer g, integer b, integer a returns integer
--     native DzFrameSetUpdateCallback takes string func returns nothing
--     native DzFrameSetUpdateCallbackByCode takes code funcHandle returns nothing
--     native DzFrameShow takes integer frame, boolean enable returns nothing
-- Frame显示隐藏
function mt.FrameShow(frame, bol)
    g.yh_frame1 = frame
    g.yh_boolean1 = bol
    ExecuteFunc("yh_FrameShow")
end
--     native DzCreateFrame takes string frame, integer parent, integer id returns integer
-- 根据fdf文件创建Frame
function mt.CreateFrame(name)
    g.yh_string1 = name
    ExecuteFunc("yh_CreateFrame")
end
--     native DzCreateSimpleFrame takes string frame, integer parent, integer id returns integer
--     native DzDestroyFrame takes integer frame returns nothing
-- 删除farme
function mt.DestroyFrame(frame)
    g.yh_frame1 = frame
    ExecuteFunc("yh_DestroyFrame")
end
--     native DzLoadToc takes string fileName returns nothing
-- 载入Toc文件
function mt.LoadToc(str)
    g.yh_string1 = str
    ExecuteFunc("yh_LoadToc")
end
--     native DzFrameSetPoint takes integer frame, integer point, integer relativeFrame, integer relativePoint, real x, real y returns nothing
-- Frame设置相对位置锚点
function mt.FrameSetPoint(frame1, point1, frame2, point2, x, y)
    g.yh_frame1 = frame1
    g.yh_integer1 = point1
    g.yh_frame2 = frame2
    g.yh_integer2 = point2
    g.yh_real1 = x
    g.yh_real2 = y
    ExecuteFunc("yh_FrameSetPoint")
end
--     native DzFrameSetAbsolutePoint takes integer frame, integer point, real x, real y returns nothing
-- Frame设置绝对位置锚点
function mt.FrameSetAbsolutePoint(frame, point, x, y)
    g.yh_frame1 = frame
    g.yh_integer1 = point
    g.yh_real1 = x
    g.yh_real2 = y
    ExecuteFunc("yh_FrameSetAbsolutePoint")
end
--     native DzFrameClearAllPoints takes integer frame returns nothing
--     native DzFrameSetEnable takes integer name, boolean enable returns nothing
-- Frame设置按钮是否启用
function mt.FrameSetEnable(frame, bol)
    g.yh_frame1 = frame
    g.yh_boolean1 = bol
    ExecuteFunc("yh_FrameSetEnable")
end
--     native DzFrameSetScript takes integer frame, integer eventId, string func, boolean sync returns nothing
--     native DzFrameSetScriptByCode takes integer frame, integer eventId, code funcHandle, boolean sync returns nothing
--     native DzGetTriggerUIEventPlayer takes nothing returns player
--     native DzGetTriggerUIEventFrame takes nothing returns integer
--     native DzFrameFindByName takes string name, integer id returns integer
-- 根据名称寻找Frame
function mt.FrameFindByName(name)
    g.yh_string1 = name
    ExecuteFunc("yh_FrameFindByName")
end
--     native DzSimpleFrameFindByName takes string name, integer id returns integer
--     native DzSimpleFontStringFindByName takes string name, integer id returns integer
--     native DzSimpleTextureFindByName takes string name, integer id returns integer
--     native DzGetGameUI takes nothing returns integer
--     native DzClickFrame takes integer frame returns nothing
--     native DzSetCustomFovFix takes real value returns nothing
--     native DzEnableWideScreen takes boolean enable returns nothing
--     native DzFrameSetText takes integer frame, string text returns nothing
-- Frame设置文字内容
function mt.FrameSetText(frame, text)
    g.yh_frame1 = frame
    g.yh_string1 = text
    ExecuteFunc("yh_FrameSetText")
end
--     native DzFrameGetText takes integer frame returns string
--     native DzFrameSetTextSizeLimit takes integer frame, integer size returns nothing
--     native DzFrameGetTextSizeLimit takes integer frame returns integer
--     native DzFrameSetTextColor takes integer frame, integer color returns nothing
--     native DzGetMouseFocus takes nothing returns integer
--     native DzFrameSetAllPoints takes integer frame, integer relativeFrame returns boolean
--     native DzFrameSetFocus takes integer frame, boolean enable returns boolean
--     native DzFrameSetModel takes integer frame, string modelFile, integer modelType, integer flag returns nothing
--     native DzFrameGetEnable takes integer frame returns boolean
--     native DzFrameSetAlpha takes integer frame, integer alpha returns nothing
-- 设置frame透明度
function mt.FrameSetAlpha(frame, alpha)
    g.yh_frame1 = frame
    g.yh_integer1 = alpha
    ExecuteFunc("yh_FrameSetAlpha")
end
--     native DzFrameGetAlpha takes integer frame returns integer
--     native DzFrameSetAnimate takes integer frame, integer animId, boolean autocast returns nothing
--     native DzFrameSetAnimateOffset takes integer frame, real offset returns nothing
--     native DzFrameSetTexture takes integer frame, string texture, integer flag returns nothing
--     native DzFrameSetScale takes integer frame, real scale returns nothing
-- 设置frame放大倍数
function mt.FrameSetScale(frame, real)
    g.yh_frame1 = frame
    g.yh_real1 = real
    ExecuteFunc("yh_FrameSetScale")
end
--     native DzFrameSetTooltip takes integer frame, integer tooltip returns nothing
--     native DzFrameCageMouse takes integer frame, boolean enable returns nothing
--     native DzFrameGetValue takes integer frame returns real
--     native DzFrameSetMinMaxValue takes integer frame, real minValue, real maxValue returns nothing
--     native DzFrameSetStepValue takes integer frame, real step returns nothing
--     native DzFrameSetValue takes integer frame, real value returns nothing
--     native DzFrameSetSize takes integer frame, real w, real h returns nothing
-- Frame设置尺寸
function mt.FrameSetSize(frame, with, hight)
    g.yh_frame1 = frame
    g.yh_real1 = with
    g.yh_real2 = hight
    ExecuteFunc("yh_FrameSetSize")
end
--     native DzCreateFrameByTagName takes string frameType, string name, integer parent, string template, integer id returns integer
-- tag创建Frame,名称可重复
function mt.CreateFrameByTagName(type)
    g.yh_string1 = type
    ExecuteFunc("yh_CreateFrameByTagName")
    table.insert(mt.listFrame, g.yh_frame1)
    return g.yh_frame1
end
--     native DzFrameSetVertexColor takes integer frame, integer color returns nothing
--     native DzOriginalUIAutoResetPoint takes boolean enable returns nothing
--     native DzFrameSetPriority takes integer frame, integer priority returns nothing
--     native DzFrameSetParent takes integer frame, integer parent returns nothing
--     native DzFrameGetHeight takes integer frame returns real
--     native DzFrameSetFont takes integer frame, string fileName, real height, integer flag returns nothing
--     native DzFrameGetParent takes integer frame returns integer
--     native DzFrameSetTextAlignment takes integer frame, integer align returns nothing
--     native DzFrameGetName takes integer frame returns string

return mt
