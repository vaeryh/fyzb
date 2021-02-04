-- 轩辕剑:统四海：你身旁每有一个敌方单位，你的攻击提升5%；（BOSS的效果为5倍）
-- 轩辕剑:御万民：你身旁每有一个友军单位，你的防御增加5%；（英雄的效果为5倍）
local mt={}

function mt.Actions(hero)
    local atk, def = gU.getState(hero, UNIT_STATE.BASIC_DAMAGE), gU.getState(hero, UNIT_STATE.ARMOR)
    gT.loop(1, function()
        local nyj, ndr = -5, 0
        local dwz = gGroup.getUnitInRange(GetUnitX(hero), GetUnitY(hero), 600)

        for i, unit in ipairs(dwz) do
            if not gU.isType(unit, UNIT_TYPE.STRUCTURE) and not gU.isType(unit, UNIT_TYPE.STRUCTURE) then
                if gU.isEnemy(unit, gU.getOwner(hero)) then -- 不是盟友即敌人
                    if gU.isType(unit, UNIT_TYPE.HERO) then
                        ndr = ndr + 5
                    else
                        ndr = ndr + 1
                    end
                else
                    if gU.isType(unit, UNIT_TYPE.HERO) then
                        nyj = nyj + 5
                    else
                        nyj = nyj + 1
                    end
                end
            end
        end

        atk = atk * ndr * 0.05
        def =def * nyj * 0.05
        gP.disTimedText(Player(0), 10, "敌人增量：" .. I2S(ndr) .. "=" .. R2S(atk))
        gP.disTimedText(Player(0), 10, "友军增量：" .. I2S(nyj) .. "=" .. R2S(def))
        gUnitdata.adjustAtk(hero, atk) -- 攻击
        gUnitdata.adjustDef(hero, def) -- 防御

        gT.wait(1, function()
            gUnitdata.adjustAtk(hero, -atk) -- 攻击
            gUnitdata.adjustDef(hero, -def) -- 防御
        end)
        --失去轩辕剑，关闭计时器
        if not gIt.isHave(hero, 'sq07') then
            gT.remove()
        end
    end)
end

gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.PICKUP_ITEM,function ()
    local trgItem, trgU = GetManipulatedItem(), GetManipulatingUnit()
    if gIt.isMatchTypeId(trgItem, 'sq07') then -- 轩辕剑，计时器判断是否拥有，无需设置丢弃动作
        mt.Actions()
    end
end)
