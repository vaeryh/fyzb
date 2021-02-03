local mt = {}

-- 玉蜂1
mt.Abi_1 = "T001"
-- 闪电貂2
mt.Abi_2 = "T002"
-- 冰蚕3
mt.Abi_3 = "T003"
-- 西域曼陀罗4
mt.Abi_4 = "T004"
-- 人面魔珠50
mt.Abi_50 = "T050"
-- 彼岸花51
mt.Abi_51 = "T051"
-- 金鳞幻蝶60 
mt.Abi_60 = "T060"
-- 白鹤灵芝草6
mt.Abi_61 = "T061"
-- 杖头双蛇70 
mt.Abi_70 = "T070"
-- 九死还魂草71
mt.Abi_71 = "T071"
-- 赤焰金龟80
mt.Abi_80 = "T080"
-- 血菩提81  
mt.Abi_81 = "T081"
-- 朱睛冰蟾90 
mt.Abi_90 = "T090"
-- 天羽灵香91
mt.Abi_91 = "T091"
-- 莽牯朱蛤100
mt.Abi_100 = "T100"
-- 七星海棠101
mt.Abi_101 = "T101"

-- 获取表
function mt.getTL(u)
    if mt[u] == nil then
        mt[u] = {
            atkCount_1 = 0,
            speed_1 = 0,
            atkCount_4 = 0
        }
    end
    return mt[u]
end
-- 玉蜂1	玉蜂（每次普攻减敌人移速10%，可叠加3次）	普攻
function mt.TL_1_Actions(hero, enemy)
    local tmr = CreateTimer()
    local hash = {}
    local TL = mt.getTL(enemy)
    print(TL.atkCount_1, gU.getMoveSpeed(enemy))
    -- 改变单位颜色
    if TL.atkCount_1 <= 0 then
        TL.speed_1 = gU.getMoveSpeed(enemy)
        gU.setVertexColor(enemy, 65, 105, 225, 255)
        -- 减速特效
        local eff = gEff.addTarget("Abilities\\Spells\\Other\\FrostDamage\\FrostDamage.mdl", enemy, "chest")

        gT.loop(1.00, function()
            TL.atkCount_1 = TL.atkCount_1 - 1
            if TL.atkCount_1 <= 0 then
                gEff.remove(eff)
                gU.setMoveSpeed(enemy, TL.speed_1)
                gU.setVertexColor(enemy, 255, 255, 255, 255)
                gT.remove()
            end
            print(TL.atkCount_1, gU.getMoveSpeed(enemy))
        end)
    end
    -- 减单位移动速度
    if gU.getMoveSpeed(enemy) > TL.speed_1 * 0.729 then
        gU.setMoveSpeed(enemy, gU.getMoveSpeed(enemy) * 0.9)
    end
    -- 保持攻击状态
    TL.atkCount_1 = 3
end
-- 闪电貂2	闪电貂（敌人攻击时20%纪律被定身（对敌人施加净化））	普攻
function mt.TL_2_Actions(hero, enemy)
    if GetRandomReal(0, 100) <= 20 then
        local mj = gU.create(gP.getOwner(hero), 'yhmj', gU.getX(enemy), gU.getY(enemy), 270)
        gAbi.add(mj, 'Y002')
        gU.issueNeutralOrderTar(gP.getOwner(hero), mj, "purge", enemy)
    end
end
-- 冰蚕3	冰蚕（攻击时20%几率冰冻敌人）	普攻
function mt.TL_3_Actions(enemy)
    if GetRandomReal(0, 100) <= 20 then
        local mj = gU.create(gP.getOwner(hero), 'yhmj', gU.getX(enemy), gU.getY(enemy), 270)
        gAbi.add(mj, 'Y003')
        gU.issueNeutralOrderTar(gP.getOwner(hero), mj, "entanglingroots", enemy)
    end
end
-- 西域曼陀罗4	西域曼陀罗（攻击会以每秒消耗敌方1%的蓝量，持续5秒，可刷新）	普攻
function TL_4_Actions(enemy)
    local TL = getTL(enemy)

    if TL.atkCount_4 <= 0 then
        gT.loop(1, function()
            TL.atkCount_4 = TL.atkCount_4 - 1
            print(TL.atkCount_4)
            gEff.remove(gEff.addTarget("Abilities\\Spells\\Human\\Feedback\\SpellBreakerAttack.mdl", enemy, "origin"))
            local mana = gU.getState(enemy, UNIT_STATE.MANA) * 0.01
            gU.adjustState(enemy, UNIT_STATE.MANA, -mana)
            TL.atkCount_4 = 1 or 2 or 3 or 4 or gT.remove()
            -- if TL.atkCount_4 <= 0 then
            --     gT.remove()
            -- end
        end)
    end
    TL.atkCount_4 = 5 -- 保持攻击状态
end
-- 人面魔珠50	人面魔珠（攻击附带主属性*0.5额外物理技能伤害）	普攻
function TL_50_Actions(hero, enemy)
    local main = gH.getMain(hero)
    gDam.target(hero, enemy, main * 0.5, false, false, ATTACK_TYPE.HERO, DAMAGE_TYPE.FORCE)
end
-- 彼岸花51
function TL_51_Actions(p, hero, enemy)
    if GetRandomReal(0, 100) <= 5 and IsUnitType(enemy, UNIT_TYPE_hero) == false then
        SetUnitOwner(enemy, p, true)
        UnitApplyTimedLife(enemy, 'BEfn', 15 + GetUnitLevel(hero) * 0.1)
        DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\Charm\\CharmTarget.mdl", enemy, "origin"))
    end
end
-- 金鳞幻蝶60
function TL_60_Actions(hero)
    if GetRandomReal(0, 100) <= 30 then
        CreateTextTagUnit("闪避", 0.023, hero, 0, 1.5, 255, 0, 0, 255)
        SetTextTagVelocityBJ(bj_lastCreatedTextTag, 64, 100)
        YDWESetEventDamage(0)
    end
end
-- 白鹤灵芝草61
function TL_61_Actions(hero, value)
    if R2I(value * 0.1) ~= 0 and GetUnitState(hero, UNIT_STATE_LIFE) < GetUnitState(hero, UNIT_STATE_MAX_LIFE) then
        SetUnitState(hero, UNIT_STATE_LIFE, GetUnitState(hero, UNIT_STATE_LIFE) + value * 0.1)
        CreateTextTagUnit("+" + I2S(R2I(value * 0.1)), 0.023, hero, 0, 0.70, 0, 255, 0, 255)
        SetTextTagVelocityBJ(bj_lastCreatedTextTag, 64, 75)
    end
end
-- 杖头双蛇70
function TL_70_Actions(enemy, value)
    if R2I(value * 0.2) ~= 0 then
        SetUnitState(enemy, UNIT_STATE_LIFE, GetUnitState(enemy, UNIT_STATE_LIFE) - value * 0.2)
        CreateTextTagUnit("-" + I2S(R2I(value * 0.2)), 0.023, enemy, 0, 0.35, 0, 255, 0, 255)
        SetTextTagVelocityBJ(bj_lastCreatedTextTag, 64, 315)
        if GetUnitState(enemy, UNIT_STATE_MANA) > 0 then
            SetUnitState(enemy, UNIT_STATE_MANA, GetUnitState(enemy, UNIT_STATE_MANA) - value * 0.2)
            CreateTextTagUnit("-" + I2S(R2I(value * 0.2)), 0.023, enemy, 0, 0.35, 0, 0, 255, 255)
            SetTextTagVelocityBJ(bj_lastCreatedTextTag, 64, 225)
        end
    end
end
-- 九死还魂草71
function TL_71_Actions(trgu)
    if GetEventDamage() >= GetUnitState(trgu, UNIT_STATE_LIFE) then
        if trgu ~= hero then
            UnitRemoveAbility(trgu, 'Y071')
        end

        gAbi.add(trgu, 'Y071')
    end
end
-- 赤焰金龟80
function TL_80_Actions()
    YDWESetEventDamage(GetEventDamage() * 1.3)
end
-- 血菩提81
function TL_81_Actions()
    YDWESetEventDamage(GetEventDamage() * 0.7)
end
-- 朱睛冰蟾90

function TL_90_Actions(trgu)

    if LoadInteger(Hash, GetHandleId(trgu), 90) <= 0 then
        local tmr = CreateTimer()
        SaveUnitHandle(Hash, GetHandleId(tmr), 1, trgu) -- hash
        TimerStart(tmr, 5, true, function()
            local unit
            trgu = LoadUnitHandle(Hash, GetHandleId(GetExpiredTimer()), 1)
            SaveInteger(Hash, GetHandleId(trgu), 90, LoadInteger(Hash, GetHandleId(trgu), 90) - 5)

            DestroyEffect(AddSpecialEffectTarget(
                              "Abilities\\Spells\\NightElf\\FaerieenemyagonInvis\\Faerieenemyagon_Invis.mdl", trgu,
                              "origin"))
            UnitRemoveBuffs(trgu, false, true)

            if LoadInteger(Hash, GetHandleId(trgu), 90) <= 0 then
                FlushChildHashtable(Hash, GetHandleId(trgu))
                FlushChildHashtable(Hash, GetHandleId(GetExpiredTimer()))
                DestroyTimer(GetExpiredTimer())
            end
        end)
    end

    SaveInteger(Hash, GetHandleId(trgu), 90, 10) -- 保持攻击状态
end
-- 天羽灵香91：其他地方实现
-- 莽牯朱蛤100
function TL_100_Actions(abiID)
    TimerStart(CreateTimer(), 4, true, function()
        local mj = gU.create(gP.getOwner(hero), 'yhmj', gU.getX(hero), gU.getY(hero), 270)
        gAbi.add(mj, 'Y100')
        IssueNeutralImmediateOrder(gP.getOwner(hero), mj, "roar")

        if SBuer[100] == -1 then
            DestroyTimer(GetExpiredTimer())
        end
    end)
end
-- 七星海棠101
function TL_101_Actions(abiID)
    TimerStart(CreateTimer(), 4, true, function()
        local mj = gU.create(gP.getOwner(hero), 'yhmj', gU.getX(hero), gU.getY(hero), 270)
        gAbi.add(mj, 'Y101')
        IssueNeutralImmediateOrder(gP.getOwner(hero), mj, "roar")

        if SBuer[101] == -1 then
            DestroyTimer(GetExpiredTimer())
        end
    end)
end
-- =========
-- 单体    --群体
function Abi_D_TL1_Actions(sourcep, sourceu, trgu)
    if SBuer[1] == 1 then
        TL_1_Actions(trgu)
    end
    if SBuer[2] == 1 then
        TL_2_Actions(trgu)
    end
    if SBuer[3] == 1 then
        TL_3_Actions(trgu)
    end
    if SBuer[4] == 1 then
        TL_4_Actions(trgu)
    end
    if SBuer[50] == 1 then
        TL_50_Actions(sourceu, trgu, heroPrimary(sourceu))
    end
    if SBuer[51] == 1 then
        TL_51_Actions(sourcep, sourceu, trgu)
    end
    if SBuer[61] == 1 then
        TL_61_Actions(sourceu, heroPrimary(sourceu))
    end
    if SBuer[70] == 1 then
        TL_70_Actions(trgu, heroPrimary(sourceu))
    end
    if SBuer[80] == 1 then
        TL_80_Actions()
    end
end

function Abi_D_TL2_Actions(trgp, sourceu, trgu)
    if SBuer[60] == 1 then
        TL_60_Actions(trgu)
    end
    if SBuer[71] == 1 then
        TL_71_Actions(trgu)
    end
    if SBuer[81] == 1 then
        TL_81_Actions()
    end
    if SBuer[90] == 1 then
        TL_90_Actions(trgu)
    end
end

gTrg.RegAnyUnitDamageEvent(function()
    if gU.isEnemy(GetEventDamageSource(), GetTriggerPlayer()) then
        if IsEventAttackDamage() then -- 普攻
            local hero, enemy = GetEventDamageSource(), GetTriggerUnit()
            -- 伤害来源拥有技能
            if gAbi.isHave(GetEventDamageSource(), mt.Abi_2) then
                mt.TL_2_Actions(hero, enemy)
            end
        end
    end
end)

return mt
