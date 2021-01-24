scope yh

//-------------------------------------------------------------------------------------------------
//hardware
// 	   native DzGetMouseTerrainX takes nothing returns real
//     native DzGetMouseTerrainY takes nothing returns real
//     native DzGetMouseTerrainZ takes nothing returns real
//     native DzIsMouseOverUI takes nothing returns boolean
//     native DzGetMouseX takes nothing returns integer
//     native DzGetMouseY takes nothing returns integer
//     native DzGetMouseXRelative takes nothing returns integer
//     native DzGetMouseYRelative takes nothing returns integer
//     native DzSetMousePos takes integer x, integer y returns nothing
//     native DzTriggerRegisterMouseEvent takes trigger trig, integer btn, integer status, boolean sync, string func returns nothing
//     native DzTriggerRegisterMouseEventByCode takes trigger trig, integer btn, integer status, boolean sync, code funcHandle returns nothing
//     native DzTriggerRegisterKeyEvent takes trigger trig, integer key, integer status, boolean sync, string func returns nothing
//     native DzTriggerRegisterKeyEventByCode takes trigger trig, integer key, integer status, boolean sync, code funcHandle returns nothing
// 注册键盘key事件
public function TriggerRegisterKeyEventByCode takes nothing returns nothing
	call DzTriggerRegisterKeyEventByCode(yh_trigger, yh_integer1, yh_integer2, yh_boolean1, yh_code)
endfunction
//     native DzTriggerRegisterMouseWheelEvent takes trigger trig, boolean sync, string func returns nothing
//     native DzTriggerRegisterMouseWheelEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
//     native DzTriggerRegisterMouseMoveEvent takes trigger trig, boolean sync, string func returns nothing
//     native DzTriggerRegisterMouseMoveEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
//     native DzGetTriggerKey takes nothing returns integer
//     native DzGetWheelDelta takes nothing returns integer
//     native DzIsKeyDown takes integer iKey returns boolean
//     native DzGetTriggerKeyPlayer takes nothing returns player
//获取触发按键玩家
public function GetTriggerKeyPlayer takes nothing returns nothing
	set yh_player = DzGetTriggerKeyPlayer()
endfunction
//     native DzGetWindowWidth takes nothing returns integer
//     native DzGetWindowHeight takes nothing returns integer
//     native DzGetWindowX takes nothing returns integer
//     native DzGetWindowY takes nothing returns integer
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
//     native DzSetWar3MapMap takes string map returns nothing
//     native DzGetLocale takes nothing returns string
//     native DzGetUnitNeededXP takes unit whichUnit, integer level returns integer
//-------------------------------------------------------------------------------------------------
//     //sync
//     native DzTriggerRegisterSyncData takes trigger trig, string prefix, boolean server returns nothing
//     native DzSyncData takes string prefix, string data returns nothing
//     native DzGetTriggerSyncData takes nothing returns string
//     native DzGetTriggerSyncPlayer takes nothing returns player
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
//     native DzFrameGetHeroBarButton takes integer buttonId returns integer
//     native DzFrameGetHeroHPBar takes integer buttonId returns integer
//     native DzFrameGetHeroManaBar takes integer buttonId returns integer
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
	call DzCreateFrame(yh_string1, DzGetGameUI(), 0)
endfunction
//     native DzCreateSimpleFrame takes string frame, integer parent, integer id returns integer
//     native DzDestroyFrame takes integer frame returns nothing
//     native DzLoadToc takes string fileName returns nothing
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
//     native DzFrameSetEnable takes integer name, boolean enable returns nothing
//Frame设置按钮是否启用
public function FrameSetEnable takes nothing returns nothing
	call DzFrameSetEnable(yh_frame1, yh_boolean1)
endfunction
//     native DzFrameSetScript takes integer frame, integer eventId, string func, boolean sync returns nothing
//     native DzFrameSetScriptByCode takes integer frame, integer eventId, code funcHandle, boolean sync returns nothing
//     native DzGetTriggerUIEventPlayer takes nothing returns player
//     native DzGetTriggerUIEventFrame takes nothing returns integer
//     native DzFrameFindByName takes string name, integer id returns integer
//根据名称寻找Frame
public function FrameFindByName takes nothing returns nothing
	call DzFrameFindByName(yh_string1, 0)
endfunction
//     native DzSimpleFrameFindByName takes string name, integer id returns integer
//     native DzSimpleFontStringFindByName takes string name, integer id returns integer
//     native DzSimpleTextureFindByName takes string name, integer id returns integer
//     native DzGetGameUI takes nothing returns integer
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
//     native DzFrameSetAllPoints takes integer frame, integer relativeFrame returns boolean
//     native DzFrameSetFocus takes integer frame, boolean enable returns boolean
//     native DzFrameSetModel takes integer frame, string modelFile, integer modelType, integer flag returns nothing
//     native DzFrameGetEnable takes integer frame returns boolean
//     native DzFrameSetAlpha takes integer frame, integer alpha returns nothing
// 设置小地图透明度
public function FrameSetAlpha takes nothing returns nothing
	call DzFrameSetAlpha(yh_frame1, yh_integer1)
endfunction
//     native DzFrameGetAlpha takes integer frame returns integer
//     native DzFrameSetAnimate takes integer frame, integer animId, boolean autocast returns nothing
//     native DzFrameSetAnimateOffset takes integer frame, real offset returns nothing
//     native DzFrameSetTexture takes integer frame, string texture, integer flag returns nothing
//     native DzFrameSetScale takes integer frame, real scale returns nothing
//设置frame放大倍数
public function FrameSetScale takes nothing returns nothing
	call DzFrameSetScale(yh_frame1, yh_real1)
endfunction
//     native DzFrameSetTooltip takes integer frame, integer tooltip returns nothing
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
	set yh_frame1 = DzCreateFrameByTagName(yh_string1, "name", DzGetGameUI(), "template", 0)
endfunction
//     native DzFrameSetVertexColor takes integer frame, integer color returns nothing
//     native DzOriginalUIAutoResetPoint takes boolean enable returns nothing
//     native DzFrameSetPriority takes integer frame, integer priority returns nothing
//     native DzFrameSetParent takes integer frame, integer parent returns nothing
//     native DzFrameGetHeight takes integer frame returns real
//     native DzFrameSetFont takes integer frame, string fileName, real height, integer flag returns nothing
//     native DzFrameGetParent takes integer frame returns integer
//     native DzFrameSetTextAlignment takes integer frame, integer align returns nothing
//     native DzFrameGetName takes integer frame returns string

//---------------------------------------------------------------
//设置单位属性GetUnitState
public function getUnitState takes nothing returns nothing
	set yh_real1 = GetUnitState(yh_unit, yh_unitstate)
endfunction
//设置单位属性SetUnitState
public function setUnitState takes nothing returns nothing
	call SetUnitState(yh_unit, yh_unitstate, yh_real1)
endfunction

endscope
