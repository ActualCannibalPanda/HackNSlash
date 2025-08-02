local MainScene = require("game.scenes.timecirclescene")

function love.load()
    MainScene:init()
end

function love.update(dt)
    MainScene:update(dt)
end

function love.draw()
    MainScene:draw()
end

function love.keypressed(key, scancode, isrepeat)
    MainScene:input(key, scancode, isrepeat)
end
