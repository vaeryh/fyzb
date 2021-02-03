log = require 'jass.log'
local log = log

-- 分割路径字符串 ：
-- log\log-2021-01-10-16-13-57.log -> log-2021-01-10-16-13-57.log
local function split(str, p)
    local rt = {}
    string.gsub(str, '[^]' .. p .. ']+', function(w)
        table.insert(rt, w)
    end)
    return rt
end
-- 更改默认路径：log\log-2021-01-10-16-13-57.log
log.path = '风云争霸\\日志\\' .. split(log.path, '\\')[2]
--log.path = '风云争霸\\日志\\' .. "loging.log"
log.debug '日志系统装载完毕,向着星辰大海出发!'
-- 重载函数 print
local std_print = print

function print(...)
    log.info(...)
    return std_print(...)
end

local log_error = log.error

function log.error(...)
    local trc = debug.traceback()
    log_error(...)
    log_error(trc)
    std_print(...)
    std_print(trc)
end
