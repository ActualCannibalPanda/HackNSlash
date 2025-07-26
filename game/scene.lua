local Class = require("lua.objects.class")
local Scene = Class({
    objects = {},
})

function Scene:addObject(obj)
    table.insert(self.objects, obj)
end

function Scene:addObjects(...)
    for _, obj in ipairs({ ... }) do
        table.insert(self.objects, obj)
    end
end

function Scene:init()
end

function Scene:update(dt)
    for _, obj in pairs(self.objects) do
        obj:update(dt)
    end
end

function Scene:draw()
    for _, obj in pairs(self.objects) do
        obj:draw()
    end
end

function Scene:input(key, scancode, isrepeat)
end

return Scene
