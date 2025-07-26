local Class = require("lua.objects.class")
local Utils = require("game.utils")

local Label = Class({
    x = 0,
    y = 0,
    width = 20,
    height = 20,
    color = { 0.9, 0.9, 0.9, 1.0 },
    text = "@",
    fontSize = 16
})

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
