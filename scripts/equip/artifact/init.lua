local mt = {}
-- 剑类神器数量
mt.Sq_Jian = 0

-- 单位施放技能->动作
gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.SPELL_CAST, function()
    if gTrg.isMatchAbiId('SQ02') 'SQ02' then -- 龙威挑战
        WqSpell_Abi_2_Actions()
    elseif gTrg.isMatchAbiId('SQ03') then -- 焰天火雨
        WqSpell_Abi_3_Actions()
    elseif gTrg.isMatchAbiId('SQ04') then -- 举火焚天
        WqSpell_Abi_4_Actions()
    elseif gTrg.isMatchAbiId('SQ12') and gU.isType(GetTriggerUnit(), UNIT_TYPE.HERO) then -- 羿射九日
        WqSpell_Abi_12_Actions()
    elseif gTrg.isMatchAbiId('SQ13') then -- 诛仙
        WqSpell_Abi_13_Actions()
    elseif gTrg.isMatchAbiId('SQ18') then -- 三千雷幻身
        WqSpell_Abi_18_Actions()
    elseif gTrg.isMatchAbiId('SQ20') then -- 大凶
        WqSpell_Abi_20_Actions()
    elseif gTrg.isMatchAbiId('SQ23') then -- 火树银花
        WqSpell_Abi_23_Actions()
    elseif gTrg.isMatchAbiId('SQ24') then -- 神祭
        WqSpell_Abi_24_Actions()
    end
end)
-- 单位伤害事件->动作

gTrg.RegAnyUnitDamageEvent(function()
    local source = GetEventDamageSource()
    local trgU, trgP = GetTriggerUnit(), GetTriggerPlayer()
    local n1 = GetEventDamage()
    if IsEventAttackDamage() == true and not gU.isAlly(source, trgP) then -- 普攻
        if UnitHasItemOfTypeBJ(source, 'sq01') == true then
            WqHarm_Weapon_1_Actions() -- 北望
        end
        if UnitHasItemOfTypeBJ(source, 'sq05') == true then
            WqHarm_Weapon_5_Actions() -- 断魂
        end
        if UnitHasItemOfTypeBJ(source, 'sq08') == true then
            WqHarm_Weapon_8_Actions() -- 绝世好剑
        end
        if UnitHasItemOfTypeBJ(source, 'sq09') == true then
            WqHarm_Weapon_9_Actions() -- 血饮狂刀
        end
        if UnitHasItemOfTypeBJ(source, 'sq10') == true then
            WqHarm_Weapon_10_Actions() -- 大邪王
        end
        if UnitHasItemOfTypeBJ(source, 'sq11') == true then
            WqHarm_Weapon_11_Actions() -- 天命
        end
    end

    if UnitHasItemOfTypeBJ(source, 'sq02') == true then -- 赤眼神龙枪:龙威挑战
        WqHarm_Weapon_2A_Actions()
    end
    if UnitHasItemOfTypeBJ(trgU, 'sq02') == true then -- 赤眼神龙枪:龙威挑战
        WqHarm_Weapon_2B_Actions()
    end
    if UnitHasItemOfTypeBJ(source, 'sq06') == true then -- 蛟龙玄铁弓:怒蛟连射
        WqHarm_Weapon_6_Actions()
    end
    if UnitHasItemOfTypeBJ(trgU, 'sq14') == true then -- 赤金磐龙甲:盘龙
        WqHarm_Weapon_14_Actions()
    end
    if UnitHasItemOfTypeBJ(trgU, 'sq15') == true then -- 天玄真神甲:天玄
        WqHarm_Weapon_15_Actions()
    end
    if UnitHasItemOfTypeBJ(trgU, 'sq20') == true then -- 凶陌圣靴
        WqHarm_Weapon_20_Actions()
    end

    if LoadInteger(Wq_Hash, GetHandleId(trgU), 5) ~= 0 then -- 龙舌断魂弓:断魂
        local oldDamage = GetEventDamage()
        local newharm = oldDamage * (1 + LoadInteger(Wq_Hash, GetHandleId(trgU), 5) * 0.05)
        SetEventDamage(newharm) -- 实际生效，只是漂浮文字还是之前的
        gP.disTimedText(GetLocalPlayer(), 10, "断魂额外伤害：" + R2S(GetEventDamage() / oldDamage - 1))
    end

    if LoadReal(Wq_Hash, GetHandleId(trgU), 99) ~= 0 then -- 血饮狂刀：血饮
        local oldDamage = GetEventDamage()
        SetEventDamage(GetEventDamage() * (1 + LoadReal(Wq_Hash, GetHandleId(trgU), 99))) -- 实际生效，只是漂浮文字还是之前的
        gP.disTimedText(Player(0), 10, "血饮额外承伤：" + R2S(GetEventDamage() / oldDamage - 1))
    end

end)
-- 单位获得物品
gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.PICKUP_ITEM, function()
    if gIt.isMatchTypeId(trgItem, 'sq08') then
        mt.Sq_Jian = mt.Sq_Jian + 1 -- 记录剑类神器数量
        gP.disTimedText(Player(0), 10, "剑类神器持有数量：" + I2S(mt.Sq_Jian))
    end
    if gIt.isMatchTypeId(trgItem, 'sq11') then
        SaveGroupHandle(Wq_Hash, GetHandleId(GetManipulatingUnit()), 11, CreateGroup()) -- 新建单位组
    end
    if gIt.isMatchTypeId(trgItem, 'sq20') then -- 凶陌圣靴
        SaveInteger(Wq_Hash, GetHandleId(GetManipulatingUnit()), 20, -1)
    end
end)
-- 单位失去物品
gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.DROP_ITEM, function()
    local trgItem, trgU = GetManipulatedItem(), GetManipulatingUnit()
    if gIt.isMatchTypeId(trgItem, 'sq08') then
        mt.Sq_Jian = mt.Sq_Jian - 1 -- 记录剑类神器数量
        gP.disTimedText(Player(0), 10, "剑类神器持有数量：" + I2S(mt.Sq_Jian))
    end

    if gIt.isMatchTypeId(trgItem, 'sq09') then -- 清空血饮狂刀hash
        gP.disTimedText(Player(0), 10, "丢弃：血饮狂刀")
        local speed = LoadReal(Wq_Hash, GetHandleId(GetManipulatingUnit()), 9)
        gU.adjustState(trgU, UNIT_STATE.ATK_SPEED, -speed)
        SaveReal(Wq_Hash, GetHandleId(GetManipulatingUnit()), 9, 0) -- 攻速
        SaveReal(Wq_Hash, GetHandleId(GetManipulatingUnit()), 99, 0) -- 承伤
    end
    -- 天命
    if gIt.isMatchTypeId(trgItem, 'sq11') then
        local dwz = LoadGroupHandle(Wq_Hash, GetHandleId(GetManipulatingUnit()), 11)
        while CountUnitsInGroup(dwz) == 0 do
            local mj = FirstOfGroup(dwz)
            IssuePointOrder(mj, "detonate", GetUnitX(mj), GetUnitY(mj))
            GroupRemoveUnit(dwz, mj)
        end
        DestroyGroup(dwz) -- 删除单位组

    end
    if gIt.isMatchTypeId(trgItem, 'sq20') then -- 凶陌圣靴
        SaveInteger(Wq_Hash, GetHandleId(GetManipulatingUnit()), 20, 0)
    end
end)

return mt
