-- 重载排除相关模块
local function helper_reload(callback)
    local real_require = require
    function require(name, ...)
        if name:sub(1, 5) == 'jass.' then
            return real_require(name, ...)
        end
        if name:sub(1, 6) == 'types.' then
            return real_require(name, ...)
        end
        if not package.loaded[name] then
            return real_require(name, ...)
        end
        package.loaded[name] = nil
        return real_require(name, ...)
    end

    callback()

    require = real_require
end

-- 重载
function reload()
    log.info('---- Reloading start ----')

    -- 重载触发器
    for k, v in ipairs(gTrg.listTrigger) do
        log.debug("trg", k, v)
        gTrg.listTrigger[k] = nil
        gTrg.setPause(v)
        gTrg.remove(v)
    end
    -- 重载计时器与窗口
    for k, v in ipairs(gT.listTimer) do
        log.debug("timer", k, v)
        gT.listTimer[k] = nil
        gT.setPause(v)
        gT.remove(v, nil)
    end
    for k, v in ipairs(gT.listDia) do
        log.debug("tDia", k, v)
        gT.listDia[k] = nil
        gT.remove(nil, v)
    end
    -- 重载单位
    for k, v in ipairs(gU.listUnit) do
        log.debug("unit", k, v)
        gU.listUnit[k] = nil
        gU.remove(v, nil)
    end
    local hero_load = require 'hero.hero_load'
    helper_reload(function()
        -- require 'test.help'
        require 'main copy'
        require 'test.t'
        -- 英雄技能重置

        for i, name in ipairs(hero_load.name) do
            require('hero.' .. name .. '.D')
            require('hero.' .. name .. '.Q')
            require('hero.' .. name .. '.W')
            require('hero.' .. name .. '.E')
            require('hero.' .. name .. '.R')
        end
    end)

    log.info('---- Reloading end   ----')
end
-- -- 函数重载
-- reload_module = function(name)
--     for key, val in pairs(package.loaded) do
--         if key == name then
--             package.loaded[key] = nil
--             return require(key)
--         end
--     end
--     return require (name)
-- end

-- ESC重载函数
-- local trig = yh.createTrigger(function()
--     --reload_module('test.t')
--     --require 'test.t'
--     reload()
-- end)
-- TriggerRegisterPlayerEvent(trig, Player(0), EVENT_PLAYER_END_CINEMATIC)
