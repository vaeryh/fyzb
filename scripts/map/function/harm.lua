local hero_pro = require 'map.hero.hero_pro'

local mt = {}

-- 伤害系统
function mt.Init_A()
    -- 触发+条件
    gTrg.RegAnyUnitDamageEvent(function()
        -- 双方是敌人
        if not gU.isEnemy(GetEventDamageSource(), GetTriggerPlayer()) then
            return
        end

        local trgU, trgP = GetTriggerUnit(), GetTriggerPlayer()
        local source = GetEventDamageSource()
        local A, B, C, D, E, harm
        local hero_tab = hero_pro.getHeroProTable(trgU)
        local dr_tab = hero_pro.getHeroProTable(source)
        -- 普攻伤害
        if gDam.isAttackDamage() then
            if hero_tab['会心率'] >= GetRandomReal(1, 100) then
                -- 会心伤害A2=A1*会心加成
                A = hero_tab["外功"] * hero_tab['会心加成']
            else
                -- 外功攻击A1
                A = hero_tab["外功"]
            end
            -- 护甲减免B=护甲*0.002/1+护甲*0.002
            B = dr_tab['护甲'] * 0.002 / (1 + dr_tab['护甲'] * 0.002)
            -- 英雄增伤比C
            C = hero_tab['增伤率']
            -- 敌人减伤比D
            D = dr_tab['减伤率']
            -- 敌人减伤值E
            E = dr_tab['固定减伤']
            -- A*(1+B)*(1+C)*(1-D)-E
            harm = A * (1 + B) * (1 + C) * (1 - D) - E
            --printF(A, B, C, D, E, harm)
        else
            if hero_tab['会心率'] >= GetRandomReal(1, 100) then
                -- 会心伤害A2=A1*会心加成
                A = hero_tab["内功"] * hero_tab['会心加成']
            else
                -- 技能伤害A1
                A = hero_tab["内功"]
            end
            -- 魔抗减免B=魔抗*0.002/1+魔抗*0.002
            B = dr_tab['魔抗'] * 0.002 / (1 + dr_tab['魔抗'] * 0.002)
            -- 英雄增伤比C
            C = hero_tab['增伤率']
            -- 敌人减伤比D
            D = dr_tab['减伤率']
            -- 敌人减伤值E
            E = dr_tab['固定减伤']
            -- A*(1+B)*(1+C)*(1-D)-E
            harm = A * (1 + B) * (1 + C) * (1 - D) - E
        end

        -- 伤害显示
        local harm = string.format('%.f', harm)
        gTag.newUnit("|cffff0000" .. harm, 0.027, trgU, 1.66, 190, GetRandomInt(0, 180))
    end)
end

-- 初始化
function mt.Init()
    mt.Init_A()
end

mt.Init()

return mt
