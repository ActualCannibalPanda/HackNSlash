local Scene = {
    objects = {},
}

function Scene:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Scene:addObject(obj)
    table.insert(self.objects, obj)
end

function Scene:addObjects(...)
    for _, obj in pairs({ ... }) do
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
