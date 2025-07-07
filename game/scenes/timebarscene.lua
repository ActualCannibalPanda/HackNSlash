local Scene = require("game.scene"):new()

local wasCorrect = nil

local function observer(correct)
    if correct then
        wasCorrect = true
    else
        wasCorrect = false
    end
end

local UI = require("game.ui")
local width, height, flags = love.window.getMode()
local ActionMenu = UI.VBox:new()
local HealthBarArea = UI.Box:new { width = width - 100, color = { 0.1, 0.1, 0.5, 1.0 } }
local BottomBar = UI.HBox:new({ x = 0, y = height - 100, width = width, height = 100, paddingLeft = 0, paddingTop = 0 })
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
    ActionMenu:addObjects(
        UI.Label:new { text = "Option A" },
        UI.Label:new { text = "Option B" })
    BottomBar:addObjects(ActionMenu, HealthBarArea)
    self:addObjects(TimeBar, BottomBar)
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
