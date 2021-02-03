local mt = {}
SBuer = {}

function mt.Actions(hero, id)
    local p, id = GetTriggerPlayer(), GetSpellAbilityId()
    local n = 0
    local A = gSlk.getDataAbi(id, "EditorSuffix")
    local Tip1 = gSlk.getDataAbi(id, "Tip1")

    if SBuer[A] == 0 then
        gP.disTimedText(p, 2.00, "你未获得任何图录！")
        return
    end
    -- 判断图录开启个数
    for i = 1, 101 do
        if SBuer[i] == 1 then
            n = n + 1
        end
    end
    -- 图录可开数量
    if n == 3 then
        gP.disTimedText(p, 2.00, "图录可开数量已达上限！！！")
        if SBuer[A] == 1 then
        else
            return
        end
    end

    if SBuer[A] == -1 then
        gP.disTimedText(p, 2.00, "开启：" + Tip1)
    else
        gP.disTimedText(p, 2.00, "关闭：" + Tip1)
    end

    SY_Abi_Spell_TlB_Actions(p, hero, id, A)

end

-- 触发+动作
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.SPELL_EFFECT, function()
    if gSlk.getDataAbi(GetSpellAbilityId(), 'Name') == '图录' then
        mt.Actions(GetTriggerUnit())
    end
end)
