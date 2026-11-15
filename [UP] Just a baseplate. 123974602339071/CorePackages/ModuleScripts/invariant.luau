-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.jsutils.invariant
-- https://lua.expert

local LuauPolyfill = require(script.Parent.Parent.Parent.LuauPolyfill)
local Array, Boolean, console, Error = LuauPolyfill.Array, LuauPolyfill.Boolean, LuauPolyfill.console, LuauPolyfill.Error
local self = setmetatable({}, {
    __index = Error
})

self.__index = self

function self.new(p1) -- line: 20
    -- upvalues: Error (copy), self (copy)
    local v2 = if p1 == nil then "Invariant Violation" else p1

    if typeof(v2) == "number" then
        v2 = ("%s: %s (see https://github.com/apollographql/invariant-packages)"):format("Invariant Violation", (tostring(v2)))
    end

    local v3 = Error.new(v2)

    v3.framesToPop = 1
    v3.name = "Invariant Violation"

    return (setmetatable(v3, self))
end

local function invariant(p2, p3) -- line: 43
    -- upvalues: Boolean (copy), self (copy)
    if not Boolean.toJSBoolean(p2) then
        error(self.new(p3))
    end
end

local t3 = {
    "debug",
    "log",
    "warn",
    "error",
    "silent"
}
local v4 = Array.indexOf(t3, "log")

local function wrapConsoleMethod(p4) -- line: 53
    -- upvalues: Array (copy), Boolean (copy), console (copy), t3 (copy), v4 (ref)
    return function(...) -- line: 54
        -- upvalues: p4 (copy), Array (copy), Boolean (copy), console (copy), t3 (copy), v4 (ref)
        if not (Array.indexOf(t3, p4) >= v4) then
            return
        end

        local v5

        if Boolean.toJSBoolean(console[p4]) then
            v5 = console[p4]
            v5 = v5 or console.log
        else
            v5 = console.log
        end

        return v5(...)
    end
end

local t4 = {}
local v6 = "debug"
local t5 = {}

t5.debug = function(...) -- line: 54
    -- upvalues: Array (copy), Boolean (copy), console (copy), t3 (copy), v4 (ref), v6 (copy)
    if not (Array.indexOf(t3, v6) >= v4) then
        return
    end

    local v7

    if Boolean.toJSBoolean(console[v6]) then
        v7 = console[v6]
        v7 = v7 or console.log
    else
        v7 = console.log
    end

    return v7(...)
end

local v8 = "log"

t5.log = function(...) -- line: 54
    -- upvalues: Array (copy), Boolean (copy), console (copy), t3 (copy), v4 (ref), v8 (copy)
    if not (Array.indexOf(t3, v8) >= v4) then
        return
    end

    local v9

    if Boolean.toJSBoolean(console[v8]) then
        v9 = console[v8]
        v9 = v9 or console.log
    else
        v9 = console.log
    end

    return v9(...)
end

local v10 = "warn"

t5.warn = function(...) -- line: 54
    -- upvalues: Array (copy), Boolean (copy), console (copy), t3 (copy), v4 (ref), v10 (copy)
    if not (Array.indexOf(t3, v10) >= v4) then
        return
    end

    local v11

    if Boolean.toJSBoolean(console[v10]) then
        v11 = console[v10]
        v11 = v11 or console.log
    else
        v11 = console.log
    end

    return v11(...)
end

local v12 = "error"

t5.error = function(...) -- line: 54
    -- upvalues: Array (copy), Boolean (copy), console (copy), t3 (copy), v4 (ref), v12 (copy)
    if not (Array.indexOf(t3, v12) >= v4) then
        return
    end

    local v13

    if Boolean.toJSBoolean(console[v12]) then
        v13 = console[v12]
        v13 = v13 or console.log
    else
        v13 = console.log
    end

    return v13(...)
end

t4.invariant = setmetatable(t5, {
    __call = function(_, p6, p7) -- __call | line: 72
        -- upvalues: Boolean (copy), self (copy)
        if not Boolean.toJSBoolean(p6) then
            error(self.new(p7))
        end
    end
})
t4.InvariantError = self

function t4.setVerbosity(p8) -- line: 77
    -- upvalues: Array (copy), t3 (copy), v4 (ref)
    local v14 = t3[v4]

    v4 = math.max(1, Array.indexOf(t3, p8))

    return v14
end

return t4
