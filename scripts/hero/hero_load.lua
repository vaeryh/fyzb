local map = require 'map.global'

-- 英雄载入
local mt = {}

mt.name = {'凤舞', '聂风', '断浪', '秦霜', '步惊云', '神医'}

-- 英雄表
mt.hero_Tab = {}

-- 英雄物编ID表
mt.hero_Id = {}

-- 选择英雄矩形
mt.rect_choose = map.rect['选择英雄矩形']

-- 选择英雄音乐
mt.sound_choose = map.sound['选择英雄音乐']

-- 基地附近音乐
mt.sound_home = map.sound['基地附近音乐']

-- 展示英雄时间
mt.showT = 30

-- 删除未选择英雄
local function removeUnSelected(tab)
    gT.wait(mt.showT, function()
        for i, v in ipairs(tab) do
            if gU.getOwner(v) == Player(15) then
                gU.remove(v)
            end
        end
        -- 播放背景音乐
        gSound.PlayMusic(mt.sound_home)
    end)
end

-- 展示英雄
local function showHero()
    local tab = {}
    local minx, maxy = gRect.getMinX(mt.rect_choose) + 100, gRect.getMaxY(mt.rect_choose) - 100
    for i, id in ipairs(mt.hero_Id) do
        local x, y = 0, 0
        if i <= 3 then
            x, y = minx + i * 200, maxy
        else
            x, y = minx + (i - 3) * 200, maxy - 300
        end
        local u = gU.create(Player(15), id, x, y, 270)
        table.insert(tab, u)
    end
    removeUnSelected(tab)
end

-- 获取英雄表信息
local function init_tab()
    for k, v in ipairs(mt.name) do
        local hero_tab = require('hero.' .. v .. '.init')
        if type(hero_tab) == 'table' then
            -- 英雄表
            table.insert(mt.hero_Tab, hero_tab)
            -- id表
            table.insert(mt.hero_Id, hero_tab.id)
        end
    end
end

-- 环境
local function environment()
    -- 创建可见度修正器
    gFog.start(gFog.createFog(Player(0), mt.rect_choose))
    gCamera.setCameraBounds(mt.rect_choose)
    -- 音乐不要在地图载入前播放
    gTrg.RegTimerEvent(0.00, false, function()
        gSound.PlayMusic(mt.sound_choose)

        gTrg.remove()
    end)
end

-- 初始化
function mt.init()
    init_tab()
    environment()
    showHero()
end


return mt
