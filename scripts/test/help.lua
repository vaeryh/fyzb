log = require 'jass.log'

local mt = {}
-- 重载排除相关模块
local function helper_reload(callback)
    local real_require = require
    function require(name, ...)
        -- if name:sub(1, 5) == 'jass.' then
        --     return real_require(name, ...)
        -- end
        -- if name:sub(1, 6) == 'types.' then
        --     return real_require(name, ...)
        -- end
        -- if name:sub(1, 6) == 'scope.' then
        --     return real_require(name, ...)
        -- end
        -- if name:sub(1, 8) == 'library.' then
        --     return real_require(name, ...)
        -- end
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
function mt.reload()
    log.info('---- Reloading start ----')

    -- 重载触发器
    for k, v in ipairs(gTrg.listTrigger) do
        log.debug("trg", k, v)
        --gTrg.listTrigger[k] = nil
        gTrg.setClose(v)
        gTrg.remove(v)
    end
    -- 重载计时器与窗口
    for k, v in ipairs(gT.listTimer) do
        log.debug("timer", k, v)
        --gT.listTimer[k] = nil
        gT.setPause(v)
        gT.remove(v, nil)
    end
    for k, v in ipairs(gT.listDia) do
        log.debug("tDia", k, v)
        --gT.listDia[k] = nil
        gT.remove(nil, v)
    end
    -- 重载单位
    for k, v in ipairs(gU.listUnit) do
        log.debug("unit", k, v)
        --gU.listUnit[k] = nil
        gU.remove(v, nil)
    end
    -- 重载多面板
    for k, v in ipairs(gDmb.listBoard) do
        log.debug("Dmb", k, v)
        --gDmb.listBoard[k] = nil
        gDmb.remove(v)
    end
    -- 重载Frame
    log.info('---- Reload Frame ----')
    for k, v in ipairs(gDz.listFrame) do
        log.debug("Frame", k, v)
        --gDz.listFrame[k] = nil
        --gDz.FrameShow(v, false)
        gDz.DestroyFrame(v)
    end

    local hero_load = require 'hero.hero_load'
    helper_reload(function()
        require 'main'
        -- require 'test.t'
        -- 英雄技能重置
        for i, name in ipairs(hero_load.name) do
            require('hero.' .. name .. '.D')
            require('hero.' .. name .. '.Q')
            require('hero.' .. name .. '.W')
            require('hero.' .. name .. '.E')
            require('hero.' .. name .. '.R')
        end
        require 'hero.神医.tlA'
        require 'hero.神医.tlC'
    end)

    log.info('---- Reloading end   ----')
end

return mt
