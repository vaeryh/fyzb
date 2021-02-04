local mt = {}
local tla = require 'hero.神医.tlA'

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
function mt.TlB_Stop(id) -- 禁止神医光环技能
    for i = 1, 11 do
        gAbi.setAvailable(Player(i), id, false)
    end
end

function mt.TlB_Actions(hero, id, A)
    local index

    tla.TL[A] = tla.TL[A] * -1

    if tla.TL[A] == 1 then
        index = 1
    elseif tla.TL[A] == -1 then
        index = 2
    end
    print(A, index, mt.Art[A][index])
    gAbi.setDataString(hero, id, 1, ABILITY_DATA.ART, 'ReplaceableTextures\\' .. mt.Art[A][index])

    if A == 91 then
        if tla.TL[A] == 1 then
            gAbi.add(hero, 'Y091')
        else
            gAbi.remove(hero, 'Y091')
        end
    end
    -- 莽牯朱蛤、100
    if A == 100 then
        if tla.TL[A] == 1 then
            tlc.TL_100_Actions('Y100')
        else

        end
    end
    -- 七星海棠101
    if A == 101 then
        if tla.TL[A] == 1 then
            tlc.TL_101_Actions('Y101')
        else

        end
    end
end

return mt
