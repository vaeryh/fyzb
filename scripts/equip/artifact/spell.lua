-- 龙威挑战
function Abi_2_Actions()
    local trgU, target = GetSpellAbilityUnit(), GetSpellTargetUnit()
    local text = GetUnitName(trgU) .. " 向 " .. GetUnitName(GetSpellTargetUnit())
    gP.disTimedText(GetLocalPlayer(), 10, text .. ":发起了龙威挑战，祝他挑战成功！")
    SaveInteger(Wq_Hash, GetHandleId(GetSpellTargetUnit()), 2, 1) -- 挑战标记

    gT.wait(10, function()
        SaveInteger(Wq_Hash, GetHandleId(target), 2, 0)
    end)

    SaveUnitHandle(Wq_Hash, GetHandleId(tmr), 0, GetSpellTargetUnit())
end

-- 焰天火雨
function Abi_3_Actions()
    local trgU, target = GetSpellAbilityUnit(), GetSpellTargetUnit()
    local int = gH.getStr(trgU)
    gAbi.setDataReal(trgU, 'SQ03', 1, ABILITY_DATA.DATA_B, int * 5)
    gAbi.setDataReal(trgU, 'SQ03', 1, ABILITY_DATA.DATA_E, int)
end
-- 举火焚天
function Abi_4_Actions()
    local trgU, target = GetSpellAbilityUnit(), GetSpellTargetUnit()
    local int = gH.getStr(trgU)
    gAbi.setDataReal(trgU, 'SQ04', 1, ABILITY_DATA.DATA_A, int * 15)
    gAbi.setDataReal(trgU, 'SQ04', 1, 112, int)
end
-- 羿射九日
function Abi_12_Actions()
    local trgU, target = GetSpellAbilityUnit(), GetSpellTargetUnit()
    local n
    gT.wait(0.25, function()
        local atk = gU.getState(trgU, UNIT_STATE.BASIC_DAMAGE)

        local mj = gU.create(gU.getOwner(trgU), 'yhmj', GetUnitX(trgU), GetUnitY(trgU), 270)
        gAbi.add(mj, 'SQ12')
        gAbi.setDataReal(mj, 'SQ12', 1, 107, 1800) -- 施法距离
        gAbi.setDataReal(mj, 'SQ12', 1, ABILITY_DATA.DATA_A, atk)
        gU.issueOrderTar(mj, "thunderbolt", target)

        gP.disTimedText(GetLocalPlayer(), 5, GetUnitName(target) + "第" .. I2S(n) .. "箭：" .. R2S(atk))
        SaveInteger(Wq_Hash, GetHandleId(tmr), 3, n + 1)
        SaveReal(Wq_Hash, GetHandleId(tmr), 4, atk * 2)

        if n >= 8 then --
            gT.remove()
        end
    end)
end
-- 诛仙
function Abi_13_Actions()
    local trgU, target = GetSpellAbilityUnit(), GetSpellTargetUnit()
    local spellX, spellY = GetSpellTargetX(), GetSpellTargetY()
    local eff = gEff.addXY("ZhuXianjz.mdx", spellX, spellY)
    gEff.setScale(eff, 5, 5, 3)

    gAbi.setDataReal(trgU, 'SQ13', nil, ABILITY_DATA.DATA_A, gH.getAgi(trgU) * 2)

    gT.loop(0.5, function()
        local dwz = gGroup.getUnitInRange(spellX, spellY, 800)

        for i, unit in ipairs(dwz) do
            if LoadInteger(Wq_Hash, GetHandleId(unit), 13) ~= 13 and not gU.isAlly(unit, gU.getOwner(target)) then
                local def = gU.getState(unit, UNIT_STATE.ARMOR) * 0.4
                SaveInteger(Wq_Hash, GetHandleId(unit), 13, 13)
                local text = GetUnitName(unit) + R2S(GetUnitState(unit, ConvertUnitState(0x20)))
                gP.disTimedText(GetLocalPlayer(), 10, text)
                gUnitData.adjustAtk(unit, def) -- 防御

                gT.wait(10, function()
                    gUnitData.adjustAtk(target, 2, 0, def) -- 防御
                    SaveInteger(Wq_Hash, GetHandleId(target), 13, 0)
                end)
            end
        end

        SaveInteger(Wq_Hash, GetHandleId(GetExpiredTimer()), 2,
            LoadInteger(Wq_Hash, GetHandleId(GetExpiredTimer()), 2) - 1)
        if LoadInteger(Wq_Hash, GetHandleId(GetExpiredTimer()), 2) <= 0 then
            gEff.remove(eff)
        end
    end)

end
-- 三千雷幻身
function Abi_18_Actions()
    local trgU, target = GetSpellAbilityUnit(), GetSpellTargetUnit()

    gAbi.addTimer(trgU, 'AI18', 10.00)
end
-- 凶陌圣靴
function Abi_20_Actions()
    local trgU, target = GetSpellAbilityUnit(), GetSpellTargetUnit()
    SaveInteger(Wq_Hash, GetHandleId(trgU), 20, LoadInteger(Wq_Hash, GetHandleId(trgU), 20) * -1)

    if LoadInteger(Wq_Hash, GetHandleId(trgU), 20) == 1 then
        gAbi.add(trgU, 'AO20')
    else
        gAbi.remove(trgU, 'AO20')
    end
end
-- 火树银花
function Abi_23_Actions()
    local trgU, target = GetSpellAbilityUnit(), GetSpellTargetUnit()
    gU.removeBuffs(trgU, false, true)

    gT.loop(0.5, function()
        SaveInteger(Wq_Hash, GetHandleId(tmr), 1, LoadInteger(Wq_Hash, GetHandleId(GetExpiredTimer()), 1) - 1)

        if LoadInteger(Wq_Hash, GetHandleId(GetExpiredTimer()), 1) <= 0 then
            gT.remove()
        end
        -- 删除负面buff
        gU.removeBuffs(trgU, false, true)
    end)

    SaveInteger(Wq_Hash, GetHandleId(tmr), 1, 6)
end
-- 神祭
function Abi_24_Actions()
    local trgU, target = GetSpellAbilityUnit(), GetSpellTargetUnit()

    gT.loop(0.05, function()
        gU.setState(trgU, UNIT_STATE.LIFE, 1.00)
        if not gAbi.isHave(trgU, 'BS24') then --
            gP.disTimedText(GetLocalPlayer(), 5, "神祭结束")
            gT.remove()
        end
    end)
end
