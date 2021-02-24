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
    -- ****很重要，不能删除
    require = real_require
end

-- 重载
function mt.reload()
    log.fatal('---- Reloading start ----')

    -- 重载触发器
    gTrg:reload()
    -- 重载计时器与窗口
    gT:reload()
    -- 重载单位
    gU:reload()
    -- 重载物品
    gIt:reload()
    -- 重载多面板
    gDmb:reload()
    -- 重载Frame
    gDz:reload()

    helper_reload(function()
        require 'main'
    end)

    log.fatal('---- Reloading end   ----')
end

return mt
