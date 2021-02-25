local map = require 'map.global'
local hero_Pro = require 'map.hero.hero_pro'

local mt = {}

Hero = {}

-- 选择矩形
mt.rect_choose = map.rect['选择英雄矩形']

-- 主城矩形
mt.rect_home = map.rect['主城矩形']

-- 回城矩形
mt.rect_hg = map.rect['回城矩形']

-- 复活英雄
function mt.ReHero(hero)
    gTrg.RegUnitEvent(hero, EVENT_UNIT.DEATH, function()
        local hero, trgP = GetTriggerUnit(), GetOwningPlayer(GetTriggerUnit())
        local Lev = GetHeroLevel(hero)
        local tmr, twd = gT.new(GetUnitName(hero) .. "复活时间倒计时", true)
        local x, y = gRect.getCenter(mt.rect_hg)

        if Lev >= 10 then
            Lev = 10
        end

        TimerStart(tmr, Lev, false, function()
            ReviveHero(hero, x, y, true) -- revive hero
            -- 移动镜头
            if trgP == GetLocalPlayer() then
                PanCameraToTimed(x, y, 0.33)
                SelectUnit(hero, true) -- 细节：移动镜头后玩家选择一下单位
            end
            gT.remove(tmr, twd)
        end)
    end)
end

-----------------------------------------------------------------------------
-- 双击选择英雄:每个玩家注册一个触发：用完就删除，保证1个选择英雄
function mt.selectHero()
    local thisP, thisU = GetTriggerPlayer(), GetTriggerUnit()

    if GetUnitUserData(thisU) == GetPlayerId(thisP) + 1 then
        local str = GetPlayerName(thisP) .. "选择了" .. GetUnitName(thisU) .. '!'
        gP.disTimedText(thisP, 20.00, str)
        SetUnitOwner(thisU, thisP, true) -- 改变单位所属为触发玩家
        Hero[thisP] = thisU
        -- 启用- 新建可见度修正器，盟友共享视野，不覆盖单位视野
        --gFog.start(gFog.createFog(thisP, mt.rect_home))
        -- 设置玩家可用地图区域=默认可用地图区域
        --gCamera.setCameraBounds(gRect.getAbleArea, thisP)
        -- 传送
        -- gYh.MoveAndCamera(thisU, gRect.getCenter(mt.rect_hg))
        --gYh.MoveAndCamera(thisU, -3807, -9189)
        -- 英雄初始化
        hero_Pro.Init_B(thisU)
        gIt.createAddUnit(thisU, gIt.getRandom(GetRandomInt(1,5)), 0)
        gIt.createAddUnit(thisU, gIt.getRandom(GetRandomInt(1,5)), 1)
        gIt.createAddUnit(thisU, gIt.getRandom(GetRandomInt(1,5)), 2)
        gIt.createAddUnit(thisU, gIt.getRandom(GetRandomInt(1,5)), 3)
        -- 注册英雄复活
        mt.ReHero(thisU)
        --
        gH.setUpLevel(thisU, 50, true)
        --  删除触发
        gTrg.remove()
    else
        SetUnitUserData(thisU, GetPlayerId(thisP) + 1) -- 设置单位自定义值为触发玩家ID
        gT.wait(0.33, function()
            SetUnitUserData(thisU, 0)
        end)
    end
end
-- 限制一个玩家只能选择1个英雄
for i = 0, 11 do
    if gP.isUserPlayer(Player(i)) then
        gTrg.RegPlayerUnitEvent(Player(i), EVENT_PLAYER_UNIT.SELECTED, mt.selectHero)
    end
end

return mt
