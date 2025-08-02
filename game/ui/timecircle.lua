local Class = require("lua.objects.class")
local Utils = require("game.utils")

local TimeCircle = Class({
    x = 100,
    y = 100,
    innerRadius = 10,
    outerRadius = 20,
    barOverflow = 4,
    targetOverflow = 6,
    min = 0,
    max = 100,
    targetStart = 70,
    targetEnd = 90,
    current = 0,
    baseColor = { 0.9, 0.2, 0.2, 1.0 },
    barColor = { 0.2, 0.9, 0.2, 1.0 },
    targetColor = { 1.9, 0.9, 0.2, 0.8 },
    hitAt = -1,
    observer = nil
})

function TimeCircle:update(dt)
    local x, y = love.mouse.getPosition()
    self.x = x
    self.y = y
    -- self.current = self.current + 1
    -- if self.current > self.max then
    --     self.current = 0
    -- end

    -- if self.hitAt ~= -1 then
    --     if self.hitAt >= self.targetStart and self.hitAt <= self.targetEnd then
    --         if self.observer ~= nil then
    --             self.observer(true)
    --             self.hitAt = -1
    --         end
    --     else
    --         if self.observer ~= nil then
    --             self.observer(false)
    --             self.hitAt = -1
    --         end
    --     end
    --     self.current = self.min
    -- end
end

function TimeCircle:input()
    -- if self.hitAt == -1 then
    --     self.hitAt = self.current
    -- end
end

function TimeCircle:draw()
    local canvasSize = self.outerRadius * 2
    local canvas = love.graphics.newCanvas(canvasSize)
    Utils.preserveColor(function()
        Utils.draw(function()
            love.graphics.setCanvas(canvas)
            love.graphics.clear(0, 0, 0, 0)
            love.graphics.setColor(0.9, 0.3, 0.3, 1.0)
            love.graphics.circle("fill", canvasSize / 2, canvasSize / 2, self.outerRadius)
            love.graphics.flushBatch()
            love.graphics.setBlendMode("replace")
            love.graphics.setColor(1.0, 1.0, 1.0, 0.0)
            love.graphics.circle("fill", canvasSize / 2, canvasSize / 2, self.innerRadius)
            love.graphics.setCanvas()


            love.graphics.setBlendMode("alpha", "premultiplied")
            love.graphics.draw(canvas, self.x, self.y)
            love.graphics.setBlendMode("alpha")
        end)
    end)
end

return TimeCircle
