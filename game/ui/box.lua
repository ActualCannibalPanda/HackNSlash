local Utils = require("game.utils")

local Box = {
    x = 0,
    y = 0,
    width = 100,
    height = 100,
    color = { 0.4, 0.4, 0.9, 0.9 }
}

function Box:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Box:update(dt)
end

function Box:draw()
    Utils.preserveColor(function()
        Utils.draw(
            function()
                love.graphics.translate(self.x, self.y)
                love.graphics.setColor(self.color)
                love.graphics.rectangle("fill", 0, 0, self.width, self.height)
            end)
    end)
end

return Box
