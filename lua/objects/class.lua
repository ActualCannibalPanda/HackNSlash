return function(base, new)
    local c = {}
    if not new then
        if type(base) == 'function' then
            new = base
            base = nil
        else
            new = function(self, tbl)
                if tbl then
                    for k, v in pairs(tbl) do
                        self[k] = v
                    end
                end
            end
        end
    end

    if type(base) == 'table' then
        for i, v in pairs(base) do
            c[i] = v
        end
        c._base = base
    end

    c.__index = c

    local mt  = {}
    mt.__call = function(class_tbl, ...)
        local obj = {}
        setmetatable(obj, c)
        if new then
            new(obj, ...)
        else
            if base and base.new then
                base.new(obj, ...)
            end
        end
        return obj
    end
    c.new     = new
    c.is_a    = function(self, klass)
        local m = getmetatable(self)
        while m do
            if m == klass then return true end
            m = m._base
        end
        return false
    end

    setmetatable(c, mt)
    return c
end
