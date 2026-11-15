-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.link.core.ApolloLink
-- https://lua.expert

local t1 = {}
local ParentParent = script.Parent.Parent.Parent
local ParentParent2 = ParentParent.Parent
local LuauPolyfill = require(ParentParent2.LuauPolyfill)
local Array, Boolean, Error = LuauPolyfill.Array, LuauPolyfill.Boolean, LuauPolyfill.Error
local invariant = require(ParentParent.jsutils.invariant)
local InvariantError, invariant2 = invariant.InvariantError, invariant.invariant
local Observable = require(ParentParent.utilities).Observable

require(script.Parent.types)

local utils = require(script.Parent.Parent.utils)
local validateOperation, createOperation, transformOperation = utils.validateOperation, utils.createOperation, utils.transformOperation
local t2 = {}

t2.__index = t2

local function passthrough(_, p2, p3) -- line: 53
    -- upvalues: Boolean (copy), Observable (copy)
    if Boolean.toJSBoolean(p3) then
        return (p3(p2))
    end

    return Observable.of()
end

local function toLink(p4) -- line: 61
    -- upvalues: t2 (copy)
    if typeof(p4) == "function" then
        return t2.new(p4)
    end

    return p4
end

local function isTerminating(p5) -- line: 69
    return debug.info(p5.request, "a") <= 2
end

local self = setmetatable({}, {
    __index = Error
})

self.__index = self

function self.new(p6, p7) -- line: 79
    -- upvalues: Error (copy), self (copy)
    local v2 = Error.new(p6)

    v2.link = p7

    return (setmetatable(v2, self))
end

function t2.empty() -- line: 86
    -- upvalues: Observable (copy), t2 (copy)
    return t2.new(function(_) -- line: 87
        -- upvalues: Observable (copy)
        return Observable.of()
    end)
end

function t2.from(p9) -- line: 92
    -- upvalues: Array (copy), t2 (copy), toLink (copy)
    if #p9 == 0 then
        return t2.empty()
    end

    return (Array.reduce(Array.map(p9, toLink, nil), function(p10, p11) -- line: 96
        return p10:concat(p11)
    end))
end

function t2.split_(p12, p13, p14) -- line: 101
    -- upvalues: Boolean (copy), Observable (copy), t2 (copy), passthrough (copy)
    local v3 = if typeof(p13) == "function" then t2.new(p13) else p13
    local v4, v5

    if not Boolean.toJSBoolean(p14) or p14 == nil then
        v4 = t2.new(passthrough)

        if typeof(v4) == "function" then
            v4 = t2.new(v4)
        end

        v5 = v4
    elseif typeof(p14) == "function" then
        v4 = t2.new(p14)
        v5 = v4
    else
        v5 = p14
        v4 = p14
    end

    if debug.info(v3.request, "a") <= 2 and debug.info(v4.request, "a") <= 2 then
        return t2.new(function(_, p16) -- line: 115
            -- upvalues: p12 (copy), v5 (ref), v3 (copy), Boolean (copy), Observable (copy)
            if p12(p16) then
                local v6 = v3:request(p16)

                if not Boolean.toJSBoolean(v6) or not v6 then
                    v6 = Observable.of()
                end

                return v6
            end

            local v7 = v5:request(p16)

            if not Boolean.toJSBoolean(v7) or not v7 then
                v7 = Observable.of()
            end

            return v7
        end)
    end

    return t2.new(function(_, p18, p19) -- line: 125
        -- upvalues: p12 (copy), v5 (ref), v3 (copy), Boolean (copy), Observable (copy)
        if p12(p18) then
            local v8 = v3:request(p18, p19)

            if not Boolean.toJSBoolean(v8) or not v8 then
                v8 = Observable.of()
            end

            return v8
        end

        local v9 = v5:request(p18, p19)

        if not Boolean.toJSBoolean(v9) or not v9 then
            v9 = Observable.of()
        end

        return v9
    end)
end

function t2.execute(p20, p21) -- line: 137
    -- upvalues: Boolean (copy), Observable (copy), validateOperation (copy), createOperation (copy), transformOperation (copy)
    local v10 = p20:request(createOperation(p21.context, transformOperation(validateOperation(p21))))

    if not Boolean.toJSBoolean(v10) or not v10 then
        v10 = Observable.of()
    end

    return v10
end

function t2.concat_(p22, p23) -- line: 142
    -- upvalues: Boolean (copy), invariant2 (copy), Observable (copy), t2 (copy), self (copy)
    local v11 = if typeof(p22) == "function" then t2.new(p22) else p22

    if debug.info(v11.request, "a") <= 2 then
        invariant2.warn(self.new("You are calling concat on a terminating link, which will have no effect", v11))

        return v11
    end

    local v12 = if typeof(p23) == "function" then t2.new(p23) else p23

    if debug.info(v12.request, "a") <= 2 then
        return t2.new(function(_, p25) -- line: 153
            -- upvalues: v11 (copy), v12 (copy), Boolean (copy), Observable (copy)
            local v13 = v11:request(p25, function(p26) -- line: 154
                -- upvalues: v12 (copy), Boolean (copy), Observable (copy)
                local v14 = v12:request(p26)

                if not Boolean.toJSBoolean(v14) or not v14 then
                    v14 = Observable.of()
                end

                return v14
            end)

            if not Boolean.toJSBoolean(v13) or not v13 then
                v13 = Observable.of()
            end

            return v13
        end)
    end

    return t2.new(function(_, p28, p29) -- line: 161
        -- upvalues: v11 (copy), v12 (copy), Boolean (copy), Observable (copy)
        local v15 = v11:request(p28, function(p30) -- line: 162
            -- upvalues: p29 (copy), v12 (copy), Boolean (copy), Observable (copy)
            local v16 = v12:request(p30, p29)

            if not Boolean.toJSBoolean(v16) or not v16 then
                v16 = Observable.of()
            end

            return v16
        end)

        if not Boolean.toJSBoolean(v15) or not v15 then
            v15 = Observable.of()
        end

        return v15
    end)
end

function t2.new(p31) -- line: 171
    -- upvalues: Boolean (copy), t2 (copy)
    local t5 = {}

    if Boolean.toJSBoolean(p31) then
        t5.request = p31
    end

    return (setmetatable(t5, t2))
end

function t2.split(p32, p33, p34, p35) -- line: 179
    -- upvalues: Boolean (copy), t2 (copy), passthrough (copy)
    return p32:concat(t2.split_(p33, p34, if not Boolean.toJSBoolean(p35) or not p35 then t2.new(passthrough) else p35))
end

function t2.concat(p36, p37) -- line: 189
    -- upvalues: t2 (copy)
    return t2.concat_(p36, p37)
end

function t2.request(_, _, _) -- line: 193
    -- upvalues: InvariantError (copy)
    error(InvariantError.new("request is not implemented"))
end

function t2.onError(_, p42, p43) -- line: 197
    -- upvalues: Boolean (copy)
    if Boolean.toJSBoolean(p43) and p43 ~= nil and Boolean.toJSBoolean(p43.error) then
        p43:error(p42)

        return false
    end

    error(p42)
end

function t2.setOnError(p44, p45) -- line: 213
    p44.onError = p45

    return p44
end

t1.ApolloLink = t2

return t1
