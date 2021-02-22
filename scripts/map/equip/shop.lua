local shop = require 'types.oop.shop'

local mt = {}
setmetatable(mt, mt)
mt.__index = shop

--mt.owner = Player(0)
-- 商店
-- local mt = {}
-- 武器：刀
mt.wq_dao = {
    id = 'wq01',
    xy = {-4600.00, -8882.0},
}
-- 武器：枪
mt.wq_qiang = {
    id = 'wq02',
    xy = {-4200.00, -8882.0}
}
-- 武器：剑
mt.wq_jian = {
    id = 'wq03',
    xy = {-3800.00, -8882.0}
}
-- 武器：扇
mt.wq_shan = {
    id = 'wq04',
    xy = {-3400.00, -8882.0}
}
-- 武器：弓
mt.wq_gong = {
    id = 'wq05',
    xy = {-3000.00, -8882.0}
}
-- 武器：机关
-- mt.wq_jiguang = {
--     id = 'wq03',
--     xy = {}
-- }

-- 防具：男
mt.fj_man = {
    id = 'fj01',
    xy = {-4600.00, -9282.0}
}
-- 防具：女
mt.fj_woman = {
    id = 'fj02',
    xy = {-3000.00, -9282.0}
}

-- 饰品：项链
mt.sp_xl = {
    id = 'sp01',
    xy = {-4600.00, -9682.0}
}
-- 饰品：玉佩
mt.sp_yp = {
    id = 'sp02',
    xy = {-4200.00, -9682.0}
}
-- 饰品：手镯
mt.sp_sz = {
    id = 'sp03',
    xy = {-3800.00, -9682.0}
}

-- 鞋子：1
mt.xz_1 = {
    id = 'xz01',
    xy = {-3400.00, -9682.0}
}
-- 鞋子：2
mt.xz_2 = {
    id = 'xz02',
    xy = {-3000.00, -9682.0}
}

mt:initPool()

return mt
