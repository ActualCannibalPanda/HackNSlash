local Utils = require("game.utils")
local Tile = {
    x = 0,
    y = 0,
    size = 10,
    data = {},
}
local Map = {
    x = 0,
    y = 0,
    width = 10,
    height = 10,
    tileSize = 10,
    tiles = {}
}

function Tile:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Map:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Map:update(dt)
end

function Map:draw()
    Utils.preserveColor(function()
        Utils.draw(function()
            love.graphics.translate(self.x, self.y)
            for y = 1, self.height + 1, 1 do
                for x = 1, self.width + 1, 1 do
                    love.graphics.setColor(self.tiles[y + x * self.width].data.color)
                    love.graphics.rectangle("fill", x * self.tileSize, y * self.tileSize,
                        self.tileSize, self.tileSize)
                end
            end
        end)
    end)
end

return {
    Map = Map,
    Tile = Tile,
}
