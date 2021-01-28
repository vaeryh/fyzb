local mt = {}

-- 技能位置
mt.Buttonpos = "W"

-- 技能等级
mt.abiLevel = 5

-- 技能id
mt.id = 'NfW0'

-- 技能名称
mt.name = "傲寒六绝"

-- 技能介绍
mt.tip = "挥舞大刀向前冲出，落地造成范围敏捷*1-5伤害"

-- W
-- 二：创建单位，连续跳跃幻影
function Abi_W_Timer_Actions()
    local untloc = LoadLocationHandle(Nf_Hash, GetHandleId(GetExpiredTimer()), 1) -- untloc初始单位位置
    local speloc = LoadLocationHandle(Nf_Hash, GetHandleId(GetExpiredTimer()), 2) -- 技能施放点
    local rgb = LoadInteger(Nf_Hash, GetHandleId(GetExpiredTimer()), 3) -- RGB颜色
    local lev = GetUnitAbilityLevel(hero, 'NfW0') -- 技能等级
    local agi = GetHeroAgi(hero, true) -- 敏捷相关伤害值

    bj_lastCreatedUnit = CreateUnit(GetOwningPlayer(hero), 'yhmj', GetLocationX(untloc), GetLocationY(untloc),
                             AngleBetweenPoints(untloc, speloc)) -- 创建马甲
    DzSetUnitModel(bj_lastCreatedUnit, "units\\orc\\HeroBladeMaster\\HeroBladeMaster.mdl")
    UnitApplyTimedLife(bj_lastCreatedUnit, 'BTLF', 0.5)
    YDWEJumpTimer(bj_lastCreatedUnit, AngleBetweenPoints(untloc, speloc), DistanceBetweenPoints(untloc, speloc), 0.30,
        0.01, 210) -- 跳跃函数

    SaveInteger(Nf_Hash, GetHandleId(GetExpiredTimer()), 3, rgb - 11) --
    SetUnitVertexColor(bj_lastCreatedUnit, rgb, rgb, rgb, rgb) -- 设置单位颜色

    if rgb <= 0 then
        DestroyEffect(AddSpecialEffectLoc("Abilities\\Spells\\Orc\\EarthQuake\\EarthQuakeTarget.mdl", speloc)) -- 地震区域效果
        AddSpecialEffectLoc("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl", speloc) -- 战争践踏效果
        bj_lastCreatedUnit = CreateUnit(GetOwningPlayer(hero), 'yhmj', GetLocationX(speloc), GetLocationY(speloc), 270) -- 创建马甲
        UnitAddAbility(bj_lastCreatedUnit, 'NfW1')
        YDWESetUnitAbilityDataReal(bj_lastCreatedUnit, 'NfW1', 1, 108, agi * lev * 3) -- 减少护甲。数据A
        YDWESetUnitAbilityDataReal(bj_lastCreatedUnit, 'NfW1', 1, 106, lev * 30 + 250) -- 影响区域
        IssueImmediateOrder(bj_lastCreatedUnit, "stomp")

        DestroyTimer(GetExpiredTimer()) -- 删除计时器
        FlushChildHashtable(Nf_Hash, GetHandleId(GetExpiredTimer()))
    end

end

function mt.Actions(hero)
    local distance = DistanceBetweenPoints(GetUnitLoc(GetTriggerUnit()), GetSpellTargetLoc())
    local ang = AngleBetweenPoints(GetUnitLoc(GetTriggerUnit()), GetSpellTargetLoc())
    local tmr = CreateTimer()

    YDWEJumpTimer(GetTriggerUnit(), ang, distance, 0.30, 0.01, 210) -- jump函数

    SaveLocationHandle(Nf_Hash, GetHandleId(tmr), 1, GetUnitLoc(GetTriggerUnit())) -- untloc初始单位位置
    SaveLocationHandle(Nf_Hash, GetHandleId(tmr), 2, GetSpellTargetLoc()) -- speloc
    SaveInteger(Nf_Hash, GetHandleId(tmr), 3, 255) -- 255初始颜色

    TimerStart(tmr, 0.02, true, Abi_W_Timer_Actions)

end

-- 触发+动作
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.SPELL_EFFECT, function()
    if GetSpellAbility() == gYh.s2id(mt.id) then
        mt.Actions(GetTriggerUnit())
    end
end)

return mt
