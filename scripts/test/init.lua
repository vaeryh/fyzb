FogEnable(false)
FogMaskEnable(false)

-- 打印文本
printF = function(str, i)
    i = i or 0
    DisplayTimedTextToPlayer(Player(i), 0, 0, 20, str)
end

-- 学习库
-- require 'test.yhlearn'
-- 控制台输入
-- require 'test.console_read'
-- 函数重载
require 'test.help'
-- 时间
require 'lua.yh.time'
-- jass.message
require 'lua.yh.message'

local hook = require 'jass.hook'

function hook.CreateUnit(pid, uid, x, y, face, realCreateUnit)
    -- 当jass内调用CreateUnit时，就会被执行
    print('CreateUnit')
    print(type(x))
    return realCreateUnit(pid, uid, x, y, face)
end

local jass = require 'jass.common'
local dbg = require 'jass.debug'
print('获取创建单位定义', table.unpack(dbg.functiondef(jass.GetUnitX)))
