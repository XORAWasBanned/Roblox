-- Path: CorePackages.Packages._Index.Dash.Dash.Error
-- https://lua.expert

local Parent = script.Parent

require(Parent.Types)

local class = require(Parent.class)
local format = require(Parent.format)
local join = require(Parent.join)
local v1 = class("Error", function(p1, p2, p3) -- line: 18
    return {
        name = p1,
        message = p2 or "An error occurred",
        tags = p3 or {}
    }
end)

function v1.toString(p4) -- line: 26
    -- upvalues: format (copy)
    return format("{}: {}\n{}", p4.name, format(p4.message, p4.tags), p4.stack)
end

function v1.joinTags(p5, p6) -- line: 36
    -- upvalues: join (copy), v1 (copy)
    return v1.new(p5.name, p5.message, join(p5.tags, p6 or {}))
end

function v1.throw(p7, p8) -- line: 49
    local v2 = p7:joinTags(p8)

    v2.stack = debug.traceback()
    error(v2)
end

return v1
