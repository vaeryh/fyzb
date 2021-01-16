local g = require 'jass.globals'
-----------------------------------------------------------------------------------------
local trig = yh.createTrigger(function()
    local u0 = GetTriggerUnit()
    local p = GetSpellTargetLoc()

    if GetSpellAbilityId() == yh.s2id('A001') then
        DisplayTimedTextToPlayer(Player(0), 0, 0, 5.00, GetObjectName(GetSpellAbilityId()))
        local u2 = CreateUnit(GetOwningPlayer(u0), yh.s2id('e000'), GetUnitX(u0), GetUnitY(u0), GetUnitFacing(u0))
        UnitApplyTimedLife(u2, 'BTLF', 2)
        UnitAddAbility(u2, yh.s2id('A000'))
        local g0 = CreateGroup()
        GroupEnumUnitsInRange(g0, GetLocationX(p), GetLocationY(p), 300, nil)

        while g0 do
            local u3 = FirstOfGroup(g0)
            if GetUnitState(u3, UNIT_STATE_LIFE) > 0 and IsUnitAlly(u3, GetOwningPlayer(u0)) == false then
                IssueTargetOrder(u2, 'thunderbolt', u3)
            end
            GroupRemoveUnit(g0, u3)
            if u3 == 0 or u3 == nil then
                DestroyGroup(g0)
                g0 = nil
            end
        end
    end
end)
TriggerRegisterPlayerUnitEvent(trig, Player(0), EVENT_PLAYER_UNIT_SPELL_EFFECT, null)
-----------------------------------------------------------------------------------------
local trig = yh.createTrigger(function()
    local minX = GetRectMinX(g.gg__rct_FirstHeroSelection)
    local minY = GetRectMinY(g.gg__rct_FirstHeroSelection)
    printF(minX, minY)
    u = CreateUnit(Player(12), yh.s2id('hfoo'), minX, minY, 270)
    heal(u, 3, -100)
    -- DestroyTrigger(GetTriggeringTrigger())
end)
TriggerRegisterTimerEvent(trig, 1, true)
-----------------------------------------------------------------------------------------
heal = function(u, count, hp)
    local i = 0
    TimerStart(CreateTimer(), 0.5, true, function()
        SetUnitState(u, UNIT_STATE_LIFE, hp + GetUnitState(u, UNIT_STATE_LIFE))
        i = i + 1
        if i == count then
            DestroyTimer(GetExpiredTimer())
        end
    end)
end
-----------------------------------------------------------------------------------------
-- 创建可追踪物
local trig = yh.createTrigger(function()
    printF('123')
end)
local track = CreateTrackable("Abilities\\Spells\\Human\\ThunderClap\\ThunderClapCaster.mdl", 0, 0, 0)
TriggerRegisterTrackableTrackEvent(trig, track)
TriggerRegisterTrackableHitEvent(trig, track)
-----------------------------------------------------------------------------------------
-- 调用jass内全集变量
local g = require 'jass.globals'

TriggerAddAction(g.Trig_KeyBoard_F2_Down, function()
    -- printF('key')

end)
-----------------------------------------------------------------------------
-- japi
-- local jass = require 'jass.common'
-- local japi = require 'jass.japi'
-- japi.EXDisplayChat(jass.Player(0), 0, "Hello!")

-- for k, v in pairs(require 'jass.japi') do
--     print(k, v)
-- end
-----------------------------------------------------------------------------
