local g = require 'jass.globals'
local trg = require 'types.trigger'

local mt = {}
-----------------------------------------------------------------------------
mt.listFrame = {}

-- 重载
function mt:reload()
    for k, v in ipairs(self.listFrame) do
        self.DestroyFrame(v)
    end
    log.debug("Frame", #self.listFrame)
end
---------------------------------------------------------------------------------------------------
-- hardware
-- native DzGetMouseTerrainX takes nothing returns real
-- 获取鼠标在游戏内的坐标X
function mt.GetMouseTerrainX()
    ExecuteFunc("yh_GetMouseTerrainX")
    return g.yh_real1
end
-- native DzGetMouseTerrainY takes nothing returns real
-- 获取鼠标在游戏内的坐标Y
function mt.GetMouseTerrainY()
    ExecuteFunc("yh_GetMouseTerrainY")
    return g.yh_real1
end
-- native DzGetMouseTerrainZ takes nothing returns real
-- 获取鼠标在游戏内的坐标Z
function mt.GetMouseTerrainZ()
    ExecuteFunc("yh_GetMouseTerrainZ")
    return g.yh_real1
end
-- native DzIsMouseOverUI takes nothing returns boolean
-- 鼠标是否在游戏内
function mt.IsMouseOverUI()
    ExecuteFunc("yh_IsMouseOverUI")
    return g.yh_boolean1
end
-- native DzGetMouseX takes nothing returns integer
-- 获取鼠标在屏幕的坐标X
function mt.GetMouseX()
    ExecuteFunc("yh_GetMouseX")
    return g.yh_integer1
end
-- native DzGetMouseY takes nothing returns integer
-- 获取鼠标在屏幕的坐标Y
function mt.GetMouseY()
    ExecuteFunc("yh_GetMouseY")
    return g.yh_integer1
end
-- native DzGetMouseXRelative takes nothing returns integer
-- 获取鼠标游戏窗口坐标X
function mt.GetMouseXRelative()
    ExecuteFunc("yh_GetMouseXRelative")
    return g.yh_integer1
end
-- native DzGetMouseYRelative takes nothing returns integer
-- 获取鼠标游戏窗口坐标Y
function mt.GetMouseYRelative()
    ExecuteFunc("yh_GetMouseYRelative")
    return g.yh_integer1
end
-- native DzSetMousePos takes integer x, integer y returns nothing
-- 设置鼠标的坐标
function mt.SetMousePos(x, y)
    g.yh_integer1 = x
    g.yh_integer2 = y
    ExecuteFunc("yh_SetMousePos")
end

-- native DzTriggerRegisterMouseEvent takes trigger trig, integer btn, integer status, boolean sync, string func returns nothing
-- 注册鼠标事件  1.鼠标左键 2.鼠标右键; 1.点击 0.释放
-- code类型是数字与函数无法交互
function mt.TriggerRegisterMouseEvent(btn, status, sync, func)
    g.yh_trigger = trg.create(func)
    g.yh_integer1 = btn
    g.yh_integer2 = status
    g.yh_boolean1 = sync
    g.yh_string1 = nil
    ExecuteFunc("yh_TriggerRegisterMouseEvent")
end

-- native DzTriggerRegisterMouseEventByCode takes trigger trig, integer btn, integer status, boolean sync, code funcHandle returns nothing
-- 注册鼠标事件  code类型是数字与函数无法交互
-- function mt.TriggerRegisterMouseEventByCode(trig, btn, status, sync, funcHandle)
--     log.debug('注册鼠标事件', btn)
--     g.yh_trigger = trig
--     g.yh_integer1 = btn
--     g.yh_integer2 = status
--     g.yh_boolean1 = sync
--     g.yh_code = funcHandle
--     ExecuteFunc("yh_TriggerRegisterMouseEventByCode")
-- end

-- native DzTriggerRegisterKeyEvent takes trigger trig, integer key, integer status, boolean sync, string func returns nothing
-- 注册键盘key事件
function mt.TriggerRegisterKeyEvent(key, status, sync, func)
    g.yh_trigger = trg.create(func)
    g.yh_integer1 = key
    g.yh_integer2 = status
    g.yh_boolean1 = sync
    g.yh_string1 = nil
    ExecuteFunc("yh_TriggerRegisterKeyEvent")
    return g.yh_trigger
end

-- native DzTriggerRegisterKeyEventByCode takes trigger trig, integer key, integer status, boolean sync, code funcHandle returns nothing
-- 注册键盘key事件
-- function mt.TriggerRegisterKeyEventByCode(trig, key, status, sync, funcHandle)
--     log.debug('注册key：', key)
--     g.yh_trigger = trig
--     g.yh_integer1 = key
--     g.yh_integer2 = status
--     g.yh_boolean1 = sync
--     g.yh_code = funcHandle
--     ExecuteFunc("yh_TriggerRegisterKeyEventByCode")
-- end
-- native DzTriggerRegisterMouseWheelEvent takes trigger trig, boolean sync, string func returns nothing
-- native DzTriggerRegisterMouseWheelEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing

-- native DzTriggerRegisterMouseMoveEvent takes trigger trig, boolean sync, string func returns nothing
-- 任意玩家移动鼠标
function mt.TriggerRegisterMouseMoveEvent(sync, func)
    g.yh_trigger = trg.create(func)
    g.yh_boolean1 = sync
    g.yh_string1 = nil
    ExecuteFunc("yh_TriggerRegisterMouseMoveEvent")
end

-- native DzTriggerRegisterMouseMoveEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
-- 任意玩家移动鼠标
-- function mt.TriggerRegisterMouseMoveEventByCode(trig, sync, funcHandle)
--     log.debug('注册鼠标移动事件')
--     g.yh_trigger = trig
--     g.yh_boolean1 = sync
--     g.yh_code = funcHandle
--     ExecuteFunc("yh_TriggerRegisterMouseMoveEventByCode")
-- end
-- native DzGetTriggerKey takes nothing returns integer
-- 事件响应 - 获取触发的按键
function mt.GetTriggerKey()
    ExecuteFunc("yh_GetTriggerKey")
    return g.yh_integer1
end
-- native DzGetWheelDelta takes nothing returns integer

-- native DzIsKeyDown takes integer iKey returns boolean
-- 判断按键是否按下 1.鼠标左键 2.鼠标右键 3.其他网上搜
function mt.IsKeyDown(iKey)
    g.yh_integer1 = iKey
    ExecuteFunc("yh_IsKeyDown")
    return g.yh_boolean1
end

-- native DzGetTriggerKeyPlayer takes nothing returns player
-- 事件响应 - 获取触发硬件事件的玩家
function mt.GetTriggerKeyPlayer()
    ExecuteFunc("yh_GetTriggerKeyPlayer")
    return g.yh_player
end

-- native DzGetWindowWidth takes nothing returns integer
-- 获取war3窗口宽度
function mt.GetWindowWidth()
    ExecuteFunc("yh_GetWindowWidth")
    return g.yh_integer1
end
-- native DzGetWindowHeight takes nothing returns integer
-- 获取魔兽窗口高度
function mt.GetWindowHeight()
    ExecuteFunc("yh_GetWindowHeight")
    return g.yh_integer1
end
-- native DzGetWindowX takes nothing returns integer
-- 获取魔兽窗口X坐标
function mt.GetWindowX()
    ExecuteFunc("yh_GetWindowX")
    return g.yh_integer1
end
-- native DzGetWindowY takes nothing returns integer
-- 获取魔兽窗口Y坐标
function mt.GetWindowY()
    ExecuteFunc("yh_GetWindowY")
    return g.yh_integer1
end
-- native DzTriggerRegisterWindowResizeEvent takes trigger trig, boolean sync, string func returns nothing
-- native DzTriggerRegisterWindowResizeEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
-- native DzIsWindowActive takes nothing returns boolean
---------------------------------------------------------------------------------------------------
-- --plus
-- native DzDestructablePosition takes destructable d, real x, real y returns nothing
-- native DzSetUnitPosition takes unit whichUnit, real x, real y returns nothing
-- native DzExecuteFunc takes string funcName returns nothing
-- native DzGetUnitUnderMouse takes nothing returns unit
-- native DzSetUnitTexture takes unit whichUnit, string path, integer texId returns nothing
-- native DzSetMemory takes integer address, real value returns nothing
-- native DzSetUnitID takes unit whichUnit, integer id returns nothing
-- native DzSetUnitModel takes unit whichUnit, string path returns nothing
-- 设置单位模型
function mt.SetUnitModel(u, path)
    g.yh_unit = u
    g.yh_string1 = path
    ExecuteFunc("yh_SetUnitModel")
end
-- native DzSetWar3MapMap takes string map returns nothing
-- native DzGetLocale takes nothing returns string
-- native DzGetUnitNeededXP takes unit whichUnit, integer level returns integer
---------------------------------------------------------------------------------------------------
-- --sync
-- native DzTriggerRegisterSyncData takes trigger trig, string prefix, boolean server returns nothing
-- 注册数据同步 标签为 ${prefix} 的数据被同步 | 来自平台:${server}
function mt.SyncData(trig, data, server)
    g.yh_trigger = trig
    g.yh_string1 = data
    g.yh_boolean1 = server
    ExecuteFunc("yh_SyncData")
end
-- native DzSyncData takes string prefix, string data returns nothing
-- 同步游戏数据 同步 标签：${prefix}  发送数据：${data}
function mt.SyncData(prefix, data)
    g.yh_string1 = prefix
    g.yh_string2 = data
    ExecuteFunc("yh_SyncData")
end
-- native DzGetTriggerSyncData takes nothing returns string
-- 事件响应 - 获取同步的数据
function mt.GetTriggerSyncData()
    ExecuteFunc("yh_GetTriggerSyncData")
    return g.yh_string1
end
-- native DzGetTriggerSyncPlayer takes nothing returns player
-- 事件响应 - 获取同步玩家
function mt.GetTriggerSyncPlayer()
    ExecuteFunc("yh_GetTriggerSyncPlayer")
    return g.yh_player
end
---------------------------------------------------------------------------------------------------
-- --gui
-- native DzFrameHideInterface takes nothing returns nothing
-- native DzFrameEditBlackBorders takes real upperHeight, real bottomHeight returns nothing
-- native DzFrameGetPortrait takes nothing returns integer
-- native DzFrameGetMinimap takes nothing returns integer
-- 获取小地图frame
function mt.FrameGetMinimap()
    ExecuteFunc("yh_FrameGetMinimap")
    return g.yh_frame1
end
-- native DzFrameGetCommandBarButton takes integer row, integer column returns integer
-- 原生 - 技能按钮
function mt.FrameGetCommandBarButton(row, col)
    g.yh_integer1 = row
    g.yh_integer2 = col
    ExecuteFunc("yh_FrameGetCommandBarButton")
    return g.yh_frame1
end
-- native DzFrameGetHeroBarButton takes integer buttonId returns integer
-- 原生 - 英雄按钮
function mt.FrameGetHeroBarButton()
    ExecuteFunc("yh_FrameGetHeroBarButton")
    return g.yh_frame1
end
-- native DzFrameGetHeroHPBar takes integer buttonId returns integer
-- 原生 - 英雄血条
function mt.FrameGetHeroHPBar()
    ExecuteFunc("yh_FrameGetHeroHPBar")
    return g.yh_frame1
end
-- native DzFrameGetHeroManaBar takes integer buttonId returns integer
-- 原生 - 英雄蓝条
function mt.FrameGetHeroManaBar()
    ExecuteFunc("yh_FrameGetHeroManaBar")
    return g.yh_frame1
end
-- native DzFrameGetItemBarButton takes integer buttonId returns integer
-- 获取物品栏按钮
function mt.FrameGetItemBarButton(buttonId)
    g.yh_integer1 = buttonId
    ExecuteFunc("yh_FrameGetItemBarButton")
    return g.yh_frame1
end
-- native DzFrameGetMinimapButton takes integer buttonId returns integer
-- 获取小地图按钮
function mt.FrameGetMinimapButton(buttonId)
    g.yh_integer1 = buttonId
    ExecuteFunc("yh_FrameGetMinimapButton")
    return g.yh_frame1
end
-- native DzFrameGetUpperButtonBarButton takes integer buttonId returns integer
-- native DzFrameGetTooltip takes nothing returns integer
-- 原生 - 鼠标提示
function mt.FrameGetTooltip()
    ExecuteFunc("yh_FrameGetTooltip")
    return g.yh_frame1
end
-- native DzFrameGetChatMessage takes nothing returns integer
-- native DzFrameGetUnitMessage takes nothing returns integer
-- native DzFrameGetTopMessage takes nothing returns integer
-- native DzGetColor takes integer r, integer g, integer b, integer a returns integer
-- native DzFrameSetUpdateCallback takes string func returns nothing
-- native DzFrameSetUpdateCallbackByCode takes code funcHandle returns nothing

-- native DzFrameShow takes integer frame, boolean enable returns nothing
-- Frame显示隐藏
function mt.FrameShow(frame, bol)
    g.yh_frame1 = frame
    g.yh_boolean1 = bol
    ExecuteFunc("yh_FrameShow")
end

-- native DzCreateFrame takes string frame, integer parent, integer id returns integer
-- 根据fdf文件创建Frame
function mt.CreateFrame(name)
    g.yh_string1 = name
    ExecuteFunc("yh_CreateFrame")
    table.insert(mt.listFrame, g.yh_frame1)
    return g.yh_frame1
end

-- native DzCreateSimpleFrame takes string frame, integer parent, integer id returns integer
-- native DzDestroyFrame takes integer frame returns nothing
-- 删除farme
function mt.DestroyFrame(frame)
    g.yh_frame1 = frame
    ExecuteFunc("yh_DestroyFrame")
end

-- native DzLoadToc takes string fileName returns nothing
-- 载入Toc文件
function mt.LoadToc(str)
    g.yh_string1 = str
    ExecuteFunc("yh_LoadToc")
end

-- native DzFrameSetPoint takes integer frame, integer point, integer relativeFrame, integer relativePoint, real x, real y returns nothing
-- Frame设置相对位置锚点
function mt.FrameSetPoint(frame, point, relativeFrame, relativePoint, x, y)
    g.yh_frame1 = frame
    g.yh_integer1 = point
    g.yh_frame2 = relativeFrame
    g.yh_integer2 = relativePoint
    g.yh_real1 = x
    g.yh_real2 = y
    ExecuteFunc("yh_FrameSetPoint")
end

-- native DzFrameSetAbsolutePoint takes integer frame, integer point, real x, real y returns nothing
-- Frame设置绝对位置锚点
function mt.FrameSetAbsolutePoint(frame, point, x, y)
    g.yh_frame1 = frame
    g.yh_integer1 = point
    g.yh_real1 = x
    g.yh_real2 = y
    ExecuteFunc("yh_FrameSetAbsolutePoint")
end

-- native DzFrameClearAllPoints takes integer frame returns nothing
-- 清空所有锚点
function mt.FrameClearAllPoints(frame)
    g.yh_frame1 = frame
    ExecuteFunc("yh_FrameClearAllPoints")
end
-- native DzFrameSetEnable takes integer name, boolean enable returns nothing
-- Frame设置按钮是否启用
function mt.FrameSetEnable(frame, bol)
    g.yh_frame1 = frame
    g.yh_boolean1 = bol
    ExecuteFunc("yh_FrameSetEnable")
end

-- native DzFrameSetScript takes integer frame, integer eventId, string func, boolean sync returns nothing
-- 注册Frame UI事件回调
function mt.FrameSetScript(frame, eventid, func, bol)
    g.yh_frame1 = frame
    g.yh_integer1 = eventid
    g.yh_string1 = func
    g.yh_boolean1 = bol
    ExecuteFunc("yh_FrameSetScript")
end
-- native DzFrameSetScriptByCode takes integer frame, integer eventId, code funcHandle, boolean sync returns nothing
-- 注册Frame UI事件回调
function mt.FrameSetScriptByCode(frame, eventid, funcHandle, bol)
    g.yh_frame1 = frame
    g.yh_integer1 = eventid
    g.yh_code = funcHandle
    print(g.yh_code, type(g.yh_code))
    print(funcHandle, type(funcHandle))
    g.yh_boolean1 = bol
    ExecuteFunc("yh_FrameSetScriptByCode")
end

-- native DzGetTriggerUIEventPlayer takes nothing returns player
-- 事件响应 - 获取触发ui的玩家
function mt.GetTriggerUIEventPlayer()
    ExecuteFunc("yh_GetTriggerUIEventPlayer")
    return g.yh_player
end
-- native DzGetTriggerUIEventFrame takes nothing returns integer
-- 事件响应 - 触发的Frame
function mt.GetTriggerUIEventFrame()
    ExecuteFunc("yh_GetTriggerUIEventFrame")
    return g.yh_frame1
end
-- native DzFrameFindByName takes string name, integer id returns integer
-- 根据名称寻找Frame
function mt.FrameFindByName(name)
    g.yh_string1 = name
    ExecuteFunc("yh_FrameFindByName")
    return g.yh_frame1
end

-- native DzSimpleFrameFindByName takes string name, integer id returns integer
-- native DzSimpleFontStringFindByName takes string name, integer id returns integer
-- native DzSimpleTextureFindByName takes string name, integer id returns integer
-- native DzGetGameUI takes nothing returns integer
-- 原生 - 游戏UI 一般用作创建自定义UI的父节点
function mt.GetGameUI(name)
    ExecuteFunc("yh_GetGameUI")
    return g.yh_frame1
end
-- native DzClickFrame takes integer frame returns nothing
-- native DzSetCustomFovFix takes real value returns nothing
-- native DzEnableWideScreen takes boolean enable returns nothing
-- native DzFrameSetText takes integer frame, string text returns nothing
-- Frame设置文字内容
function mt.FrameSetText(frame, text)
    g.yh_frame1 = frame
    g.yh_string1 = text
    ExecuteFunc("yh_FrameSetText")
end

-- native DzFrameGetText takes integer frame returns string
-- native DzFrameSetTextSizeLimit takes integer frame, integer size returns nothing
-- native DzFrameGetTextSizeLimit takes integer frame returns integer
-- native DzFrameSetTextColor takes integer frame, integer color returns nothing

-- native DzGetMouseFocus takes nothing returns integer
-- 鼠标所在的Frame控件指针
function mt.GetMouseFocus()
    ExecuteFunc("yh_GetMouseFocus")
    return g.yh_frame1
end

-- native DzFrameSetAllPoints takes integer frame, integer relativeFrame returns boolean
-- 移动所有锚点到Frame
function mt.FrameSetAllPoints(frame, relativeFrame)
    g.yh_frame1 = frame
    g.yh_frame2 = relativeFrame
    ExecuteFunc("yh_FrameSetAllPoints")
    return g.yh_boolean1
end

-- native DzFrameSetFocus takes integer frame, boolean enable returns boolean
-- native DzFrameSetModel takes integer frame, string modelFile, integer modelType, integer flag returns nothing

-- native DzFrameGetEnable takes integer frame returns boolean
-- 获取按钮是否禁用
function mt.FrameGetEnable(frame)
    g.yh_frame1 = frame
    ExecuteFunc("yh_FrameGetEnable")
    return g.yh_boolean1
end

-- native DzFrameSetAlpha takes integer frame, integer alpha returns nothing
-- 设置frame透明度
function mt.FrameSetAlpha(frame, alpha)
    g.yh_frame1 = frame
    g.yh_integer1 = alpha
    ExecuteFunc("yh_FrameSetAlpha")
end
-- native DzFrameGetAlpha takes integer frame returns integer
-- native DzFrameSetAnimate takes integer frame, integer animId, boolean autocast returns nothing
-- native DzFrameSetAnimateOffset takes integer frame, real offset returns nothing

-- native DzFrameSetTexture takes integer frame, string texture, integer flag returns nothing
-- 设置frame贴图路径
function mt.FrameSetTexture(frame, texture, flag)
    g.yh_frame1 = frame
    g.yh_string1 = texture
    g.yh_integer1 = flag or 0
    ExecuteFunc("yh_FrameSetTexture")
end
-- native DzFrameSetScale takes integer frame, real scale returns nothing
-- 设置frame放大倍数
function mt.FrameSetScale(frame, real)
    g.yh_frame1 = frame
    g.yh_real1 = real
    ExecuteFunc("yh_FrameSetScale")
end
-- native DzFrameSetTooltip takes integer frame, integer tooltip returns nothing
-- 设置frame提示
function mt.FrameSetTooltip(frame, tooltip)
    g.yh_frame1 = frame
    g.yh_integer1 = tooltip
    ExecuteFunc("yh_FrameSetTooltip")
end
-- native DzFrameCageMouse takes integer frame, boolean enable returns nothing
-- native DzFrameGetValue takes integer frame returns real
-- native DzFrameSetMinMaxValue takes integer frame, real minValue, real maxValue returns nothing
-- native DzFrameSetStepValue takes integer frame, real step returns nothing
-- native DzFrameSetValue takes integer frame, real value returns nothing
-- native DzFrameSetSize takes integer frame, real w, real h returns nothing
-- Frame设置尺寸
function mt.FrameSetSize(frame, with, hight)
    g.yh_frame1 = frame
    g.yh_real1 = with
    g.yh_real2 = hight
    ExecuteFunc("yh_FrameSetSize")
end
-- native DzCreateFrameByTagName takes string frameType, string name, integer parent, string template, integer id returns integer
-- tag创建Frame,名称可重复
function mt.CreateFrameByTagName(frameType, name, parent, template)
    g.yh_string1 = frameType
    g.yh_string2 = name or "name"
    g.yh_integer1 = parent or mt.GetGameUI()
    g.yh_string3 = template or "template"
    -- g.yh_integer2 = id or 0 -- 可不填 因为不知道有何用处
    ExecuteFunc("yh_CreateFrameByTagName")
    table.insert(mt.listFrame, g.yh_frame1)
    return g.yh_frame1
end
-- native DzFrameSetVertexColor takes integer frame, integer color returns nothing
-- native DzOriginalUIAutoResetPoint takes boolean enable returns nothing
-- 自动复位UI初始位置
function mt.OriginalUIAutoResetPoint(enable)
    g.yh_boolean1 = enable
    ExecuteFunc("yh_OriginalUIAutoResetPoint")
end
-- native DzFrameSetPriority takes integer frame, integer priority returns nothing
-- 设置优先级 [NEW]
function mt.FrameSetPriority(frame, priority)
    g.yh_frame1 = frame
    g.yh_integer1 = priority
    ExecuteFunc("yh_FrameSetPriority")
end
-- native DzFrameSetParent takes integer frame, integer parent returns nothing
-- 设置父窗口 [NEW]
function mt.FrameSetParent(frame, parent)
    g.yh_frame1 = frame
    g.yh_integer1 = parent
    ExecuteFunc("yh_FrameSetParent")
end
-- native DzFrameGetHeight takes integer frame returns real
-- 获取 ${frame} 的高度
function mt.FrameGetHeight(frame)
    g.yh_frame1 = frame
    ExecuteFunc("yh_FrameGetHeight")
    return g.yh_real1
end
-- native DzFrameSetFont takes integer frame, string fileName, real height, integer flag returns nothing
-- 设置 ${frame} 的字体为 ${font}, 大小 ${height}, flag ${flag}
function mt.FrameSetFont(frame, fileName, height, flag)
    g.yh_frame1 = frame
    g.yh_string1 = fileName
    g.yh_real1 = height
    g.yh_integer1 = flag
    ExecuteFunc("yh_FrameSetFont")
end
-- native DzFrameGetParent takes integer frame returns integer
-- 获取父窗口 [NEW]
function mt.FrameGetParent(frame)
    g.yh_frame1 = frame
    ExecuteFunc("yh_FrameGetParent")
    return g.yh_frame2
end
-- native DzFrameSetTextAlignment takes integer frame, integer align returns nothing
-- 设置 ${frame} 的对齐方式为 ${align}
function mt.FrameSetTextAlignment(frame, align)
    g.yh_frame1 = frame
    g.yh_integer1 = align
    ExecuteFunc("yh_FrameSetTextAlignment")
end
-- native DzFrameGetName takes integer frame returns string
-- 获取 Frame 的 名称 [NEW]
function mt.FrameGetName(frame)
    g.yh_frame1 = frame
    ExecuteFunc("yh_FrameGetName")
    return g.yh_string1
end

return mt
