local oldColor = nil
return {
    preserveColor = function(func, ...)
        local r, g, b, a = love.graphics.getColor()
        func(...)
        love.graphics.setColor(r, g, b, a)
    end,

    draw = function(func, ...)
        love.graphics.push()
        func(...)
        love.graphics.pop()
    end
}
