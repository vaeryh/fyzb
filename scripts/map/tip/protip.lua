-- ***************************************************************************************************************************
-- * 英雄属性属性系统
-- ******************************************************************
-- #####################################################################################
-- 免疫
-- ! textmacro ProHeroMianYi takes name
function ProHeroMianYi(name)
    -- body
end
if LoadReal(Equip_Hash, GetHandleId(whichUnit), StringHash("$name$")) == 1 then
    DzFrameSetText(DzFrameFindByName("ProTextN2", 0), "|cffac0f04$name$")
end
-- ! endtextmacro
-- #####################################################################################
-- 免疫描述
function MianYi(whichUnit)
    DzFrameSetText(DzFrameFindByName("ProTextN1", 0), "免疫类别：")
    DzFrameSetText(DzFrameFindByName("ProTextN2", 0), "")

    -- ! runtextmacro ProHeroMianYi("免疫中毒")
    -- ! runtextmacro ProHeroMianYi("免疫减攻速")
    -- ! runtextmacro ProHeroMianYi("免疫减移速")
    -- ! runtextmacro ProHeroMianYi("免疫破甲")
    -- ! runtextmacro ProHeroMianYi("免疫沉默")
    -- ! runtextmacro ProHeroMianYi("免疫眩晕")
    -- ! runtextmacro ProHeroMianYi("免疫闪避（诅咒）")
    -- ! runtextmacro ProHeroMianYi("免疫减攻击")
end
-- #####################################################################################
-- 光环
-- ! textmacro ProHeroRing takes name
if LoadReal(Equip_Hash, GetHandleId(whichUnit), StringHash("$name$")) ~= 0 then
    DzFrameSetText(DzFrameFindByName("ProTextO" + I2S(index), 0), "|cfff700ff$name$")
    index = index + 1
end
-- ! endtextmacro
-- #####################################################################################
-- 光环描述
function Ring(whichUnit)
    local index = 2
    DzFrameSetText(DzFrameFindByName("ProTextO1", 0), "拥有光环：")
    DzFrameSetText(DzFrameFindByName("ProTextO2", 0), "")
    DzFrameSetText(DzFrameFindByName("ProTextO3", 0), "")
    DzFrameSetText(DzFrameFindByName("ProTextO4", 0), "")
    -- ! runtextmacro ProHeroRing("辉煌光环")
    -- ! runtextmacro ProHeroRing("恢复光环")
    -- ! runtextmacro ProHeroRing("专注光环")
    -- ! runtextmacro ProHeroRing("耐久光环")
    -- ! runtextmacro ProHeroRing("吸血光环")
    -- ! runtextmacro ProHeroRing("邪恶光环")
    -- ! runtextmacro ProHeroRing("荆棘光环")
    -- ! runtextmacro ProHeroRing("强击光环")
    -- ! runtextmacro ProHeroRing("命令光环")
    -- ! runtextmacro ProHeroRing("减速光环")
end
-- #####################################################################################
-- +10
-- ! textmacro ProHeroInt takes name,frameName1,frameName2
DzFrameSetText(DzFrameFindByName("$frameName1$", 0), "$name$：")

numR = LoadReal(Equip_Hash, GetHandleId(whichUnit), StringHash("$name$"))
DzFrameSetText(DzFrameFindByName("$frameName2$", 0), "|cff48ff00+" + I2S(R2I(numR)))
-- ! endtextmacro
-- 2.3%
-- ! textmacro ProHeroPerReal takes name,frameName1,frameName2
DzFrameSetText(DzFrameFindByName("$frameName1$", 0), "$name$：")

numR = LoadReal(Equip_Hash, GetHandleId(whichUnit), StringHash("$name$"))
DzFrameSetText(DzFrameFindByName("$frameName2$", 0), "|cff48ff00+" + R2SW(numR, 1, 1) + "%")
-- ! endtextmacro
-- 10%
-- ! textmacro ProHeroPer takes name,frameName1,frameName2
DzFrameSetText(DzFrameFindByName("$frameName1$", 0), "$name$：")

numR = LoadReal(Equip_Hash, GetHandleId(whichUnit), StringHash("$name$"))
DzFrameSetText(DzFrameFindByName("$frameName2$", 0), "|cff48ff00+" + I2S(R2I(numR)) + "%")
-- ! endtextmacro
-- #####################################################################################
-- 属性
function BasePro(whichUnit)
    local numR
    -- 名称--等级--战斗力
    DzFrameSetText(DzFrameFindByName("ProTextA1", 0), GetUnitName(whichUnit))
    DzFrameSetText(DzFrameFindByName("ProTextA2", 0), I2S(GetUnitLevel(whichUnit)) + "级")
    DzFrameSetText(DzFrameFindByName("ProTextA3", 0),
        "|cffff1100战斗力+" + I2S(GetRandomInt(100, GetUnitLevel(whichUnit) * 100)))
    -- 内功	数值	风相性	数值
    -- ! runtextmacro ProHeroInt("内功","ProTextB1","ProTextB2")
    -- ! runtextmacro ProHeroInt("风相性","ProTextB3","ProTextB4")
    -- 	出招间隔	数值	云相性	数值
    -- ! runtextmacro ProHeroInt("出招间隔","ProTextC1","ProTextC2")
    -- ! runtextmacro ProHeroInt("云相性","ProTextC3","ProTextC4")
    -- 出招速度	数值	火相性	数值
    -- ! runtextmacro ProHeroPer("出招速度","ProTextD1","ProTextD2")
    -- ! runtextmacro ProHeroInt("火相性","ProTextD3","ProTextD4")
    -- 移动速度	数值	地相性	数值
    -- ! runtextmacro ProHeroInt("移动速度","ProTextE1","ProTextE2")
    -- ! runtextmacro ProHeroInt("地相性","ProTextE3","ProTextE4")
    -- 气血恢复速度	数值	雷相性	数值
    -- ! runtextmacro ProHeroInt("气血恢复","ProTextF1","ProTextF2")
    -- ! runtextmacro ProHeroInt("雷相性","ProTextF3","ProTextF4")
    -- 内力恢复速度	数值	破甲数	数值
    -- ! runtextmacro ProHeroInt("内力恢复","ProTextG1","ProTextG2")
    -- ! runtextmacro ProHeroInt("破甲数","ProTextG3","ProTextG4")
    -- 吸血率	百分比	多重数	数值
    -- ! runtextmacro ProHeroPerReal("吸血率","ProTextH1","ProTextH2")
    -- ! runtextmacro ProHeroInt("多重数","ProTextH3","ProTextH4")
    -- 眩晕率	百分比	分裂比例	百分比
    -- ! runtextmacro ProHeroPerReal("眩晕率","ProTextI1","ProTextI2")
    -- ! runtextmacro ProHeroPer("分裂比例","ProTextI3","ProTextI4")
    -- 减速率	百分比	增伤率
    -- ! runtextmacro ProHeroPerReal("减速率","ProTextJ1","ProTextJ2")
    -- ! runtextmacro ProHeroPerReal("增伤率","ProTextJ3","ProTextJ4")
    -- 沉默率	百分比	减伤率
    -- ! runtextmacro ProHeroPerReal("沉默率","ProTextK1","ProTextK2")
    -- ! runtextmacro ProHeroPerReal("减伤率","ProTextK3","ProTextK4")
    -- 会心率	百分比	固定减伤
    -- ! runtextmacro ProHeroPerReal("会心率","ProTextL1","ProTextL2")
    -- ! runtextmacro ProHeroInt("固定减伤","ProTextL3","ProTextL4")
    -- 会心加成	百分比
    -- ! runtextmacro ProHeroPer("会心加成","ProTextM1","ProTextM2")
    -- 免疫负面效果	列举

    -- 拥有光环	列举
    Ring(whichUnit)
end

--
function Cut_HeroPro()
    local string
    str = DzFrameGetName(DzGetTriggerUIEventFrame())
    local integer
    pid = S2I(SubString(str, StringLength(str) - 1, StringLength(str)))
    Debug("玩家：" + I2S(pid))
    if GetLocalPlayer() == GetLocalPlayer() then
        playerId = pid
    end
end
--
gTrg.RegTimerEvent(0.00, false, function()
    local frame
    -- 玩家N
    for i = 0, 3 do
        frame = DzFrameFindByName("ProTextButtonPlayer" + I2S(lopA), 0)
        if GetPlayerController(Player(lopA)) == MAP_CONTROL_USER and GetPlayerSlotState(Player(lopA)) ==
            PLAYER_SLOT_STATE_PLAYING then
            DzFrameSetScriptByCode(frame, 1, Cut_HeroPro, false)
        else
            DzFrameShow(frame, false)
        end
    end
end)

-- 关闭按钮
function OnOff_Keyboard_Actions()
    if GetLocalPlayer() == GetLocalPlayer() then
        if DzFrameGetEnable(DzFrameFindByName("ProButtonX", 0)) == false then
            DzFrameSetEnable(DzFrameFindByName("ProButtonX", 0), true)
            DzFrameShow(DzFrameFindByName("ProTipsBackdrop", 0), true)
            playerId = pid
            TimerStart(CreateTimer(), 0.3, true, function()
                BasePro(Hero[playerId])
                if DzFrameGetEnable(DzFrameFindByName("ProButtonX", 0)) == false then
                    DestroyTimer(GetExpiredTimer())
                end
            end)
        else
            DzFrameSetEnable(DzFrameFindByName("ProButtonX", 0), false)
            DzFrameShow(DzFrameFindByName("ProTipsBackdrop", 0), false)
        end
    end
end
--
gTrg.RegTimerEvent(0.00, false, function()
    DzCreateFrame("ProFrame", DzGetGameUI(), 0) -- 创建框架
    DzFrameShow(DzFrameFindByName("ProTipsBackdrop", 0), false)
    DzFrameSetAbsolutePoint(DzFrameFindByName("ProTipsBackdrop", 0), 0, 0.1, 0.55)
    DzFrameSetEnable(DzFrameFindByName("ProButtonX", 0), false)
    -- X按钮；关闭
    DzFrameSetScriptByCode(DzFrameFindByName("ProButtonX", 0), 1, OnOff_Keyboard_Actions, false)
    TriggerAddAction(Trig_KeyBoard_F5, OnOff_Keyboard_Actions)
end)
