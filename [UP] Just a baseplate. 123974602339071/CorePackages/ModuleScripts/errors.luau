-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.errors
-- https://lua.expert

local t1 = {}
local Parent = script.Parent
local ParentParent = Parent.Parent
local LuauPolyfill = require(ParentParent.LuauPolyfill)
local Boolean, Array, Error = LuauPolyfill.Boolean, LuauPolyfill.Array, LuauPolyfill.Error
local toJSBoolean = require(script.Parent.utilities.globals.null).toJSBoolean
local invariant = require(Parent.jsutils.invariant).invariant
local DEV = require(Parent.utilities).DEV

invariant(typeof(DEV) == "boolean", (tostring(DEV)))
require(ParentParent.GraphQL)

local isNonEmptyArray = require(Parent.utilities).isNonEmptyArray
local hasOwnProperty = require(Parent.luaUtils.hasOwnProperty)
local self = setmetatable({}, {
    __index = Error
})

self.__index = self

function t1.isApolloError(p1) -- line: 43
    -- upvalues: hasOwnProperty (copy)
    return hasOwnProperty(p1, "graphQLErrors")
end

local function generateErrorMessage(p2) -- line: 49
    -- upvalues: Boolean (copy), Array (copy), toJSBoolean (copy), isNonEmptyArray (copy)
    local v2

    if isNonEmptyArray(p2.graphQLErrors) and isNonEmptyArray(p2.graphQLErrors) or isNonEmptyArray(p2.clientErrors) then
        local v3 = Array.concat(Boolean.toJSBoolean(p2.graphQLErrors) and p2.graphQLErrors or {}, Boolean.toJSBoolean(p2.clientErrors) and p2.clientErrors or {})

        v2 = ""

        for _, v5 in pairs(v3) do
            v2 ..= ("%s\n"):format(if toJSBoolean(v5) then v5.message else "Error message not found.")
        end
    else
        v2 = ""
    end

    if p2.networkError ~= nil then
        local networkError = p2.networkError

        if typeof(networkError) ~= "string" then
            networkError = if networkError.message then networkError.message else networkError.error
        end

        v2 ..= ("%s\n"):format(networkError)
    end

    return (string.gsub(v2, "\n$", ""))
end

function self.new(p3) -- line: 104
    -- upvalues: Boolean (copy), Error (copy), self (copy), generateErrorMessage (copy)
    local graphQLErrors, clientErrors, networkError, errorMessage = p3.graphQLErrors, p3.clientErrors, p3.networkError, p3.errorMessage
    local extraInfo = p3.extraInfo
    local v6 = Error.new(errorMessage)

    v6.graphQLErrors = if not Boolean.toJSBoolean(graphQLErrors) or not graphQLErrors then {} else graphQLErrors
    v6.clientErrors = if not Boolean.toJSBoolean(clientErrors) or not clientErrors then {} else clientErrors
    v6.networkError = if not Boolean.toJSBoolean(networkError) or not networkError then nil else networkError
    v6.message = if not Boolean.toJSBoolean(errorMessage) or not errorMessage then generateErrorMessage(v6) else errorMessage
    v6.extraInfo = extraInfo

    return (setmetatable(v6, self))
end

t1.ApolloError = self

return t1
