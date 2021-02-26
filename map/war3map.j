globals
//globals from BzAPI:
constant boolean LIBRARY_BzAPI=true
//endglobals from BzAPI
//globals from DzAPI:
constant boolean LIBRARY_DzAPI=true
//endglobals from DzAPI
    // Generated
rect gg_rct_TheMainBase= null
rect gg_rct_HG= null
sound gg_snd_Zandy= null
sound gg_snd_FezdYezf= null
string gg_snd_FezdYezf01
string gg_snd_Zandy01
sound gg_snd_PlaceAncestralGuardian= null
integer array AtkUnit_Id
integer array Attack_Id
integer array Armor_Id
integer array StrAgiInt_Id
trigger yh_trigger= null
string yh_string1= "stringyh1"
string yh_string2= "stringyh2"
string yh_string3= "stringyh3"
integer yh_integer1= 0
integer yh_integer2= 0
integer yh_integer3= 0
integer yh_integer4= 0
integer yh_integer5= 0
integer yh_integer6= 0
integer yh_frame1= 0
integer yh_frame2= 0
integer yh_frame3= 0
real yh_real1= 0.00
real yh_real2= 0.00
real yh_real3= 0.00
real yh_real4= 0.00
real yh_real5= 0.00
real yh_real6= 0.00
boolean yh_boolean1= false
boolean yh_boolean2= false
boolean yh_boolean3= false
player yh_player= null
unit yh_unit= null
trigger array yh_FrameEvent


//JASSHelper struct globals:

endglobals
    native DzGetMouseTerrainX takes nothing returns real
    native DzGetMouseTerrainY takes nothing returns real
    native DzGetMouseTerrainZ takes nothing returns real
    native DzIsMouseOverUI takes nothing returns boolean
    native DzGetMouseX takes nothing returns integer
    native DzGetMouseY takes nothing returns integer
    native DzGetMouseXRelative takes nothing returns integer
    native DzGetMouseYRelative takes nothing returns integer
    native DzSetMousePos takes integer x, integer y returns nothing
    native DzTriggerRegisterMouseEvent takes trigger trig, integer btn, integer status, boolean sync, string func returns nothing
    native DzTriggerRegisterMouseEventByCode takes trigger trig, integer btn, integer status, boolean sync, code funcHandle returns nothing
    native DzTriggerRegisterKeyEvent takes trigger trig, integer key, integer status, boolean sync, string func returns nothing
    native DzTriggerRegisterKeyEventByCode takes trigger trig, integer key, integer status, boolean sync, code funcHandle returns nothing
    native DzTriggerRegisterMouseWheelEvent takes trigger trig, boolean sync, string func returns nothing
    native DzTriggerRegisterMouseWheelEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
    native DzTriggerRegisterMouseMoveEvent takes trigger trig, boolean sync, string func returns nothing
    native DzTriggerRegisterMouseMoveEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
    native DzGetTriggerKey takes nothing returns integer
    native DzGetWheelDelta takes nothing returns integer
    native DzIsKeyDown takes integer iKey returns boolean
    native DzGetTriggerKeyPlayer takes nothing returns player
    native DzGetWindowWidth takes nothing returns integer
    native DzGetWindowHeight takes nothing returns integer
    native DzGetWindowX takes nothing returns integer
    native DzGetWindowY takes nothing returns integer
    native DzTriggerRegisterWindowResizeEvent takes trigger trig, boolean sync, string func returns nothing
    native DzTriggerRegisterWindowResizeEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
    native DzIsWindowActive takes nothing returns boolean
    native DzDestructablePosition takes destructable d, real x, real y returns nothing
    native DzSetUnitPosition takes unit whichUnit, real x, real y returns nothing
    native DzExecuteFunc takes string funcName returns nothing
    native DzGetUnitUnderMouse takes nothing returns unit
    native DzSetUnitTexture takes unit whichUnit, string path, integer texId returns nothing
    native DzSetMemory takes integer address, real value returns nothing
    native DzSetUnitID takes unit whichUnit, integer id returns nothing
    native DzSetUnitModel takes unit whichUnit, string path returns nothing
    native DzSetWar3MapMap takes string map returns nothing
    native DzGetLocale takes nothing returns string
    native DzGetUnitNeededXP takes unit whichUnit, integer level returns integer
    native DzTriggerRegisterSyncData takes trigger trig, string prefix, boolean server returns nothing
    native DzSyncData takes string prefix, string data returns nothing
    native DzGetTriggerSyncData takes nothing returns string
    native DzGetTriggerSyncPlayer takes nothing returns player
    native DzFrameHideInterface takes nothing returns nothing
    native DzFrameEditBlackBorders takes real upperHeight, real bottomHeight returns nothing
    native DzFrameGetPortrait takes nothing returns integer
    native DzFrameGetMinimap takes nothing returns integer
    native DzFrameGetCommandBarButton takes integer row, integer column returns integer
    native DzFrameGetHeroBarButton takes integer buttonId returns integer
    native DzFrameGetHeroHPBar takes integer buttonId returns integer
    native DzFrameGetHeroManaBar takes integer buttonId returns integer
    native DzFrameGetItemBarButton takes integer buttonId returns integer
    native DzFrameGetMinimapButton takes integer buttonId returns integer
    native DzFrameGetUpperButtonBarButton takes integer buttonId returns integer
    native DzFrameGetTooltip takes nothing returns integer
    native DzFrameGetChatMessage takes nothing returns integer
    native DzFrameGetUnitMessage takes nothing returns integer
    native DzFrameGetTopMessage takes nothing returns integer
    native DzGetColor takes integer r, integer g, integer b, integer a returns integer
    native DzFrameSetUpdateCallback takes string func returns nothing
    native DzFrameSetUpdateCallbackByCode takes code funcHandle returns nothing
    native DzFrameShow takes integer frame, boolean enable returns nothing
    native DzCreateFrame takes string frame, integer parent, integer id returns integer
    native DzCreateSimpleFrame takes string frame, integer parent, integer id returns integer
    native DzDestroyFrame takes integer frame returns nothing
    native DzLoadToc takes string fileName returns nothing
    native DzFrameSetPoint takes integer frame, integer point, integer relativeFrame, integer relativePoint, real x, real y returns nothing
    native DzFrameSetAbsolutePoint takes integer frame, integer point, real x, real y returns nothing
    native DzFrameClearAllPoints takes integer frame returns nothing
    native DzFrameSetEnable takes integer name, boolean enable returns nothing
    native DzFrameSetScript takes integer frame, integer eventId, string func, boolean sync returns nothing
    native DzFrameSetScriptByCode takes integer frame, integer eventId, code funcHandle, boolean sync returns nothing
    native DzGetTriggerUIEventPlayer takes nothing returns player
    native DzGetTriggerUIEventFrame takes nothing returns integer
    native DzFrameFindByName takes string name, integer id returns integer
    native DzSimpleFrameFindByName takes string name, integer id returns integer
    native DzSimpleFontStringFindByName takes string name, integer id returns integer
    native DzSimpleTextureFindByName takes string name, integer id returns integer
    native DzGetGameUI takes nothing returns integer
    native DzClickFrame takes integer frame returns nothing
    native DzSetCustomFovFix takes real value returns nothing
    native DzEnableWideScreen takes boolean enable returns nothing
    native DzFrameSetText takes integer frame, string text returns nothing
    native DzFrameGetText takes integer frame returns string
    native DzFrameSetTextSizeLimit takes integer frame, integer size returns nothing
    native DzFrameGetTextSizeLimit takes integer frame returns integer
    native DzFrameSetTextColor takes integer frame, integer color returns nothing
    native DzGetMouseFocus takes nothing returns integer
    native DzFrameSetAllPoints takes integer frame, integer relativeFrame returns boolean
    native DzFrameSetFocus takes integer frame, boolean enable returns boolean
    native DzFrameSetModel takes integer frame, string modelFile, integer modelType, integer flag returns nothing
    native DzFrameGetEnable takes integer frame returns boolean
    native DzFrameSetAlpha takes integer frame, integer alpha returns nothing
    native DzFrameGetAlpha takes integer frame returns integer
    native DzFrameSetAnimate takes integer frame, integer animId, boolean autocast returns nothing
    native DzFrameSetAnimateOffset takes integer frame, real offset returns nothing
    native DzFrameSetTexture takes integer frame, string texture, integer flag returns nothing
    native DzFrameSetScale takes integer frame, real scale returns nothing
    native DzFrameSetTooltip takes integer frame, integer tooltip returns nothing
    native DzFrameCageMouse takes integer frame, boolean enable returns nothing
    native DzFrameGetValue takes integer frame returns real
    native DzFrameSetMinMaxValue takes integer frame, real minValue, real maxValue returns nothing
    native DzFrameSetStepValue takes integer frame, real step returns nothing
    native DzFrameSetValue takes integer frame, real value returns nothing
    native DzFrameSetSize takes integer frame, real w, real h returns nothing
    native DzCreateFrameByTagName takes string frameType, string name, integer parent, string template, integer id returns integer
    native DzFrameSetVertexColor takes integer frame, integer color returns nothing
    native DzOriginalUIAutoResetPoint takes boolean enable returns nothing
    native DzFrameSetPriority takes integer frame, integer priority returns nothing
    native DzFrameSetParent takes integer frame, integer parent returns nothing
    native DzFrameGetHeight takes integer frame returns real
    native DzFrameSetFont takes integer frame, string fileName, real height, integer flag returns nothing
    native DzFrameGetParent takes integer frame returns integer
    native DzFrameSetTextAlignment takes integer frame, integer align returns nothing
    native DzFrameGetName takes integer frame returns string
	native DzAPI_Map_SaveServerValue takes player whichPlayer, string key, string value returns boolean
	native DzAPI_Map_GetServerValue takes player whichPlayer, string key returns string
	native DzAPI_Map_Ladder_SetStat takes player whichPlayer, string key, string value returns nothing
	native DzAPI_Map_IsRPGLadder takes nothing returns boolean
	native DzAPI_Map_GetGameStartTime takes nothing returns integer
	native DzAPI_Map_Stat_SetStat takes player whichPlayer, string key, string value returns nothing
	native DzAPI_Map_GetMatchType takes nothing returns integer
	native DzAPI_Map_Ladder_SetPlayerStat takes player whichPlayer, string key, string value returns nothing
	native DzAPI_Map_GetServerValueErrorCode takes player whichPlayer returns integer
	native DzAPI_Map_GetLadderLevel takes player whichPlayer returns integer
	native DzAPI_Map_IsRedVIP takes player whichPlayer returns boolean
	native DzAPI_Map_IsBlueVIP takes player whichPlayer returns boolean
	native DzAPI_Map_GetLadderRank takes player whichPlayer returns integer
	native DzAPI_Map_GetMapLevelRank takes player whichPlayer returns integer
	native DzAPI_Map_GetGuildName takes player whichPlayer returns string
	native DzAPI_Map_GetGuildRole takes player whichPlayer returns integer
	native DzAPI_Map_IsRPGLobby takes nothing returns boolean
	native DzAPI_Map_GetMapLevel takes player whichPlayer returns integer
	native DzAPI_Map_MissionComplete takes player whichPlayer, string key, string value returns nothing
	native DzAPI_Map_GetActivityData takes nothing returns string
	native DzAPI_Map_GetMapConfig takes string key returns string
	native DzAPI_Map_HasMallItem takes player whichPlayer, string key returns boolean
	native DzAPI_Map_SavePublicArchive takes player whichPlayer, string key, string value returns boolean
	native DzAPI_Map_GetPublicArchive takes player whichPlayer, string key returns string
	native DzAPI_Map_UseConsumablesItem takes player whichPlayer, string key returns nothing
	native DzAPI_Map_OrpgTrigger takes player whichPlayer, string key returns nothing
	native DzAPI_Map_GetServerArchiveDrop takes player whichPlayer, string key returns string
	native DzAPI_Map_GetServerArchiveEquip takes player whichPlayer, string key returns integer
	native RequestExtraIntegerData takes integer dataType, player whichPlayer, string param1, string param2, boolean param3, integer param4, integer param5, integer param6 returns integer
	native RequestExtraBooleanData takes integer dataType, player whichPlayer, string param1, string param2, boolean param3, integer param4, integer param5, integer param6 returns boolean
	native RequestExtraStringData takes integer dataType, player whichPlayer, string param1, string param2, boolean param3, integer param4, integer param5, integer param6 returns string
	native RequestExtraRealData takes integer dataType, player whichPlayer, string param1, string param2, boolean param3, integer param4, integer param5, integer param6 returns real
	native DzAPI_Map_GetPlatformVIP takes player whichPlayer returns integer


//library BzAPI:
    //hardware




























    //plus











    //sync




    //gui








































































    function DzTriggerRegisterMouseEventTrg takes trigger trg,integer status,integer btn returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseEvent(trg, btn, status, true, null)
    endfunction
    function DzTriggerRegisterKeyEventTrg takes trigger trg,integer status,integer btn returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterKeyEvent(trg, btn, status, true, null)
    endfunction
    function DzTriggerRegisterMouseMoveEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseMoveEvent(trg, true, null)
    endfunction
    function DzTriggerRegisterMouseWheelEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseWheelEvent(trg, true, null)
    endfunction
    function DzTriggerRegisterWindowResizeEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterWindowResizeEvent(trg, true, null)
    endfunction
    function DzF2I takes integer i returns integer
        return i
    endfunction
    function DzI2F takes integer i returns integer
        return i
    endfunction
    function DzK2I takes integer i returns integer
        return i
    endfunction
    function DzI2K takes integer i returns integer
        return i
    endfunction

//library BzAPI ends
//library DzAPI:

































 function DzAPI_Map_IsPlatformVIP takes player whichPlayer returns boolean
		return DzAPI_Map_GetPlatformVIP(whichPlayer) > 0
	endfunction
 function DzAPI_Map_Global_GetStoreString takes string key returns string
		return RequestExtraStringData(36, GetLocalPlayer(), key, null, false, 0, 0, 0)
	endfunction
 function DzAPI_Map_Global_StoreString takes string key,string value returns nothing
		call RequestExtraStringData(37, GetLocalPlayer(), key, value, false, 0, 0, 0)
	endfunction
 function DzAPI_Map_Global_ChangeMsg takes trigger trig returns nothing
		call DzTriggerRegisterSyncData(trig, "DZGAU", true)
	endfunction
 function DzAPI_Map_ServerArchive takes player whichPlayer,string key returns string
	    return RequestExtraStringData(38, whichPlayer, key, null, false, 0, 0, 0)
	endfunction
 function DzAPI_Map_SaveServerArchive takes player whichPlayer,string key,string value returns nothing
	    call RequestExtraBooleanData(39, whichPlayer, key, value, false, 0, 0, 0)
	endfunction
 function DzAPI_Map_IsRPGQuickMatch takes nothing returns boolean
		return RequestExtraBooleanData(40, null, null, null, false, 0, 0, 0)
	endfunction
 function DzAPI_Map_GetMallItemCount takes player whichPlayer,string key returns integer
		return RequestExtraIntegerData(41, whichPlayer, key, null, false, 0, 0, 0)
	endfunction
 function DzAPI_Map_ConsumeMallItem takes player whichPlayer,string key,integer count returns boolean
		return RequestExtraBooleanData(42, whichPlayer, key, null, false, count, 0, 0)
	endfunction
 function DzAPI_Map_EnablePlatformSettings takes player whichPlayer,integer option,boolean enable returns boolean
		return RequestExtraBooleanData(43, whichPlayer, null, null, enable, option, 0, 0)
	endfunction
 function DzAPI_Map_IsBuyReforged takes player whichPlayer returns boolean
		return RequestExtraBooleanData(44, whichPlayer, null, null, false, 0, 0, 0)
	endfunction
 function GetPlayerServerValueSuccess takes player whichPlayer returns boolean
		if ( DzAPI_Map_GetServerValueErrorCode(whichPlayer) == 0 ) then
			return true
		else
			return false
		endif
	endfunction
 function DzAPI_Map_StoreIntegerEX takes player whichPlayer,string key,integer value returns nothing
		set key="I" + key
		call RequestExtraBooleanData(39, whichPlayer, key, I2S(value), false, 0, 0, 0)
		set key=null
		set whichPlayer=null
	endfunction
 function DzAPI_Map_GetStoredIntegerEX takes player whichPlayer,string key returns integer
  local integer value
		set key="I" + key
		set value=S2I(RequestExtraStringData(38, whichPlayer, key, null, false, 0, 0, 0))
		set key=null
		set whichPlayer=null
		return value
	endfunction
 function DzAPI_Map_StoreInteger takes player whichPlayer,string key,integer value returns nothing
		set key="I" + key
		call DzAPI_Map_SaveServerValue(whichPlayer, key, I2S(value))
		set key=null
		set whichPlayer=null
	endfunction
 function DzAPI_Map_GetStoredInteger takes player whichPlayer,string key returns integer
  local integer value
		set key="I" + key
		set value=S2I(DzAPI_Map_GetServerValue(whichPlayer, key))
		set key=null
		set whichPlayer=null
		return value
	endfunction
        function DzAPI_Map_CommentTotalCount1 takes player whichPlayer,integer id returns integer
    		return RequestExtraIntegerData(52, whichPlayer, null, null, false, id, 0, 0)
	endfunction
 function DzAPI_Map_StoreReal takes player whichPlayer,string key,real value returns nothing
		set key="R" + key
		call DzAPI_Map_SaveServerValue(whichPlayer, key, R2S(value))
		set key=null
		set whichPlayer=null
	endfunction
 function DzAPI_Map_GetStoredReal takes player whichPlayer,string key returns real
  local real value
		set key="R" + key
		set value=S2R(DzAPI_Map_GetServerValue(whichPlayer, key))
		set key=null
		set whichPlayer=null
		return value
	endfunction
 function DzAPI_Map_StoreBoolean takes player whichPlayer,string key,boolean value returns nothing
		set key="B" + key
		if ( value ) then
			call DzAPI_Map_SaveServerValue(whichPlayer, key, "1")
		else
			call DzAPI_Map_SaveServerValue(whichPlayer, key, "0")
		endif
		set key=null
		set whichPlayer=null
	endfunction
 function DzAPI_Map_GetStoredBoolean takes player whichPlayer,string key returns boolean
  local boolean value
		set key="B" + key
		set key=DzAPI_Map_GetServerValue(whichPlayer, key)
		if ( key == "1" ) then
			set value=true
		else
			set value=false
		endif
		set key=null
		set whichPlayer=null
		return value
	endfunction
 function DzAPI_Map_StoreString takes player whichPlayer,string key,string value returns nothing
		set key="S" + key
		call DzAPI_Map_SaveServerValue(whichPlayer, key, value)
		set key=null
		set whichPlayer=null
	endfunction
 function DzAPI_Map_GetStoredString takes player whichPlayer,string key returns string
		return DzAPI_Map_GetServerValue(whichPlayer, "S" + key)
	endfunction
 function DzAPI_Map_StoreStringEX takes player whichPlayer,string key,string value returns nothing
		set key="S" + key
		call RequestExtraBooleanData(39, whichPlayer, key, value, false, 0, 0, 0)
		set key=null
		set whichPlayer=null
	endfunction
 function DzAPI_Map_GetStoredStringEX takes player whichPlayer,string key returns string
		return RequestExtraStringData(38, whichPlayer, "S" + key, null, false, 0, 0, 0)
	endfunction
 function DzAPI_Map_GetStoredUnitType takes player whichPlayer,string key returns integer
  local integer value
		set key="I" + key
		set value=S2I(DzAPI_Map_GetServerValue(whichPlayer, key))
		set key=null
		set whichPlayer=null
		return value
	endfunction
 function DzAPI_Map_GetStoredAbilityId takes player whichPlayer,string key returns integer
  local integer value
		set key="I" + key
		set value=S2I(DzAPI_Map_GetServerValue(whichPlayer, key))
		set key=null
		set whichPlayer=null
		return value
	endfunction
 function DzAPI_Map_FlushStoredMission takes player whichPlayer,string key returns nothing
		call DzAPI_Map_SaveServerValue(whichPlayer, key, null)
		set key=null
		set whichPlayer=null
	endfunction
 function DzAPI_Map_Ladder_SubmitIntegerData takes player whichPlayer,string key,integer value returns nothing
		call DzAPI_Map_Ladder_SetStat(whichPlayer, key, I2S(value))
	endfunction
 function DzAPI_Map_Stat_SubmitUnitIdData takes player whichPlayer,string key,integer value returns nothing
		if ( value == 0 ) then
			//call DzAPI_Map_Ladder_SetStat(whichPlayer,key,"0")
		else
			call DzAPI_Map_Ladder_SetStat(whichPlayer, key, I2S(value))
		endif
	endfunction
 function DzAPI_Map_Stat_SubmitUnitData takes player whichPlayer,string key,unit value returns nothing
		call DzAPI_Map_Stat_SubmitUnitIdData(whichPlayer , key , GetUnitTypeId(value))
	endfunction
 function DzAPI_Map_Ladder_SubmitAblityIdData takes player whichPlayer,string key,integer value returns nothing
		if ( value == 0 ) then
			//call DzAPI_Map_Ladder_SetStat(whichPlayer,key,"0")
		else
			call DzAPI_Map_Ladder_SetStat(whichPlayer, key, I2S(value))
		endif
	endfunction
 function DzAPI_Map_Ladder_SubmitItemIdData takes player whichPlayer,string key,integer value returns nothing
  local string S
		if ( value == 0 ) then
			set S="0"
		else
			set S=I2S(value)
			call DzAPI_Map_Ladder_SetStat(whichPlayer, key, S)
		endif
		//call DzAPI_Map_Ladder_SetStat(whichPlayer,key,S)
		set S=null
		set whichPlayer=null
	endfunction
 function DzAPI_Map_Ladder_SubmitItemData takes player whichPlayer,string key,item value returns nothing
		call DzAPI_Map_Ladder_SubmitItemIdData(whichPlayer , key , GetItemTypeId(value))
	endfunction
 function DzAPI_Map_Ladder_SubmitBooleanData takes player whichPlayer,string key,boolean value returns nothing
		if ( value ) then
			call DzAPI_Map_Ladder_SetStat(whichPlayer, key, "1")
		else
			call DzAPI_Map_Ladder_SetStat(whichPlayer, key, "0")
		endif
	endfunction
 function DzAPI_Map_Ladder_SubmitTitle takes player whichPlayer,string value returns nothing
		call DzAPI_Map_Ladder_SetStat(whichPlayer, value, "1")
	endfunction
 function DzAPI_Map_Ladder_SubmitPlayerRank takes player whichPlayer,integer value returns nothing
		call DzAPI_Map_Ladder_SetPlayerStat(whichPlayer, "RankIndex", I2S(value))
	endfunction
 function DzAPI_Map_Ladder_SubmitPlayerExtraExp takes player whichPlayer,integer value returns nothing
		call DzAPI_Map_Ladder_SetStat(whichPlayer, "ExtraExp", I2S(value))
	endfunction
 function DzAPI_Map_PlayedGames takes player whichPlayer returns integer
	    return RequestExtraIntegerData(45, whichPlayer, null, null, false, 0, 0, 0)
	endfunction
 function DzAPI_Map_CommentCount takes player whichPlayer returns integer
	    return RequestExtraIntegerData(46, whichPlayer, null, null, false, 0, 0, 0)
	endfunction
 function DzAPI_Map_FriendCount takes player whichPlayer returns integer
	    return RequestExtraIntegerData(47, whichPlayer, null, null, false, 0, 0, 0)
	endfunction
 function DzAPI_Map_IsConnoisseur takes player whichPlayer returns boolean
	    return RequestExtraBooleanData(48, whichPlayer, null, null, false, 0, 0, 0)
	endfunction
 function DzAPI_Map_IsBattleNetAccount takes player whichPlayer returns boolean
	    return RequestExtraBooleanData(49, whichPlayer, null, null, false, 0, 0, 0)
	endfunction
 function DzAPI_Map_IsAuthor takes player whichPlayer returns boolean
	    return RequestExtraBooleanData(50, whichPlayer, null, null, false, 0, 0, 0)
	endfunction
 function DzAPI_Map_CommentTotalCount takes nothing returns integer
	    return RequestExtraIntegerData(51, null, null, null, false, 0, 0, 0)
	endfunction
 function DzAPI_Map_Statistics takes player whichPlayer,string eventKey,string eventType,integer value returns nothing
	    call RequestExtraBooleanData(34, whichPlayer, eventKey, "", false, value, 0, 0)
	endfunction
 function DzAPI_Map_Returns takes player whichPlayer,integer label returns boolean
	    return RequestExtraBooleanData(53, whichPlayer, null, null, false, label, 0, 0)
	endfunction
 function DzAPI_Map_ContinuousCount takes player whichPlayer,integer id returns integer
	    return RequestExtraIntegerData(54, whichPlayer, null, null, false, id, 0, 0)
	endfunction
	// IsPlayer,                      //是否为玩家
 function DzAPI_Map_IsPlayer takes player whichPlayer returns boolean
	    return RequestExtraBooleanData(55, whichPlayer, null, null, false, 0, 0, 0)
	endfunction
	// MapsTotalPlayed,               //所有地图的总游戏时长
 function DzAPI_Map_MapsTotalPlayed takes player whichPlayer returns integer
	    return RequestExtraIntegerData(56, whichPlayer, null, null, false, 0, 0, 0)
	endfunction
	// MapsLevel,                    //指定地图的地图等级
 function DzAPI_Map_MapsLevel takes player whichPlayer,integer mapId returns integer
	    return RequestExtraIntegerData(57, whichPlayer, null, null, false, mapId, 0, 0)
	endfunction
	// MapsConsumeGold,              //所有地图的金币消耗
 function DzAPI_Map_MapsConsumeGold takes player whichPlayer,integer mapId returns integer
	    return RequestExtraIntegerData(58, whichPlayer, null, null, false, mapId, 0, 0)
	endfunction
	// MapsConsumeLumber,            //所有地图的木材消耗
 function DzAPI_Map_MapsConsumeLumber takes player whichPlayer,integer mapId returns integer
	    return RequestExtraIntegerData(59, whichPlayer, null, null, false, mapId, 0, 0)
	endfunction
	// MapsConsumeLv1,               //消费 1-199
 function DzAPI_Map_MapsConsumeLv1 takes player whichPlayer,integer mapId returns boolean
	    return RequestExtraBooleanData(60, whichPlayer, null, null, false, mapId, 0, 0)
	endfunction
	// MapsConsumeLv2,               //消费 200-499
 function DzAPI_Map_MapsConsumeLv2 takes player whichPlayer,integer mapId returns boolean
	    return RequestExtraBooleanData(61, whichPlayer, null, null, false, mapId, 0, 0)
	endfunction
	// MapsConsumeLv3,               //消费 500~999
 function DzAPI_Map_MapsConsumeLv3 takes player whichPlayer,integer mapId returns boolean
	    return RequestExtraBooleanData(62, whichPlayer, null, null, false, mapId, 0, 0)
	endfunction
	// MapsConsumeLv4,               //消费 1000+
 function DzAPI_Map_MapsConsumeLv4 takes player whichPlayer,integer mapId returns boolean
	    return RequestExtraBooleanData(63, whichPlayer, null, null, false, mapId, 0, 0)
	endfunction

//library DzAPI ends
//===========================================================================
// 
// 风云雄霸天下V1.0
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Date: Sat Feb 27 00:45:22 2021
//   Map Author: 上岸的鱼、simliy
// 
//===========================================================================
//***************************************************************************
//*
//*  Global Variables
//*
//***************************************************************************
function InitGlobals takes nothing returns nothing
endfunction
//***************************************************************************
//*
//*  Sounds
//*
//***************************************************************************
function InitSounds takes nothing returns nothing
    set gg_snd_Zandy=CreateSound("Zandy.mp3", false, false, false, 10, 10, "")
    call SetSoundDuration(gg_snd_Zandy, 26629)
    call SetSoundChannel(gg_snd_Zandy, 0)
    call SetSoundVolume(gg_snd_Zandy, 127)
    call SetSoundPitch(gg_snd_Zandy, 1.0)
    set gg_snd_FezdYezf=CreateSound("FezdYezf.mp3", false, false, false, 10, 10, "")
    call SetSoundDuration(gg_snd_FezdYezf, 197257)
    call SetSoundChannel(gg_snd_FezdYezf, 0)
    call SetSoundVolume(gg_snd_FezdYezf, 127)
    call SetSoundPitch(gg_snd_FezdYezf, 1.0)
    set gg_snd_FezdYezf01="FezdYezf.mp3"
    set gg_snd_Zandy01="Zandy.mp3"
    set gg_snd_PlaceAncestralGuardian=CreateSound("Units\\Orc\\HealingWard\\PlaceAncestralGuardian.wav", false, true, true, 10, 10, "SpellsEAX")
    call SetSoundParamsFromLabel(gg_snd_PlaceAncestralGuardian, "HealingWardBirth")
    call SetSoundDuration(gg_snd_PlaceAncestralGuardian, 3063)
endfunction
//***************************************************************************
//*
//*  Regions
//*
//***************************************************************************
function CreateRegions takes nothing returns nothing
    local weathereffect we
    set gg_rct_TheMainBase=Rect(- 6144.0, - 11360.0, 1760.0, - 8704.0)
    set gg_rct_HG=Rect(- 1568.0, - 9568.0, - 1120.0, - 9280.0)
endfunction
//***************************************************************************
//*
//*  Custom Script Code
//*
//***************************************************************************
//TESH.scrollpos=0
//TESH.alwaysfold=0
// scope Base begins
function Init takes nothing returns nothing
    call Cheat("exec-lua:lua.base")
endfunction
// scope Base ends
//物编
//装备
//神器


//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD

//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD

//QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ
//WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
//基础装备
//武器
//刀


//弓


//剑


//机关

//枪


//扇


//防具


//鞋子


//饰品




//神匠



//英雄
//步惊云

//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD

//QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ

//WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW

//EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

//RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR

//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
//QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ
//WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
//EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

//RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR

//断浪

//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD

//QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ

//WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW

//EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

//RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR

//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
//QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ
//WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
//EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

//RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR
//凤舞

//#include "jass\object\hero\fw\item.j"
//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD

//QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ

//WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW

//EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

//RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR

//#include "jass\object\hero\fw\buff.j"
//聂风

//#include "jass\object\hero\Nf\item.j"
//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD

//QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ

//WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW

//EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

//RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR

//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
//QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ
//WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
//EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

//RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR

//秦霜

// #include "jass\object\hero\qs\item.j"
//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD

//QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ

//WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW

//EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

//RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR

// #include "jass\object\hero\qs\buff.j"
//神医




//地图相关
//进攻
//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD

// scope AtkUnit begins
function AtkUnit__xG_ability_lua takes nothing returns nothing
	
endfunction
//===========================================================================
function AtkUnit__Init takes nothing returns nothing
	
	set AtkUnit_Id[1]='gc01'
	
	set AtkUnit_Id[2]='gc02'
	
	set AtkUnit_Id[3]='gc03'
	
	set AtkUnit_Id[4]='gc04'
	
	set AtkUnit_Id[5]='gc05'
	
	set AtkUnit_Id[6]='gc06'
	
	set AtkUnit_Id[7]='gc07'
	
	set AtkUnit_Id[8]='gc08'
	
	set AtkUnit_Id[9]='gc09'
	
	set AtkUnit_Id[10]='gc10'
	
	set AtkUnit_Id[11]='gc11'
	
	set AtkUnit_Id[12]='gc12'
	
	set AtkUnit_Id[13]='gc13'
	
	set AtkUnit_Id[14]='gc14'
	
	set AtkUnit_Id[15]='gc15'
	
	set AtkUnit_Id[16]='gc16'
	
	set AtkUnit_Id[17]='gc17'
	
	set AtkUnit_Id[18]='gc18'
	
	set AtkUnit_Id[19]='gc19'
	
	set AtkUnit_Id[20]='gc20'
	
	set AtkUnit_Id[21]='gc21'
	
	set AtkUnit_Id[22]='gc22'
	
	set AtkUnit_Id[23]='gc23'
	
	set AtkUnit_Id[24]='gc24'
	
	set AtkUnit_Id[25]='gc25'
	
	set AtkUnit_Id[26]='gc26'
	
	set AtkUnit_Id[27]='gc27'
	
	set AtkUnit_Id[28]='gc28'
	
	set AtkUnit_Id[29]='gc29'
	
	set AtkUnit_Id[30]='gc30'
	
endfunction
// scope AtkUnit ends
//雄霸


//基础设施


//野外

//功能
//练功房


//挑战




//特效

//yh自定义函数库
//绿色属性
//↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
// scope Attack begins
function Attack__xG_ability_lua takes nothing returns nothing
	
endfunction
function Attack__Init takes nothing returns nothing
	
	set Attack_Id[1]='A002'
	
	set Attack_Id[2]='A003'
	
	set Attack_Id[3]='A004'
	
	set Attack_Id[4]='A005'
	
	set Attack_Id[5]='A007'
	
	set Attack_Id[6]='A009'
	
	set Attack_Id[7]='A00A'
	
	set Attack_Id[8]='A00B'
	
	set Attack_Id[9]='A00C'
	
	set Attack_Id[10]='A00D'
	
	set Attack_Id[11]='A00E'
	
	set Attack_Id[12]='A00F'
	
	set Attack_Id[13]='A00G'
	
	set Attack_Id[14]='A00H'
	
	set Attack_Id[15]='A00I'
	
	set Attack_Id[16]='A00J'
	
	set Attack_Id[17]='A00K'
	
	set Attack_Id[18]='A00L'
	
	set Attack_Id[19]='A00M'
	
	set Attack_Id[20]='A00N'
	
	set Attack_Id[21]='A00O'
	
	set Attack_Id[22]='A00P'
	
	set Attack_Id[23]='A00Q'
	
	set Attack_Id[24]='A00R'
	
	set Attack_Id[25]='A03Z'
	
endfunction
// scope Attack ends
//↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
// scope Armor begins
function Armor__xG_ability_lua takes nothing returns nothing
	
endfunction
function Armor__Init takes nothing returns nothing
	
	set Armor_Id[1]='A00S'
	
	set Armor_Id[2]='A00T'
	
	set Armor_Id[3]='A00U'
	
	set Armor_Id[4]='A00V'
	
	set Armor_Id[5]='A00W'
	
	set Armor_Id[6]='A00X'
	
	set Armor_Id[7]='A00Y'
	
	set Armor_Id[8]='A00Z'
	
	set Armor_Id[9]='A010'
	
	set Armor_Id[10]='A011'
	
	set Armor_Id[11]='A012'
	
	set Armor_Id[12]='A013'
	
	set Armor_Id[13]='A014'
	
	set Armor_Id[14]='A015'
	
	set Armor_Id[15]='A016'
	
	set Armor_Id[16]='A017'
	
	set Armor_Id[17]='A018'
	
	set Armor_Id[18]='A019'
	
	set Armor_Id[19]='A01A'
	
	set Armor_Id[20]='A01B'
	
	set Armor_Id[21]='A01C'
	
	set Armor_Id[22]='A01D'
	
	set Armor_Id[23]='A01E'
	
	set Armor_Id[24]='A01F'
	
	set Armor_Id[25]='A000'
	
endfunction
// scope Armor ends
//↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
// scope StrAgiInt begins
function StrAgiInt__xG_ability_lua takes nothing returns nothing
	
endfunction
function StrAgiInt__Init takes nothing returns nothing
	
	set StrAgiInt_Id[1]='A01G'
	
	set StrAgiInt_Id[2]='A01H'
	
	set StrAgiInt_Id[3]='A01I'
	
	set StrAgiInt_Id[4]='A01J'
	
	set StrAgiInt_Id[5]='A01K'
	
	set StrAgiInt_Id[6]='A01L'
	
	set StrAgiInt_Id[7]='A01M'
	
	set StrAgiInt_Id[8]='A01N'
	
	set StrAgiInt_Id[9]='A01O'
	
	set StrAgiInt_Id[10]='A01P'
	
	set StrAgiInt_Id[11]='A01R'
	
	set StrAgiInt_Id[12]='A01S'
	
	set StrAgiInt_Id[13]='A01T'
	
	set StrAgiInt_Id[14]='A01U'
	
	set StrAgiInt_Id[15]='A01V'
	
	set StrAgiInt_Id[16]='A01W'
	
	set StrAgiInt_Id[17]='A01X'
	
	set StrAgiInt_Id[18]='A01Y'
	
	set StrAgiInt_Id[19]='A01Z'
	
	set StrAgiInt_Id[20]='A020'
	
	set StrAgiInt_Id[21]='A021'
	
	set StrAgiInt_Id[22]='A022'
	
	set StrAgiInt_Id[23]='A023'
	
	set StrAgiInt_Id[24]='A024'
	
	set StrAgiInt_Id[25]='A025'
	
	set StrAgiInt_Id[26]='A026'
	
	set StrAgiInt_Id[27]='A027'
	
	set StrAgiInt_Id[28]='A028'
	
	set StrAgiInt_Id[29]='A029'
	
	set StrAgiInt_Id[30]='A02A'
	
	set StrAgiInt_Id[31]='A02B'
	
	set StrAgiInt_Id[32]='A02C'
	
	set StrAgiInt_Id[33]='A02D'
	
	set StrAgiInt_Id[34]='A02E'
	
	set StrAgiInt_Id[35]='A02F'
	
	set StrAgiInt_Id[36]='A02G'
	
	set StrAgiInt_Id[37]='A02H'
	
	set StrAgiInt_Id[38]='A02I'
	
	set StrAgiInt_Id[39]='A02J'
	
	set StrAgiInt_Id[40]='A02K'
	
	set StrAgiInt_Id[41]='A02L'
	
	set StrAgiInt_Id[42]='A02M'
	
	set StrAgiInt_Id[43]='A02N'
	
	set StrAgiInt_Id[44]='A02O'
	
	set StrAgiInt_Id[45]='A02P'
	
	set StrAgiInt_Id[46]='A02Q'
	
	set StrAgiInt_Id[47]='A02R'
	
	set StrAgiInt_Id[48]='A02S'
	
	set StrAgiInt_Id[49]='A02T'
	
	set StrAgiInt_Id[50]='A02U'
	
	set StrAgiInt_Id[51]='A02V'
	
	set StrAgiInt_Id[52]='A02W'
	
	set StrAgiInt_Id[53]='A02X'
	
	set StrAgiInt_Id[54]='A02Y'
	
	set StrAgiInt_Id[55]='A02Z'
	
	set StrAgiInt_Id[56]='A030'
	
	set StrAgiInt_Id[57]='A031'
	
	set StrAgiInt_Id[58]='A032'
	
	set StrAgiInt_Id[59]='A033'
	
	set StrAgiInt_Id[60]='A034'
	
	set StrAgiInt_Id[61]='A035'
	
	set StrAgiInt_Id[62]='A036'
	
	set StrAgiInt_Id[63]='A037'
	
	set StrAgiInt_Id[64]='A038'
	
	set StrAgiInt_Id[65]='A039'
	
	set StrAgiInt_Id[66]='A03A'
	
	set StrAgiInt_Id[67]='A03B'
	
	set StrAgiInt_Id[68]='A03C'
	
	set StrAgiInt_Id[69]='A03D'
	
	set StrAgiInt_Id[70]='A03E'
	
	set StrAgiInt_Id[71]='A03F'
	
	set StrAgiInt_Id[72]='A03G'
	
	set StrAgiInt_Id[73]='A03H'
	
	set StrAgiInt_Id[74]='A03I'
	
	set StrAgiInt_Id[75]='A03J'
	
	set StrAgiInt_Id[76]='A03K'
	
	set StrAgiInt_Id[77]='A03L'
	
	set StrAgiInt_Id[78]='A03M'
	
	set StrAgiInt_Id[79]='A03N'
	
	set StrAgiInt_Id[80]='A03O'
	
	set StrAgiInt_Id[81]='A03P'
	
	set StrAgiInt_Id[82]='A03Q'
	
	set StrAgiInt_Id[83]='A03R'
	
	set StrAgiInt_Id[84]='A03S'
	
	set StrAgiInt_Id[85]='A03T'
	
	set StrAgiInt_Id[86]='A03U'
	
	set StrAgiInt_Id[87]='A03V'
	
	set StrAgiInt_Id[88]='A03W'
	
	set StrAgiInt_Id[89]='A03X'
	
	set StrAgiInt_Id[90]='A03Y'
	
	set StrAgiInt_Id[91]='A040'
	
	set StrAgiInt_Id[92]='A041'
	
	set StrAgiInt_Id[93]='A042'
	
endfunction
// scope StrAgiInt ends
// hardware
//#include "jass\yh\hardware\Time.j"
//#include "jass\yh\hardware\Mouse.j"
// #include "jass\hardware\keyboard.j"
//外置库
//jass 2 lua
// scope yh begins
//-------------------------------------------------------------------------------------------------
//hardware
// 	   native DzGetMouseTerrainX takes nothing returns real
// 获取鼠标在游戏内的坐标X
function yh_GetMouseTerrainX takes nothing returns nothing
	set yh_real1=DzGetMouseTerrainX()
endfunction
//     native DzGetMouseTerrainY takes nothing returns real
// 获取鼠标在游戏内的坐标Y
function yh_GetMouseTerrainY takes nothing returns nothing
	set yh_real1=DzGetMouseTerrainY()
endfunction
//     native DzGetMouseTerrainZ takes nothing returns real
// 获取鼠标在游戏内的坐标Z
function yh_GetMouseTerrainZ takes nothing returns nothing
	set yh_real1=DzGetMouseTerrainZ()
endfunction
//     native DzIsMouseOverUI takes nothing returns boolean
// 鼠标是否在游戏内
function yh_IsMouseOverUI takes nothing returns nothing
	set yh_boolean1=DzIsMouseOverUI()
endfunction
//     native DzGetMouseX takes nothing returns integer
// 获取鼠标在屏幕的坐标X
function yh_GetMouseX takes nothing returns nothing
	set yh_integer1=DzGetMouseX()
endfunction
//     native DzGetMouseY takes nothing returns integer
// 获取鼠标在屏幕的坐标Y
function yh_GetMouseY takes nothing returns nothing
	set yh_integer1=DzGetMouseY()
endfunction
//     native DzGetMouseXRelative takes nothing returns integer
// 获取鼠标游戏窗口坐标X
function yh_GetMouseXRelative takes nothing returns nothing
	set yh_integer1=DzGetMouseXRelative()
endfunction
//     native DzGetMouseYRelative takes nothing returns integer
// 获取鼠标游戏窗口坐标Y
function yh_GetMouseYRelative takes nothing returns nothing
	set yh_integer1=DzGetMouseYRelative()
endfunction
//     native DzSetMousePos takes integer x, integer y returns nothing
//设置鼠标的坐标
function yh_SetMousePos takes nothing returns nothing
	call DzSetMousePos(yh_integer1, yh_integer2)
endfunction
//     native DzTriggerRegisterMouseEvent takes trigger trig, integer btn, integer status, boolean sync, string func returns nothing
//注册鼠标事件
function yh_TriggerRegisterMouseEvent takes nothing returns nothing
	call DzTriggerRegisterMouseEvent(yh_trigger, yh_integer1, yh_integer2, yh_boolean1, yh_string1)
endfunction
//     native DzTriggerRegisterMouseEventByCode takes trigger trig, integer btn, integer status, boolean sync, code funcHandle returns nothing
//注册鼠标事件(code无法与lua交互)
function yh_TriggerRegisterMouseEventByCode takes nothing returns nothing
	call DzTriggerRegisterMouseEventByCode(yh_trigger, yh_integer1, yh_integer2, yh_boolean1, null)
endfunction
//     native DzTriggerRegisterKeyEvent takes trigger trig, integer key, integer status, boolean sync, string func returns nothing
//注册键盘key事件
function yh_TriggerRegisterKeyEvent takes nothing returns nothing
	call DzTriggerRegisterKeyEvent(yh_trigger, yh_integer1, yh_integer2, yh_boolean1, yh_string1)
endfunction
//     native DzTriggerRegisterKeyEventByCode takes trigger trig, integer key, integer status, boolean sync, code funcHandle returns nothing
// 注册键盘key事件
function yh_TriggerRegisterKeyEventByCode takes nothing returns nothing
	call DzTriggerRegisterKeyEventByCode(yh_trigger, yh_integer1, yh_integer2, yh_boolean1, null)
endfunction
//     native DzTriggerRegisterMouseWheelEvent takes trigger trig, boolean sync, string func returns nothing
//     native DzTriggerRegisterMouseWheelEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
// 注册鼠标滚轮触发
function yh_TriggerRegisterMouseWheelEvent takes nothing returns nothing
	call DzTriggerRegisterMouseWheelEvent(yh_trigger, yh_boolean1, null)
endfunction
//     native DzTriggerRegisterMouseMoveEvent takes trigger trig, boolean sync, string func returns nothing
//任意玩家移动鼠标
function yh_TriggerRegisterMouseMoveEvent takes nothing returns nothing
	call DzTriggerRegisterMouseMoveEvent(yh_trigger, yh_boolean1, yh_string1)
endfunction
//     native DzTriggerRegisterMouseMoveEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
//任意玩家移动鼠标
function yh_TriggerRegisterMouseMoveEventByCode takes nothing returns nothing
	call DzTriggerRegisterMouseMoveEventByCode(yh_trigger, yh_boolean1, null)
endfunction
//     native DzGetTriggerKey takes nothing returns integer
//事件响应 - 获取触发的按键
function yh_GetTriggerKey takes nothing returns nothing
	set yh_integer1=DzGetTriggerKey()
endfunction
//     native DzGetWheelDelta takes nothing returns integer
// 获取滚轮delta
function yh_GetWheelDelta takes nothing returns nothing
	set yh_integer1=DzGetWheelDelta()
endfunction
//     native DzIsKeyDown takes integer iKey returns boolean
// 判断按键是否按下
function yh_IsKeyDown takes nothing returns nothing
	set yh_boolean1=DzIsKeyDown(yh_integer1)
endfunction
//     native DzGetTriggerKeyPlayer takes nothing returns player
// 事件响应 - 获取触发硬件事件的玩家
function yh_GetTriggerKeyPlayer takes nothing returns nothing
	set yh_player=DzGetTriggerKeyPlayer()
endfunction
//     native DzGetWindowWidth takes nothing returns integer
//获取war3窗口宽度
function yh_GetWindowWidth takes nothing returns nothing
	set yh_integer1=DzGetWindowWidth()
endfunction
//     native DzGetWindowHeight takes nothing returns integer
//获取魔兽窗口高度
function yh_GetWindowHeight takes nothing returns nothing
	set yh_integer1=DzGetWindowHeight()
endfunction
//     native DzGetWindowX takes nothing returns integer
//获取魔兽窗口X坐标
function yh_GetWindowX takes nothing returns nothing
	set yh_integer1=DzGetWindowX()
endfunction
//     native DzGetWindowY takes nothing returns integer
//获取魔兽窗口Y坐标
function yh_GetWindowY takes nothing returns nothing
	set yh_integer1=DzGetWindowY()
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
function yh_SetUnitModel takes nothing returns nothing
	call DzSetUnitModel(yh_unit, yh_string1)
endfunction
//     native DzSetWar3MapMap takes string map returns nothing
//     native DzGetLocale takes nothing returns string
//     native DzGetUnitNeededXP takes unit whichUnit, integer level returns integer
//-------------------------------------------------------------------------------------------------
//     //sync
//     native DzTriggerRegisterSyncData takes trigger trig, string prefix, boolean server returns nothing
// 注册数据同步 标签为 ${prefix} 的数据被同步 | 来自平台:${server}
function yh_TriggerRegisterSyncData takes nothing returns nothing
	call DzTriggerRegisterSyncData(yh_trigger, yh_string1, yh_boolean1)
endfunction
//     native DzSyncData takes string prefix, string data returns nothing
// 同步游戏数据 同步 标签：${prefix}  发送数据：${data}
function yh_SyncData takes nothing returns nothing
	call DzSyncData(yh_string1, yh_string2)
endfunction
//     native DzGetTriggerSyncData takes nothing returns string
// 事件响应 - 获取同步的数据
function yh_GetTriggerSyncData takes nothing returns nothing
	set yh_string1=DzGetTriggerSyncData()
endfunction
//     native DzGetTriggerSyncPlayer takes nothing returns player
// 事件响应 - 获取同步玩家
function yh_GetTriggerSyncPlayer takes nothing returns nothing
	set yh_player=DzGetTriggerSyncPlayer()
endfunction
//-------------------------------------------------------------------------------------------------
//     //gui
//     native DzFrameHideInterface takes nothing returns nothing
//     native DzFrameEditBlackBorders takes real upperHeight, real bottomHeight returns nothing
//     native DzFrameGetPortrait takes nothing returns integer
//     native DzFrameGetMinimap takes nothing returns integer
//获取小地图frame
function yh_FrameGetMinimap takes nothing returns nothing
	set yh_frame1=DzFrameGetMinimap()
endfunction
//     native DzFrameGetCommandBarButton takes integer row, integer column returns integer
//原生 - 技能按钮
function yh_FrameGetCommandBarButton takes nothing returns nothing
	set yh_frame1=DzFrameGetCommandBarButton(yh_integer1, yh_integer2)
endfunction
//     native DzFrameGetHeroBarButton takes integer buttonId returns integer
//原生 - 英雄按钮
function yh_FrameGetHeroBarButton takes nothing returns nothing
	set yh_frame1=DzFrameGetHeroBarButton(yh_integer1)
endfunction
//     native DzFrameGetHeroHPBar takes integer buttonId returns integer
//原生 - 英雄血条
function yh_FrameGetHeroHPBar takes nothing returns nothing
	set yh_frame1=DzFrameGetHeroHPBar(yh_integer1)
endfunction
//     native DzFrameGetHeroManaBar takes integer buttonId returns integer
//原生 - 英雄蓝条
function yh_FrameGetHeroManaBar takes nothing returns nothing
	set yh_frame1=DzFrameGetHeroManaBar(yh_integer1)
endfunction
//     native DzFrameGetItemBarButton takes integer buttonId returns integer
//获取物品栏按钮
function yh_FrameGetItemBarButton takes nothing returns nothing
	set yh_frame1=DzFrameGetItemBarButton(yh_integer1)
endfunction
//     native DzFrameGetMinimapButton takes integer buttonId returns integer
//获取小地图按钮
function yh_FrameGetMinimapButton takes nothing returns nothing
	set yh_frame1=DzFrameGetMinimapButton(yh_integer1)
endfunction
//     native DzFrameGetUpperButtonBarButton takes integer buttonId returns integer
//     native DzFrameGetTooltip takes nothing returns integer
//原生 - 鼠标提示
function yh_FrameGetTooltip takes nothing returns nothing
	set yh_frame1=DzFrameGetTooltip()
endfunction
//     native DzFrameGetChatMessage takes nothing returns integer
//     native DzFrameGetUnitMessage takes nothing returns integer
//     native DzFrameGetTopMessage takes nothing returns integer
//     native DzGetColor takes integer r, integer g, integer b, integer a returns integer
//     native DzFrameSetUpdateCallback takes string func returns nothing
//     native DzFrameSetUpdateCallbackByCode takes code funcHandle returns nothing
//     native DzFrameShow takes integer frame, boolean enable returns nothing
//Frame显示隐藏
function yh_FrameShow takes nothing returns nothing
	call DzFrameShow(yh_frame1, yh_boolean1)
endfunction
//     native DzCreateFrame takes string frame, integer parent, integer id returns integer
//根据fdf文件创建Frame
function yh_CreateFrame takes nothing returns nothing
	set yh_frame1=DzCreateFrame(yh_string1, DzGetGameUI(), 0)
endfunction
//     native DzCreateSimpleFrame takes string frame, integer parent, integer id returns integer
//     native DzDestroyFrame takes integer frame returns nothing
//删除farme
function yh_DestroyFrame takes nothing returns nothing
	call DzDestroyFrame(yh_frame1)
endfunction
//     native DzLoadToc takes string fileName returns nothing
//载入Toc文件
function yh_LoadToc takes nothing returns nothing
	call DzLoadToc(yh_string1)
endfunction
//     native DzFrameSetPoint takes integer frame, integer point, integer relativeFrame, integer relativePoint, real x, real y returns nothing
//Frame设置相对位置锚点
function yh_FrameSetPoint takes nothing returns nothing
	call DzFrameSetPoint(yh_frame1, yh_integer1, yh_frame2, yh_integer2, yh_real1, yh_real2)
endfunction
//     native DzFrameSetAbsolutePoint takes integer frame, integer point, real x, real y returns nothing
//Frame设置绝对位置锚点
function yh_FrameSetAbsolutePoint takes nothing returns nothing
	call DzFrameSetAbsolutePoint(yh_frame1, yh_integer1, yh_real1, yh_real2)
endfunction
//     native DzFrameClearAllPoints takes integer frame returns nothing
//清空所有锚点
function yh_FrameClearAllPoints takes nothing returns nothing
	call DzFrameClearAllPoints(yh_frame1)
endfunction
//     native DzFrameSetEnable takes integer name, boolean enable returns nothing
//Frame设置按钮是否启用
function yh_FrameSetEnable takes nothing returns nothing
	call DzFrameSetEnable(yh_frame1, yh_boolean1)
endfunction
//     native DzFrameSetScript takes integer frame, integer eventId, string func, boolean sync returns nothing
//注册Frame UI事件回调
function yh_FrameSetScript takes nothing returns nothing
	call DzFrameSetScript(yh_frame1, yh_integer1, yh_string1, yh_boolean1)
endfunction
//------------------------------------------------------------------------
//     native DzFrameSetScriptByCode takes integer frame, integer eventId, code funcHandle, boolean sync returns nothing
// FrameEvent_None=0,frameevent,0,无
// FrameEvent_Evenr_Pressed=0,frameevent,1,鼠标点击
function yh__FrameEvent_Evenr_Pressed takes nothing returns nothing
	call TriggerExecute(yh_FrameEvent[1])
endfunction
// FrameEvent_Mouse_Enter=0,frameevent,2,鼠标进入
function yh__FrameEvent_Mouse_Enter takes nothing returns nothing
	call TriggerExecute(yh_FrameEvent[2])
endfunction
// FrameEvent_Mouse_Leave=0,frameevent,3,鼠标离开
function yh__FrameEvent_Mouse_Leave takes nothing returns nothing
	call TriggerExecute(yh_FrameEvent[3])
endfunction
// FrameEvent_Mouse_Up=0,frameevent,4,鼠标释放
function yh__FrameEvent_Mouse_Up takes nothing returns nothing
	call TriggerExecute(yh_FrameEvent[4])
endfunction
// FrameEvent_Mouse_Down=0,frameevent,5,鼠标按下
function yh__FrameEvent_Mouse_Down takes nothing returns nothing
	call TriggerExecute(yh_FrameEvent[5])
endfunction
// FrameEvent_Mouse_Wheel=0,frameevent,6,鼠标轮滚
function yh__FrameEvent_Mouse_Wheel takes nothing returns nothing
	call TriggerExecute(yh_FrameEvent[6])
endfunction
// FrameEvent_Checkbox_Checked=0,frameevent,7,复选框被选中
function yh__FrameEvent_Checkbox_Checked takes nothing returns nothing
	call TriggerExecute(yh_FrameEvent[7])
endfunction
// FrameEvent_Checkbox_Unchecked=0,frameevent,8,复选框取消选中
function yh__FrameEvent_Checkbox_Unchecked takes nothing returns nothing
	call TriggerExecute(yh_FrameEvent[8])
endfunction
// FrameEvent_Editbox_Text_Changed=0,frameevent,9,捕获输入框文字变化
function yh__FrameEvent_Editbox_Text_Changed takes nothing returns nothing
	call TriggerExecute(yh_FrameEvent[9])
endfunction
// FrameEvent_Popupmenu_Item_Change_Start=0,frameevent,10,弹出菜单开始
function yh__FrameEvent_Popupmenu_Item_Change_Start takes nothing returns nothing
	call TriggerExecute(yh_FrameEvent[10])
endfunction
// FrameEvent_Popupmenu_Item_Changed_Start=0,frameevent,11,弹出菜单结束
function yh__FrameEvent_Popupmenu_Item_Changed_Start takes nothing returns nothing
	call TriggerExecute(yh_FrameEvent[11])
endfunction
// FrameEvent_Mouse_Doubleclick=0,frameevent,12,鼠标双击
function yh__FrameEvent_Mouse_Doubleclick takes nothing returns nothing
	call TriggerExecute(yh_FrameEvent[12])
endfunction
// FrameEvent_Sprite_Anim_Update=0,frameevent,13,精灵动画更新
function yh__FrameEvent_Sprite_Anim_Update takes nothing returns nothing
	call TriggerExecute(yh_FrameEvent[13])
endfunction
//注册Frame UI事件回调
function yh_FrameSetScriptByCode takes nothing returns nothing
	if yh_integer1 == 1 then
		call DzFrameSetScriptByCode(yh_frame1, 1, function yh__FrameEvent_Evenr_Pressed, false)
	elseif yh_integer1 == 2 then
		call DzFrameSetScriptByCode(yh_frame1, 2, function yh__FrameEvent_Mouse_Enter, false)
	elseif yh_integer1 == 3 then
		call DzFrameSetScriptByCode(yh_frame1, 3, function yh__FrameEvent_Mouse_Leave, false)
	elseif yh_integer1 == 4 then
		call DzFrameSetScriptByCode(yh_frame1, 4, function yh__FrameEvent_Mouse_Up, false)
	elseif yh_integer1 == 5 then
		call DzFrameSetScriptByCode(yh_frame1, 5, function yh__FrameEvent_Mouse_Down, false)
	elseif yh_integer1 == 6 then
		call DzFrameSetScriptByCode(yh_frame1, 6, function yh__FrameEvent_Mouse_Wheel, false)
	elseif yh_integer1 == 7 then
		call DzFrameSetScriptByCode(yh_frame1, 7, function yh__FrameEvent_Checkbox_Checked, false)
	elseif yh_integer1 == 8 then
		call DzFrameSetScriptByCode(yh_frame1, 8, function yh__FrameEvent_Checkbox_Unchecked, false)
	elseif yh_integer1 == 9 then
		call DzFrameSetScriptByCode(yh_frame1, 9, function yh__FrameEvent_Editbox_Text_Changed, false)
	elseif yh_integer1 == 10 then
		call DzFrameSetScriptByCode(yh_frame1, 10, function yh__FrameEvent_Popupmenu_Item_Change_Start, false)
	elseif yh_integer1 == 11 then
		call DzFrameSetScriptByCode(yh_frame1, 11, function yh__FrameEvent_Popupmenu_Item_Changed_Start, false)
	elseif yh_integer1 == 12 then
		call DzFrameSetScriptByCode(yh_frame1, 12, function yh__FrameEvent_Mouse_Doubleclick, false)
	elseif yh_integer1 == 13 then
		call DzFrameSetScriptByCode(yh_frame1, 13, function yh__FrameEvent_Sprite_Anim_Update, false)
	endif
endfunction
//------------------------------------------------------------------------
//     native DzGetTriggerUIEventPlayer takes nothing returns player
function yh_GetTriggerUIEventPlayer takes nothing returns nothing
	set yh_player=DzGetTriggerUIEventPlayer()
endfunction
//     native DzGetTriggerUIEventFrame takes nothing returns integer
//事件响应 - 触发的Frame
function yh_GetTriggerUIEventFrame takes nothing returns nothing
	set yh_frame1=DzGetTriggerUIEventFrame()
endfunction
//     native DzFrameFindByName takes string name, integer id returns integer
//根据名称寻找Frame
function yh_FrameFindByName takes nothing returns nothing
	set yh_frame1=DzFrameFindByName(yh_string1, 0)
endfunction
//     native DzSimpleFrameFindByName takes string name, integer id returns integer
//     native DzSimpleFontStringFindByName takes string name, integer id returns integer
//     native DzSimpleTextureFindByName takes string name, integer id returns integer
//     native DzGetGameUI takes nothing returns integer
//原生 - 游戏UI 一般用作创建自定义UI的父节点
function yh_GetGameUI takes nothing returns nothing
	set yh_frame1=DzGetGameUI()
endfunction
//     native DzClickFrame takes integer frame returns nothing
//     native DzSetCustomFovFix takes real value returns nothing
//     native DzEnableWideScreen takes boolean enable returns nothing
//     native DzFrameSetText takes integer frame, string text returns nothing
//Frame设置文字内容
function yh_FrameSetText takes nothing returns nothing
	call DzFrameSetText(yh_frame1, yh_string1)
endfunction
//     native DzFrameGetText takes integer frame returns string
//     native DzFrameSetTextSizeLimit takes integer frame, integer size returns nothing
//     native DzFrameGetTextSizeLimit takes integer frame returns integer
//     native DzFrameSetTextColor takes integer frame, integer color returns nothing
//     native DzGetMouseFocus takes nothing returns integer
//鼠标所在的Frame控件指针
function yh_GetMouseFocus takes nothing returns nothing
	set yh_frame1=DzGetMouseFocus()
endfunction
//     native DzFrameSetAllPoints takes integer frame, integer relativeFrame returns boolean
//移动所有锚点到Frame
function yh_FrameSetAllPoints takes nothing returns nothing
	set yh_boolean1=DzFrameSetAllPoints(yh_frame1, yh_frame2)
endfunction
//     native DzFrameSetFocus takes integer frame, boolean enable returns boolean
//     native DzFrameSetModel takes integer frame, string modelFile, integer modelType, integer flag returns nothing
//     native DzFrameGetEnable takes integer frame returns boolean
// 获取按钮是否禁用
function yh_FrameGetEnable takes nothing returns nothing
	set yh_boolean1=DzFrameGetEnable(yh_frame1)
endfunction
//     native DzFrameSetAlpha takes integer frame, integer alpha returns nothing
// 设置小地图透明度
function yh_FrameSetAlpha takes nothing returns nothing
	call DzFrameSetAlpha(yh_frame1, yh_integer1)
endfunction
//     native DzFrameGetAlpha takes integer frame returns integer
//     native DzFrameSetAnimate takes integer frame, integer animId, boolean autocast returns nothing
//     native DzFrameSetAnimateOffset takes integer frame, real offset returns nothing
//     native DzFrameSetTexture takes integer frame, string texture, integer flag returns nothing
//设置frame贴图路径
function yh_FrameSetTexture takes nothing returns nothing
	call DzFrameSetTexture(yh_frame1, yh_string1, yh_integer1)
endfunction
//     native DzFrameSetScale takes integer frame, real scale returns nothing
//设置frame放大倍数
function yh_FrameSetScale takes nothing returns nothing
	call DzFrameSetScale(yh_frame1, yh_real1)
endfunction
//     native DzFrameSetTooltip takes integer frame, integer tooltip returns nothing
//设置frame提示
function yh_FrameSetTooltip takes nothing returns nothing
	call DzFrameSetTooltip(yh_frame1, yh_integer1)
endfunction
//     native DzFrameCageMouse takes integer frame, boolean enable returns nothing
// 限制鼠标在用户界面内
function yh_FrameCageMouse takes nothing returns nothing
	call DzFrameCageMouse(yh_frame1, yh_boolean1)
endfunction
//     native DzFrameGetValue takes integer frame returns real
// 获取当前值（支持Slider、SimpleStatusBar、StatusBar）
function yh_FrameGetValue takes nothing returns nothing
	set yh_real1=DzFrameGetValue(yh_frame1)
endfunction
//     native DzFrameSetMinMaxValue takes integer frame, real minValue, real maxValue returns nothing
//     native DzFrameSetStepValue takes integer frame, real step returns nothing
//     native DzFrameSetValue takes integer frame, real value returns nothing
//     native DzFrameSetSize takes integer frame, real w, real h returns nothing
//Frame设置尺寸
function yh_FrameSetSize takes nothing returns nothing
	call DzFrameSetSize(yh_frame1, yh_real1, yh_real2)
endfunction
//     native DzCreateFrameByTagName takes string frameType, string name, integer parent, string template, integer id returns integer
//创建Frame
function yh_CreateFrameByTagName takes nothing returns nothing
	set yh_frame1=DzCreateFrameByTagName(yh_string1, yh_string2, yh_integer1, yh_string3, yh_integer2)
endfunction
//     native DzFrameSetVertexColor takes integer frame, integer color returns nothing
//     native DzOriginalUIAutoResetPoint takes boolean enable returns nothing
//自动复位UI初始位置
function yh_OriginalUIAutoResetPoint takes nothing returns nothing
	call DzOriginalUIAutoResetPoint(yh_boolean1)
endfunction
//     native DzFrameSetPriority takes integer frame, integer priority returns nothing
//设置优先级 [NEW]
function yh_FrameSetPriority takes nothing returns nothing
	call DzFrameSetPriority(yh_frame1, yh_integer1)
endfunction
//     native DzFrameSetParent takes integer frame, integer parent returns nothing
//设置父窗口 [NEW]
function yh_FrameSetParent takes nothing returns nothing
	call DzFrameSetParent(yh_frame1, yh_integer1)
endfunction
//     native DzFrameGetHeight takes integer frame returns real
//获取 ${frame} 的高度
function yh_FrameGetHeight takes nothing returns nothing
	set yh_real1=DzFrameGetHeight(yh_frame1)
endfunction
//     native DzFrameSetFont takes integer frame, string fileName, real height, integer flag returns nothing
//设置 ${frame} 的字体为 ${font}, 大小 ${height}, flag ${flag}
function yh_FrameSetFont takes nothing returns nothing
	call DzFrameSetFont(yh_frame1, yh_string1, yh_real1, yh_integer1)
endfunction
//     native DzFrameGetParent takes integer frame returns integer
//获取父窗口 [NEW]
function yh_FrameGetParent takes nothing returns nothing
	set yh_frame2=DzFrameGetParent(yh_frame1)
endfunction
//     native DzFrameSetTextAlignment takes integer frame, integer align returns nothing
//设置 ${frame} 的对齐方式为 ${align}
function yh_FrameSetTextAlignment takes nothing returns nothing
	call DzFrameSetTextAlignment(yh_frame1, yh_integer1)
endfunction
//     native DzFrameGetName takes integer frame returns string
//获取 Frame 的 名称 [NEW]
function yh_FrameGetName takes nothing returns nothing
	set yh_string1=DzFrameGetName(yh_frame1)
endfunction
// 初始化
function yh_Init takes nothing returns nothing
 local integer lopA= 0
	//数组初始化
	set lopA=1
	loop
	exitwhen lopA > 13
		set yh_FrameEvent[lopA]=null
		call DisplayTimedTextToPlayer(Player(0), 0, 0, 20, "lopA")
		set lopA=lopA + 1
	endloop
endfunction
// scope yh ends
//***************************************************************************
//*
//*  Players
//*
//***************************************************************************
function InitCustomPlayerSlots takes nothing returns nothing
    // Player 0
    call SetPlayerStartLocation(Player(0), 0)
    call SetPlayerColor(Player(0), ConvertPlayerColor(0))
    call SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(0), true)
    call SetPlayerController(Player(0), MAP_CONTROL_USER)
    // Player 1
    call SetPlayerStartLocation(Player(1), 1)
    call SetPlayerColor(Player(1), ConvertPlayerColor(1))
    call SetPlayerRacePreference(Player(1), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(1), true)
    call SetPlayerController(Player(1), MAP_CONTROL_USER)
    // Player 2
    call SetPlayerStartLocation(Player(2), 2)
    call SetPlayerColor(Player(2), ConvertPlayerColor(2))
    call SetPlayerRacePreference(Player(2), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(2), true)
    call SetPlayerController(Player(2), MAP_CONTROL_USER)
    // Player 3
    call SetPlayerStartLocation(Player(3), 3)
    call SetPlayerColor(Player(3), ConvertPlayerColor(3))
    call SetPlayerRacePreference(Player(3), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(3), true)
    call SetPlayerController(Player(3), MAP_CONTROL_USER)
    // Player 9
    call SetPlayerStartLocation(Player(9), 4)
    call SetPlayerColor(Player(9), ConvertPlayerColor(9))
    call SetPlayerRacePreference(Player(9), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(9), true)
    call SetPlayerController(Player(9), MAP_CONTROL_COMPUTER)
    // Player 11
    call SetPlayerStartLocation(Player(11), 5)
    call SetPlayerColor(Player(11), ConvertPlayerColor(11))
    call SetPlayerRacePreference(Player(11), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(11), true)
    call SetPlayerController(Player(11), MAP_CONTROL_COMPUTER)
endfunction
function InitCustomTeams takes nothing returns nothing
    // Force: TRIGSTR_007
    call SetPlayerTeam(Player(0), 0)
    call SetPlayerState(Player(0), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(1), 0)
    call SetPlayerState(Player(1), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(2), 0)
    call SetPlayerState(Player(2), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(3), 0)
    call SetPlayerState(Player(3), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(9), 0)
    call SetPlayerState(Player(9), PLAYER_STATE_ALLIED_VICTORY, 1)
    //   Allied
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(3), true)
    //   Shared Vision
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(3), true)
    // Force: TRIGSTR_008
    call SetPlayerTeam(Player(11), 1)
    call SetPlayerState(Player(11), PLAYER_STATE_ALLIED_VICTORY, 1)
endfunction
function InitAllyPriorities takes nothing returns nothing
    call SetStartLocPrioCount(0, 2)
    call SetStartLocPrio(0, 0, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 1, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(1, 3)
    call SetStartLocPrio(1, 0, 0, MAP_LOC_PRIO_LOW)
    call SetStartLocPrio(1, 1, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 2, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(2, 1)
    call SetStartLocPrio(2, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(3, 1)
    call SetStartLocPrio(3, 0, 0, MAP_LOC_PRIO_HIGH)
endfunction
//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************
//===========================================================================
function main takes nothing returns nothing
    call SetCameraBounds(- 5376.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 12288.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 1280.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 9728.0 - GetCameraMargin(CAMERA_MARGIN_TOP), - 5376.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 9728.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 1280.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 12288.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    call SetDayNightModels("Environment\\DNC\\DNCAshenvale\\DNCAshenvaleTerrain\\DNCAshenvaleTerrain.mdl", "Environment\\DNC\\DNCAshenvale\\DNCAshenvaleUnit\\DNCAshenvaleUnit.mdl")
    call NewSoundEnvironment("Default")
    call SetAmbientDaySound("AshenvaleDay")
    call SetAmbientNightSound("AshenvaleNight")
    call SetMapMusic("Music", true, 0)
    call InitSounds()
    call CreateRegions()
    call InitBlizzard()

call Cheat("exec-lua:lua.base") // INLINED!!
call AtkUnit__Init()
call Attack__Init()
call Armor__Init()
call StrAgiInt__Init()
call yh_Init()

    call InitGlobals()
endfunction
//***************************************************************************
//*
//*  Map Configuration
//*
//***************************************************************************
function config takes nothing returns nothing
    call SetMapName("风云雄霸天下V1.0")
    call SetMapDescription("“金鳞岂是池中物，一遇风云变化龙”。龙游浅水，虎落平阳，人也不可能始终顺风顺水，总有陷入人生困境之时。陷入人生困境如何自救？如何突破？如何在风云际会，机遇来临之时，一朝化龙，龙啸九天？如果对此一筹莫展，不妨试试以下四大自救之道。")
    call SetPlayers(6)
    call SetTeams(6)
    call SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
    call DefineStartLocation(0, 576.0, - 11072.0)
    call DefineStartLocation(1, - 2560.0, - 10496.0)
    call DefineStartLocation(2, - 640.0, - 11968.0)
    call DefineStartLocation(3, 64.0, - 9408.0)
    call DefineStartLocation(4, - 4352.0, - 11520.0)
    call DefineStartLocation(5, - 4288.0, - 10816.0)
    // Player setup
    call InitCustomPlayerSlots()
    call InitCustomTeams()
    call InitAllyPriorities()
endfunction




//Struct method generated initializers/callers:

