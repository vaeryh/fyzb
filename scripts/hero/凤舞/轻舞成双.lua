local mt = {}
-- 技能位置
mt.Buttonpos = "E"

-- 技能等级
mt.abiLevel = 5

-- 技能介绍
mt.tip = "凤舞的攻击有5%/10%/15%/20%/25%的几率追加一次攻击"

-- E
function mt.Actions()
    local r = GetUnitAbilityLevel(Fw_Hero, 'FwE0') * 5.00 + GetUnitAbilityLevel(Fw_Hero, 'FwR0') * 10
    local r1 = GetUnitState(Fw_Hero, ConvertUnitState(0x25)) --
    local r2 = GetUnitState(Fw_Hero, ConvertUnitState(0x16)) --
    local r3 = GetUnitState(Fw_Hero, ConvertUnitState(0x51)) --
    local r4 = GetUnitState(Fw_Hero, ConvertUnitState(0x12)) + GetUnitState(Fw_Hero, ConvertUnitState(0x10)) *
                   GetUnitState(Fw_Hero, ConvertUnitState(0x11))

    if GetRandomReal(1, 100) <= r then
        Abi_D_Actions(GetTriggerUnit()) -- E有益于D
        SetUnitUserData(Fw_Hero, GetUnitUserData(Fw_Hero) + 1) -- E有益于Q

        CreateTextTagUnit("轻舞成双", 0.020, Fw_Hero, 0, 0.50, 100, 200, 200, 255)
        SetTextTagVelocityBJ(bj_lastCreatedTextTag, 70, 315)

        bj_lastCreatedUnit = CreateUnit(GetOwningPlayer(Fw_Hero), 'Fw01', GetUnitX(Fw_Hero), GetUnitY(Fw_Hero),
                                 GetUnitFacing(Fw_Hero))
        UnitApplyTimedLife(bj_lastCreatedUnit, 'Bhwd', 0.50)
        ShowUnit(bj_lastCreatedUnit, false)
        SetUnitState(bj_lastCreatedUnit, ConvertUnitState(0x25), r1)
        SetUnitState(bj_lastCreatedUnit, ConvertUnitState(0x16), r2)
        SetUnitState(bj_lastCreatedUnit, ConvertUnitState(0x51), r3)
        SetUnitState(bj_lastCreatedUnit, ConvertUnitState(0x12), r4)
        IssueTargetOrder(bj_lastCreatedUnit, "attackonce", GetTriggerUnit())
    end

end

return mt
