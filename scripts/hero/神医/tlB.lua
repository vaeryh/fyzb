function SY_Abi_Spell_TlB_Stop(id) -- 禁止神医光环技能
    for i = 1, 11 do
        SetPlayerAbilityAvailable(Player(lopA), id, false)
    end
end

function SY_Abi_Spell_TlB_Actions(p, hero, id, A)
    SBuer[A] = SBuer[A] * -1
    -- 玉峰1
    if A == 1 then
        if SBuer[A] == 1 then
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefend.blp")
            return
        else
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefendStop.blp")
            return
        end
    end
    -- 闪电貂2
    if A == 2 then
        if SBuer[A] == 1 then
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefend.blp")
            return
        else
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefendStop.blp")
            return
        end
    end
    -- 冰蚕3
    if A == 3 then
        if SBuer[A] == 1 then
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefend.blp")
            return
        else
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefendStop.blp")
            return
        end
    end
    -- 西域曼陀罗4
    if A == 4 then
        if SBuer[A] == 1 then
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefend.blp")
            return
        else
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefendStop.blp")
            return
        end
    end
    -- 人面魔珠50
    if A == 50 then
        if SBuer[A] == 1 then
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefend.blp")
            return
        else
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefendStop.blp")
            return
        end
    end
    -- 彼岸花51
    if A == 51 then
        if SBuer[A] == 1 then
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefend.blp")
            return
        else
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefendStop.blp")
            return
        end
    end
    -- 金鳞幻蝶60
    if A == 60 then
        if SBuer[A] == 1 then
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefend.blp")
            return
        else
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefendStop.blp")
            return
        end
    end
    -- 白鹤灵芝草61
    if A == 61 then
        if SBuer[A] == 1 then
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefend.blp")
            return
        else
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefendStop.blp")
            return
        end
    end
    -- 杖头双蛇70
    if A == 70 then
        if SBuer[A] == 1 then
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefend.blp")
            return
        else
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefendStop.blp")
            return
        end
    end
    -- 九死还魂草71
    if A == 71 then
        if SBuer[A] == 1 then
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefend.blp")
            return
        else
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefend.blp")
            return
        end
    end
    -- 赤焰金龟80
    if A == 80 then
        if SBuer[A] == 1 then
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefend.blp")
            return
        else
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefend.blp")
            return
        end
    end
    -- 血菩提81
    if A == 81 then
        if SBuer[A] == 1 then
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefend.blp")
            return
        else
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefend.blp")
            return
        end
    end
    -- 朱睛冰蟾90
    if A == 90 then
        if SBuer[A] == 1 then
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefend.blp")
            return
        else
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefend.blp")
            return
        end
    end
    -- 天羽灵香91
    if A == 91 then
        if SBuer[A] == 1 then
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefend.blp")
            UnitAddAbility(hero, 'Y091')
            return
        else
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefend.blp")
            UnitRemoveAbility(hero, 'Y091')
            return
        end
    end
    -- 莽牯朱蛤、100
    if A == 100 then
        if SBuer[A] == 1 then
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefend.blp")
            SY_TL_100_Actions('Y100')
            return
        else
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefend.blp")
            return
        end
    end
    -- 七星海棠101
    if A == 101 then
        if SBuer[A] == 1 then
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefend.blp")
            SY_TL_101_Actions('Y101')
            return
        else
            YDWESetUnitAbilityDataString(hero, id, 1, 204, "ReplaceableTextures\\CommandButtons\\BTNDefend.blp")
            return
        end
    end

end
