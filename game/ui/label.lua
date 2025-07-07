local Utils = require("game.utils")

local Label = {
    x = 0,
    y = 0,
    width = 20,
    height = 20,
    color = { 0.9, 0.9, 0.9, 1.0 },
    text = "@",
    fontSize = 16
}

function Label:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Label:update(dt)
end

function Label:draw()
    Utils.preserveColor(function()
        Utils.draw(function()
            love.graphics.translate(self.x, self.y)
            love.graphics.setColor(self.color)
            love.graphics.setNewFont(self.fontSize)
            love.graphics.print(self.text, 0, 0)
        end)
    end)
end

return Label
