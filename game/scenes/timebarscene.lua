local Scene = require("game.scene"):new()

local wasCorrect = nil

local function observer(correct)
    if correct then
        wasCorrect = true
    else
        wasCorrect = false
    end
end

local TimeBar = require("game.ui.timebar"):new {
    x = 200,
    y = 200,
    current = 50,
    width = 100,
    height = 25,
    observer = observer
}
local TextPos = { x = 200, y = 180 }

local scene_init = Scene.init
local scene_draw = Scene.draw
local scene_update = Scene.update

function Scene:init()
    scene_init(self)
    self:addObject(TimeBar)
end

function Scene:update(dt)
    scene_update(self, dt)
end

function Scene:draw()
    scene_draw(self)
    if wasCorrect ~= nil then
        if wasCorrect then
            love.graphics.print("Nice!", TextPos.x, TextPos.y)
        else
            love.graphics.print("Oops!", TextPos.x, TextPos.y)
        end
    end
end

function Scene:input(key, scancode, isrepeat)
    if key == "space" and not isrepeat then
        TimeBar:input()
    end
end

return Scene
