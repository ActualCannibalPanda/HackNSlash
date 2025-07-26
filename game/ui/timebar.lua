local Class = require("lua.objects.class")
local Utils = require("game.utils")

local TimeBar = Class({
    x = 100,
    y = 100,
    width = 100,
    height = 25,
    barOverflow = 4,
    targetOverflow = 6,
    min = 0,
    max = 100,
    targetStart = 70,
    targetEnd = 90,
    current = 0,
    baseColor = { 0.9, 0.2, 0.2, 1.0 },
    barColor = { 0.2, 0.9, 0.2, 1.0 },
    targetColor = { 0.9, 0.9, 0.2, 0.8 },
    hitAt = -1,
    observer = nil
})

function TimeBar:update(dt)
    self.current = self.current + 1
    if self.current > self.max then
        self.current = 0
    end

    if self.hitAt ~= -1 then
        if self.hitAt >= self.targetStart and self.hitAt <= self.targetEnd then
            if self.observer ~= nil then
                self.observer(true)
                self.hitAt = -1
            end
        else
            if self.observer ~= nil then
                self.observer(false)
                self.hitAt = -1
            end
        end
        self.current = self.min
    end
end

function TimeBar:input()
    if self.hitAt == -1 then
        self.hitAt = self.current
    end
end

function TimeBar:draw()
    Utils.preserveColor(function()
        Utils.draw(function()
            local fillWidth = self.width * (self.current / self.max)
            love.graphics.translate(self.x, self.y)
            love.graphics.shear(-0.5, 0.0)
            love.graphics.setColor(self.baseColor)
            love.graphics.rectangle("fill", 0, 0, self.width, self.height)
            love.graphics.setColor(self.barColor)
            love.graphics.rectangle("fill", 0, -self.barOverflow / 2, fillWidth, self.height + self.barOverflow)
            love.graphics.setColor(self.targetColor)
            love.graphics.rectangle("fill", self.width * (self.targetStart / self.max), -self.targetOverflow / 2,
                self.width * ((self.targetEnd - self.targetStart) / self.max), self.height + self.targetOverflow)
        end)
    end)
end

return TimeBar
