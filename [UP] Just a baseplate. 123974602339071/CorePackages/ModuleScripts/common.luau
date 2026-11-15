-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.cache.core.types.common
-- https://lua.expert

local t1 = {}
local ParentParent = script.Parent.Parent.Parent.Parent
local ParentParent2 = ParentParent.Parent
local Error = require(ParentParent2.LuauPolyfill).Error

require(ParentParent2.GraphQL)
require(ParentParent.utilities.graphql.types)

local self = setmetatable({}, {
    __index = Error
})

self.__index = self

function self.new(p1, p2, p3, p4) -- line: 62
    -- upvalues: Error (copy), self (copy)
    local v2 = Error.new(p1)

    v2.message = p1
    v2.path = p2
    v2.query = p3
    v2.variables = p4

    return (setmetatable(v2, self))
end

t1.MissingFieldError = self

return t1
