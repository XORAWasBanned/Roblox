-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.error.GraphQLError
-- https://lua.expert

local ParentParent = script.Parent.Parent
local language, ParentParent2 = ParentParent.language, ParentParent.Parent
local LuauPolyfill = require(ParentParent2.LuauPolyfill)
local Array, Error, Object = LuauPolyfill.Array, LuauPolyfill.Error, LuauPolyfill.Object
local HttpService = game:GetService("HttpService")
local isObjectLike = require(ParentParent.jsutils.isObjectLike).isObjectLike

require(language.ast)
require(language.source)

local getLocation = require(language.location).getLocation
local printLocation = require(language.printLocation)
local printLocation2, printSourceLocation = printLocation.printLocation, printLocation.printSourceLocation
local printError, undefinedIfEmpty
local self = setmetatable({}, {
    __index = Error
})

self.__index = self

self.__tostring = function(p1) -- line: 45
    -- upvalues: printError (ref)
    return printError(p1)
end

function self.new(p2, p3, p4, p5, p6, p7, p8) -- line: 124
    -- upvalues: Array (copy), Error (copy), Object (copy), isObjectLike (copy), getLocation (copy), undefinedIfEmpty (ref), self (copy)
    local v2 = Error.new(p2)

    v2.name = "GraphQLError"
    v2.originalError = p7

    local undefinedIfEmpty2 = undefinedIfEmpty
    local v3 = if Array.isArray(p3) then p3 elseif p3 then { p3 } else nil

    v2.nodes = undefinedIfEmpty2(v3)

    local t3 = {}

    if v2.nodes then
        for _, v4 in ipairs(v2.nodes) do
            local loc = v4.loc

            if loc ~= nil then
                table.insert(t3, loc)
            end
        end
    end

    local v5 = undefinedIfEmpty(t3)

    if p4 then
        v2.source = p4
    elseif v5 ~= nil then
        v2.source = v5[1].source
    else
        v2.source = nil
    end

    if p5 then
        v2.positions = p5
    elseif v5 then
        v2.positions = Array.map(v5, function(p9) -- line: 165
            return p9.start
        end)
    else
        v2.positions = nil
    end

    if not p5 or not p4 then
        if v5 then
            v2.locations = Array.map(v5, function(p10) -- line: 174
                -- upvalues: getLocation (copy)
                return getLocation(p10.source, p10.start)
            end)
        else
            v2.locations = nil
        end
    else
        v2.locations = Array.map(p5, function(p11) -- line: 170
            -- upvalues: p4 (copy), getLocation (copy)
            return getLocation(p4, p11)
        end)
    end

    v2.path = p6 or nil

    local extensions = if p7 then p7.extensions else nil

    if p8 ~= nil or not isObjectLike(extensions) then
        v2.extensions = p8 or nil
    else
        v2.extensions = Object.assign({}, extensions)
    end

    if p7 and p7.stack then
        v2.stack = p7.stack
    end

    return (setmetatable(v2, self))
end

function self.toString(p12) -- line: 209
    -- upvalues: printError (ref)
    return printError(p12)
end

function self.toJSON(p13) -- line: 214
    -- upvalues: Array (copy), HttpService (copy)
    local t4 = {
        "message"
    }

    if p13.locations ~= nil then
        table.insert(t4, "locations")
    end

    if p13.path ~= nil then
        table.insert(t4, "path")
    end

    if p13.extensions ~= nil then
        table.insert(t4, "extensions")
    end

    return "{" .. Array.join(Array.map(t4, function(p14) -- line: 231
        -- upvalues: p13 (copy), HttpService (copy)
        return HttpService:JSONEncode(p14) .. ":" .. HttpService:JSONEncode(p13[p14])
    end), ",") .. "}"
end

function undefinedIfEmpty(p15) -- line: 239
    return if p15 ~= nil and #p15 ~= 0 then p15 else nil
end

function printError(p16) -- line: 243
    -- upvalues: printLocation2 (copy), printSourceLocation (copy)
    local message = p16.message

    if p16.nodes ~= nil then
        for i = 1, #p16.nodes do
            local v7 = p16.nodes[i]

            if v7.loc ~= nil then
                message ..= "\n\n" .. printLocation2(v7.loc)
            end
        end
    elseif p16.source ~= nil and p16.locations ~= nil then
        for i = 1, #p16.locations do
            local v6 = p16.locations[i]

            message ..= "\n\n" .. printSourceLocation(p16.source, v6)
        end
    end

    return message
end

return {
    printError = printError,
    GraphQLError = self
}
