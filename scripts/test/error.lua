local runtime = require 'jass.runtime'
local jass = require 'jass.common'

local log = log

local msgs = {}

-- 错误汇报
function base.error_handle(msg)
    print("------------------error_handle---------------------")
    DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 20, msg)
    log.error(msg)
    print("-----------------error_handle----------------------")
end
