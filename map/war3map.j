globals
//globals from BzAPI:
constant boolean LIBRARY_BzAPI=true
//endglobals from BzAPI
//globals from DzAPI:
constant boolean LIBRARY_DzAPI=true
//endglobals from DzAPI
    // User-defined
integer array udg_atkUnit
    // Generated
rect gg_rct_TrainRoom_Player0= null
rect gg_rct_TrainRoom_Player1= null
rect gg_rct_TrainRoom_Player2= null
rect gg_rct_TrainRoom_Player3= null
rect gg_rct_FirstHeroSelection= null
rect gg_rct_TheMainBase= null
rect gg_rct_HG= null
rect gg_rct_Task_1= null
rect gg_rct_AttackLine1= null
sound gg_snd_Zandy= null
sound gg_snd_FezdYezf= null
string gg_snd_FezdYezf01
string gg_snd_Zandy01
sound gg_snd_PlaceAncestralGuardian= null
trigger gg_trg_Doodad______u= null
trigger gg_trg_Lua_Unit_Sy= null
trigger gg_trg_Lua_Itme_Sy= null
trigger gg_trg_Lua_Ability_Sy= null
trigger gg_trg_Lua_Buff_Sy= null
trigger gg_trg_Lua_Unit_Bjy= null
trigger gg_trg_Lua_Ability_Bjy= null
trigger gg_trg_Lua_Buff_Bjy= null
trigger gg_trg_Lua_Unit_Nf= null
trigger gg_trg_Lua_Ability_Nf= null
trigger gg_trg_Lua_Buff_Nf= null
trigger gg_trg_Lua_Unit_Fw= null
trigger gg_trg_Lua_Ability_Fw= null
trigger gg_trg_Lua_Buff_Fw= null
trigger gg_trg_Lua_Unit_Qs= null
trigger gg_trg_Lua_Ability_Qs= null
trigger gg_trg_Lua_Buff_QS= null
trigger gg_trg_Lua_Unit_Dl= null
trigger gg_trg_Lua_Ability_Dl= null
trigger gg_trg_Lua_Buff_Dl= null
trigger gg_trg_Lua_Unit_Mj= null
trigger gg_trg_Lua_Unit_Build= null
trigger gg_trg_Lua_Ability_Build= null
trigger gg_trg_Lua_Unit_Base= null
trigger gg_trg_Lua_Item_Base= null
trigger gg_trg_Lua_Unit_Lgf= null
trigger gg_trg_Lua_Ability_Lgf= null
trigger gg_trg_Lua_Item_Dao= null
trigger gg_trg_Lua_Unit_Dao= null
trigger gg_trg_Lua_Item_Jian= null
trigger gg_trg_Lua_Unit_Jian= null
trigger gg_trg_Lua_Item_Gong= null
trigger gg_trg_Lua_Unit_Gong= null
trigger gg_trg_Lua_Item_Shan= null
trigger gg_trg_Lua_Unit_Shan= null
trigger gg_trg_Lua_Item_Qiang= null
trigger gg_trg_Lua_Unit_Qiang= null
trigger gg_trg_Lua_Item_JiGuan= null
trigger gg_trg_Lua_Unit_JiGuan= null
trigger gg_trg_Lua_Item_Fj= null
trigger gg_trg_Lua_Unit_Fj= null
trigger gg_trg_Lua_Item_Sp_Xl= null
trigger gg_trg_Lua_Item_Sp_Yp= null
trigger gg_trg_Lua_Item_SP_Sz= null
trigger gg_trg_Lua_Unit_Sp= null
trigger gg_trg_Lua_Item_Shoe= null
trigger gg_trg_Lua_Unit_Shoe= null
trigger gg_trg_Lua_Unit_Yw= null
trigger gg_trg_Lua_Unit_Sq= null
trigger gg_trg_Lua_Item_Wq= null
trigger gg_trg_Lua_Buff_Wq= null
trigger gg_trg_Lua_Ability_Wq= null
trigger gg_trg_Lua_Item_Zz= null
trigger gg_trg_Lua_Ability_Zz= null
trigger gg_trg_Lua_Unit_Zz= null
trigger gg_trg_Lua_Unit_Tz= null
trigger gg_trg_Lua_Item_Tz= null
trigger gg_trg_Lua_Unit_Tz0= null
trigger gg_trg_Lua_Unit_Tz1= null
trigger gg_trg_Lua_Unit_Atk= null
integer array Attack_Id
integer array Armor_Id
integer array StrAgiInt_Id
hashtable Mouse__Hash= InitHashtable()
integer Mouse_ItemBarIndex
trigger Mouse_ItemBarLeave= CreateTrigger()
trigger Mouse_ItemBarEnter= CreateTrigger()
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
code yh_code= null
player yh_player= null
unit yh_unit= null
unitstate yh_unitstate= null
    //public integer array Id


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
//   Date: Tue Feb 16 17:31:22 2021
//   Map Author: 上岸的鱼、simliy
// 
//===========================================================================
//***************************************************************************
//*
//*  Global Variables
//*
//***************************************************************************
function InitGlobals takes nothing returns nothing
    local integer i= 0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_atkUnit[i]=0
        set i=i + 1
    endloop
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
//*  Items
//*
//***************************************************************************
function CreateAllItems takes nothing returns nothing
    local integer itemID
    call CreateItem('I000', - 2044.5, - 9045.2)
    call CreateItem('I001', - 2050.5, - 8984.4)
    call CreateItem('I001', - 1939.7, - 9063.9)
    call CreateItem('pghe', - 1736.9, - 8607.2)
    call CreateItem('pghe', - 1824.5, - 8652.8)
    call CreateItem('pghe', - 1813.3, - 8877.7)
    call CreateItem('pghe', - 1849.1, - 8757.1)
    call CreateItem('pghe', - 1964.0, - 8728.7)
    call CreateItem('pghe', - 1960.3, - 8827.5)
    call CreateItem('pghe', - 1723.9, - 8744.7)
    call CreateItem('pghe', - 1689.8, - 8877.7)
    call CreateItem('qh08', - 1749.5, - 9017.4)
    call CreateItem('qh08', - 1695.6, - 9079.6)
    call CreateItem('tz04', - 1847.5, - 9051.0)
    call CreateItem('tz10', - 1872.0, - 9118.6)
    call CreateItem('tz13', - 1709.3, - 9175.1)
    call CreateItem('tz15', - 2002.0, - 9135.0)
endfunction
//***************************************************************************
//*
//*  Unit Creation
//*
//***************************************************************************
//===========================================================================
function CreateBuildingsForPlayer9 takes nothing returns nothing
    local player p= Player(9)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'bas0', - 2368.0, - 9600.0, 270.000)
endfunction
//===========================================================================
function CreateNeutralPassiveBuildings takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_PASSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'h000', - 1280.0, - 8192.0, 270.000)
endfunction
//===========================================================================
function CreateNeutralPassive takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_PASSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'nrac', 4878.0, - 8637.9, 231.917)
    set u=CreateUnit(p, 'nfro', 3146.9, - 10035.4, 184.620)
    set u=CreateUnit(p, 'nfro', 3230.8, - 9993.1, 322.129)
endfunction
//===========================================================================
function CreatePlayerBuildings takes nothing returns nothing
    call CreateBuildingsForPlayer9()
endfunction
//===========================================================================
function CreatePlayerUnits takes nothing returns nothing
endfunction
//===========================================================================
function CreateAllUnits takes nothing returns nothing
    call CreateNeutralPassiveBuildings()
    call CreateBuildingsForPlayer9() // INLINED!!
    call CreateNeutralPassive()
    call CreatePlayerUnits()
endfunction
//***************************************************************************
//*
//*  Regions
//*
//***************************************************************************
function CreateRegions takes nothing returns nothing
    local weathereffect we
    set gg_rct_TrainRoom_Player0=Rect(- 7552.0, - 6976.0, - 6272.0, - 5344.0)
    set we=AddWeatherEffect(gg_rct_TrainRoom_Player0, 'LRma')
    call EnableWeatherEffect(we, true)
    set gg_rct_TrainRoom_Player1=Rect(- 9024.0, - 6912.0, - 7968.0, - 5344.0)
    set we=AddWeatherEffect(gg_rct_TrainRoom_Player1, 'LRma')
    call EnableWeatherEffect(we, true)
    set gg_rct_TrainRoom_Player2=Rect(- 10400.0, - 6912.0, - 9312.0, - 5344.0)
    set we=AddWeatherEffect(gg_rct_TrainRoom_Player2, 'LRma')
    call EnableWeatherEffect(we, true)
    set gg_rct_TrainRoom_Player3=Rect(- 8288.0, - 4928.0, - 6272.0, - 3328.0)
    set we=AddWeatherEffect(gg_rct_TrainRoom_Player3, 'LRma')
    call EnableWeatherEffect(we, true)
    set gg_rct_FirstHeroSelection=Rect(3488.0, - 9856.0, 4480.0, - 9248.0)
    set we=AddWeatherEffect(gg_rct_FirstHeroSelection, 'RLlr')
    call EnableWeatherEffect(we, true)
    set gg_rct_TheMainBase=Rect(- 7168.0, - 11360.0, 1760.0, - 7808.0)
    set gg_rct_HG=Rect(- 1568.0, - 9568.0, - 1120.0, - 9280.0)
    set gg_rct_Task_1=Rect(- 3328.0, - 4864.0, - 2752.0, - 4448.0)
    set gg_rct_AttackLine1=Rect(- 2368.0, - 4544.0, - 1856.0, - 4224.0)
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
//#include "jass\object\init.j"
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
//***************************************************************************************************************************
//*
//******************************************************************
// scope Mouse begins
//↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
//离开
function Mouse__Leave_Actions takes nothing returns nothing
	set Mouse_ItemBarIndex=- 1
	//运行触发器
	call TriggerExecute(Mouse_ItemBarLeave)
endfunction
//进入
function Mouse__Enter_Actions takes nothing returns nothing
	set Mouse_ItemBarIndex=LoadInteger(Mouse__Hash, DzGetTriggerUIEventFrame(), 0)
	//运行触发器
	call TriggerExecute(Mouse_ItemBarEnter)
endfunction
//鼠标进入、离开物品栏
function Mouse__Init_A_Actions takes nothing returns nothing
 local integer lopA
 local integer frame
	set lopA=0
	loop
	exitwhen lopA > 5
		set frame=DzFrameGetItemBarButton(lopA)
		call SaveInteger(Mouse__Hash, frame, 0, lopA) //关联序号
		//call DzFrameSetScriptByCode(frame, 1, function Click_Actions, false) // 鼠标点击
		call DzFrameSetScriptByCode(frame, 2, function Mouse__Enter_Actions, false) // 鼠标进入
call DzFrameSetScriptByCode(frame, 3, function Mouse__Leave_Actions, false) // 鼠标离开
//call DzFrameSetScriptByCode(frame, 12, function DoubleClick_Actions, false)//鼠标双击

		set lopA=lopA + 1
	endloop
endfunction
//↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
function Mouse__Init takes nothing returns nothing
	call Mouse__Init_A_Actions() //鼠标进入物品栏
endfunction
// scope Mouse ends
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
	call DzTriggerRegisterMouseEventByCode(yh_trigger, yh_integer1, yh_integer2, yh_boolean1, yh_code)
endfunction
//     native DzTriggerRegisterKeyEvent takes trigger trig, integer key, integer status, boolean sync, string func returns nothing
//注册键盘key事件
function yh_TriggerRegisterKeyEvent takes nothing returns nothing
	call DzTriggerRegisterKeyEvent(yh_trigger, yh_integer1, yh_integer2, yh_boolean1, yh_string1)
endfunction
//     native DzTriggerRegisterKeyEventByCode takes trigger trig, integer key, integer status, boolean sync, code funcHandle returns nothing
// 注册键盘key事件
function yh_TriggerRegisterKeyEventByCode takes nothing returns nothing
	call DzTriggerRegisterKeyEventByCode(yh_trigger, yh_integer1, yh_integer2, yh_boolean1, yh_code)
endfunction
//     native DzTriggerRegisterMouseWheelEvent takes trigger trig, boolean sync, string func returns nothing
//     native DzTriggerRegisterMouseWheelEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
//     native DzTriggerRegisterMouseMoveEvent takes trigger trig, boolean sync, string func returns nothing
//任意玩家移动鼠标
function yh_TriggerRegisterMouseMoveEvent takes nothing returns nothing
	call DzTriggerRegisterMouseMoveEvent(yh_trigger, yh_boolean1, yh_string1)
endfunction
//     native DzTriggerRegisterMouseMoveEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
//任意玩家移动鼠标
function yh_TriggerRegisterMouseMoveEventByCode takes nothing returns nothing
	call DzTriggerRegisterMouseMoveEventByCode(yh_trigger, yh_boolean1, yh_code)
endfunction
//     native DzGetTriggerKey takes nothing returns integer
//事件响应 - 获取触发的按键
function yh_GetTriggerKey takes nothing returns nothing
	set yh_integer1=DzGetTriggerKey()
endfunction
//     native DzGetWheelDelta takes nothing returns integer
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
//     native DzFrameSetScriptByCode takes integer frame, integer eventId, code funcHandle, boolean sync returns nothing
//注册Frame UI事件回调
function yh_FrameSetScriptByCode takes nothing returns nothing
	call DzFrameSetScriptByCode(yh_frame1, yh_integer1, yh_code, yh_boolean1)
endfunction
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
//     native DzFrameGetValue takes integer frame returns real
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
// scope yh ends
//***************************************************************************
//*
//*  Triggers
//*
//***************************************************************************
//===========================================================================
// Trigger: Doodad特效
//
// 攻城兵种
// 全局变量=UnitT
//===========================================================================
//TESH.scrollpos=48
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Unit_Sy
//
// 神医专属
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Itme_Sy
//
// 神医专属
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Ability_Sy
//
// 神医专属
//===========================================================================
//TESH.scrollpos=264
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Buff_Sy
//
// 神医专属
//===========================================================================
//TESH.scrollpos=4
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Unit_Bjy
//
// 神医专属
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Ability_Bjy
//
// 神医专属
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD

//QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ

//WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW

//EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

//RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR

//===========================================================================
// Trigger: Lua_Buff_Bjy
//
// 神医专属
//===========================================================================
//TESH.scrollpos=12
//TESH.alwaysfold=0
//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD

//QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ

//WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW

//EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

//RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR
//===========================================================================
// Trigger: Lua_Unit_Nf
//
// 神医专属
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Ability_Nf
//
// 神医专属
//===========================================================================
//TESH.scrollpos=8
//TESH.alwaysfold=0
//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD

//QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ

//WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW

//EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

//RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR
//===========================================================================
// Trigger: Lua_Buff_Nf
//
// 神医专属
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD

//QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ

//WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW

//EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

//RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR
//===========================================================================
// Trigger: Lua_Unit_Fw
//
// 神医专属
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Ability_Fw
//
// 神医专属
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD

//QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ

//WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW

//EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

//RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR
//===========================================================================
// Trigger: Lua_Buff_Fw
//
// 神医专属
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD

//QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ

//WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW

//EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

//RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR
//===========================================================================
// Trigger: Lua_Unit_Qs
//
// 神医专属
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Ability_Qs
//
// 神医专属
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD

//QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ

//WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW

//EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

//RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR
//===========================================================================
// Trigger: Lua_Unit_Dl
//
// 神医专属
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Ability_Dl
//
// 神医专属
//===========================================================================
//TESH.scrollpos=210
//TESH.alwaysfold=0
//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD

//QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ

//WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW

//EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

//RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR
//===========================================================================
// Trigger: Lua_Buff_Dl
//
// 神医专属
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
//QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ
//WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
//EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

//RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR
//===========================================================================
// Trigger: Lua_Unit_Mj
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//***************************************************************************************************************************
//* 
//******************************************************************
//通用马甲

//===========================================================================
// Trigger: Lua_Unit_Build
//
// 
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0

//===========================================================================
// Trigger: Lua_Ability_Build
//
// 全属性技能设置
// 全局变量=quanshuxing
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0

//===========================================================================
// Trigger: Lua_Unit_Base
//
// 攻城兵种
// 全局变量=UnitT
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Item_Base
//
// 神医专属
//===========================================================================
//TESH.scrollpos=30
//TESH.alwaysfold=0

//===========================================================================
// Trigger: Lua_Unit_Lgf
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0

//===========================================================================
// Trigger: Lua_Ability_Lgf
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0

//===========================================================================
// Trigger: Lua_Item_Dao
//
// 武器
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Unit_Dao
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Item_Jian
//
// 武器
//===========================================================================
//TESH.scrollpos=153
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Unit_Jian
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Item_Gong
//
// 武器
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Unit_Gong
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Item_Shan
//
// 武器
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Unit_Shan
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Item_Qiang
//
// 武器
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Unit_Qiang
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Item_JiGuan
//
// 武器
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Unit_JiGuan
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Item_Fj
//===========================================================================
//TESH.scrollpos=193
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Unit_Fj
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0

//===========================================================================
// Trigger: Lua_Item_Sp_Xl
//===========================================================================
//TESH.scrollpos=91
//TESH.alwaysfold=0

//===========================================================================
// Trigger: Lua_Item_Sp_Yp
//===========================================================================
//TESH.scrollpos=81
//TESH.alwaysfold=0

//===========================================================================
// Trigger: Lua_Item_SP_Sz
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Unit_Sp
//
// jewelry首饰
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0

//===========================================================================
// Trigger: Lua_Item_Shoe
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Unit_Shoe
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0

//===========================================================================
// Trigger: Lua_Unit_Yw
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Unit_Sq
//
// 神医专属
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0

//===========================================================================
// Trigger: Lua_Item_Wq
//
// 神医专属
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Buff_Wq
//
// 神医专属
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD

//QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ
//WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
//===========================================================================
// Trigger: Lua_Ability_Wq
//
// 神医专属
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD

//===========================================================================
// Trigger: Lua_Item_Zz
//
// 材料
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Ability_Zz
//
// 神医专属
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Unit_Zz
//
// 
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Unit_Tz
//
// 
//===========================================================================
//TESH.scrollpos=6
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Item_Tz
//
// 材料
//===========================================================================
//TESH.scrollpos=179
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Unit_Tz0
//
// 武器
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Unit_Tz1
//
// 
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
//===========================================================================
// Trigger: Lua_Unit_Atk
//===========================================================================
//TESH.scrollpos=6
//TESH.alwaysfold=0
// scope AtkUnit begins
	
    
function AtkUnit___xG_ability_lua takes nothing returns nothing
	
endfunction
//===========================================================================
function AtkUnit___Init_Actions takes nothing returns nothing
    
endfunction
    
function AtkUnit___Init takes nothing returns nothing
    call AtkUnit___Init_Actions()
endfunction
// scope AtkUnit ends
function InitCustomTriggers takes nothing returns nothing
    //Function not found: call InitTrig_Doodad______u()
    //Function not found: call InitTrig_Lua_Unit_Sy()
    //Function not found: call InitTrig_Lua_Itme_Sy()
    //Function not found: call InitTrig_Lua_Ability_Sy()
    //Function not found: call InitTrig_Lua_Buff_Sy()
    //Function not found: call InitTrig_Lua_Unit_Bjy()
    //Function not found: call InitTrig_Lua_Ability_Bjy()
    //Function not found: call InitTrig_Lua_Buff_Bjy()
    //Function not found: call InitTrig_Lua_Unit_Nf()
    //Function not found: call InitTrig_Lua_Ability_Nf()
    //Function not found: call InitTrig_Lua_Buff_Nf()
    //Function not found: call InitTrig_Lua_Unit_Fw()
    //Function not found: call InitTrig_Lua_Ability_Fw()
    //Function not found: call InitTrig_Lua_Buff_Fw()
    //Function not found: call InitTrig_Lua_Unit_Qs()
    //Function not found: call InitTrig_Lua_Ability_Qs()
    //Function not found: call InitTrig_Lua_Unit_Dl()
    //Function not found: call InitTrig_Lua_Ability_Dl()
    //Function not found: call InitTrig_Lua_Buff_Dl()
    //Function not found: call InitTrig_Lua_Unit_Mj()
    //Function not found: call InitTrig_Lua_Unit_Build()
    //Function not found: call InitTrig_Lua_Ability_Build()
    //Function not found: call InitTrig_Lua_Unit_Base()
    //Function not found: call InitTrig_Lua_Item_Base()
    //Function not found: call InitTrig_Lua_Unit_Lgf()
    //Function not found: call InitTrig_Lua_Ability_Lgf()
    //Function not found: call InitTrig_Lua_Item_Dao()
    //Function not found: call InitTrig_Lua_Unit_Dao()
    //Function not found: call InitTrig_Lua_Item_Jian()
    //Function not found: call InitTrig_Lua_Unit_Jian()
    //Function not found: call InitTrig_Lua_Item_Gong()
    //Function not found: call InitTrig_Lua_Unit_Gong()
    //Function not found: call InitTrig_Lua_Item_Shan()
    //Function not found: call InitTrig_Lua_Unit_Shan()
    //Function not found: call InitTrig_Lua_Item_Qiang()
    //Function not found: call InitTrig_Lua_Unit_Qiang()
    //Function not found: call InitTrig_Lua_Item_JiGuan()
    //Function not found: call InitTrig_Lua_Unit_JiGuan()
    //Function not found: call InitTrig_Lua_Item_Fj()
    //Function not found: call InitTrig_Lua_Unit_Fj()
    //Function not found: call InitTrig_Lua_Item_Sp_Xl()
    //Function not found: call InitTrig_Lua_Item_Sp_Yp()
    //Function not found: call InitTrig_Lua_Item_SP_Sz()
    //Function not found: call InitTrig_Lua_Unit_Sp()
    //Function not found: call InitTrig_Lua_Item_Shoe()
    //Function not found: call InitTrig_Lua_Unit_Shoe()
    //Function not found: call InitTrig_Lua_Unit_Yw()
    //Function not found: call InitTrig_Lua_Unit_Sq()
    //Function not found: call InitTrig_Lua_Item_Wq()
    //Function not found: call InitTrig_Lua_Buff_Wq()
    //Function not found: call InitTrig_Lua_Ability_Wq()
    //Function not found: call InitTrig_Lua_Item_Zz()
    //Function not found: call InitTrig_Lua_Ability_Zz()
    //Function not found: call InitTrig_Lua_Unit_Zz()
    //Function not found: call InitTrig_Lua_Unit_Tz()
    //Function not found: call InitTrig_Lua_Item_Tz()
    //Function not found: call InitTrig_Lua_Unit_Tz0()
    //Function not found: call InitTrig_Lua_Unit_Tz1()
    //Function not found: call InitTrig_Lua_Unit_Atk()
endfunction
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
    call SetStartLocPrioCount(0, 1)
    call SetStartLocPrio(0, 0, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(1, 1)
    call SetStartLocPrio(1, 0, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(2, 1)
    call SetStartLocPrio(2, 0, 1, MAP_LOC_PRIO_HIGH)
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
    call SetCameraBounds(- 10496.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 11776.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 8448.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 1024.0 - GetCameraMargin(CAMERA_MARGIN_TOP), - 10496.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 1024.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 8448.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 11776.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    call SetDayNightModels("Environment\\DNC\\DNCAshenvale\\DNCAshenvaleTerrain\\DNCAshenvaleTerrain.mdl", "Environment\\DNC\\DNCAshenvale\\DNCAshenvaleUnit\\DNCAshenvaleUnit.mdl")
    call NewSoundEnvironment("Default")
    call SetAmbientDaySound("AshenvaleDay")
    call SetAmbientNightSound("AshenvaleNight")
    call SetMapMusic("Music", true, 0)
    call InitSounds()
    call CreateRegions()
    call CreateAllItems()
    call CreateAllUnits()
    call InitBlizzard()

call Cheat("exec-lua:lua.base") // INLINED!!
call Attack__Init()
call Armor__Init()
call StrAgiInt__Init()
call Mouse__Init_A_Actions() // INLINED!!
call AtkUnit___Init_Actions() // INLINED!!

    call InitGlobals()
    call InitCustomTriggers()
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
    call DefineStartLocation(0, 384.0, - 7360.0)
    call DefineStartLocation(1, 4416.0, - 8832.0)
    call DefineStartLocation(2, 6144.0, - 9472.0)
    call DefineStartLocation(3, 64.0, - 9408.0)
    call DefineStartLocation(4, - 6592.0, - 2496.0)
    call DefineStartLocation(5, - 1152.0, - 3392.0)
    // Player setup
    call InitCustomPlayerSlots()
    call InitCustomTeams()
    call InitAllyPriorities()
endfunction




//Struct method generated initializers/callers:

