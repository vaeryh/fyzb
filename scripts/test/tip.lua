local mt = {}

local dmb = gDmb.new(3, 4, '当前信息')
gDmb.setItemsStyle(dmb, true, false)
gDmb.setItemsValue(dmb, '0')
--
gTrg.RegTimerEvent(1.00, true, function()
    local width = 0
    for i, v in pairs(mt) do
        if #v > width then
            width = #v
        end
    end
    gDmb.setItemsWidth(dmb, width * 0.0025)
    gDmb.setMinimize(dmb, true)
    gDmb.setMinimize(dmb, false)
    -- 0
    gDmb.setItemDynamic(dmb, 0, 0, mt.Player1)
    gDmb.setItemDynamic(dmb, 0, 1, mt.Unit)
    gDmb.setItemDynamic(dmb, 0, 2, mt.Abi)
    gDmb.setItemDynamic(dmb, 0, 3, mt.AbiId)
    -- 1
    gDmb.setItemDynamic(dmb, 1, 0, mt.Source)
    gDmb.setItemDynamic(dmb, 1, 1, mt.Damage)
    gDmb.setItemDynamic(dmb, 1, 2, mt.Player2)
    gDmb.setItemDynamic(dmb, 1, 3, '0')
    -- 2
    gDmb.setItemDynamic(dmb, 2, 0, '0')
    gDmb.setItemDynamic(dmb, 2, 1, '0')
    gDmb.setItemDynamic(dmb, 2, 2, '0')
    gDmb.setItemDynamic(dmb, 2, 3, '0')
    -- 3
    -- gDmb.setItemDynamic(dmb, 3, 0, '111111111111111111111111111')
    -- gDmb.setItemDynamic(dmb, 3, 1, '1222222222222222222222222')
    -- gDmb.setItemDynamic(dmb, 3, 2, '433333333333333333333')
    --

end)

-- 施放技能
gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.SPELL_CAST, function()
    mt.Player1 = '施法玩家:' .. GetPlayerName(GetTriggerPlayer())
    mt.Unit = '施法单位:' .. GetUnitName(GetTriggerUnit())
    mt.Abi = '技能:' .. GetObjectName(GetSpellAbilityId())
    mt.AbiId = gYh.id2s(GetSpellAbilityId())
end)
-- 伤害
gTrg.RegAnyUnitDamageEvent(function()
    mt.Player1 = '受伤玩家:' .. GetPlayerName(GetTriggerPlayer())
    mt.Unit = '受伤单位:' .. GetUnitName(GetTriggerUnit())
    mt.Player2 = '伤害玩家:' .. GetPlayerName(gP.getOwner(GetEventDamageSource())) or 'nil'
    mt.Source = '伤害来源:' .. GetUnitName(GetEventDamageSource()) or 'nil'
    mt.Damage = '伤害值:' .. string.format('%.3f', GetEventDamage())
end)

return mt
