local mt = {}

-- 英雄列表
Hero = {}

-- 选择矩形
mt['选择英雄矩形'] = gg_rct_FirstHeroSelection
mt['主城矩形'] = gg_rct_TheMainBase
mt['回城矩形'] = gg_rct_HG

-- 复活英雄
function mt.ReHero()
    local hero = GetTriggerUnit()
    local player = GetOwningPlayer(hero)
    local Lev = GetHeroLevel(hero)
    local tmr, twd = gT.new(GetUnitName(hero) .. "复活时间倒计时", true)
    local x, y = gRect.getCenter(mt['回城矩形'])

    if Lev >= 10 then
        Lev = 10
    end

    TimerStart(tmr, Lev, false, function()
        ReviveHero(hero, x, y, true) -- revive hero
        -- 移动镜头
        if player == GetLocalPlayer() then
            PanCameraToTimed(x, y, 0.33)
            SelectUnit(hero, true) -- 细节：移动镜头后玩家选择一下单位
        end
        gT.remove(tmr, twd)
    end)
end

-----------------------------------------------------------------------------
-- 双击选择英雄:每个玩家注册一个触发：用完就删除，保证1个选择英雄
function mt.selectHero()
    local thisP, thisU = GetTriggerPlayer(), GetTriggerUnit()

    if GetUnitUserData(thisU) == GetPlayerId(thisP) + 1 then
        DisplayTimedTextToPlayer(thisP, 0, 0, 20, GetPlayerName(thisP) .. "选择了" .. GetUnitName(thisU) .. '!')
        SetUnitOwner(thisU, thisP, true) -- 改变单位所属为触发玩家
        -- 记录玩家英雄
        Hero[thisP] = thisU
        -- 设置可用区域
        -- 启用- 新建可见度修正器，盟友共享视野，不覆盖单位视野
        gFog.start(gFog.createFog(thisP, mt['主城矩形']))
        -- 设置玩家可用地图区域=默认可用地图区域
        if GetLocalPlayer() == thisP then
            gCamera.setCameraBounds(gRect.getAbleArea)
        end
        -- 传送
        gYh.MoveAndCamera(thisU, gRect.getCenter(mt['回城矩形']))
        -- 添加 触发单位死亡 事件
        gTrg.RegUnitEvent(thisU, gTrg.EVENT_UNIT.DEATH, mt.ReHero)
        --  删除触发
        gTrg.remove()
    else
        SetUnitUserData(thisU, GetPlayerId(thisP) + 1) -- 设置单位自定义值为触发玩家ID
        TimerStart(CreateTimer(), 0.33, false, function()
            SetUnitUserData(thisU, 0)
            gT.remove()
        end)
    end
end
-- 限制一个玩家只能选择1个英雄
for i = 0, 11 do
    if gP.isUserPlayer(i) then
        gTrg.RegPlayerUnitEvent(Player(i), gTrg.EVENT_PLAYER_UNIT.SELECTED, mt.selectHero)
    end
end

return mt
