-- Path: CorePackages.Packages._Index.Dash.Dash.freeze
-- https://lua.expert

local Parent = script.Parent
local Error = require(Parent.Error)
local format = require(Parent.format)
local v1 = Error.new("ReadonlyKey", "Attempted to write to readonly key {key:?} of frozen object {objectName:?}")
local v2 = Error.new("MissingKey", "Attempted to read missing key {key:?} of frozen object {objectName:?}")

local function freeze(p1, p2, p3) -- line: 35
    -- upvalues: format (copy), v1 (copy), v2 (copy)
    local t1 = {}

    assert(type(p2) == "table", (("Attempted to call Dash.freeze with argument #2 of type %*, but it should be table "):format((type(p2)))))
    setmetatable(t1, {
        __index = function(_, p5) -- __index | line: 44
            -- upvalues: p1 (copy), p2 (copy), p3 (copy), v2 (copy)
            local v5 = p2[p5]

            if v5 == nil and p3 then
                v2:throw({
                    key = p5,
                    objectName = p1
                })
            end

            return v5
        end,
        __newindex = function(_, p7) -- __newindex | line: 55
            -- upvalues: p1 (copy), v1 (copy)
            v1:throw({
                key = p7,
                objectName = p1
            })
        end,
        __len = function() -- __len | line: 62
            -- upvalues: p2 (copy)
            return #p2
        end,
        __tostring = function() -- __tostring | line: 65
            -- upvalues: p1 (copy), format (copy)
            return format("Frozen({})", p1)
        end,
        __call = function(_, ...) -- __call | line: 68
            -- upvalues: p2 (copy)
            return p2(...)
        end
    })

    return t1
end

return freeze
