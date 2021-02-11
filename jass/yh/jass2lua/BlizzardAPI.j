scope yh

globals
	trigger yh_trigger = null
	string yh_string1 = "stringyh1"
	string yh_string2 = "stringyh2"
	string yh_string3 = "stringyh3"
	integer yh_integer1 = 0
	integer yh_integer2 = 0
	integer yh_integer3 = 0
	integer yh_integer4 = 0
	integer yh_integer5 = 0
	integer yh_integer6 = 0
	integer yh_frame1 = 0
	integer yh_frame2 = 0
	integer yh_frame3 = 0
	real yh_real1 = 0.00
	real yh_real2 = 0.00
	real yh_real3 = 0.00
	real yh_real4 = 0.00
	real yh_real5 = 0.00
	real yh_real6 = 0.00
	boolean yh_boolean1 = false
	boolean yh_boolean2 = false
	boolean yh_boolean3 = false
	code yh_code = null
	player yh_player = null
	unit yh_unit = null
	unitstate yh_unitstate = null
endglobals
//-------------------------------------------------------------------------------------------------
//hardware
// 	   native DzGetMouseTerrainX takes nothing returns real
// 获取鼠标在游戏内的坐标X
public function GetMouseTerrainX takes nothing returns nothing
	set yh_real1 = DzGetMouseTerrainX()
endfunction
//     native DzGetMouseTerrainY takes nothing returns real
// 获取鼠标在游戏内的坐标Y
public function GetMouseTerrainY takes nothing returns nothing
	set yh_real1 = DzGetMouseTerrainY()
endfunction
//     native DzGetMouseTerrainZ takes nothing returns real
// 获取鼠标在游戏内的坐标Z
public function GetMouseTerrainZ takes nothing returns nothing
	set yh_real1 = DzGetMouseTerrainZ()
endfunction
//     native DzIsMouseOverUI takes nothing returns boolean
// 鼠标是否在游戏内
public function IsMouseOverUI takes nothing returns nothing
	set yh_boolean1 = DzIsMouseOverUI()
endfunction
//     native DzGetMouseX takes nothing returns integer
// 获取鼠标在屏幕的坐标X
public function GetMouseX takes nothing returns nothing
	set yh_integer1 = DzGetMouseX()
endfunction
//     native DzGetMouseY takes nothing returns integer
// 获取鼠标在屏幕的坐标Y
public function GetMouseY takes nothing returns nothing
	set yh_integer1 = DzGetMouseY()
endfunction
//     native DzGetMouseXRelative takes nothing returns integer
// 获取鼠标游戏窗口坐标X
public function GetMouseXRelative takes nothing returns nothing
	set yh_integer1 = DzGetMouseXRelative()
endfunction
//     native DzGetMouseYRelative takes nothing returns integer
// 获取鼠标游戏窗口坐标Y
public function GetMouseYRelative takes nothing returns nothing
	set yh_integer1 = DzGetMouseYRelative()
endfunction
//     native DzSetMousePos takes integer x, integer y returns nothing
//设置鼠标的坐标
public function SetMousePos takes nothing returns nothing
	call DzSetMousePos(yh_integer1, yh_integer2)
endfunction
//     native DzTriggerRegisterMouseEvent takes trigger trig, integer btn, integer status, boolean sync, string func returns nothing
//注册鼠标事件
public function TriggerRegisterMouseEvent takes nothing returns nothing
	call DzTriggerRegisterMouseEvent(yh_trigger, yh_integer1, yh_integer2, yh_boolean1, yh_string1)
endfunction
//     native DzTriggerRegisterMouseEventByCode takes trigger trig, integer btn, integer status, boolean sync, code funcHandle returns nothing
//注册鼠标事件(code无法与lua交互)
public function TriggerRegisterMouseEventByCode takes nothing returns nothing
	call DzTriggerRegisterMouseEventByCode(yh_trigger, yh_integer1, yh_integer2, yh_boolean1, yh_code)
endfunction
//     native DzTriggerRegisterKeyEvent takes trigger trig, integer key, integer status, boolean sync, string func returns nothing
//注册键盘key事件
public function TriggerRegisterKeyEvent takes nothing returns nothing
	call DzTriggerRegisterKeyEvent(yh_trigger, yh_integer1, yh_integer2, yh_boolean1, yh_string1)
endfunction
//     native DzTriggerRegisterKeyEventByCode takes trigger trig, integer key, integer status, boolean sync, code funcHandle returns nothing
// 注册键盘key事件
public function TriggerRegisterKeyEventByCode takes nothing returns nothing
	call DzTriggerRegisterKeyEventByCode(yh_trigger, yh_integer1, yh_integer2, yh_boolean1, yh_code)
endfunction
//     native DzTriggerRegisterMouseWheelEvent takes trigger trig, boolean sync, string func returns nothing
//     native DzTriggerRegisterMouseWheelEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
//     native DzTriggerRegisterMouseMoveEvent takes trigger trig, boolean sync, string func returns nothing
//任意玩家移动鼠标
public function TriggerRegisterMouseMoveEvent takes nothing returns nothing
	call DzTriggerRegisterMouseMoveEvent(yh_trigger, yh_boolean1, yh_string1)
endfunction
//     native DzTriggerRegisterMouseMoveEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
//任意玩家移动鼠标
public function TriggerRegisterMouseMoveEventByCode takes nothing returns nothing
	call DzTriggerRegisterMouseMoveEventByCode(yh_trigger, yh_boolean1, yh_code)
endfunction
//     native DzGetTriggerKey takes nothing returns integer
//事件响应 - 获取触发的按键
public function GetTriggerKey takes nothing returns nothing
	set yh_integer1 = DzGetTriggerKey()
endfunction
//     native DzGetWheelDelta takes nothing returns integer

//     native DzIsKeyDown takes integer iKey returns boolean
// 判断按键是否按下
public function IsKeyDown takes nothing returns nothing
	set yh_boolean1 = DzIsKeyDown(yh_integer1)
endfunction

//     native DzGetTriggerKeyPlayer takes nothing returns player
// 事件响应 - 获取触发硬件事件的玩家
public function GetTriggerKeyPlayer takes nothing returns nothing
	set yh_player = DzGetTriggerKeyPlayer()
endfunction
//     native DzGetWindowWidth takes nothing returns integer
//获取war3窗口宽度
public function GetWindowWidth takes nothing returns nothing
	set yh_integer1 = DzGetWindowWidth()
endfunction
//     native DzGetWindowHeight takes nothing returns integer
//获取魔兽窗口高度
public function GetWindowHeight takes nothing returns nothing
	set yh_integer1 = DzGetWindowHeight()
endfunction
//     native DzGetWindowX takes nothing returns integer
//获取魔兽窗口X坐标
public function GetWindowX takes nothing returns nothing
	set yh_integer1 = DzGetWindowX()
endfunction
//     native DzGetWindowY takes nothing returns integer
//获取魔兽窗口Y坐标
public function GetWindowY takes nothing returns nothing
	set yh_integer1 = DzGetWindowY()
endfunction
//     native DzTriggerRegisterWindowResizeEvent takes trigger trig, boolean sync, string func returns nothing
//     native DzTriggerRegisterWindowResizeEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
//     native DzIsWindowActive takes nothing returns boolean
//-------------------------------------------------------------------------------------------------
//     //plus
//     native DzDestructablePosition takes destructable d, real x, real y returns nothing
//     native DzSetUnitPosition takes unit whichUnit, real x, real y returns nothing
//     native DzExecuteFunc takes string funcName returns nothing
//     native DzGetUnitUnderMouse takes nothing returns unit
//     native DzSetUnitTexture takes unit whichUnit, string path, integer texId returns nothing
//     native DzSetMemory takes integer address, real value returns nothing
//     native DzSetUnitID takes unit whichUnit, integer id returns nothing
//     native DzSetUnitModel takes unit whichUnit, string path returns nothing
//设置单位模型
public function SetUnitModel takes nothing returns nothing
	call DzSetUnitModel(yh_unit, yh_string1)
endfunction
//     native DzSetWar3MapMap takes string map returns nothing
//     native DzGetLocale takes nothing returns string
//     native DzGetUnitNeededXP takes unit whichUnit, integer level returns integer
//-------------------------------------------------------------------------------------------------
//     //sync
//     native DzTriggerRegisterSyncData takes trigger trig, string prefix, boolean server returns nothing
// 注册数据同步 标签为 ${prefix} 的数据被同步 | 来自平台:${server}
public function TriggerRegisterSyncData takes nothing returns nothing
	call DzTriggerRegisterSyncData(yh_trigger, yh_string1, yh_boolean1)
endfunction
//     native DzSyncData takes string prefix, string data returns nothing
// 同步游戏数据 同步 标签：${prefix}  发送数据：${data}
public function SyncData takes nothing returns nothing
	call DzSyncData(yh_string1, yh_string2)
endfunction
//     native DzGetTriggerSyncData takes nothing returns string
// 事件响应 - 获取同步的数据
public function GetTriggerSyncData takes nothing returns nothing
	set yh_string1 = DzGetTriggerSyncData()
endfunction
//     native DzGetTriggerSyncPlayer takes nothing returns player
// 事件响应 - 获取同步玩家
public function GetTriggerSyncPlayer takes nothing returns nothing
	set yh_player = DzGetTriggerSyncPlayer()
endfunction
//-------------------------------------------------------------------------------------------------
//     //gui
//     native DzFrameHideInterface takes nothing returns nothing
//     native DzFrameEditBlackBorders takes real upperHeight, real bottomHeight returns nothing
//     native DzFrameGetPortrait takes nothing returns integer
//     native DzFrameGetMinimap takes nothing returns integer
//获取小地图frame
public function FrameGetMinimap takes nothing returns nothing
	set yh_frame1 = DzFrameGetMinimap()
endfunction
//     native DzFrameGetCommandBarButton takes integer row, integer column returns integer
//原生 - 技能按钮
public function FrameGetCommandBarButton takes nothing returns nothing
	set yh_frame1 = DzFrameGetCommandBarButton(yh_integer1, yh_integer2)
endfunction
//     native DzFrameGetHeroBarButton takes integer buttonId returns integer
//原生 - 英雄按钮
public function FrameGetHeroBarButton takes nothing returns nothing
	set yh_frame1 = DzFrameGetHeroBarButton(yh_integer1)
endfunction
//     native DzFrameGetHeroHPBar takes integer buttonId returns integer
//原生 - 英雄血条
public function FrameGetHeroHPBar takes nothing returns nothing
	set yh_frame1 = DzFrameGetHeroHPBar(yh_integer1)
endfunction
//     native DzFrameGetHeroManaBar takes integer buttonId returns integer
//原生 - 英雄蓝条
public function FrameGetHeroManaBar takes nothing returns nothing
	set yh_frame1 = DzFrameGetHeroManaBar(yh_integer1)
endfunction
//     native DzFrameGetItemBarButton takes integer buttonId returns integer
//获取物品栏按钮
public function FrameGetItemBarButton takes nothing returns nothing
	set yh_frame1 = DzFrameGetItemBarButton(yh_integer1)
endfunction
//     native DzFrameGetMinimapButton takes integer buttonId returns integer
//获取小地图按钮
public function FrameGetMinimapButton takes nothing returns nothing
	set yh_frame1 = DzFrameGetMinimapButton(yh_integer1)
endfunction
//     native DzFrameGetUpperButtonBarButton takes integer buttonId returns integer
//     native DzFrameGetTooltip takes nothing returns integer
//原生 - 鼠标提示
public function FrameGetTooltip takes nothing returns nothing
	set yh_frame1 = DzFrameGetTooltip()
endfunction
//     native DzFrameGetChatMessage takes nothing returns integer
//     native DzFrameGetUnitMessage takes nothing returns integer
//     native DzFrameGetTopMessage takes nothing returns integer
//     native DzGetColor takes integer r, integer g, integer b, integer a returns integer
//     native DzFrameSetUpdateCallback takes string func returns nothing
//     native DzFrameSetUpdateCallbackByCode takes code funcHandle returns nothing
//     native DzFrameShow takes integer frame, boolean enable returns nothing
//Frame显示隐藏
public function FrameShow takes nothing returns nothing
	call DzFrameShow(yh_frame1, yh_boolean1)
endfunction
//     native DzCreateFrame takes string frame, integer parent, integer id returns integer
//根据fdf文件创建Frame
public function CreateFrame takes nothing returns nothing
	set yh_frame1 = DzCreateFrame(yh_string1, DzGetGameUI(), 0)
endfunction
//     native DzCreateSimpleFrame takes string frame, integer parent, integer id returns integer
//     native DzDestroyFrame takes integer frame returns nothing
//删除farme
public function DestroyFrame takes nothing returns nothing
	call DzDestroyFrame(yh_frame1)
endfunction
//     native DzLoadToc takes string fileName returns nothing
//载入Toc文件
public function LoadToc takes nothing returns nothing
	call DzLoadToc(yh_string1)
endfunction
//     native DzFrameSetPoint takes integer frame, integer point, integer relativeFrame, integer relativePoint, real x, real y returns nothing
//Frame设置相对位置锚点
public function FrameSetPoint takes nothing returns nothing
	call DzFrameSetPoint(yh_frame1, yh_integer1, yh_frame2, yh_integer2, yh_real1, yh_real2)
endfunction
//     native DzFrameSetAbsolutePoint takes integer frame, integer point, real x, real y returns nothing
//Frame设置绝对位置锚点
public function FrameSetAbsolutePoint takes nothing returns nothing
	call DzFrameSetAbsolutePoint(yh_frame1, yh_integer1, yh_real1, yh_real2)
endfunction
//     native DzFrameClearAllPoints takes integer frame returns nothing
//清空所有锚点
public function FrameClearAllPoints takes nothing returns nothing
	call DzFrameClearAllPoints(yh_frame1)
endfunction
//     native DzFrameSetEnable takes integer name, boolean enable returns nothing
//Frame设置按钮是否启用
public function FrameSetEnable takes nothing returns nothing
	call DzFrameSetEnable(yh_frame1, yh_boolean1)
endfunction
//     native DzFrameSetScript takes integer frame, integer eventId, string func, boolean sync returns nothing
//注册Frame UI事件回调
public function FrameSetScript takes nothing returns nothing
	call DzFrameSetScript(yh_frame1, yh_integer1, yh_string1, yh_boolean1)
endfunction
//     native DzFrameSetScriptByCode takes integer frame, integer eventId, code funcHandle, boolean sync returns nothing
//注册Frame UI事件回调
public function FrameSetScriptByCode takes nothing returns nothing
	call DzFrameSetScriptByCode(yh_frame1, yh_integer1, yh_code, yh_boolean1)
endfunction
//     native DzGetTriggerUIEventPlayer takes nothing returns player
public function GetTriggerUIEventPlayer takes nothing returns nothing
	set yh_player = DzGetTriggerUIEventPlayer()
endfunction

//     native DzGetTriggerUIEventFrame takes nothing returns integer
//事件响应 - 触发的Frame
public function GetTriggerUIEventFrame takes nothing returns nothing
	set yh_frame1 = DzGetTriggerUIEventFrame()
endfunction
//     native DzFrameFindByName takes string name, integer id returns integer
//根据名称寻找Frame
public function FrameFindByName takes nothing returns nothing
	set yh_frame1 = DzFrameFindByName(yh_string1, 0)
endfunction
//     native DzSimpleFrameFindByName takes string name, integer id returns integer
//     native DzSimpleFontStringFindByName takes string name, integer id returns integer
//     native DzSimpleTextureFindByName takes string name, integer id returns integer
//     native DzGetGameUI takes nothing returns integer
//原生 - 游戏UI 一般用作创建自定义UI的父节点
public function GetGameUI takes nothing returns nothing
	set yh_frame1 = DzGetGameUI()
endfunction
//     native DzClickFrame takes integer frame returns nothing
//     native DzSetCustomFovFix takes real value returns nothing
//     native DzEnableWideScreen takes boolean enable returns nothing
//     native DzFrameSetText takes integer frame, string text returns nothing
//Frame设置文字内容
public function FrameSetText takes nothing returns nothing
	call DzFrameSetText(yh_frame1, yh_string1)
endfunction
//     native DzFrameGetText takes integer frame returns string
//     native DzFrameSetTextSizeLimit takes integer frame, integer size returns nothing
//     native DzFrameGetTextSizeLimit takes integer frame returns integer
//     native DzFrameSetTextColor takes integer frame, integer color returns nothing
//     native DzGetMouseFocus takes nothing returns integer
//鼠标所在的Frame控件指针
public function GetMouseFocus takes nothing returns nothing
	set yh_frame1 = DzGetMouseFocus()
endfunction
//     native DzFrameSetAllPoints takes integer frame, integer relativeFrame returns boolean
//移动所有锚点到Frame
public function FrameSetAllPoints takes nothing returns nothing
	set yh_boolean1 = DzFrameSetAllPoints(yh_frame1, yh_frame2)
endfunction
//     native DzFrameSetFocus takes integer frame, boolean enable returns boolean
//     native DzFrameSetModel takes integer frame, string modelFile, integer modelType, integer flag returns nothing
//     native DzFrameGetEnable takes integer frame returns boolean
// 获取按钮是否禁用
public function FrameGetEnable takes nothing returns nothing
	set yh_boolean1 = DzFrameGetEnable(yh_frame1)
endfunction
//     native DzFrameSetAlpha takes integer frame, integer alpha returns nothing
// 设置小地图透明度
public function FrameSetAlpha takes nothing returns nothing
	call DzFrameSetAlpha(yh_frame1, yh_integer1)
endfunction
//     native DzFrameGetAlpha takes integer frame returns integer
//     native DzFrameSetAnimate takes integer frame, integer animId, boolean autocast returns nothing
//     native DzFrameSetAnimateOffset takes integer frame, real offset returns nothing
//     native DzFrameSetTexture takes integer frame, string texture, integer flag returns nothing
//设置frame贴图路径
public function FrameSetTexture takes nothing returns nothing
	call DzFrameSetTexture(yh_frame1, yh_string1, yh_integer1)
endfunction
//     native DzFrameSetScale takes integer frame, real scale returns nothing
//设置frame放大倍数
public function FrameSetScale takes nothing returns nothing
	call DzFrameSetScale(yh_frame1, yh_real1)
endfunction
//     native DzFrameSetTooltip takes integer frame, integer tooltip returns nothing
//设置frame提示
public function FrameSetTooltip takes nothing returns nothing
	call DzFrameSetTooltip(yh_frame1, yh_integer1)
endfunction
//     native DzFrameCageMouse takes integer frame, boolean enable returns nothing
//     native DzFrameGetValue takes integer frame returns real
//     native DzFrameSetMinMaxValue takes integer frame, real minValue, real maxValue returns nothing
//     native DzFrameSetStepValue takes integer frame, real step returns nothing
//     native DzFrameSetValue takes integer frame, real value returns nothing
//     native DzFrameSetSize takes integer frame, real w, real h returns nothing
//Frame设置尺寸
public function FrameSetSize takes nothing returns nothing
	call DzFrameSetSize(yh_frame1, yh_real1, yh_real2)
endfunction
//     native DzCreateFrameByTagName takes string frameType, string name, integer parent, string template, integer id returns integer
//创建Frame
public function CreateFrameByTagName takes nothing returns nothing
	set yh_frame1 = DzCreateFrameByTagName(yh_string1, yh_string2, yh_integer1, yh_string3, yh_integer2)
endfunction
//     native DzFrameSetVertexColor takes integer frame, integer color returns nothing
//     native DzOriginalUIAutoResetPoint takes boolean enable returns nothing
//自动复位UI初始位置
public function OriginalUIAutoResetPoint takes nothing returns nothing
	call DzOriginalUIAutoResetPoint(yh_boolean1)
endfunction
//     native DzFrameSetPriority takes integer frame, integer priority returns nothing
//设置优先级 [NEW]
public function FrameSetPriority takes nothing returns nothing
	call DzFrameSetPriority(yh_frame1, yh_integer1)
endfunction
//     native DzFrameSetParent takes integer frame, integer parent returns nothing
//设置父窗口 [NEW]
public function FrameSetParent takes nothing returns nothing
	call DzFrameSetParent(yh_frame1, yh_integer1)
endfunction
//     native DzFrameGetHeight takes integer frame returns real
//获取 ${frame} 的高度
public function FrameGetHeight takes nothing returns nothing
	set yh_real1 = DzFrameGetHeight(yh_frame1)
endfunction
//     native DzFrameSetFont takes integer frame, string fileName, real height, integer flag returns nothing
//设置 ${frame} 的字体为 ${font}, 大小 ${height}, flag ${flag}
public function FrameSetFont takes nothing returns nothing
	call DzFrameSetFont(yh_frame1, yh_string1, yh_real1, yh_integer1)
endfunction
//     native DzFrameGetParent takes integer frame returns integer
//获取父窗口 [NEW]
public function FrameGetParent takes nothing returns nothing
	set yh_frame2 = DzFrameGetParent(yh_frame1)
endfunction
//     native DzFrameSetTextAlignment takes integer frame, integer align returns nothing
//设置 ${frame} 的对齐方式为 ${align}
public function FrameSetTextAlignment takes nothing returns nothing
	call DzFrameSetTextAlignment(yh_frame1, yh_integer1)
endfunction
//     native DzFrameGetName takes integer frame returns string
//获取 Frame 的 名称 [NEW]
public function FrameGetName takes nothing returns nothing
	set yh_string1 = DzFrameGetName(yh_frame1)
endfunction

endscope
