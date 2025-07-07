local Box = { x = 0, y = 0, width = 100, height = 100, color = { 0.4, 0.4, 0.9, 0.9 } }

function Box:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Box:update(dt)
end

function Box:draw()
    local r, g, b, a = love.graphics.getColor()

    love.graphics.push()
    love.graphics.translate(self.x, self.y)
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", 0, 0, self.width, self.height)
    love.graphics.pop()

    love.graphics.setColor(r, g, b, a)
end

return Box
