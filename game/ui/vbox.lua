local Utils = require("game.utils")

local VBox = {
    x = 0,
    y = 0,
    width = 100,
    height = 100,
    paddingLeft = 4,
    paddingTop = 4,
    color = { 0.4, 0.4, 0.9, 0.9 },
    backgroundColor = { 0.2, 0.2, 0.9, 0.9 },
    objects = {}
}

function VBox:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function VBox:addObject(o)
    table.insert(self.objects, o)
end

function VBox:addObjects(...)
    for _, obj in pairs({ ... }) do
        table.insert(self.objects, obj)
    end
end

function VBox:update(dt)
end

function VBox:draw()
    Utils.preserveColor(function()
        Utils.draw(function()
            love.graphics.translate(self.x, self.y)
            love.graphics.setColor(self.color)
            love.graphics.rectangle("fill", 0, 0, self.width, self.height)
            local y = 0
            for _, obj in pairs(self.objects) do
                love.graphics.setColor(self.backgroundColor)
                love.graphics.rectangle("fill", self.paddingTop, self.paddingLeft,
                    self.width - self.paddingLeft * 2,
                    self.height - self.paddingTop * 2)
                love.graphics.push()
                love.graphics.translate(self.paddingLeft, self.paddingTop)
                obj:draw()
                love.graphics.pop()
                love.graphics.translate(0, obj.height)
            end
        end)
    end)
end

return VBox
