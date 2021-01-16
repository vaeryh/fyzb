//***************************************************************************************************************************
//* 计时器直接调用 ShowDataByTime 就可以了，如果传入的时间戳为0，就默认启用网易获取时间戳接口
//  比如你在网易平台直接调用 call ShowDataByTime(0)
//  udg_Year     年
//  udg_Mon      月
//  udg_Day      日
//  udg_Hour     时
//  udg_Min      分
//  udg_Sec      秒
//  udg_Week     周几    0表示星期天
//******************************************************************
scope Time initializer Init

globals
	integer udg_Year     //年
	integer udg_Mon      //月
	integer udg_Day      //日
	integer udg_Hour     //时
	integer udg_Min      //分
	integer udg_Sec      //秒
	integer udg_Week     //周几  0表示星期天
	
	integer NS = 31536000
	integer LS = 31622400	
	
	integer BJTIME = 28800
	integer BASE2015_SEC = 1451606400
	integer BASE2015_WEEKDAY = 4
	
	integer array NORMALMON
	
	boolean udg_bIsInit = false
	
	integer udg_ServerTime = 0
	
	string array WEEKSTR
	
	private integer yh_frame
endglobals
//↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ 
function InitArray takes nothing returns nothing
	set NORMALMON[1] = 31
	set NORMALMON[2] = 28
	set NORMALMON[3] = 31
	set NORMALMON[4] = 30
	set NORMALMON[5] = 31
	set NORMALMON[6] = 30
	set NORMALMON[7] = 31
	set NORMALMON[8] = 31
	set NORMALMON[9] = 30
	set NORMALMON[10] = 31
	set NORMALMON[11] = 30
	set NORMALMON[12] = 31
	
	set WEEKSTR[0] = "日"
	set WEEKSTR[1] = "一"
	set WEEKSTR[2] = "二"
	set WEEKSTR[3] = "三"
	set WEEKSTR[4] = "四"
	set WEEKSTR[5] = "五"
	set WEEKSTR[6] = "六"
endfunction
//模
function MathMod takes integer dividend, integer divisor returns integer
	local integer modulus = dividend - (dividend / divisor) * divisor
	if(modulus < 0) then
		set modulus = modulus + divisor
	endif
	
	return modulus
endfunction

function MathFloor takes real a returns integer
	return R2I(a)
endfunction
//判断是否是闰年
function IsLeapYear takes integer y returns boolean
	if MathMod(y, 4) == 0 then
		if MathMod(y, 100) == 0 then
			if MathMod(y, 400) == 0 then
				return true
			else
				return false
			endif
		endif
		return true
	endif
	return false
endfunction

function Time_UpdateDate takes integer y, integer remainSec, integer dayBy2015 returns nothing
	local boolean bIsLeap = IsLeapYear(y)
	local real dayNum = I2R(remainSec) / (24 * 60 * 60)
	local integer totalDay = MathFloor(dayNum)
	local integer totalDayBase = 0
	local integer totalMonDay = 0
	local integer curMonDay = 0
	local integer m = 1
	
	if(dayNum - I2R(totalDay)) > 0 then
		set totalDay = totalDay + 1
	endif
	if totalDay == 0 then
		set totalDay = 1
	endif
	
	set dayBy2015 = dayBy2015 + totalDay
	
	loop
	exitwhen m > 12
		if bIsLeap and m == 2 then 
			set curMonDay = NORMALMON[m] + 1
		else
			set curMonDay = NORMALMON[m]
		endif
		if totalDay <= curMonDay then
			set udg_Year = y
			set udg_Mon = m
			set udg_Day = totalDay
			set udg_Hour = MathMod(MathFloor(remainSec /(60 * 60) ), 24)
			set udg_Min = MathMod(MathFloor(remainSec / 60) , 60)
			set udg_Sec = MathMod(remainSec , 60)
			set m = 100
		endif
		
		set m = m + 1
		set totalDay = totalDay - curMonDay
	endloop
	
	set udg_Week = MathMod(MathMod(dayBy2015, 7) + BASE2015_WEEKDAY, 7)
	
endfunction

function GetDate takes integer now returns nothing
	local integer remain = now - BASE2015_SEC + BJTIME// 默认东八区
	local integer y = 2016
	local integer baseRemain = 0
	local integer dayBy2015 = 0
	local integer baseDayBy2015 = 0
	
	loop
	exitwhen y > 3000
		set baseRemain = remain
		set baseDayBy2015 = dayBy2015
		if IsLeapYear(y) then
			set remain = remain - LS
			set dayBy2015 = dayBy2015 + 366
		else
			set remain = remain - NS
			set dayBy2015 = dayBy2015 + 365
		endif
		if remain < 0 then
			call Time_UpdateDate(y, baseRemain, baseDayBy2015)
			set y = 10000
		endif
		set y = y + 1
	endloop
endfunction


function ShowDataByTime takes integer time returns nothing
	if not udg_bIsInit then
		call InitArray()
		set udg_bIsInit = true
	endif
	if time == 0 then
		set time = DzAPI_Map_GetGameStartTime()
	endif
	call GetDate(time)
	call BJDebugMsg("现在时间为" + I2S(udg_Year) + "年" + I2S(udg_Mon)+ "月" + I2S(udg_Day)+ "日" + I2S(udg_Hour)+ "时" + I2S(udg_Min)+ "分" + I2S(udg_Sec)+ "秒  " + "星期" + WEEKSTR[udg_Week]  )
endfunction
//
function UpdateTimeAll_Timer takes nothing returns nothing
	local string array word
	set udg_ServerTime = udg_ServerTime + 1
	call GetDate(udg_ServerTime)
	
	set word[0] = ((I2S(udg_Year) + ("年" + (I2S(udg_Mon) + ("月" + (I2S(udg_Day) + "日") ) ) ) ) )
	set word[1] = ((I2S(udg_Hour) + ("时" + (I2S(udg_Min) + ("分" + (I2S(udg_Sec) + "秒") ) ) ) ) )
	set word[2] = ("星期" + WEEKSTR[udg_Week] )
	call DzFrameSetText(yh_frame, "|cfffcf700" + word[0]+ word[1]+ word[2]+ "|r")
endfunction

function UpdateTimeAll takes nothing returns nothing	
	//创建frame
	set yh_frame = DzCreateFrameByTagName("TEXT", "name", DzGetGameUI(), "template", 0)
	call DzFrameSetSize(yh_frame, 0.15, 0.01)
	call DzFrameSetAbsolutePoint(yh_frame, 0, 0.0487, 0.5733)
	//获取时间
	if DzAPI_Map_GetGameStartTime() == 0 then
		//set udg_ServerTime = 1608036812
		set udg_ServerTime = <?= os.time() ?>
	else
		set udg_ServerTime = DzAPI_Map_GetGameStartTime()
	endif
	
	call GetDate(udg_ServerTime)
	call TimerStart(CreateTimer(), 1, true, function UpdateTimeAll_Timer)
endfunction

private function Init takes nothing returns nothing
	call InitArray()//初始化数据
	call UpdateTimeAll()
endfunction

endscope
