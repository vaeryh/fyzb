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
            atkCount_4 = 0,
            atkCount_90 = 0
        }
    end
    return mt[u]
end
-- 玉蜂1	玉蜂（每次普攻减敌人移速10%，可叠加3次）	普攻
function mt.TL_1_Actions(hero, enemy)
    local TL = mt.getTL(enemy)
    printF('玉蜂1', TL.atkCount_1, gU.getMoveSpeed(enemy))
    -- 改变单位颜色
    if TL.atkCount_1 == 0 then
        TL.speed_1 = gU.getMoveSpeed(enemy)
        gU.setVertexColor(enemy, 65, 105, 225, 255)
        -- 减速特效
        local eff = gEff.addTarget("Abilities\\Spells\\Other\\FrostDamage\\FrostDamage.mdl", enemy, "chest")

        gT.loop(1.00, function()
            TL.atkCount_1 = TL.atkCount_1 - 1
            if TL.atkCount_1 == 0 then
                gEff.remove(eff)
                gU.setMoveSpeed(enemy, TL.speed_1) -- 恢复初始速度
                gU.setVertexColor(enemy, 255, 255, 255, 255) -- 恢复颜色
                gT.remove()
            end
        end)
    end
    -- 减单位移动速度 -不会低于物编单位的最小速度
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
    local harm = gH.getMain(hero) * 0.5
    gDam.target(hero, enemy, harm)
    gTag.newUnit("|cff68c003+" .. harm, 0.021, enemy, 0.70, 120, 90)
end
-- 彼岸花51
function mt.TL_51_Actions(hero, enemy)
    if GetRandomReal(0, 100) <= 5 and not gU.isType(enemy, UNIT_TYPE.HERO) then
        gU.setOwner(enemy, gU.getOwner(hero), true)
        gU.setLifeTime(enemy, 15 + gH.getLevel(hero) * 0.1)
        gEff.remove(gEff.addTarget("Abilities\\Spells\\Other\\Charm\\CharmTarget.mdl", enemy, "origin"))
    end
end
-- 金鳞幻蝶60
function mt.TL_60_Actions(hero, enemy)
    if GetRandomReal(0, 100) <= 130 then
        gTag.newUnit("|cff0de4e4" .. "闪避-" .. GetEventDamage(), 0.023, hero, 1.50, 64, 100)
        SetEventDamage(0)
    end
end

-- 白鹤灵芝草61
function mt.TL_61_Actions(hero, enemy)
    local value = gH.getMain(hero)
    value = string.format('%0.f', value * 0.1)
    if value ~= 0 and gU.getState(hero, UNIT_STATE.LIFE) < gU.getState(hero, UNIT_STATE.MAX_LIFE) then
        gU.adjustState(hero, UNIT_STATE.LIFE, value)
        gTag.newUnit("|cff68c003+" .. value, 0.021, hero, 0.70, 20, 90)
    end
end

-- 杖头双蛇70
function mt.TL_70_Actions(hero, enemy)
    local value = gH.getMain(hero)
    value = string.format('%0.f', value * 0.2)

    if value ~= 0 then
        if gU.getState(enemy, UNIT_STATE.LIFE) - value > 0 then
            gU.adjustState(enemy, UNIT_STATE.LIFE, -value)
            gTag.newUnit("|cff68c003-" .. value, 0.023, enemy, 0.55, 20, 315)
        end
        if gU.getState(enemy, UNIT_STATE.MANA) - value >= 0 then
            gU.adjustState(enemy, UNIT_STATE.MANA, -value)
            gTag.newUnit("|cff0326c0-" .. value, 0.023, enemy, 0.55, 20, 225)
        end
    end
end

-- 九死还魂草71
function mt.TL_71_Actions(hero, enemy)
    local cool = gSlk.getAbiInt('Y071', 'cool1')
    if GetEventDamage() >= gU.getState(hero, UNIT_STATE.LIFE) then
        gAbi.add(hero, 'Y071')
        -- gTag.newUnit("|cffafbaec-" .. '英雄过一会儿复活', 0.023, hero, 0.55, 50, -90)
    end
end

-- 赤焰金龟80
function mt.TL_80_Actions(hero, enemy)
    local harm = GetEventDamage() * 0.3
    gDam.target(hero, enemy, harm, true, true)
    gTag.newUnit("|cffafbaec普攻伤害+" .. harm, 0.023, enemy, 0.55, 50, -90)
end

-- 血菩提81
function mt.TL_81_Actions(hero, enemy)
    local harm = GetEventDamage() * 0.3
    SetEventDamage(GetEventDamage() * 0.7)
    gTag.newUnit("|cffafbaec普攻伤害-" .. harm, 0.023, hero, 0.55, 50, -90)
end

-- 朱睛冰蟾90:开启之时起生效
function mt.TL_90_Actions(hero)
    gT.loop(5.00, function()
        local tla = require 'map.hero.神医.tlA'
        if tla.TL[90] == 1 then
            local path = "Abilities\\Spells\\Undead\\ReplenishMana\\ReplenishManaCasterOverhead.mdl"
            gEff.remove(gEff.addTarget(path, hero, "overhead"))
            gU.removeBuffs(hero, false, true)
            gTag.newUnit("|cfff0cf17" .. '清除负面状态', 0.023, hero, 0.30, 20, 45)
        elseif tla.TL[90] == -1 then
            gT.remove()
        end
    end)
end

-- 天羽灵香91:开启之时起生效
function mt.TL_91_Actions(hero)
    local tla = require 'map.hero.神医.tlA'
    if tla.TL[91] == 1 then
        gAbi.add(hero, 'Y091')
    else
        gAbi.remove(hero, 'Y091')
    end
end

-- 莽牯朱蛤100	莽牯朱蛤（降低敌方单位30%攻击力、30%护甲值
function mt.TL_100_Actions(hero)
    gT.loop(1.00, function()
        local tla = require 'map.hero.神医.tlA'
        if tla.TL[100] == 1 then
            local dwz = gGroup.getUnitInRange(gU.getX(hero), gU.getY(hero), 900)
            for i, unit in ipairs(dwz) do
                if gU.isEnemy(hero, gU.getOwner(unit)) then
                    local atk = gU.getState(unit, UNIT_STATE.BASIC_DAMAGE) * 0.3
                    gUnitdata.addTimerAtk(unit, -atk, 1.00)
                    local def = gU.getState(unit, UNIT_STATE.ARMOR) * 0.3
                    gUnitdata.addTimerDef(unit, -def, 1.00)
                end
            end
        else
            gT.remove()
        end
    end)
end

-- 七星海棠101	七星海棠（增加己方单位30%攻击力、30%护甲值）
function mt.TL_101_Actions(hero)
    gT.loop(1.00, function()
        local tla = require 'map.hero.神医.tlA'
        if tla.TL[101] == 1 then
            local dwz = gGroup.getUnitInRange(gU.getX(hero), gU.getY(hero), 900)
            for i, unit in ipairs(dwz) do
                if gU.isAlly(hero, gU.getOwner(unit)) then
                    local atk = gU.getState(unit, UNIT_STATE.BASIC_DAMAGE) * 0.3
                    gUnitdata.addTimerAtk(unit, atk, 1.00)
                    local def = gU.getState(unit, UNIT_STATE.ARMOR) * 0.3
                    gUnitdata.addTimerDef(unit, def, 1.00)
                end
            end
        else
            gT.remove()
        end
    end)
end

-- 普攻触发;对敌人
function mt.TL1_Actions(hero, enemy)
    local tla = require 'map.hero.神医.tlA'
    local index = {1, 2, 3, 4, 50, 51, 61, 70, 80}
    for k, v in pairs(index) do
        if tla.TL[v] == 1 then
            print(v)
            mt['TL_' .. v .. '_Actions'](hero, enemy)
        end
    end
end
-- 普攻触发;对友军
function mt.TL2_Actions(hero, enemy)
    local tla = require 'map.hero.神医.tlA'
    local index = {60, 71, 81}
    for k, v in pairs(index) do
        if tla.TL[v] == 1 then
            print(v)
            mt['TL_' .. v .. '_Actions'](hero, enemy)
        end
    end
end
-- 任意伤害触发;对友军
function mt.TL3_Actions(hero, enemy)
    local tla = require 'map.hero.神医.tlA'
    local index = {60, 71, 81}
    for k, v in pairs(index) do
        if tla.TL[v] == 1 then
            print(v)
            mt['TL_' .. v .. '_Actions'](hero, enemy)
        end
    end
end
gTrg.RegAnyUnitDamageEvent(function()
    if not gU.isAlly(GetEventDamageSource(), GetTriggerPlayer()) then
        local source, trgu = GetEventDamageSource(), GetTriggerUnit()
        if IsEventAttackDamage() then -- 普攻
            if gP.isUserPlayer(GetTriggerPlayer()) then
                if gAbi.isHave(source, 'SyEb') or gU.isTypeId(source, 'Sy00') then
                    mt.TL2_Actions(trgu, source)
                end
            else
                if gAbi.isHave(source, 'SyEb') or gU.isTypeId(source, 'Sy00') then
                    mt.TL1_Actions(source, trgu)
                end
            end
        end
    end
end)

return mt

-- 玉蜂1	玉蜂（每次普攻减敌人移速10%，可叠加3次）	普攻
-- 闪电貂2	闪电貂（敌人攻击时20%纪律被定身（对敌人施加净化））	普攻
-- 冰蚕3	冰蚕（攻击时20%几率冰冻敌人）	普攻
-- 西域曼陀罗4	西域曼陀罗（攻击会以每秒消耗敌方1%的蓝量，持续5秒，可刷新）	普攻
-- 人面魔珠50	人面魔珠（攻击附带主属性*0.5额外物理技能伤害）	普攻
-- 彼岸花51	彼岸花（5%几率将敌人（非BOSS）转化为己方单位）	普攻
-- 金鳞幻蝶60	金鳞幻蝶（增加闪避30%）	技能	触发
-- 白鹤灵芝草61	白鹤灵芝草（攻击时回复主属性*0.1的血量）	普攻
-- 杖头双蛇70	杖头双蛇（普工消耗敌人，自己主属性*0.2，的血量蓝量）	普攻
-- 九死还魂草71	九死还魂草（死亡时复活，内置CD5分钟）	技能	触发
-- 赤焰金龟80	赤焰金龟（敌人受到普攻伤害增加30%）	触发
-- 血菩提81	血菩提（减少受到的普攻伤害30%）	触发
-- 朱睛冰蟾90	朱睛冰蟾（处于战斗状态的己方单位每隔5秒清除异常状态一次）	触发
-- 天羽灵香91	天羽灵香（增加己方单位40%攻速、移速）	技能
-- 莽牯朱蛤100	莽牯朱蛤（降低敌方单位30%攻击力、30%护甲值
-- 七星海棠101	七星海棠（增加己方单位30%攻击力、30%护甲值）
-- 玉峰1
-- 闪电貂2
-- 冰蚕3
-- 西域曼陀罗4
-- 人面魔珠50
-- 彼岸花51
-- 金鳞幻蝶60
-- 白鹤灵芝草61
-- 杖头双蛇70
-- 九死还魂草71
-- 赤焰金龟80
-- 血菩提81
-- 朱睛冰蟾90
-- 天羽灵香91
