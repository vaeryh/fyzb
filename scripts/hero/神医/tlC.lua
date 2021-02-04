local mt = {}

local tla = require 'hero.神医.tlA'

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
            atkCount_4 = 0,
            atkCount_90 = 0
        }
    end
    return mt[u]
end
-- 玉蜂1	玉蜂（每次普攻减敌人移速10%，可叠加3次）	普攻
function mt.TL_1_Actions(hero, enemy)
    local TL = mt.getTL(enemy)
    print('玉蜂1', TL.atkCount_1, gU.getMoveSpeed(enemy))
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
            print('玉蜂1', TL.atkCount_1, gU.getMoveSpeed(enemy))
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
        local mj = gU.create(gU.getOwner(hero), 'yhmj', gU.getX(enemy), gU.getY(enemy), 270)
        gAbi.add(mj, 'Y002')
        gU.issueNeutralOrderTar(gU.getOwner(hero), mj, "purge", enemy)
    end
end
-- 冰蚕3	冰蚕（攻击时20%几率冰冻敌人）	普攻
function mt.TL_3_Actions(hero, enemy)
    if GetRandomReal(0, 100) <= 20 then
        local mj = gU.create(gU.getOwner(hero), 'yhmj', gU.getX(enemy), gU.getY(enemy), 270)
        gAbi.add(mj, 'Y003')
        gU.issueNeutralOrderTar(gU.getOwner(hero), mj, "entanglingroots", enemy)
    end
end
-- 西域曼陀罗4	西域曼陀罗（攻击会以每秒消耗敌方1%的蓝量，持续5秒，可刷新）	普攻
function mt.TL_4_Actions(hero, enemy)
    local TL = mt.getTL(enemy)

    if TL.atkCount_4 <= 0 then
        gT.loop(1.00, function()
            TL.atkCount_4 = TL.atkCount_4 - 1

            gEff.remove(gEff.addTarget("Abilities\\Spells\\Human\\Feedback\\SpellBreakerAttack.mdl", enemy, "origin"))
            local mana = gU.getState(enemy, UNIT_STATE.MANA) * 0.01
            gU.adjustState(enemy, UNIT_STATE.MANA, -mana)
            print('西域曼陀罗4', TL.atkCount_4, mana)
            if TL.atkCount_4 <= 0 then
                gT.remove()
            end
        end)
    end
    TL.atkCount_4 = 5 -- 保持攻击状态
end
-- 人面魔珠50	人面魔珠（攻击附带主属性*0.5额外物理技能伤害）	普攻
function mt.TL_50_Actions(hero, enemy)
    local main = gH.getMain(hero)
    gDam.target(hero, enemy, main * 0.5, false, false, ATTACK_TYPE.HERO, DAMAGE_TYPE.FORCE)
end
-- 彼岸花51
function mt.TL_51_Actions(p, hero, enemy)
    if GetRandomReal(0, 100) <= 5 and not gU.isType(enemy, UNIT_TYPE.HERO) then
        gU.setOwner(enemy, p, true)
        gU.setLifeTime(enemy, 15 + gH.getLevel(hero) * 0.1)
        gEff.remove(gEff.addTarget("Abilities\\Spells\\Other\\Charm\\CharmTarget.mdl", enemy, "origin"))
    end
end
-- 金鳞幻蝶60
function mt.TL_60_Actions(hero, enemy)
    if GetRandomReal(0, 100) <= 30 then
        gTag.newUnit("|cff0de4e4" .. "闪避", 0.023, hero, 1.50, 64, 100)
        SetEventDamage(0)
    end
end
-- 白鹤灵芝草61
function mt.TL_61_Actions(hero)
    local value = gH.getMain(hero)
    if R2I(value * 0.1) ~= 0 and gU.getState(hero, UNIT_STATE.LIFE) < gU.getState(hero, UNIT_STATE.MAX_LIFE) then
        gU.adjustState(hero, UNIT_STATE.LIFE, value * 0.1)
        gTag.newUnit("|cff68c003+" .. I2S(R2I(value * 0.1)), 0.023, hero, 0.70, 64, 75)
    end
end
-- 杖头双蛇70
function mt.TL_70_Actions(enemy)
    local value = gH.getMain(hero)
    if R2I(value * 0.2) ~= 0 then
        gU.adjustState(enemy, UNIT_STATE.LIFE, -value * 0.2)
        gTag.newUnit("|cff68c003-" .. I2S(R2I(value * 0.2)), 0.023, enemy, 0.35, 64, 315)

        if gU.getState(enemy, UNIT_STATE.MANA) > 0 then
            gU.adjustState(enemy, UNIT_STATE.MANA, -value * 0.2)
            gTag.newUnit("|cff0326c0-" .. I2S(R2I(value * 0.2)), 0.023, enemy, 0.35, 64, 225)
        end
    end
end
-- 九死还魂草71
function mt.TL_71_Actions(enemy)
    if GetEventDamage() >= gU.getState(enemy, UNIT_STATE.LIFE) then
        if enemy ~= hero then
            gAbi.remove(enemy, 'Y071')
        end

        gAbi.add(enemy, 'Y071')
    end
end
-- 赤焰金龟80
function mt.TL_80_Actions()
    SetEventDamage(GetEventDamage() * 1.3)
end
-- 血菩提81
function mt.TL_81_Actions()
    SetEventDamage(GetEventDamage() * 0.7)
end
-- 朱睛冰蟾90
function mt.TL_90_Actions(enemy)
    local TL = mt.getTL(enemy)
    print(TL.atkCount_90)
    if TL.atkCount_90 <= 0 then
        gT.loop(5.00, function()
            TL.atkCount_90 = TL.atkCount_90 - 5

            gEff.remove(gEff.addTarget("Abilities\\Spells\\NightElf\\FaerieenemyagonInvis\\Faerieenemyagon_Invis.mdl",
                            enemy, "origin"))
            UnitRemoveBuffs(enemy, false, true)

            if TL.atkCount_90 <= 0 then
                gT.remove()
            end
        end)
    end
    -- 保持攻击状态
    TL.atkCount_90 = 10
end
-- 天羽灵香91：其他地方实现
-- 莽牯朱蛤100
function mt.TL_100_Actions(abiID)
    gT.loop(4.00, function()
        local mj = gU.create(gU.getOwner(hero), 'yhmj', gU.getX(hero), gU.getY(hero), 270)
        gAbi.add(mj, 'Y100')
        gU.issueNeutralOrder(gU.getOwner(hero), mj, "roar")

        if tla.TL[100] == -1 then
            gT.remove()
        end
    end)
end
-- 七星海棠101
function mt.TL_101_Actions(abiID)
    gT.loop(4.00, function()
        local mj = gU.create(gU.getOwner(hero), 'yhmj', gU.getX(hero), gU.getY(hero), 270)
        gAbi.add(mj, 'Y101')
        gU.issueNeutralOrder(gU.getOwner(hero), mj, "roar")

        if tla.TL[101] == -1 then
            gT.remove()
        end
    end)
end

-- 单体    --群体
function mt.TL1_Actions(trgP, hero, enemy)
    print(2312)
    if tla.TL[1] == 1 then
        mt.TL_1_Actions(hero, enemy)
    end
    if tla.TL[2] == 1 then
        mt.TL_2_Actions(hero, enemy)
    end
    if tla.TL[3] == 1 then
        mt.TL_3_Actions(hero, enemy)
    end
    if tla.TL[4] == 1 then
        mt.TL_4_Actions(hero, enemy)
    end
    if tla.TL[50] == 1 then
        mt.TL_50_Actions(hero, enemy)
    end
    if tla.TL[51] == 1 then
        mt.TL_51_Actions(trgP, hero, enemy)
    end
    if tla.TL[61] == 1 then
        mt.TL_61_Actions(hero)
    end
    if tla.TL[70] == 1 then
        mt.TL_70_Actions(enemy)
    end
    if tla.TL[80] == 1 then
        mt.TL_80_Actions(hero, enemy)
    end
end
--
function mt.TL2_Actions(trgp, hero, enemy)
    if tla.TL[60] == 1 then
        mt.TL_60_Actions(enemy)
    end
    if tla.TL[71] == 1 then
        mt.TL_71_Actions(enemy)
    end
    if tla.TL[81] == 1 then
        mt.TL_81_Actions()
    end
    if tla.TL[90] == 1 then
        mt.TL_90_Actions(enemy)
    end
end

-- gTrg.RegAnyUnitDamageEvent(function()
--     if gU.isEnemy(GetEventDamageSource(), GetTriggerPlayer()) then
--         if IsEventAttackDamage() then -- 普攻
--             local hero, enemy = GetEventDamageSource(), GetTriggerUnit()
--             -- 伤害来源拥有技能
--             if gAbi.isHave(GetEventDamageSource(), mt.Abi_2) then
--                 mt.TL1_Actions(GetTriggerPlayer(), hero, enemy)
--             end
--         end
--     end
-- end)

return mt
