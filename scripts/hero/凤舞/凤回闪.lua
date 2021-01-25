local mt = {}

-- 技能位置
mt.Buttonpos = "Q"

-- 技能等级
mt.abiLevel = 5

-- 技能介绍
mt.tip =
    "凤舞每7次攻击便会触发凤回闪，发射一只凤凰对面前(700*150)距离造成敏捷*0.4/0.8/0.12/1.6/2的伤害"

-- 动作
function mt.Actions(hero,foe)
    local locmj
    local lev = GetUnitAbilityLevel(Fw_Hero, 'FwR0')

    SetUnitUserData(Fw_Hero, GetUnitUserData(Fw_Hero) + 1) -- 设置单位自定义值+1

    CreateTextTagUnit(I2S(GetUnitUserData(Fw_Hero)), 0.024, Fw_Hero, 0, 0.5, 255, 100, 200, 255)

    if GetUnitUserData(Fw_Hero) >= 7 - lev then
        SetUnitUserData(Fw_Hero, 0) -- 设置单位自定义值为0

        CreateTextTagUnit("凤回闪", 0.020, Fw_Hero, 0, 0.60, 120, 120, 200, 255)
        SetTextTagVelocityBJ(bj_lastCreatedTextTag, 70, 45)

        locmj = PolarProjectionBJ(GetUnitLoc(Fw_Hero), -100, AngleBetweenPoints(GetUnitLoc(Fw_Hero), GetUnitLoc(trgu)))
        bj_lastCreatedUnit = CreateUnitAtLoc(GetOwningPlayer(Fw_Hero), 'yhmj', locmj,
                                 AngleBetweenPoints(GetUnitLoc(Fw_Hero), GetUnitLoc(trgu)))
        RemoveLocation(locmj)

        lev = GetUnitAbilityLevel(Fw_Hero, 'FwQ0') -- lev与上面一个lev不一样，重新赋值了
        SetUnitScale(bj_lastCreatedUnit, 1 + 0.1 * lev, 1 + 0.1 * lev, 1 + 0.1 * lev)
        UnitAddAbility(bj_lastCreatedUnit, 'FwQ1') -- 添加马甲技能
        YDWESetUnitAbilityDataReal(bj_lastCreatedUnit, 'FwQ1', 1, 108, GetHeroAgi(Fw_Hero, true) * lev) -- A伤害值
        YDWESetUnitAbilityDataReal(bj_lastCreatedUnit, 'FwQ1', 1, 110, GetUnitState(Fw_Hero, ConvertUnitState(0x16))) -- C距离
        YDWESetUnitAbilityDataReal(bj_lastCreatedUnit, 'FwQ1', 1, 111, 50 * lev + 150) -- D最终范围
        IssuePointOrderLoc(bj_lastCreatedUnit, "shockwave", GetUnitLoc(Fw_Hero))
    end

end

return mt
