-- 北望
function Weapon_1_Actions()
    local trgU, trgP = GetTriggerUnit(), GetTriggerPlayer()
    local source = GetEventDamageSource()
    local harm
    if GetRandomReal(1, 100) <= 30 then
        gP.disTimedText(trgP, 10, "北望角度：" + R2S(gYh.angleByUnit(trgU, source)))
        if gYh.angleByUnit(trgU, source) <= -45 and gYh.angleByUnit(trgU, source) >= -135 then
            harm = gU.getState(source, UNIT_STATE.BASIC_DAMAGE) * 2 -- 最大攻击值
        else
            harm = gU.getState(source, UNIT_STATE.BASIC_DAMAGE) * 1
        end
        gDam.target(source, trgU, harm)
        gTag.newUnit("|cffffffff" .. "北望" .. harm, 0.020, source, 0.70, 64, 90)
    end
end
-- 赤眼神龙枪:龙威挑战
function Weapon_2A_Actions()
    local trgU, trgP = GetTriggerUnit(), GetTriggerPlayer()
    local source = GetEventDamageSource()
    local harm = GetEventDamage()
    if gAbi.isHave(trgU, 'BS02') then -- 处于挑战状态
        gDam.setDamage(GetEventDamage() * 1.3) -- 实际生效，只是漂浮文字还是之前的
        gP.disTimedText(trgP, 10, "龙威挑战额外伤害：" .. R2S(GetEventDamage() / harm - 1))
    end
end

function Weapon_2B_Actions()
    local trgU, trgP = GetTriggerUnit(), GetTriggerPlayer()
    local source = GetEventDamageSource()
    local harm = GetEventDamage()
    local degree = gU.getFacing(source) - gU.getFacing(trgU)
    if gAbi.isHave(source, 'BS02') then -- 处于挑战状态
        gDam.setDamage(GetEventDamage() * 0.7) -- 实际生效，只是漂浮文字还是之前的
        gP.disTimedText(trgP, 10, "龙威挑战降低伤害：" + R2S(GetEventDamage() / harm - 1))
        gP.disTimedText(trgP, 10, R2S(degree))

        if degree >= -45 and degree <= 45 then
            local text = "神龙：" .. GetUnitName(trgU)
            gP.disTimedText(trgP, 10, text ..
                "背向了敌人，成为了懦夫，神龙的傲骨不允许退缩，他将被处死！！！")
            gU.kill(trgU)
        end
    end
end
-- 龙舌断魂弓
function Weapon_5_Actions()
    local trgU, trgP = GetTriggerUnit(), GetTriggerPlayer()
    local source = GetEventDamageSource()
    local n = LoadInteger(Wq_Hash, GetHandleId(trgU), 5)
    gP.disTimedText(trgP, 10, "断魂叠加次数：" + I2S(n))
    if GetRandomReal(1, 100) <= 36 - n * 5 then
        SaveInteger(Wq_Hash, GetHandleId(trgU), 5, n + 1)
    end
    if n >= 7 then
        local harm = gU.getState(trgU, UNIT_STATE.MAX_LIFE) * 0.1
        gDam.target(source, trgU, harm)
        SaveInteger(Wq_Hash, GetHandleId(trgU), 5, 0)
    end
end
-- 蛟龙玄铁弓
function Weapon_6_Actions()
    local trgU, trgP = GetTriggerUnit(), GetTriggerPlayer()
    local source = GetEventDamageSource()
    if GetRandomReal(1, 100) <= 30 then
        gDam.target(source, trgU, GetEventDamage())
        local harm = LoadInteger(Wq_Hash, GetHandleId(trgU), 6)
        gTag.newUnit("|cffffffff" .. "怒蛟连射：" .. harm, 0.021, trgU, 1.30, 100, 90)
    end
    -- 记录伤害类型
    for i = 0, 26 do
        if IsEventDamageType(ConvertDamageType(i)) then
            gP.disTimedText(trgP, 10, "伤害类型：" + I2S(i))
            SaveInteger(Wq_Hash, GetHandleId(trgU), 66, i) -- 存储伤害类型
        end
    end
    SaveInteger(Wq_Hash, GetHandleId(trgU), 6, R2I(GetEventDamage()))
end
-- 绝世好剑
function Weapon_8_Actions()
    local trgU, trgP = GetTriggerUnit(), GetTriggerPlayer()
    local source = GetEventDamageSource()
    local atkdr = gU.getState(trgU, UNIT_STATE.BASIC_DAMAGE) * 0.25
    gP.disTimedText(Player(0), 10, "吸取攻击力：" + I2S(atkdr))
    if Wq_Sq_Jian == 1 then
        atkdr = atkdr * 2
    end

    if LoadInteger(Wq_Hash, GetHandleId(trgU), 8) <= 0 then
        gUnitdata.adjustAtk(source, atkdr) -- 英雄增加
        gUnitdata.adjustAtk(trgU, -atkdr) -- 敌人减少

        gT.loop(1, function()
            if LoadInteger(Wq_Hash, GetHandleId(dr), 8) <= 0 then
                gUnitdata.adjustAtk(source, -atkdr) --
                gUnitdata.adjustAtk(trgU, atkdr) --

                gT.remove()
            end

            SaveInteger(Wq_Hash, GetHandleId(dr), 8, LoadInteger(Wq_Hash, GetHandleId(dr), 8) - 1)

        end)
    end

    SaveInteger(Wq_Hash, GetHandleId(trgU), 8, 1) -- 保持战斗状态
end
-- 雪饮狂刀
function Weapon_9_Actions()
    local trgU, trgP = GetTriggerUnit(), GetTriggerPlayer()
    local source = GetEventDamageSource()
    local life = gU.getState(trgU, UNIT_STATE.LIFE) * 0.1
    local speed = LoadReal(Wq_Hash, GetHandleId(source), 9)
    local harm = LoadReal(Wq_Hash, GetHandleId(source), 99)
    if gU.isType(trgU, UNIT_TYPE_HERO) then
        life = life * 0.5
    end
    gU.adjustState(source, UNIT_STATE.LIFE, life)
    gTag.newUnit("|cffffffff" .. "血饮狂刀+" .. life, 0.021, source, 1.30, 100, 100)
    gDam.target(source, trgU, life)

    SaveReal(Wq_Hash, GetHandleId(source), 9, speed + 0.05) -- 攻速
    SaveReal(Wq_Hash, GetHandleId(source), 99, harm + 0.05) -- 承伤
    gU.adjustState(source, UNIT_STATE.ATK_SPEED, 0.05)
    gP.disTimedText(Player(0), 10, "额外攻速：" + R2S(speed))
end
-- 大邪王
function Weapon_10_Actions()
    local trgU, trgP = GetTriggerUnit(), GetTriggerPlayer()
    local source = GetEventDamageSource()
    local n = LoadInteger(Wq_Hash, GetHandleId(trgU), 10)
    local all = gH.getThree(source)

    SaveInteger(Wq_Hash, GetHandleId(trgU), 10, n + 1) -- 攻击次数
    gP.disTimedText(Player(0), 10, "攻击次数：" + I2S(n))
    gP.disTimedText(Player(0), 10, "全属性：" + I2S(all))

    if LoadInteger(Wq_Hash, GetHandleId(trgU), 10) >= 10 then
        for i = 1, 10 do
            gDam.target(source, trgU, all * 0.2)
            gDam.target(trgU, source, all * 0.05)
        end
        SaveInteger(Wq_Hash, GetHandleId(trgU), 10, 0) -- 清空次数
    end
end
-- 天命
function Weapon_11_Actions()
    local trgU, trgP = GetTriggerUnit(), GetTriggerPlayer()
    local source = GetEventDamageSource()
    local all = gH.getThree(source)
    local dwz = LoadGroupHandle(Wq_Hash, GetHandleId(source), 11)
    if GetRandomReal(1, 100) <= 30 then
        local mj = gU.create(gU.getOwner(source), 'su11', gU.getX(source), gU.getY(source))
        gU.setVertexColor(mj, 138, 43, 226, 255)
        GroupAddUnit(dwz, mj)
    end
    gP.disTimedText(Player(0), 10, "天命")
    if CountUnitsInGroup(dwz) >= 9 then
        while CountUnitsInGroup(dwz) == 0 do
            local mj = FirstOfGroup(dwz)
            gAbi.setDataReal(mj, 'SQ11', nil, ABILITY_DATA.DATA_A, all * 5)
            gU.issueOrder(mj, "creepthunderclap")
            gU.issueOrderXY(mj, "detonate", gU.getXY(mj))
            GroupRemoveUnit(dwz, mj)
        end

    end
end
-- 赤金磐龙甲
function Weapon_14_Actions()
    if GetEventDamage() <= 3000 then
        gDam.setDamage(GetEventDamage() * 0.5)
        gP.disTimedText(Player(0), 10, "盘龙减伤：" + R2S(GetEventDamage()))
    else
        gDam.setDamage(GetEventDamage() - 3000)
        gP.disTimedText(Player(0), 10, "盘龙减伤：3000")
    end
end
-- 天玄真神甲
function Weapon_15_Actions()
    local harm = GetEventDamage()
    gDam.setDamage(GetEventDamage() * 0.7)
    gP.disTimedText(Player(0), 10, "天玄减伤：" + R2S(GetEventDamage() / harm - 1))
end
-- 凶陌圣靴
function Weapon_20_Actions()
    local harm = GetEventDamage()
    if LoadInteger(Wq_Hash, GetHandleId(trgU), 20) == 1 then
        gDam.setDamage(GetEventDamage() * 1.4)
    end
    gP.disTimedText(Player(0), 10, "大凶增伤：" + R2S(GetEventDamage() / harm - 1))
end
