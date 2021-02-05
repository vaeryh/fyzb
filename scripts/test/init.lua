function printF(a, b, c, d, e, f)
    local msg = string.format("%s %s %s %s %s %s ",a, b, c, d, e, f)
    DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 2, msg)
end
-- 控制台输入
-- require 'test.console_read'
-- 函数重载
require 'test.help'
--
require 'test.tip'
-- 日志
require 'test.log'

--require 'test.error'

require 'test.stake'

require 'test.check'
