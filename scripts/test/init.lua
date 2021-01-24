--FogEnable(false)
--FogMaskEnable(false)

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
