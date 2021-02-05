local mt = {}
-- 状态
mt.TL = {}

for i = 1, 101 do
    mt.TL[i] = -1
end

-- 图标
mt.Art = {
    [1] = {"CommandButtons\\BTNDefend.blp", "CommandButtons\\BTNDefendStop.blp"},
    [2] = {"CommandButtons\\BTNDefend.blp", "CommandButtons\\BTNDefendStop.blp"},
    [3] = {"CommandButtons\\BTNDefend.blp", "CommandButtons\\BTNDefendStop.blp"},
    [4] = {"CommandButtons\\BTNDefend.blp", "CommandButtons\\BTNDefendStop.blp"},
    [50] = {"CommandButtons\\BTNDefend.blp", "CommandButtons\\BTNDefendStop.blp"},
    [51] = {"CommandButtons\\BTNDefend.blp", "CommandButtons\\BTNDefendStop.blp"},
    [60] = {"CommandButtons\\BTNDefend.blp", "CommandButtons\\BTNDefendStop.blp"},
    [61] = {"CommandButtons\\BTNDefend.blp", "CommandButtons\\BTNDefendStop.blp"},
    [70] = {"CommandButtons\\BTNDefend.blp", "CommandButtons\\BTNDefendStop.blp"},
    [71] = {"CommandButtons\\BTNDefend.blp", "CommandButtons\\BTNDefendStop.blp"},
    [80] = {"CommandButtons\\BTNDefend.blp", "CommandButtons\\BTNDefendStop.blp"},
    [81] = {"CommandButtons\\BTNDefend.blp", "CommandButtons\\BTNDefendStop.blp"},
    [90] = {"CommandButtons\\BTNDefend.blp", "CommandButtons\\BTNDefendStop.blp"},
    [91] = {"CommandButtons\\BTNDefend.blp", "CommandButtons\\BTNDefendStop.blp"},
    [100] = {"CommandButtons\\BTNDefend.blp", "CommandButtons\\BTNDefendStop.blp"},
    [101] = {"CommandButtons\\BTNDefend.blp", "CommandButtons\\BTNDefendStop.blp"}
}
--
function mt.Actions1(hero, id)
    local n = 0
    local A = gSlk.getAbiInt(id, "EditorSuffix")

    if mt.TL[A] == 0 then
        gP.disTimedText(gU.getOwner(hero), 2.00, "你未获得该图录！")
        return
    end
    -- 判断图录开启个数
    for i = 1, 101 do
        if mt.TL[i] == 1 then
            n = n + 1
        end
    end
    -- 图录可开数量
    if n == 3 then
        gP.disTimedText(gU.getOwner(hero), 2.00, "图录可开数量已达上限！！！")
        if mt.TL[A] == 1 then
        else
            return
        end
    end
    -- 动作生效
    mt.TL[A] = mt.TL[A] * -1
    -- 图标
    if mt.TL[A] == 1 then -- 明图标
        gP.disTimedText(gU.getOwner(hero), 2.00, "开启：" .. gSlk.getAbiString(id, "Tip1"))
        gAbi.setDataString(hero, id, nil, ABILITY_DATA.ART, 'ReplaceableTextures\\' .. mt.Art[A][1])
    elseif mt.TL[A] == -1 then -- 暗图标
        gP.disTimedText(gU.getOwner(hero), 2.00, "关闭：" .. gSlk.getAbiString(id, "Tip1"))
        gAbi.setDataString(hero, id, nil, ABILITY_DATA.ART, 'ReplaceableTextures\\' .. mt.Art[A][2])
    end
    -- 开启即生效
    local tlc = require 'hero.神医.tlC'
    if A == 90 then
        tlc.TL_90_Actions(hero) -- 朱睛冰蟾90
    elseif A == 91 then
        tlc.TL_91_Actions(hero) -- 天羽灵香91
    elseif A == 100 then
        tlc.TL_100_Actions(hero) -- 莽牯朱蛤100	莽牯朱蛤（降低敌方单位30%攻击力、30%护甲值
    elseif A == 101 then
        tlc.TL_101_Actions(hero) -- 七星海棠101	七星海棠（增加己方单位30%攻击力、30%护甲值）
    end
end

-- 触发+动作
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.SPELL_EFFECT, function()
    if gSlk.getAbiString(GetSpellAbilityId(), 'Name') == '图录' then
        mt.Actions1(GetTriggerUnit(), GetSpellAbilityId())
    end
end)

return mt
