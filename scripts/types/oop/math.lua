local mt = {}

mt.type = 'math'
-- 坐标1
mt.x1, mt.y1 = 0, 0
-- 坐标2
mt.x2, mt.y2 = 0, 0

-- 转换256进制整数
-- id 关联 字符串
mt.id_s = {}
-- 字符串 关联 id
mt.s_id = {}
-- id转字符串并保存
function mt:_id(a)
    local r = ('>I4'):pack(a)
    self.id_s[a] = r
    self.s_id[r] = a
    return r
end
-- 从库中寻找字符串，没有则转换
function mt:id2string(a)
    return self.id_s[a] or self._id(a)
end
-- 字符串转id并保存
function mt.__id2(a)
    local r = ('>I4'):unpack(a)
    self.s_id[a] = r
    self.id_s[r] = a
    return r
end
-- 从库中寻找id，没有则转换
function mt:string2id(a)
    return self.s_id[a] or self.__id2(a)
end

-- 自动转换为id(id直接返回,字符串返回id)
function mt:switchId(value)
    if type(value) == 'number' then
        return value
    elseif type(value) == 'string' then
        return self:s_id(value)
    else
        log.warn(value, type(value), '值不正常')
    end
end

----------------------------------------------------------------------------------------

-- 设置A、B坐标
function mt:setXY(A, B)
    self.x1, self.y1 = mt:getXYByType(A)
    self.x2, self.y2 = mt:getXYByType(B)
end

-- 智能识别类型获取坐标
function mt:getXYByType(xx)
    if xx.type == 'unit' then
        return oU:getXY(xx)
    elseif xx.type == 'item' then
        return oIt:getXY(xx)
    else
        return log.warn("请添加类型方法")
    end
end

----------------------------------------------------------------------------------------

-- 计算两坐标距离
function mt:distanceXY()
    local x = self.x1 - self.x2
    local y = self.y1 - self.y2
    return math.sqrt(x ^ 2 + y ^ 2)
end

-- 计算任意A与B距离
function mt:getDistance(A, B)
    self:setXY(A, B)
    return self:distanceXY()
end

----------------------------------------------------------------------------------------

-- 计算B到A的角度
function mt:angleXY()
    local x = self.x2 - self.x1
    local y = self.y2 - self.y1
    return math.deg(math.atan(y, x))
end

-- 计算任意AB角度
function mt:getAngle(A, B)
    self:setXY(A, B)
    return self:angleXY()
end

----------------------------------------------------------------------------------------

-- 获取极坐标
function mt:getPolar()
    local x = self.x1 + self.dist * Cos(self.angle * math.pi / 180.0)
    local y = self.y1 + self.dist * Sin(self.angle * math.pi / 180.0)
    return x, y
end

-- 获取任意A的极坐标
function mt:getPolarUnit(A, dist, angle)
    self.x1, self.y1 = self:getXYByType(A)
    -- 距离 角度
    self.dist, self.angle = dist, angle
    return self:getPolar()
end

return mt
