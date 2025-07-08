local Tile = require("game.map").Tile
local map = {}

for y = 1, 11, 1 do
    for x = 1, 11, 1 do
        table.insert(map, Tile:new {
            x = x,
            y = y,
            size = 10,
            data = {
                color = { 0.2, 0.9, 0.2, 1.0 }
            }
        })
    end
end

return map
