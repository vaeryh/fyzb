local map = require 'map.global'

local mt = {}

-- 选择英雄矩形
mt.rect_choose = map.rect['选择英雄矩形']

-- 选择英雄音乐
mt.sound_choose = map.sound['选择英雄音乐']

-- 基地附近音乐
mt.sound_home = map.sound['基地附近音乐']

-- 可见度修正器
mt.initfog = nil

-- 选择区域内单位
function GetUnitsInRectMatching(r)
    local g = CreateGroup()
    GroupEnumUnitsInRect(g, r, nil)
    DestroyBoolExpr(nil)
    return g
end

-- 进入地图触发动作
gTrg.RegTimerEvent(0.00, false, function()
    -- 创建可见度修正器
    mt.initfog = gFog.createFog(Player(0), mt.rect_choose)
    gFog.start(mt.initfog)
    gCamera.setCameraBounds(mt.rect_choose)
    gSound.PlayMusic(mt.sound_choose)

    mt.func1()
    gTrg.remove()
end)

function mt.func1()
    -- 启用计时器
    TimerStart(CreateTimer(), 30.00, false, function()
        -- 播放背景音乐
        gSound.PlayMusic(mt.sound_home)
        -- 删除未选取英雄
        local whichGroup
        local whichUnit
        whichGroup = GetUnitsInRectMatching(mt.rect_choose)
        for i = 1, 10 do
            whichUnit = FirstOfGroup(whichGroup)
            GroupRemoveUnit(whichGroup, whichUnit)
            if GetOwningPlayer(whichUnit) == Player(15) then
                RemoveUnit(whichUnit)
            end
        end
        -- 删除单位组
        gGroup.remove(whichGroup)
        -- 删除可见度修正器
        gFog.remove(mt.initfog)
        -- 清除计时器
        gT.remove()
    end)
end
