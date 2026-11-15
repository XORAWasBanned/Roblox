-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.error.locatedError
-- https://lua.expert

local Parent = script.Parent
local ParentParent = Parent.Parent
local ParentParent2 = ParentParent.Parent
local LuauPolyfill = require(ParentParent2.LuauPolyfill)
local Array, Error, instanceof = LuauPolyfill.Array, LuauPolyfill.Error, LuauPolyfill.instanceof
local inspect = require(ParentParent.jsutils.inspect).inspect

require(ParentParent.language.ast)

local GraphQLError = require(Parent.GraphQLError).GraphQLError

return {
    locatedError = function(p1, p2, p3) -- locatedError | line: 30
        -- upvalues: Array (copy), Error (copy), instanceof (copy), inspect (copy), GraphQLError (copy)
        local v1 = if instanceof(p1, Error) then p1
            elseif typeof(p1) == "table" and typeof(p1.message) == "string" and p1.stack ~= nil then Error.new(p1.message)
            elseif not (typeof(p1) == "table" and typeof(p1.error) == "string") then Error.new("Unexpected error value: " .. inspect(p1))
            else Error.new("Unexpected error value: " .. inspect(p1.error))

        if Array.isArray(v1.path) then
            return v1
        end

        return (GraphQLError.new(v1.message, v1.nodes or p2, v1.source, v1.positions, p3, v1))
    end
}
